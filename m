From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 4 Mar 2008 16:21:02 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
References: <20080304121919.3D76F12C85D@busybox.net><01f801c87df4$8cd76e00$060514ac@atmel.com>
	<87k5kivdgo.fsf@macbook.be.48ers.dk>
Message-ID: <029e01c87e0d$1d9444f0$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> >> 
> >> Log:
> >> buildroot: add kernel-headers to base targets so it gets handled by external-deps
> 
> Ulf> Did you test this using an external toolchain so you do not get
> Ulf> any problems with buildroot overwriting toolchain etc.
> 
> No - I take it you have such a setup, could you give it a quick test?
> 


No, I ususally don't use this and have no time to do it.
There are others, and they may be adversely
affected by such a patch. 
It should not go into the main trunk unless this is tested.

It is easy to generate an external toolchain, by building it using buildroot,
and then you use it from another directory.



> -- 
> Bye, Peter Korsgaard
>



Best Regards
Ulf Samuelsson
