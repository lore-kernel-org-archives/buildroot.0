From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 15 May 2017 22:38:08 +0200
Subject: [Buildroot] [PATCH 1/3] package/mplayer: disable inline sse on
	i386
References: <20170513150918.25427-1-bernd.kuhls@t-online.de>
 <20170514160855.2dea324b@free-electrons.com>
Message-ID: <XnsA776E64284194berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20170514160855.2dea324b at free-electrons.com:

> All of this is very messy. Why isn't the ffmpeg code building properly
> on x86 ? It's a major platform, shouldn't x86 just work ?

Hi Thomas,

honestly I have no idea what causes the problem. Maybe activating inline asm 
on x86 at all is a problem due to hardware constraints as described here: 
http://stackoverflow.com/questions/8275859/error-cant-find-a-register-in-
class-general-regs-while-reloading-asm ?

Regards, Bernd
