From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:49:38 +0200
Subject: [Buildroot] [PATCH 3/3] mpv: add support for Raspberry Pi "rpi"
 output
In-Reply-To: <656fbb70-d75e-6495-34aa-c845c9323099@mind.be>
References: <20170914150238.31289-1-mahyar.koshkouei@gmail.com>
 <20170914150238.31289-2-mahyar.koshkouei@gmail.com>
 <656fbb70-d75e-6495-34aa-c845c9323099@mind.be>
Message-ID: <20171022164938.1b27243c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Sep 2017 15:06:03 +0200, Arnout Vandecappelle wrote:
> On 14-09-17 17:02, Mahyar Koshkouei wrote:
> > mpv now compiles with the "rpi" video driver that provides hardware
> > acceleration on the Raspberry Pi.
> > 
> > Tested working on a Raspberry Pi 1 Model B+.
> > 
> > Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>  
> 
>  I didn't apply this patch since there was still some discussion upstream [1] of
> what the proper approach is.
> 
> [1] https://github.com/mpv-player/mpv/pull/4883

And indeed, a person upstream suggested a patch in
https://github.com/mpv-player/mpv/pull/4883#issuecomment-331506711, and
apparently you tested it successfully.

Could you update your Buildroot patch to use the improved fix proposed
by upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
