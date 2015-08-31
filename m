From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 31 Aug 2015 21:56:10 +0000
Subject: [Buildroot] [PATCH] arc: axs10x - bump Linux kernel to 4.2
	release
In-Reply-To: <87d1y3ryug.fsf@dell.be.48ers.dk>
References: <1441038349-14606-1-git-send-email-abrodkin@synopsys.com>
 <87d1y3ryug.fsf@dell.be.48ers.dk>
Message-ID: <1441058169.2935.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, 2015-08-31 at 22:23 +0200, Peter Korsgaard wrote:
> > > > > > "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> 
>  > Linux kernel 4.2 was finally released, so bumping from
>  > 4.2-rc5 to final release.
> 
>  > Also adding 1 back-ported patch that makes SD/MMC cards usable on AXS boards.
>  > This patch will be a part of 4.3 (already in linux-next) and hopefully
>  > will make its way in 4.2.1.
> 
>  > Once that patch appears in 4.2.x it must be removed from here.
> 
>  > Cc: Peter Korsgaard <peter@korsgaard.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>  > ---
> 
>  > Hopefully this is not too late for v2015.08 Buildroot release.
>  > 4.2 hasjust released and I had to test build on real HW.
>  > Sorry for that last moment patch.
> 
> Sorry, it is :/

Ooops. That's what happens when people (like me) start to think about
keeping in sync a couple of open source projects.

> You forgot to change the kernel headers to 4.2 as well, and we don't
> have a BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2 option yet.

It was intentional use of 4.1 headers just because 4.2 headers didn't
exist in buildroot. See http://lists.busybox.net/pipermail/buildroot/2015-August/135336.html

But now we'll have 4.2 headers soon and I will update my defconfigs anyways.

-Alexey
