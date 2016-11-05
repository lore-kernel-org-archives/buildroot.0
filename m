From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri,  4 Nov 2016 23:55:48 -0400
Subject: [Buildroot] pseudo: fix build for python3 based distros
Message-ID: <20161105035549.18698-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch brings the support for python3 to pseudo, and it remains compatible
with python2 (to keep compatibility).

The patches has been tested on BR and the generated C files (.h and .c) are
identical for those three cases:
 - original source using python2,
 - patched source using python2, and
 - patched source using python3.

Damien Riegel and Alexandre Leblanc helped me to for the last patch because my
knowledge in python are basics.

PS: Those patches are also been sent to the maintainer (Peter Seebach in CC).

Regards,
Ga?l

Ga?l PORTAY (1):
  pseudo: fix build for python3 based distros

 .../0001-Fix-mixed-tab-space-indentation.patch     | 105 ++++++++++
 .../0002-Fix-missing-parentheses-at-print.patch    | 190 ++++++++++++++++++
 .../0003-Make-it-compatible-with-python3.patch     | 215 +++++++++++++++++++++
 3 files changed, 510 insertions(+)
 create mode 100644 package/pseudo/0001-Fix-mixed-tab-space-indentation.patch
 create mode 100644 package/pseudo/0002-Fix-missing-parentheses-at-print.patch
 create mode 100644 package/pseudo/0003-Make-it-compatible-with-python3.patch

-- 
2.10.1
