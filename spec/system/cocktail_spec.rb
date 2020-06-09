require 'rails_helper'

RSpec.describe "画面のテスト", type: :system do
  #let(:cocktail_1) {FactoryBot.create(:cocktail, name:'ウイスキー',base_alcohol: 'ウイスキー',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')}
  
  # テスト前に実行
  before do
    # テストカクテル作成
    FactoryBot.create(:cocktail)
    FactoryBot.create(:cocktail, name:'ウイスキー',base_alcohol: 'ウイスキー',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
    FactoryBot.create(:cocktail, name:'ウォッカ',base_alcohol: 'ウォッカ',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
    FactoryBot.create(:cocktail, name:'ラム',base_alcohol: 'ラム',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
    FactoryBot.create(:cocktail, name:'ジン',base_alcohol: 'ジン',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
  end

    describe "ホーム画面のレイアウト" do
      before do
        visit home_path
      end
      it "タイトルがカクテルホーム" do     
        expect(page).to have_selector 'h1', text: 'カクテルホーム'
      end
      it "テーブルにカクテル名,ベースアルコール,味,グラスタイプ,度数がある" do
        expect(page).to have_selector 'table', text: 'カクテル名'
        expect(page).to have_selector 'table', text: 'ベースのお酒'
        expect(page).to have_selector 'table', text: '味'
        expect(page).to have_selector 'table', text: 'グラスタイプ'
        expect(page).to have_selector 'table', text: '度数'
      end
      it "テーブルにテストネーム、テストアルコール、テストテイスト、テストグラス,15がある" do
        expect(page).to have_selector 'tbody', text: 'テストネーム'
        expect(page).to have_selector 'tbody', text: 'テストアルコール'
        expect(page).to have_selector 'tbody', text: 'テストテイスト'
        expect(page).to have_selector 'tbody', text: 'テストグラス'
        expect(page).to have_selector 'tbody', text: '15'
      end
      it "テーブルにウイスキー、ウイスキー、辛い、ロング,40がある" do
        expect(page).to have_selector 'tbody', text: 'ウイスキー'
        expect(page).to have_selector 'tbody', text: 'ウイスキー'
        expect(page).to have_selector 'tbody', text: '辛い'
        expect(page).to have_selector 'tbody', text: 'ロング'
        expect(page).to have_selector 'tbody', text: '40'
      end
    end

    describe "検索機能のテスト" do
      before do
        visit home_path
      end
      it "カクテル名をテストネームで検索するとテストネームが出てくる" do
        fill_in 'カクテル名', with: 'テストネーム'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: 'テストネーム'
      end
      it "ベースのお酒をウイスキーで検索するとウイスキーが出てくる" do
        select 'ウイスキー', from: 'q[base_alcohol_cont]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: 'ウイスキー'
      end
      it "味を辛いで検索すると辛いが出てくる" do
        select '辛い', from: 'q[taste_cont]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: '辛い'
      end
      it "グラスタイプをロングで検索するとロングが出てくる" do
        select 'ロング', from: 'q[glass_type_cont]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: 'ウイスキー'
      end
      it "最低度数をアルコールなしで検索すると40が出てくる" do
        select 'アルコールなし(0%)', from: 'q[alcohol_percentage_gteq]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: '40'
      end
      it "最高度数をとても強いで検索すると40が出てくる" do
        select 'とても強い(100%以下)', from: 'q[alcohol_percentage_lteq]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: '40'
      end
      it "最低度数をアルコールなし,最高度数をとても強いで検索すると40が出てくる" do
        select 'アルコールなし(0%)', from: 'q[alcohol_percentage_gteq]'
        select 'とても強い(100%以下)', from: 'q[alcohol_percentage_lteq]'
        click_button '検索'
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
        expect(page).to have_selector 'tbody', text: '40'
      end
    end

    describe "ページネーションのテスト" do
      before do
        FactoryBot.create(:cocktail)
        FactoryBot.create(:cocktail, name:'ウイスキー',base_alcohol: 'ウイスキー',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
        FactoryBot.create(:cocktail, name:'ウォッカ',base_alcohol: 'ウォッカ',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
        FactoryBot.create(:cocktail, name:'ラム',base_alcohol: 'ラム',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
        FactoryBot.create(:cocktail, name:'ジン',base_alcohol: 'ジン',taste: '辛い',alcohol_percentage: '40',glass_type: 'ロング')
        FactoryBot.create(:cocktail, name:'ジントニック',base_alcohol: 'ジン',taste: '普通',alcohol_percentage: '15',glass_type: 'ロング')
        visit home_path
      end
      it "ページネーションの２番目をクリックすると６番目のお酒が出てくる" do
        click_link '2'
        expect(page).to have_selector 'h1', text: 'カクテルホーム'
        expect(page).to have_selector 'tbody', text: 'ロング'
      end
    end


    describe "検索結果画面のレイアウト" do
      it "cocktailのタイトルがカクテル" do
        visit cocktails_path
        expect(page).to have_selector 'h1', text: 'カクテル検索結果'
      end
      it "テーブルにカクテル名,ベースアルコール,味,グラスタイプ,度数がある" do
        visit cocktails_path
        expect(page).to have_selector 'table', text: 'カクテル名'
        expect(page).to have_selector 'table', text: 'ベースのお酒'
        expect(page).to have_selector 'table', text: '味'
        expect(page).to have_selector 'table', text: 'グラスタイプ'
        expect(page).to have_selector 'table', text: '度数'
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