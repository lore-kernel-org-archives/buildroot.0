From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 15:15:01 +0200
Subject: [Buildroot] [git commit] package/opencv3: bump version to 3.3.0
Message-ID: <20170924132001.47B6D80F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2160c7d0288d63c10c1d28a35bf6d591e48a0d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/opencv/opencv/commit/e16227b53cabab1caa4b7aba8ff59a630528348f

In-source-builds are not allowed anymore:
https://github.com/opencv/opencv/commit/a07d8a89b6b38b1a1f35ac808955dab97985becb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-cmake-support-multiple-CPU-targets.patch  | 2564 --------------------
 package/opencv3/opencv3.hash                       |    2 +-
 package/opencv3/opencv3.mk                         |    3 +-
 3 files changed, 3 insertions(+), 2566 deletions(-)

Patch is too large, so refusing to show it
