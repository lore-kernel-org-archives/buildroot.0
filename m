From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:11:11 +0200
Subject: [Buildroot] [PATCH 1/1] release: remove manual build files from
 release tarballs
In-Reply-To: <1437128435-17331-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437128435-17331-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150718111111.57138b33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 17 Jul 2015 12:20:35 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The Buildroot release tarballs inadvertently contain a build/docs directory,
> containing the manual sources, the generated lists, and manual.text and
> manual.pdf (but excluding manual.html).
> 
> This directory is populated as $(BUILD_DIR) (==$(O)/build), while O is
> set explicitly from the release target to a subdirectory
> buildroot-xxxx.yy-git/ which was populated with 'git archive'.
> 
> Since the generated manuals are available in docs/manual, which is
> also referred to from the README, the build directory is not needed and
> should be removed from the release tarball.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
