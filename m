From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:26 -0300
Subject: [Buildroot] [PATCH 20/54] lsuio: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lsuio/lsuio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lsuio/lsuio.mk b/package/lsuio/lsuio.mk
index 4e4f592..5f8a965 100644
--- a/package/lsuio/lsuio.mk
+++ b/package/lsuio/lsuio.mk
@@ -6,5 +6,7 @@
 
 LSUIO_VERSION = 0.2.0
 LSUIO_SITE = http://www.osadl.org/projects/downloads/UIO/user
+LSUIO_LICENSE = GPLv2
+LSUIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
