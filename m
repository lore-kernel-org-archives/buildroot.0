From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sat,  5 Jun 2010 20:03:47 +0200
Subject: [Buildroot] [PATCH 1/4] bison: added host rules
In-Reply-To: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1275761030-20955-2-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/bison/bison.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 9e28e85..a411d10 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -14,3 +14,4 @@ endef
 BISON_POST_CONFIGURE_HOOKS += BISON_DISABLE_EXAMPLES
 
 $(eval $(call AUTOTARGETS,package,bison))
+$(eval $(call AUTOTARGETS,package,bison,host))
-- 
1.7.1
