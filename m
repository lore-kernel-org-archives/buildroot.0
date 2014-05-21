From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 May 2014 23:27:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-19
In-Reply-To: <20140520092513.0ad98a62@free-electrons.com>
References: <20140520063007.ACE63100F8E@stock.ovh.net>
 <20140520092513.0ad98a62@free-electrons.com>
Message-ID: <537D1A5A.1000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/05/14 09:25, Thomas Petazzoni wrote:
> On Tue, 20 May 2014 08:30:07 +0200 (CEST), Thomas Petazzoni wrote:
> 
>> >     x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3ecb780be9e7912dac9670d9e7ad9a810c6243af/
> Multiple definitions of vfork in libc.a and libpthread.a. To me, this
> looks like a uClibc bug. Do other agree about this? Should we mark
> alsa-lib as not available on pure static builds with uClibc? Is there a
> uClibc patch that fixes that?

 When I did that allpackageyes of a static arm configuration, there were dozens
of packages that show the same or a similar problem (duplicates in libpthread
and libc). I looked at one of them in more detail, and I could make it link by
playing around with the link options, but I haven't been able to find the real
cause.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
