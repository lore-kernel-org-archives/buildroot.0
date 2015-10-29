From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 29 Oct 2015 22:32:02 +0100
Subject: [Buildroot] [PATCH v3 1/4] mysql: rename into oracle-mysql
In-Reply-To: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1446154325-24088-2-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename mysql package into oracle-mysql, in order to make mysql a virtual
package.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>

---

Changes v2 -> v3:
 - Remove patches moving mysql patches since it is not needed anymore
 - rename mysql into oracle-mysql (suggested by Thomas Petazzoni)
 
 package/{ => oracle-mysql}/mysql/0000-ac_cache_check.patch                | 0
 package/{ => oracle-mysql}/mysql/0001-configure-ps-cache-check.patch      | 0
 package/{ => oracle-mysql}/mysql/0002-use-new-readline-iface.patch        | 0
 package/{ => oracle-mysql}/mysql/0003-ac_stack_direction-is-unset.patch   | 0
 package/{ => oracle-mysql}/mysql/0004-Fix-gen_lex_hash-execution.patch    | 0
 .../{ => oracle-mysql}/mysql/0005-bison_3_breaks_mysql_server_build.patch | 0
 package/{ => oracle-mysql}/mysql/0006-no-force-static-build.patch         | 0
 package/{ => oracle-mysql}/mysql/Config.in                                | 0
 package/{ => oracle-mysql}/mysql/S97mysqld                                | 0
 package/{ => oracle-mysql}/mysql/mysql.hash                               | 0
 package/{ => oracle-mysql}/mysql/mysql.mk                                 | 0
 package/{ => oracle-mysql}/mysql/mysqld.service                           | 0
 12 files changed, 0 insertions(+), 0 deletions(-)
 rename package/{ => oracle-mysql}/mysql/0000-ac_cache_check.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0001-configure-ps-cache-check.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0002-use-new-readline-iface.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0006-no-force-static-build.patch (100%)
 rename package/{ => oracle-mysql}/mysql/Config.in (100%)
 rename package/{ => oracle-mysql}/mysql/S97mysqld (100%)
 rename package/{ => oracle-mysql}/mysql/mysql.hash (100%)
 rename package/{ => oracle-mysql}/mysql/mysql.mk (100%)
 rename package/{ => oracle-mysql}/mysql/mysqld.service (100%)

diff --git a/package/mysql/0000-ac_cache_check.patch b/package/oracle-mysql/mysql/0000-ac_cache_check.patch
similarity index 100%
rename from package/mysql/0000-ac_cache_check.patch
rename to package/oracle-mysql/mysql/0000-ac_cache_check.patch
diff --git a/package/mysql/0001-configure-ps-cache-check.patch b/package/oracle-mysql/mysql/0001-configure-ps-cache-check.patch
similarity index 100%
rename from package/mysql/0001-configure-ps-cache-check.patch
rename to package/oracle-mysql/mysql/0001-configure-ps-cache-check.patch
diff --git a/package/mysql/0002-use-new-readline-iface.patch b/package/oracle-mysql/mysql/0002-use-new-readline-iface.patch
similarity index 100%
rename from package/mysql/0002-use-new-readline-iface.patch
rename to package/oracle-mysql/mysql/0002-use-new-readline-iface.patch
diff --git a/package/mysql/0003-ac_stack_direction-is-unset.patch b/package/oracle-mysql/mysql/0003-ac_stack_direction-is-unset.patch
similarity index 100%
rename from package/mysql/0003-ac_stack_direction-is-unset.patch
rename to package/oracle-mysql/mysql/0003-ac_stack_direction-is-unset.patch
diff --git a/package/mysql/0004-Fix-gen_lex_hash-execution.patch b/package/oracle-mysql/mysql/0004-Fix-gen_lex_hash-execution.patch
similarity index 100%
rename from package/mysql/0004-Fix-gen_lex_hash-execution.patch
rename to package/oracle-mysql/mysql/0004-Fix-gen_lex_hash-execution.patch
diff --git a/package/mysql/0005-bison_3_breaks_mysql_server_build.patch b/package/oracle-mysql/mysql/0005-bison_3_breaks_mysql_server_build.patch
similarity index 100%
rename from package/mysql/0005-bison_3_breaks_mysql_server_build.patch
rename to package/oracle-mysql/mysql/0005-bison_3_breaks_mysql_server_build.patch
diff --git a/package/mysql/0006-no-force-static-build.patch b/package/oracle-mysql/mysql/0006-no-force-static-build.patch
similarity index 100%
rename from package/mysql/0006-no-force-static-build.patch
rename to package/oracle-mysql/mysql/0006-no-force-static-build.patch
diff --git a/package/mysql/Config.in b/package/oracle-mysql/mysql/Config.in
similarity index 100%
rename from package/mysql/Config.in
rename to package/oracle-mysql/mysql/Config.in
diff --git a/package/mysql/S97mysqld b/package/oracle-mysql/mysql/S97mysqld
similarity index 100%
rename from package/mysql/S97mysqld
rename to package/oracle-mysql/mysql/S97mysqld
diff --git a/package/mysql/mysql.hash b/package/oracle-mysql/mysql/mysql.hash
similarity index 100%
rename from package/mysql/mysql.hash
rename to package/oracle-mysql/mysql/mysql.hash
diff --git a/package/mysql/mysql.mk b/package/oracle-mysql/mysql/mysql.mk
similarity index 100%
rename from package/mysql/mysql.mk
rename to package/oracle-mysql/mysql/mysql.mk
diff --git a/package/mysql/mysqld.service b/package/oracle-mysql/mysql/mysqld.service
similarity index 100%
rename from package/mysql/mysqld.service
rename to package/oracle-mysql/mysql/mysqld.service
-- 
1.9.1
