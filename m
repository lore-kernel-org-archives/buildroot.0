From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2011 16:32:50 +0200
Subject: [Buildroot] [PATCH 2/2] kbd: rename the makefile so that it's named
	the same as the package
In-Reply-To: <cover.1306074766.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306074766.git.thomas.petazzoni@free-electrons.com>
Message-ID: <55fae404c8cc1f32c3028bae65851e53146798e5.1306074766.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kbd/{kdb.mk => kbd.mk} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename package/kbd/{kdb.mk => kbd.mk} (100%)

diff --git a/package/kbd/kdb.mk b/package/kbd/kbd.mk
similarity index 100%
rename from package/kbd/kdb.mk
rename to package/kbd/kbd.mk
-- 
1.7.1
