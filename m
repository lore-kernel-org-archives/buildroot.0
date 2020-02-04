From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 19:28:35 +0100
Subject: [Buildroot] [PATCH 1/2] board/lemaker/bananapro: fix wlan module
In-Reply-To: <20200104164838.1501828-1-b.bilas@grinn-global.com> (Bartosz
 Bilas's message of "Sat, 4 Jan 2020 17:48:37 +0100")
References: <20200104164838.1501828-1-b.bilas@grinn-global.com>
Message-ID: <8736bqyzos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Bilas <b.bilas@grinn-global.com> writes:

 > Restore a patch which disables 00B IRQ for built-in wlan module
 > which allows working wlan module again. It turned out that
 > it shouldn't have been deleted because the bug still exists
 > in the mainline linux kernel so keep this patch the same as
 > armbian[1] to have wifi connection working correctly.

 > [1]
 > https://github.com/armbian/build/blob/master/patch/kernel/sunxi-dev/ARM-dts-sun7i-Disable-OOB-IRQ-for-brcm-wifi-on-Cubietruck-and-Banana-Pro.patch

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
