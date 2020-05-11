require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do
  # テスト前に実行
  before do
    # テストカクテル作成
    FactoryBot.create(:cocktail)
  end

    describe "home layout" do    
      it "ページレイアウト" do
        visit cocktails_path
        expect(page).to have_content 'テストネーム'
      end
    end
end