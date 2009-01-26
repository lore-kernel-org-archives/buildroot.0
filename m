From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 23:19:49 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
In-Reply-To: <871vup4ul9.fsf@macbook.be.48ers.dk>
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
	<1233005366.2298.118.camel@elrond.atmel.com>
	<871vup4ul9.fsf@macbook.be.48ers.dk>
Message-ID: <1233008389.2298.129.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 22:37 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  >> Can I just delete anything older than 2.6.27?
>  >> 
>  Ulf> No, Just because you like to run with the latest kernel,
>  Ulf> that view is not shared by everyone else.
> 
> Ok, so what patches can be removed? I take it that atleast *SOME* of
> those 10 versions can go?
> 

I have customers still working on 2.6.22 ...

I think you need to understand that some people
are planning for 10-15 year lifetime of products.
They do not neccessarily update the kernel very often.
If they do, they are likely to juyst add tweaks to
their kernel instead of upgrading to a new version.

If you implement the patch downloading, there is
very little reason to remove functionality.

BR
Ulf Samuelsson
