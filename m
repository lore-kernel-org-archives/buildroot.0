From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Sun, 17 Jul 2016 12:05:58 -0300
Subject: [Buildroot] [PATCH 2/2] docs/manual: document PKG_AS_NEEDED
In-Reply-To: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1468767958-19572-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1468767958-19572-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 docs/manual/adding-packages-autotools.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
index a041d91..e37e1e0 100644
--- a/docs/manual/adding-packages-autotools.txt
+++ b/docs/manual/adding-packages-autotools.txt
@@ -147,6 +147,10 @@ cases, typical packages will therefore only use a few of them.
   not. Valid values are +YES+ and +NO+. By
   default, the value is +YES+
 
+* +LIBFOO_AS_NEEDED+ tells wether as-needed linking should be enabled
+  or disabled. Valid values are +YES+ and +NO+. By default, the
+  value is +YES+
+
 * +LIBFOO_INSTALL_STAGING_OPTS+ contains the make options
   used to install the package to the staging directory. By default, the
   value is +DESTDIR=$(STAGING_DIR) install+, which is
-- 
2.7.3
