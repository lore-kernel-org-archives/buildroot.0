From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu,  9 Jul 2015 18:22:00 +0200
Subject: [Buildroot] [PATCH 6/7 v2] mysql: move patches into a
	version-specific subdirectory
In-Reply-To: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1436458921-4199-7-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will make possible to apply a different set of patches for mysql and mariadb variants.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/mysql/{ => 5.1}/0000-ac_cache_check.patch                    | 0
 package/mysql/{ => 5.1}/0001-configure-ps-cache-check.patch          | 0
 package/mysql/{ => 5.1}/0002-use-new-readline-iface.patch            | 0
 package/mysql/{ => 5.1}/0003-ac_stack_direction-is-unset.patch       | 0
 package/mysql/{ => 5.1}/0004-Fix-gen_lex_hash-execution.patch        | 0
 package/mysql/{ => 5.1}/0005-bison_3_breaks_mysql_server_build.patch | 0
 package/mysql/{ => 5.1}/0006-no-force-static-build.patch             | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename package/mysql/{ => 5.1}/0000-ac_cache_check.patch (100%)
 rename package/mysql/{ => 5.1}/0001-configure-ps-cache-check.patch (100%)
 rename package/mysql/{ => 5.1}/0002-use-new-readline-iface.patch (100%)
 rename package/mysql/{ => 5.1}/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/mysql/{ => 5.1}/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/mysql/{ => 5.1}/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/mysql/{ => 5.1}/0006-no-force-static-build.patch (100%)

diff --git a/package/mysql/0000-ac_cache_check.patch b/package/mysql/5.1/0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/0000-ac_cache_check.patch
rename to package/mysql/5.1/0000-ac_cache_check.patch
diff --git a/package/mysql/0001-configure-ps-cache-check.patch b/package/mysql/5.1/0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/0001-configure-ps-cache-check.patch
rename to package/mysql/5.1/0001-configure-ps-cache-check.patch
diff --git a/package/mysql/0002-use-new-readline-iface.patch b/package/mysql/5.1/0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/0002-use-new-readline-iface.patch
rename to package/mysql/5.1/0002-use-new-readline-iface.patch
diff --git a/package/mysql/0003-ac_stack_direction-is-unset.patch b/package/mysql/5.1/0003-ac_stack_direction-is-unset.patch
similarity index 100%
rename from package/mysql/0003-ac_stack_direction-is-unset.patch
rename to package/mysql/5.1/0003-ac_stack_direction-is-unset.patch
diff --git a/package/mysql/0004-Fix-gen_lex_hash-execution.patch b/package/mysql/5.1/0004-Fix-gen_lex_hash-execution.patch
similarity index 100%
rename from package/mysql/0004-Fix-gen_lex_hash-execution.patch
rename to package/mysql/5.1/0004-Fix-gen_lex_hash-execution.patch
diff --git a/package/mysql/0005-bison_3_breaks_mysql_server_build.patch b/package/mysql/5.1/0005-bison_3_breaks_mysql_server_build.patch
similarity index 100%
rename from package/mysql/0005-bison_3_breaks_mysql_server_build.patch
rename to package/mysql/5.1/0005-bison_3_breaks_mysql_server_build.patch
diff --git a/package/mysql/0006-no-force-static-build.patch b/package/mysql/5.1/0006-no-force-static-build.patch
similarity index 100%
rename from package/mysql/0006-no-force-static-build.patch
rename to package/mysql/5.1/0006-no-force-static-build.patch
-- 
1.9.1
