From: James Ronald <james.ronald@gmail.com>
Date: Mon, 9 Aug 2010 10:18:14 -0400
Subject: [Buildroot] Building external i586 ARM cross toolchain on x64
	Linux
In-Reply-To: <i3hrp5$nia$1@dough.gmane.org>
References: <AANLkTik6X-qDUV4Uxf6x7FfBwZG6SinA7gzFC+18Aefa@mail.gmail.com>
	<i3hrp5$nia$1@dough.gmane.org>
Message-ID: <AANLkTi=cJmoQ=45zMBcS2pQeyEENWgtXtic8=Z-U8TLT@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 6, 2010 at 4:36 PM, Grant Edwards <grant.b.edwards@gmail.com>wrote:

> On 2010-08-06, James Ronald <james.ronald@gmail.com> wrote:
>
> > Building such on 32 bit Linux distribution works great but I would like
> to
> > switch to using a 64 bit Linux distribution and still be able to build an
> > 32bit (i586) external (portable) tool chain.
>
> I don't know why the procedure would be any different.  What exactly
> failed?
>

Grant,

Buildroot will automatically build a 64 bit cross toolchain when run on 64
bit Linux and a 32 bit cross toolchain when run on 32 bit Linux.  I am
asking if there is a buildroot "preferred method" or "best practice" for
building a 32 bit cross toolchain on on 64 bit Linux.

- Jim
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100809/e19e22ef/attachment.html>
