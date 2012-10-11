From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 15:57:52 +0400
Subject: [Buildroot] vala version update 0.18.0
Message-ID: <CABtOAfwa+P3Nu9Ph2LOkuNJ-KmbQiAhiVFS5oAFqkMQyQORU6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---

commit 57874f61cfc22fa2e1e5cf73f84323e3f4fa0699
Author: Alexander Khryukin <alexander@mezon.ru>
Date:   Thu Oct 11 12:01:05 2012 +0000

    vala version update 0.18.0

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index e4b8b54..5c333c5 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -4,8 +4,8 @@
 #
 #############################################################

-VALA_VERSION_MAJOR = 0.17
-VALA_VERSION_MINOR = 7
+VALA_VERSION_MAJOR = 0.18
+VALA_VERSION_MINOR = 0
 VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
 VALA_SITE = http://download.gnome.org/sources/vala/$(VALA_VERSION_MAJOR)
 VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/e7840c37/attachment.html>
