From: mohammed dahdouh <meodou@hotmail.com>
Date: Wed, 1 Sep 2010 02:31:24 +0000
Subject: [Buildroot] No compiler is embedded to the file system.
In-Reply-To: <AANLkTi=uFnF5Hwueqi1u-L_Zks=y6c9EKZBueK7FgK_6@mail.gmail.com>
References: <BLU118-W21A6465BFFC320F704EC54D68A0@phx.gbl>,
	<AANLkTi=uFnF5Hwueqi1u-L_Zks=y6c9EKZBueK7FgK_6@mail.gmail.com>
Message-ID: <BLU118-W2785FD86090F0EF9B015FAD68B0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
First, Thanks for the reply.I misunderstood the documentation in fact I was expecting a cross compiler there. My understanding was that the buildroot is an independent File system containing cross compile toolchain. While the cross-compile toolchain should  available in out/staging. I m compiling again to check that.
Btw what is the difference between the options : "external toolchain" and "buildroot toolchain"?
BR.
md

> From: mjd+buildroot at afork.com
> Date: Tue, 31 Aug 2010 12:00:28 +1000
> Subject: Re: [Buildroot] No compiler is embedded to the file system.
> To: meodou at hotmail.com
> CC: buildroot at busybox.net
> 
> Hi,
> 
> On Tue, Aug 31, 2010 at 11:04 AM, mohammed dahdouh <meodou@hotmail.com> wrote:
> > in the generated file system there is no compiler (I cannot find a gcc, cc.. binaries ):
> 
> In addition to what Khem Raj wrote, there is a compiler, but it's for
> running on your PC, not running on the host.  It's in output/staging,
> not output/target.
> 
> Why do you need the compiler to run on your target?
> 
> Mitch.
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100901/37a17c7d/attachment.html>
