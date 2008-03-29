From: Will Newton <will.newton@gmail.com>
Date: Sat, 29 Mar 2008 12:08:19 +0000
Subject: [Buildroot] legacy sources in svn
In-Reply-To: <87k5jmft4j.fsf@macbook.be.48ers.dk>
References: <1206738394.3224.82.camel@nigel-x60>
	<87k5jmft4j.fsf@macbook.be.48ers.dk>
Message-ID: <87a5b0800803290508t3b1bd407n1eb2e2c76c2a803a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2008 at 9:14 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
>
>   Nigel> Is there a reason for example that there are removed gcc
>   Nigel> versions still in toolchain/gcc/x.y.z ?
>
>   Nigel> Are they kept there incase someone needs to build an older version?
>
>  I think people simply forget to remove them when they remove the
>  Kconfig stuff - I have lately been cleaning up the uClibc patches that
>  weren't used any more.
>
>   Nigel> Surely they can get the old patches from svn? I mean, the
>   Nigel> versions are mostly removed from all Config.in and .mk files
>   Nigel> anyway?
>
>  Exactly, feel free to remove them.

I have some concerns about this. People may want to keep stable
toolchains to avoid bugs in newer versions or for QA purposes.
Removing working configurations in the name of "tidying up" sounds
like a bad idea to me.
