From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:01:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/proj: bump version to 6.2.0
In-Reply-To: <20191006134735.12202-1-bernd.kuhls@t-online.de>
References: <20191006134735.12202-1-bernd.kuhls@t-online.de>
Message-ID: <20191007230106.026fcc52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 15:47:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added dependency to sqlite:
> https://github.com/OSGeo/PROJ/commit/4ad1477c24c3da4be6c7962606e6f9d47336b6a3
> 
> Needed for the libgeotiff version bump to 1.5.1.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/proj/Config.in | 1 +
>  package/proj/proj.hash | 6 +++---
>  package/proj/proj.mk   | 3 ++-
>  3 files changed, 6 insertions(+), 4 deletions(-)

Both applied. Thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
