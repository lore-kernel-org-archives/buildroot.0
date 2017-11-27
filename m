From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Nov 2017 14:30:45 +0100
Subject: [Buildroot] [PATCH 0/2] package/asterisk: fix parallel build/install
Message-ID: <cover.1511789437.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series adds a patch to asterisk to fix an autobuild issue in
highly-parallel install.

It also adds me to DEVELOPPERS for the recent packages I've introduced
to support asterisk.


Regards,
Yann E. MORIN.


The following changes since commit c8f0a823efdb3f195c475194dc7b3341502819c0

  linux-headers: bump 3.2.x series (2017-11-27 09:25:46 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 77a465b5afe27dd09b5b3ec5a4e9069b24f00a5e

  package/asterisk: fix parallel build/install (2017-11-27 13:09:42 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      DEVELOPERS: adopt the packages I recently added
      package/asterisk: fix parallel build/install

 DEVELOPERS                                         |  5 ++++
 ...nsure-target-directory-for-modules-exists.patch | 32 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 package/asterisk/0005-build-ensure-target-directory-for-modules-exists.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
