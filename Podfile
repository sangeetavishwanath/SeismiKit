platform :ios, '9.0'

def shared_pods
    pod 'AFNetworking', '~> 3.1', :inhibit_warnings => true
end

target 'SeismiKit' do
    shared_pods
    pod 'Mantle', '~> 2.0', :inhibit_warnings => true
end

target 'SeismiKitTests' do
    shared_pods
    pod 'Specta', '1.0.2', :inhibit_warnings => true
    pod 'Expecta', '1.0.0', :inhibit_warnings => true
    pod 'OCMockito', '2.0.1', :inhibit_warnings => true
end