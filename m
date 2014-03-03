From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 23:13:18 +0100
Subject: [Buildroot] [git commit] mysql: add option to build the server
Message-ID: <20140303223229.5B0E39BC8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7aa61c6f93981c94bafc4cc98bf7788c5c08a68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcelo Gutierrez (UTN/FRH) <kuyurix@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/Config.in                            |    9 +
 .../mysql-0003-ac_stack_direction-is-unset.patch   |   15 +
 .../mysql-0004-Fix-gen_lex_hash-execution.patch    |   32 +
 ...ql-0005-bison_3_breaks_mysql_server_build.patch | 3310 ++++++++++++++++++++
 package/mysql/mysql.mk                             |   46 +-
 5 files changed, 3411 insertions(+), 1 deletions(-)

Patch is too large, so refusing to show it
