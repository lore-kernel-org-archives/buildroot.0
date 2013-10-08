From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 12:06:56 +0200
Subject: [Buildroot] [PATCH 2 of 4] libnfnetlink: add license information
In-Reply-To: <patchbomb.1381226814@argentina>
References: <patchbomb.1381226814@argentina>
Message-ID: <5c8fa6d049957876145a.1381226816@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libnfnetlink/libnfnetlink.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -9,5 +9,7 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIB
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_AUTORECONF = YES
 LIBNFNETLINK_INSTALL_STAGING = YES
+LIBNFNETLINK_LICENSE = GPLv2+
+LIBNFNETLINK_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
