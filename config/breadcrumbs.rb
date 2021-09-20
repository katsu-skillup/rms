crumb :root do
  link "Home", root_path
end

crumb :members_index do
  link "Member一覧", members_path
  parent :root
end

crumb :members_new do
  link "Member登録", new_member_path
  parent :members_index
end

crumb :member_show do |member|
  link "#{member.name}さんの詳細", member_path(member)
  parent :members_index
end

crumb :member_edit do |member|
  link "Member編集"
  parent :member_show, member
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).