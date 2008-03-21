From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 21 Mar 2008 17:32:38 +0000
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/gcc/4.2.1:	avr32_patches_break_x86
In-Reply-To: <46a136670803211029i22e0c783j5c24db2a229a1c9e@mail.gmail.com>
References: <20080321112103.A34573C2F3@busybox.net>
	<87lk4cxq51.fsf@macbook.be.48ers.dk>
	<46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com>
	<d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com>
	<1206120098.2562.103.camel@nigel-x60>
	<46a136670803211023p24807b03i8d60951d946baa68@mail.gmail.com>
	<46a136670803211029i22e0c783j5c24db2a229a1c9e@mail.gmail.com>
Message-ID: <1206120758.2562.114.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> I noticed, looking through that patch, there are lots of little
> changes that affect the code path for all arches. That can't be good,
> or right. Also, there are huge chunks of unchanged code that probably
> got white-spaced somehow and don't even belong in there. I truly am
> sorry for unleashing that mess on you guys. I'm cranking away at
> finding a stable fix, along with bugging the Atmel guys about it. I
> think Atmel Norway must be on holiday or something, because they've
> been awfully quiet lately.

After about 10 million pgdwn's in the patch I kinda gave up ... some
pretty nasty changes they've made, I agree!

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080321/5a8688e0/attachment.pgp 
