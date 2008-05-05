From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 5 May 2008 20:34:20 -0300
Subject: [Buildroot] Ulf, you broke AVR32, why?
In-Reply-To: <013a01c8aef9$5aa98d10$070514ac@atmel.com>
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
	<013a01c8aef9$5aa98d10$070514ac@atmel.com>
Message-ID: <d6cda7730805051634p6bb3a5c4mb9e584e6059cb693@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 5, 2008 at 6:41 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> > You removed something that was working in favor of something that is
>  > not for no reason.
>
>  The Atmel patches adds way too much bloat to the svn.

Google's entire svn history has 3Mb, including the AVR32 patches plus
careless local svn mv's. How is that too much bloat?

>  That is why the external toolchain was added.
>  Also, IIRC some patches broke other architectures.
>

That's why people is working on selectively applying patches based on $ARCH
