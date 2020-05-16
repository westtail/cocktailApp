require 'rails_helper'

RSpec.describe "ホーム画面のテスト", type: :system do
  # テスト前に実行
  before do
    # テストカクテル作成
    FactoryBot.create(:cocktail)
  end

    describe "ホーム画面のレイアウト" do    
      it "ホームタイトルがカクテルホーム" do
        visit home_path
        # have_selecter でタグを指名
        expect(page).to have_selector 'h1', text: 'カクテルホーム'
      end
      it "ページレイアウト" do
        visit cocktails_path
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_content 'テストネーム'
      end
    end
end