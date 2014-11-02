From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Nov 2014 16:25:52 +0100
Subject: [Buildroot] [PATCH 0/5] github and patches updates in the manual
	(branch yem/manual)
Message-ID: <cover.1414941796.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series, intended to go in before -rc1:

  - clarifies the manual about what hashes are meaningful
  - clarifies the manual about when to add hashes for GitHub-hosted tarballs
  - removes hashes from two packages downloaded from GitHub
  - updates the patch naming convention

Regards,
Yann E. MORIN.


The following changes since commit a0b5052e9dec110903e1887e17bca314df228bb4:

  sunxi-boards: bump version (2014-11-01 23:28:06 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/manual

for you to fetch changes up to 0b36850cf518809b83d4e21b81b0bc974c847199:

  docs/manual: document the new patch naming convention (2014-11-02 15:35:47 +0100)

----------------------------------------------------------------
Maxime Hadjinlian (3):
      manual: Add notes about GitHub and hashes
      opencv: Remove hash file
      libevent: Remove hash file

Yann E. MORIN (2):
      docs/manual: also document md5 hash
      docs/manual: document the new patch naming convention

 docs/manual/adding-packages-directory.txt | 40 +++++++++++++++++++++----------
 docs/manual/patch-policy.txt              | 21 ++++++++++------
 package/libevent/libevent.hash            |  2 --
 package/opencv/opencv.hash                |  3 ---
 4 files changed, 42 insertions(+), 24 deletions(-)
 delete mode 100644 package/libevent/libevent.hash
 delete mode 100644 package/opencv/opencv.hash

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
