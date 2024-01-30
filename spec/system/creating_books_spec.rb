require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays new books (unit)' do
    visit '/books/new'
    fill_in 'Title', with: 'Book 1'
    click_on 'Create Book'
    expect(page).to have_content('Book 1')
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.title).to eq('Book 1')
  end

  it 'saves and displays author (unit)' do
    visit '/books/new'
    fill_in 'Title', with: 'Book 1'
    fill_in 'Author', with: 'Ralph Lewis'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.author).to eq('Ralph Lewis')
  end

  it 'saves and displays price (unit)' do
    visit '/books/new'
    fill_in 'Title', with: 'Book 1'
    fill_in 'Price', with: '1.50'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.price).to eq(1.5)
  end

  it 'saves and displays date (unit)' do
    visit '/books/new'
    fill_in 'Title', with: 'Book 1'
    fill_in 'Date', with: '1/29/2024'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.date_published).to eq('1/29/2024')
  end

  it 'saves and displays all book information (integration)' do
    visit '/books/new'
    fill_in 'Title', with: 'Book 1'
    fill_in 'Author', with: 'Ralph Lewis'
    fill_in 'Price', with: '1.50'
    fill_in 'Date', with: '1/29/2024'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    book = Book.order("id").last
    expect(book.author).to eq('Ralph Lewis')
    expect(book.date_published).to eq('1/29/2024')
  end
end
