From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  2 Aug 2017 07:57:22 +0200
Subject: [Buildroot] [PATCH v2 0/4] Bump python-twisted and fix dependencies
Message-ID: <20170802055726.18461-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Current version needed Automat, that will be added in this series.

And the bumped version also needs hyperlink, that is meanwhile available.

Yegor Yefremov (4):
  python-mistune: add host variant
  python-m2r: new package
  python-automat: new package
  python-twisted: bump to version 17.5.0

 package/Config.in                          |  2 ++
 package/python-automat/Config.in           |  8 ++++++++
 package/python-automat/python-automat.hash |  3 +++
 package/python-automat/python-automat.mk   | 15 +++++++++++++++
 package/python-m2r/Config.in               |  8 ++++++++
 package/python-m2r/python-m2r.hash         |  3 +++
 package/python-m2r/python-m2r.mk           | 16 ++++++++++++++++
 package/python-mistune/python-mistune.mk   |  1 +
 package/python-twisted/Config.in           |  2 ++
 package/python-twisted/python-twisted.hash |  4 ++--
 package/python-twisted/python-twisted.mk   |  4 ++--
 11 files changed, 62 insertions(+), 4 deletions(-)
 create mode 100644 package/python-automat/Config.in
 create mode 100644 package/python-automat/python-automat.hash
 create mode 100644 package/python-automat/python-automat.mk
 create mode 100644 package/python-m2r/Config.in
 create mode 100644 package/python-m2r/python-m2r.hash
 create mode 100644 package/python-m2r/python-m2r.mk

-- 
2.11.0
