From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 22:46:42 +0200
Subject: [Buildroot] [PATCH] new package: libav
In-Reply-To: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
References: <0LvAri-1Rcapv3sjy-010LQJ@mrelayeu.kundenserver.de>
Message-ID: <20110705224642.4953b847@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wolfram,

Thanks for your patches!

Le Fri, 01 Jul 2011 18:27:13 +0200,
Wolfram Gloger <wg@malloc.de> a ?crit :

> This is a copy of the ffmpeg package with the names and download
> changed for libav-0.7.
> 
> Why choose this fork when there is "original" ffmpeg?
> 
> - It may be the future?  I don't know, but for sure it was dreadfully
>   hard to get patches into ffmpeg.
> 
> - I found that ffmpeg (at least 0.6.3) does _not_ work with minidlna
>   (buildroot patch forthcoming), there are strange hangups just
>   calling av_stream_info() on many ts files.
>   libav worked out of the box in this context.
> 
> Signed-off-by: Wolfram Gloger <wg@malloc.de>

Could you turn this into a proper commit log message ? Could you also
send your patch inline and not as an attached file ? This make it
easier to review and comment.

If the libav package is a copy of the ffmpeg one, isn't it possible to
share the same .mk file ? We could then make them separate when/if
libav diverges from ffmpeg in a significant way.

What do you think ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
