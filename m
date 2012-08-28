From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue, 28 Aug 2012 13:07:43 +0100
Subject: [Buildroot] [PATCH v2] zeromq: add license information
Message-ID: <1346155663-19364-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <simond@trainfx.com>

Not that the COPYING.LESSER file states that "Parts of the
software are licensed under the MIT (X11) license".
On the 0MQ mailing list, Pieter Hintjens has confirmed that
the code no longer contains any parts that are under the
MIT/X11 license. (The COPYING.LESSER file will be fixed in
a future release.)

Signed-off-by: Simon Dawson <simond@trainfx.com>
---
 v2: License is not GPLv3+, as claimed by v1 of this patch.

 package/zeromq/zeromq.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index f5e530d..99ee4ca 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -8,5 +8,7 @@ ZEROMQ_VERSION = 2.1.11
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
+ZEROMQ_LICENSE = LGPLv3+ with exceptions
+ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 
 $(eval $(autotools-package))
-- 
1.7.9.5
