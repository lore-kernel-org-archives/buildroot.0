From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  1 Dec 2017 16:09:41 +0100
Subject: [Buildroot] [PATCH 0/3] infra/pkg-config: fix updating back
 (def)config files
Message-ID: <cover.1512140974.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

As reported by a newbie or IRC, saving back the (def)config files is
buggy when the path provided by the user points to a diurectory instead
of a (existing or not) file.

This small series, after comonalising the updateing code, fixes that
bug.


Regards,
Yann E. MORIN.


The following changes since commit 57dcad243e6daefefbe21109e1fc97272053a7a0

  Kickoff 2018.02 cycle (2017-12-01 10:31:43 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to d2b584aa49a8597e975fcc4dfe4b568011798318

  infra/pkg-kconfig: do not update-(def)config to a directory (2017-12-01 15:38:56 +0100)


----------------------------------------------------------------
Yann E. MORIN (3):
      infra/pkg-kconfig: comonalise update-(def)config code
      infra/pkg-config: hide away non-critical commands
      infra/pkg-kconfig: do not update-(def)config to a directory

 package/pkg-kconfig.mk | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
