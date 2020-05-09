From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 May 2020 13:00:36 +0200
Subject: [Buildroot] [PATCH 0/3] support/gnucomnfig: update (branch
 yem/gnuconfig)
Message-ID: <cover.1589022016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series updated our bundled copy of the GNU config scripts.
The crux of this series is not the update per-se, but rather adding a
script to do the update automatically, to avoid having a stray reference
to the upstream sha1.


Regards,
Yann E. MORIN.


The following changes since commit 7f59e2c01a78c99c933df49ee681cdd3e11f4b07

  package/matchbox: add hash for license file (2020-05-08 22:02:49 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0c4bc29d6423a6791afcf37fa05d27f855247355

  support/gnuconfig: update (2020-05-09 10:17:04 +0200)


----------------------------------------------------------------
Yann E. MORIN (3):
      support/gnuconfig: reference the correct sha1 we're using
      support/gnuconfig: add update script
      support/gnuconfig: update

 support/gnuconfig/README.buildroot | 14 ++-----
 support/gnuconfig/config.guess     | 80 +++++++++++++++++++++++---------------
 support/gnuconfig/config.sub       | 37 ++++++++----------
 support/gnuconfig/update           | 14 +++++++
 4 files changed, 82 insertions(+), 63 deletions(-)
 create mode 100755 support/gnuconfig/update

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
