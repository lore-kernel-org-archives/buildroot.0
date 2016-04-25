From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 23:44:30 +0200
Subject: [Buildroot] [PATCH v2 0/3] python-pillow: new package
Message-ID: <1461620673-31313-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add python-pillow the friendly python fork and bumps
openjpeg to version 2.1 required to correctly compile.
Bumping openjpeg to version 2.1 makes poppler unhappy so fixing it.

*** BLURB HERE ***

Angelo Compagnucci (3):
  package/openjpeg: bump to version 2.1
  package/poppler: enable autodetection of openjpeg
  package/python-pillow: new package

 package/Config.in                                  |   1 +
 package/openjpeg/openjpeg.hash                     |   2 +-
 package/openjpeg/openjpeg.mk                       |  34 +----
 package/poppler/poppler.mk                         |   2 +-
 ...y-add-option-to-disable-platform-guessing.patch | 169 +++++++++++++++++++++
 package/python-pillow/Config.in                    |  12 ++
 package/python-pillow/python-pillow.hash           |   2 +
 package/python-pillow/python-pillow.mk             |  39 +++++
 8 files changed, 232 insertions(+), 29 deletions(-)
 create mode 100644 package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.hash
 create mode 100644 package/python-pillow/python-pillow.mk

-- 
1.9.1
