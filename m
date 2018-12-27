From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 09:48:39 +0100
Subject: [Buildroot] [PATCH 1/1] glib-networking: bump version to 2.56.1
In-Reply-To: <20181226232942.99929-1-aduskett@gmail.com>
References: <20181226232942.99929-1-aduskett@gmail.com>
Message-ID: <20181227094839.395f7102@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 18:29:42 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Other changes:
>   - glib-networking is now a meson package and has no support for auto-tools.
>   - Update configure options to reflect the above change to meson.
>   - gnutls is now a dependency of glib-networking.
>   - Add License file hash.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/848282be656809e26a704ff92842e6bde6875a3e

Thanks for this version bump. However, before committing this version
bump, I'd like to fix the build failure of glib-network with the
current version, and then apply this version bump.

The current glib-networking version used to build fine, and it's only
the recent pkg-config changes that broke it. I'm looking into this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
