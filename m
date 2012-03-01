From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Mar 2012 00:30:08 +0000
Subject: [Buildroot] uClibc missing symbols (undefined reference to
	`__fini_array_end')
In-Reply-To: <201203010027.33790.arnout@mind.be>
References: <CAGDZK6Ho6M+p4gpxHTqz8F7Jnwzo3b4KSWavh4DJ_XSb5Dp5fw@mail.gmail.com>
 <201203010027.33790.arnout@mind.be>
Message-ID: <201203010030.08802.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 01 March 2012 00:27:33 Arnout Vandecappelle wrote:
>  You do get 
> /usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.6.2/../../../libc.so
> on your target, right?  It's copied in by target-finalize.

 Actually, it's not...  There's your bug!  Give me a minute to prepare 
a patch.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
