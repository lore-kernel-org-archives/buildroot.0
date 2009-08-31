From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 31 Aug 2009 07:28:50 +0200
Subject: [Buildroot] [git commit master] u-boot: mark old 2008.10
 version as deprecated
In-Reply-To: <87ljl4dndf.fsf@macbook.be.48ers.dk>
References: <20090827124024.6B23277691@busybox.osuosl.org>
	<d6cda7730908271838qc80efdfj259e9bf1609f396e@mail.gmail.com>
	<20090828072354.38044247@hcegtvedt.norway.atmel.com>
	<87ljl4dndf.fsf@macbook.be.48ers.dk>
Message-ID: <20090831072850.3018cb78@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2009 16:27:56 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
> Hi,
> 
>  Hans-Christian> You're right, AVR32 triggered something in the generic
>  Hans-Christian> flash stuff.
> 
>  Hans-Christian> And it is still not fixed...
> 
> Is this With 2009.06 or git?
> 

GIT

>  U-Boot> saveenv
>  Hans-Christian> Saving Environment to Flash...
>  Hans-Christian> Error: start and/or end address not on sector boundary
> 
> So noone has used u-boot on avr32 with flash since ~1 year? Strange.
> 

None has used U-Boot + AVR32 + CFI driver.

>  Hans-Christian> I'll need to prod around for that.
> 
> Ok, thanks for the heads up.
> 

There is a discussion about the CFI driver on the U-Boot mailing list,
no final conclusion yet.

-- 
Best regards,
Hans-Christian Egtvedt
