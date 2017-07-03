From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:52:45 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/libva-utils: new package
In-Reply-To: <20170703210953.9667-1-bernd.kuhls@t-online.de>
References: <20170703210953.9667-1-bernd.kuhls@t-online.de>
Message-ID: <20170704005245.373d64f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Jul 2017 23:09:53 +0200, Bernd Kuhls wrote:
> The utils provided by this package were formerly packaged with libva.
> 
> Libva contained a patch not to compile mpeg2vldemo to reduce
> dependencies by avoiding C++, this patch is not moved to this package.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>
> ---
> v4: - bumped version to 1.8.3
> v3: - bumped version to 1.8.1
>     - used "select BR2_PACKAGE_LIBVA" instead of "depends on" (Arnout)
>       Imho it makes sense to have only one Kconfig option for libva-
>       utils. @Arnout:
>       I kept the package in "Graphic libraries and applications" because
>       it is not a library and also kept the package name so it stays in
>       sync with the upstream name.
>     - added comment about c++ dependency (Thomas)
> v2: addressed review by Thomas:
>     - added entry in DEVELOPERS
>     - moved package to Graphic libraries and applications
>     - package depends on libva

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
