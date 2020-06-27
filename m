From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:41:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/mraa: fix toolchain requirements
In-Reply-To: <20200627140038.31819-1-pieterjan.camerlynck@gmail.com>
References: <20200627140038.31819-1-pieterjan.camerlynck@gmail.com>
Message-ID: <20200627164105.7e6b8c32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 27 Jun 2020 16:00:38 +0200
Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com> wrote:

> New version of mraa has some extra toolchain requirements, added
> dependency on !BR2_STATIC_LIBS and BR2_INSTALL_LIBSTDCPP
> 
> Fixes:
> - http://autobuild.buildroot.net/results/f2829a0aff5bd6f73a837c813f20de5df33c7606
> - http://autobuild.buildroot.net/results/b4434724ac810b35913a5e49b43e27e0418b5b9c
> - http://autobuild.buildroot.net/results/6c7f19ea9757b483c3c7fe35d72ce9f9304f5919
> - http://autobuild.buildroot.net/results/1c2bbeda09a695af2e53b0f72a116e6abef94b23
> - http://autobuild.buildroot.net/results/7ea000298a4806040d9ec6140097eb3036440ee9
> 
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
> ---
>  package/mraa/Config.in | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
