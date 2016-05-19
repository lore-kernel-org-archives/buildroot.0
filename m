From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:25:02 +0000
Subject: [Buildroot] [PATCH v2 0/6] Fixes for go language support
Message-ID: <cover.1463696454.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series includes a number of fixup for the go language support.  All the
buildbot problems pointed out by Thomas [1] should be resolved by this series.

As requested, I pulled out the enhancment patches to post as a seperate
series [2].  Please consider all patches in this series to apply to master.

[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159336.html
[2] https://github.com/glevand/buildroot--buildroot/tree/for-merge-go-enhancements

-Geoff

The following changes since commit 3f3342a581970977f28620f17391d8aaf2204fec:

  Update for 2016.05-rc2 (2016-05-17 16:11:24 +0200)

are available in the git repository at:

  git at github.com:glevand/buildroot--buildroot.git for-merge-go-fixes

for you to fetch changes up to ec83a5927025fc759d5bfc26ee01aabde3658a7c:

  package/go: Set file timestamp (2016-05-19 15:17:20 -0700)

----------------------------------------------------------------
Geoff Levand (6):
      package/go: Build host tools with host CC
      package/go: Add HOST_GO_TARGET_ENV
      package/flannel: Use HOST_GO_TARGET_ENV
      package/go: Add HOST_GO_CGO_ENABLED
      package/flannel: Add BR2_TOOLCHAIN_HAS_THREADS
      package/go: Set file timestamp

 package/flannel/Config.in  |  4 +++
 package/flannel/flannel.mk |  2 +-
 package/go/go.mk           | 66 ++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 66 insertions(+), 6 deletions(-)

-- 
2.5.0
