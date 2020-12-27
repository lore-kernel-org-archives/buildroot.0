From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:27:22 +0100
Subject: [Buildroot] [git commit] package/pkg-meson: force-disable
 binary stripping
In-Reply-To: <20201225154534.237E38227D@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 25 Dec 2020 16:57:12 +0100")
References: <20201225154534.237E38227D@busybox.osuosl.org>
Message-ID: <87y2hjbqmt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3f39f902b3cd685c3c971941138e0df50947737c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In buildroot, stripping for the target is configured and implemented
 > with the global `BR2_STRIP_strip` option that drive the stripping in
 > the target-finalize step.

 > So, we explicitly disable stripping at build time for the target
 > variants.

 > For the host variants, however, we don't much care about symbols and
 > stuff, but smaller executables will hopefully load faster than bigger
 > ones (disputable, given that sections in ELF files are paged-in
 > on-demand), so we explictly enable stripping.

 > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
 > [yann.morin.1998 at free.fr:
 >   - add burb about the target-finalize step
 >   - enable stripping for host variants
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
