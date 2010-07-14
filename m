From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jul 2010 16:29:49 -0300
Subject: [Buildroot] ncurses: build freezes without error with v5.7
In-Reply-To: <1279123755.7058.242.camel@cabbage.rehill.info>
References: <1279123755.7058.242.camel@cabbage.rehill.info>
Message-ID: <4C3E102D.50105@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/2010 01:09 PM, Quotient Remainder wrote:

> The following appears when I try to build with ncurses enabled.  No
> error is displayed but the tic command never returns.  "top" shows that
> tic is using 100% of CPU time.  I've let it run for 20 minutes or more
> and it doesn't progress any further.
> BR is current: c0e307b848d8de23e6f10a179c4f240c023c8b82.
> Toolchain is external, CodeSourcery ARM GNU/Linux 2009q3-67.

Try this patch from gentoo:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/files/ncurses-5.7-tic-cross-detection.patch?revision=1.1
Sounds a lot like your problem.
Regards.
