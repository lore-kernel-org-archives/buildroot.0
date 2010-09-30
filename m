From: Martin Banky <martin.banky@gmail.com>
Date: Thu, 30 Sep 2010 12:03:35 -0700
Subject: [Buildroot] [PATCH 5/6] coreutils: changed/removed some of the
	configure environmental variables
In-Reply-To: <1285873416-20755-1-git-send-email-Martin.Banky@gmail.com>
References: <1285873416-20755-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285873416-20755-6-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gl_ac_cv_func_link_follows_symlink=no - changed to gl_cv_func_link_follows_symlink
gl_cv_func_mkdir_trailing_slash_bug=no - no longer used
gl_cv_func_rename_dest_exists_bug=no - no longer used
gl_cv_func_rename_trailing_slash_bug=no - no longer used

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/coreutils/coreutils.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 73dd662..ae8863f 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -38,14 +38,11 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 		ac_use_included_regex=no \
 		am_cv_func_working_getline=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
-		gl_ac_cv_func_link_follows_symlink=no \
 		gl_cv_func_getcwd_null=yes \
 		gl_cv_func_getcwd_path_max=yes \
 		gl_cv_func_gettimeofday_clobber=no \
-		gl_cv_func_mkdir_trailing_slash_bug=no \
+		gl_cv_func_link_follows_symlink=no \
 		gl_cv_func_re_compile_pattern_working=yes \
-		gl_cv_func_rename_dest_exists_bug=no \
-		gl_cv_func_rename_trailing_slash_bug=no \
 		gl_cv_func_svid_putenv=yes \
 		gl_cv_func_tzset_clobber=no \
 		gl_cv_func_working_mkstemp=yes \
-- 
1.7.3
