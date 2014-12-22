From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Dec 2014 01:00:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/mysql: rename patches to the new
	convention
In-Reply-To: <cover.1419206325.git.yann.morin.1998@free.fr>
References: <cover.1419206325.git.yann.morin.1998@free.fr>
Message-ID: <026a0cdea93ae30fae4e30901d1a376e24a46863.1419206325.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../mysql/{mysql-0000-ac_cache_check.patch => 0000-ac_cache_check.patch}  | 0
 ...configure-ps-cache-check.patch => 0001-configure-ps-cache-check.patch} | 0
 ...002-use-new-readline-iface.patch => 0002-use-new-readline-iface.patch} | 0
 ...ck_direction-is-unset.patch => 0003-ac_stack_direction-is-unset.patch} | 0
 ...gen_lex_hash-execution.patch => 0004-Fix-gen_lex_hash-execution.patch} | 0
 ...ql_server_build.patch => 0005-bison_3_breaks_mysql_server_build.patch} | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/mysql/{mysql-0000-ac_cache_check.patch => 0000-ac_cache_check.patch} (100%)
 rename package/mysql/{mysql-0001-configure-ps-cache-check.patch => 0001-configure-ps-cache-check.patch} (100%)
 rename package/mysql/{mysql-0002-use-new-readline-iface.patch => 0002-use-new-readline-iface.patch} (100%)
 rename package/mysql/{mysql-0003-ac_stack_direction-is-unset.patch => 0003-ac_stack_direction-is-unset.patch} (100%)
 rename package/mysql/{mysql-0004-Fix-gen_lex_hash-execution.patch => 0004-Fix-gen_lex_hash-execution.patch} (100%)
 rename package/mysql/{mysql-0005-bison_3_breaks_mysql_server_build.patch => 0005-bison_3_breaks_mysql_server_build.patch} (100%)

diff --git a/package/mysql/mysql-0000-ac_cache_check.patch b/package/mysql/0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/mysql-0000-ac_cache_check.patch
rename to package/mysql/0000-ac_cache_check.patch
diff --git a/package/mysql/mysql-0001-configure-ps-cache-check.patch b/package/mysql/0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/mysql-0001-configure-ps-cache-check.patch
rename to package/mysql/0001-configure-ps-cache-check.patch
diff --git a/package/mysql/mysql-0002-use-new-readline-iface.patch b/package/mysql/0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/mysql-0002-use-new-readline-iface.patch
rename to package/mysql/0002-use-new-readline-iface.patch
diff --git a/package/mysql/mysql-0003-ac_stack_direction-is-unset.patch b/package/mysql/0003-ac_stack_direction-is-unset.patch
similarity index 100%
rename from package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
rename to package/mysql/0003-ac_stack_direction-is-unset.patch
diff --git a/package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch b/package/mysql/0004-Fix-gen_lex_hash-execution.patch
similarity index 100%
rename from package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch
rename to package/mysql/0004-Fix-gen_lex_hash-execution.patch
diff --git a/package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch b/package/mysql/0005-bison_3_breaks_mysql_server_build.patch
similarity index 100%
rename from package/mysql/mysql-0005-bison_3_breaks_mysql_server_build.patch
rename to package/mysql/0005-bison_3_breaks_mysql_server_build.patch
-- 
1.9.1
