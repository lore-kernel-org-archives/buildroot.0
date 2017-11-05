From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Nov 2017 19:46:44 +0100
Subject: [Buildroot] [PATCH 0/2] package/freerdp: fix fallout after version
 bump
Message-ID: <cover.1509907598.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Add two patches to fix FreeRDP dependencies:

  - pkg-config is now used for more than gstreamer-0.x, so make it a
    mandatory dependency,

  - FreeRDP can now log to systemd's journald, so add proper dependency
    and options


Regards,
Yann E. MORIN.


The following changes since commit 3253c6fa4573307ec1631f3b34856b1daec9d1e1

  package/mesa3d: remove old patch for uClibc (2017-11-05 17:57:10 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c

  package/freerdp: always uses pkg-config (2017-11-05 19:45:15 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/freerdp: optional systemd's journald support
      package/freerdp: always uses pkg-config

 package/freerdp/freerdp.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
