From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 18 Feb 2009 15:34:15 +0100
Subject: [Buildroot] [patch] mplayer: bump to v1.0rc2
In-Reply-To: <87tz6ydt41.fsf@macbook.be.48ers.dk>
References: <20090205171034.341e8a1c@hcegtvedt>
	<87tz6ydt41.fsf@macbook.be.48ers.dk>
Message-ID: <20090218153415.3ebcf83b@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 13 Feb 2009 20:39:10 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:

<snipp>

>  Hans-Christian> The other patches in SVN are not needed for
>  Hans-Christian> v1.0rc2. This patch also contains the Atmel vendor
>  Hans-Christian> patch to give a boost on AVR32 devices.
> 
> What's the upstream status of that?
> 

I just sent a second revision of reviewed patches to ffmpeg/MPlayer.
Hopefully they will be in in not too far future. This means the vendor
patch can vanish once and for all.

<snipp>

>  Hans-Christian> +++
> b/package/multimedia/mplayer/mplayer-1.0rc2-100-atmel.1.patch
> 2009-02-05 17:01:13.000000000 +0100
> 
>  Hans-Christian> ++++ b/version.sh
>  Hans-Christian> +@@ -1,3 +1,3 @@
>  Hans-Christian> + #!/bin/sh
>  Hans-Christian> +-echo "#define VERSION \"1.0rc2-$1\"" > version.h
>  Hans-Christian> +-echo "#define MP_TITLE \"MPlayer 1.0rc2-$1 (C)
> 2000-2007 MPlayer Team\"" >> version.h Hans-Christian> ++echo
> "#define VERSION \"1.0rc2.atmel.1-$1\"" > version.h Hans-Christian>
> ++echo "#define MP_TITLE \"MPlayer 1.0rc2.atmel.1-$1 (C) 2000-2007
> MPlayer Team\"" >> version.h
> 
> NACK. Either we rename the patch to .patch.avr32 so it only gets
> applied to avr32, or we get rid of that hunk.
> 

Agreed, when we can move to a SVN revision or the future v1.0rc3, then
hopefully all these small patches can be gone.

-- 
Best regards,
Hans-Christian Egtvedt
