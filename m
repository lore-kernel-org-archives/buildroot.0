From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Feb 2009 22:42:46 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
References: <499E05A7.2070403@unix-beratung.de><87bpsv6ik4.fsf@macbook.be.48ers.dk><49A17E91.7060104@unix-beratung.de><87y6vy5okv.fsf@macbook.be.48ers.dk><20090223102825.GB31413@cbg.dyndns.org><87hc2l2yns.fsf@macbook.be.48ers.dk><1235456068.24843.35.camel@elrond.atmel.com>
	<87mycc1etl.fsf@macbook.be.48ers.dk>
Message-ID: <93F12DDAEC3E4BBFBAA4E030667F5EDD@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Hi,
>
> Steffen> It's far from small though.
>
> Ulf> Why not declare it as BROKEN?
> Ulf> I would not be surprised if someone would need it
> Ulf> at some point even if it has little attention at the moment.
>
> Well - It's HUGE (>7M), but OK, I'll mark it as BROKEN and remove if
> after the 2009.05 release unless someone steps up to fix it. I'll also
> remove the kernel patches as we remove old kernel versions.
> -- 
> Bye, Peter Korsgaard
>

If you feel that the stuff should not be in the svn, then
make the patches loadable and store the patches in the mirror.

As pointed out to you earlier, buildroot users are using linux-2.6.22 and 
later
so there is no reason to remove things which is active use.
Again, it makes sense to move the patches to the mirror,
but yuu are the only one to have write acdess as far as I know.

Best Regards
Ulf Samuelsson
