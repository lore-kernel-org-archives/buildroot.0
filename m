From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:12 +0200
Subject: [Buildroot] [PATCH 05/24] erlang-goldrush: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-6-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/erlang-goldrush/erlang-goldrush.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index 2fa88107e18f..91165cae57a7 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -11,4 +11,3 @@ ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
 ERLANG_GOLDRUSH_INSTALL_STAGING = YES
 
 $(eval $(rebar-package))
-$(eval $(host-rebar-package))
-- 
2.1.0
