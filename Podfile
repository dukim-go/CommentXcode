platform :osx, '10.14'
workspace 'CommentXcode'
project 'CommentXcode/CommentXcode.xcodeproj'

abstract_target 'Common' do

  pod 'DGLog', :git => "https://github.com/dukim-go/DGLog.git", :commit => "2032b98bc6541471b4ba3c809b76546de6ced6c3"

  target 'CommentXcode' do
    use_frameworks!
  
    target 'CommentXcodeTests' do
      inherit! :search_paths
    end
  
    target 'CommentXcodeUITests' do
      inherit! :search_paths
    end
  
  end
  
  target 'CommentXcodeEditorExtension' do
    use_frameworks!
  
  end
  
end
