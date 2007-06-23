From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 23 Jun 2007 11:14:26 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
In-Reply-To: <f0528b5b0706221458w11b681a6q4029cc57b8871077@mail.gmail.com>
References: <20070622190151.09C9D48673@busybox.net>
	<f0528b5b0706221458w11b681a6q4029cc57b8871077@mail.gmail.com>
Message-ID: <20070623091426.GE4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 22, 2007 at 11:58:11PM +0200, Julien Letessier wrote:
>Almost exactly what I was about to submit  :)
>(my builds were broken)
>
>Extra patch:
>- replace $(STAGING_DIR)/ccache-bin with a $(CCACHE_PATH) variable
>(lower redundandy)
>- define CCACHE_PATH to be under usr/libexec, which is more LSB-ish.

Sounds nice. Care to send a tested patch?

cheers,
