require 'rails_helper'

RSpec.describe "画面のテスト", type: :system do
  # テスト前に実行
  before do
    # テストカクテル作成
    FactoryBot.create(:cocktail)
  end

    describe "ホーム画面のレイアウト" do    
      it "タイトルがカクテルホーム" do
        visit home_path
        expect(page).to have_selector 'h1', text: 'カクテルホーム'
      end
      it "テーブルにカクテル名,ベースアルコール,味,グラスタイプがある" do
        visit home_path
        expect(page).to have_selector 'table', text: 'カクテル名'
        expect(page).to have_selector 'table', text: 'ベースアルコール'
        expect(page).to have_selector 'table', text: '味'
        expect(page).to have_selector 'table', text: 'グラスタイプ'
      end
      it "テーブル画面にテストネーム、テストアルコール、テストテイスト、テストグラスがある" do
        visit home_path
        expect(page).to have_selector 'tbody', text: 'テストネーム'
        expect(page).to have_selector 'tbody', text: 'テストアルコール'
        expect(page).to have_selector 'tbody', text: 'テストテイスト'
        expect(page).to have_selector 'tbody', text: 'テストグラス'
      end
    end

    describe "検索結果画面のレイアウト" do
      it "cocktailのタイトルがカクテル" do
        visit cocktails_path
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
      end
      it "テーブルにカクテル名,ベースアルコール,味,グラスタイプがある" do
        visit cocktails_path
        expect(page).to have_selector 'table', text: 'カクテル名'
        expect(page).to have_selector 'table', text: 'ベースアルコール'
        expect(page).to have_selector 'table', text: '味'
        expect(page).to have_selector 'table', text: 'グラスタイプ'
      end
    end

end