From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:41 +0100
Subject: [Buildroot] [PATCH 00/10] [reworked] Updating directfb and divine
Message-ID: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Hello,

after the reviewing of my previous patches by Thomas I have reworked
those patches. After some tests related to the dependencies of other
packages on directfb I expanded my patch series because of broken
dependencies by the newer directfb version.

The packages directfb-exambles and sawman are bumped to current versions
so the packages are buildable against the newer directfb version.
The Qt package I doesn't have tested.

I added new entrys into Config.in.legacy for the renamed BR2 variables.
Hopefully in the correct format.

If something is still wrong please let me know.

Regards
Carsten

Carsten Schoenert (10):
  directfb: bumping version to 1.6.3
  divine: bumping version to 1.6.3
  directfb: expanding the help strings
  directfb: fixing typo in variables
  Config.in.legacy: adding renamed BR2 Options
  directfb-examples: correcting indentation and expanding help text
  directfb-examples: bump to version 1.6.0
  directfb-exambles: adding new examples to the menu
  directfb-examples: adding license information
  sawman: bumping version to 1.6.3

 Config.in.legacy                               |   18 +++
 package/directfb-examples/Config.in            |  186 +++++++++++++++++-------
 package/directfb-examples/directfb-examples.mk |    6 +-
 package/directfb/Config.in                     |   15 +-
 package/directfb/directfb.mk                   |    8 +-
 package/divine/divine.mk                       |   11 +-
 package/sawman/sawman.mk                       |    2 +-
 7 files changed, 185 insertions(+), 61 deletions(-)

-- 
1.7.10.4
