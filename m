From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Jan 2013 10:35:51 -0300
Subject: [Buildroot] [PATCH 6/8] readline: add license information
In-Reply-To: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358861753-5990-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358861753-5990-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/readline/readline.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index 12d3fba..505f1e3 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -10,6 +10,8 @@ READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes
+READLINE_LICENSE = GPLv3+
+READLINE_LICENSE_FILES = COPYING
 
 define READLINE_INSTALL_TARGET_CMDS
 	$(MAKE1) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
-- 
1.7.12.4
