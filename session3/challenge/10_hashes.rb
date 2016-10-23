# Lets represent a file system with hashes
# You will be passed a hash table, whose keys represent folders.
# Their values will either be arrays of filenames in that directory
# or they will be hashes with the same rules (a treelike structure)
#
# Your job is to take the hashes, and return an array containing
# all of the complete file paths where each directory is separated by a '/'
#
# HINT:
#   [1,2,3].is_a? Array # => true
#   [1,2,3].is_a? Hash  # => false
#   {1=>1}.is_a?  Array # => false
#   {1=>1}.is_a?  Hash  # => true
#
# HINT2:
#   Don't feel constrained, you may create any methods, classes, etc, that
#   you need to you may address the problem in any way you need to (I
#   haven't tried it yet, but will probably use a recursive approach)
#
# EXAMPLES:
#
# pathify 'usr' => {'bin' => ['ruby'] }                                                        # => ['/usr/bin/ruby']
# pathify 'usr' => {'bin' => ['ruby', 'perl'] }                                                # => ['/usr/bin/ruby', '/usr/bin/perl']
# pathify 'usr' => {'bin' => ['ruby'], 'include' => ['zlib.h'] }                               # => ['/usr/bin/ruby', '/usr/include/zlib.h']
# pathify 'usr' => {'bin' => ['ruby']}, 'opt' => {'local' => {'bin' => ['sqlite3', 'rsync']} } # => ['/usr/bin/ruby', 'opt/local/bin/sqlite3', 'opt/local/bin/rsync']
# pathify                                                                                      # => []
#
#
# create it from scratch :)

# path = 'usr' => ['bin', 'batch'], 'plt' => 'bin'
# ['/usr/bin', '/plt/bin']

def pathify(paths, prefix = "")

  result = []

  if paths.is_a?(Hash)
    paths.each do |key, value|
      prefix2 = "#{prefix}/#{key}"
      #puts prefix
      result = result + pathify(value, prefix2)
    end
  elsif paths.is_a?(Array)
    result = append_to_prefix(prefix, paths)
  end
  return result

end

def append_to_prefix(prefix, filenames)
  final_output = []
  filenames.each do |filename|
    final_output << "#{prefix}/#{filename}"
  end
  return final_output
end

#puts pathify 'usr' => ['bin', 'batch'], 'plt' => 'bin' # ["/usr/bin", "/usr/batch", "plt/bin"]

#puts append_to_prefix("/usr/bin", ["jenna", "calum"])

#puts pathify 'usr' => { 'bin' => ["Jenna", "Calum"]}, 'another' => ['test', 'batch']
puts pathify 'bin' => ['sh']
