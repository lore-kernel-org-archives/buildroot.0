From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jul 2015 23:54:39 +0200
Subject: [Buildroot] [PATCH 0/5 v10] OpenCV bump (branch yem/smartin/opencv)
Message-ID: <cover.1436132995.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Yet another round for the bump of OpenCV package from Samuel, with the
remaining patches touching the GUI toolkit support.

Patches 1 and 2 preapres for addign more GUI tookits.
Patches 3 and 4 adds new tookits.
Patch 5 adds OpenGL support.


Changes v9 -> v10:
  - split a patch in two
  - tweak some commit logs
  - fix extra dependencies


Regards,
Yann E. MORIN.


The following changes since commit ff89e1eb0cdb8ebe9cbd2cf944f43ed132afcb17:

  wine: fix sane related build failure (2015-07-05 17:16:40 +0200)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/smartin/opencv

for you to fetch changes up to 582a50073ade12575a280f6aea96095597f61759:

  package/opencv: add opengl support (2015-07-05 23:49:16 +0200)

----------------------------------------------------------------
Samuel Martin (5):
      package/opencv: add a choice for selecting the gui toolkit
      package/opencv: depends on GUI toolkits, rather than select them
      package/opencv: add qt5 support
      package/opencv: add gtk3 support
      package/opencv: add opengl support

 package/opencv/Config.in | 99 +++++++++++++++++++++++++++++++++++++-----------
 package/opencv/opencv.mk | 29 ++++++++++++--
 2 files changed, 101 insertions(+), 27 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
