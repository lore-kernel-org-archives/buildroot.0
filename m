From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:53 -0300
Subject: [Buildroot] [PATCH 14/45] bc: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bc/bc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 146c472..8f3e08d 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -8,7 +8,7 @@ BC_VERSION = 1.06.95
 BC_SOURCE = bc-$(BC_VERSION).tar.bz2
 BC_SITE = http://alpha.gnu.org/gnu/bc
 BC_DEPENDENCIES = host-flex
-BC_LICENSE = GPLv2+ LGPLv2.1+
+BC_LICENSE = GPLv2+, LGPLv2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
 
 # Build after busybox so target ends up with bc's "dc" version
-- 
2.4.10
