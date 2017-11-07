From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Nov 2017 10:04:26 +0100
Subject: [Buildroot] [PATCH v2 1/3] armbian-firmware: new package
In-Reply-To: <20171106101652.28861-2-geomatsi@gmail.com> (Sergey Matyukevich's
 message of "Mon, 6 Nov 2017 13:16:50 +0300")
References: <20171106101652.28861-1-geomatsi@gmail.com>
 <20171106101652.28861-2-geomatsi@gmail.com>
Message-ID: <87vaimv4rp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > This package enables access to firmware blobs from Armbian firmware
 > repository: https://github.com/armbian/firmware

 > That repository contains multiple firmware blobs grouped by vendor.
 > For the sake of convenience each group can be independently selected
 > using Kconfig options. This commit enables the following options:
 > - firmware blobs for XR819 SDIO WiFi chip
 > - firmware blobs for AP6212 WiFi/BT combo

 > Armbian firmware repository does not include any specific licenses.
 > Most part of those firmware blobs belongs to various Android/Linux
 > SDK packages provided by board vendors. As a result, this package
 > makes use of the following conservative approach for all the
 > selected firmware binaries:
 >   FIRMWARE_LICENSE = PROPRIETARY
 >   FIRMWARE_REDISTRIBUTE = NO

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
