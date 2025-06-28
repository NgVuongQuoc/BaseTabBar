# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BaseTabBarCustom' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'AMTabView'
  # Pods for BaseTabBarCustom

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
 target.build_configurations.each do |config|
  if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 15.0
  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
  end
  config.build_settings["ONLY_ACTIVE_ARCH"] = "NO"
  config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
  config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
  config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
  config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'No'
 end
 end
end