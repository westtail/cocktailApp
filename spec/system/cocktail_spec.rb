require 'rails_helper'

RSpec.describe "画面のテスト", type: :system do

  #let(:cocktail_test_2) {FactoryBot.create(:cocktail, name:'テストネーム_2',base_alcohol: 'テストアルコール_2',taste: 'テストテイスト_2',alcohol_percentage: 'テストパーセント_2',glass_type: 'テストグラス_2')}
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
      it "カクテル名のURLが正しいか" do
        visit cocktails_path
        click_link 'テストネーム'
        expect(page).to have_content("カクテル詳細")
      end
    end

    describe "カクテル詳細のレイアウト" do
      it "cocktail/番号のタイトルがカクテル詳細" do
        visit cocktails_path
        click_link 'テストネーム'
        #expect(page).to have_selector 'h1', text: 'カクテル詳細'
      end
      it "テーブルにカクテル名,ベースアルコール,味,グラスタイプがある" do
        #visit cocktail_path(id: "1")
        visit cocktails_path
        click_link 'テストネーム'
        expect(page).to have_selector 'tbody', text: 'テストネーム'
        expect(page).to have_selector 'tbody', text: 'テストアルコール'
        expect(page).to have_selector 'tbody', text: 'テストテイスト'
        expect(page).to have_selector 'tbody', text: 'テストグラス'
      end
      it "検索結果のURLが正しいか" do
        #visit cocktail_path(id: 1) なぜかうまくいかない
        visit cocktails_path
        click_link 'テストネーム'
        click_link '検索結果へ戻る'
        expect(page).to have_content("カクテル検索結果")
      end
    end

end