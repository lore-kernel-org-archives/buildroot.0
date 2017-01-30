From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 14:50:20 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] package/wavpack: bump
	version to 5.0.0
Message-ID: <20170130141559.58A6F81EA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba416e0f486e97195ddb04ccd42d0b1823907053
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0dbe92b0d037bdcf40edeb29534e64bfd9a8a98b)
---
 package/wavpack/wavpack.hash | 2 +-
 package/wavpack/wavpack.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wavpack/wavpack.hash b/package/wavpack/wavpack.hash
index f15afc2..0ec287d 100644
--- a/package/wavpack/wavpack.hash
+++ b/package/wavpack/wavpack.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 7d31b34166c33c3109b45c6e4579b472fd05e3ee8ec6d728352961c5cdd1d6b0  wavpack-4.75.2.tar.bz2
+sha256  918d7e32a19598df543b17fff840b10a0880f87296f9e32af454d256b6a64049  wavpack-5.0.0.tar.bz2
diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index ae16454..8fef548 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVPACK_VERSION = 4.75.2
+WAVPACK_VERSION = 5.0.0
 WAVPACK_SITE = http://www.wavpack.com
 WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
 WAVPACK_INSTALL_STAGING = YES
