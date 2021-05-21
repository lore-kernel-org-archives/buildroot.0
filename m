From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 16:44:33 +0200
Subject: [Buildroot] [PATCH 0/2] package/lvm2: fix installation (branch
 yem/lvm2-fixes)
Message-ID: <cover.1621608266.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This small series cleans up the installation of lvm2 after the recent
version bump.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      package/lvm2: fix inverted logic that is confusing
      package/lvm2: fix installation of systemd units

 package/lvm2/lvm2.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
