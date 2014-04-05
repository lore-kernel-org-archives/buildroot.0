From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 19:33:05 +0200
Subject: [Buildroot] [PATCH 0/2 v2] XBMC: add some PVR addons (branch
	yem/xbmc)
Message-ID: <cover.1396719130.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

As a complement to our shinny new XBMC package, here are the PVR
addons packaged, too.

    And they drank, ate, danced the night-long.
    And all rejoiced, and there was felicity.

Changes v1 -> v2:
  - fix typoes  (Maxime)
  - add pointer to patch applied upstream  (Maxime)


Regards,
Yann E. MORIN.


The following changes since commit 455a354c960f686c2ae9654ae0112fdc31bec686:

  virtual-package: fake a version string for virtual packages (2014-04-05 19:21:15 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/xbmc

for you to fetch changes up to 8ae0abc237b2226c537597eeea513d1808472472:

  pacage/xbmc-addon-xvdr: new package (2014-04-05 19:30:56 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/xbmc-pvr-addons: new package
      pacage/xbmc-addon-xvdr: new package

 package/xbmc-addon-xvdr/Config.in                  | 14 +++++++++
 .../xbmc-addon-xvdr-0001-foreign-automake.patch    | 28 ++++++++++++++++++
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         | 25 ++++++++++++++++
 package/xbmc-pvr-addons/Config.in                  |  6 ++++
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         | 34 ++++++++++++++++++++++
 package/xbmc/Config.in                             |  7 ++++-
 6 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 package/xbmc-addon-xvdr/Config.in
 create mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr-0001-foreign-automake.patch
 create mode 100644 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk
 create mode 100644 package/xbmc-pvr-addons/Config.in
 create mode 100644 package/xbmc-pvr-addons/xbmc-pvr-addons.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
