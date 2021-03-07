From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun,  7 Mar 2021 14:25:32 -0800
Subject: [Buildroot] [PATCH 0/4] mender updates
Message-ID: <20210307222536.2743089-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

The upstream developers asked me to update the mender packages as a favor, as
they are pretty outdated right now.

This patch series includes updates to all of the mender packages and a small
change that removes auto-selecting uboot-tools if uboot is selected in
mender/Config.in (the patch itself has an explination as to why.)

Adam Duskett (4):
  package/mender-artifact: bump to version 3.4.1
  package/mender: bump version to 2.4.2
  package/mender-grubenv: bump version to
    f39c2c7ec7c9c24aae0108a9b04a0e6e61a3e96b
  package/mender: Do not automatically select uboot tools if uboot is
    selected

 package/mender-artifact/mender-artifact.hash |  7 ++++---
 package/mender-artifact/mender-artifact.mk   |  5 +++--
 package/mender-grubenv/mender-grubenv.hash   |  4 ++--
 package/mender-grubenv/mender-grubenv.mk     |  4 ++--
 package/mender/Config.in                     | 15 +++++++++++++--
 package/mender/mender.hash                   | 16 +++++++++-------
 package/mender/mender.mk                     | 13 ++++++++-----
 7 files changed, 41 insertions(+), 23 deletions(-)

-- 
2.25.1
