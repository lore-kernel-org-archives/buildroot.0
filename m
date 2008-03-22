From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 21 Mar 2008 23:11:48 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1:
	avr32_patches_break_x86
In-Reply-To: <46a136670803210844i7e3a232fpde354e2422b385f9@mail.gmail.com>
References: <20080321112103.A34573C2F3@busybox.net>
	<87lk4cxq51.fsf@macbook.be.48ers.dk>
	<46a136670803210455l30fffb0dx90c449c7aa5c551e@mail.gmail.com>
	<d6cda7730803210814v1cbc6b73ge6e7cdf65a0b5f9@mail.gmail.com>
	<46a136670803210824y45035bd4u50dfa5446b9e8003@mail.gmail.com>
	<d6cda7730803210833s3cdce637m8b701f53dad302b@mail.gmail.com>
	<46a136670803210844i7e3a232fpde354e2422b385f9@mail.gmail.com>
Message-ID: <d6cda7730803211911sf109fb6iaf3a865f7ef749b2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's what's puzzling, everything was running ok for quite sometime
here as well.  At first I thought it could be the optimization issues,
as sometimes I get a different error saying that it can't find the
entry point of several standard c libraries, but it seams that earlier
revisions also segfaults. :(

The earlier I tried was 180 (google code) and still has the issues
(3rd march). Now I have updated to HEAD and I'm trying to build with
the external toolchain prepatched sources I've mentioned.

> I'm not blaming buildroot for my problems, it's a fantastic tool that I will
> continue to use and improve.

I'm not blaming anyone, or saying that I will stop sending patches or
anything. Since you mention that the AVR32 patches were causing issues
to x86 users, I'm just sharing that there are problems with the AVR32
as well, at least on my end, and that I've been trying to figure it
out.

Kind Regards,
   Thiago A. Correa
