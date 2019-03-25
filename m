From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:30:35 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/tpm2-abrmd:
 rename libsapi to libtss2-sys in the help text
Message-ID: <20190325162752.6BCDE813EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0134c36066fc9712000f01760945eb49f7cad9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

libsapi was renamed to libtss2-sys in tpm2-tss library:
https://github.com/tpm2-software/tpm2-tss/commit/5f0ab55d4e46077cb8f0c53a76c5ebd15a088d26

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8f297cc033c4a9a9d9f4b9b7b4872a73ab2b684e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index d18f736182..db0ea66112 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 	  The package also provides a client library for interacting
 	  with the daemon via TPM Command Transmission Interface (TCTI).
-	  It is intended for use with the SAPI library (libsapi) like
-	  any other TCTI.
+	  It is intended for use with the SAPI library (libtss2-sys)
+	  like any other TCTI.
 
 	  https://github.com/tpm2-software/tpm2-abrmd
 
