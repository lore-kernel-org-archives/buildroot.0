From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 14:20:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk and
 package/openjdk-bin: bump version to 13.0.2+8
In-Reply-To: <20200202203931.694941-1-aduskett@gmail.com>
References: <20200202203931.694941-1-aduskett@gmail.com>
Message-ID: <20200203142015.67471eea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  2 Feb 2020 12:39:31 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Other changes:
>   - Add --with-stdc++lib=dynamic to openjdk.mk or else openjdk will fail to
>     build because it defaults to looking for a static libstdc++ library.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/openjdk-bin/openjdk-bin.hash | 2 +-
>  package/openjdk-bin/openjdk-bin.mk   | 8 ++++----
>  package/openjdk/openjdk.hash         | 2 +-
>  package/openjdk/openjdk.mk           | 7 ++++---
>  4 files changed, 10 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
