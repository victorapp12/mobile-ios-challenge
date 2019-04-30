target 'Amaro' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
	
  platform :ios, '9.0'
  use_frameworks!

  # Pods for Amaro

  target 'AmaroTests' do
    inherit! :search_paths
    # Pods for testing

  end

end

target 'Amaro WatchKit App' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  platform :watchos, '3.0'

end

target 'Amaro WatchKit Extension' do
   platform :watchos, '3.0'
   pod 'Alamofire'
   pod 'AlamofireObjectMapper', '~> 5.0'
   pod 'Kingfisher', '~> 5.0'
   pod 'WatchActiviyIndicator'
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'

        end

    end

end
