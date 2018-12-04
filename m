From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Dec 2018 05:37:47 +0100
Subject: [Buildroot] [PATCH 0/7] suppport/testing: more Perl/CPAN modules
Message-ID: <20181204043754.24556-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Testing pure Perl modules has few added value.
So, it is important that XS modules are marked.

Francois Perrad (7):
  scancpan: mark XS modules in docstring of test
  support/testing/tests/packages/test_perl_*: regeneration
  scancpan: allow the generation of more tests
  support/testing: add perl-dbd-mysql test
  support/testing: add perl-encode-decode test
  support/testing: add perl-io-socket-multicast test
  support/testing: add perl-io-socket-ssl test

 .../tests/package/test_perl_class_load.py     |  4 ++--
 .../tests/package/test_perl_dbd_mysql.py      | 21 +++++++++++++++++++
 .../tests/package/test_perl_encode_detect.py  | 20 ++++++++++++++++++
 .../tests/package/test_perl_gdgraph.py        |  2 +-
 .../package/test_perl_io_socket_multicast.py  | 21 +++++++++++++++++++
 .../tests/package/test_perl_io_socket_ssl.py  | 21 +++++++++++++++++++
 .../tests/package/test_perl_libwww_perl.py    |  2 +-
 .../tests/package/test_perl_mail_dkim.py      |  6 +++---
 .../testing/tests/package/test_perl_x10.py    |  2 +-
 .../tests/package/test_perl_xml_libxml.py     |  2 +-
 utils/scancpan                                | 12 ++++++-----
 11 files changed, 99 insertions(+), 14 deletions(-)
 create mode 100644 support/testing/tests/package/test_perl_dbd_mysql.py
 create mode 100644 support/testing/tests/package/test_perl_encode_detect.py
 create mode 100644 support/testing/tests/package/test_perl_io_socket_multicast.py
 create mode 100644 support/testing/tests/package/test_perl_io_socket_ssl.py

-- 
2.17.1
