# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '99日目 テストコードの作成'
    fill_in '内容', with: '今日はテストコードを書きました。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '99日目 テストコードの作成'
    assert_text '今日はテストコードを書きました。'
  end

  test 'updating a report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '100日目 テストコードの作成'
    fill_in '内容', with: '今日はテストコードを完成させました！'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '100日目 テストコードの作成'
    assert_text '今日はテストコードを完成させました！'
  end

  test 'destroying a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
