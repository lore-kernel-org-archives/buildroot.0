From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu,  1 Jul 2021 01:50:04 +0200
Subject: [Buildroot] package/python-pymupdf: bump to version 1.18.14
Message-ID: <20210630235004.21896-1-raphael.melotte@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series updates python-pymupdf and its dependencies.

Please note that while I built it with br-testpkg, I did not run-test
it.

I also didn't get the chance to build mupdf with freeglut to see if it
works.

Rapha?l M?lotte (4):
  DEVELOPERS: update email address for Rapha?l M?lotte
  package/gumbo-parser: new package
  package/mupdf: bump to version 1.18.0
  package/python-pymupdf: bump to version 1.18.14

 DEVELOPERS                                 |  3 ++-
 package/Config.in                          |  1 +
 package/gumbo-parser/Config.in             | 10 ++++++++++
 package/gumbo-parser/gumbo-parser.hash     |  5 +++++
 package/gumbo-parser/gumbo-parser.mk       | 18 ++++++++++++++++++
 package/mupdf/Config.in                    |  1 +
 package/mupdf/mupdf.hash                   |  6 +++---
 package/mupdf/mupdf.mk                     | 17 ++++++++++++-----
 package/python-pymupdf/Config.in           |  1 +
 package/python-pymupdf/python-pymupdf.hash |  6 ++++--
 package/python-pymupdf/python-pymupdf.mk   | 19 +++++++++++--------
 11 files changed, 68 insertions(+), 19 deletions(-)
 create mode 100644 package/gumbo-parser/Config.in
 create mode 100644 package/gumbo-parser/gumbo-parser.hash
 create mode 100644 package/gumbo-parser/gumbo-parser.mk

-- 
2.31.1
