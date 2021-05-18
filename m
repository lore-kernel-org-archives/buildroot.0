From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 18 May 2021 22:05:13 +0300
Subject: [Buildroot] [PATCH/next 0/2] Update WebKitGTK, and enable with Musl
Message-ID: <20210518190515.357554-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

This bring in WebKitGTK to the most recent release and enables using it with
the Musl libc. Using WebKit with Musl is now supported by upstream packages
so no patches are needed--same as for the recent WPE WebKit update to 2.32.1

Regards,
-Adrian

Adrian Perez de Castro (2):
  package/webkitgtk: bump to version 2.32.1
  package/webkitgtk: allow building with the musl libc

 package/webkitgtk/Config.in      | 11 +++++++----
 package/webkitgtk/webkitgtk.hash |  8 ++++----
 package/webkitgtk/webkitgtk.mk   |  2 +-
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.31.1
