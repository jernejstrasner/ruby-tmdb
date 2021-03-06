require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper.rb'))

class FetchTrailersWithExpansionEnabled < Test::Unit::TestCase
  def setup
    register_api_url_stubs
  end

  test "find with expansion enabled should return trailers" do
    movie = TmdbMovie.find(:id => 187)
    assert_not_nil movie.videos
    assert_equal movie.videos[0].key, 'SUXWAEX2jlg'
  end

  test "find without expansion enabled should not return trailers" do
    movie = TmdbMovie.find(:id => 187, :expand_results => false)
    assert_nil movie.videos
  end
end
