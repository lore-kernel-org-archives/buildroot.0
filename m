From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:04:02 +0100
Subject: [Buildroot] [PATCH 1/2] package/dtc: renumber patches correctly
Message-ID: <20181124090403.4045-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When c7ffd8a75d55e24d793106eabbb80964ab91081f ("package/dtc: fix
include guards for older kernel/u-boot") introduced a new patch to the
dtc package, it used the 0001 number, which was already used by
another patch. Let's fix that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/dtc/{0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch => 0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch} (100%)

diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
similarity index 100%
rename from package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
rename to package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
-- 
2.19.1
