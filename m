From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  1 Mar 2021 13:24:35 +0100
Subject: [Buildroot] [PATCH] package/prosody: bump to 0.11.8
Message-ID: <20210301122435.512679-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index dc4e567d4..309ae0181 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  a9bf18a713804b5cc9d0322d1bf5d5d8  prosody-0.11.7.tar.gz
-sha1  425e1c7ca37464b31711da8eb4a4c9444a70360f  prosody-0.11.7.tar.gz
-sha256  28ffc07653485cb63e22b387d3ea4825ee2baaee0c5827de4d6053a35b1c8747   prosody-0.11.7.tar.gz
-sha512  923aa92598ef851ed8408931942859f78f1e3d700fee251f4f5ca67abdcdae43448318ed90a9a1cdc7824d5f4dc5a4732fad4b9ed36d97455fa9b3bff0881a20  prosody-0.11.7.tar.gz
+md5  24cd3c1f7ab16a6b3726423d2fff802d  prosody-0.11.8.tar.gz
+sha1  f1f030c75abde6e3c7232fedbe8371f5cb913245  prosody-0.11.8.tar.gz
+sha256  830f183b98d5742d81e908d2d8e3258f1b538dad7411f06fda5b2cc5c75068f8  prosody-0.11.8.tar.gz
+sha512  b0b7e1d3e41f47f0f88ad5b76444e4959b20f4c7a937f3cc605ba6ed5d92e713a3054dcb61ee6629063883a8f9ff1a03952893de4a0d840dcec4e5e42079eb57  prosody-0.11.8.tar.gz
 
 # Hash for license file:
 sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index ad51f6797..b2641545b 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.7
+PROSODY_VERSION = 0.11.8
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
-- 
2.27.0
