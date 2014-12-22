From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Dec 2014 01:00:02 +0100
Subject: [Buildroot] [PATCH 0/2] mysql: fix shared-only builds (branch
	yem/fixes)
Message-ID: <cover.1419206325.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes builds of mysql in a shared-only build.

The first patch is just a rename of patches to the new naming scheme,
and the second patch eventually introduces the actual fix.

Regards,
Yann E. MORIN.


The following changes since commit aa36fc34612fcf221e3076fdcb4a39c83c0c397b:

  pinentry: remove non-existent configure options for Qt3 and GTK+1 (2014-12-21 23:49:13 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/fixes

for you to fetch changes up to 50cf5f364ad786ec508c78609467cbcef6b7bd86:

  package/mysql: do not force a static build for internal programs (2014-12-22 00:16:58 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/mysql: rename patches to the new convention
      package/mysql: do not force a static build for internal programs

 ...-ac_cache_check.patch => 0000-ac_cache_check.patch} |  0
 ...check.patch => 0001-configure-ps-cache-check.patch} |  0
 ...e-iface.patch => 0002-use-new-readline-iface.patch} |  0
 ...et.patch => 0003-ac_stack_direction-is-unset.patch} |  0
 ...ion.patch => 0004-Fix-gen_lex_hash-execution.patch} |  0
 ...ch => 0005-bison_3_breaks_mysql_server_build.patch} |  0
 package/mysql/0006-no-force-static-build.patch         | 18 ++++++++++++++++++
 7 files changed, 18 insertions(+)
 rename package/mysql/{mysql-0000-ac_cache_check.patch => 0000-ac_cache_check.patch} (100%)
 rename package/mysql/{mysql-0001-configure-ps-cache-check.patch => 0001-configure-ps-cache-check.patch} (100%)
 rename package/mysql/{mysql-0002-use-new-readline-iface.patch => 0002-use-new-readline-iface.patch} (100%)
 rename package/mysql/{mysql-0003-ac_stack_direction-is-unset.patch => 0003-ac_stack_direction-is-unset.patch} (100%)
 rename package/mysql/{mysql-0004-Fix-gen_lex_hash-execution.patch => 0004-Fix-gen_lex_hash-execution.patch} (100%)
 rename package/mysql/{mysql-0005-bison_3_breaks_mysql_server_build.patch => 0005-bison_3_breaks_mysql_server_build.patch} (100%)
 create mode 100644 package/mysql/0006-no-force-static-build.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
