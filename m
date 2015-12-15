From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:03:19 +0100
Subject: [Buildroot] [git commit] ustr: comma separate licenses
Message-ID: <20151215210844.5E8BE818FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e42e268a242e66cdc0bcf236399587e79b24e4d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ustr/ustr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
index d6b0ee4..174f055 100644
--- a/package/ustr/ustr.mk
+++ b/package/ustr/ustr.mk
@@ -7,7 +7,7 @@
 USTR_VERSION = 1.0.4
 USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
-USTR_LICENSE = BSD-2c MIT LGPLv2+
+USTR_LICENSE = BSD-2c, MIT, LGPLv2+
 USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 USTR_AUTORECONF = YES
 USTR_PATCH = \
