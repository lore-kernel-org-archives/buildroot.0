From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 02 Aug 2017 07:31:13 +0200
Subject: [Buildroot] 2017.08-rc1 approaching
References: <20170801233055.2488a4fc@windsurf.home>
Message-ID: <1m485exrb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 01 Aug 2017 23:30:55 +0200 schrieb Thomas Petazzoni:

> If there is anything that you believe is really important to have in
> 2017.08 and that is already pending in patchwork, let me know.

Hi Thomas,

I would like to have the "kodi: Add support for more archs"[1] patch in 
2017.08, it allows to use kodi, among others, on aarch64.
In May we already had a user asking for this on our mailinglist:
http://lists.busybox.net/pipermail/buildroot/2017-May/191352.html

This patch is part of a 3-patch series which includes a fix for the 
broken sunxi mali support. I agree with your proposal to change the egl 
checks to a positive list "depends on PLATFORM_A || PLATFORM_B || 
PLATFORM_C" but this takes more time to test than I currently have.

Therefore I removed the sunxi stuff from the patch series to keep only 
the fix for the supported archs. This patch is currently tested by test-
pkg with all 47 toolchains. I expect to have the result this evening and 
would sent v4 of the patch in the hope it will get into 2017.08 ;)

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/788923/
