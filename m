From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 23 Feb 2015 10:37:27 +0100
Subject: [Buildroot] [PATCH next 2/2] libsigsegv: rename patches because the
	first one is gone
In-Reply-To: <1424684247-3644-1-git-send-email-user@ld2077>
References: <1424684247-3644-1-git-send-email-user@ld2077>
Message-ID: <1424684247-3644-2-git-send-email-user@ld2077>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Porcedda <fabio.porcedda@gmail.com>

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ....patch => 0001-Add-stack-direction-for-the-AArch64-architecture.patch} | 0
 ...tch => 0002-Add-stack-direction-for-the-Microblaze-architecture.patch} | 0
 ...patch => 0003-Add-stack-direction-for-the-Blackfin-architecture.patch} | 0
 ....patch => 0004-Add-stack-direction-for-the-Nios-II-architecture.patch} | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename package/libsigsegv/{0002-Add-stack-direction-for-the-AArch64-architecture.patch => 0001-Add-stack-direction-for-the-AArch64-architecture.patch} (100%)
 rename package/libsigsegv/{0003-Add-stack-direction-for-the-Microblaze-architecture.patch => 0002-Add-stack-direction-for-the-Microblaze-architecture.patch} (100%)
 rename package/libsigsegv/{0004-Add-stack-direction-for-the-Blackfin-architecture.patch => 0003-Add-stack-direction-for-the-Blackfin-architecture.patch} (100%)
 rename package/libsigsegv/{0005-Add-stack-direction-for-the-Nios-II-architecture.patch => 0004-Add-stack-direction-for-the-Nios-II-architecture.patch} (100%)

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
-- 
2.3.0
