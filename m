From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 3 Dec 2012 21:33:46 -0800
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
Message-ID: <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 3, 2012 at 2:20 PM, Bogdan Radulescu
<bogdan_radulescu99@yahoo.com> wrote:
>
>
> Hello everybody,
>
> I am using buildroot for generating a distro for ARM. I am able to add additional packages to buildroot or to use arm-linux-gcc directly to compile simple C programs.
>
> Still I haven't yet understood how to cross compile the perf userspace tool and I think it would be a very nice addition to buildroot.
>
> The perf tool requires elfutils and the kernel sources it comes with.
>
> My first problem is that elfutils will not successfully compile, as you can see here:
> http://pastie.org/pastes/5474687/text
>
> My elfutils.mk file looks like this http://pastie.org/pastes/5474697/text
>
> Please tell me how do I move further from this.
>
> Thanks,
> Bogdan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I forgot to cc buildroot at ... eh.

Original response:

I think you need the argp-standalone, as I don't think uclibc provides libargp.

-Bryan
