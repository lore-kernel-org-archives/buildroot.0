From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 23:01:12 +0100
Subject: [Buildroot] [git commit] argp-standalone: add license information
Message-ID: <20130324220054.08DC29B2AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca0c174e53dd4f23d00c81dd38657107a1c4e3de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is unfortunately no license file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/argp-standalone/argp-standalone.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
index ba7f757..4fc4321 100644
--- a/package/argp-standalone/argp-standalone.mk
+++ b/package/argp-standalone/argp-standalone.mk
@@ -7,6 +7,7 @@
 ARGP_STANDALONE_VERSION = 1.3
 ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
 ARGP_STANDALONE_INSTALL_STAGING = YES
+ARGP_STANDALONE_LICENSE = LGPLv2+
 
 ARGP_STANDALONE_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) -fPIC"
