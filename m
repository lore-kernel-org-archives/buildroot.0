From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:30:19 +0200
Subject: [Buildroot] [git commit] package/mender/mender.mk: fix license list
Message-ID: <20210403070536.7D16B88386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e80da620bea31a64bc4108aeec344e8fcd45b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license files were updated in the .hash file, but not in the .mk file.

Fixes:
http://autobuild.buildroot.org/results/42c2987e5cf2bb8918f7fdbd8303951f34b8ead1
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/mender.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 317e533532..794dd4be8c 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -14,18 +14,20 @@ MENDER_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT, OLDAP-2.8
 MENDER_LICENSE_FILES = \
 	LICENSE \
 	LIC_FILES_CHKSUM.sha256 \
-	vendor/github.com/mendersoftware/mendertesting/LICENSE \
 	vendor/github.com/mendersoftware/mender-artifact/LICENSE \
 	vendor/github.com/mendersoftware/openssl/LICENSE \
+	vendor/github.com/minio/sha256-simd/LICENSE \
+	vendor/github.com/mendersoftware/progressbar/LICENSE \
 	vendor/github.com/pkg/errors/LICENSE \
+	vendor/github.com/godbus/dbus/LICENSE \
+	vendor/github.com/klauspost/compress/LICENSE \
 	vendor/github.com/pmezard/go-difflib/LICENSE \
 	vendor/golang.org/x/crypto/LICENSE \
 	vendor/golang.org/x/sys/LICENSE \
-	vendor/golang.org/x/net/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.md \
-	vendor/golang.org/x/text/LICENSE \
 	vendor/github.com/remyoudompheng/go-liblzma/LICENSE \
 	vendor/github.com/davecgh/go-spew/LICENSE \
+	vendor/github.com/klauspost/pgzip/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/ungerik/go-sysfs/LICENSE \
@@ -33,6 +35,7 @@ MENDER_LICENSE_FILES = \
 	vendor/github.com/stretchr/objx/LICENSE \
 	vendor/github.com/konsorten/go-windows-terminal-sequences/LICENSE \
 	vendor/gopkg.in/yaml.v3/LICENSE \
+	vendor/github.com/mattn/go-isatty/LICENSE \
 	vendor/github.com/bmatsuo/lmdb-go/LICENSE.mdb.md
 
 MENDER_DEPENDENCIES = host-pkgconf openssl xz
