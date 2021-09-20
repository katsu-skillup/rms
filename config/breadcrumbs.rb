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
  if params[:member_id] == nil 
    member = Member.find(params[:id])
    link "#{member.member_name}さんの詳細ページ", member_path(member)
    parent :members_index
  else
    member = Member.find(params[:member_id])
    link "#{member.member_name}さんの詳細ページ", member_path(member)
    parent :members_index
  end
end

crumb :member_edit do |member|
  member = Member.find(params[:id])
  link "#{member.member_name}さんの登録情報編集", member_path(member)
  parent :member_show, member
end

crumb :member_meeting_new do |member|
  member = Member.find(params[:member_id])
  link "#{member.member_name}さんの新規面談記録", new_member_meeting_path(member)
  parent :member_show, member
end

crumb :member_meeting_edit do |member, meeting|
  member = Member.find(params[:member_id])
  meeting = Meeting.find(params[:id])
  link "#{member.member_name}さんの面談記録（#{meeting.meeting_date}）"
  parent :member_show, member
end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).