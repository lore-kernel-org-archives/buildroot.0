From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 07:30:04 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: fixes build of iio
 with 4.14+ kernels
In-Reply-To: <1512733938-29854-1-git-send-email-julien.boibessot@free.fr>
References: <1512733938-29854-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20171212073004.6f6d72e3@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  8 Dec 2017 12:52:18 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Since this commit [1], iio build has been moved to other linux-tools build
> system. Installation dir is now given by DESTDIR, like for all other linux-tools.
> I kept INSTALL_DIR env and 'install' target to be compatible with oldest
> kernels.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/tools/iio/Makefile?h=v4.14.4&id=18956cf2d78a8d4a5959e20240f04ce8d5a6c121
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/linux-tools/linux-tool-iio.mk.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master after improving the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
