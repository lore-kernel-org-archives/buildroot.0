From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2015 19:43:16 +0200
Subject: [Buildroot] [PATCH 0/2] package/nodejs: security bump (branch
	yem/nodejs)
Message-ID: <cover.1436118128.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series fixes two things in nodejs:
  - drop the minor version from kconfig symbols, so we can update
    seamlessly without adding legacy handling,
  - security-bump the 0.12.x version.

Regards,
Yann E. MORIN.


The following changes since commit ff89e1eb0cdb8ebe9cbd2cf944f43ed132afcb17:

  wine: fix sane related build failure (2015-07-05 17:16:40 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/nodejs

for you to fetch changes up to 7521a4379f6888a5f5269441914ecd71fc5b1560:

  package/nodejs: security bump (2015-07-05 19:40:36 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/nodejs: drop minor version in Config.in
      package/nodejs: security bump

 .../0001-Remove-dependency-on-Python-bz2-module.patch      |  0
 .../0002-gyp-force-link-command-to-use-CXX.patch           |  0
 ...se-a-python-variable-instead-of-hardcoding-Python.patch |  0
 .../0004-fix-build-error-without-OpenSSL-support.patch     |  0
 package/nodejs/Config.in                                   | 14 +++++++-------
 package/nodejs/nodejs.hash                                 |  4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)
 rename package/nodejs/{0.12.5 => 0.12.6}/0001-Remove-dependency-on-Python-bz2-module.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0003-Use-a-python-variable-instead-of-hardcoding-Python.patch (100%)
 rename package/nodejs/{0.12.5 => 0.12.6}/0004-fix-build-error-without-OpenSSL-support.patch (100%)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
