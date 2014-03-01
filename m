From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:47:17 +0100
Subject: [Buildroot] [git commit] bash: bump to version 4.3
Message-ID: <20140301134729.9F4E89BA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f5061a02df6e2c8166840241fa29c9ca52354f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to external readline support to potentially reduce target size.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/Config.in                             |    1 +
 ...cross.patch => bash-000-mkbuiltins-cross.patch} |    0
 package/bash/bash-4.2-001.patch                    |   78 ---
 package/bash/bash-4.2-002.patch                    |   60 ---
 package/bash/bash-4.2-003.patch                    |  318 ------------
 package/bash/bash-4.2-004.patch                    |   53 --
 package/bash/bash-4.2-005.patch                    |  131 -----
 package/bash/bash-4.2-006.patch                    |   46 --
 package/bash/bash-4.2-007.patch                    |   46 --
 package/bash/bash-4.2-008.patch                    |   74 ---
 package/bash/bash-4.2-009.patch                    |   82 ---
 package/bash/bash-4.2-010.patch                    |   61 ---
 package/bash/bash-4.2-011.patch                    |   46 --
 package/bash/bash-4.2-012.patch                    |  151 ------
 package/bash/bash-4.2-013.patch                    |   52 --
 package/bash/bash-4.2-014.patch                    |   47 --
 package/bash/bash-4.2-015.patch                    |   81 ---
 package/bash/bash-4.2-016.patch                    |   46 --
 package/bash/bash-4.2-017.patch                    |   47 --
 package/bash/bash-4.2-018.patch                    |   74 ---
 package/bash/bash-4.2-019.patch                    |   47 --
 package/bash/bash-4.2-020.patch                    |   60 ---
 package/bash/bash-4.2-021.patch                    |   61 ---
 package/bash/bash-4.2-022.patch                    |   61 ---
 package/bash/bash-4.2-023.patch                    |   62 ---
 package/bash/bash-4.2-024.patch                    |   45 --
 package/bash/bash-4.2-025.patch                    |  143 ------
 package/bash/bash-4.2-026.patch                    |   58 ---
 package/bash/bash-4.2-027.patch                    |   47 --
 package/bash/bash-4.2-028.patch                    |   52 --
 package/bash/bash-4.2-029.patch                    |  524 --------------------
 package/bash/bash-4.2-030.patch                    |  178 -------
 package/bash/bash-4.2-031.patch                    |   80 ---
 package/bash/bash-4.2-032.patch                    |   75 ---
 package/bash/bash-4.2-033.patch                    |   57 ---
 package/bash/bash-4.2-034.patch                    |   46 --
 package/bash/bash-4.2-035.patch                    |   66 ---
 package/bash/bash-4.2-036.patch                    |   92 ----
 package/bash/bash-4.2-037.patch                    |  112 -----
 package/bash/bash.mk                               |   16 +-
 40 files changed, 10 insertions(+), 3366 deletions(-)

Patch is too large, so refusing to show it
