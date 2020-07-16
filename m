From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:28:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/gpm: fix build failure with gcc
 10
In-Reply-To: <20200716184528.25630-1-heiko.thiery@gmail.com>
References: <20200716184528.25630-1-heiko.thiery@gmail.com>
Message-ID: <20200716222830.45eb91e8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 20:45:27 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Add a patch from upstream [1] to fix -fno-common build failure
> 
> [1] https://github.com/telmich/gpm/commit/f04f24dd5ca5c1c13608b144ab66e2ccd47f106a
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...on.h-avoid-redefinition-of-last_sele.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/gpm/0006-src-headers-daemon.h-avoid-redefinition-of-last_sele.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
