From: Mario Mintel <mariomintel@gmail.com>
Date: Thu, 28 May 2020 16:43:31 +0200
Subject: [Buildroot] [PATCH 0/2] Extend Jailhouse package with custom repo
 option
Message-ID: <20200528144333.49268-1-mariomintel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for resending but this email wasn't subscribed to the buildroot
mailing list hence the last one was automatically rejected.
This Patch extends the Jailhouse package with the option to specify a
custom repository. This adds more flexibility for customs
configurations. While at it I also bumped the version from 0.11 to 0.12.

Mario Mintel (2):
  package/jailhouse: bump version to 0.12
  package/jailhouse: add option to choose custom repo/branch

 package/jailhouse/Config.in      | 36 ++++++++++++++++++++++++++++++--
 package/jailhouse/jailhouse.hash |  2 +-
 package/jailhouse/jailhouse.mk   | 17 +++++++++++++--
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.26.1
