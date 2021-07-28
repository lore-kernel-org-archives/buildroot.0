Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49F8C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:51:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA5160E96
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA5160E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 810B94067A;
	Wed,  4 Aug 2021 00:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BEatMfIuklAx; Wed,  4 Aug 2021 00:51:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18B3D4067B;
	Wed,  4 Aug 2021 00:51:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3CB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0CD40E5B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2jnq6Xltr3g for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FC9940E51
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E470C83F8F; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:41 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 79660c173e06b3290cf7b5f3c56da0f1bacecf92
X-Git-Newrev: 12c05e42c7b0f346ec4ff0fa8e79af532cdd783c
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.E470C83F8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openrc: bump to
 version 0.43.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2713082062807245495=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2713082062807245495==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=12c05e42c7b0f346ec4ff0fa8e79af532cdd783c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Refresh second patch
- Drop sixth and seventh patches (already in version)
- Update indentation in hash file (two spaces)

https://github.com/OpenRC/openrc/blob/0.43.3/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Linux.in-change-run-lock-from-root-uucp-t.patch |   6 +-
 ...logger.h-fix-build-failure-against-gcc-10.patch |  52 -----
 .../openrc/0007-checkpath-fix-CVE-2018-21269.patch | 251 ---------------------
 package/openrc/openrc.hash                         |   4 +-
 package/openrc/openrc.mk                           |   5 +-
 5 files changed, 7 insertions(+), 311 deletions(-)

diff --git a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
index 66bbba42ba..457fbacb5b 100644
--- a/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
+++ b/package/openrc/0002-sh-init.sh.Linux.in-change-run-lock-from-root-uucp-t.patch
@@ -12,6 +12,8 @@ reasons. However uucp does not exist on buildroot by default, and
 it makes more sense that 'daemon' group should own this directory.
 
 Signed-off-by: Michał Łyszczek <michal.lyszczek@bofc.pl>
