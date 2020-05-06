From: Kunal Chauhan <atkunalchauhan@gmail.com>
Date: Wed, 6 May 2020 12:24:57 +0530
Subject: [Buildroot] Help: to understand build root (Andreas Ziegler)
In-Reply-To: <mailman.1828.1588743310.59095.buildroot@busybox.net>
References: <mailman.1828.1588743310.59095.buildroot@busybox.net>
Message-ID: <CACEFAc2MZRPhuct4xF++93nUXjDs5La74Jkb-3fwN1=SFJepbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

1.Team just gone through the url given but still I am confused what is the
main purpose of making build_root directory, when we can compile our source
in different way.
2. May be I am not understanding the concept as I am  new to
firmware concept. but question is also how the code is built and test as a
developer

please elaborate ? or help me to understand



Thanks
kunal

On Wed, May 6, 2020 at 11:06 AM <buildroot-request@busybox.net> wrote:

> Send buildroot mailing list submissions to
>         buildroot at busybox.net
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.busybox.net/mailman/listinfo/buildroot
> or, via email, send a message with subject or body 'help' to
>         buildroot-request at busybox.net
>
> You can reach the person managing the list at
>         buildroot-owner at busybox.net
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of buildroot digest..."
>
>
> Today's Topics:
>
>    1. Re: [PATCH v5 1/3] package/environment-setup: new package
>       (Angelo Compagnucci)
>    2. [PATCH] hsdk/linux: Fix USB regression (Evgeniy Didin)
>    3. [git commit] CHANGES: start updating for 2020.05-rc1 release
>       (Thomas Petazzoni)
>    4. Re: [PATCH] package/solarus: bump to version 1.6.4
>       (Thomas Petazzoni)
>    5. Re: [PATCH] package/zziplib: bump to version 0.13.71
>       (Thomas Petazzoni)
>    6. Re: [PATCH v2] package/libnss: bump version to 3.52
>       (Thomas Petazzoni)
>    7. Re: [PATCH] package/python-redis: Bump to version 3.5.0
>       (Thomas Petazzoni)
>    8. Re: Help: to understand build root (Andreas Ziegler)
>    9. Re: [PATCH] azure-iot-sdk-c: fix missing libraries
>       (Peter Korsgaard)
>   10. Re: [PATCH] board/wandboard/post-build.sh: create boot.scr at
>       TARGET_DIR/boot (Peter Korsgaard)
>   11. Re: [PATCH] package/libssh: security bump to version 0.9.4
>       (Peter Korsgaard)
>   12. Re: [PATCH 1/1] package/libssh: add patch to fix reported
>       version (Peter Korsgaard)
>   13. Re: [PATCH] package/libssh: add patch to fix regression
>       (Peter Korsgaard)
>   14. Re: [PATCH] package/exim: fix log and pid file paths
>       (Peter Korsgaard)
>   15. Re: [PATCH 1/1] package/mbedtls: security bump to version
>       2.16.6 (Peter Korsgaard)
>   16. Re: [git commit] package/python-iptables: add explicit
>       dependency on dynamic libs (Peter Korsgaard)
>   17. Re: [git commit] package/python-iptables: account for
>       platform tag in extensions (Peter Korsgaard)
>   18. Re: [git commit] package/python-iptables: try known libc
>       instead of find_library() (Peter Korsgaard)
>   19. Re: [PATCH 1/1] package/php: security bump version to 7.4.5
>       (Peter Korsgaard)
>   20. Re: [PATCH] package/python-dpkt: remove Python2 only
>       dependency (Peter Korsgaard)
>   21. Re: [git commit] package/libsepol: fix help text for
>       BR2_PACKAGE_LIBSEPOL_POLICY_VERSION (Peter Korsgaard)
>   22. Re: [PATCH] package/polkit: properly autoreconf (Peter Korsgaard)
>   23. Re: [PATCH 1/4] package/polkit: install service file
>       (Peter Korsgaard)
>   24. Re: [PATCH 2/4] package/polkit: add upstream memory leak fix
>       (Peter Korsgaard)
>   25. Re: [PATCH 3/4] package/polkit: add upstream fix for SIGTTOU
>       (Peter Korsgaard)
>   26. Re: [PATCH 1/2] package/php: fix zip support (Peter Korsgaard)
>   27. Re: [PATCH 2/2] package/php: fix gd dependencies (Peter Korsgaard)
>   28. Re: [PATCH v2] package/netsnmp: unix domain socket transport
>       (Peter Korsgaard)
>   29. Re: [PATCH 1/1] package/openvpn: security bump version to
>       2.4.9 (Peter Korsgaard)
>   30. [git commit branch/2020.02.x] package/azure-iot-sdk-c: fix
>       installation of libumqtt (Peter Korsgaard)
>   31. [git commit branch/2020.02.x] package/azure-iot-sdk-c: format
>       the libraries list with one lib per line (Peter Korsgaard)
>   32. [git commit branch/2020.02.x] package/azure-iot-sdk-c: also
>       install libparson (Peter Korsgaard)
>   33. [git commit branch/2020.02.x] package/polkit: add upstream
>       memory leak fix (Peter Korsgaard)
>   34. [git commit branch/2020.02.x] board/wandboard/post-build.sh:
>       create boot.scr at TARGET_DIR/boot (Peter Korsgaard)
>   35. [git commit branch/2020.02.x] package/azure-iot-sdk-c: create
>       function for library installation (Peter Korsgaard)
>   36. [git commit branch/2020.02.x] package/libssh: add patch to
>       fix reported version (Peter Korsgaard)
>   37. [git commit branch/2020.02.x] board/udoo/neo: create boot.scr
>       in TARGET_DIR/boot (Peter Korsgaard)
>   38. [git commit branch/2020.02.x] package/php: fix zip support
>       (Peter Korsgaard)
>   39. [git commit branch/2020.02.x] package/php: fix gd extension
>       dependencies and options (Peter Korsgaard)
>   40. [git commit branch/2020.02.x] package/python-iptables: add
>       explicit dependency on dynamic libs (Peter Korsgaard)
>   41. [git commit branch/2020.02.x] board/solidrun/mx6cubox: create
>       boot.scr in TARGET_DIR/boot (Peter Korsgaard)
>   42. [git commit branch/2020.02.x] package/libssh: security bump
>       to version 0.9.4 (Peter Korsgaard)
>   43. [git commit branch/2020.02.x] package/mbedtls: security bump
>       to version 2.16.6 (Peter Korsgaard)
>   44. [git commit branch/2020.02.x] package/libssh: add patch to
>       fix regression (Peter Korsgaard)
>   45. [git commit branch/2020.02.x] package/python-iptables:
>       account for platform tag in extensions (Peter Korsgaard)
>   46. [git commit branch/2020.02.x] package/exim: fix log and pid
>       file paths (Peter Korsgaard)
>   47. [git commit branch/2020.02.x] package/python-iptables: try
>       known libc instead of find_library() (Peter Korsgaard)
>   48. [git commit branch/2020.02.x] package/python-dpkt: remove
>       Python2 only dependency (Peter Korsgaard)
>   49. [git commit branch/2020.02.x] package/libsepol: fix help text
>       for BR2_PACKAGE_LIBSEPOL_POLICY_VERSION (Peter Korsgaard)
>   50. [git commit branch/2020.02.x] package/azure-iot-sdk-c: use
>       full destination path for $(INSTALL) (Peter Korsgaard)
>   51. [git commit branch/2020.02.x] package/polkit: add upstream
>       fix for SIGTTOU (Peter Korsgaard)
>   52. [git commit branch/2020.02.x] package/php: security bump
>       version to 7.4.5 (Peter Korsgaard)
>   53. [git commit branch/2020.02.x] package/netsnmp: unix domain
>       socket transport (Peter Korsgaard)
>   54. [git commit branch/2020.02.x] package/polkit: properly
>       autoreconf (Peter Korsgaard)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue, 5 May 2020 22:43:20 +0200
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> To: Mircea GLIGA <mgliga@bitdefender.com>
> Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,  Buildroot
>         Mailing List <buildroot@buildroot.org>
> Subject: Re: [Buildroot] [PATCH v5 1/3] package/environment-setup: new
>         package
> Message-ID:
>         <
> CA+TH9VmTLkxGqrGTeVmv2yMz-01EmsxpeQ_3DmXAGGD285tPWA at mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
>
> Hi Mircea,
>
> Il giorno mar 28 apr 2020 alle ore 13:04 Mircea GLIGA
> <mgliga@bitdefender.com> ha scritto:
> >
> > Hi Angelo
> >
> > See my comment below.
> >
> > BR
> > Mircea
> >
> > On 4/28/20 11:42 AM, Angelo Compagnucci wrote:
> > > On Tue, Apr 28, 2020 at 9:42 AM Mircea GLIGA <mgliga@bitdefender.com>
> wrote:
> > >>
> > >> Hi Angelo,
> > >>
> > >> Thanks for applying my suggestions, see my comments below.
> > >> Order of the `sed` expressions is important, changing the order broke
> the
> > >> usage of the CROSS_COMPILE variable. The AR, AS, CC etc are not using
> > >> that variable anymore.
> > >> Order should be:
> > >> * replace TARGET_CROSS with $CROSS_COMPILE
> > >> * make use of the PATH variable, remove paths already in PATH
> > >> * replace HOST_DIR with $SDK_PATH
> > >
> > > I don't think it's strictly necessary to have ${CROSS_COMPILE}
> > > everywhere. I prefer to have the executable name in $AR, $AS and so
> > > on.
> > >
> >
> > Ok, then you should drop the `ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP`
> > expression and remove it from the `sed` command because it will not
> > match anything.
>
> Had you time to have a look and test the patch v6?
>
> https://patchwork.ozlabs.org/project/buildroot/list/?series=173257
>
> Thanks!
>
> >
> > > Anyway, for CROSS_COMPILE, only the prefix is used to compose the
> > > executable name, so
> > >
> > > $ which ${CROSS_COMPILE}gcc
> > > /FULLPATH/host/bin/arm-linux-gnueabihf-gcc
> > > $ which ${CC}
> > > /FULLPATH/host/bin/arm-linux-gnueabihf-gcc
> > >
> > >>
> > >> Best regards
> > >> Mircea
> > >>
> > >> See the output diff:
> > >>
> > >> --- environment-setup   2020-04-28 09:55:19.927381470 +0300
> > >> +++ environment-setup_v5        2020-04-28 10:01:45.387944589 +0300
> > >> @@ -14,23 +14,22 @@
> > >>
> > >>    EOF
> > >>    SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> > >> -export "CROSS_COMPILE=armeb-buildroot-linux-uclibcgnueabi-"
> > >>    export
> > >>
> "PATH=$SDK_PATH/bin:$SDK_PATH/sbin:/home/mgliga/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
> > >> -export "AR=${CROSS_COMPILE}ar"
> > >> -export "AS=${CROSS_COMPILE}as"
> > >> -export "LD=${CROSS_COMPILE}ld"
> > >> -export "NM=${CROSS_COMPILE}nm"
> > >> -export "CC=${CROSS_COMPILE}gcc"
> > >> -export "GCC=${CROSS_COMPILE}gcc"
> > >> -export "CPP=${CROSS_COMPILE}cpp"
> > >> -export "CXX=${CROSS_COMPILE}g++"
> > >> -export "FC=${CROSS_COMPILE}gfortran"
> > >> -export "F77=${CROSS_COMPILE}gfortran"
> > >> -export "RANLIB=${CROSS_COMPILE}ranlib"
> > >> -export "READELF=${CROSS_COMPILE}readelf"
> > >> -export "STRIP=${CROSS_COMPILE}strip"
> > >> -export "OBJCOPY=${CROSS_COMPILE}objcopy"
> > >> -export "OBJDUMP=${CROSS_COMPILE}objdump"
> > >> +export "AR=armeb-buildroot-linux-uclibcgnueabi-ar"
> > >> +export "AS=armeb-buildroot-linux-uclibcgnueabi-as"
> > >> +export "LD=armeb-buildroot-linux-uclibcgnueabi-ld"
> > >> +export "NM=armeb-buildroot-linux-uclibcgnueabi-nm"
> > >> +export "CC=armeb-buildroot-linux-uclibcgnueabi-gcc"
> > >> +export "GCC=armeb-buildroot-linux-uclibcgnueabi-gcc"
> > >> +export "CPP=armeb-buildroot-linux-uclibcgnueabi-cpp"
> > >> +export "CXX=armeb-buildroot-linux-uclibcgnueabi-g++"
> > >> +export "FC=armeb-buildroot-linux-uclibcgnueabi-gfortran"
> > >> +export "F77=armeb-buildroot-linux-uclibcgnueabi-gfortran"
> > >> +export "RANLIB=armeb-buildroot-linux-uclibcgnueabi-ranlib"
> > >> +export "READELF=armeb-buildroot-linux-uclibcgnueabi-readelf"
> > >> +export "STRIP=armeb-buildroot-linux-uclibcgnueabi-strip"
> > >> +export "OBJCOPY=armeb-buildroot-linux-uclibcgnueabi-objcopy"
> > >> +export "OBJDUMP=armeb-buildroot-linux-uclibcgnueabi-objdump"
> > >>    export "AR_FOR_BUILD=/usr/bin/ar"
> > >>    export "AS_FOR_BUILD=/usr/bin/as"
> > >>    export "CC_FOR_BUILD=ccache /usr/bin/gcc"
> > >> @@ -42,8 +41,8 @@
> > >>    export "CXXFLAGS_FOR_BUILD=-O2 -I$SDK_PATH/include"
> > >>    export "LDFLAGS_FOR_BUILD=-L$SDK_PATH/lib -Wl,-rpath,$SDK_PATH/lib"
> > >>    export "FCFLAGS_FOR_BUILD="
> > >> -export "DEFAULT_ASSEMBLER=${CROSS_COMPILE}as"
> > >> -export "DEFAULT_LINKER=${CROSS_COMPILE}ld"
> > >> +export "DEFAULT_ASSEMBLER=armeb-buildroot-linux-uclibcgnueabi-as"
> > >> +export "DEFAULT_LINKER=armeb-buildroot-linux-uclibcgnueabi-ld"
> > >>    export "CPPFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > >> -D_FILE_OFFSET_BITS=64"
> > >>    export "CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > >> -D_FILE_OFFSET_BITS=64  -Os  "
> > >>    export "CXXFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> > >> -D_FILE_OFFSET_BITS=64  -Os  "
> > >> @@ -53,5 +52,6 @@
> > >>    export "PKG_CONFIG=pkg-config"
> > >>    export
> "STAGING_DIR=$SDK_PATH/armeb-buildroot-linux-uclibcgnueabi/sysroot"
> > >>    export "INTLTOOL_PERL=/usr/bin/perl"
> > >> +export "CROSS_COMPILE=armeb-buildroot-linux-uclibcgnueabi-"
> > >>    export
> "CONFIGURE_FLAGS=--target=armeb-buildroot-linux-uclibcgnueabi
> > >> --host=armeb-buildroot-linux-uclibcgnueabi --build=x86_64-pc-linux-gnu
> > >> --prefix=/usr --exec-prefix=/usr --sysconfdir=/etc
> --localstatedir=/var
> > >> --program-prefix="
> > >>    PS1="\[\]buildroot-2020.02\[\]:\[\]\w\[\]$ "
> > >>
> > >>
> > >>
> > >> On 4/27/20 11:36 PM, Angelo Compagnucci wrote:
> > >>> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> > >>>
> > >>> Install an helper script to setup a build environment based on
> buildroot.
> > >>> It's useful when a developer wants to use a buildroot generated sdk
> to
> > >>> build an external project.
> > >>> Due to the nature of the intrusiveness of this script, a new PS1 is
> > >>> installed to let the user understand that the current running shell
> is
> > >>> not a normal shell.
> > >>>
> > >>> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > >>> ---
> > >>> Changelog:
> > >>> v1->v2:
> > >>>    * Moved from echo to printf (Yann)
> > >>>    * removed sh extension (Yann)
> > >>>    * Adding missing script
> > >>> v2->v3:
> > >>>    * Split the patch
> > >>> v3->v4:
> > >>>    * Better handling of SDK_PATH dir (Mircea Gliga)
> > >>> v4->v5:
> > >>>    * Cleaning the script using SDK_PATH where possible (Mircea Gliga)
> > >>>
> > >>> Some of the reason I kept several things the way I originally
> planned:
> > >>>
> > >>>    * I kept it being a package because it doesn't fit in any other
> tool:
> > >>>      indeed this script changes your curent PATH and exports some
> variables
> > >>>      that can be used for anything. Think of qmake or cmake or a
> package
> > >>>      that doesn't have any build system at all. It has some features
> geared
> > >>>      also towards autotools software but I keep planning others.
> > >>>    * I kept the script being installed in host root: other build
> system does that
> > >>>      and I want this script to mimic other build systems.
> > >>>    * I kept looping in TARGET_CONFIGURE_OPTS, indeed it produces a
> more clean
> > >>>      environment script at the end. For the problem arised by Yann:
> variables in
> > >>>      TARGET_CONFIGURE_OPTS _are_ properly escaped, indeed if not,
> they were a
> > >>>      big source of problems on each ./configure invocation due to
> the fact they
> > >>>      are injected on the ./configure commandline invocation.
> > >>>    * I kept the PS1: this script heavily mess with the path, it is
> expected by the
> > >>>      user running it, but it can be very confusing being on a shell
> that
> > >>>      doesn't behaves like your normal shell. So having a different
> PS1 helps
> > >>>      remembering you are running into the buildroot shell and not
> into an ordinary
> > >>>      one (other build systems does the same).
> > >>>    * I kept the manual entry: I think that the most documentation
> the better.
> > >>>
> > >>>    docs/manual/using-buildroot-toolchain.txt     |  7 ++++
> > >>>    package/Config.in                             |  1 +
> > >>>    package/environment-setup/Config.in           |  6 ++++
> > >>>    package/environment-setup/environment-setup   | 16 +++++++++
> > >>>    .../environment-setup/environment-setup.mk    | 34
> +++++++++++++++++++
> > >>>    5 files changed, 64 insertions(+)
> > >>>    create mode 100644 package/environment-setup/Config.in
> > >>>    create mode 100644 package/environment-setup/environment-setup
> > >>>    create mode 100644 package/environment-setup/environment-setup.mk
> > >>>
> > >>> diff --git a/docs/manual/using-buildroot-toolchain.txt
> b/docs/manual/using-buildroot-toolchain.txt
> > >>> index 0c0c35fced..7b2de4bdfa 100644
> > >>> --- a/docs/manual/using-buildroot-toolchain.txt
> > >>> +++ b/docs/manual/using-buildroot-toolchain.txt
> > >>> @@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must
> run the script
> > >>>    +relocate-sdk.sh+ (located at the top directory of the SDK), to
> make
> > >>>    sure all paths are updated with the new location.
> > >>>
> > >>> +For your convenience, by selecting the package
> BR2_PACKAGE_ENVIRONMENT_SETUP,
> > >>> +you can have a +setup-environment+ script installed in
> +output/host/+.
> > >>> +This script can be sourced with +. your/sdk/path/environment-setup+
> to launch
> > >>> +the buildroot shell. Inside this shell, you will find an
> environment already
> > >>> +set up with the correct PATH and the complete list of +target
> configure
> > >>> +options+.
> > >>> +
> > >>>    Alternatively, if you just want to prepare the SDK without
> generating
> > >>>    the tarball (e.g. because you will just be moving the +host+
> directory,
> > >>>    or will be generating the tarball on your own), Buildroot also
> allows
> > >>> diff --git a/package/Config.in b/package/Config.in
> > >>> index bf02870ea2..b698d6f184 100644
> > >>> --- a/package/Config.in
> > >>> +++ b/package/Config.in
> > >>> @@ -1955,6 +1955,7 @@ menu "Miscellaneous"
> > >>>        source "package/collectl/Config.in"
> > >>>        source "package/domoticz/Config.in"
> > >>>        source "package/empty/Config.in"
> > >>> +     source "package/environment-setup/Config.in"
> > >>>        source "package/gnuradio/Config.in"
> > >>>        source "package/googlefontdirectory/Config.in"
> > >>>        source "package/gqrx/Config.in"
> > >>> diff --git a/package/environment-setup/Config.in
> b/package/environment-setup/Config.in
> > >>> new file mode 100644
> > >>> index 0000000000..f0fcc7d0f8
> > >>> --- /dev/null
> > >>> +++ b/package/environment-setup/Config.in
> > >>> @@ -0,0 +1,6 @@
> > >>> +config BR2_PACKAGE_ENVIRONMENT_SETUP
> > >>> +     bool "Environment setup"
> > >>> +     help
> > >>> +       Install an helper script to setup a build environment
> > >>> +       based on buildroot. It's useful when you export an sdk
> > >>> +       and want to use buildroot to build an external project
> > >>> diff --git a/package/environment-setup/environment-setup
> b/package/environment-setup/environment-setup
> > >>> new file mode 100644
> > >>> index 0000000000..b48f1979d6
> > >>> --- /dev/null
> > >>> +++ b/package/environment-setup/environment-setup
> > >>> @@ -0,0 +1,16 @@
> > >>> +cat <<'EOF'
> > >>> + _           _ _     _                 _
> > >>> +| |__  _   _(_) | __| |_ __ ___   ___ | |_
> > >>> +| '_ \| | | | | |/ _` | '__/ _ \ / _ \| __|
> > >>> +| |_) | |_| | | | (_| | | | (_) | (_) | |_
> > >>> +|_.__/ \__,_|_|_|\__,_|_|  \___/ \___/ \__| shell
> > >>> +
> > >>> +       Making embedded Linux easy!
> > >>> +
> > >>> +Some tips:
> > >>> +* PATH is now pointing to the HOST_DIR path
> > >>> +* Target configure options are already exported
> > >>> +* To configure do "./configure $CONFIGURE_FLAGS"
> > >>> +
> > >>> +EOF
> > >>> +SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
> > >>> diff --git a/package/environment-setup/environment-setup.mk
> b/package/environment-setup/environment-setup.mk
> > >>> new file mode 100644
> > >>> index 0000000000..7c6e352bde
> > >>> --- /dev/null
> > >>> +++ b/package/environment-setup/environment-setup.mk
> > >>> @@ -0,0 +1,34 @@
> > >>>
> +################################################################################
> > >>> +#
> > >>> +# environment-setup
> > >>> +#
> > >>>
> +################################################################################
> > >>> +
> > >>> +ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
> > >>> +ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'
> > >>> +ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP = 's+$(HOST_DIR)/bin/++g'
> > >>> +ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP =
> 's+$(TARGET_CROSS)+\$${CROSS_COMPILE}+g'
> > >>> +
> > >>> +define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
> > >>> +     cp package/environment-setup/environment-setup
> $(ENVIRONMENT_SETUP_FILE)
> > >>> +     for var in $(TARGET_CONFIGURE_OPTS); do \
> > >>> +             printf "export \"$$var\"\n" >>
> $(ENVIRONMENT_SETUP_FILE); \
> > >>> +     done
> > >>> +     printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >>
> $(ENVIRONMENT_SETUP_FILE)
> > >>> +     printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
> > >>> +             --host=$(GNU_TARGET_NAME) \
> > >>> +             --build=$(GNU_HOST_NAME) \
> > >>> +             --prefix=/usr \
> > >>> +             --exec-prefix=/usr \
> > >>> +             --sysconfdir=/etc \
> > >>> +             --localstatedir=/var \
> > >>> +             --program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> > >>> +     $(SED) $(ENVIRONMENT_SETUP_HOST_BIN_DIR_SED_EXP) \
> > >>> +             -e $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) \
> > >>> +             -e $(ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP) \
> > >>> +             $(ENVIRONMENT_SETUP_FILE)
> > >>> +     printf
> "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$
> \"\n" \
> > >>> +             >> $(ENVIRONMENT_SETUP_FILE)
> > >>> +endef
> > >>> +
> > >>> +$(eval $(generic-package))
> > >>>
> > >
> > > ________________________
> > > This email was scanned by Bitdefender
> > >
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
>
>
> ------------------------------
>
> Message: 2
> Date: Tue,  5 May 2020 23:49:30 +0300
> From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> To: buildroot at busybox.net
> Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>, Thomas Petazzoni
>         <thomas.petazzoni@bootlin.com>, Eugeniy Paltsev
>         <Eugeniy.Paltsev@synopsys.com>, arc-buildroot at synopsys.com
> Subject: [Buildroot] [PATCH] hsdk/linux: Fix USB regression
> Message-ID: <20200505204930.10522-1-Evgeniy.Didin@synopsys.com>
>
> With this patch we enable CONFIG_USB for HSDK, which is not explicitly
> selected by UDL since the commit
> 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB").
> Commit 4c13ca86dcf8 ("ARC: [plat-hsdk]: fix USB regression")
> is not yet backported to Linux kernel 5.6.x, so we enable this
> option in fragment file for HSDK.
>
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Cc: arc-buildroot at synopsys.com
> ---
> Note! This patch is a replacement of next patch:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20200430163713.11290-1-Evgeniy.Didin at synopsys.com/
>
>  board/synopsys/hsdk/linux.fragment | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/board/synopsys/hsdk/linux.fragment
> b/board/synopsys/hsdk/linux.fragment
> index 45d6c69af5..aaca08e015 100644
> --- a/board/synopsys/hsdk/linux.fragment
> +++ b/board/synopsys/hsdk/linux.fragment
> @@ -1,2 +1,3 @@
>  CONFIG_INITRAMFS_SOURCE=""
>  CONFIG_ARC_UBOOT_SUPPORT=y
> +CONFIG_USB=y
> --
> 2.16.2
>
>
>
> ------------------------------
>
> Message: 3
> Date: Tue, 5 May 2020 22:56:09 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit] CHANGES: start updating for
>         2020.05-rc1 release
> Message-ID: <20200505204103.5E91B90044@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=1025d09f9503179a19ef8119a814515d48d4c4c8
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  CHANGES | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/CHANGES b/CHANGES
> index 60177304b3..5a2f2d20fd 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,64 @@
> +2020.05-rc1, to be released
> +
> +       Addition of support for gobject-introspection: both the
> +       gobject-introspection package itself, but also introspection
> +       support was enabled in a number of other packages.
> +
> +       Support for Qt 5.6 was dropped as its support was dropped
> +       upstream, only one version of Qt is supported at the moment:
> +       Qt 5.14.2.
> +
> +       Addition of support for the apparmor Linux security module, by
> +       adding the necessary user-space packages.
> +
> +       Addition of a qmake package infrastructure, now used by most
> +       Qt-related packages.
> +
> +       The Luarocks package infrastructure has been extended to
> +       support build host packages.
> +
> +       The package infrastructure was improved to allow each package
> +       to indicate the Linux kernel configuration options it needs.
> +
> +       Addition of support for generating filesystem images using the
> +       EROFS filesystem.
> +
> +       The logic that calculates the list of files installed by each
> +       package was reworked to be compatible with the top-level
> +       parallel build functionality.
> +
> +       Addition of a package for a pre-compiled ARM32 bare-metal
> +       toolchain, which can be used to build ARM32 code in ARM64
> +       configurations, such as firmware/bootloader code.
> +
> +       The Qemu defconfigs are now boot-tested in Qemu as part of the
> +       Gitlab continuous integration.
> +
> +       Toolchain: gcc 9.x bumped to 9.3.0, gcc 8.x bumped to 8.4.0,
> +       gdb bumped to 8.3.1.
> +
> +       New packages: apcupsd, apparmor, arm-gnu-a-toolchain, bearssl,
> +       belle-sip, belr, cage, chartjs, erofs-utils, exfatprogs,
> +       gobject-introspection, ibm-sw-tpm2, imx-seco, jbig2dec,
> +       libapparmor, libiberty, libfuse3, libtextstyle, libudfread,
> +       libuhttpd, libuwsc, lua-lyaml, matio, mbuffer, netdata,
> +       openfpgaloader, perl-i18n, perl-locale-maketext-lexicon,
> +       perl-lwp-protocol-https,
> +       perl-mojolicious-plugin-authorization,
> +       perl-mojolicious-plugin-cspheader,
> +       perl-mojolicious-plugin-i18n,
> +       perl-mojolicious-plugin-securityheader, perl-mozilla-ca,
> +       perl-path-class, pistache, pkcs11-helper, prelink-cross,
> +       python-argon2-cffi, python-canopen, python-cbor2,
> +       python-filelock, python-flatbuffers, python-greenlet,
> +       python-modbus-tk, python-pyalsa, python-pysftp, python-regex,
> +       python-snappy, rtty, tinyproxy, udev-gentoo-scripts, unbound,
> +       vuejs, wlroots.
> +
> +       New defconfigs: freescale_imx6ullevk, freescale_imx8qmmek,
> +       nanopi_neo4, nanopi_r1, nitrogen8mm, nitrogen8mn, olpc_xo1,
> +       olpc_xo175, roc_rk3399_pc, stm32mp157a_dk1, zynq_qmtech
> +
>  2020.02.1, released April 10th, 2020
>
>         Important / security related fixes.
>
>
> ------------------------------
>
> Message: 4
> Date: Tue, 5 May 2020 23:05:28 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/solarus: bump to version
>         1.6.4
> Message-ID: <20200505230528.320a6358@windsurf.home>
> Content-Type: text/plain; charset=US-ASCII
>
> On Mon,  4 May 2020 16:37:42 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
>
> > Add glm dependency since the bundled version is gone [1].
> >
> > Update indentation of hash file (two spaces).
> >
> > [1]
> https://gitlab.com/solarus-games/solarus/commit/5285c8e1afa538bbcd4c8654f9bbfb270cc7f52
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >  package/solarus/Config.in    | 1 +
> >  package/solarus/solarus.hash | 4 ++--
> >  package/solarus/solarus.mk   | 6 +++---
> >  3 files changed, 6 insertions(+), 5 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 5
> Date: Tue, 5 May 2020 23:05:34 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/zziplib: bump to version
>         0.13.71
> Message-ID: <20200505230534.6ea3d695@windsurf.home>
> Content-Type: text/plain; charset=US-ASCII
>
> On Mon,  4 May 2020 16:52:12 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
>
> > Remove upstream patches and CVE tags.
> >
> > Switch the dependency to python3 added by [1].
> >
> > Update indentation of hash file (two spaces).
> >
> > [1]
> https://github.com/gdraheim/zziplib/commit/a144bec8d06302e7be11f0f46e02947b0becf574
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> >  ...eak-from-__zzip_parse_root_directory.patch |  74 ----
> >  ...k-from-__zzip_parse_root_directory-2.patch |  53 ---
> >  ...3-One-more-free-to-avoid-memory-leak.patch |  25 --
> >  ...omponents-from-pathnames-of-extracte.patch | 344 ------------------
> >  package/zziplib/zziplib.hash                  |   8 +-
> >  package/zziplib/zziplib.mk                    |  15 +-
> >  6 files changed, 7 insertions(+), 512 deletions(-)
> >  delete mode 100644
> package/zziplib/0001-Avoid-memory-leak-from-__zzip_parse_root_directory.patch
> >  delete mode 100644
> package/zziplib/0002-Avoid-memory-leak-from-__zzip_parse_root_directory-2.patch
> >  delete mode 100644
> package/zziplib/0003-One-more-free-to-avoid-memory-leak.patch
> >  delete mode 100644
> package/zziplib/0004-Fix-issue-62-Remove-any-components-from-pathnames-of-extracte.patch
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 6
> Date: Tue, 5 May 2020 23:05:39 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: buildroot at buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
> Subject: Re: [Buildroot] [PATCH v2] package/libnss: bump version to
>         3.52
> Message-ID: <20200505230539.47012d8b@windsurf.home>
> Content-Type: text/plain; charset=US-ASCII
>
> On Mon,  4 May 2020 17:10:36 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>
> > Bump version to 3.52 and drop all patches since they've all been
> > upstreamed.
> >
> > Release notes:
> >
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.52_release_notes
> >
> > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> > V1->V2:
> > * improve commit log
> > ---
> >  ...troduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch | 132 ------------------
> >  ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch |  30 ----
> >  package/libnss/libnss.hash                    |   4 +-
> >  package/libnss/libnss.mk                      |   2 +-
> >  4 files changed, 3 insertions(+), 165 deletions(-)
> >  delete mode 100644
> package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
> >  delete mode 100644
> package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 7
> Date: Tue, 5 May 2020 23:05:45 +0200
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Grzegorz Blach <grzegorz@blach.pl>
> Cc: buildroot at buildroot.org, Asaf Kahlon <asafka7@gmail.com>
> Subject: Re: [Buildroot] [PATCH] package/python-redis: Bump to version
>         3.5.0
> Message-ID: <20200505230545.643f05cc@windsurf.home>
> Content-Type: text/plain; charset=US-ASCII
>
> On Mon,  4 May 2020 20:33:02 +0200
> Grzegorz Blach <grzegorz@blach.pl> wrote:
>
> > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> > ---
> >  package/python-redis/python-redis.hash | 6 +++---
> >  package/python-redis/python-redis.mk   | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
>
> Applied to master, thanks.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Message: 8
> Date: Wed, 06 May 2020 04:58:06 +0000
> From: Andreas Ziegler <br015@umbiko.net>
> To: buildroot at busybox.net
> Cc: atkunalchauhan at gmail.com
> Subject: Re: [Buildroot] Help: to understand build root
> Message-ID: <121ecb5d43fff1ec9fd9e65f6f99e9ac@umbiko.net>
> Content-Type: text/plain; charset=US-ASCII; format=flowed
>
> Hi Kunal,
>
> > Message: 12
> > Date: Tue, 5 May 2020 22:29:10 +0530
> > From: Kunal Chauhan <atkunalchauhan@gmail.com>
> > To: buildroot at busybox.net
> > Subject: [Buildroot] Help: to understand build root
>
> > Q1.As busybox is a small flavour of linux os.if i am not wrong?
> >
> > Q2. What is concept of build-root. As i have seen code base compiled
> > and
> > create build-root folder .
>
> Buildroot is a build system for embedded systems. It is comparable to
> e.g. Yocto and helps you to create a GNU/Linux based image, containing
> Linux kernel, init system and root filesystem, which can then be
> transferred to a target system. Think of firmware for IoT, a router, a
> media player, or a robot in manufacturing.
>
> Buildroot images are static, you cannot install software after
> deployment.
>
> Buildroot images can be small, production images are counted in MiB, not
> GiB.
>
> Buildroot handles cross-compiling. Build and target system can have
> completely different architectures.
>
> Buildroot recipes (see configs/*_defconfig) are meant as starting point
> for your own project(s). They bring a system up and make it responsive
> (console, network), the rest is up to you.
>
> In case you have not seen it before, the Buildroot manual is here:
>
>    https://buildroot.org/downloads/manual/manual.html#_about_buildroot
>
> Kind regards,
> Andreas
>
>
> ------------------------------
>
> Message: 9
> Date: Wed, 06 May 2020 06:59:13 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: <stephan.hoffmann@ext.grandcentrix.net>, Andr?  Hentschel
>         <nerv@dawncrow.de>,  buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] azure-iot-sdk-c: fix missing
>         libraries
> Message-ID: <87h7wthd5q.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Mon, 23 Sep 2019 13:52:06 +0200
>  > <stephan.hoffmann@ext.grandcentrix.net> wrote:
>
>  >> From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
>  >>
>  >> libparson.so and libumqtt.so.1 are missing.
>  >>
>  >> The package builds libparson, but does not install it.
>  >> It also does not install the symlinks for libumqtt.so.1.1.11.
>  >>
>  >> Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net
> >
>  >> ---
>  >> package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 24 +++++++++++++++++-----
>  >> 1 file changed, 19 insertions(+), 5 deletions(-)
>
>  > So I finally applied this, but after doing quite a bit of rework. For
>  > example, your patch was not correct as it was creating the .so symlinks
>  > unconditionally, even when BR2_STATIC_LIBS=y, i.e even when static
>  > libraries are used. Another issue is that you were reformatting the
>  > list of libraries to have one per-line, in the same patch. And you were
>  > fixing the libparson and libumqtt issues in the same patch.
>
>  > So, I first applied three preparation commits:
>
>  >
> https://git.buildroot.org/buildroot/commit/?id=c71030f0fab49be4061fb999a8eabe4190f1f18d
>  >
> https://git.buildroot.org/buildroot/commit/?id=59de11b0476699ddeb2cbcd30a524b849249956a
>  >
> https://git.buildroot.org/buildroot/commit/?id=43822bb6db8851df4d6568622b58196895028f91
>
>  > Then, I applied your fix for libumqtt.so:
>
>  >
> https://git.buildroot.org/buildroot/commit/?id=570dd0c31b2149cd913866eb6777caa4a1b05a56
>
>  > And your fix for libparson.so:
>
>  >
> https://git.buildroot.org/buildroot/commit/?id=94120fd7c71881e7b3963d5db27802241d9eeed2
>
> The same set of commits have now been cherry-picked for 2020.02.x,
> thanks!
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 10
> Date: Wed, 06 May 2020 07:02:17 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: unixmania at gmail.com,  buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] board/wandboard/post-build.sh: create
>         boot.scr at TARGET_DIR/boot
> Message-ID: <87d07hhd0m.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > Hello Carlos,
>  > On Sat, 12 Oct 2019 20:30:41 -0300
>  > unixmania at gmail.com wrote:
>
>  >> From: Carlos Santos <unixmania@gmail.com>
>  >>
>  >> There is no reason to create boot.scr at board/wandboard and later
>  >> install it at TARGET_DIR/boot, leaving a stale file behind.
>  >>
>  >> Signed-off-by: Carlos Santos <unixmania@gmail.com>
>  >> ---
>  >> board/wandboard/post-build.sh | 6 ++++--
>  >> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>  > Applied to master after dropping the additional chmod 644 on the file,
>  > as suggested by Arnout. Also, the same issue was present for other
>  > boards, so I also did the following commits:
>
>  > 2306339d1fe8d5ea2d9e17641f78a374f612f45e board/udoo/neo: create
> boot.scr in TARGET_DIR/boot
>  > 9ddbd11620b5a01945a438085d45ef2131bad35f board/solidrun/mx6cubox:
> create boot.scr in TARGET_DIR/boot
>
>  > What would perhaps be good is to use the BR2_TARGET_UBOOT_BOOT_SCRIPT
>  > feature, which would automatically run mkimage and install boot.src in
>  > $(BINARIES_DIR). The post-build script would then only have to copy it
>  > to $TARGET_DIR/boot/.
>
> The same set of commits now cherry-picked to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 11
> Date: Wed, 06 May 2020 07:03:52 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Baruch Siach <baruch@tkos.co.il>
> Cc: buildroot at busybox.net,  Scott Fan <fancp2007@gmail.com>
> Subject: Re: [Buildroot] [PATCH] package/libssh: security bump to
>         version 0.9.4
> Message-ID: <878si5hcxz.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
>
>  > Fixes CVE-2020-1730: Possible DoS in client and server when handling
>  > AES-CTR keys with OpenSSL.
>
>  > Format hash file with two spaces delimiter.
>
>  > Cc: Scott Fan <fancp2007@gmail.com>
>  > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 12
> Date: Wed, 06 May 2020 07:04:05 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: buildroot at buildroot.org,  Scott Fan <fancp2007@gmail.com>
> Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: add patch to fix
>         reported version
> Message-ID: <874ksthcxm.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
>
>  > The released libssh package does wrongly reports the previous version.
>  > This patch fixes the version field in the lib.
>
>  > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 13
> Date: Wed, 06 May 2020 07:04:24 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: buildroot at buildroot.org,  Scott Fan <fancp2007@gmail.com>
> Subject: Re: [Buildroot] [PATCH] package/libssh: add patch to fix
>         regression
> Message-ID: <87zhalfycn.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:
>
>  > The libssh server is used by libnetconf2. With libssh version 0.9.4 a
>  > regression was introduced that wrongly leads to session closed after the
>  > poll timeout.
>
>  > The patch comes from upstrem:
>  >
> https://git.libssh.org/projects/libssh.git/commit/?id=6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4
>
>  > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 14
> Date: Wed, 06 May 2020 07:10:59 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>,  buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] package/exim: fix log and pid file
>         paths
> Message-ID: <87v9l9fy1o.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Mon,  2 Mar 2020 11:19:02 +0100
>  > Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:
>
>  >> both the logs and pid should not be placed in /var/spool
>  >>
>  >> we place the log in /var/log/exim and
>  >> we place the pid in /var/run/exim
>  >>
>  >> using binary name subdirectory in both cases allows for the
>  >> use of systemd's LogsDirectory and RuntimeDirectory statements
>  >>
>  >> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
>
>  > Applied with an improved commit log. It would however be nice to
>  > convert the exim init script to the "new" init script template, for
>  > higher consistency.
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 15
> Date: Wed, 06 May 2020 07:13:50 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
>         version 2.16.6
> Message-ID: <87r1vxfxwx.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > - Fix CVE-2020-10932: fix side channel in ECC code that allowed an
>  >   adversary with access to precise enough timing and memory access
>  >   information (typically an untrusted operating system attacking a
>  >   secure enclave) to fully recover an ECDSA private key.
>  > - Fix a potentially remotely exploitable buffer overread in a DTLS
>  >   client when parsing the Hello Verify Request message.
>  > - Fix bug in DTLS handling of new associations with the same parameters
>  >   (RFC 6347 section 4.2.8): after sending its HelloVerifyRequest, the
>  >   server would end up with corrupted state and only send invalid records
>  >   to the client. An attacker able to send forged UDP packets to the
>  >   server could use that to obtain a Denial of Service. This could only
>  >   happen when MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE was enabled in
>  >   config.h (which it is by default).
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 16
> Date: Wed, 06 May 2020 07:16:07 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [git commit] package/python-iptables: add
>         explicit dependency on dynamic libs
> Message-ID: <87mu6lfxt4.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > commit:
> https://git.buildroot.net/buildroot/commit/?id=21b85bc56cdcf030cced57dea0f78cdce59912b8
>  > branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > The package uses ctypes.CDLL extensively which only makes sense when
> dynamic
>  > libraries are available.
>
>  > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 17
> Date: Wed, 06 May 2020 07:16:12 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [git commit] package/python-iptables: account
>         for platform tag in extensions
> Message-ID: <87imh9fxsz.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > commit:
> https://git.buildroot.net/buildroot/commit/?id=52276cdda34aa986410626592031560bf64d788b
>  > branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > EXT_SUFFIX in Python versions > 3.5 contains a platform tag which only
> applies
>  > to cpython extensions. Given that ctypes.util.find_library does not
> work on the
>  > target due to the absence of the underlying tools '.so' needs to be
> added as a
>  > possible suffix for libraries to enable python-iptables to find the
> iptables
>  > shared libraries.
>
>  > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 18
> Date: Wed, 06 May 2020 07:16:19 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [git commit] package/python-iptables: try
>         known libc instead of find_library()
> Message-ID: <87eerxfxss.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > commit:
> https://git.buildroot.net/buildroot/commit/?id=90c18ab269c600ee7643f69212713ee3b74c38bd
>  > branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > ctypes.util.find_library() depends on gcc and friends to detect the
> location of
>  > a given shared library. Given that these are not available on the
> target and
>  > that python-iptables depends on this functionality we need to work
> around this.
>  > The SONAMEs of the libc are well known so we try the known ones for
> glibc,
>  > uClibc and musl.
>
>  > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271
>
>  > Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 19
> Date: Wed, 06 May 2020 07:20:40 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: buildroot at buildroot.org,  Adam Duskett <aduskett@gmail.com>
> Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump
>         version to 7.4.5
> Message-ID: <87a72lfxlj.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>
>  > Changelog: https://www.php.net/ChangeLog-7.php#7.4.5
>  > Fixes CVE-2020-7067.
>
>  > Removed patch applied upstream.
>
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 20
> Date: Wed, 06 May 2020 07:21:38 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: yegorslists at googlemail.com
> Cc: buildroot at buildroot.org,  Asaf Kahlon <asafka7@gmail.com>
> Subject: Re: [Buildroot] [PATCH] package/python-dpkt: remove Python2
>         only dependency
> Message-ID: <875zd9fxjx.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
>
>  > From: Yegor Yefremov <yegorslists@googlemail.com>
>  > python-dpkt supports both Python flavors.
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 21
> Date: Wed, 06 May 2020 07:23:36 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [git commit] package/libsepol: fix help text
>         for BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
> Message-ID: <871rnxfxgn.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > commit:
> https://git.buildroot.net/buildroot/commit/?id=67d7705a9aa58886e8a8777fe4c95746c1fb5c96
>  > branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
>  > The help text was wrong, as it didn't match the actual default values
>  > we were specifying. Indeed, when we specify:
>
>  >         default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>  >         default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
>
>  > It means that the policy version 30 is supported starting from Linux
>  > 4.3 included, and that 31 is supported from Linux 4.13 included.
>
>  > So we shouldn't have:
>
>  >> 4.3 <= 4.13    30
>  >> 4.13           31
>
>  > but:
>
>  >> = 4.3 < 4.13    30
>  >> = 4.13          31
>
>  > This patch fixes that for all versions.
>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 22
> Date: Wed, 06 May 2020 07:26:13 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Buildroot List <buildroot@uclibc.org>, Marek Belisko
>         <marek.belisko@open-nandra.com>, "Yann E. MORIN"
>         <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
> Subject: Re: [Buildroot] [PATCH] package/polkit: properly autoreconf
> Message-ID: <87wo5peiru.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > 0001-make-netgroup-support-optional.patch patches configure.ac, but we
>  > don't autoreconf the package, which is not good.
>
>  > However, simply adding AUTORECONF = YES is not sufficient: polkit
>  > Makefile.am use the automake conditional HAVE_INTROSPECTION, which is
>  > "available" only when the gobject-introspection m4 file is installed.
>
>  > Since we don't want to make gobject-introspection a mandatory
>  > dependency of polkit, we take a simpler route: add a copy of
>  > introspection.m4 into the polkit source tree. This is only a 142 lines
>  > file, and it can be dropped when
>  > 0001-make-netgroup-support-optional.patch is merged upstream.
>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 23
> Date: Wed, 06 May 2020 07:27:17 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: aduskett at gmail.com
> Cc: buildroot at buildroot.org,  Marek Belisko
>         <marek.belisko@open-nandra.com>
> Subject: Re: [Buildroot] [PATCH 1/4] package/polkit: install service
>         file
> Message-ID: <87sggdeiq2.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:
>
>  > From: Adam Duskett <Aduskett@gmail.com>
>  > The default installed service file is missing a target, which causes
> preset-all
>  > to not enable the service.
>
>  > Add the service file to package/polkit with the addition of:
>
>  > [Install]
>  > WantedBy=multi-user.target
>
>  > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 24
> Date: Wed, 06 May 2020 07:27:23 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: aduskett at gmail.com
> Cc: buildroot at buildroot.org,  Marek Belisko
>         <marek.belisko@open-nandra.com>
> Subject: Re: [Buildroot] [PATCH 2/4] package/polkit: add upstream
>         memory leak fix
> Message-ID: <87o8r1eipw.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:
>
>  > From: Adam Duskett <Aduskett@gmail.com>
>  > This patch fixes two small memory leaks.
>
>  > Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311
>
>  > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 25
> Date: Wed, 06 May 2020 07:27:28 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: aduskett at gmail.com
> Cc: buildroot at buildroot.org,  Marek Belisko
>         <marek.belisko@open-nandra.com>
> Subject: Re: [Buildroot] [PATCH 3/4] package/polkit: add upstream fix
>         for SIGTTOU
> Message-ID: <87k11peipr.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:
>
>  > From: Adam Duskett <Aduskett@gmail.com>
>  > If tty_handler() resets terminal while pkttyagent is run in background
> job,
>  > the process gets stopped by SIGTTOU. This impacts systemctl, hence it
> must
>  > be blocked for a while and then the process gets killed anyway.
>
>  > Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311
>
>  > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 26
> Date: Wed, 06 May 2020 07:28:39 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Louis Aussedat <aussedat.louis@gmail.com>
> Cc: buildroot at buildroot.org,  Adam Duskett <aduskett@gmail.com>
> Subject: Re: [Buildroot] [PATCH 1/2] package/php: fix zip support
> Message-ID: <87ftcdeins.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Louis" == Louis Aussedat <aussedat.louis@gmail.com> writes:
>
>  > since php7.4, --enable-zip becomes --with-zip due to
>  > migration to pkg-config.
>
>  > Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 27
> Date: Wed, 06 May 2020 07:28:45 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Louis Aussedat <aussedat.louis@gmail.com>
> Cc: buildroot at buildroot.org,  Adam Duskett <aduskett@gmail.com>
> Subject: Re: [Buildroot] [PATCH 2/2] package/php: fix gd dependencies
> Message-ID: <87bln1einm.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Louis" == Louis Aussedat <aussedat.louis@gmail.com> writes:
>
>  > Due to migration to pkg-config in php 7.4, the detection of
>  > library dependencies has been changed.
>
>  > source from php.net:
>  > --with-gd becomes --enable-gd
>  > --with-png-dir has been removed. libpng is required.
>  > --with-zlib-dir has been removed. zlib is required.
>  > --with-freetype-dir becomes --with-freetype
>  > --with-jpeg-dir becomes --with-jpeg
>
>  > Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 28
> Date: Wed, 06 May 2020 07:30:04 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ryan Steffens
>         <ryan.steffens@rockwellcollins.com>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH v2] package/netsnmp: unix domain
>         socket transport
> Message-ID: <877dxpeilf.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>
>  > On Tue, 14 Apr 2020 12:55:00 -0500
>  > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
>  >> From: Ryan Steffens <ryan.steffens@rockwellcollins.com>
>  >>
>  >> Adds support for connecting unix socket based AgentX subagents
>  >>
>  >> Signed-off-by: Ryan Steffens <ryan.steffens@rockwellcollins.com>
>  >> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>  >> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
>  > I have further extended the commit log, and applied. Especially, it is
>  > always useful to go back in the history of the package and try to
>  > figure out the reason why something was done in a given way, and now
>  > needs to be done differently.
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 29
> Date: Wed, 06 May 2020 07:31:37 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump
>         version to 2.4.9
> Message-ID: <87368deiiu.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>
>  > Changelog:
>  > https://github.com/OpenVPN/openvpn/blob/release/2.4/ChangeLog
>
>  > Fixes CVE-2020-11810.
>
>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>
> Committed to 2020.02.x, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 30
> Date: Wed, 6 May 2020 06:58:04 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/azure-iot-sdk-c: fix installation of libumqtt
> Message-ID: <20200506051930.D6FA88D7AA@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=f4150265b1b6152b6f65960bf3c93deb1d0217d5
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> Unlike the other libraries built by azure-iot-sdk-c, libumqtt follows
> a regular versioning scheme. It has a libumqtt.so.1 SONAME, with
> libumqtt.so.1 being a symlink to libumqtt.so.1.1.11.
>
> However, we currently install the library itself as libumqtt.so to the
> target filesystem, which is not its SONAME, which means it cannot be
> found by any other library/program linked against it.
>
> This commit fixes that by installing the library as
> libumqtt.so.1.1.11, and creating the appropriate symlinks. The static
> library installation is not modified.
>
> Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 570dd0c31b2149cd913866eb6777caa4a1b05a56)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index 6781da4177..35ddb672fb 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -41,13 +41,19 @@ AZURE_IOT_SDK_C_LIBS += \
>         iothub_client/libiothub_client_mqtt_transport.so \
>         iothub_service_client/libiothub_service_client.so \
>         serializer/libserializer.so \
> -       umqtt/libumqtt.so
> +       umqtt/libumqtt.so.1.1.11
> +
> +define AZURE_IOT_SDK_C_CREATE_SYMLINKS
> +       ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so.1
> +       ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so
> +endef
>  endif
>
>  define AZURE_IOT_SDK_C_INSTALL_LIBS
>         $(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>                 $(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir
> $(l))
>         )
> +       $(call AZURE_IOT_SDK_C_CREATE_SYMLINKS,$(1))
>  endef
>
>  define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>
>
> ------------------------------
>
> Message: 31
> Date: Wed, 6 May 2020 06:57:38 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/azure-iot-sdk-c: format the libraries list with one lib per
>         line
> Message-ID: <20200506051930.9E9318D7AA@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=8a768ad62edf8d49bb523c5e4d7e6e5531246527
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> This makes it easier to review patches modifying these lists of
> libraries, such as:
>
>
> http://patchwork.ozlabs.org/project/buildroot/patch/20190923115206.4468-1-stephan.hoffmann at ext.grandcentrix.net/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit c71030f0fab49be4061fb999a8eabe4190f1f18d)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index 8b3f670399..b194bf9a4c 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -17,21 +17,31 @@ AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
>  # The project only supports building one kind of library.
>  # Further the install target installs the wrong files, so we do it here:
>  ifeq ($(BR2_STATIC_LIBS),y)
> -AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
> -       iothub_client/libiothub_client.a
> iothub_client/libiothub_client_mqtt_ws_transport.a \
> +AZURE_IOT_SDK_C_LIBS += \
> +       uamqp/libuamqp.a \
> +       c-utility/libaziotsharedutil.a \
> +       iothub_client/libiothub_client.a \
> +       iothub_client/libiothub_client_mqtt_ws_transport.a \
>         iothub_client/libiothub_client_amqp_ws_transport.a \
>         iothub_client/libiothub_client_http_transport.a \
>         iothub_client/libiothub_client_amqp_transport.a \
>         iothub_client/libiothub_client_mqtt_transport.a \
> -       iothub_service_client/libiothub_service_client.a
> serializer/libserializer.a umqtt/libumqtt.a
> +       iothub_service_client/libiothub_service_client.a \
> +       serializer/libserializer.a \
> +       umqtt/libumqtt.a
>  else
> -AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so
> \
> -       iothub_client/libiothub_client.so
> iothub_client/libiothub_client_mqtt_ws_transport.so \
> +AZURE_IOT_SDK_C_LIBS += \
> +       uamqp/libuamqp.so \
> +       c-utility/libaziotsharedutil.so \
> +       iothub_client/libiothub_client.so \
> +       iothub_client/libiothub_client_mqtt_ws_transport.so \
>         iothub_client/libiothub_client_amqp_ws_transport.so \
>         iothub_client/libiothub_client_http_transport.so \
>         iothub_client/libiothub_client_amqp_transport.so \
>         iothub_client/libiothub_client_mqtt_transport.so \
> -       iothub_service_client/libiothub_service_client.so
> serializer/libserializer.so umqtt/libumqtt.so
> +       iothub_service_client/libiothub_service_client.so \
> +       serializer/libserializer.so \
> +       umqtt/libumqtt.so
>  endif
>
>  define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>
>
> ------------------------------
>
> Message: 32
> Date: Wed, 6 May 2020 06:58:26 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/azure-iot-sdk-c: also install libparson
> Message-ID: <20200506051930.E9A738D7AA@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=bd389b52fb9ed025192d49bfd5c3c84e97cd318e
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The package builds libparson, but does not install it, let's fix this.
>
> Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 94120fd7c71881e7b3963d5db27802241d9eeed2)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index 35ddb672fb..f63297844d 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -28,7 +28,8 @@ AZURE_IOT_SDK_C_LIBS += \
>         iothub_client/libiothub_client_mqtt_transport.a \
>         iothub_service_client/libiothub_service_client.a \
>         serializer/libserializer.a \
> -       umqtt/libumqtt.a
> +       umqtt/libumqtt.a \
> +       libparson.a
>  else
>  AZURE_IOT_SDK_C_LIBS += \
>         uamqp/libuamqp.so \
> @@ -41,7 +42,8 @@ AZURE_IOT_SDK_C_LIBS += \
>         iothub_client/libiothub_client_mqtt_transport.so \
>         iothub_service_client/libiothub_service_client.so \
>         serializer/libserializer.so \
> -       umqtt/libumqtt.so.1.1.11
> +       umqtt/libumqtt.so.1.1.11 \
> +       libparson.so
>
>  define AZURE_IOT_SDK_C_CREATE_SYMLINKS
>         ln -sf libumqtt.so.1.1.11 $(1)/usr/lib/libumqtt.so.1
>
>
> ------------------------------
>
> Message: 33
> Date: Wed, 6 May 2020 07:26:52 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit: add
>         upstream memory leak fix
> Message-ID: <20200506051932.243637FFD0@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=148f82ca0bcbf162a3c69001b31adba81a49e140
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> This patch fixes two small memory leaks.
>
> Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit ba70e29fea9fd76ffafd77401073d2142cbdfd21)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/polkit/0002-jsauthority-memleak.patch | 28
> +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/package/polkit/0002-jsauthority-memleak.patch
> b/package/polkit/0002-jsauthority-memleak.patch
> new file mode 100644
> index 0000000000..4f0733185c
> --- /dev/null
> +++ b/package/polkit/0002-jsauthority-memleak.patch
> @@ -0,0 +1,28 @@
> +From 28e3a6653d8c3777b07e0128a0d97d46e586e311 Mon Sep 17 00:00:00 2001
> +From: Jan Rybar <jrybar@redhat.com>
> +Date: Tue, 8 Oct 2019 13:28:18 +0000
> +Subject: [PATCH] jsauthority: Fix two minor memory leaks
> +
> +(cherry picked from commit 28e3a6653d8c3777b07e0128a0d97d46e586e311)
> +Signed-off-by: Jan Rybar <jrybar@redhat.com>
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + src/polkitbackend/polkitbackendjsauthority.cpp | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp
> b/src/polkitbackend/polkitbackendjsauthority.cpp
> +index 9b752d1..e97b8aa 100644
> +--- a/src/polkitbackend/polkitbackendjsauthority.cpp
> ++++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> +@@ -567,6 +567,8 @@ polkit_backend_js_authority_finalize (GObject *object)
> +   g_strfreev (authority->priv->rules_dirs);
> +
> +   delete authority->priv->ac;
> ++  delete authority->priv->js_global;
> ++  delete authority->priv->js_polkit;
> +
> +   JS_DestroyContext (authority->priv->cx);
> +   /* JS_ShutDown (); */
> +--
> +2.24.1
> +
>
>
> ------------------------------
>
> Message: 34
> Date: Wed, 6 May 2020 07:00:27 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         board/wandboard/post-build.sh: create boot.scr at TARGET_DIR/boot
> Message-ID: <20200506051931.057EB8D59C@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=52b01679eac36f4408e950687e2e002708ca3190
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> There is no reason to create boot.scr at board/wandboard and later
> install it at TARGET_DIR/boot, leaving a stale file behind.
>
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit f14e95b3ff76a4a052a1d1a3fa6ac67fd5a3e911)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/wandboard/post-build.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/board/wandboard/post-build.sh b/board/wandboard/post-build.sh
> index 43e091c5d7..6ddc113702 100755
> --- a/board/wandboard/post-build.sh
> +++ b/board/wandboard/post-build.sh
> @@ -2,7 +2,7 @@
>
>  BOARD_DIR="$(dirname $0)"
>
> -$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> --n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
> +install -d -m 755 $TARGET_DIR/boot
>
> -install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> +$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> +       -n "boot script" -d $BOARD_DIR/boot.scr.txt
> $TARGET_DIR/boot/boot.scr
>
>
> ------------------------------
>
> Message: 35
> Date: Wed, 6 May 2020 06:57:51 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/azure-iot-sdk-c: create function for library installation
> Message-ID: <20200506051930.C36E28D7AA@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=0bb747c981ce17be2b259afc0ece848e5025f1c3
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> As a preparation for adding the creation of some symlinks, let's
> factor the library installation into a function.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 43822bb6db8851df4d6568622b58196895028f91)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index e6345104eb..6781da4177 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -44,18 +44,20 @@ AZURE_IOT_SDK_C_LIBS += \
>         umqtt/libumqtt.so
>  endif
>
> -define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
> +define AZURE_IOT_SDK_C_INSTALL_LIBS
>         $(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> -               $(INSTALL) -D -m 0755 $(@D)/$(l)
> $(STAGING_DIR)/usr/lib/$(notdir $(l))
> +               $(INSTALL) -D -m 0755 $(@D)/$(l) $(1)/usr/lib/$(notdir
> $(l))
>         )
> +endef
> +
> +define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
> +       $(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(STAGING_DIR))
>         cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
>         cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
>  endef
>
>  define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
> -       $(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> -               $(INSTALL) -D -m 0755 $(@D)/$(l)
> $(TARGET_DIR)/usr/lib/$(notdir $(l))
> -       )
> +       $(call AZURE_IOT_SDK_C_INSTALL_LIBS,$(TARGET_DIR))
>  endef
>
>  $(eval $(cmake-package))
>
>
> ------------------------------
>
> Message: 36
> Date: Wed, 6 May 2020 07:03:29 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/libssh: add
>         patch to fix reported version
> Message-ID: <20200506051931.48717825FB@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=de1490e2a52eff1f81a728def85e57a09ada3ffc
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The released libssh package does wrongly reports the previous version.
> This patch fixes the version field in the lib.
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit a7db921da5ac57e29efeb1ac37c131d589d12664)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-libssh.h-bump-to-version-0.9.4.patch      | 29
> ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
> b/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
> new file mode 100644
> index 0000000000..d6ec50509e
> --- /dev/null
> +++ b/package/libssh/0001-libssh.h-bump-to-version-0.9.4.patch
> @@ -0,0 +1,29 @@
> +From 8d8428cbbc2c00d078cfbc967e4e6fee7ff7bf0b Mon Sep 17 00:00:00 2001
> +From: Heiko Thiery <heiko.thiery@gmail.com>
> +Date: Wed, 15 Apr 2020 11:57:29 +0200
> +Subject: [PATCH] libssh.h: bump to version 0.9.4
> +
> +In the released version of libssh the version bump was not done
> +properly. Therefore the current release 0.9.4 reports 0.9.3.
> +
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + include/libssh/libssh.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/libssh/libssh.h b/include/libssh/libssh.h
> +index 79030131..e2a8d991 100644
> +--- a/include/libssh/libssh.h
> ++++ b/include/libssh/libssh.h
> +@@ -79,7 +79,7 @@
> + /* libssh version */
> + #define LIBSSH_VERSION_MAJOR  0
> + #define LIBSSH_VERSION_MINOR  9
> +-#define LIBSSH_VERSION_MICRO  3
> ++#define LIBSSH_VERSION_MICRO  4
> +
> + #define LIBSSH_VERSION_INT SSH_VERSION_INT(LIBSSH_VERSION_MAJOR, \
> +                                            LIBSSH_VERSION_MINOR, \
> +--
> +2.20.1
> +
>
>
> ------------------------------
>
> Message: 37
> Date: Wed, 6 May 2020 07:00:40 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] board/udoo/neo:
>         create boot.scr in TARGET_DIR/boot
> Message-ID: <20200506051931.252908D59C@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=52bfa18f8fd112ef1f9adef2e3941f2214cbe52c
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> There is no reason to create boot.scr in board/udoo/neo and later
> install it in TARGET_DIR/boot, leaving a stale file behind.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 2306339d1fe8d5ea2d9e17641f78a374f612f45e)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/udoo/neo/post-build.sh | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/board/udoo/neo/post-build.sh b/board/udoo/neo/post-build.sh
> index 43e091c5d7..6ccd87fafd 100755
> --- a/board/udoo/neo/post-build.sh
> +++ b/board/udoo/neo/post-build.sh
> @@ -2,7 +2,6 @@
>
>  BOARD_DIR="$(dirname $0)"
>
> +install -d -m 755 $TARGET_DIR/boot
>  $HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> --n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
> -
> -install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> +       -n "boot script" -d $BOARD_DIR/boot.scr.txt
> $TARGET_DIR/boot/boot.scr
>
>
> ------------------------------
>
> Message: 38
> Date: Wed, 6 May 2020 07:28:07 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/php: fix
>         zip support
> Message-ID: <20200506051932.44684882AE@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=ab30ce809cde5643cf11c6fb6adcb97eade0abea
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> since php7.4, --enable-zip becomes --with-zip due to
> migration to pkg-config.
>
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit ac2b371732b20bacce9c79b7f3b824bd68b94242)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 91f82dbf31..8282bb1cc7 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -113,7 +113,7 @@ PHP_CONF_OPTS += \
>         $(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
>         $(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
>         $(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
> -       $(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
> +       $(if $(BR2_PACKAGE_PHP_EXT_ZIP),--with-zip) \
>         $(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
>         $(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
>         $(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
>
>
> ------------------------------
>
> Message: 39
> Date: Wed, 6 May 2020 07:28:14 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/php: fix gd
>         extension dependencies and options
> Message-ID: <20200506051932.52AF8882AE@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=236f809c252647a0864c1a68ac7ca679ac1b797c
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> Due to migration to pkg-config in php 7.4, the detection of
> library dependencies has been changed.
>
> source from php.net:
> --with-gd becomes --enable-gd
> --with-png-dir has been removed. libpng is required.
> --with-zlib-dir has been removed. zlib is required.
> --with-freetype-dir becomes --with-freetype
> --with-jpeg-dir becomes --with-jpeg
>
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 31c5fd8f4b1ee26881ac37e55b0967bed0c6ebd2)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/php/Config.ext |  1 +
>  package/php/php.mk     | 10 ++++------
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 193bc1bd03..66ee935cf0 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -256,6 +256,7 @@ config BR2_PACKAGE_PHP_EXT_GD
>         select BR2_PACKAGE_FREETYPE
>         select BR2_PACKAGE_JPEG
>         select BR2_PACKAGE_LIBPNG
> +       select BR2_PACKAGE_ZLIB
>         help
>           GD support
>
> diff --git a/package/php/php.mk b/package/php/php.mk
> index 8282bb1cc7..4d2f1b8f63 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -327,12 +327,10 @@ endif
>
>  ifeq ($(BR2_PACKAGE_PHP_EXT_GD),y)
>  PHP_CONF_OPTS += \
> -       --with-gd \
> -       --with-jpeg-dir=$(STAGING_DIR)/usr \
> -       --with-png-dir=$(STAGING_DIR)/usr \
> -       --with-zlib-dir=$(STAGING_DIR)/usr \
> -       --with-freetype-dir=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += jpeg libpng freetype
> +       --enable-gd \
> +       --with-jpeg \
> +       --with-freetype
> +PHP_DEPENDENCIES += jpeg libpng freetype zlib
>  endif
>
>  ifeq ($(BR2_PACKAGE_PHP_SAPI_FPM),y)
>
>
> ------------------------------
>
> Message: 40
> Date: Wed, 6 May 2020 07:15:01 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/python-iptables: add explicit dependency on dynamic libs
> Message-ID: <20200506051931.924CC811F5@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=b6d45c45cb0e0e0a7080350dadb2eccefdaa8b0f
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The package uses ctypes.CDLL extensively which only makes sense when
> dynamic
> libraries are available.
>
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 21b85bc56cdcf030cced57dea0f78cdce59912b8)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-iptables/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/python-iptables/Config.in
> b/package/python-iptables/Config.in
> index e55359963e..a35577bad3 100644
> --- a/package/python-iptables/Config.in
> +++ b/package/python-iptables/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_PYTHON_IPTABLES
>         bool "python-iptables"
> +       depends on !BR2_STATIC_LIBS
>         select BR2_PACKAGE_IPTABLES # runtime dependency
>         help
>           Python bindings for iptables.
>
>           https://github.com/ldx/python-iptables
> +
> +comment "python-iptables needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
>
>
> ------------------------------
>
> Message: 41
> Date: Wed, 6 May 2020 07:00:34 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         board/solidrun/mx6cubox: create boot.scr in TARGET_DIR/boot
> Message-ID: <20200506051931.15A368D59C@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=6569f398eede2efde7c9dacf66fc5e0868c27bcb
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> There is no reason to create boot.scr in board/solidrun/mx6cubox and
> later install it in TARGET_DIR/boot, leaving a stale file behind.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 9ddbd11620b5a01945a438085d45ef2131bad35f)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  board/solidrun/mx6cubox/post-build.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/board/solidrun/mx6cubox/post-build.sh
> b/board/solidrun/mx6cubox/post-build.sh
> index 43e091c5d7..6ddc113702 100755
> --- a/board/solidrun/mx6cubox/post-build.sh
> +++ b/board/solidrun/mx6cubox/post-build.sh
> @@ -2,7 +2,7 @@
>
>  BOARD_DIR="$(dirname $0)"
>
> -$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> --n "boot script" -d $BOARD_DIR/boot.scr.txt $BOARD_DIR/boot.scr
> +install -d -m 755 $TARGET_DIR/boot
>
> -install -m 0644 -D $BOARD_DIR/boot.scr $TARGET_DIR/boot/boot.scr
> +$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> +       -n "boot script" -d $BOARD_DIR/boot.scr.txt
> $TARGET_DIR/boot/boot.scr
>
>
> ------------------------------
>
> Message: 42
> Date: Wed, 6 May 2020 07:03:24 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/libssh:
>         security bump to version 0.9.4
> Message-ID: <20200506051931.37D707FD28@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=4c16f29ee1228fef87ee0f621d95d0e6705b5ac9
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> Fixes CVE-2020-1730: Possible DoS in client and server when handling
> AES-CTR keys with OpenSSL.
>
> Format hash file with two spaces delimiter.
>
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 6b8a47e29252908b294bda0d089fab443db99903)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libssh/libssh.hash | 4 ++--
>  package/libssh/libssh.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
> index ca296701bf..62b860300a 100644
> --- a/package/libssh/libssh.hash
> +++ b/package/libssh/libssh.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
>  # https://www.libssh.org/files/0.9/libssh-0.9.3.tar.xz.asc
>  # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> -sha256 2c8b5f894dced58b3d629f16f3afa6562c20b4bdc894639163cf657833688f0c
> libssh-0.9.3.tar.xz
> -sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a
> COPYING
> +sha256  150897a569852ac05aac831dc417a7ba8e610c86ca2e0154a99c6ade2486226b
> libssh-0.9.4.tar.xz
> +sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a
> COPYING
> diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
> index 52517a5dd0..abc9aec9a3 100644
> --- a/package/libssh/libssh.mk
> +++ b/package/libssh/libssh.mk
> @@ -5,7 +5,7 @@
>
>  ################################################################################
>
>  LIBSSH_VERSION_MAJOR = 0.9
> -LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
> +LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
>  LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
>  LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
>  LIBSSH_LICENSE = LGPL-2.1
>
>
> ------------------------------
>
> Message: 43
> Date: Wed, 6 May 2020 07:13:37 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/mbedtls:
>         security bump to version 2.16.6
> Message-ID: <20200506051931.7EC02821B9@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=47c67ff56a40e242438d4bbb67fced4ad9d762c0
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> - Fix CVE-2020-10932: fix side channel in ECC code that allowed an
>   adversary with access to precise enough timing and memory access
>   information (typically an untrusted operating system attacking a
>   secure enclave) to fully recover an ECDSA private key.
> - Fix a potentially remotely exploitable buffer overread in a DTLS
>   client when parsing the Hello Verify Request message.
> - Fix bug in DTLS handling of new associations with the same parameters
>   (RFC 6347 section 4.2.8): after sending its HelloVerifyRequest, the
>   server would end up with corrupted state and only send invalid records
>   to the client. An attacker able to send forged UDP packets to the
>   server could use that to obtain a Denial of Service. This could only
>   happen when MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE was enabled in
>   config.h (which it is by default).
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit b5704f8869dc1f82790816e38de52aac6d709ffe)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mbedtls/mbedtls.hash | 6 +++---
>  package/mbedtls/mbedtls.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
> index 92e7d35a64..17ac18bb25 100644
> --- a/package/mbedtls/mbedtls.hash
> +++ b/package/mbedtls/mbedtls.hash
> @@ -1,5 +1,5 @@
> -# From
> https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released
> -sha1
> <https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.5-and-2.7.14-released-sha1>
> c36962183e05467aa1dadafcaacf90216a737866  mbedtls-2.16.5-apache.tgz
> -sha256  65b4c6cec83e048fd1c675e9a29a394ea30ad0371d37b5742453f74084e7b04d
> mbedtls-2.16.5-apache.tgz
> +# From
> https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released
> +sha1
> <https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.6-and-2.7.15-released+sha1>
> 3cb5b681597a5bd798d31038c129c0dc911d8a2c  mbedtls-2.16.6-apache.tgz
> +sha256  66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770
> mbedtls-2.16.6-apache.tgz
>  # Locally calculated
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30
> apache-2.0.txt
> diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> index 5d0dd87339..50121fa6c7 100644
> --- a/package/mbedtls/mbedtls.mk
> +++ b/package/mbedtls/mbedtls.mk
> @@ -5,7 +5,7 @@
>
>  ################################################################################
>
>  MBEDTLS_SITE = https://tls.mbed.org/code/releases
> -MBEDTLS_VERSION = 2.16.5
> +MBEDTLS_VERSION = 2.16.6
>  MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
>  MBEDTLS_CONF_OPTS = \
>         -DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
>
>
> ------------------------------
>
> Message: 44
> Date: Wed, 6 May 2020 07:03:34 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/libssh: add
>         patch to fix regression
> Message-ID: <20200506051931.5845F825FB@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=1d177afefce7b655f7a240c7c85cbccddab6d0df
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The libssh server is used by libnetconf2. With libssh version 0.9.4 a
> regression was introduced that wrongly leads to session closed after the
> poll timeout.
>
> The patch comes from upstrem:
>
> https://git.libssh.org/projects/libssh.git/commit/?id=6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4
>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 39099153d9404cd6f107f0fd92ce8686bbd1beb2)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...oid-returning-SSH_AGAIN-from-ssh_channel_.patch | 45
> ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git
> a/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
> b/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
> new file mode 100644
> index 0000000000..9cc9389479
> --- /dev/null
> +++
> b/package/libssh/0002-channels-Avoid-returning-SSH_AGAIN-from-ssh_channel_.patch
> @@ -0,0 +1,45 @@
> +From 6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4 Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 16 Apr 2020 11:13:34 +0200
> +Subject: [PATCH] channels: Avoid returning SSH_AGAIN from
> + ssh_channel_poll_timeout()
> +
> +This addresses a regression introduced in 3bad0607, partially fixed in
> 022409e9,
> +but the function was still able to return SSH_AGAIN, which was not
> expected by
> +callers.
> +
> +Based on discussion in [1] and [2]
> +
> +[1] https://gitlab.com/libssh/libssh-mirror/-/merge_requests/101
> +[2] https://www.libssh.org/archive/libssh/2020-03/0000029.html
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
> +
> +[Backport from upstream commit:
> +6417f5a3cac8537ac6f6ff7fc1642dfaa0917fb4]
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +---
> + src/channels.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/channels.c b/src/channels.c
> +index bcc1c207..9fe309d0 100644
> +--- a/src/channels.c
> ++++ b/src/channels.c
> +@@ -3116,6 +3116,12 @@ int ssh_channel_poll_timeout(ssh_channel channel,
> int timeout, int is_stderr)
> +         session->session_state == SSH_SESSION_STATE_ERROR) {
> +         rc = SSH_ERROR;
> +         goto out;
> ++    } else if (rc == SSH_AGAIN) {
> ++        /* If the above timeout expired, it is ok and we do not need to
> ++         * attempt to check the read buffer. The calling functions do not
> ++         * expect us to return SSH_AGAIN either here. */
> ++        rc = SSH_OK;
> ++        goto out;
> +     }
> +     len = ssh_buffer_get_len(stdbuf);
> +     if (len > 0) {
> +--
> +2.20.1
> +
>
>
> ------------------------------
>
> Message: 45
> Date: Wed, 6 May 2020 07:15:36 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/python-iptables: account for platform tag in extensions
> Message-ID: <20200506051931.B4A7F811F5@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=d853d927ff64d0f6d70d856e4ca48032522c0c02
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> EXT_SUFFIX in Python versions > 3.5 contains a platform tag which only
> applies
> to cpython extensions. Given that ctypes.util.find_library does not work
> on the
> target due to the absence of the underlying tools '.so' needs to be added
> as a
> possible suffix for libraries to enable python-iptables to find the
> iptables
> shared libraries.
>
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 52276cdda34aa986410626592031560bf64d788b)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...dd-.so-as-additional-shared-object-suffix.patch | 57
> ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git
> a/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
> b/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
> new file mode 100644
> index 0000000000..41d49fc1e6
> --- /dev/null
> +++
> b/package/python-iptables/0002-Add-.so-as-additional-shared-object-suffix.patch
> @@ -0,0 +1,57 @@
> +From 899d25c511c6ce779b7153e9ae2e41055b30b9c5 Mon Sep 17 00:00:00 2001
> +From: Frank Vanbever <frank.vanbever@essensium.com>
> +Date: Mon, 9 Mar 2020 12:36:47 +0100
> +Subject: [PATCH] Add '.so' as additional shared object suffix
> +
> +EXT_SUFFIX includes a platform information tag starting from Python 3.5
> [0]
> +For example:
> +
> +    >>> sysconfig.get_config_var("EXT_SUFFIX")
> +    '.cpython-38-aarch64-linux-gnu.so'
> +
> +This suffix only applies to cpython extensions i.e. not to the iptables
> shared
> +objects.
> +
> +Adding '.so' as an additional suffix for shared objects fixes the issue.
> +
> +Fixes: Issue #301
> +
> +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> +
> +Backported from: 899d25c511c6ce779b7153e9ae2e41055b30b9c5
> +
> +[0]: https://docs.python.org/3/whatsnew/3.5.html#build-and-c-api-changes
> +---
> + iptc/util.py | 13 ++++++++++---
> + 1 file changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/iptc/util.py b/iptc/util.py
> +index e6b1649..04fe905 100644
> +--- a/iptc/util.py
> ++++ b/iptc/util.py
> +@@ -80,12 +80,19 @@ def _do_find_library(name):
> +
> +
> + def _find_library(*names):
> ++    exts = []
> +     if version_info >= (3, 3):
> +-        ext = get_config_var("EXT_SUFFIX")
> ++        exts.append(get_config_var("EXT_SUFFIX"))
> +     else:
> +-        ext = get_config_var('SO')
> ++        exts.append(get_config_var('SO'))
> ++
> ++    if version_info >= (3, 5):
> ++        exts.append('.so')
> ++
> +     for name in names:
> +-        libnames = [name, "lib" + name, name + ext, "lib" + name + ext]
> ++        libnames = [name, "lib" + name]
> ++        for ext in exts:
> ++            libnames += [name + ext, "lib" + name + ext]
> +         libdir = os.environ.get('IPTABLES_LIBDIR', None)
> +         if libdir is not None:
> +             libdirs = libdir.split(':')
> +--
> +2.20.1
> +
>
>
> ------------------------------
>
> Message: 46
> Date: Wed, 6 May 2020 07:10:40 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/exim: fix
>         log and pid file paths
> Message-ID: <20200506051931.6D204821B9@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=9f79ad93cf3961981a1aa0bbd29b41baa6eb8474
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> By default, exim stores its PID file in /var/spool/exim, and its log
> file in /var/spool/exim/log, but it makes a lot more sense to have the
> logs in /var/log/exim and the PID file in /var/run/exim.
>
> Using binary name subdirectory in both cases allows for the use of
> systemd's LogsDirectory and RuntimeDirectory statements
>
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 754341460b7aa751164d7d7ec9b67908c2792fe2)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/exim/S86exim      | 10 +++++++++-
>  package/exim/exim.mk      |  2 ++
>  package/exim/exim.service |  4 ++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/package/exim/S86exim b/package/exim/S86exim
> index bec88fc222..0d09361f65 100644
> --- a/package/exim/S86exim
> +++ b/package/exim/S86exim
> @@ -3,11 +3,19 @@
>  # Start/stop exim
>  #
>
> -PIDFILE=/var/lock/exim/exim-daemon.pid
> +PIDFILE=/var/run/exim/exim.pid
>
>  case "$1" in
>    start)
>         echo "Starting exim..."
> +       if [ ! -d /var/log/exim ]; then
> +         mkdir -p /var/log/exim
> +         chown exim:mail /var/log/exim
> +       fi
> +       if [ ! -d /var/run/exim ]; then
> +         mkdir -p /var/run/exim
> +         chown root:mail /var/run/exim
> +       fi
>         start-stop-daemon -S -x exim -- -bd
>         ;;
>    stop)
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index e4b0bfc1b4..8d5b6e415b 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -39,6 +39,8 @@ define EXIM_USE_DEFAULT_CONFIG_FILE
>         $(INSTALL) -m 0644 $(@D)/src/EDITME $(@D)/Local/Makefile
>         $(call exim-config-change,BIN_DIRECTORY,/usr/sbin)
>         $(call exim-config-change,CONFIGURE_FILE,/etc/exim/configure)
> +       $(call exim-config-change,LOG_FILE_PATH,/var/log/exim/exim_%slog)
> +       $(call exim-config-change,PID_FILE_PATH,/var/run/exim/exim.pid)
>         $(call exim-config-change,EXIM_USER,ref:exim)
>         $(call exim-config-change,EXIM_GROUP,mail)
>         $(call exim-config-change,TRANSPORT_LMTP,yes)
> diff --git a/package/exim/exim.service b/package/exim/exim.service
> index fe97727ab5..ac3f067de4 100644
> --- a/package/exim/exim.service
> +++ b/package/exim/exim.service
> @@ -3,6 +3,10 @@ Description=Exim MTA
>  After=syslog.target network.target
>
>  [Service]
> +User=exim
> +Group=mail
> +LogsDirectory=exim
> +RuntimeDirectory=exim
>  ExecStart=/usr/sbin/exim -bdf
>  Restart=always
>
>
>
> ------------------------------
>
> Message: 47
> Date: Wed, 6 May 2020 07:15:10 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/python-iptables: try known libc instead of find_library()
> Message-ID: <20200506051931.A3BB1811F5@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=c121494d169b81adf53e73c522a5abbc79a700dc
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> ctypes.util.find_library() depends on gcc and friends to detect the
> location of
> a given shared library. Given that these are not available on the target
> and
> that python-iptables depends on this functionality we need to work around
> this.
> The SONAMEs of the libc are well known so we try the known ones for glibc,
> uClibc and musl.
>
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271
>
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 90c18ab269c600ee7643f69212713ee3b74c38bd)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-Add-separate-mechanism-to-load-libc.patch | 90
> ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git
> a/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
> b/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
> new file mode 100644
> index 0000000000..2a344c2f55
> --- /dev/null
> +++
> b/package/python-iptables/0001-Add-separate-mechanism-to-load-libc.patch
> @@ -0,0 +1,90 @@
> +From e3557528d7cdcdc2c579212be8837bc9b54635a4 Mon Sep 17 00:00:00 2001
> +From: Frank Vanbever <frank.vanbever@essensium.com>
> +Date: Thu, 20 Feb 2020 12:14:08 +0100
> +Subject: [PATCH] Add separate mechanism to load libc
> +
> +ctypes.util.find_library() always returns None for systems which do not
> have the
> +tools installed to determine the location of a given shared library (i.e.
> +ldconfig, gcc, objdump). If find_libary() fails attempt to load known
> libc by
> +SONAME.
> +
> +Upstream:
> https://github.com/ldx/python-iptables/commit/e3557528d7cdcdc2c579212be8837bc9b54635a4
> +
> +Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> +---
> + iptc/ip4tc.py   |  4 ++--
> + iptc/util.py    | 16 ++++++++++++++++
> + iptc/xtables.py |  4 ++--
> + 3 files changed, 20 insertions(+), 4 deletions(-)
> +
> +diff --git a/iptc/ip4tc.py b/iptc/ip4tc.py
> +index 4c5d690..4ddd2dc 100644
> +--- a/iptc/ip4tc.py
> ++++ b/iptc/ip4tc.py
> +@@ -9,7 +9,7 @@ import socket
> + import struct
> + import weakref
> +
> +-from .util import find_library, load_kernel
> ++from .util import find_library, load_kernel, find_libc
> + from .xtables import (XT_INV_PROTO, NFPROTO_IPV4, XTablesError, xtables,
> +                       xt_align, xt_counters, xt_entry_target,
> xt_entry_match)
> +
> +@@ -26,7 +26,7 @@ if not hasattr(socket, 'IPPROTO_SCTP'):
> +
> + _IFNAMSIZ = 16
> +
> +-_libc = ct.CDLL("libc.so.6")
> ++_libc = find_libc()
> + _get_errno_loc = _libc.__errno_location
> + _get_errno_loc.restype = ct.POINTER(ct.c_int)
> + _malloc = _libc.malloc
> +diff --git a/iptc/util.py b/iptc/util.py
> +index ae5fb9b..e6b1649 100644
> +--- a/iptc/util.py
> ++++ b/iptc/util.py
> +@@ -109,3 +109,19 @@ def find_library(*names):
> +             major = int(m.group(1))
> +         return lib, major
> +     return None, None
> ++
> ++
> ++def find_libc():
> ++    lib = ctypes.util.find_library('c')
> ++    if lib is not None:
> ++        return ctypes.CDLL(lib, mode=ctypes.RTLD_GLOBAL)
> ++
> ++    libnames = ['libc.so.6', 'libc.so.0', 'libc.so']
> ++    for name in libnames:
> ++        try:
> ++            lib = ctypes.CDLL(name, mode=ctypes.RTLD_GLOBAL)
> ++            return lib
> ++        except:
> ++            pass
> ++
> ++    return None
> +diff --git a/iptc/xtables.py b/iptc/xtables.py
> +index 93bc080..cf21029 100644
> +--- a/iptc/xtables.py
> ++++ b/iptc/xtables.py
> +@@ -6,7 +6,7 @@ import sys
> + import weakref
> +
> + from . import version
> +-from .util import find_library
> ++from .util import find_library, find_libc
> + from .errors import *
> +
> + XT_INV_PROTO = 0x40  # invert the sense of PROTO
> +@@ -792,7 +792,7 @@ class xtables_target(ct.Union):
> +                 ("v12", _xtables_target_v12)]
> +
> +
> +-_libc, _ = find_library("c")
> ++_libc = find_libc()
> + _optind = ct.c_long.in_dll(_libc, "optind")
> + _optarg = ct.c_char_p.in_dll(_libc, "optarg")
> +
> +--
> +2.20.1
> +
>
>
> ------------------------------
>
> Message: 48
> Date: Wed, 6 May 2020 07:21:21 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/python-dpkt: remove Python2 only dependency
> Message-ID: <20200506051931.D56598B7AF@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=7f882e9942ff70d054ccf4c11657f743dd530629
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> python-dpkt supports both Python flavors.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 12ccb92fce1ecb4215ff1071656292a5b9d4313d)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/python-dpkt/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
> index d8e3388d7e..9bd7a98d26 100644
> --- a/package/python-dpkt/Config.in
> +++ b/package/python-dpkt/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_PYTHON_DPKT
>         bool "python-dpkt"
> -       depends on BR2_PACKAGE_PYTHON
> -       select BR2_PACKAGE_PYTHON_ZLIB
> +       select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
>         help
>           Fast, simple packet creation / parsing, with definitions
>           for the basic TCP/IP protocols.
>
>
> ------------------------------
>
> Message: 49
> Date: Wed, 6 May 2020 07:22:52 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/libsepol:
>         fix help text for BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
> Message-ID: <20200506051931.E603B8B7AF@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=7c6cc0dd7dc12b8d6d7026ce17fa3586cd30ba5e
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The help text was wrong, as it didn't match the actual default values
> we were specifying. Indeed, when we specify:
>
>         default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
>         default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
>
> It means that the policy version 30 is supported starting from Linux
> 4.3 included, and that 31 is supported from Linux 4.13 included.
>
> So we shouldn't have:
>
>           > 4.3 <= 4.13    30
>           > 4.13           31
>
> but:
>
>           >= 4.3 < 4.13    30
>           >= 4.13          31
>
> This patch fixes that for all versions.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 67d7705a9aa58886e8a8777fe4c95746c1fb5c96)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/libsepol/Config.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> index 21d4d7865c..21d9e96179 100644
> --- a/package/libsepol/Config.in
> +++ b/package/libsepol/Config.in
> @@ -22,12 +22,12 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
>
>           Here's a handy table to help you choose:
>           kernel version   SElinux policy max version
> -         <= 2.6.x         25
> -         > 2.6 <= 3.5     26
> -         > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
> -         > 3.14 <= 4.3    29
> -         > 4.3 <= 4.13    30
> -         > 4.13           31
> +         < 2.6.x          25
> +         >= 2.6 < 3.5     26
> +         >= 3.5 < 3.14    28 (27 and 28 were added@the same time)
> +         >= 3.14 < 4.3    29
> +         >= 4.3 < 4.13    30
> +         >= 4.13          31
>
>  endif
>
>
>
> ------------------------------
>
> Message: 50
> Date: Wed, 6 May 2020 06:57:45 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x]
>         package/azure-iot-sdk-c: use full destination path for $(INSTALL)
> Message-ID: <20200506051930.ACB7281027@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=42687ce6750ae972de0b478233cfa6edbd4bf20d
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The canonical way to use $(INSTALL) is to have a full destination
> path, that includes the file name.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 59de11b0476699ddeb2cbcd30a524b849249956a)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> index b194bf9a4c..e6345104eb 100644
> --- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
> @@ -46,7 +46,7 @@ endif
>
>  define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>         $(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> -               $(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
> +               $(INSTALL) -D -m 0755 $(@D)/$(l)
> $(STAGING_DIR)/usr/lib/$(notdir $(l))
>         )
>         cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
>         cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
> @@ -54,7 +54,7 @@ endef
>
>  define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
>         $(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> -               $(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
> +               $(INSTALL) -D -m 0755 $(@D)/$(l)
> $(TARGET_DIR)/usr/lib/$(notdir $(l))
>         )
>  endef
>
>
>
> ------------------------------
>
> Message: 51
> Date: Wed, 6 May 2020 07:26:58 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit: add
>         upstream fix for SIGTTOU
> Message-ID: <20200506051932.33D04882AE@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=bad149c07ca996f5dca8dfca20cd2feaa91cfa8e
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> If tty_handler() resets terminal while pkttyagent is run in background job,
> the process gets stopped by SIGTTOU. This impacts systemctl, hence it must
> be blocked for a while and then the process gets killed anyway.
>
> Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 0d749be3e1c144ed711908da49dac9f274bfc996)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...03-polkit-0.116-pkttyagent-sigttou-bg-job.patch | 34
> ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git
> a/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
> b/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
> new file mode 100644
> index 0000000000..fb41df3af2
> --- /dev/null
> +++ b/package/polkit/0003-polkit-0.116-pkttyagent-sigttou-bg-job.patch
> @@ -0,0 +1,34 @@
> +From 76aae4fce586b400f5fe08df31497db19d624609 Mon Sep 17 00:00:00 2001
> +From: Jan Rybar <jrybar@redhat.com>
> +Date: Thu, 1 Aug 2019 06:46:10 +0000
> +Subject: [PATCH] pkttyagent: process stopped by SIGTTOU if run in
> background
> + job
> +
> +
> +(cherry picked from commit 76aae4fce586b400f5fe08df31497db19d624609)
> +Signed-off-by: Jan Rybar <jrybar@redhat.com>
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +---
> + src/programs/pkttyagent.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/programs/pkttyagent.c b/src/programs/pkttyagent.c
> +index 3c8d502..13879a2 100644
> +--- a/src/programs/pkttyagent.c
> ++++ b/src/programs/pkttyagent.c
> +@@ -264,6 +264,12 @@ main (int argc, char *argv[])
> +
> +   memset (&sa, 0, sizeof (sa));
> +   sa.sa_handler = &tty_handler;
> ++/* If tty_handler() resets terminal while pkttyagent is run in
> background job,
> ++   the process gets stopped by SIGTTOU. This impacts systemctl, hence it
> must
> ++   be blocked for a while and then the process gets killed anyway.
> ++ */
> ++  sigemptyset(&sa.sa_mask);
> ++  sigaddset(&sa.sa_mask, SIGTTOU);
> +   sigaction (SIGTERM, &sa, &savesigterm);
> +   sigaction (SIGINT, &sa, &savesigint);
> +   sigaction (SIGTSTP, &sa, &savesigtstp);
> +--
> +2.24.1
> +
>
>
> ------------------------------
>
> Message: 52
> Date: Wed, 6 May 2020 07:20:29 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/php:
>         security bump version to 7.4.5
> Message-ID: <20200506051931.C57F08B7AF@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=5d5694d36d0bb36d79cc1ae37cedbef8a2a092f1
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> Changelog: https://www.php.net/ChangeLog-7.php#7.4.5
>
> Fixes CVE-2020-7067.
>
> Removed patch applied upstream.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit db52b57c3dc625fc06d4408242252129ca47b026)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...0005-Check-for-sys-auxv.h-before-using-it.patch | 60
> ----------------------
>  package/php/php.hash                               |  2 +-
>  package/php/php.mk                                 |  2 +-
>  3 files changed, 2 insertions(+), 62 deletions(-)
>
> diff --git a/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
> b/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
> deleted file mode 100644
> index 559c64db8a..0000000000
> --- a/package/php/0005-Check-for-sys-auxv.h-before-using-it.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From f150702d5ab72878d45b722b6d7d4194db92c44a Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Mon, 9 Mar 2020 15:36:48 +0100
> -Subject: [PATCH] Check for sys/auxv.h before using it.
> -
> -Fixes aarch64 compile wiht uclibc-ng (does not provide
> -sys/auxv.h header file).
> -
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> -Upstream:
> https://github.com/php/php-src/commit/f73528f0e0d59ac744ccb4a94a3a9d7b9f0fba1b
> ----
> - configure.ac         | 1 +
> - ext/standard/crc32.c | 9 +++++++--
> - 2 files changed, 8 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 5219a5f2..caf62302 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -440,6 +440,7 @@ resolv.h \
> - strings.h \
> - syslog.h \
> - sysexits.h \
> -+sys/auxv.h \
> - sys/ioctl.h \
> - sys/file.h \
> - sys/mman.h \
> -diff --git a/ext/standard/crc32.c b/ext/standard/crc32.c
> -index c3ca5903..e59ab45f 100644
> ---- a/ext/standard/crc32.c
> -+++ b/ext/standard/crc32.c
> -@@ -17,10 +17,15 @@
> - */
> -
> - #include "php.h"
> -+#ifdef PHP_WIN32
> -+#include "config.w32.h"
> -+#else
> -+#include <php_config.h>
> -+#endif
> - #include "basic_functions.h"
> - #include "crc32.h"
> -
> --#if defined(__aarch64__)
> -+#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
> - # include <arm_acle.h>
> - # if defined(__linux__)
> - #  include <sys/auxv.h>
> -@@ -85,7 +90,7 @@ PHP_NAMED_FUNCTION(php_if_crc32)
> -
> -       crc = crcinit^0xFFFFFFFF;
> -
> --#if defined(__aarch64__)
> -+#if defined(__aarch64__) && defined(HAVE_SYS_AUXV_H)
> -       if (has_crc32_insn()) {
> -               crc = crc32_aarch64(crc, p, nr);
> -               RETURN_LONG(crc^0xFFFFFFFF);
> ---
> -2.25.1
> -
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 4584524f1c..a0b8fd4688 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php
> -sha256 1873c4cefdd3df9a78dcffb2198bba5c2f0464f55c9c960720c84df483fca74c
> php-7.4.4.tar.xz
> +sha256 d059fd7f55bdc4d2eada15a00a2976697010d3631ef6f83149cc5289e1f23c2c
> php-7.4.5.tar.xz
>
>  # License file
>  sha256 0967ad6cf4b7fe81d38709d7aaef3fecb3bd685be7eebb37b864aa34c991baa7
> LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index f62204c2a5..91f82dbf31 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -PHP_VERSION = 7.4.4
> +PHP_VERSION = 7.4.5
>  PHP_SITE = http://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
>
>
> ------------------------------
>
> Message: 53
> Date: Wed, 6 May 2020 07:29:39 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/netsnmp:
>         unix domain socket transport
> Message-ID: <20200506051932.6519D882AE@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=8f14e3c883aef1c81e45a020f36bb3c03f0c914b
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> The support for Unix domain socket transport was disabled as part of
> the bump of netsnmp from 5.5 to 5.6 in commit
> de642c9904b13914017af6f10db144d559d6bd0c, but with no apparent reason.
>
> This support is needed to allow Unix socket based AgentX subagents to
> connect to netsnmp, so let's re-enable it.
>
> Signed-off-by: Ryan Steffens <ryan.steffens@rockwellcollins.com>
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> (cherry picked from commit 8aef2d3a5b1e56c82d4d61deded1a742899b1a1c)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/netsnmp/netsnmp.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
> index ed573c51e3..904279d1fb 100644
> --- a/package/netsnmp/netsnmp.mk
> +++ b/package/netsnmp/netsnmp.mk
> @@ -30,7 +30,6 @@ NETSNMP_CONF_OPTS = \
>         --with-sys-location="Unknown" \
>         --with-mib-modules="$(call
> qstrip,$(BR2_PACKAGE_NETSNMP_WITH_MIB_MODULES))" \
>         --with-out-mib-modules="$(call
> qstrip,$(BR2_PACKAGE_NETSNMP_WITHOUT_MIB_MODULES))" \
> -       --with-out-transports="Unix" \
>         --disable-manuals
>  NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR)
> LIB_LDCONFIG_CMD=true install
>  NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true
> install
>
>
> ------------------------------
>
> Message: 54
> Date: Wed, 6 May 2020 07:25:31 +0200
> From: Peter Korsgaard <peter@korsgaard.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [git commit branch/2020.02.x] package/polkit:
>         properly autoreconf
> Message-ID: <20200506051932.025F390EA9@busybox.osuosl.org>
>
> commit:
> https://git.buildroot.net/buildroot/commit/?id=0919c67bb665c7f474a1848ec69a5972c8126d06
> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
>
> 0001-make-netgroup-support-optional.patch patches configure.ac, but we
> don't autoreconf the package, which is not good.
>
> However, simply adding AUTORECONF = YES is not sufficient: polkit
> Makefile.am use the automake conditional HAVE_INTROSPECTION, which is
> "available" only when the gobject-introspection m4 file is installed.
>
> Since we don't want to make gobject-introspection a mandatory
> dependency of polkit, we take a simpler route: add a copy of
> introspection.m4 into the polkit source tree. This is only a 142 lines
> file, and it can be dropped when
> 0001-make-netgroup-support-optional.patch is merged upstream.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> (cherry picked from commit 8edcb8473001032e3ea6f162784b2f24db88decc)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../0001-make-netgroup-support-optional.patch      | 211
> +++++++++++++++++++--
>  package/polkit/polkit.mk                           |   2 +-
>  2 files changed, 192 insertions(+), 21 deletions(-)
>
> diff --git a/package/polkit/0001-make-netgroup-support-optional.patch
> b/package/polkit/0001-make-netgroup-support-optional.patch
> index f96738c910..86916aba34 100644
> --- a/package/polkit/0001-make-netgroup-support-optional.patch
> +++ b/package/polkit/0001-make-netgroup-support-optional.patch
> @@ -1,4 +1,4 @@
> -From 21aa2747e8f0048759aab184b07dd6389666d5e6 Mon Sep 17 00:00:00 2001
> +From 1b854ef4bb15032091a33fed587e5ba6f3e582eb Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 22 May 2019 13:18:55 -0700
>  Subject: [PATCH] make netgroup support optional
> @@ -17,20 +17,174 @@ Fixes bug 50145.
>  Signed-off-by: A. Wilcox <AWilcox@Wilcox-Tech.com>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Adam Duskett <aduskett@gmail.com>
> +[Thomas: add introspection.m4.]
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  ---
> - configure.ac                                     |  2 +-
> - src/polkit/polkitidentity.c                      | 16 ++++++++++++++++
> - src/polkit/polkitunixnetgroup.c                  |  3 +++
> - .../polkitbackendinteractiveauthority.c          | 14 ++++++++------
> - src/polkitbackend/polkitbackendjsauthority.cpp   |  2 ++
> - test/polkit/polkitidentitytest.c                 |  9 ++++++++-
> - test/polkit/polkitunixnetgrouptest.c             |  3 +++
> - .../test-polkitbackendjsauthority.c              |  2 ++
> - 8 files changed, 43 insertions(+), 8 deletions(-)
> + buildutil/introspection.m4                    | 142 ++++++++++++++++++
> + configure.ac                                  |   2 +-
> + src/polkit/polkitidentity.c                   |  16 ++
> + src/polkit/polkitunixnetgroup.c               |   3 +
> + .../polkitbackendinteractiveauthority.c       |  14 +-
> + .../polkitbackendjsauthority.cpp              |   2 +
> + test/polkit/polkitidentitytest.c              |   9 +-
> + test/polkit/polkitunixnetgrouptest.c          |   3 +
> + .../test-polkitbackendjsauthority.c           |   2 +
> + 9 files changed, 185 insertions(+), 8 deletions(-)
> + create mode 100644 buildutil/introspection.m4
>
> +diff --git a/buildutil/introspection.m4 b/buildutil/introspection.m4
> +new file mode 100644
> +index 0000000..b0ccd68
> +--- /dev/null
> ++++ b/buildutil/introspection.m4
> +@@ -0,0 +1,142 @@
> ++dnl -*- mode: autoconf -*-
> ++dnl Copyright 2009 Johan Dahlin
> ++dnl
> ++dnl This file is free software; the author(s) gives unlimited
> ++dnl permission to copy and/or distribute it, with or without
> ++dnl modifications, as long as this notice is preserved.
> ++dnl
> ++
> ++# serial 1
> ++
> ++dnl This is a copy of AS_AC_EXPAND
> ++dnl
> ++dnl (C) 2003, 2004, 2005 Thomas Vander Stichele <thomas@apestaart dot
> org>
> ++dnl Copying and distribution of this file, with or without modification,
> ++dnl are permitted in any medium without royalty provided the copyright
> ++dnl notice and this notice are preserved.
> ++m4_define([_GOBJECT_INTROSPECTION_AS_AC_EXPAND],
> ++[
> ++  EXP_VAR=[$1]
> ++  FROM_VAR=[$2]
> ++
> ++  dnl first expand prefix and exec_prefix if necessary
> ++  prefix_save=$prefix
> ++  exec_prefix_save=$exec_prefix
> ++
> ++  dnl if no prefix given, then use /usr/local, the default prefix
> ++  if test "x$prefix" = "xNONE"; then
> ++    prefix="$ac_default_prefix"
> ++  fi
> ++  dnl if no exec_prefix given, then use prefix
> ++  if test "x$exec_prefix" = "xNONE"; then
> ++    exec_prefix=$prefix
> ++  fi
> ++
> ++  full_var="$FROM_VAR"
> ++  dnl loop until it doesn't change anymore
> ++  while true; do
> ++    new_full_var="`eval echo $full_var`"
> ++    if test "x$new_full_var" = "x$full_var"; then break; fi
> ++    full_var=$new_full_var
> ++  done
> ++
> ++  dnl clean up
> ++  full_var=$new_full_var
> ++  AC_SUBST([$1], "$full_var")
> ++
> ++  dnl restore prefix and exec_prefix
> ++  prefix=$prefix_save
> ++  exec_prefix=$exec_prefix_save
> ++])
> ++
> ++m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
> ++[
> ++    AC_BEFORE([AC_PROG_LIBTOOL],[$0])dnl setup libtool first
> ++    AC_BEFORE([AM_PROG_LIBTOOL],[$0])dnl setup libtool first
> ++    AC_BEFORE([LT_INIT],[$0])dnl setup libtool first
> ++
> ++    dnl enable/disable introspection
> ++    m4_if([$2], [require],
> ++    [dnl
> ++        enable_introspection=yes
> ++    ],[dnl
> ++        AC_ARG_ENABLE(introspection,
> ++
> AS_HELP_STRING([--enable-introspection[=@<:@no/auto/yes@:>@]],
> ++                                 [Enable introspection for this
> build]),,
> ++                                 [enable_introspection=auto])
> ++    ])dnl
> ++
> ++    AC_MSG_CHECKING([for gobject-introspection])
> ++
> ++    dnl presence/version checking
> ++    AS_CASE([$enable_introspection],
> ++    [no], [dnl
> ++        found_introspection="no (disabled, use --enable-introspection to
> enable)"
> ++    ],dnl
> ++    [yes],[dnl
> ++        PKG_CHECK_EXISTS([gobject-introspection-1.0],,
> ++                         AC_MSG_ERROR([gobject-introspection-1.0 is not
> installed]))
> ++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
> ++                         found_introspection=yes,
> ++                         AC_MSG_ERROR([You need to have
> gobject-introspection >= $1 installed to build AC_PACKAGE_NAME]))
> ++    ],dnl
> ++    [auto],[dnl
> ++        PKG_CHECK_EXISTS([gobject-introspection-1.0 >= $1],
> found_introspection=yes, found_introspection=no)
> ++      dnl Canonicalize enable_introspection
> ++      enable_introspection=$found_introspection
> ++    ],dnl
> ++    [dnl
> ++        AC_MSG_ERROR([invalid argument passed to --enable-introspection,
> should be one of @<:@no/auto/yes@:>@])
> ++    ])dnl
> ++
> ++    AC_MSG_RESULT([$found_introspection])
> ++
> ++    dnl expand datadir/libdir so we can pass them to pkg-config
> ++    dnl and get paths relative to our target directories
> ++    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_DATADIR, "$datadir")
> ++    _GOBJECT_INTROSPECTION_AS_AC_EXPAND(_GI_EXP_LIBDIR, "$libdir")
> ++
> ++    INTROSPECTION_SCANNER=
> ++    INTROSPECTION_COMPILER=
> ++    INTROSPECTION_GENERATE=
> ++    INTROSPECTION_GIRDIR=
> ++    INTROSPECTION_TYPELIBDIR=
> ++    if test "x$found_introspection" = "xyes"; then
> ++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_scanner gobject-introspection-1.0`
> ++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_compiler gobject-introspection-1.0`
> ++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=g_ir_generate gobject-introspection-1.0`
> ++       INTROSPECTION_GIRDIR=`$PKG_CONFIG
> --define-variable=datadir="${_GI_EXP_DATADIR}" --variable=girdir
> gobject-introspection-1.0`
> ++       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG
> --define-variable=libdir="${_GI_EXP_LIBDIR}" --variable=typelibdir
> gobject-introspection-1.0)"
> ++       INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags
> gobject-introspection-1.0`
> ++       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
> ++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG
> --variable=datadir
> gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
> ++    fi
> ++    AC_SUBST(INTROSPECTION_SCANNER)
> ++    AC_SUBST(INTROSPECTION_COMPILER)
> ++    AC_SUBST(INTROSPECTION_GENERATE)
> ++    AC_SUBST(INTROSPECTION_GIRDIR)
> ++    AC_SUBST(INTROSPECTION_TYPELIBDIR)
> ++    AC_SUBST(INTROSPECTION_CFLAGS)
> ++    AC_SUBST(INTROSPECTION_LIBS)
> ++    AC_SUBST(INTROSPECTION_MAKEFILE)
> ++
> ++    AM_CONDITIONAL(HAVE_INTROSPECTION, test "x$found_introspection" =
> "xyes")
> ++])
> ++
> ++
> ++dnl Usage:
> ++dnl   GOBJECT_INTROSPECTION_CHECK([minimum-g-i-version])
> ++
> ++AC_DEFUN([GOBJECT_INTROSPECTION_CHECK],
> ++[
> ++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1])
> ++])
> ++
> ++dnl Usage:
> ++dnl   GOBJECT_INTROSPECTION_REQUIRE([minimum-g-i-version])
> ++
> ++
> ++AC_DEFUN([GOBJECT_INTROSPECTION_REQUIRE],
> ++[
> ++  _GOBJECT_INTROSPECTION_CHECK_INTERNAL([$1], [require])
> ++])
> +diff --git a/configure.ac b/configure.ac
> +index 5cedb4e..87aa0ad 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -99,7 +99,7 @@ AC_CHECK_LIB(expat,XML_ParserCreate,[EXP
> +@@ -99,7 +99,7 @@
> AC_CHECK_LIB(expat,XML_ParserCreate,[EXPAT_LIBS="-lexpat"],
>              [AC_MSG_ERROR([Can't find expat library. Please install
> expat.])])
>   AC_SUBST(EXPAT_LIBS)
>
> @@ -39,9 +193,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
>   if test "x$GCC" = "xyes"; then
>     LDFLAGS="-Wl,--as-needed $LDFLAGS"
> +diff --git a/src/polkit/polkitidentity.c b/src/polkit/polkitidentity.c
> +index 3aa1f7f..10e9c17 100644
>  --- a/src/polkit/polkitidentity.c
>  +++ b/src/polkit/polkitidentity.c
> -@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gcha
> +@@ -182,7 +182,15 @@ polkit_identity_from_string  (const gchar   *str,
>       }
>     else if (g_str_has_prefix (str, "unix-netgroup:"))
>       {
> @@ -57,7 +213,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>       }
>
>     if (identity == NULL && (error != NULL && *error == NULL))
> -@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVaria
> +@@ -344,6 +352,13 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
>         GVariant *v;
>         const char *name;
>
> @@ -71,7 +227,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>         v = lookup_asv (details_gvariant, "name", G_VARIANT_TYPE_STRING,
> error);
>         if (v == NULL)
>           {
> -@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVaria
> +@@ -353,6 +368,7 @@ polkit_identity_new_for_gvariant (GVariant  *variant,
>         name = g_variant_get_string (v, NULL);
>         ret = polkit_unix_netgroup_new (name);
>         g_variant_unref (v);
> @@ -79,9 +235,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>       }
>     else
>       {
> +diff --git a/src/polkit/polkitunixnetgroup.c
> b/src/polkit/polkitunixnetgroup.c
> +index 8a2b369..83f8d4a 100644
>  --- a/src/polkit/polkitunixnetgroup.c
>  +++ b/src/polkit/polkitunixnetgroup.c
> -@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUni
> +@@ -194,6 +194,9 @@ polkit_unix_netgroup_set_name (PolkitUnixNetgroup
> *group,
>   PolkitIdentity *
>   polkit_unix_netgroup_new (const gchar *name)
>   {
> @@ -91,9 +249,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>     g_return_val_if_fail (name != NULL, NULL);
>     return POLKIT_IDENTITY (g_object_new (POLKIT_TYPE_UNIX_NETGROUP,
>                                          "name", name,
> +diff --git a/src/polkitbackend/polkitbackendinteractiveauthority.c
> b/src/polkitbackend/polkitbackendinteractiveauthority.c
> +index 056d9a8..36c2f3d 100644
>  --- a/src/polkitbackend/polkitbackendinteractiveauthority.c
>  +++ b/src/polkitbackend/polkitbackendinteractiveauthority.c
> -@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
> +@@ -2233,25 +2233,26 @@ get_users_in_net_group (PolkitIdentity
>         *group,
>     GList *ret;
>
>     ret = NULL;
> @@ -126,7 +286,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>         PolkitIdentity *user;
>         GError *error = NULL;
>
> -@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
> +@@ -2282,6 +2283,7 @@ get_users_in_net_group (PolkitIdentity
>       *group,
>
>    out:
>     endnetgrent ();
> @@ -134,9 +294,11 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>     return ret;
>   }
>
> +diff --git a/src/polkitbackend/polkitbackendjsauthority.cpp
> b/src/polkitbackend/polkitbackendjsauthority.cpp
> +index 9b752d1..09b2878 100644
>  --- a/src/polkitbackend/polkitbackendjsauthority.cpp
>  +++ b/src/polkitbackend/polkitbackendjsauthority.cpp
> -@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext
> +@@ -1502,6 +1502,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
>
>     JS::CallArgs args = JS::CallArgsFromVp (argc, vp);
>
> @@ -144,7 +306,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>     JS::RootedString usrstr (authority->priv->cx);
>     usrstr = args[0].toString();
>     user = JS_EncodeStringToUTF8 (cx, usrstr);
> -@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext
> +@@ -1519,6 +1520,7 @@ js_polkit_user_is_in_netgroup (JSContext  *cx,
>
>     JS_free (cx, netgroup);
>     JS_free (cx, user);
> @@ -152,6 +314,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
>     ret = true;
>
> +diff --git a/test/polkit/polkitidentitytest.c
> b/test/polkit/polkitidentitytest.c
> +index e91967b..e829aaa 100644
>  --- a/test/polkit/polkitidentitytest.c
>  +++ b/test/polkit/polkitidentitytest.c
>  @@ -19,6 +19,7 @@
> @@ -162,7 +326,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>   #include "glib.h"
>   #include <polkit/polkit.h>
>   #include <polkit/polkitprivate.h>
> -@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_tes
> +@@ -145,11 +146,15 @@ struct ComparisonTestData comparison_test_data [] =
> {
>     {"unix-group:root", "unix-group:jane", FALSE},
>     {"unix-group:jane", "unix-group:jane", TRUE},
>
> @@ -193,6 +357,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
>     add_comparison_tests ();
>
> +diff --git a/test/polkit/polkitunixnetgrouptest.c
> b/test/polkit/polkitunixnetgrouptest.c
> +index 3701ba1..e3352eb 100644
>  --- a/test/polkit/polkitunixnetgrouptest.c
>  +++ b/test/polkit/polkitunixnetgrouptest.c
>  @@ -19,6 +19,7 @@
> @@ -213,6 +379,8 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>  +#endif
>     return g_test_run ();
>   }
> +diff --git a/test/polkitbackend/test-polkitbackendjsauthority.c
> b/test/polkitbackend/test-polkitbackendjsauthority.c
> +index 71aad23..fdd28f3 100644
>  --- a/test/polkitbackend/test-polkitbackendjsauthority.c
>  +++ b/test/polkitbackend/test-polkitbackendjsauthority.c
>  @@ -137,12 +137,14 @@ test_get_admin_identities (void)
> @@ -230,3 +398,6 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
>     };
>     guint n;
>
> +--
> +2.25.1
> +
> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
> index 4e7cda943c..8572d8b9ba 100644
> --- a/package/polkit/polkit.mk
> +++ b/package/polkit/polkit.mk
> @@ -8,7 +8,7 @@ POLKIT_VERSION = 0.116
>  POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
>  POLKIT_LICENSE = GPL-2.0
>  POLKIT_LICENSE_FILES = COPYING
> -
> +POLKIT_AUTORECONF = YES
>  POLKIT_INSTALL_STAGING = YES
>
>  POLKIT_DEPENDENCIES = \
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> ------------------------------
>
> End of buildroot Digest, Vol 167, Issue 12
> ******************************************
>


-- 
*Thanks with Regards!*

*Kunal Chauhan*
*Mob:09813614826*
*Mob:08860397903*

*E-mail:atkunalchauhan at gmail.com <E-mail%3Aatkunalchauhan@gmail.com>*
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200506/d4262865/attachment-0001.html>
