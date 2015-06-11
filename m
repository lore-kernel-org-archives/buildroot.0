From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jun 2015 22:10:01 +0200
Subject: [Buildroot] [git commit] support: update Kconfiglib to the latest
	version
Message-ID: <20150611201229.9BFCA817B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00cc2431701929728df5b616f2e51268053cfd2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Corresponds to a95f477 in https://github.com/ulfalizer/Kconfiglib.

Fixes:

 - Unset user values when loading a zero-byte .config. (5e54e2c)

 - Ignore indented .config assignments. (f8a7510)

 - Do not require $srctree to be set for non-kernel projects. (d56e9c1)

 - Allow digits in $-references to symbols. (ecacdd5)

 - Add Symbol.is_allnoconfig_y(). (deaa624)

 - Fix small output issue with Comments inside Choices.

Also adds Python 3 support and has a lot of internal cleanup and
optimization.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/kconfiglib.py     | 2225 +++++++++++++++++--------------------
 support/scripts/readme.kconfiglib |    2 +-
 2 files changed, 998 insertions(+), 1229 deletions(-)

Patch is too large, so refusing to show it
