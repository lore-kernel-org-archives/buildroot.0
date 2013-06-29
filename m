From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Jun 2013 00:38:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-updates
Message-ID: <cover.1372545265.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This two-patch series adds some cosmetics to the legacy menu.

The first patch displays the removal date in the menuconfig, to show
the user how old the legacy options he's using are.

The second patch adds to the top-level comment, that legacy options
will be removed at some point in the future, and that non-updated
.config files may fail to build, or run, in unpredictable ways.

If we do not intend to remove legacy options, let's just drop patch #2,
of course.

Regards,
Yann E. MORIN.


The following changes since commit fc034397fc5c85115a7cc29b8dcc6738a1f8cdc3:

  openvpn: define license (2013-06-28 21:47:43 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to 0e43364c4b19cbab8f8297f38ab009475beba3d6:

  legacy: make it clear legacy options will be removed at some point (2013-06-30 00:28:49 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      legacy: print removal date in menuconfig
      legacy: make it clear legacy options will be removed at some point

 Config.in.legacy | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
