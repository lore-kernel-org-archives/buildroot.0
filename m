From: Romain Naour <romain.naour@smile.fr>
Date: Fri,  8 Mar 2019 14:27:10 +0100
Subject: [Buildroot] [PATCH 2/2] package/tpm2-abrmd: rename libsapi to
 libtss2-sys in the help text
In-Reply-To: <20190308132710.11116-1-romain.naour@smile.fr>
References: <20190308132710.11116-1-romain.naour@smile.fr>
Message-ID: <20190308132710.11116-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsapi was renamed to libtss2-sys in tpm2-tss library:
https://github.com/tpm2-software/tpm2-tss/commit/5f0ab55d4e46077cb8f0c53a76c5ebd15a088d26

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Carlos Santos <casantos@datacom.com.br>
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
 
-- 
2.20.1
