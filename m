From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:07:52 +0200
Subject: [Buildroot] [PATCH 06/46] u-boot: rename Makefile.in to u-boot.mk
	for coherency
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fef9006a6243ec0208cdaba5d23c4e6e6f46d321.1275343447.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/{Makefile.in => u-boot.mk} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename boot/u-boot/{Makefile.in => u-boot.mk} (100%)

diff --git a/boot/u-boot/Makefile.in b/boot/u-boot/u-boot.mk
similarity index 100%
rename from boot/u-boot/Makefile.in
rename to boot/u-boot/u-boot.mk
-- 
1.7.0.4
