From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 23:31:28 +0100
Subject: [Buildroot] [git commit] readline: add license information
Message-ID: <20130128223400.286CB9A864@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24511f3cdee394c8b2d741b616dbc8524bb90bfc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/readline/readline.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
