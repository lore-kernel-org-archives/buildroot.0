From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:35:41 +0200
Subject: [Buildroot] [git commit] package/tpm2-tools: license is 3c BSD,
 not 2c
Message-ID: <20190408203337.CE2718CA30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92c7310d5be2956d2f609013289cc85073deac24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license contains the "no endorsement" clause, so it should be listed as
BSD-3-Clause:

  * Neither the name of Intel Corporation nor the names of its contributors
    may be used to endorse or promote products derived from this software
    without specific prior written permission.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
