From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 23 Sep 2009 13:48:28 +0200
Subject: [Buildroot] OpenSSL fails to build with AVR32
In-Reply-To: <4ABA0978.8070707@mimc.co.uk>
References: <4ABA040E.1000907@mimc.co.uk>
	<4ABA0978.8070707@mimc.co.uk>
Message-ID: <20090923134828.308653a9@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Sep 2009 12:41:44 +0100
Mark Jackson <mpfj-list@mimc.co.uk> wrote:

> Mark Jackson wrote:
> > With the latest git, openssl fails to build (see below).
> > 
> > Any ideas ?
> 
> <snip>
> 
> Aha ... looks like this ?
> 
> http://lists.busybox.net/pipermail/buildroot/2008-July/021680.html
> 
> But it's broken again ?
>

The patch, yes, since OpenSSL is probably bumped in version number.

You will only loose the optimized routines.

-- 
Best regards,
Hans-Christian Egtvedt
