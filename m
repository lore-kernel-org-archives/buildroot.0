From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 21:19:13 +0200
Subject: [Buildroot] [PATCH v3 03/13] package/libbytesize: new package
In-Reply-To: <20200725230618.3640682-4-aduskett@gmail.com>
References: <20200725230618.3640682-1-aduskett@gmail.com>
 <20200725230618.3640682-4-aduskett@gmail.com>
Message-ID: <20200829211913.7398724a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Jul 2020 16:06:08 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Libbytesize is a small library providing a C "class" for working with
> arbitrary big sizes in bytes.
> 
> The mdraid plugin for libblockdev depends on this package, which newer
> versions of udisks require when building with the udisks daemon enabled.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add 0001-remove-msgcat-dependency.patch (Thomas)
>   - Remove dependency on gettext-gnu (Thomas)

You had forgotten to add the package in package/Config.in, so I fixed
that up, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
