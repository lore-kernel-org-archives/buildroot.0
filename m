From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 09:29:48 -0300
Subject: [Buildroot] [PATCHv2 07/12] libmnl: add license info
In-Reply-To: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1351600193-21511-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libmnl/libmnl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 75bb238..1f71347 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -8,5 +8,7 @@ LIBMNL_VERSION = 1.0.3
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
+LIBMNL_LICENSE = LGPLv2.1+
+LIBMNL_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
