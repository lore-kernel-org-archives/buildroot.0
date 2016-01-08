From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:27:56 +0100
Subject: [Buildroot] [git commit] tpm-tools: fix .mk file header
Message-ID: <20160108173609.86CCE7FFE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1939b393e32c3a91bddc6a0985fe0fe0e6b6eb50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file header should use 80 #'s.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm-tools/tpm-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 4fc5138..72afc44 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # tpm-tools
 #
-##############################################################
+################################################################################
 
 TPM_TOOLS_VERSION = 1.3.8
 TPM_TOOLS_SOURCE = tpm-tools-$(TPM_TOOLS_VERSION).tar.gz
