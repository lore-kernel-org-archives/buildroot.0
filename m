From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  8 Nov 2018 14:04:15 +0100
Subject: [Buildroot] [PATCH 0/2] Preparation for per-package host/target
Message-ID: <20181108130417.1277-1-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

maybe my post from last week was too involved so here's a more focused version.

I have played with your per-package patches and found them very interesting
because the possible parallelization speeds up the build considerably.

For a start, here are two patches I needed in order to solve some build failures.
I'd be happy for feedback as well as some idea how further development on this
feature is planned.


best regards,
Andreas


Andreas Naumann (2):
  fs: Add common rootfs dependencies to PACKAGES
  linux: Make dtc install step more reliable

 fs/common.mk   | 1 +
 linux/linux.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.19.1
