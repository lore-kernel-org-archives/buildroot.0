From: eeppeliteloop at gmail.com <eeppeliteloop@gmail.com>
Date: Thu, 26 Nov 2015 14:42:02 -0500
Subject: [Buildroot] [PATCH 0/3] Update LTTng packages
Message-ID: <1448566925-4643-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Philippe Proulx <eeppeliteloop@gmail.com>

Bump LTTng packages to v2.7.

Philippe Proulx (3):
  lttng-tools: bump to version 2.7.0
  lttng-libust: bump to version 2.7.1
  lttng-modules: bump to version 2.7.0

 package/lttng-libust/lttng-libust.hash             |   4 +-
 package/lttng-libust/lttng-libust.mk               |   2 +-
 package/lttng-modules/lttng-modules.hash           |   5 +-
 package/lttng-modules/lttng-modules.mk             |   2 +-
 ...-and-Config-string-declarations-as-extern.patch | 443 ---------------------
 package/lttng-tools/lttng-tools.hash               |   2 +-
 package/lttng-tools/lttng-tools.mk                 |   2 +-
 7 files changed, 9 insertions(+), 451 deletions(-)
 delete mode 100644 package/lttng-tools/0001-Fix-Mark-MI-and-Config-string-declarations-as-extern.patch

--
2.6.2
