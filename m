From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  2 Feb 2016 14:57:31 -0500
Subject: [Buildroot] [PATCH v2 05/18] erlang-rebar: bump to version 2.6.1
In-Reply-To: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1454443064-14269-6-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang-rebar/erlang-rebar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-rebar/erlang-rebar.mk b/package/erlang-rebar/erlang-rebar.mk
index f29eb75..06a7800 100644
--- a/package/erlang-rebar/erlang-rebar.mk
+++ b/package/erlang-rebar/erlang-rebar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_REBAR_VERSION = 2.5.1
+ERLANG_REBAR_VERSION = 2.6.1
 
 # Upstream publishes a release, but we can not use it as it is a release of
 # a generated rebar script, when we want the sources. So we have to use the
-- 
2.5.0
