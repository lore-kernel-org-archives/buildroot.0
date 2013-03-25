From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 25 Mar 2013 12:50:41 +0100
Subject: [Buildroot] X.org bump to 7.7
In-Reply-To: <20130324104904.2e980f14@skate>
References: <20130324104904.2e980f14@skate>
Message-ID: <CALnvph0o+2qNZmcZXT=-GF9sM+1jXtZCqQ6rJ5_W3WqOdn3cGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Sun, Mar 24, 2013 at 10:49 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Peter,
>
> I think you can pull the x11r77_v2 branch from
> https://bitbucket.org/baekdahl/buildroot. Notice that this is a
> slightly more recent version than the one posted on the list, so you
> shouldn't use patchwork to apply it. Considering the number of patches,
> I think pulling Jesper's branch is the easiest solution.
>
> I've build-tested this branch in two situations:
>
>  * ARM Buildroot toolchain, as minimal as possible: only WCHAR enabled,
>    which is the only mandatory requirement for X.org. Did a Kdrive
>    build of X.org, after enabling a bunch of random X applications.
>
>  * PowerPC glibc external toolchain. Did a Modular X.org build, after
>    enabling a bunch of random X.org drivers and X.org applications.
>
> Both builds went fine, so I think we should pull this X.org bump.


Thank you for testing, and helping me redo the patches. Nice to see that
they have been included.

Regards, Jesper
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/4bf6f279/attachment.html>
