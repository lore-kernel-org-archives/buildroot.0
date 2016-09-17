From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Sep 2016 14:15:26 +0200
Subject: [Buildroot] [PATCH] linux-firmware: bump version
In-Reply-To: <88a0238b-6ec3-d1d4-a8c7-6084ece071eb@je-eigen-domein.nl> (Floris
 Bos's message of "Sat, 17 Sep 2016 12:59:16 +0200")
References: <1473962213-21519-1-git-send-email-gustavo@zacarias.com.ar>
 <87poo4dilz.fsf@dell.be.48ers.dk>
 <08db6ee07552d254f79b9719c41ac790@zacarias.com.ar>
 <02eb48ef-5659-9364-a55c-6f9c17ca0a82@je-eigen-domein.nl>
 <87intuc2y2.fsf@dell.be.48ers.dk>
 <88a0238b-6ec3-d1d4-a8c7-6084ece071eb@je-eigen-domein.nl>
Message-ID: <87h99eafj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

Hi,

 >> Hmm, perhaps. Do you have a rpi 3 to test on? The linux-firmware commit
 >> doesn't mention anything about it:
 >> 
 >> http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=c4c07a8d1128d50a5c2885ceea1abbebaa82f820

 > ==
 > [    6.785594] usbcore: registered new interface driver brcmfmac
 > [    6.786851] brcmfmac_sdio mmc1:0001:1: Direct firmware load for
 > brcm/brcmfmac43430-sdio.txt failed with error -2
 > [    7.789831] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
 > clkctl 0x50
 > [    8.802492] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
 > clkctl 0x50
 > ==

 > Again, maybe they changed things very recently in a newer kernel
 > branch or something.
 > But it simply does not work with the standard rpi one unless you also
 > have the .txt

Ok, thanks. Does it work with the .bin file from linux-firmware and the
.txt file from RPi-Distro?

-- 
Venlig hilsen,
Peter Korsgaard 
