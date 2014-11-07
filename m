From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 19:32:00 +0100
Subject: [Buildroot] [git commit] bash: switch to release tarball
Message-ID: <20141107183324.33832B2DF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e97171db813b49bad3cb2e115b5d598a0a33909c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Yay!
The release tarball allows us to drop sizable in-tree patches, so switch
to it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bash/bash-000-mkbuiltins-cross.patch |   31 -
 package/bash/bash-001-patchlevel1-27.patch   | 1072 ------------
 package/bash/bash-002-patchlevel28.patch     | 2270 --------------------------
 package/bash/bash-003-patchlevel29.patch     |   64 -
 package/bash/bash-004-patchlevel30.patch     | 2069 -----------------------
 package/bash/bash.hash                       |    2 +-
 package/bash/bash.mk                         |    2 +-
 7 files changed, 2 insertions(+), 5508 deletions(-)

Patch is too large, so refusing to show it
