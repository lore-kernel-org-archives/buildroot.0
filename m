From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 18:57:40 +0100
Subject: [Buildroot] [PATCH 0/2] Misc patches (branch yem/pw2)
Message-ID: <cover.1422208637.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Two patches initially by David, with some cleanups.

Regards,
Yann E. MORIN.


The following changes since commit c1f4413de6ec4f1484a5111b5c7aa98dd400d56e:

  docs: fixup the website symlink (2015-01-25 15:30:08 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/pw2

for you to fetch changes up to 107e8470c800b7f83b91795000895086302f385b:

  cgic: new package (2015-01-25 18:56:50 +0100)

----------------------------------------------------------------
David Bender (2):
      benejson: new package
      cgic: new package

 package/Config.in                                  |  2 +
 package/benejson/Config.in                         | 11 +++++
 package/benejson/benejson.hash                     |  2 +
 package/benejson/benejson.mk                       | 52 ++++++++++++++++++++
 package/cgic/0001-prepare_makefile.patch           | 44 +++++++++++++++++
 package/cgic/0002-file_enhancements.patch          | 56 ++++++++++++++++++++++
 .../0003-restore-cgiFormFileGetTempfileName.patch  | 43 +++++++++++++++++
 package/cgic/Config.in                             |  6 +++
 package/cgic/cgic.hash                             |  2 +
 package/cgic/cgic.mk                               | 25 ++++++++++
 10 files changed, 243 insertions(+)
 create mode 100644 package/benejson/Config.in
 create mode 100644 package/benejson/benejson.hash
 create mode 100644 package/benejson/benejson.mk
 create mode 100644 package/cgic/0001-prepare_makefile.patch
 create mode 100644 package/cgic/0002-file_enhancements.patch
 create mode 100644 package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
 create mode 100644 package/cgic/Config.in
 create mode 100644 package/cgic/cgic.hash
 create mode 100644 package/cgic/cgic.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
