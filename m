From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:00:30 +0100
Subject: [Buildroot] [PATCH 0/2 v2] package/jackd: choose mode of operation,
	comment celt and eigen (branch yem/adopted)
Message-ID: <cover.1457719085.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This short series adds the possibility to choose what mode to operate
jackd in (initially provided by Antoine, rebased and updated by me), as
well as add comments on why we do not have a dependency on celt and
eigen.


Changes v1 -> v2:
  - drop the eigen dependency, comment it  (Thomas)


Regards,
Yann E. MORIN.


The following changes since commit 0b7b84310c3781c346eea4c114c8cb4e97bbd8ea:

  olimex_imx233_olinuxino_defconfig: genimage support (2016-03-11 13:14:54 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/adopted

for you to fetch changes up to dc794aba76e931a0c7bb974016708c51b77d3f6b:

  package/jack2: add comment about celt and eigen (2016-03-11 18:11:35 +0100)

----------------------------------------------------------------
Antoine T?nart (1):
      jack2: allow to choose the mode to operate jackd

Yann E. MORIN (1):
      package/jack2: add comment about celt and eigen

 package/jack2/Config.in | 26 ++++++++++++++++++++++++++
 package/jack2/jack2.mk  | 23 +++++++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
