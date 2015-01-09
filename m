From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  9 Jan 2015 08:14:01 +0100
Subject: [Buildroot] [PATCH v4 0/2]  libsvgtiny: fix source url
Message-ID: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4:
 - Move NetSurf buildsystem files to a new pacakge (Thomas P.)
v3:
 - Add missing netsurf core buildsystem sources.
v2:
 - Use http for git (suggested by Baruch) (done by Thomas P.).

Fabio Porcedda (2):
  netsurf-buildsystem: new package
  libsvgtiny: update source url

 package/libsvgtiny/libsvgtiny.mk                   | 12 +++++++++---
 package/netsurf-buildsystem/netsurf-buildsystem.mk | 20 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 package/netsurf-buildsystem/netsurf-buildsystem.mk

-- 
2.2.1
