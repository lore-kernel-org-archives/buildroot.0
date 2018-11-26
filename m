From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:03:38 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/dtc: renumber
 patches correctly
Message-ID: <20181126180054.368EB88876@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7be5758a18d7117ddc2d0818481da04c742d93f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

When c7ffd8a75d55e24d793106eabbb80964ab91081f ("package/dtc: fix
include guards for older kernel/u-boot") introduced a new patch to the
dtc package, it used the 0001 number, which was already used by
another patch. Let's fix that.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2922d9765616652017a0346543656739d81bf0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...atch => 0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch b/package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
similarity index 100%
rename from package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch
rename to package/dtc/0002-Fix-include-guards-for-older-kernel-u-boot-sources.patch
