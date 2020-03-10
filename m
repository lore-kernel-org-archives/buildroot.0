From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:38:13 +0100
Subject: [Buildroot] [git commit] board/lemaker/bananapro: fix wlan
 module
In-Reply-To: <20200204181858.22ADA8B6D0@busybox.osuosl.org> (Peter Korsgaard's
 message of "Tue, 4 Feb 2020 19:27:48 +0100")
References: <20200204181858.22ADA8B6D0@busybox.osuosl.org>
Message-ID: <87wo7sosi2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=23bc8059cde54b5c29a559bff07e746a11590e23
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Restore a patch which disables 00B IRQ for the built-in wlan module which
 > allows working wlan module again.  It turned out that it shouldn't have been
 > deleted because the bug still exists in the mainline linux kernel, so keep
 > this patch the same as armbian[1] to have wifi connection working correctly.

 > [1] https://github.com/armbian/build/blob/master/patch/kernel/sunxi-dev/ARM-dts-sun7i-Disable-OOB-IRQ-for-brcm-wifi-on-Cubietruck-and-Banana-Pro.patch

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
