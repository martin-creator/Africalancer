Trestle.resource(:transactions) do
  remove_action :destroy
  menu do
    item :transactions, icon: "fa fa-money", label: "Withdraw"
  end

  collection do
    Transaction.withdraw
  end

  table do
    column :buyer
    column :amount
    column :status
    column :transaction_type
    column :created_at, align: :center

    actions do |toolbar, instance, admin|
    end
  end

  
end
