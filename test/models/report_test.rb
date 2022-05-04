# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create(email: 'me@example.com', password: 'password')
    she = User.create(email: 'she@example.com', password: 'password')
    report = Report.create(user_id: me.id, title: 'タイトル', content: '内容')
    her_report = Report.create(user_id: she.id, title: 'タイトル', content: '内容')

    assert report.editable?(me)
    assert_not report.editable?(she)
    assert her_report.editable?(she)
    assert_not her_report.editable?(me)
  end

  test '#created_on' do
    me = User.create(email: 'me@example.com', password: 'password')
    report = Report.create(user_id: me.id, title: 'タイトル', content: '内容')

    assert_not_equal Date, report.created_at.class
    assert_equal Date, report.created_on.class
    assert_equal report.title, 'タイトル'
    assert_equal report.content, '内容'
  end
end
