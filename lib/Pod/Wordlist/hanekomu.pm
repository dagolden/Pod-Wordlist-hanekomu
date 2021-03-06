use 5.008;
use strict;
use warnings;

package Pod::Wordlist::hanekomu;
# ABSTRACT: Add words for spell checking POD (DEPRECATED)
use Test::Spelling;
set_spell_cmd 'aspell list';
use utf8;
our @person_names = qw(
  Achim
  Adam
  Cushing
  Damian Conway
  Doherty
  Doran
  Eilam
  Ekker
  Florian
  Marcel Gruenauer
  Heinz
  Helmberger
  Hofstetter
  Lapworth
  Mark
  Metheringham
  Ran
  Ricardo Signes rjbs
  Takesako
  Tatsuhiko Miyagawa
  mst
);
our @tech_names = qw(
  AES
  AnyEvent
  AOP
  API
  AspectJ
  Babelfish
  CamelCase
  Coro
  CPAN
  CPANPLUS
  DateTime
  DBI
  Django
  DSL
  EINTR
  EPP
  Firefox
  FirePHP
  FIXME
  GraphViz
  GUID
  GUIDs
  HTTP
  HTTPS
  IETF
  IP
  IPv4
  IPv6
  IRC
  ISP
  ISP's
  JSON
  MakeMaker
  Markdown
  Middleware
  MongoDB
  mkdn
  modulino
  MVC
  OO
  OOP
  PARC
  PHP
  Plack
  PSGI
  RDBMS
  README
  ShipIt
  SMTP
  Spiffy
  SQL
  SQLite
  SSL
  STDERR
  STDIN
  STDOUT
  svk
  TIMTOWTDI
  Unicode
  URI
  URI's
  URIs
  UTC
  UTF
  UUID
  UUIDs
  W3CDTF
  wiki
  XS
  YAML
  YAML's
);
our @stopwords = qw(
  adaptee
  adaptees
  administrativa
  afterwards
  aggregator
  aggregators
  analyses
  array's
  backend
  behaviour
  benchmarked
  blog
  blogs
  breakpoint
  breakpoints
  bugtracker
  bundle's
  callback
  callbacks
  callee
  chomp
  chomps
  chunked
  configurator
  configurators
  crosscutting
  debugger's
  denormalized
  deserialized
  distname
  dotfile
  dotfiles
  filename
  filenames
  formatter
  github
  hash's
  homepage
  hostname
  indices
  init
  iteratively
  japanese
  Joseki
  kwalitee
  locator
  lookup
  lookups
  marshalling
  metadata
  middleware
  mixin
  monkeypatch
  monkeypatches
  monkeypatching
  multi
  multi-value
  multi-valued
  munge
  munger
  munging
  namespace
  namespaces
  nestable
  ok
  op
  parameterizable
  pipe's
  placeholders
  pluggable
  plugin's
  plugins
  pointcut
  pointcuts
  pre
  precompute
  precomputes
  prepends
  preprocessed
  prereq
  prereqs
  probe's
  redirections
  redispatch
  ref
  reusability
  runtime
  san
  searchable
  seekable
  segment's
  shipit
  sigils
  startup
  stopword
  stopwords
  storable
  storages
  stringification
  stringifications
  stringifies
  stringify
  subclass
  subclasses
  subdirectories
  subdirectory
  subobjects
  symlinked
  terminal's
  timestamp
  tokenizes
  toolchain
  tuple
  unblessed
  unshifts
  username
  uuid
  value's
  variable's
  vim
  wellformedness
  whitelist
  whitelists
  workflow
  workflows
  wormhole
  yml
);

# dedup
my %words = map { $_ => 1 } @person_names, @tech_names, @stopwords;
add_stopwords(sort keys %words);
$ENV{LANG} = 'C';
1;

=head1 SYNOPSIS

    use Test::Spelling;
    use Pod::Wordlist::hanekomu;
    all_pod_files_spelling_ok('lib');

=head1 DEPRECATION

All non-name words from this list have been merged into the master L<Pod::Wordlist>
module.  Names are often grabbed directly from author and contributor metadata
by relevant tools and are unlikely to be as necessary.

Therefore, this list is no longer maintained.

=head1 DESCRIPTION

When loaded, this module automatically adds Test::Spelling stopwords for POD
spell checking, that is, words that should be ignored by the spell check.

The stopword list includes some CPAN author names, technical terms (e.g.  JSON,
URI) and other commonly-used words not included in the default word list (e.g.
mixin, munging).
