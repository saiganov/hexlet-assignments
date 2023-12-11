# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'show Bulletins index' do
    bulletin1 = bulletins('bulletin_1')
    assert bulletin1.id == 1
    assert bulletin1.title == 'Title 1'
    assert bulletin1.body == 'Body 1'
    assert bulletin1.published == true

    get root_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
    assert_select 'h2', 'Title 1'
    assert_select 'p', 'Body 1'
  end

  test 'show Bulletin 1' do
    bulletin1 = bulletins('bulletin_1')

    get bulletin_path(bulletin1)
    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select 'p', 'Body 1'
  end
end
