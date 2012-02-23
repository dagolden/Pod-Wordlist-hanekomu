use 5.008;
use strict;
use warnings;

package Pod::Wordlist::hanekomu;
# ABSTRACT: Add words for spell checking POD
use Test::Spelling;
set_spell_cmd 'aspell list';
use utf8;
our @person_names = qw(
  Achim
  Adam
  Conway
  Cushing
  Damian
  Doherty
  Doran
  Eilam
  Ekker
  Florian
  Gruenauer
  Heinz
  Helmberger
  Hofstetter
  Lapworth
  Marcel
  Mark
  Metheringham
  Miyagawa
  Ran
  Ricardo
  Signes
  Takesako
  Tatsuhiko
);
our @tech_names = qw(
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
  mkdn
  modulino
  MVC
  OO
  OOP
  PARC
  PHP
  Plack
  PSGI
  README
  ShipIt
  SMTP
  Spiffy
  SQL
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
  pipe's
  placeholders
  pluggable
  plugin's
  plugins
  pointcut
  pointcuts
  prepends
  preprocessed
  probe's
  redirections
  redispatch
  ref
  reusability
  runtime
  san
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
  subdirectories
  subdirectory
  subobjects
  terminal's
  timestamp
  tokenizes
  toolchain
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

=head1 DESCRIPTION

This module, when loaded, adds stopwords for POD spell checking, that is,
words that should be ignored by the spell check.
