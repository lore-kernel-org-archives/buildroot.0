From: Gary Coulbourne <bear@bears.org>
Date: Wed, 19 Dec 2012 13:43:56 -0500
Subject: [Buildroot] [PATCH 0/2] Resend using proper tools of my dbus
	version bump / permissions patch
Message-ID: <1355942638-27288-1-git-send-email-bear@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a set of patches which fix a broken permissions problem in dbus and bump the version.

Gary Coulbourne (2):
  dbus: bump dbus version from 1.4.24 to current 1.6.8
  dbus: fix permissions of the installed launch helper

 package/dbus/dbus.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.10.4
