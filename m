From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Feb 2014 16:41:56 +0100
Subject: [Buildroot] [PATCH 0/2] MySQL debug fix, and Mysql server on target
Message-ID: <cover.1391528463.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a consolidated series aboiut the MySQL changes.

Thanks to all involved in the initial patches! :-)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Marcelo Guti?rrez (1):
      package/mysql: fix debugging options

Marcelo Guti?rrez(UTN/FRH) (1):
      mysql: add option to build the server

 package/mysql/Config.in                            |  9 ++++
 .../mysql-0003-ac_stack_direction-is-unset.patch   | 15 ++++++
 .../mysql-0004-Fix-gen_lex_hash-execution.patch    | 32 ++++++++++++
 package/mysql/mysql.mk                             | 57 ++++++++++++++++++++--
 4 files changed, 110 insertions(+), 3 deletions(-)
 create mode 100644 package/mysql/mysql-0003-ac_stack_direction-is-unset.patch
 create mode 100644 package/mysql/mysql-0004-Fix-gen_lex_hash-execution.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
