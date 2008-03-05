From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 5 Mar 2008 08:06:43 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
In-Reply-To: <87fxv5qnfg.fsf@macbook.be.48ers.dk>
References: <20080305133525.0B2FF120129@busybox.net>
	<87fxv5qnfg.fsf@macbook.be.48ers.dk>
Message-ID: <20080305140643.GA626@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  sjhill> Fix patch. Apparently people don't know how to test
>  sjhill> their changes before cheking them in.
> 
> Strange. It seems like my tree was missing your patch from the 28th -
> sorry about that.
> 
> Everything seems to work fine without it though, what is the patch
> supposed to fix?
> 
At least when compiling for ARM, the build fails because of 'setjmp.h'
being included multiple times. I thing the check is stupid, so I removed
it.

-Steve
