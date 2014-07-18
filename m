From: Rick Taylor <tropicalstormuk@gmail.com>
Date: Fri, 18 Jul 2014 09:42:42 +0100
Subject: [Buildroot] [PATCH 2/3] Update documentation of AUTORECONF_ENV
In-Reply-To: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
References: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
Message-ID: <1405672963-16069-2-git-send-email-rick.taylor@cassidian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
---
 docs/manual/adding-packages-autotools.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index 3f40503..a1a4b90 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -121,6 +121,11 @@ cases, typical packages will therefore only use a few of them.
   automake, libtool, etc.). Valid values are +YES+ and
   +NO+. By default, the value is +NO+
 
+* +LIBFOO_AUTORECONF_ENV+, to specify additional environment
+  variables to pass the 'autoreconf' program if
+  +LIBFOO_AUTORECONF=YES+. These are passed before
+  the 'autoreconf' command. By default, empty.
+  
 * +LIBFOO_AUTORECONF_OPT+ to specify additional options
   passed to the 'autoreconf' program if
   +LIBFOO_AUTORECONF=YES+. By default, empty.
-- 
1.9.1
