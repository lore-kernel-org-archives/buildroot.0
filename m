From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2016 19:01:42 +0100
Subject: [Buildroot] Analysis of build failures
References: <20160212073018.E5E46101657@stock.ovh.net>
 <20160212104541.0e3774b1@free-electrons.com>
Message-ID: <69j1pcx7a1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 12 Feb 2016 10:45:41 +0100 schrieb Thomas Petazzoni:

>>       x86_64 |                   ffmpeg-2.8.6 | NOK |
>>       http://autobuild.buildroot.net/results/
c53f7768be220fcd0f574ac16a7b4b0e26e7b0a9/
> 
> LD	ffplay_g /usr/lib/libglib-2.0.so.0: undefined reference to
> `clock_gettime at GLIBC_2.17' collect2: error: ld returned 1 exit status
> 
> Looks like it links with host libraries: not good.
> 
> Bernd, could you have a look ?

Hi Thomas,

weird, on my machine I can not reproduce the bug.

Regards, Bernd
