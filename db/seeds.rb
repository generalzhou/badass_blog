tag = Tag.create(:tag_name => 'First Tag')

post = Post.create(:title => 'Test', :text => "TEst test asdf aslkdfjn ;ls")
post.tags << tag
