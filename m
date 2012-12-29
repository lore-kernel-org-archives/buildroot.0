From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 20:22:23 +0200
Subject: [Buildroot] [PATCH v2] mesa3d: bumped to 8.0.5
Message-ID: <1356805344-1060-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Merged and fixed version of mesa3d 8.0.5 patch, as suggested by
Thomas Petazzoni.

Changes from previous patch set:

- Merged all individual patches to one big patch.
- Added MESA3D_LICENSE and MESA3D_LICENSE_FILES.
- Removed mesa3d-0002-crosscompile.patch and mesa3d-0003-fix-for-x32.patch
  (caused conflicts with default builroot building and compiled fine without them)
- Added description to mesa3d-execinfo.patch
