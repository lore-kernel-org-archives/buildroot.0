From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sat, 14 Sep 2013 21:08:25 +0200
Subject: [Buildroot] [RFC] Effective Patchwork Use and Patch Review
In-Reply-To: <20130914074740.424283aa@skate>
References: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
 <20130914074740.424283aa@skate>
Message-ID: <5234B429.9010607@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ryan,

On 14.09.2013 07:47, Thomas Petazzoni wrote:
> wget -O - http://patchwork.ozlabs.org/patch/274867/mbox/ | git am
> 
> This will fetch a patch from patchwork and apply it to the current
> branch.
> 
> But besides that, all the review process simply consists in replying to
> the patch on the mailing list.
...

Wolfram Sang gave this year at the Fosdem a talk how he is maintaining
the I2C subsystem in the kernel. His talk was right after Thomas talk
about the ARM support in the Linux kernel. ;)

Wolfram talks a lot about *his* workflow while maintaining the I2C
subsystem.

Unfortunately Wolfram doesn't uploaded his slides, but the interesting
parts are the live demos about that. So you may want see the video from
this talk?

https://archive.fosdem.org/2013/schedule/event/maintaining_a_kernel_subsystem/

Regards
Carsten
