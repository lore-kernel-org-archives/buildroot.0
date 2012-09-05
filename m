From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Sep 2012 23:50:45 +0200
Subject: [Buildroot] [git commit] zeromq: add license information
Message-ID: <20120905215422.7DF7897020@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b595d6c923c197b8410470b663720e339682b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that the COPYING.LESSER file states that "Parts of the
software are licensed under the MIT (X11) license".
On the 0MQ mailing list, Pieter Hintjens has confirmed that
the code no longer contains any parts that are under the
MIT/X11 license. (The COPYING.LESSER file will be fixed in
a future release.)

Signed-off-by: Simon Dawson <simond@trainfx.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zeromq/zeromq.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
