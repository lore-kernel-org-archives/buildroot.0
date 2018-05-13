From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 May 2018 12:34:35 +0200
Subject: [Buildroot] [PATCH 0/2] package/jamvm: fix build on MIPS
Message-ID: <cover.1526207669.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series restricts on what MIPS variants jamvm may build.


Regards,
Yann E. MORIN.


The following changes since commit e7f72298a6c88b42a996962027f4f83a07713f26

  DEVELOPERS: Add myself to support/kconfig/ (2018-05-12 09:01:40 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 048871f6b7e29e9d485e8ba33e2bf374eac24bc4

  package/jamvm: restrict on what MIPS procs are allowed (2018-05-13 12:32:35 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/jamvm: move arch dependency to a symbol
      package/jamvm: restrict on what MIPS procs are allowed

 package/jamvm/Config.in | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
