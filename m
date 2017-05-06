From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 May 2017 11:35:26 +0200
Subject: [Buildroot] [PATCH] rpi-wifi-firmware: new package
In-Reply-To: <20170505183741.30214-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 5 May 2017 20:37:41 +0200")
References: <20170505183741.30214-1-peter@korsgaard.com>
Message-ID: <87fugiqqe9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add firmware (NVRAM data) for the Raspberry Pi 3 and Zero W wifi module.
 > Notice that linux-firmware provides the main firmware
 > (brcmfmac43430-sdio.bin), but the module also needs board specific
 > configuration (NVRAM) data.

 > For the rpi, this data is available in the RPI firmware-nonfree git repo.
 > As this repo contains a lot of unrelated data (~70MB), simply download the
 > single NVRAM file instead of cloning the entire repo.

 > A similar approach is used by openwrt and opensuse:

 > https://dev.openwrt.org/browser/trunk/package/firmware/brcmfmac43430-firmware/Makefile?rev=49139
 > https://build.opensuse.org/package/view_file/hardware/bcm43xx-firmware/bcm43xx-firmware.spec?rev=b1628448b36c85abc9215eab4785ef29

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed after adding _LICENSE = PROPRIETARY, thanks.

-- 
Bye, Peter Korsgaard
