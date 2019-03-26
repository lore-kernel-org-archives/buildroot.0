From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:45:00 +0100
Subject: [Buildroot] [PATCH v1] package/at-spi2-core: fix build with
 meson 0.50.0
In-Reply-To: <20190321190756.32410-1-ps.report@gmx.net>
References: <20190321190756.32410-1-ps.report@gmx.net>
Message-ID: <20190326184500.4f1d9cf0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Mar 2019 20:07:56 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add upstream patch [1] to fix build with meson 0.50.0 (as suggested
> by Thomas Petazzoni ).
> 
> Fixes [2]:
> 
>   atspi/meson.build:60:0: ERROR: Subdir keyword must not be an absolute path.
> 
> [1] https://github.com/GNOME/at-spi2-core/commit/44a812ea51223d82f21a098a2d45fcc5c329ce7a.patch
> [1] http://autobuild.buildroot.net/results/83250522c79b5749fc8236ba2b0e873a12747413
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - no need to apply the patch as the meson bump to 0.50.0 is reverted
>     (see [3])

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
