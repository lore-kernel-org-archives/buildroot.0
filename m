From: John Voltz <john.voltz@gmail.com>
Date: Fri, 21 Mar 2008 13:29:26 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
In-Reply-To: <46a136670803211023p24807b03i8d60951d946baa68@mail.gmail.com>
References: <20080321112103.A34573C2F3@busybox.net>
	<87lk4cxq51.fsf@macbook.be.48ers.dk>
	<46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com>
	<d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com>
	<1206120098.2562.103.camel@nigel-x60>
	<46a136670803211023p24807b03i8d60951d946baa68@mail.gmail.com>
Message-ID: <46a136670803211029i22e0c783j5c24db2a229a1c9e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed, looking through that patch, there are lots of little changes that
affect the code path for all arches. That can't be good, or right. Also,
there are huge chunks of unchanged code that probably got white-spaced
somehow and don't even belong in there. I truly am sorry for unleashing that
mess on you guys. I'm cranking away at finding a stable fix, along with
bugging the Atmel guys about it. I think Atmel Norway must be on holiday or
something, because they've been awfully quiet lately.

John


On Fri, Mar 21, 2008 at 1:23 PM, John Voltz <john.voltz@gmail.com> wrote:

>
> ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/Source
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080321/66ded0a0/attachment-0001.htm 
