From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Oct 2014 21:40:25 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/alsa-utils: Fix gettext
	related build error
References: <1413730150-19225-1-git-send-email-bernd.kuhls@t-online.de>
 <20141026220949.28c735c8@free-electrons.com>
Message-ID: <XnsA3D3DC79D56EEberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20141026220949.28c735c8 at free-electrons.com:

> Dear Bernd Kuhls,
> 
> On Sun, 19 Oct 2014 16:49:10 +0200, Bernd Kuhls wrote:
>> ALSA_UTILS_GETTEXTIZE = YES
>> 
>> is also needed to fix
>> 
>> *** error: gettext infrastructure mismatch: using a Makefile.in.in from
>> gettext version 0.18 but the autoconf macros are from gettext version 0.19
>> 
>> To reproduce the build error make sure gettext is build before alsa-utils
>> by also applying this patch: http://patchwork.ozlabs.org/patch/400779/
>> 
>> Signed-off-by: Bernd Kuhls <bernd.kuhls-
zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
> 
> Hum, I've built gettext and then alsa-utils, and I didn't see the
> problem. Do you have a defconfig that exhibits the problem?

Hi,

I can not reproduce it either now, maybe I hit some weird combination during 
my allyesconfig testing of the --enable-debug_for_all_packages patch.

I marked my patch[1] as rejected for now, if it is caught by the autobuilders 
we can find the patch in the mailinglist archives ;)

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/400780/
