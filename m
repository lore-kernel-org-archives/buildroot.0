From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:02:25 +0200
Subject: [Buildroot] [git commit] lsuio: add license information
Message-ID: <20140625211214.143809D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48489b2c669dc671cee387514e800221dfa3000a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lsuio/lsuio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 4e4f592..5f8a965 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -6,5 +6,7 @@
 
 LSUIO_VERSION = 0.2.0
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+LSUIO_LICENSE = GPLv2
+LSUIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
