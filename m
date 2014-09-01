From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:44:31 +0200
Subject: [Buildroot] [PATCH 0/4] fs/ext2: misc enhancements (branch
	yem/fs-vol-id)
Message-ID: <cover.1409579021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series enhances the fs/ext2 generation.
Not much to say beside the individual commit logs... ;-)

Regards,
Yann E. MORIN.


The following changes since commit fcd720dfcf702d796fbc625b9abc4c06cb848d84:

  Update for 2014.08 (2014-09-01 13:20:56 +0200)

are available in the git repository at:

  git://ymorin.is-a-geek.org/buildroot yem/fs-vol-id

for you to fetch changes up to aef27eee3aa358ec0d07fd0e2a437a0f16a3b4b2:

  fs/ext2: add support for specifying UUID (2014-09-01 14:28:12 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      fs/ext2: enhance option parsing in our genext2fs wrapper
      fs/ext2: pass the ext GEN and REV as options
      fs/ext2: add option to specify a filesystem label
      fs/ext2: add support for specifying UUID

 fs/ext2/Config.in    |  3 +++
 fs/ext2/ext2.mk      | 11 ++++++-----
 fs/ext2/genext2fs.sh | 43 +++++++++++++++++++++++++++++++++++++------
 3 files changed, 46 insertions(+), 11 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
