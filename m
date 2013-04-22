From: Richard Cagley <rcagley@toyon.com>
Date: Mon, 22 Apr 2013 15:28:22 -0700
Subject: [Buildroot] linux/videodev.h missing
In-Reply-To: <5175A1C6.1050106@mind.be>
References: <BA6FC03EA0815D428FB8A3C279ED4992072B8ECF@mx.toyon.corp>
 <5171D9E4.7090904@mind.be>
 <BA6FC03EA0815D428FB8A3C279ED4992072B900D@mx.toyon.corp>
 <5175A1C6.1050106@mind.be>
Message-ID: <BA6FC03EA0815D428FB8A3C279ED4992072B9210@mx.toyon.corp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sadly, even freescale seems to have dropped videodev.h
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/include
/linux

I wish I could figure out who maintains imx-lib so I could figure out
why they're sourcing such old headers.

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: Monday, April 22, 2013 1:47 PM
> To: Richard Cagley
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] linux/videodev.h missing
> 
> On 22/04/13 18:12, Richard Cagley wrote:
> > Arnout,
> > This is the information I needed. Sounds like I need to find a
patched
> > kernel tarball.
> 
>   Try http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/
> 
>   Perhaps I should have added that URL to the help text.
> 
>   Regards,
>   Arnout
> 
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
