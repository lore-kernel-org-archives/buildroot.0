From: Gopu Subramanian <sgopu@yahoo.com>
Date: Fri, 5 Jun 2009 01:58:08 -0700 (PDT)
Subject: [Buildroot] Build instructions for ARM big-endian BE-8 target
Message-ID: <751481.62632.qm@web42104.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



I am trying to build big-endian tool chain for ARM v6 architecture (ARM 11MPCore) and it should BE-8 format. In BE-8, instructions should be in little-endian. I want the instructions for BE-8 toolchain.

I hope this helps.

Thanks 
Gopu

--- On Fri, 5/6/09, Peter Korsgaard <jacmet@uclibc.org> wrote:

> From: Peter Korsgaard <jacmet@uclibc.org>
> Subject: Re: [Buildroot] Build instructions for ARM big-endian BE-8 target
> To: "Paul Archer" <ptarcher@gmail.com>
> Cc: "Peter Korsgaard" <jacmet@uclibc.org>, sgopu at yahoo.com, buildroot at busybox.net
> Date: Friday, 5 June, 2009, 2:05 PM
> >>>>> "Paul" == Paul
> Archer <ptarcher@gmail.com>
> writes:
> 
>  Paul> I guess
>  Paul> BE-8 = Big Endian 8 bit instructions
>  Paul> BE-32 = Big Endian 32 bit instructions...
> 
> That doesn't make much sense. ARM instructions are 32bit
> (except for
> thumb) and you cannot talk about endianess on byte values.
> 
> -- 
> Bye, Peter Korsgaard
> 


      Cricket on your mind? Visit the ultimate cricket website. Enter http://beta.cricket.yahoo.com
