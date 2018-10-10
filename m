From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 10:18:23 +0200
Subject: [Buildroot] [V2 0/8] Moo & friends
Message-ID: <20181010081831.25014-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add perl-moo and their friends and/or dependencies

V1 -> V2:
  - remove runtime dependencies

Francois Perrad (8):
  perl-class-method-modifiers: new package
  perl-role-tiny: new package
  perl-sub-exporter-progressive: new package
  perl-sub-quote: new package
  perl-devel-globaldestruction: new package
  perl-moo: new package
  perl-exporter-tiny: new package
  perl-type-tiny: new package

 package/Config.in                                   |  8 ++++++++
 package/perl-class-method-modifiers/Config.in       |  6 ++++++
 .../perl-class-method-modifiers.hash                |  6 ++++++
 .../perl-class-method-modifiers.mk                  | 13 +++++++++++++
 package/perl-devel-globaldestruction/Config.in      |  9 +++++++++
 .../perl-devel-globaldestruction.hash               |  6 ++++++
 .../perl-devel-globaldestruction.mk                 | 13 +++++++++++++
 package/perl-exporter-tiny/Config.in                |  7 +++++++
 package/perl-exporter-tiny/perl-exporter-tiny.hash  |  7 +++++++
 package/perl-exporter-tiny/perl-exporter-tiny.mk    | 13 +++++++++++++
 package/perl-moo/Config.in                          | 12 ++++++++++++
 package/perl-moo/perl-moo.hash                      |  6 ++++++
 package/perl-moo/perl-moo.mk                        | 13 +++++++++++++
 package/perl-role-tiny/Config.in                    |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.hash          |  6 ++++++
 package/perl-role-tiny/perl-role-tiny.mk            | 13 +++++++++++++
 package/perl-sub-exporter-progressive/Config.in     |  6 ++++++
 .../perl-sub-exporter-progressive.hash              |  6 ++++++
 .../perl-sub-exporter-progressive.mk                | 13 +++++++++++++
 package/perl-sub-quote/Config.in                    |  6 ++++++
 package/perl-sub-quote/perl-sub-quote.hash          |  6 ++++++
 package/perl-sub-quote/perl-sub-quote.mk            | 13 +++++++++++++
 package/perl-type-tiny/Config.in                    |  8 ++++++++
 package/perl-type-tiny/perl-type-tiny.hash          |  7 +++++++
 package/perl-type-tiny/perl-type-tiny.mk            | 13 +++++++++++++
 25 files changed, 222 insertions(+)
 create mode 100644 package/perl-class-method-modifiers/Config.in
 create mode 100644 package/perl-class-method-modifiers/perl-class-method-modifiers.hash
 create mode 100644 package/perl-class-method-modifiers/perl-class-method-modifiers.mk
 create mode 100644 package/perl-devel-globaldestruction/Config.in
 create mode 100644 package/perl-devel-globaldestruction/perl-devel-globaldestruction.hash
 create mode 100644 package/perl-devel-globaldestruction/perl-devel-globaldestruction.mk
 create mode 100644 package/perl-exporter-tiny/Config.in
 create mode 100644 package/perl-exporter-tiny/perl-exporter-tiny.hash
 create mode 100644 package/perl-exporter-tiny/perl-exporter-tiny.mk
 create mode 100644 package/perl-moo/Config.in
 create mode 100644 package/perl-moo/perl-moo.hash
 create mode 100644 package/perl-moo/perl-moo.mk
 create mode 100644 package/perl-role-tiny/Config.in
 create mode 100644 package/perl-role-tiny/perl-role-tiny.hash
 create mode 100644 package/perl-role-tiny/perl-role-tiny.mk
 create mode 100644 package/perl-sub-exporter-progressive/Config.in
 create mode 100644 package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.hash
 create mode 100644 package/perl-sub-exporter-progressive/perl-sub-exporter-progressive.mk
 create mode 100644 package/perl-sub-quote/Config.in
 create mode 100644 package/perl-sub-quote/perl-sub-quote.hash
 create mode 100644 package/perl-sub-quote/perl-sub-quote.mk
 create mode 100644 package/perl-type-tiny/Config.in
 create mode 100644 package/perl-type-tiny/perl-type-tiny.hash
 create mode 100644 package/perl-type-tiny/perl-type-tiny.mk

-- 
2.17.1
