From: Geoff Levand <geoff@infradead.org>
Date: Mon, 27 Apr 2020 16:09:32 +0000
Subject: [Buildroot] [PATCH v1 0/2] Package updates; flannel, kexec
Message-ID: <cover.1588003514.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit 080f4251adef7594e5b17f43e75551f9f821300b:

  package/webkitgtk: security bump to version 2.28.2 (2020-04-26 22:19:02 +0200)

are available in the Git repository at:

  https://github.com/glevand/petitboot--buildroot.git for-merge-package-updates

for you to fetch changes up to e4d06c38e72920cfeae2209fa4edc0f7acb74017:

  package/flannel: bump version to 0.12.0 (2020-04-27 08:53:18 -0700)

----------------------------------------------------------------
Geoff Levand (2):
      package/kexec: bump version to 2.0.20
      package/flannel: bump version to 0.12.0

 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 2 +-
 package/kexec/kexec.hash     | 2 +-
 package/kexec/kexec.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.20.1
