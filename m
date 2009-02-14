From: Daniel.Li <lida_mail@163.com>
Date: Sat, 14 Feb 2009 16:56:14 +0800
Subject: [Buildroot] 2009.02-rc4 released
In-Reply-To: <87ab8pe95n.fsf@macbook.be.48ers.dk>
References: <87ljsf7f2f.fsf@macbook.be.48ers.dk>
	<1234567053.7737.1.camel@daniel-laptop>
	<87eiy1ee3n.fsf@macbook.be.48ers.dk>
	<1234596306.6573.1.camel@daniel-laptop>
	<87ab8pe95n.fsf@macbook.be.48ers.dk>
Message-ID: <1234601774.6571.6.camel@daniel-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Well, it's OK now.
2009.02 can't run with out libncurses5-dev support under ubuntu 8.10.

Maybe, it has been changed a lot from my previous version, which can
execute "make menuconfig" with libncurses5-dev.

Thanks all the help.

On Sat, 2009-02-14 at 09:04 +0100, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Li <lida_mail@163.com> writes:
> 
>  >> Hard to know with your locale, but it seems like you don't have the
>  >> ncurses development package installed.
>  >> 
> 
>  Daniel> Well, my previous version, which I don't remember the exact version,
>  Daniel> about 1 year old, is OK with make menuconfig.
> 
>  Daniel> But this new version doesn't work. So I think there must be something
>  Daniel> else I have missed. Any ideas? Thanks
> 
> Can you run make menuconfig in any recent Linux kernel sources? We use
> the kconfig stuff from the kernel.
> 
> Does it work if you do export LANG=C before running make menuconfig?
> 
-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)
