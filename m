From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 21:30:50 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: remove
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <4c57acb52a45749057a0ca92d1d982a78c6f8cc2.1428401645.git.baruch@tkos.co.il>
References: <4c57acb52a45749057a0ca92d1d982a78c6f8cc2.1428401645.git.baruch@tkos.co.il>
Message-ID: <20150407213050.394c3b5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  7 Apr 2015 13:14:05 +0300, Baruch Siach wrote:
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS became ineffective in commit a5ce7590c4b
> (package/rpi-firmware: bump version), and was removed in commit 4e92ffdc47cc
> (rpi-firmware: remove no longer used BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS).
> Remove it from the Pi configs.
> 
> Also, remove the now obsolete comment in these config files.
> 
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied. Note that I have seen the comments from Yann, and they seem
very valid. Though I believe they can be addressed as follow-up
patches, since this patch per-se isn't wrong/bad. But please work with
Yann on the remaining issues.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
