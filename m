From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:16:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtl8821au: switch upstream to
 abperiasamy
In-Reply-To: <1469296205024-87d916e6-ee65ee9e-32c5cbb8@mixmax.com>
References: <1469220888-2215-1-git-send-email-christian@paral.in>
 <20160723151352.77eea94b@free-electrons.com>
 <1469296205024-87d916e6-ee65ee9e-32c5cbb8@mixmax.com>
Message-ID: <20160723221650.712ba2f2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jul 2016 17:50:04 +0000, Christian Stewart wrote:

> Here is my reasoning:
> - The current fork we are using is maintained by 1 person. - The current fork does not work, and there are no plans to fix this: - https://github.com/ulli-kroll/rtl8821au/issues/5 - https://github.com/ulli-kroll/rtl8821au/issues/6 - The current fork has never worked very well (we've had lots of issues with
> it) - Our lab switched to the abperiasamy fork a couple months ago and have been
> very happy with it. - The contributor list for the abperiasamy fork contains 21 well-known
> individuals in the community. - The raspberry pi community recommends the abperiasamy fork and uses it
> extensively. - Firmware blobs are not necessary with the new fork and all of the devices we
> have tested the driver with have not required firmware blobs. In fact, we found
> that the firmware blobs in ulli-kroll's version bricked a few of our wifi cards,
> and are quite happy with not using a driver that messes with firmware. - There is a version of rtl8821au in the Raspberry Pi kernel but that is
> obviously unsuitable for use in Buildroot as it cannot be applied to arbitrary

OK. Thanks. It is somewhat sad that all these information are not part
of the commit log, isn't it?

> PS: Please let me know if this email formats strangely, it looks OK on my end:
> http://i.imgur.com/E4ymrB7.png

Your e-mail contains both a plain text version and a HTML version. The
HTML version looks fine, but my e-mail client displays the plain text
version. And the plain text version is really badly formatted.

See http://imgur.com/a/Iz1ZP.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