+[Fabrice: update for 0.43.3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  sh/init.sh.Linux.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,9 +23,9 @@ index 222bbd3b..7f1a88db 100644
 --- a/sh/init.sh.Linux.in
 +++ b/sh/init.sh.Linux.in
 @@ -85,7 +85,7 @@ fi
+ fi
  
- [ -x /sbin/restorecon ] && /sbin/restorecon -rF /run
- checkpath -d $RC_SVCDIR
+ checkpath -d "$RC_SVCDIR"
 -checkpath -d -m 0775 -o root:uucp /run/lock
 +checkpath -d -m 0775 -o root:daemon /run/lock
  
diff --git a/package/openrc/0006-src-rc-rc-logger.h-fix-build-failure-against-gcc-10.patch b/package/openrc/0006-src-rc-rc-logger.h-fix-build-failure-against-gcc-10.patch
deleted file mode 100644
index 9fded3ca90..0000000000
--- a/package/openrc/0006-src-rc-rc-logger.h-fix-build-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 375ef42393f3dc6edbaa2cb70c79b2366072db38 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Sun, 19 Jan 2020 15:24:20 +0000
-Subject: [PATCH] src/rc/rc-logger.h: fix build failure against gcc-10
-
-On gcc-10 (and gcc-9 -fno-common) build fails as:
-
-```
-cc  -L../librc -L../libeinfo -O2 -g -std=c99 -Wall -Wextra -Wimplicit -Wshadow \
-  -Wformat=2 -Wmissing-prototypes -Wmissing-declarations -Wmissing-noreturn \
-  -Wmissing-format-attribute -Wnested-externs -Winline -Wwrite-strings \
-  -Wcast-align -Wcast-qual -Wpointer-arith -Wdeclaration-after-statement \
-  -Wsequence-point -Werror=implicit-function-declaration    \
-  -Wl,-rpath=/lib   -o openrc rc.o rc-logger.o rc-misc.o rc-plugin.o _usage.o -lutil -lrc -leinfo -Wl,-Bdynamic -ldl
-ld: rc-logger.o:/home/slyfox/dev/git/openrc/src/rc/rc-logger.h:16:
-  multiple definition of `rc_logger_pid'; rc.o:openrc/src/rc/rc-logger.h:16: first defined here
-ld: rc-logger.o:/home/slyfox/dev/git/openrc/src/rc/rc-logger.h:17:
-  multiple definition of `rc_logger_tty'; rc.o:openrc/src/rc/rc-logger.h:17: first defined here
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-This fixes #348.
-
-[Patch taken from upstream:
-https://github.com/OpenRC/openrc/commit/375ef42393f3dc6edbaa2cb70c79b2366072db38]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- src/rc/rc-logger.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/rc/rc-logger.h b/src/rc/rc-logger.h
-index bf6e3e57..1da294b0 100644
---- a/src/rc/rc-logger.h
-+++ b/src/rc/rc-logger.h
-@@ -13,8 +13,8 @@
- #ifndef RC_LOGGER_H
- #define RC_LOGGER_H
- 
--pid_t rc_logger_pid;
--int rc_logger_tty;
-+extern pid_t rc_logger_pid;
-+extern int rc_logger_tty;
- extern bool rc_in_logger;
- 
- void rc_logger_open(const char *runlevel);
--- 
-2.20.1
-
diff --git a/package/openrc/0007-checkpath-fix-CVE-2018-21269.patch b/package/openrc/0007-checkpath-fix-CVE-2018-21269.patch
deleted file mode 100644
index 121f229864..0000000000
--- a/package/openrc/0007-checkpath-fix-CVE-2018-21269.patch
+++ /dev/null
@@ -1,251 +0,0 @@
-From b6fef599bf8493480664b766040fa9b0d4b1e335 Mon Sep 17 00:00:00 2001
-From: William Hubbs <w.d.hubbs@gmail.com>
-Date: Fri, 20 Nov 2020 09:15:59 -0600
-Subject: [PATCH] checkpath: fix CVE-2018-21269
-
-This walks the directory path to the file we are going to manipulate to make
-sure that when we create the file and change the ownership and permissions
-we are working on the same file.
-Also, all non-terminal symbolic links must be owned by root. This will
-keep a non-root user from making a symbolic link as described in the
-bug. If root creates the symbolic link, it is assumed to be trusted.
-
-On non-linux platforms, we no longer follow non-terminal symbolic links
-by default. If you need to do that, add the -s option on the checkpath
-command line, but keep in mind that this is not secure.
-
-This fixes #201.
-
-[Patch taken from upstream:
-https://github.com/OpenRC/openrc/commit/b6fef599bf8493480664b766040fa9b0d4b1e335]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- man/openrc-run.8   |   6 +++
- src/rc/checkpath.c | 103 ++++++++++++++++++++++++++++++++++++++++++---
- 2 files changed, 102 insertions(+), 7 deletions(-)
-
-diff --git a/man/openrc-run.8 b/man/openrc-run.8
-index 1102daaa..ec4b88de 100644
---- a/man/openrc-run.8
-+++ b/man/openrc-run.8
-@@ -461,6 +461,7 @@ Mark the service as inactive.
- .Op Fl p , -pipe
- .Op Fl m , -mode Ar mode
- .Op Fl o , -owner Ar owner
-+.Op Fl s , -symlinks
- .Op Fl W , -writable
- .Op Fl q , -quiet
- .Ar path ...
-@@ -481,6 +482,11 @@ or with names, and are separated by a colon.
- The truncate options (-D and -F) cause the directory or file to be
- cleared of all contents.
- .Pp
-+If -s is not specified on a non-linux platform, checkpath will refuse to
-+allow non-terminal symbolic links to exist in the path. This is for
-+security reasons so that a non-root user can't create a symbolic link to
-+a root-owned file and take ownership of that file.
-+.Pp
- If -W is specified, checkpath checks to see if the first path given on
- the command line is writable.  This is different from how the test
- command in the shell works, because it also checks to make sure the file
-diff --git a/src/rc/checkpath.c b/src/rc/checkpath.c
-index 448c9cf8..ff54a892 100644
---- a/src/rc/checkpath.c
-+++ b/src/rc/checkpath.c
-@@ -16,6 +16,7 @@
-  *    except according to the terms contained in the LICENSE file.
-  */
- 
-+#define _GNU_SOURCE
- #include <sys/types.h>
- #include <sys/stat.h>
- 
-@@ -23,6 +24,7 @@
- #include <fcntl.h>
- #include <getopt.h>
- #include <grp.h>
-+#include <libgen.h>
- #include <pwd.h>
- #include <stdio.h>
- #include <stdlib.h>
-@@ -44,7 +46,7 @@ typedef enum {
- 
- const char *applet = NULL;
- const char *extraopts ="path1 [path2] [...]";
--const char *getoptstring = "dDfFpm:o:W" getoptstring_COMMON;
-+const char *getoptstring = "dDfFpm:o:sW" getoptstring_COMMON;
- const struct option longopts[] = {
- 	{ "directory",          0, NULL, 'd'},
- 	{ "directory-truncate", 0, NULL, 'D'},
-@@ -53,6 +55,7 @@ const struct option longopts[] = {
- 	{ "pipe",               0, NULL, 'p'},
- 	{ "mode",               1, NULL, 'm'},
- 	{ "owner",              1, NULL, 'o'},
-+	{ "symlinks",           0, NULL, 's'},
- 	{ "writable",           0, NULL, 'W'},
- 	longopts_COMMON
- };
-@@ -64,15 +67,92 @@ const char * const longopts_help[] = {
- 	"Create a named pipe (FIFO) if not exists",
- 	"Mode to check",
- 	"Owner to check (user:group)",
-+	"follow symbolic links (irrelivent on linux)",
- 	"Check whether the path is writable or not",
- 	longopts_help_COMMON
- };
- const char *usagestring = NULL;
- 
-+static int get_dirfd(char *path, bool symlinks) {
-+	char *ch;
-+	char *item;
-+	char *linkpath = NULL;
-+	char *path_dupe;
-+	char *str;
-+	int components = 0;
-+	int dirfd;
-+	int flags = 0;
-+	int new_dirfd;
-+	struct stat st;
-+	ssize_t linksize;
-+
-+	if (!path || *path != '/')
-+		eerrorx("%s: empty or relative path", applet);
-+	dirfd = openat(dirfd, "/", O_RDONLY);
-+	if (dirfd == -1)
-+		eerrorx("%s: unable to open the root directory: %s",
-+				applet, strerror(errno));
-+	path_dupe = xstrdup(path);
-+	ch = path_dupe;
-+	while (*ch) {
-+		if (*ch == '/')
-+			components++;
-+		ch++;
-+	}
-+	item = strtok(path_dupe, "/");
-+#ifdef O_PATH
-+	flags |= O_PATH;
-+#endif
-+	if (!symlinks)
-+		flags |= O_NOFOLLOW;
-+	flags |= O_RDONLY;
-+	while (dirfd > 0 && item && components > 1) {
-+		str = xstrdup(linkpath ? linkpath : item);
-+		new_dirfd = openat(dirfd, str, flags);
-+		if (new_dirfd == -1)
-+			eerrorx("%s: %s: could not open %s: %s", applet, path, str,
-+					strerror(errno));
-+		if (fstat(new_dirfd, &st) == -1)
-+			eerrorx("%s: %s: unable to stat %s: %s", applet, path, item,
-+					strerror(errno));
-+		if (S_ISLNK(st.st_mode) ) {
-+			if (st.st_uid != 0)
-+				eerrorx("%s: %s: synbolic link %s not owned by root",
-+						applet, path, str);
-+			linksize = st.st_size+1;
-+			if (linkpath)
-+				free(linkpath);
-+			linkpath = xmalloc(linksize);
-+			memset(linkpath, 0, linksize);
-+			if (readlinkat(new_dirfd, "", linkpath, linksize) != st.st_size)
-+				eerrorx("%s: symbolic link destination changed", applet);
-+			/*
-+			 * now follow the symlink.
-+			 */
-+			close(new_dirfd);
-+		} else {
-+			close(dirfd);
-+			dirfd = new_dirfd;
-+			free(linkpath);
-+			linkpath = NULL;
-+			item = strtok(NULL, "/");
-+			components--;
-+		}
-+	}
-+	free(path_dupe);
-+	if (linkpath) {
-+		free(linkpath);
-+		linkpath = NULL;
-+	}
-+	return dirfd;
-+}
-+
- static int do_check(char *path, uid_t uid, gid_t gid, mode_t mode,
--	inode_t type, bool trunc, bool chowner, bool selinux_on)
-+	inode_t type, bool trunc, bool chowner, bool symlinks, bool selinux_on)
- {
- 	struct stat st;
-+	char *name = NULL;
-+	int dirfd;
- 	int fd;
- 	int flags;
- 	int r;
-@@ -93,14 +173,16 @@ static int do_check(char *path, uid_t uid, gid_t gid, mode_t mode,
- #endif
- 	if (trunc)
- 		flags |= O_TRUNC;
--	readfd = open(path, readflags);
-+	xasprintf(&name, "%s", basename_c(path));
-+	dirfd = get_dirfd(path, symlinks);
-+	readfd = openat(dirfd, name, readflags);
- 	if (readfd == -1 || (type == inode_file && trunc)) {
- 		if (type == inode_file) {
- 			einfo("%s: creating file", path);
- 			if (!mode) /* 664 */
- 				mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH;
- 			u = umask(0);
--			fd = open(path, flags, mode);
-+			fd = openat(dirfd, name, flags, mode);
- 			umask(u);
- 			if (fd == -1) {
- 				eerror("%s: open: %s", applet, strerror(errno));
-@@ -122,7 +204,7 @@ static int do_check(char *path, uid_t uid, gid_t gid, mode_t mode,
- 				    strerror (errno));
- 				return -1;
- 			}
--			readfd = open(path, readflags);
-+			readfd = openat(dirfd, name, readflags);
- 			if (readfd == -1) {
- 				eerror("%s: unable to open directory: %s", applet,
- 						strerror(errno));
-@@ -140,7 +222,7 @@ static int do_check(char *path, uid_t uid, gid_t gid, mode_t mode,
- 				    strerror (errno));
- 				return -1;
- 			}
--			readfd = open(path, readflags);
-+			readfd = openat(dirfd, name, readflags);
- 			if (readfd == -1) {
- 				eerror("%s: unable to open fifo: %s", applet,
- 						strerror(errno));
-@@ -259,6 +341,7 @@ int main(int argc, char **argv)
- 	int retval = EXIT_SUCCESS;
- 	bool trunc = false;
- 	bool chowner = false;
-+	bool symlinks = false;
- 	bool writable = false;
- 	bool selinux_on = false;
- 
-@@ -293,6 +376,11 @@ int main(int argc, char **argv)
- 				eerrorx("%s: owner `%s' not found",
- 				    applet, optarg);
- 			break;
-+		case 's':
-+#ifndef O_PATH
-+			symlinks = true;
-+#endif
-+			break;
- 		case 'W':
- 			writable = true;
- 			break;
-@@ -320,7 +408,8 @@ int main(int argc, char **argv)
- 	while (optind < argc) {
- 		if (writable)
- 			exit(!is_writable(argv[optind]));
--		if (do_check(argv[optind], uid, gid, mode, type, trunc, chowner, selinux_on))
-+		if (do_check(argv[optind], uid, gid, mode, type, trunc, chowner,
-+					symlinks, selinux_on))
- 			retval = EXIT_FAILURE;
- 		optind++;
- 	}
--- 
-2.20.1
-
diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
index bb5880806d..4fcfa9132f 100644
--- a/package/openrc/openrc.hash
+++ b/package/openrc/openrc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	91a01ca6d930a0688fb91338209985de57cac7aa2d37feddacb78fd3d95308e2	openrc-0.42.1.tar.gz
-sha256	96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624	LICENSE
+sha256  968e81743a1de7a2348590b3b3286d6af5baf96da28fa1e6364e24f8203fc3b6  openrc-0.43.3.tar.gz
+sha256  96862463f4e77e2508e4fc2c83773fd24807cb699368b63fd93a5e2b466dd624  LICENSE
diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index d9010a60be..1d4e70f712 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-OPENRC_VERSION = 0.42.1
+OPENRC_VERSION = 0.43.3
 OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
 OPENRC_LICENSE = BSD-2-Clause
 OPENRC_LICENSE_FILES = LICENSE
 OPENRC_CPE_ID_VENDOR = openrc_project
 
-# 0007-checkpath-fix-CVE-2018-21269.patch
-OPENRC_IGNORE_CVES += CVE-2018-21269
-
 OPENRC_DEPENDENCIES = ncurses
 
 # set LIBNAME so openrc puts files in proper directories and sets proper

--===============2713082062807245495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2713082062807245495==--
