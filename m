From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2020 23:00:04 +0200
Subject: [Buildroot] [git commit] configs/amarula_a64_relic: add missing
 BR2_PACKAGE_HOST_ANDROID_TOOLS=y
In-Reply-To: <20200421193603.DBD2B8FA92@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 21 Apr 2020 21:48:50 +0200")
References: <20200421193603.DBD2B8FA92@busybox.osuosl.org>
Message-ID: <877dxnv4tn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=016a1d80eab41f6f3e7b0a6b23aec250a7a1933f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > board/amarula/a64-relic/readme.txt makes use the host fastboot utility
 > to flash the board. However, BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
 > (which is enabled in the defconfig) has a dependency on
 > BR2_PACKAGE_HOST_ANDROID_TOOLS, which is not enabled in the
 > defconfig. Due to this, BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT=y is
 > lost when loading the defconfig.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Jagan Teki <jagan@amarulasolutions.com>
 > [Thomas: change to add BR2_PACKAGE_HOST_ANDROID_TOOLS=y]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
