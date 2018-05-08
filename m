From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 May 2018 15:41:59 +0200
Subject: [Buildroot] [PATCH 0/2] package/attr,acl: fix installation
Message-ID: <cover.1525786905.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Fixes bug #10986.

Regards,
Yann E. MORIN.


The following changes since commit ba33728bc3118a6f1d2b4233e7bddb17b2f67f1f

  uclibc: fix clock_nanosleep declaration (2018-05-06 23:19:14 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8b860ca93d0672e9d84d2321027f425fce34181d

  package/ac: fix install (2018-05-08 15:38:25 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/attr: fix install
      package/ac: fix install

 ...-all-use-install-1-to-install-executables.patch | 67 ++++++++++++++++++++++
 ...-all-use-install-1-to-install-executables.patch | 67 ++++++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 package/acl/0003-all-use-install-1-to-install-executables.patch
 create mode 100644 package/attr/0004-all-use-install-1-to-install-executables.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
