From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 22:49:40 +0200
Subject: [Buildroot] [git commit] package/opencv3: fix build for x86_64
	target
Message-ID: <20170511204957.3BC3B8285F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86666f3a21a2380e19b5f0de90b6b6329ce3de53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change backports a fix from upstream fixing missing symbols due to
wrong compiler optimization flags.

On Buildroot side, also remove deprecated options passed on the
configure command.

Fixes:
  http://autobuild.buildroot.net/results/af950c6172a578c4eeeb9440b6990ceb48263fa6/
  http://autobuild.buildroot.net/results/e8832302cd4f30cec076f67965f6aacbaca5b955/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-cmake-support-multiple-CPU-targets.patch  | 2499 ++++++++++++++++++++
 package/opencv3/opencv3.mk                         |   16 +-
 2 files changed, 2500 insertions(+), 15 deletions(-)

Patch is too large, so refusing to show it
