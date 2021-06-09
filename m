From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 22:46:11 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libffi: drop
 superfluous CPE_ID_VERSION
Message-ID: <20210609202608.77FA08CA1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d18597c141e6bc271bcc01f0e3809e0246d5ed84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The default for FOO_CPE_ID_VERSION is to default to FOO_VERSION, so drop
this superfluous definition.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Reviewed-by: Matthew Weber <Matthew.Weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cb1134bb79dde2ef1e457546c5064e82eaf63b63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/libffi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index f8b6568341..c7705b9e46 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -6,7 +6,6 @@
 
 LIBFFI_VERSION = 3.3
 LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
-LIBFFI_CPE_ID_VERSION = 3.3
 LIBFFI_CPE_ID_UPDATE = rc0
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
