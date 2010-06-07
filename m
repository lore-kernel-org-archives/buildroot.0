From: Dmytro Milinevskyy <milinevskyy@gmail.com>
Date: Tue, 8 Jun 2010 00:37:01 +0300
Subject: [Buildroot] [PATCH] target skeleton definition
In-Reply-To: <87d3w2k0e0.fsf@macbook.be.48ers.dk>
References: <4c0d5b02.8c4bdf0a.5e33.ffff9c4e@mx.google.com> 
	<20100607230541.5f2bf769@surf> <87d3w2k0e0.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTik8q5u0zS1M4VBD-8YEQ35CNQf5r-EBbWe2c6_z@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter,

some targets depend on busybox skeleton. Are you sure it's safe to
remove it completely?

-- Dima

On Tue, Jun 8, 2010 at 12:17 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
> ?Thomas> Hello Dmytro,
> ?Thomas> On Mon, 7 Jun 2010 21:06:42 +0300
> ?Thomas> Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:
>
> ?>> Here's the patch to give posibility to redefine path to the rootfs
> ?>> skeleton. Also this patch moves default and busybox skeleton trees
> ?>> into fs/skeleton dir.
>
> ?Thomas> Thanks for this patch. In general, this is something I intended to do,
> ?Thomas> so it's great to see patches implementing this.
>
> ?Thomas> Personaly, I'd prefer if we could get rid of the "busybox" skeleton
> ?Thomas> altogether. I think Peter Korsgaard agreed with this decision, but I'll
> ?Thomas> let him restate his preference here.
>
> Yes, I think now would be a good moment to cleanup this stuff.
>
> ?Thomas> If Peter agrees, then the skeleton could be moved to just fs/skeleton/.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
