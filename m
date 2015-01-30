From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Jan 2015 20:20:47 +0100
Subject: [Buildroot] [PATCH V2] ffmpeg: enable use of freetype and
	fontconfig
References: <54C6E85B.2010707@ou.edu> <87k307yj4g.fsf@dell.be.48ers.dk>
Message-ID: <XnsA432CEF8725BFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Peter Korsgaard <peter@korsgaard.com> wrote in 
news:87k307yj4g.fsf at dell.be.48ers.dk:

> You also don't cover musl. While it does provide fenv.h, it is missing
> functionality on atleast microblaze and soft float arm/mips, so I think
> the sanest approach is just to only enable it for glibc.

Hi Peter,

it seems that glibc at microblazeel also lacks features in fenv.h:
http://autobuild.buildroot.net/results/255/2551aae55620c6ba3da20b8be161dda302
e057c3/

Regards, Bernd
