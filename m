From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Feb 2015 08:34:52 +0100
Subject: [Buildroot] [PATCH] qt5multimedia: Make it compile with
 no-opengl
Message-ID: <trinity-91c97386-deea-4751-ba15-47a4842cbe82-1423467292576@3capp-gmx-bs56>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Vicente,

sorry for the double effort to try to compile qtmultimedia without opengl,
there was already a patch doing this, with additional fixing a problem
of the original upstream patch, see [1] for details.

So this patch is missing the second part of the upstream fixes, see [2]...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/118221.html
[2] https://qt.gitorious.org/qt/qtmultimedia/commit/ea222e64b1c98fa767a6a683d66a85026ab30ff2


On Sun, 08 Feb 2015 21:39:13 +0100, Peter Korsgaard  wrote:
>
> >>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>  > Backport an upstream patch to make it compile with no-opengl. Otherwise
>  > it will fail showing an error message like this one:
>
>  > qpaintervideosurface.cpp:99:47: error: 'QOpenGLContext' has not been
>  > declared
>
>  > Upstream commit:
>
>  >   https://qt.gitorious.org/qt/qtmultimedia/commit/2b181d546970d18a48a0f36f5d1a22418b61cd4d
>
>  > Fixes:
>
>  >   http://autobuild.buildroot.net/results/b77/b77cdf9b1cf6cafd5afef7337553bb32489207e5/
>
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
