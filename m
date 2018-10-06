From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:04 +0200
Subject: [Buildroot] [PATCH 00/20] Plack
Message-ID: <20181006165524.23778-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add perl-plack and its dependencies

Francois Perrad (20):
  perl-class-inspector: new package
  perl-devel-stacktrace: new package
  perl-devel-stacktrace-ashtml: new package
  perl-filesys-notify-simple: new package
  perl-hash-multivalue: new package
  perl-http-multiparser: new package
  perl-posix-strftime-compiler: new package
  perl-stream-buffered: new package
  perl-www-form-encoded: new package
  host-perl-extutils-config: new package
  host-perl-extutils-helpers: new package
  host-perl-extutils-installpaths: new package
  host-perl-module-build-tiny: new package
  perl-apache-logformat-compiler: new package
  perl-cookie-baker: new package
  perl-http-entity-parser: new package
  perl-http-headers-fast: new package
  host-perl-file-sharedir-install: new package
  perl-file-sharedir: new package
  perl-plack: new package

 package/Config.in                             | 15 ++++++++++++++
 .../perl-apache-logformat-compiler/Config.in  |  7 +++++++
 .../perl-apache-logformat-compiler.hash       |  6 ++++++
 .../perl-apache-logformat-compiler.mk         | 14 +++++++++++++
 package/perl-class-inspector/Config.in        |  6 ++++++
 .../perl-class-inspector.hash                 |  6 ++++++
 .../perl-class-inspector.mk                   | 13 ++++++++++++
 package/perl-cookie-baker/Config.in           |  7 +++++++
 .../perl-cookie-baker/perl-cookie-baker.hash  |  6 ++++++
 .../perl-cookie-baker/perl-cookie-baker.mk    | 14 +++++++++++++
 .../perl-devel-stacktrace-ashtml/Config.in    |  7 +++++++
 .../perl-devel-stacktrace-ashtml.hash         |  6 ++++++
 .../perl-devel-stacktrace-ashtml.mk           | 14 +++++++++++++
 package/perl-devel-stacktrace/Config.in       |  6 ++++++
 .../perl-devel-stacktrace.hash                |  6 ++++++
 .../perl-devel-stacktrace.mk                  | 13 ++++++++++++
 .../perl-extutils-config.hash                 |  6 ++++++
 .../perl-extutils-config.mk                   | 13 ++++++++++++
 .../perl-extutils-helpers.hash                |  6 ++++++
 .../perl-extutils-helpers.mk                  | 13 ++++++++++++
 .../perl-extutils-installpaths.hash           |  6 ++++++
 .../perl-extutils-installpaths.mk             | 14 +++++++++++++
 .../perl-file-sharedir-install.hash           |  6 ++++++
 .../perl-file-sharedir-install.mk             | 13 ++++++++++++
 package/perl-file-sharedir/Config.in          |  7 +++++++
 .../perl-file-sharedir.hash                   |  6 ++++++
 .../perl-file-sharedir/perl-file-sharedir.mk  | 14 +++++++++++++
 package/perl-filesys-notify-simple/Config.in  |  6 ++++++
 .../perl-filesys-notify-simple.hash           |  6 ++++++
 .../perl-filesys-notify-simple.mk             | 13 ++++++++++++
 package/perl-hash-multivalue/Config.in        |  6 ++++++
 .../perl-hash-multivalue.hash                 |  6 ++++++
 .../perl-hash-multivalue.mk                   | 13 ++++++++++++
 package/perl-http-entity-parser/Config.in     | 11 ++++++++++
 .../perl-http-entity-parser.hash              |  6 ++++++
 .../perl-http-entity-parser.mk                | 14 +++++++++++++
 package/perl-http-headers-fast/Config.in      |  7 +++++++
 .../perl-http-headers-fast.hash               |  6 ++++++
 .../perl-http-headers-fast.mk                 | 14 +++++++++++++
 package/perl-http-multipartparser/Config.in   |  6 ++++++
 .../perl-http-multipartparser.hash            |  6 ++++++
 .../perl-http-multipartparser.mk              | 13 ++++++++++++
 .../perl-module-build-tiny.hash               |  6 ++++++
 .../perl-module-build-tiny.mk                 | 14 +++++++++++++
 package/perl-plack/Config.in                  | 20 +++++++++++++++++++
 package/perl-plack/perl-plack.hash            |  6 ++++++
 package/perl-plack/perl-plack.mk              | 14 +++++++++++++
 .../perl-posix-strftime-compiler/Config.in    |  6 ++++++
 .../perl-posix-strftime-compiler.hash         |  6 ++++++
 .../perl-posix-strftime-compiler.mk           | 14 +++++++++++++
 package/perl-stream-buffered/Config.in        |  6 ++++++
 .../perl-stream-buffered.hash                 |  6 ++++++
 .../perl-stream-buffered.mk                   | 13 ++++++++++++
 package/perl-www-form-urlencoded/Config.in    |  6 ++++++
 .../perl-www-form-urlencoded.hash             |  6 ++++++
 .../perl-www-form-urlencoded.mk               | 14 +++++++++++++
 utils/scancpan                                |  4 ++++
 57 files changed, 524 insertions(+)
 create mode 100644 package/perl-apache-logformat-compiler/Config.in
 create mode 100644 package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.hash
 create mode 100644 package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
 create mode 100644 package/perl-class-inspector/Config.in
 create mode 100644 package/perl-class-inspector/perl-class-inspector.hash
 create mode 100644 package/perl-class-inspector/perl-class-inspector.mk
 create mode 100644 package/perl-cookie-baker/Config.in
 create mode 100644 package/perl-cookie-baker/perl-cookie-baker.hash
 create mode 100644 package/perl-cookie-baker/perl-cookie-baker.mk
 create mode 100644 package/perl-devel-stacktrace-ashtml/Config.in
 create mode 100644 package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.hash
 create mode 100644 package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
 create mode 100644 package/perl-devel-stacktrace/Config.in
 create mode 100644 package/perl-devel-stacktrace/perl-devel-stacktrace.hash
 create mode 100644 package/perl-devel-stacktrace/perl-devel-stacktrace.mk
 create mode 100644 package/perl-extutils-config/perl-extutils-config.hash
 create mode 100644 package/perl-extutils-config/perl-extutils-config.mk
 create mode 100644 package/perl-extutils-helpers/perl-extutils-helpers.hash
 create mode 100644 package/perl-extutils-helpers/perl-extutils-helpers.mk
 create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.hash
 create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.mk
 create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.hash
 create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.mk
 create mode 100644 package/perl-file-sharedir/Config.in
 create mode 100644 package/perl-file-sharedir/perl-file-sharedir.hash
 create mode 100644 package/perl-file-sharedir/perl-file-sharedir.mk
 create mode 100644 package/perl-filesys-notify-simple/Config.in
 create mode 100644 package/perl-filesys-notify-simple/perl-filesys-notify-simple.hash
 create mode 100644 package/perl-filesys-notify-simple/perl-filesys-notify-simple.mk
 create mode 100644 package/perl-hash-multivalue/Config.in
 create mode 100644 package/perl-hash-multivalue/perl-hash-multivalue.hash
 create mode 100644 package/perl-hash-multivalue/perl-hash-multivalue.mk
 create mode 100644 package/perl-http-entity-parser/Config.in
 create mode 100644 package/perl-http-entity-parser/perl-http-entity-parser.hash
 create mode 100644 package/perl-http-entity-parser/perl-http-entity-parser.mk
 create mode 100644 package/perl-http-headers-fast/Config.in
 create mode 100644 package/perl-http-headers-fast/perl-http-headers-fast.hash
 create mode 100644 package/perl-http-headers-fast/perl-http-headers-fast.mk
 create mode 100644 package/perl-http-multipartparser/Config.in
 create mode 100644 package/perl-http-multipartparser/perl-http-multipartparser.hash
 create mode 100644 package/perl-http-multipartparser/perl-http-multipartparser.mk
 create mode 100644 package/perl-module-build-tiny/perl-module-build-tiny.hash
 create mode 100644 package/perl-module-build-tiny/perl-module-build-tiny.mk
 create mode 100644 package/perl-plack/Config.in
 create mode 100644 package/perl-plack/perl-plack.hash
 create mode 100644 package/perl-plack/perl-plack.mk
 create mode 100644 package/perl-posix-strftime-compiler/Config.in
 create mode 100644 package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.hash
 create mode 100644 package/perl-posix-strftime-compiler/perl-posix-strftime-compiler.mk
 create mode 100644 package/perl-stream-buffered/Config.in
 create mode 100644 package/perl-stream-buffered/perl-stream-buffered.hash
 create mode 100644 package/perl-stream-buffered/perl-stream-buffered.mk
 create mode 100644 package/perl-www-form-urlencoded/Config.in
 create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
 create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk

-- 
2.17.1
