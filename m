From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 18:31:36 +0200
Subject: [Buildroot] [PATCH 0/2] XBMC enhancements (branch yem/misc-features)
Message-ID: <cover.1409588958.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Two small enhancements to XBMC:
  - wait for an X-server when needed
  - enable/disable the RSXS screen saver

Regards,
Yann E. MORIN.


The following changes since commit fcd720dfcf702d796fbc625b9abc4c06cb848d84:

  Update for 2014.08 (2014-09-01 13:20:56 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/misc-features

for you to fetch changes up to 698b2e4019db6d62c78b18c03e455fc08c65659c:

  package/xbmc: add option to enable RSXS screensaver (2014-09-01 14:28:17 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/xbmc: enhance startup script
      package/xbmc: add option to enable RSXS screensaver

 package/xbmc/Config.in |  9 +++++++++
 package/xbmc/S50xbmc   |  3 +--
 package/xbmc/br-xbmc   | 15 +++++++++++++--
 package/xbmc/xbmc.mk   | 14 ++++++++++++++
 4 files changed, 37 insertions(+), 4 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
