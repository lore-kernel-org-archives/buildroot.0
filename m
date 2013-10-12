From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Oct 2013 00:46:14 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch yem/misc
Message-ID: <cover.1381617928.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here is a small series to clean up rpi-userland wrt .pc files.

Regards,
Yann E. MORIN.


Changes v1 -> v2:
  - remove bundled bcm_host.pc


The following changes since commit 9f7e8f120dfeddd8b49eb4d232253cc3f9ac8efa:

  package/weston: add RPi compositor (2013-10-11 08:56:53 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc

for you to fetch changes up to 843868f55c7fddce02d5cd45525fe36bbbca5e76:

  package/rpi-userland: expose appropriate EGL version (2013-10-13 00:30:40 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/rpi-userland: install all of our .pc files the same way
      package/rpi-userland: expose appropriate EGL version

 package/rpi-userland/bcm_host.pc                   | 11 -------
 .../rpi-userland-000-add-pkgconfig-files.patch     | 34 ++++++++++++++++++++--
 package/rpi-userland/rpi-userland.mk               |  6 ----
 3 files changed, 31 insertions(+), 20 deletions(-)
 delete mode 100644 package/rpi-userland/bcm_host.pc

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
