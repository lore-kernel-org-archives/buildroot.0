From: Rick Taylor <tropicalstormuk@gmail.com>
Date: Fri, 18 Jul 2014 09:42:43 +0100
Subject: [Buildroot] [PATCH 3/3] Update documentation to clarify usage
In-Reply-To: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
References: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
Message-ID: <1405672963-16069-3-git-send-email-rick.taylor@cassidian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
---
 docs/manual/adding-packages-autotools.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a1a4b90..dd76ed3 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -123,7 +123,7 @@ cases, typical packages will therefore only use a few of them.
 
 * +LIBFOO_AUTORECONF_ENV+, to specify additional environment
   variables to pass the 'autoreconf' program if
-  +LIBFOO_AUTORECONF=YES+. These are passed before
+  +LIBFOO_AUTORECONF=YES+. These are passed in the environment of
   the 'autoreconf' command. By default, empty.
   
 * +LIBFOO_AUTORECONF_OPT+ to specify additional options
-- 
1.9.1
