From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:59:23 +0200
Subject: [Buildroot] [PATCH 1/3] package/libglu: needs host-pkgconf
In-Reply-To: <20170913184544.5670-1-bernd.kuhls@t-online.de>
References: <20170913184544.5670-1-bernd.kuhls@t-online.de>
Message-ID: <f0a5b78d-58f8-21f0-5749-21b20bf78ea7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 20:45, Bernd Kuhls wrote:
> Fix build error
> 
>>>> libglu 9.0.0 Autoreconfiguring
> configure.ac:50: error: Could not locate the pkg-config autoconf macros.
>   These are usually located in /usr/share/aclocal/pkg.m4. If your macros
>   are in a different location, try setting the environment variable
>   ACLOCAL="aclocal -I/other/macro/dir" before running autoreconf.
> configure.ac:50: the top level
> autom4te: /home/buildroot/br4/output/host/bin/m4 failed with exit status: 1
> 
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_NVIDIA_DRIVER=y
> BR2_PACKAGE_LIBGLU=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 All three applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
