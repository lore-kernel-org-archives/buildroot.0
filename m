From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 05 Aug 2008 08:26:42 -0700
Subject: [Buildroot] [PATCH] fix bash job control (was:
	my	/etc/init.d/rcS won't run)
In-Reply-To: <bbbeeccd0808041353h1c99f439yb42fdb63429c9f0b@mail.gmail.com>
References: <bbbeeccd0808040936ge7d230au913b6949fcf7a025@mail.gmail.com>
	<IMyjSUFq.1217872591.9273960.beattie@localhost>
	<bbbeeccd0808041353h1c99f439yb42fdb63429c9f0b@mail.gmail.com>
Message-ID: <1217950002.6444.1.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2008-08-04 at 14:53 -0600, Wade Berrier wrote:
> Hi,
> 
> On Mon, Aug 4, 2008 at 11:56 AM, Brian Beattie <beattie@beattie-home.net> wrote:
> > On 8/4/2008, "Wade Berrier" <wberrier@gmail.com> wrote:
> >
> >>> Attached is a patch to bash.mk so it builds correctly and can be used
> >>> from busybox's init.
> >>>
> >
> > I tried the patch, but got the attched errors (edited for brevity)
> >
> 
> I remember seeing those errors last week when I tried this, but I'm
> not seeing them now.

I think I did a make busybox-dirclean when I meant bash-dirclean

It built after I did the make bash-dirclean.

Thanks
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
