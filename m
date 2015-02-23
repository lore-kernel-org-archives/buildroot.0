From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:26:53 +0100
Subject: [Buildroot] [git commit] libsigsegv: rename patches because the
	first one is gone
Message-ID: <20150302222722.E60C98177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7434b01e241be780bdd6ce3e3664d155c4ac825d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...k-direction-for-the-AArch64-architecture.patch} |    0
 ...irection-for-the-Microblaze-architecture.patch} |    0
 ...-direction-for-the-Blackfin-architecture.patch} |    0
 ...k-direction-for-the-Nios-II-architecture.patch} |    0
 4 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/0002-Add-stack-direction-for-the-AArch64-architecture.patch b/package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
similarity index 100%
rename from package/libsigsegv/0002-Add-stack-direction-for-the-AArch64-architecture.patch
rename to package/libsigsegv/0001-Add-stack-direction-for-the-AArch64-architecture.patch
diff --git a/package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch b/package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
similarity index 100%
rename from package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch
rename to package/libsigsegv/0002-Add-stack-direction-for-the-Microblaze-architecture.patch
diff --git a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch b/package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
similarity index 100%
rename from package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
rename to package/libsigsegv/0003-Add-stack-direction-for-the-Blackfin-architecture.patch
diff --git a/package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch b/package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
similarity index 100%
rename from package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch
rename to package/libsigsegv/0004-Add-stack-direction-for-the-Nios-II-architecture.patch
