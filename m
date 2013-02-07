From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 07 Feb 2013 09:38:33 +0100
Subject: [Buildroot] [PATCH 1/5] ffmpeg: define license
In-Reply-To: <87k3qlm6po.fsf@dell.be.48ers.dk>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <5112B74A.2030903@mind.be> <87k3qlm6po.fsf@dell.be.48ers.dk>
Message-ID: <51136809.4070903@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>   Arnout> On 06/02/13 17:24, Luca Ceresoli wrote:
>   >> How about making it more "automagic", such as:
>   >>
>   >> ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
>   >> FFMPEG_LICENSE = LGPLv2.1+, GPLv2+, libjpeg license
>   >> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1 COPYING.GPLv2
>   >> else
>   >> FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
>   >> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
>   >> endif
>
>   Arnout>  Sounds good to me!
>
> Or even better:
>
> FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
>
> ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
> FFMPEG_LICENSE += GPLv2+
> FFMPEG_LICENSE += COPYING.GPLv2
> endif
>

Fine, will do and resend.

Luca
