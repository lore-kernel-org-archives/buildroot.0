From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 1 Jul 2013 15:29:59 -0400
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <87obapxr4y.fsf@dell.be.48ers.dk>
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 <87obapxr4y.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt52OPdj0gmCZ8narNkgSpAZahnWR_-iuTHTe+nvHsjvHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed that most the original python3-3.3-* patches got renamed to
python3-*.  But one did not, python3-3.3-012-old-stdlib-cache.patch.  This
feels like an oversight - was it supposed to be renamed, or deleted maybe?

Danomi -


On Sat, Jun 29, 2013 at 4:22 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>
>  Maxime> Some of the python2 patches were left behind when doing the
> python3
>  Maxime> package. This was because the python build system can now
> autodetect
>  Maxime> what packages can be built in the system.
>
>  Maxime> However, some of these patches are actually useful to reduce
>  Maxime> drastically the size of the interpreter.
>
>  Maxime> This patch ports the relevant patches to the python3 package,
>  Maxime> and adds a new patch to remove the idle3 IDE as well from the
>  Maxime> interpreter.
>
>  Maxime> Fixes #5696
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130701/b26c2ae3/attachment.html>
