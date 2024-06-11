require 'rails_helper'

RSpec.describe My::ReservationsController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room, user: user) }
  let!(:reservation) { create(:reservation, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new reservation" do
        expect {
          post :create, params: { reservation: attributes_for(:reservation, room_id: room.id) }
        }.to change(Reservation, :count).by(1)
      end

      it "redirects to my_reservations_path" do
        post :create, params: { reservation: attributes_for(:reservation, room_id: room.id) }
        expect(response).to redirect_to(my_reservations_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "cancels the reservation" do
      expect {
        delete :destroy, params: { id: reservation.id }
      }.to change { reservation.reload.status }
      .from(Reservation::STATUS[:pending])
      .to(Reservation::STATUS[:canceled])
    end
  end
end
