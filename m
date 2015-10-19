From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Mon, 19 Oct 2015 21:03:13 +0900
Subject: [Buildroot] [PATCH v1 1/1] gmediarender: new package
In-Reply-To: Your message of Sun, 18 Oct 2015 09:20:18 +0200.
 <20151018092018.103b67cd@free-electrons.com>
Message-ID: <201510191203.t9JC3Dvq016614@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for your comment and suggestion.
I agree with your opinion, abondon this.

I find out good successor project of gmediarender, gmrender-resurrect
hosted on github.

It is maintained and has improved functionarity (eg. OpenHome support etc),
of course it is compatible with gstreamer v1.0.x.

I will send patch later for this.

Thank you,
Kawashima

Thomas Petazzoni writes:
> Hiroshi,
> 
> On Sun, 18 Oct 2015 09:49:13 +0900, Hiroshi Kawashima wrote:
> 
> > Thank you for your review and comment.
> 
> Thanks for your feedback.
> 
> > 1) This project is old and last update is 2007, so it still depsnds on
> >    gstreamer 0.10.x.
> 
> Then is it really useful to package this in Buildroot? I'm a bit
> worried about adding packages that rely only on GStreamer 0.10.
> GStreamer 0.10 is deprecated, and we should rather start thinking of
> removing it from Buildroot rather than adding more packages that depend
> on it.
> 
> Maybe you should consider some other application than gmediarender for
> your project ?
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
============================================================
    Hiroshi Kawashima
