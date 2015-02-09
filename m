From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Feb 2015 09:07:38 +0100
Subject: [Buildroot] Buildroot 2015.02-rc1 released
In-Reply-To: <87zj8o3xi9.fsf@dell.be.48ers.dk>
References: <87zj8o3xi9.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LU9YB7fLihiWNw8MPMMbRQF1tzks3kFu6fqc1UtMHLH=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 8, 2015 at 10:26 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Hi,
>
> Buildroot 2015.02-rc1 is released - Go download it at:
>
> http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.gz
>
> or
>
> http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.bz2
>
> Or get it from Git:
>
> git://git.buildroot.net/buildroot
>
[..]
>
> Of noteworthy new features/changes we have:
>
> - Static/shared library handling reworked. This is now a tristate
>   (shared only / shared and static / static only). Default is now shared
>   only to speed up the build. BR2_PREFER_STATIC_LIB is now called
>   BR2_STATIC_LIBS.
>
> - The toolchain (internal and external) will now warn when an unsafe
>   library or header path is used (such as /usr/include or /usr/lib). If
>   BR2_COMPILER_PARANOID_UNSAFE_PATH is enabled under build options this
>   instead becomes an error.
>
> - Architectures: Freescale E5500 and E6500 PowerPC support added,
>   deprecated MIPS 1/2/3/4 support removed.
>
> - New defconfigs: Freescale p2020ds, MIPS creator CI20, Raspberrypi with
>   DT, UDOO Quad.
>
> - 'make <foo>_defconfig' now saves the path to the defconfig in the
>   .config, so a 'make savedefconfig' automatically updates it.
>
> - Infrastructure for packages using the Erland rebar tool has been added.

This should be 'Erlang' (just saying this for the final release notes).

Best regards,
Thomas
