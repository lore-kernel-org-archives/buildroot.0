From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  7 Mar 2014 10:31:16 +0100
Subject: [Buildroot] [PATCH 0/4] Misc patches
Message-ID: <1394184680-3562-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some miscellaneus patches.

Best regards

Fabio Porcedda (4):
  barebox: bump to version 2014.03.0
  barebox: fix coding style
  Remove "dirs" dependencies
  Makefile: fix coding style

 Makefile                 | 190 +++++++++++++++++++++++------------------------
 boot/barebox/Config.in   |   4 +-
 boot/barebox/barebox.mk  |  32 ++++----
 package/uclibc/uclibc.mk |   2 +-
 4 files changed, 117 insertions(+), 111 deletions(-)

-- 
1.8.3.2
