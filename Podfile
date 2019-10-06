platform :osx, '10.14'
workspace 'CommentXcode'
project 'CommentXcode/CommentXcode.xcodeproj'

abstract_target 'Common' do

  pod 'DGLog', :git => "https://github.com/dukim-go/DGLog.git", :commit => "d3cf196cbf3d095821ce6fa8af3863a9f1ad9929"

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
