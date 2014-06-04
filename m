From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  4 Jun 2014 13:14:06 +0200
Subject: [Buildroot] [PATCH v5 0/2] rpi-userland/xbmc fix
Message-ID: <1401880448-2496-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is a quick fix between rpi-useland and xbmc, which is originally
taken from the CMake infrastructure refactoring series (hence the v5).

Yours,
Samuel

Samuel Martin (2):
  xbmc: fix missing libraries from rpi-userland
  rpi-userland: cleanup *_CONF_OPT

 package/rpi-userland/rpi-userland.mk | 2 +-
 package/xbmc/xbmc.mk                 | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

--
1.9.2
