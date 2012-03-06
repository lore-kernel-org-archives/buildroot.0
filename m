From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Tue, 6 Mar 2012 17:05:16 +0100
Subject: [Buildroot] Q: webkit?
In-Reply-To: <155f0f0f67543659afeeb1371b8f2585@zacarias.com.ar>
References: <mailman.63133.1329751235.2942.buildroot@busybox.net>
 <1531E53627F1F749B4FE809BF2A4EB6702FF68AD@WETMEX10.loepfe.com>
 <155f0f0f67543659afeeb1371b8f2585@zacarias.com.ar>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB67030AB4DB@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo 

You won't believe it or not, but I got it compiled today, was using
"WebKitGTK+ 1.6.3" and I'm testing for X11.

I'm using an IMX53_loco board to test-drive it.
I must say it is NOT stable, meaning, that I get segmentation faults
often (don't have any clue 'at his time' how to trace/find the cause of
these segmentation faults.. :-( ).

I did have a lot of troubles with uClibc.0.9.32.x, compile-troubles
(threading, gettext/libintl.h... etc), 
and finally I switched to uclibc 0.9.33 and this entire strange compile
errors (unknown types/defines.. etc) disappeared :-)


My plan was, to restart-all-over (because I've been changing, in 1001
places which probably was not necessary) to see if I was able to
reproduce my success-full compile cycle.
And, if I was able to reproduce the compile cyle I was going to trow a
message on the buildroot-list with my findings :-).

NOTE:  I'm only try-ing to build for X11 now, so, did not try for a
direct-fb version.

Regards 
Noel





-----Original Message-----
From: Gustavo Zacarias [mailto:gustavo at zacarias.com.ar] 
Sent: 6Mar12 16:26
To: Vellemans, Noel
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Q: webkit?

On 2012-02-20 13:18, Vellemans, Noel wrote:

> Hi all,
>
> Probing for some info.
>
> Anyone working on (or succeeded) building a more recent version of 
> WebKit (>= 1.2.7) on buildroot?
>
>
> Regards,
> Noel

Hi.
I gave a shot at the 1.6.x series a couple of weeks ago and hit some
issues when building for a non-X11 (directfb to be precise) target.
It wanted some X libs even though it was an X-free scenario.
Did you move forward on your end on webkit?
Regards.
