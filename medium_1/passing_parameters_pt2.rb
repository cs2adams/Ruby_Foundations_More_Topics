def some_method(birds)
  yield(birds) if block_given?
end

birds = %w(raven finch hawk eagle)
some_method(birds) { |_, _, *raptors| p raptors }