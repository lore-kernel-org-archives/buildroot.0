From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2014 01:03:22 +0100
Subject: [Buildroot] [PATCH 0/2] XBMC: add some PVR addons (branch yem/xbmc)
Message-ID: <cover.1395964863.git.yann.morin.1998@free.fr>
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

Regards,
Yann E. MORIN.


The following changes since commit 9cfd429c1c3d6c7b793f58210f39bb041e680bac:

  xbmc: Add comment for host-sdl_images dependency (2014-03-27 23:48:56 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/xbmc

for you to fetch changes up to 86a99e1a5318e92348b2c6788fd87dd6d7f9f290:

  pacage/xbmc-addon-xvdr: new package (2014-03-28 00:52:18 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/xbmc-pvr-addons: new package
      pacage/xbmc-addon-xvdr: new package

 package/xbmc-addon-xvdr/Config.in                  | 14 +++++++++
 .../xbmc-addon-xvdr-0001-foreign-automake.patch    | 25 ++++++++++++++++
 package/xbmc-addon-xvdr/xbmc-addon-xvdr.mk         | 25 ++++++++++++++++
 package/xbmc-pvr-addons/Config.in                  |  6 ++++
 package/xbmc-pvr-addons/xbmc-pvr-addons.mk         | 34 ++++++++++++++++++++++
 package/xbmc/Config.in                             |  7 ++++-
 6 files changed, 110 insertions(+), 1 deletion(-)
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
