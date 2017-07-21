# This is an example Podfile, which transfers the contents of the Helpshift pod to a generic folder "Helpshift-SDK".
# Replace the version number appearing in the file with the version you want to use.

require 'fileutils'

target 'CocoaPodsTest'
pod 'Helpshift', ‘6.0.0’

post_install do |installer|
    FileUtils::mkdir_p 'Pods/Helpshift/Helpshift-SDK'
    FileUtils.cp_r 'Pods/Helpshift/helpshift-sdk-ios-v6.0.0/.', 'Pods/Helpshift/Helpshift-SDK/'
    readme_file = File.new("Pods/Helpshift/Helpshift-SDK/Readme.txt", "w")
    readme_file.puts("6.0.0")
    readme_file.close
    FileUtils.rm_rf('Pods/Helpshift/helpshift-sdk-ios-v6.0.0')
end
