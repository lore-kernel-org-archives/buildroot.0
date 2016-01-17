From: Rodrigo Rebello <rprebello@gmail.com>
Date: Sun, 17 Jan 2016 16:22:35 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <CABLs7GWCkOptR=Bg=ppkARz_WDmxU4-eAiHSVwmwEJGdv8yRAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

2016-01-16 21:11 GMT-02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
[snip]
>>          arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/20019b0daebf1aaf44e0802603108ff712f60513/
>
> In static linking configurations, when SDL_mixer is linked against
> libmad, chocolate-doom doesn't pass -lmad. To fix this, we need to:
>
>  * Fix SDL_mixer.pc so that it references libmad in Libs.private (or
>    Requires.private ?)
>
>  * Either use pkg-config directly in chocolate-doom.mk to pass the
>    appropriate flags, or change the chocolate-doom build system itself.
>
> Note that a similar problem might appear when SDL_mixer is linked
> against vorbis.
>
> Rodrigo, since you added the chocolate-doom package, can you look into
> fixing this ?
>

No problem, I'll look into that in the next few days.

Regards,
Rodrigo
