From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Apr 2019 21:22:57 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tools: license is 3c BSD, not 2c
Message-ID: <20190408192258.12121-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license contains the "no endorsement" clause, so it should be listed as
BSD-3-Clause:

  * Neither the name of Intel Corporation nor the names of its contributors
    may be used to endorse or promote products derived from this software
    without specific prior written permission.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/tpm2-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index 9e50170297..e7423db67a 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -6,7 +6,7 @@
 
 TPM2_TOOLS_VERSION = 3.1.4
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
-TPM2_TOOLS_LICENSE = BSD-2-Clause
+TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
 TPM2_TOOLS_DEPENDENCIES = libcurl openssl tpm2-tss host-pkgconf
 
-- 
2.11.0
