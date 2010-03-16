From: Nuno Pereira <fxss@iol.pt>
Date: Tue, 16 Mar 2010 19:57:08 +0000
Subject: [Buildroot] copysignl.c
In-Reply-To: <871vfkhyp0.fsf@macbook.be.48ers.dk>
References: <13abadeb1003100227q6e3bf7e8x68669e87263decfc@mail.gmail.com>
	<87ocirz7gz.fsf@macbook.be.48ers.dk>
	<13abadeb1003161200r4cad3717g8fe47b784fef2274@mail.gmail.com>
	<871vfkhyp0.fsf@macbook.be.48ers.dk>
Message-ID: <13abadeb1003161257q5e8ad3baif9be17ea595cf531@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This fix allows to compile BR with software floating point support
with shared libgcc.

If you keep software floating point support enabled and disable shared
libgcc, it compiles ok but when you enable shared libgcc, compilation
blows due to an invalid reference to copysignl.c.

Regards,
Nuno

On 16 March 2010 19:08, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Nuno" == Nuno Pereira <fxss@iol.pt> writes:
>
> ?Nuno> Hi,
> ?Nuno> In the latest release of Buildroot, I think that fix should be included:
>
> ?Nuno> http://lists.busybox.net/pipermail/buildroot/2010-February/031987.html
>
> What exactly does this fix? I'm using BR on ppc daily, and never seen
> this problem.
>
> --
> Bye, Peter Korsgaard
>
