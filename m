From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 13:58:32 +0200
Subject: [Buildroot] [PATCH 4 of 5] libnetfilter_queue: correct license
	GPLv2 -> GPLv2+
In-Reply-To: <patchbomb.1381319908@argentina>
References: <patchbomb.1381319908@argentina>
Message-ID: <1630269b240ca4b0d123.1381319912@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/libnetfilter_queue/libnetfilter-queue.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_queue/libnetfilter-queue.mk b/package/libnetfilter_queue/libnetfilter-queue.mk
--- a/package/libnetfilter_queue/libnetfilter-queue.mk
+++ b/package/libnetfilter_queue/libnetfilter-queue.mk
@@ -10,7 +10,7 @@ LIBNETFILTER_QUEUE_SITE = http://www.net
 LIBNETFILTER_QUEUE_INSTALL_STAGING = YES
 LIBNETFILTER_QUEUE_DEPENDENCIES = host-pkgconf libnfnetlink libmnl
 LIBNETFILTER_QUEUE_AUTORECONF = YES
-LIBNETFILTER_QUEUE_LICENSE = GPLv2
+LIBNETFILTER_QUEUE_LICENSE = GPLv2+
 LIBNETFILTER_QUEUE_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
