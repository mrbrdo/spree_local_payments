module SpreeLocalPayments
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_local_payments'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.after_initialize do
      config.spree.payment_methods += [
          Spree::PaymentMethod::PhysicalPayment,
          Spree::PaymentMethod::BankTransfer
        ]
    end
  end
end
