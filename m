From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 17:03:43 +0100
Subject: [Buildroot] [git commit] package/linux-headers: add licensing
	information
Message-ID: <20151117160747.362E881EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5bd650a27c1153953736affec6583a7c6b6d31a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-headers/linux-headers.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index ca68a5b..1b8b81b 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -16,6 +16,8 @@ else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
 LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
 endif
 LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
+LINUX_HEADERS_LICENSE = GPLv2
+LINUX_HEADERS_LICENSE_FILES = COPYING
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
