From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 25 Apr 2016 17:20:21 +0200
Subject: [Buildroot] [PATCH 0/2] python-pillow: new package
Message-ID: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add python-pillow the friendly python fork and bumps
openjpeg to version 2.1 required to correctly compile.

Angelo Compagnucci (2):
  package/openjpeg: bump to version 2.1
  package/python-pillow: new package

 package/openjpeg/openjpeg.hash                     |   2 +-
 package/openjpeg/openjpeg.mk                       |  31 +---
 ...y-add-option-to-disable-platform-guessing.patch | 169 +++++++++++++++++++++
 package/python-pillow/Config.in                    |  12 ++
 package/python-pillow/python-pillow.hash           |   2 +
 package/python-pillow/python-pillow.mk             |  39 +++++
 6 files changed, 226 insertions(+), 29 deletions(-)
 create mode 100644 package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
 create mode 100644 package/python-pillow/Config.in
 create mode 100644 package/python-pillow/python-pillow.hash
 create mode 100644 package/python-pillow/python-pillow.mk

-- 
1.9.1
