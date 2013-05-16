tag = Tag.create(:tag_name => 'First Tag')

post = Post.create(:title => 'Test', :text => "TEst test asdf aslkdfjn ;ls")
post.tags << tag


tag2 = Tag.create(:tag_name => '2nd Tag')
tag3 = Tag.create(:tag_name => '3nd Tag')


post = Post.create(:title => 'Test2', :text => "TEst test asdf aslkdfjn ;ls", :tags => [tag2,tag3])

