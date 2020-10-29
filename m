From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 15:35:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: add rpi
 settings files
In-Reply-To: <20201017151848.1283394-1-fhunleth@troodon-software.com> (Frank
 Hunleth's message of "Sat, 17 Oct 2020 11:18:48 -0400")
References: <20201017151848.1283394-1-fhunleth@troodon-software.com>
Message-ID: <87361xhzgv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > The brcmfmac drivers now load settings files for BCM434xx devices and
 > fail if they're missing on the Raspberry Pi:

 > brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

 > This commit copies the missing settings files over to the firmware
 > directory with the other files.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed to 2020.02.x (except for the RPI4 file which isn't present)
and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
