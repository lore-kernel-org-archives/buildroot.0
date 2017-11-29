From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 13:36:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-28
In-Reply-To: <20171129102201.GI2889@scaer>
References: <20171129070009.BC0F72037D@mail.free-electrons.com>
 <20171129102201.GI2889@scaer>
Message-ID: <20171129133649.57832b1c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 11:22:01 +0100, Yann E. MORIN wrote:

> >       branch |  OK | NOK | TIM | TOT |
> >    2017.08.x |  11 |   0 |   0 |  11 |
> >       master | 176 |   4 |   0 | 180 |  
> 
> Woot! :-)
> 
> This is a pretty good state for the upcoming release. :-)

Yes, it is a very good result. I wish more people would volunteer to
provide autobuilder instances, and increase the number of builds per
day.

> >       mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/ed88a03eda6bf40634534578e6e870a25ed66261 | ORPH  
> 
> callNative.S: Assembler messages:
> callNative.S:161: Error: float register should be even, was 1
> 
> This is for a mipsr6.
> 
> Vicente, should we disable jamvm for mipsr6?

As far as I know, Vicente is no longer with Imagination. And
Imagination has sold its MIPS business. See
https://www.anandtech.com/show/11867/imagination-technologies-to-be-acquired-by-canyon-bridge-for-550m.
So I wouldn't expect too much feedback from Vicente unfortunately :-/

> >          arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/624f2db9baad4f1d6c41ff74dc6310a4228679f2 |       
> 
>   CCLD     prog
> OBJCOPY prog.debug
> objcopy: Unable to recognise the format of the input file `prog'
> 
> This is for an armv4.

It also happened targetting ARMv5, see
http://autobuild.buildroot.net/results/8a0/8a0e970b8adb6770ff9b1d18c4544654d511aadf/build-end.log.
And targetting ARMv7, see
http://autobuild.buildroot.net/results/b84/b84a6e39fcca70c56bfe49d54c385dfe6da82422/build-end.log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
