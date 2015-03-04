require 'ffi'

module Vigilem
module Win32API
  # Stat(us) of Win32API and the handler 
  # gem associated with it
  class Stat < Core::Stat
    
    extend ::FFI::Library
    
    # 
    # @param  [String] gem_name, defaults to 'vigilem-win32_api'
    # @param  [Proc] api_check, defaults to 
    #         `begin
    #           not Stat.ffi_lib('Kernel32.dll').empty?
    #         rescue 
    #           false
    #         end`
    def initialize(gem_name='vigilem-win32_api', opts={}, &api_check)
      system_name = 'Win32API'
      if block_given?
        super(system_name, gem_name, opts, &api_check)
      else
        super(system_name, gem_name, opts) do 
          begin
            not Stat.ffi_lib('Kernel32.dll').empty?
          rescue LoadError
            false
          end
        end
      end
    end
    
    # 
    # @return [Stat]
    def self.default
      @default ||= new
    end
  end
  
end
end
Vigilem::Win32API::Stat.default