From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Date: Fri, 23 Jan 2009 15:00:56 +0200
Subject: [Buildroot] DirectFB + linux-headers-2.6.28.1 compilation
	problem
In-Reply-To: <87ocxykwle.fsf@macbook.be.48ers.dk>
References: <fce2a370901230310y63c0ebe3x10e523e10154a96a@mail.gmail.com>
	<87sknakx0f.fsf@macbook.be.48ers.dk> <1232715256.6350.7.camel@sven>
	<87ocxykwle.fsf@macbook.be.48ers.dk>
Message-ID: <fce2a370901230500n9286d24n9a5acb135076032b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 23, 2009 at 2:58 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:
>
>  Sven> Hi,
>  Sven> On Fri, 2009-01-23 at 13:49 +0100, Peter Korsgaard wrote:
>
>  >> Does this also happen with latest trunk (E.G. where we have DirectFB
>  >> 1.2.7)?
>
>  Sven> Yes. Seems to be a problem in the kernel headers.
>
> From a quick look at it, it more looks like directfb shouldn't be
> including kernel headers in the first place.
>
> I'll take a closer look at it now.

DirectFB includes linux headers _for userspace_. It _should_ do it.
That's what these userspace includes for.

>
> --
> Bye, Peter Korsgaard
>
