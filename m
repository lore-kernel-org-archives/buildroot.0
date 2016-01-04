From: David Evans <sir.dje1812@gmail.com>
Date: Mon, 4 Jan 2016 11:20:32 +0000
Subject: [Buildroot] buildroot Digest, Vol 115, Issue 6
In-Reply-To: <mailman.1473.1451897711.24626.buildroot@busybox.net>
References: <mailman.1473.1451897711.24626.buildroot@busybox.net>
Message-ID: <CAC322bi-zMzKAsQZepqgpt+H_sk+24NzbZJ8vp9ULWbPtyLSgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks

On Monday, 4 January 2016, <buildroot-request@busybox.net> wrote:

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
>    1. Re: [PATCH 1/1] openldap: add support to build the        server
>       (Andreas Ehmanns)
>    2. [PATCH] python-urllib3: new package (Yegor Yefremov)
>    3. Re: [PATCH v3] Makefile: drop ldconfig handling (Peter Korsgaard)
>    4. Re: [PATCH] python-can: bump to 1.4.1 (Peter Korsgaard)
>    5. Re: [PATCH] support/download: generate reproducible Hg
>       archives (Peter Korsgaard)
>    6. Re: [PATCH] package/tremor: select libogg package
>       (Peter Korsgaard)
>    7. Re: [PATCH] support/download: generate reproducible       Bazaar
>       archives (Peter Korsgaard)
>    8. Re: [PATCH 1/1] added option to enable or disable reboot on
>       ctrl-alt-del (Peter Korsgaard)
>    9. Re: [PATCH] python-urllib3: new package (Peter Korsgaard)
>   10. [PATCH 2/2] Update the Beaglbone configuration: (Chris LaRocque)
>   11. [PATCH 1/2] Updated the Beaglebone configuration: (Chris LaRocque)
>   12. Re: [PATCH 1/1] package/boost: add patch to fix   libquadmath
>       issue (Peter Korsgaard)
>   13. Re: [PATCH v2] tpm-tools: fix build failures caused by
>       -Werror (Peter Korsgaard)
>   14. [git commit] Makefile: drop ldconfig handling (Peter Korsgaard)
>   15. [git commit] support/download: generate reproducible Hg
>       archives (Peter Korsgaard)
>   16. [git commit] python-urllib3: new package (Peter Korsgaard)
>   17. [git commit] tpm-tools: fix build failures caused by      -Werror
>       (Peter Korsgaard)
>   18. [git commit] package/boost: add patch to fix      libquadmath
>       issue (Peter Korsgaard)
>   19. [git commit] support/download: generate reproducible      Bazaar
>       archives (Peter Korsgaard)
>   20. [git commit] package/tremor: select libogg package
>       (Peter Korsgaard)
>   21. Re: [PATCH] pkg-generic: improve incorrectly used package
>       detection (Peter Korsgaard)
>   22. [git commit] pkg-generic: improve incorrectly used        package
>       detection (Peter Korsgaard)
>   23. Re: [PATCH] Add download helper for PyPi (Peter Korsgaard)
>   24. Re: [PATCH 1/1] Add ARM11 MPCore CPU target support
>       (Peter Korsgaard)
>   25. Re: [PATCH 1/1] added option to enable or disable reboot on
>       ctrl-alt-del (Yann E. MORIN)
>   26. [git commit] Add ARM11 MPCore CPU target support (Peter Korsgaard)
>   27. [PATCH 1/1] disable reboot by ctrl-alt-del (lothar felten)
>   28. Re: [PATCH 1/1] disable reboot by ctrl-alt-del (Yann E. MORIN)
>   29. Re: [PATCH 1/1] disable reboot by ctrl-alt-del (Peter Korsgaard)
>   30. Re: [PATCH] python-can: bump to 1.4.1 (Arnout Vandecappelle)
>   31. [git commit] inittab: disable reboot by ctrl-alt-del
>       (Peter Korsgaard)
>   32. [PATCH 1/6] package/mesa3d: reorder select/depends (Romain Naour)
>   33. [PATCH 2/6] package/mesa3d: select packages required by
>       dri3proto support dependencies (Romain Naour)
>   34. [PATCH 3/6] package/x11r7/xserver_xorg-server: reorder
>       select/depends (Romain Naour)
>   35. [PATCH 5/6] package/x11r7/xserver_xorg-server: move
>       libpciaccess selection (Romain Naour)
>   36. [PATCH 4/6] package/x11r7/xserver_xorg-server: select
>       xlib_libxshmfence required by dri3proto support dependencies
>       (Romain Naour)
>   37. [PATCH 6/6] package/x11r7/xapp_xbacklight: select xcb-util
>       package. (Romain Naour)
>   38. [PATCH v2] linux: Build and install kernel selftests (Cyril Bur)
>   39. [autobuild.buildroot.net] Build results for 2016-01-03
>       (Thomas Petazzoni)
>   40. Re: [PATCH] python-can: bump to 1.4.1 (Yegor Yefremov)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Sun, 3 Jan 2016 15:07:08 +0100
> From: Andreas Ehmanns <universeii@gmx.de>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] openldap: add support to build
>         the     server
> Message-ID: <56892B0C.2020901@gmx.de>
> Content-Type: text/plain; charset=windows-1252; format=flowed
>
> Thomas,
> thanks for your detailed answer. Actually I'm on holiday but will be
> back on 11th of January.
> Then I will have a look at all your comments, fix the issues and prepare
> a new patch.
>
> Regards,
> Andreas
>
>
> Am 29.12.2015 um 12:19 schrieb Thomas Petazzoni:
> > Andreas,
> >
> > Thanks for this patch. I tried it, but there are a number of remaining
> > issues to be resolved I believe.
> >
> > First, if you disable BR2_PACKAGE_OPENLDAP_CLIENTS,
> > the /etc/openldap/slapd.conf file gets removed in a post installation
> > hook, so slapd cannot start.
> >
> > If you fix this, then the path to the pidfile (and argsfile) in
> > slapd.conf are wrong, because they point to /var/run/, to which the
> > ldap user has not write access.
> >
> > If you fix this again, when you start slapd, it complains:
> >
> > bdb_db_open: warning - no DB_CONFIG file found in
> > directory /var/openldap-data: (2). Expect poor performance for suffix
> > "dc=my-domain,dc=com".
> >
> > It should probably be fixed by using DB_CONFIG.example as DB_CONFIG
> > in /var/openldap-data/.
> >
> > Some more comments below.
> >
> > On Thu, 17 Dec 2015 21:41:19 +0100, Andreas Ehmanns wrote:
> >
> >> +case "$1" in
> >> +    start)
> >> +        if [ ! -d /var/run/openldap ]; then
> >> +            install -d -o ldap -g ldap -m 755 /var/run/openldap
> >> +        fi
> >> +
> >> +        if [ ! -d /var/openldap-data ]; then
> >> +            install -d -o ldap -g ldap -m 755 /var/openldap-data
> > This directory should be 700 according to the slapd documentation:
> >
> > ==
> > # The database directory MUST exist prior to running slapd AND
> > # should only be accessible by the slapd and slap tools.
> > # Mode 700 recommended.
> > directory       %LOCALSTATEDIR%/openldap-data
> > ==
> >
> >> +        else
> >> +            chown -R ldap:ldap /var/openldap-data
> >> +        fi
> > It is not clear why you need this. /var is a persistent directory, so I
> > believe all you need here is an unconditional:
> >
> >       chown -R ldap:ldap /var/openldap-data
> >
> > Setting the permission to 700 can be done by a OPENLDAP_PERMISSIONS
> > variable in the .mk file. Ideally, we would also be able to define the
> > user/group, but we currently can't do this by referencing symbolic
> > user/groups, only by explicit UID/GID, and we don't know the UID/GID
> > that will be allocated to the ldap user/group. So I think we should:
> >
> >   1/ Set the permission in OPENLDAP_PERMISSIONS
> >   2/ Set the owner/group in the S75slapd script
> >
> >> +
> >> +        printf "Starting $DESC: $NAME: "
> >> +        start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
> > You can add:
> >
> >       -p /var/run/slapd/slapd.pid
> >
> > Why do you pass -n ? And why do you use -a instead of -x ?
> >
> > See S50dropbear in the Buildroot sources for a good example of an init
> > script.
> >
> >> +        echo "done."
> >> +        ;;
> >> +    stop)
> >> +        printf "Stopping $DESC: $NAME: "
> >> +        start-stop-daemon -K -n $NAME
> > Same here.
> >
> > Also add the "-q" option
> >
> >> +        echo "done."
> >> +        ;;
> >> +    restart)
> >> +        printf "Restarting $DESC: $NAME: "
> >> +        $0 stop
> >> +        $0 start
> >> +        echo "done."
> >> +        ;;
> >> +    reload)
> >> +        printf "Reloading $DESC: $NAME: "
> >> +        killall -HUP $(basename ${DAEMON})
> > I think it's better to use the pid file here, no?
> >
> >          kill -HUP $(cat /var/run/slapd/slapd.pid)
> >
> >> +        echo "done."
> >> +        ;;
> >> +    *)
> >> +        echo "Usage: $0 {start|stop|restart|reload}"
> >> +        exit 1
> >> +        ;;
> >> +esac
> >> +
> >> +exit 0
> >> +
> >> +
> >> diff --git a/package/openldap/openldap.mk b/package/openldap/
> openldap.mk
> >> index 17bf991..bcb285a 100644
> >> --- a/package/openldap/openldap.mk
> >> +++ b/package/openldap/openldap.mk
> >> @@ -12,6 +12,17 @@ OPENLDAP_LICENSE_FILES = LICENSE
> >>   OPENLDAP_INSTALL_STAGING = YES
> >>   OPENLDAP_DEPENDENCIES = host-pkgconf
> >>
> >> +ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
> >> +define OPENLDAP_USERS
> >> +        ldap -1 ldap -1 * /var/run/openldap - - OpenLDAP server user
> >> +endef
> >> +
> >> +define OPENLDAP_COPY_INITSCRIPT
> >> +        $(INSTALL) -D -m 755 $(@D)/S75slapd
> $(TARGET_DIR)/etc/init.d/S75slapd
> > $(@D)/S75slapd does not exist. So this means you never rebuilt your
> > package :-)
> >
> > $(@D) is the source directory of openldap. You want to replace this
> > with: $(OPENLDAP_PKGDIR)/S75slapd
> >
> >> +endef
> >> +OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_COPY_INITSCRIPT
> > Shouldn't be a post install target hook. Instead, do this:
> >
> > define OPENLDAP_INIT_SYSV
> >       $(INSTALL) -D -m 755 $(OPENLDAP_PKGDIR)/S75slapd
> $(TARGET_DIR)/etc/init.d/S75slapd
> > endef
> >
> > and it will automatically install the init script of the chosen init
> > system is sysV compatible.
> >
> >> +endif
> >> +
> >>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >>   OPENLDAP_TLS = openssl
> >>   OPENLDAP_DEPENDENCIES += openssl
> >> @@ -44,7 +55,6 @@ OPENLDAP_CONF_ENV += ac_cv_func_memcmp_working=yes
> >>   OPENLDAP_CONF_OPTS += \
> >>      --enable-syslog \
> >>      --disable-proctitle \
> >> -    --disable-slapd \
> >>      --with-yielding-select \
> >>      --sysconfdir=/etc \
> >>      --enable-dynamic=$(if $(BR2_STATIC_LIBS),no,yes) \
> >> @@ -52,6 +62,11 @@ OPENLDAP_CONF_OPTS += \
> >>      --with-mp=$(OPENLDAP_MP) \
> >>      CPPFLAGS="$(TARGET_CPPFLAGS) $(OPENLDAP_CPPFLAGS)"
> >>
> >> +ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),)
> >> +OPENLDAP_CONF_OPTS += \
> >> +        --disable-slapd
> >> +endif
> > Please do:
> >
> > ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
> > OPENLDAP_CONF_OPTS += --enable-slapd
> > else
> > OPENLDAP_CONF_OPTS += --disable-slapd
> > endif
> >
> > Which is a bit more explicit.
> >
> > Could you rework your patch to solve those different issues, and send
> > an updated version?
> >
> > Thanks!
> >
> > Thomas
>
>
>
> ------------------------------
>
> Message: 2
> Date: Sun,  3 Jan 2016 21:06:46 +0100
> From: Yegor Yefremov <yegorslists@googlemail.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [PATCH] python-urllib3: new package
> Message-ID:
>         <1451851606-4207-1-git-send-email-yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-urllib3/Config.in           |  9 +++++++++
>  package/python-urllib3/python-urllib3.hash |  3 +++
>  package/python-urllib3/python-urllib3.mk   | 14 ++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-urllib3/Config.in
>  create mode 100644 package/python-urllib3/python-urllib3.hash
>  create mode 100644 package/python-urllib3/python-urllib3.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f58f2be..442021f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -701,6 +701,7 @@ menu "External python modules"
>         source "package/python-thrift/Config.in"
>         source "package/python-tornado/Config.in"
>         source "package/python-twisted/Config.in"
> +       source "package/python-urllib3/Config.in"
>         source "package/python-urwid/Config.in"
>         source "package/python-versiontools/Config.in"
>         source "package/python-web2py/Config.in"
> diff --git a/package/python-urllib3/Config.in
> b/package/python-urllib3/Config.in
> new file mode 100644
> index 0000000..21d3f67
> --- /dev/null
> +++ b/package/python-urllib3/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_PYTHON_URLLIB3
> +       bool "python-urllib3"
> +       select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
> +       help
> +         Python HTTP library with thread-safe connection pooling, file
> +         post support, sanity friendly, and more.
> +
> +         http://urllib3.readthedocs.org/
> diff --git a/package/python-urllib3/python-urllib3.hash
> b/package/python-urllib3/python-urllib3.hash
> new file mode 100644
> index 0000000..266b8e9
> --- /dev/null
> +++ b/package/python-urllib3/python-urllib3.hash
> @@ -0,0 +1,3 @@
> +# md5 from
> https://pypi.python.org/pypi?:action=show_md5&digest=5e1407428ac33b521c71a7ac273b3847,
> sha256 locally computed
> +md5     5e1407428ac33b521c71a7ac273b3847  urllib3-1.14.tar.gz
> +sha256  dd4fb13a4ce50b18338c7e4d665b21fd38632c5d4b1d9f1a1379276bd3c08d37
> urllib3-1.14.tar.gz
> diff --git a/package/python-urllib3/python-urllib3.mk
> b/package/python-urllib3/python-urllib3.mk
> new file mode 100644
> index 0000000..0101053
> --- /dev/null
> +++ b/package/python-urllib3/python-urllib3.mk
> @@ -0,0 +1,14 @@
>
> +################################################################################
> +#
> +# python-urllib3
> +#
>
> +################################################################################
> +
> +PYTHON_URLLIB3_VERSION = 1.14
> +PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
> +PYTHON_URLLIB3_SITE = https://pypi.python.org/packages/source/u/urllib3
> +PYTHON_URLLIB3_LICENSE
> <https://pypi.python.org/packages/source/u/urllib3+PYTHON_URLLIB3_LICENSE>
> = MIT
> +PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
> +PYTHON_URLLIB3_SETUP_TYPE = setuptools
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
>
>
> ------------------------------
>
> Message: 3
> Date: Sun, 03 Jan 2016 21:47:08 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Buildroot List <buildroot@uclibc.org>, "Yann E. MORIN"
>         <yann.morin.1998@free.fr>
> Subject: Re: [Buildroot] [PATCH v3] Makefile: drop ldconfig handling
> Message-ID: <87k2nqo0fn.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  > The ldconfig handling in the main Makefile is utterly broken, as it
>  > calls the build machine ldconfig to generate the ld.so.cache of the
>  > target. Unfortunately, the format of the ld.so.cache is architecture
>  > specific, and therefore the build machine ldconfig cannot be used
>  > as-is.
>
>  > This patch therefore simply drops using ldconfig entirely, and removes
>  > /etc/ld.so.conf.d/ from the target skeleton. The idea is that all
>  > libraries that should be loaded by the dynamic linker must be
>  > installed in paths where the dynamic linker searches them by default
>  > (typically /lib or /usr/lib).
>
>  > This might potentially break a few packages, but the only way to know
>  > is to actually stop handling ldconfig.
>
>  > In order to be notified of such cases, we add a check in
>  > target-finalize to verify that there is no /etc/ld.so.conf file as
>  > well as no /etc/ld.so.conf.d directory.
>
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 4
> Date: Sun, 03 Jan 2016 21:50:02 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] python-can: bump to 1.4.1
> Message-ID: <87fuyeo0at.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> writes:
>
>  > Yann, all,
>  > On Fri, 1 Jan 2016 23:28:35 +0100, Yann E. MORIN wrote:
>
>  >> I think we want to use upstream locations as much as possible, and only
>  >> fallback to alternative locations when there is no upstream, or
> upstream
>  >> is flaky.
>
>  > For Python packages, I actually find it quite practical when PyPi is
>  > used. Indeed, instead of having dozens of weird upstream locations and
>  > release behavior, you have one consistent way of fetching Python
>  > modules. It also makes it easier when reviewing new packages, when
>  > looking at package bumps, since you know what to expect from PyPi.
>
>  > So I wouldn't be as strict as you said in terms of not using PyPi.
>
> I agree. I also find it "nice" to use pypi if we can (E.G. if we are
> using a release).
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 5
> Date: Sun, 03 Jan 2016 21:50:46 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] support/download: generate
>         reproducible Hg archives
> Message-ID: <87bn92o09l.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > When hg directly creates the output file, the hash for that file changes
>  > everytime.
>
>  > However, if we just tell hg to output the archive on stdout and we do
>  > the redirect to the file, then the archive is reproducible.
>
>  > (The reason is that in the first case, a temporary file is created and
>  > then compressed, and gzip is adding the filename and its timestamp in
>  > the gzip header, while in the second case, there is no temporary file,
>  > and thus no timestamp and thus it is reproducible.)
>
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Yegor Yefremov <yegorslists@googlemail.com>
>
>  > ---
>  > Note: Yegor, you'll now be able to use the 'hg' method to download
>  > reproducible archives! Hehe! ;-)
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 6
> Date: Sun, 03 Jan 2016 21:51:20 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Romain Naour <romain.naour@gmail.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/tremor: select libogg package
> Message-ID: <877fjqo08n.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
>
>  > tremor depends on libogg package but doesn't select it
>  > in Config.in. so libogg build is trigged at Makefile level.
>
>  > Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
>  > stop if a package build is trigged at Makefile level without
>  > being selected at Config.in level.
>
>  > Fixes:
>  >
> http://autobuild.buildroot.net/results/0da/0da3265f0f1e499f5d34ed32b0d13a2eda53f976
>
>  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 7
> Date: Sun, 03 Jan 2016 21:51:56 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] support/download: generate
>         reproducible    Bazaar archives
> Message-ID: <8737ueo07n.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
>  > Similarly to what has previously been done for the Hg download backend,
>  > instruct bzr to generate the archive on stdout, so that we can generate
>  > reproducible archives.
>
>  > When instructing bzr to generate the output file by itself, it uses a
>  > temporary file that is then fed to gzip, which in turn stores the
>  > timestamp of that file in the generated archive, whereas when the output
>  > is generated on stdout, there is no timestamp, so the archive is then
>  > reproducible.
>
>  > Bizarely enough, we can tell 'bazaar' not to generate a bazaar in the
>  > archive. Cool, uh? ;-]
>
> :P
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 8
> Date: Sun, 03 Jan 2016 21:56:18 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: lothar felten <felten@vaxnet.de>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] added option to enable or disable
>         reboot on ctrl-alt-del
> Message-ID: <87y4c6mlfx.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "lothar" == lothar felten <felten@vaxnet.de> writes:
>
>  > From: felten <felten@vaxnet.de>
>  > Signed-off-by: lothar felten <felten@vaxnet.de>
>
> I'm not sure this is something that needs to be tweaked often enough
> (E.G. most systems don't have a keyboard connected), so I'm not sure we
> want the clutter the system menu with the option.
>
> Perhaps we should simply remove the ctrlaltdel handling of our inittabs,
> as most people probably don't want it - And then just let the (few?)
> people wanting it add it through an overlay / post-build script.
>
> Comments anyony?
>
> > ---
>  >  package/skeleton/skeleton.mk | 12 ++++++++++++
>  >  system/Config.in             | 10 ++++++++++
>  >  2 files changed, 22 insertions(+)
>
>  > diff --git a/package/skeleton/skeleton.mk b/package/skeleton/
> skeleton.mk
>  > index d640e24..7c9d8ed 100644
>  > --- a/package/skeleton/skeleton.mk
>  > +++ b/package/skeleton/skeleton.mk
>  > @@ -230,6 +230,18 @@ define SKELETON_SYSTEM_REMOUNT_RW
>  >  endef
>  >  endif
>  >  TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_REMOUNT_RW
>  > +ifeq ($(BR2_TARGET_GENERIC_ENABLE_CTRL_ALT_DEL),y)
>  > +# Find commented line, if any, and remove leading '#'s
>  > +define SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  > +    $(SED) '/^#.*ctrlaltdel.*$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
>  > +endef
>  > +else
>  > +# Find uncommented line, if any, and add a leading '#'
>  > +define SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  > +    $(SED) '/^[^#].*ctrlaltdel.*$$/s~^~#~' $(TARGET_DIR)/etc/inittab
>  > +endef
>  > +endif
>  > +TARGET_FINALIZE_HOOKS += SKELETON_SYSTEM_ENABLE_CTRL_ALT_DEL
>  >  endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
>
>  >  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  > diff --git a/system/Config.in b/system/Config.in
>  > index 2e14971..e3ff125 100644
>  > --- a/system/Config.in
>  > +++ b/system/Config.in
>  > @@ -347,6 +347,16 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  >        read-only.
>  >        If unsure, say Y.
>
>  > +config BR2_TARGET_GENERIC_ENABLE_CTRL_ALT_DEL
>  > +    bool "enable system reboot on ctrl-alt-del"
>  > +    default y
>  > +    help
>  > +      By default, pressing ctrl-alt-del will reboot the system by
> invoking
>  > +      the reboot command.
>  > +      Say no here if you would rather like your system to ignore the
>  > +      ctrl-alt-del combination.
>  > +      If unsure, say y.
>  > +
>  >  endif # BR2_ROOTFS_SKELETON_DEFAULT
>
>
>  > --
>  > 1.9.1
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 9
> Date: Sun, 03 Jan 2016 21:57:52 +0100
> From: Peter Korsgaard <peter@korsgaard.com>
> To: Yegor Yefremov <yegorslists@googlemail.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] python-urllib3: new package
> Message-ID: <87twmumldb.fsf@dell.be.48ers.dk>
> Content-Type: text/plain
>
> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
>
>  > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Committed, thanks.
>
> --
> Bye, Peter Korsgaard
>
>
> ------------------------------
>
> Message: 10
> Date: Sun,  3 Jan 2016 16:01:25 -0500
> From: Chris LaRocque <clarocq@gmail.com>
> To: buildroot at buildroot.org
> Subject: [Buildroot] [PATCH 2/2] Update the Beaglbone configuration:
> Message-ID: <1451854885-12011-2-git-send-email-clarocq@gmail.com>
>
> Patched the bb.org_defconfig to enable the beaglebone console on ttyS0
> De-Selected the am33xx_cm3 firmware installation: the M3 control is
> handled differently in ver 4.1
> Selected the uio-PRUSS driver to be installed.
> Fixed the kernel patch path and file names.
>
> Signed-off-by: Chris LaRocque <clarocq@gmail.com>
> ---
>  .../linux-4.1.13-ti-r36-am335x-boneblack_01.patch  | 128
> +++++++++++++++++++++
>  configs/beaglebone_defconfig                       |   8 +-
>  2 files changed, 134 insertions(+), 2 deletions(-)
>  create mode 100644
> board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
>
> diff --git
> a/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> b/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> new file mode 100644
> index 0000000..76075d7
> --- /dev/null
> +++
> b/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> @@ -0,0 +1,128 @@
> +--- a/arch/arm/configs/bb.org_defconfig        2016-01-02
> 09:21:52.569371375 -0500
> ++++ b/arch/arm/configs/bb.org_defconfig        2016-01-02
> 09:26:48.072415069 -0500
> +@@ -37,10 +37,8 @@
> + CONFIG_HAVE_KERNEL_XZ=y
> + CONFIG_HAVE_KERNEL_LZO=y
> + CONFIG_HAVE_KERNEL_LZ4=y
> +-# CONFIG_KERNEL_GZIP is not set
> + # CONFIG_KERNEL_LZMA is not set
> +-# CONFIG_KERNEL_XZ is not set
> +-CONFIG_KERNEL_LZO=y
> ++# CONFIG_KERNEL_LZO is not set
> + # CONFIG_KERNEL_LZ4 is not set
> + CONFIG_DEFAULT_HOSTNAME="(none)"
> + CONFIG_SWAP=y
> +@@ -544,7 +542,6 @@
> + CONFIG_HZ=100
> + CONFIG_SCHED_HRTICK=y
> + # CONFIG_THUMB2_KERNEL is not set
> +-CONFIG_AEABI=y
> + # CONFIG_OABI_COMPAT is not set
> + CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
> + # CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> +@@ -596,7 +593,7 @@
> + #
> + CONFIG_USE_OF=y
> + CONFIG_ATAGS=y
> +-# CONFIG_DEPRECATED_PARAM_STRUCT is not set
> ++CONFIG_DEPRECATED_PARAM_STRUCT=y
> + CONFIG_ZBOOT_ROM_TEXT=0x0
> + CONFIG_ZBOOT_ROM_BSS=0x0
> + # CONFIG_ARM_APPENDED_DTB is not set
> +@@ -804,7 +801,7 @@
> + CONFIG_NETLABEL=y
> + CONFIG_NETWORK_SECMARK=y
> + CONFIG_NET_PTP_CLASSIFY=y
> +-# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> ++CONFIG_NETWORK_PHY_TIMESTAMPING=y
> + CONFIG_NETFILTER=y
> + # CONFIG_NETFILTER_DEBUG is not set
> + CONFIG_NETFILTER_ADVANCED=y
> +@@ -1467,8 +1464,6 @@
> + #
> + CONFIG_UEVENT_HELPER=y
> + CONFIG_UEVENT_HELPER_PATH=""
> +-CONFIG_DEVTMPFS=y
> +-CONFIG_DEVTMPFS_MOUNT=y
> + CONFIG_STANDALONE=y
> + CONFIG_PREVENT_FIRMWARE_BUILD=y
> + CONFIG_FW_LOADER=y
> +@@ -1716,7 +1711,7 @@
> + CONFIG_SRAM=y
> + CONFIG_VEXPRESS_SYSCFG=y
> + CONFIG_BONE_CAPEMGR=y
> +-# CONFIG_DEV_OVERLAYMGR is not set
> ++CONFIG_DEV_OVERLAYMGR=y
> + CONFIG_TIEQEP=m
> + CONFIG_C2PORT=m
> +
> +@@ -2214,8 +2209,9 @@
> + # CONFIG_DP83867_PHY is not set
> + # CONFIG_FIXED_PHY is not set
> + # CONFIG_MDIO_BITBANG is not set
> ++CONFIG_MDIO_BUS_MUX=y
> + # CONFIG_MDIO_BUS_MUX_GPIO is not set
> +-# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
> ++CONFIG_MDIO_BUS_MUX_MMIOREG=y
> + # CONFIG_MDIO_BCM_UNIMAC is not set
> + # CONFIG_MICREL_KS8995MA is not set
> + # CONFIG_PLIP is not set
> +@@ -2716,7 +2712,8 @@
> + CONFIG_CONSOLE_POLL=y
> + # CONFIG_SERIAL_JSM is not set
> + CONFIG_SERIAL_OF_PLATFORM=y
> +-# CONFIG_SERIAL_OMAP is not set
> ++CONFIG_SERIAL_OMAP=y
> ++CONFIG_SERIAL_OMAP_CONSOLE=y
> + # CONFIG_SERIAL_SCCNXP is not set
> + # CONFIG_SERIAL_SC16IS7XX is not set
> + # CONFIG_SERIAL_BCM63XX is not set
> +@@ -2897,10 +2894,7 @@
> + # PTP clock support
> + #
> + CONFIG_PTP_1588_CLOCK=y
> +-
> +-#
> +-# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional
> clocks.
> +-#
> ++# CONFIG_DP83640_PHY is not set
> + CONFIG_PINCTRL=y
> +
> + #
> +@@ -5128,7 +5122,7 @@
> + CONFIG_ASYNC_TX_DMA=y
> + # CONFIG_DMATEST is not set
> + # CONFIG_AUXDISPLAY is not set
> +-CONFIG_UIO=m
> ++CONFIG_UIO=y
> + # CONFIG_UIO_CIF is not set
> + CONFIG_UIO_PDRV_GENIRQ=m
> + CONFIG_UIO_DMEM_GENIRQ=m
> +@@ -5136,7 +5130,7 @@
> + # CONFIG_UIO_SERCOS3 is not set
> + # CONFIG_UIO_PCI_GENERIC is not set
> + # CONFIG_UIO_NETX is not set
> +-# CONFIG_UIO_PRUSS is not set
> ++CONFIG_UIO_PRUSS=m
> + # CONFIG_UIO_MF624 is not set
> + # CONFIG_VFIO is not set
> + CONFIG_VIRT_DRIVERS=y
> +@@ -5680,7 +5674,8 @@
> + # File systems
> + #
> + CONFIG_DCACHE_WORD_ACCESS=y
> +-# CONFIG_EXT2_FS is not set
> ++CONFIG_EXT2_FS=y
> ++# CONFIG_EXT2_FS_XATTR is not set
> + # CONFIG_EXT3_FS is not set
> + CONFIG_EXT4_FS=y
> + CONFIG_EXT4_USE_FOR_EXT23=y
> +@@ -6478,3 +6473,8 @@
> + CONFIG_FONT_8x16=y
> + CONFIG_ARCH_HAS_SG_CHAIN=y
> + CONFIG_VIRTUALIZATION=y
> ++CONFIG_KERNEL_GZIP=y
> ++# CONFIG_KERNEL_XZ is not set
> ++CONFIG_AEABI=y
> ++CONFIG_DEVTMPFS=y
> ++CONFIG_DEVTMPFS_MOUNT=y
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index dea34d9..da4f0a2 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -27,7 +27,7 @@ BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/measbone/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
>
>  # filesystem
>  BR2_PACKAGE_AM33X_CM3=y
> @@ -56,10 +56,14 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="
> https://github.com/beagleboard/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.1.13-ti-r36"
> -BR2_LINUX_KERNEL_PATCH="board/measbone/patches/linux/"
>
> +BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/board/beaglebone/patches/linux-4.1.13-ti-r36"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/output/build/linux-4.1.13-ti-r36/arch/arm/configs/bb.org_defconfig"
>  BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_USE_INTREE_DTS=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
> +
> +# Firmware
> +# BR2_PACKAGE_AM33X_CM3 is not set
> +BR2_PACKAGE_AM335X_PRU_PACKAGE=y
> --
> 1.8.1.4
>
>
>
> ------------------------------
>
> Message: 11
> Date: Sun,  3 Jan 2016 16:01:24 -0500
> From: Chris LaRocque <clarocq@gmail.com>
> To: buildroot at buildroot.org
> Cc: Chris LaRocque <clarocq@L-Desktop.blhome.net>
> Subject: [Buildroot] [PATCH 1/2] Updated the Beaglebone configuration:
> Message-ID: <1451854885-12011-1-git-send-email-clarocq@gmail.com>
>
> From: Chris LaRocque <clarocq@L-Desktop.blhome.net>
>
> Changed to Kernel from Beagleboard.org 4.1.13-ti-r36.
> added uboot 2015.10 patches from
> https://github.com/eewiki/u-boot-patches/blob/master/v2015.10/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
> Changed to the beagloeboard.org patched DTC from
> https://github.com/RobertCNelson/dtc.git bb.org-4.1-dt-overlays5
>
> Signed-off-by: Chris LaRocque <clarocq@gmail.com>
> ---
>  board/beaglebone/linux-3.12.config                 | 251 -------
>  ...cache-flush-management-symbols-when-MULTI.patch |  34 -
>  .../0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch   | 754
> +++++++++++++++++++++
>  board/beaglebone/uEnv.txt                          |  14 +-
>  configs/beaglebone_defconfig                       |  43 +-
>  package/dtc/Config.in                              |   2 +-
>  package/dtc/Config.in.host                         |   2 +-
>  package/dtc/dtc.hash                               |   2 -
>  package/dtc/dtc.mk                                 |   6 +-
>  9 files changed, 804 insertions(+), 304 deletions(-)
>  delete mode 100644 board/beaglebone/linux-3.12.config
>  delete mode 100644
> board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
>  create mode 100644
> board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
>  delete mode 100644 package/dtc/dtc.hash
>
> diff --git a/board/beaglebone/linux-3.12.config
> b/board/beaglebone/linux-3.12.config
> deleted file mode 100644
> index 0be5722..0000000
> --- a/board/beaglebone/linux-3.12.config
> +++ /dev/null
> @@ -1,251 +0,0 @@
> -CONFIG_SYSVIPC=y
> -CONFIG_POSIX_MQUEUE=y
> -CONFIG_NO_HZ=y
> -CONFIG_HIGH_RES_TIMERS=y
> -CONFIG_BSD_PROCESS_ACCT=y
> -CONFIG_IKCONFIG=y
> -CONFIG_IKCONFIG_PROC=y
> -CONFIG_LOG_BUF_SHIFT=16
> -CONFIG_BLK_DEV_INITRD=y
> -CONFIG_EXPERT=y
> -CONFIG_SLAB=y
> -CONFIG_PROFILING=y
> -CONFIG_KPROBES=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_FORCE_LOAD=y
> -CONFIG_MODULE_UNLOAD=y
> -CONFIG_MODULE_FORCE_UNLOAD=y
> -CONFIG_MODVERSIONS=y
> -CONFIG_MODULE_SRCVERSION_ALL=y
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_ARCH_OMAP2PLUS=y
> -CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_OMAP_MUX_DEBUG=y
> -CONFIG_ARCH_OMAP3=y
> -CONFIG_ARCH_OMAP4=y
> -CONFIG_SOC_AM43XX=y
> -# CONFIG_ARCH_OMAP2PLUS_TYPICAL is not set
> -# CONFIG_SOC_TI81XX is not set
> -# CONFIG_MACH_OMAP3_BEAGLE is not set
> -# CONFIG_MACH_DEVKIT8000 is not set
> -# CONFIG_MACH_OMAP_LDP is not set
> -# CONFIG_MACH_OMAP3530_LV_SOM is not set
> -# CONFIG_MACH_OMAP3_TORPEDO is not set
> -# CONFIG_MACH_OVERO is not set
> -# CONFIG_MACH_OMAP3EVM is not set
> -# CONFIG_MACH_OMAP3_PANDORA is not set
> -# CONFIG_MACH_TOUCHBOOK is not set
> -# CONFIG_MACH_OMAP_3430SDP is not set
> -# CONFIG_MACH_NOKIA_RM680 is not set
> -# CONFIG_MACH_NOKIA_RX51 is not set
> -# CONFIG_MACH_OMAP_ZOOM2 is not set
> -# CONFIG_MACH_OMAP_ZOOM3 is not set
> -# CONFIG_MACH_CM_T35 is not set
> -# CONFIG_MACH_CM_T3517 is not set
> -# CONFIG_MACH_IGEP0020 is not set
> -# CONFIG_MACH_IGEP0030 is not set
> -# CONFIG_MACH_SBC3530 is not set
> -# CONFIG_MACH_OMAP_3630SDP is not set
> -CONFIG_ARM_THUMBEE=y
> -CONFIG_HAVE_ARM_ARCH_TIMER=y
> -CONFIG_PREEMPT=y
> -CONFIG_AEABI=y
> -CONFIG_HIGHMEM=y
> -CONFIG_ZBOOT_ROM_TEXT=0x0
> -CONFIG_ZBOOT_ROM_BSS=0x0
> -CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
> -CONFIG_KEXEC=y
> -CONFIG_CPU_FREQ=y
> -CONFIG_CPU_FREQ_STAT_DETAILS=y
> -CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> -CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> -CONFIG_CPU_FREQ_GOV_USERSPACE=y
> -CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> -CONFIG_GENERIC_CPUFREQ_CPU0=y
> -# CONFIG_ARM_OMAP2PLUS_CPUFREQ is not set
> -CONFIG_FPE_NWFPE=y
> -CONFIG_VFP=y
> -CONFIG_NEON=y
> -CONFIG_BINFMT_MISC=y
> -CONFIG_PM_RUNTIME=y
> -CONFIG_PM_DEBUG=y
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_XFRM_USER=y
> -CONFIG_NET_KEY=y
> -CONFIG_NET_KEY_MIGRATE=y
> -CONFIG_INET=y
> -CONFIG_IP_MULTICAST=y
> -CONFIG_IP_PNP=y
> -CONFIG_IP_PNP_DHCP=y
> -CONFIG_IP_PNP_BOOTP=y
> -CONFIG_IP_PNP_RARP=y
> -# CONFIG_INET_LRO is not set
> -# CONFIG_IPV6 is not set
> -# CONFIG_WIRELESS is not set
> -CONFIG_DEVTMPFS=y
> -CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_OMAP_OCP2SCP=y
> -CONFIG_CONNECTOR=y
> -CONFIG_BLK_DEV_LOOP=y
> -CONFIG_BLK_DEV_RAM=y
> -CONFIG_BLK_DEV_RAM_SIZE=16384
> -CONFIG_CROSSBAR=y
> -CONFIG_EEPROM_93CX6=y
> -CONFIG_SCSI=y
> -CONFIG_BLK_DEV_SD=y
> -CONFIG_SCSI_MULTI_LUN=y
> -CONFIG_SCSI_SCAN_ASYNC=y
> -CONFIG_MD=y
> -CONFIG_NETDEVICES=y
> -# CONFIG_NET_VENDOR_ARC is not set
> -# CONFIG_NET_CADENCE is not set
> -# CONFIG_NET_VENDOR_BROADCOM is not set
> -# CONFIG_NET_VENDOR_CIRRUS is not set
> -# CONFIG_NET_VENDOR_FARADAY is not set
> -# CONFIG_NET_VENDOR_INTEL is not set
> -# CONFIG_NET_VENDOR_MARVELL is not set
> -# CONFIG_NET_VENDOR_MICREL is not set
> -# CONFIG_NET_VENDOR_NATSEMI is not set
> -# CONFIG_NET_VENDOR_SEEQ is not set
> -# CONFIG_NET_VENDOR_SMSC is not set
> -# CONFIG_NET_VENDOR_STMICRO is not set
> -CONFIG_TI_CPSW=y
> -CONFIG_TI_CPTS=y
> -# CONFIG_NET_VENDOR_VIA is not set
> -# CONFIG_NET_VENDOR_WIZNET is not set
> -CONFIG_AT803X_PHY=y
> -CONFIG_SMSC_PHY=y
> -# CONFIG_WLAN is not set
> -# CONFIG_INPUT_MOUSEDEV is not set
> -# CONFIG_INPUT_KEYBOARD is not set
> -# CONFIG_INPUT_MOUSE is not set
> -CONFIG_SERIO_LIBPS2=y
> -# CONFIG_LEGACY_PTYS is not set
> -CONFIG_SERIAL_8250=y
> -CONFIG_SERIAL_8250_CONSOLE=y
> -CONFIG_SERIAL_8250_NR_UARTS=32
> -CONFIG_SERIAL_8250_EXTENDED=y
> -CONFIG_SERIAL_8250_MANY_PORTS=y
> -CONFIG_SERIAL_8250_SHARE_IRQ=y
> -CONFIG_SERIAL_8250_DETECT_IRQ=y
> -CONFIG_SERIAL_8250_RSA=y
> -CONFIG_SERIAL_OMAP=y
> -CONFIG_SERIAL_OMAP_CONSOLE=y
> -CONFIG_HW_RANDOM=y
> -CONFIG_I2C=y
> -CONFIG_I2C_CHARDEV=y
> -CONFIG_I2C_OMAP=y
> -CONFIG_SPI=y
> -CONFIG_SPI_OMAP24XX=y
> -CONFIG_SPI_TI_QSPI=y
> -CONFIG_PINCTRL_SINGLE=y
> -CONFIG_DEBUG_GPIO=y
> -CONFIG_GPIO_SYSFS=y
> -CONFIG_W1=y
> -CONFIG_POWER_SUPPLY=y
> -CONFIG_THERMAL=y
> -CONFIG_THERMAL_GOV_FAIR_SHARE=y
> -CONFIG_THERMAL_GOV_USER_SPACE=y
> -CONFIG_CPU_THERMAL=y
> -CONFIG_TI_SOC_THERMAL=y
> -CONFIG_TI_THERMAL=y
> -CONFIG_WATCHDOG=y
> -CONFIG_OMAP_WATCHDOG=y
> -CONFIG_MFD_SYSCON=y
> -CONFIG_MFD_TPS65217=y
> -CONFIG_REGULATOR=y
> -CONFIG_REGULATOR_FIXED_VOLTAGE=y
> -CONFIG_REGULATOR_PBIAS=y
> -CONFIG_REGULATOR_TPS65023=y
> -CONFIG_REGULATOR_TPS6507X=y
> -CONFIG_REGULATOR_TPS65217=y
> -CONFIG_REGULATOR_TIAVSCLASS0=y
> -CONFIG_FB=y
> -CONFIG_FIRMWARE_EDID=y
> -CONFIG_FB_DA8XX=y
> -CONFIG_FB_DA8XX_TDA998X=y
> -CONFIG_OMAP2_DSS=y
> -CONFIG_OMAP2_DSS_SDI=y
> -CONFIG_OMAP2_DSS_DSI=y
> -CONFIG_FB_OMAP2=y
> -CONFIG_DISPLAY_CONNECTOR_HDMI=y
> -CONFIG_FRAMEBUFFER_CONSOLE=y
> -CONFIG_USB=y
> -CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
> -CONFIG_USB_MON=y
> -CONFIG_USB_EHCI_HCD=y
> -CONFIG_USB_MUSB_HDRC=m
> -CONFIG_USB_MUSB_OMAP2PLUS=m
> -CONFIG_USB_MUSB_DSPS=m
> -CONFIG_USB_TI_CPPI41_DMA=y
> -CONFIG_USB_STORAGE=y
> -CONFIG_AM335X_PHY_USB=y
> -CONFIG_USB_GADGET=y
> -CONFIG_USB_GADGET_DEBUG=y
> -CONFIG_USB_GADGET_DEBUG_FS=y
> -CONFIG_USB_ZERO=m
> -CONFIG_USB_ETH=m
> -CONFIG_USB_ETH_EEM=y
> -CONFIG_USB_MASS_STORAGE=m
> -CONFIG_USB_G_MULTI=m
> -CONFIG_USB_G_MULTI_CDC=y
> -CONFIG_MMC=y
> -CONFIG_MMC_UNSAFE_RESUME=y
> -CONFIG_SDIO_UART=y
> -CONFIG_MMC_OMAP=y
> -CONFIG_MMC_OMAP_HS=y
> -CONFIG_NEW_LEDS=y
> -CONFIG_LEDS_CLASS=y
> -CONFIG_LEDS_GPIO=y
> -CONFIG_LEDS_TRIGGERS=y
> -CONFIG_LEDS_TRIGGER_TIMER=y
> -CONFIG_LEDS_TRIGGER_ONESHOT=y
> -CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> -CONFIG_LEDS_TRIGGER_BACKLIGHT=y
> -CONFIG_LEDS_TRIGGER_CPU=y
> -CONFIG_LEDS_TRIGGER_GPIO=y
> -CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
> -CONFIG_RTC_CLASS=y
> -CONFIG_RTC_DRV_OMAP=y
> -CONFIG_DMADEVICES=y
> -CONFIG_TI_EDMA=y
> -CONFIG_DMA_OMAP=y
> -CONFIG_TI_CPPI41=y
> -CONFIG_COMMON_CLK_DEBUG=y
> -CONFIG_OMAP_USB2=y
> -CONFIG_OMAP_PIPE3=y
> -CONFIG_EXT2_FS=y
> -CONFIG_EXT3_FS=y
> -# CONFIG_EXT3_FS_XATTR is not set
> -CONFIG_EXT4_FS=y
> -CONFIG_QUOTA=y
> -CONFIG_QFMT_V2=y
> -CONFIG_MSDOS_FS=y
> -CONFIG_VFAT_FS=y
> -CONFIG_TMPFS=y
> -CONFIG_NFS_FS=y
> -CONFIG_NFS_V4=y
> -CONFIG_ROOT_NFS=y
> -CONFIG_NLS_CODEPAGE_437=y
> -CONFIG_NLS_ISO8859_1=y
> -CONFIG_PRINTK_TIME=y
> -CONFIG_DEBUG_INFO=y
> -CONFIG_MAGIC_SYSRQ=y
> -CONFIG_SCHEDSTATS=y
> -CONFIG_TIMER_STATS=y
> -CONFIG_PROVE_LOCKING=y
> -# CONFIG_DEBUG_BUGVERBOSE is not set
> -CONFIG_CRYPTO_MANAGER=m
> -CONFIG_CRYPTO_SHA256=m
> -CONFIG_CRYPTO_DEFLATE=y
> -CONFIG_CRYPTO_LZO=y
> -# CONFIG_CRYPTO_ANSI_CPRNG is not set
> -# CONFIG_CRYPTO_HW is not set
> -CONFIG_CRC_CCITT=y
> -CONFIG_CRC_T10DIF=y
> -CONFIG_CRC_ITU_T=y
> -CONFIG_CRC7=y
> -CONFIG_LIBCRC32C=y
> -CONFIG_AVERAGE=y
> diff --git
> a/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
> b/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
> deleted file mode 100644
> index 1ca1e70..0000000
> ---
> a/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 29885f2f3d700341d322274db6ad085e601c0994 Mon Sep 17 00:00:00 2001
> -From: Pantelis Antoniou <panto@antoniou-consulting.com>
> -Date: Fri, 4 Jan 2013 00:32:33 +0200
> -Subject: [PATCH 3/3] arm: Export cache flush management symbols when
> - !MULTI_CACHE
> -
> -When compiling a kernel without CONFIG_MULTI_CACHE enabled the
> -dma access functions end up not being exported. Fix it.
> -
> -Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
> ----
> - arch/arm/kernel/setup.c |    9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> -index da1d1aa..dcb678c 100644
> ---- a/arch/arm/kernel/setup.c
> -+++ b/arch/arm/kernel/setup.c
> -@@ -923,3 +923,12 @@ const struct seq_operations cpuinfo_op = {
> -       .stop   = c_stop,
> -       .show   = c_show
> - };
> -+
> -+/* export the cache management functions */
> -+#ifndef MULTI_CACHE
> -+
> -+EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));
> -+EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));
> -+EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));
> -+
> -+#endif
> ---
> -1.7.10.4
> -
> diff --git
> a/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
> b/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
> new file mode 100644
> index 0000000..eb2400d
> --- /dev/null
> +++
> b/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
> @@ -0,0 +1,754 @@
> +From ef73464d93f58a2e6cb36059e7901741ea7828ef Mon Sep 17 00:00:00 2001
> +From: Robert Nelson <robertcnelson@gmail.com>
> +Date: Fri, 6 Nov 2015 14:04:43 -0600
> +Subject: [PATCH] am335x_evm: uEnv.txt, bootz, n fixes
> +
> +Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
> +---
> + arch/arm/cpu/armv7/am33xx/board.c |  36 ++++--
> + arch/arm/include/asm/omap_gpio.h  |   7 +-
> + board/ti/am335x/board.c           |  29 ++++-
> + board/ti/am335x/mux.c             |   2 -
> + common/image.c                    |   9 --
> + configs/am335x_evm_defconfig      |   1 -
> + drivers/gpio/omap_gpio.c          | 107 ++++++++--------
> + include/configs/am335x_evm.h      |  58 ++++++---
> + include/configs/ti_armv7_common.h | 249
> +++++++++++++++++++++++++++++++++++++-
> + 9 files changed, 395 insertions(+), 103 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/am33xx/board.c
> b/arch/arm/cpu/armv7/am33xx/board.c
> +index bd14326..5b1eb18 100644
> +--- a/arch/arm/cpu/armv7/am33xx/board.c
> ++++ b/arch/arm/cpu/armv7/am33xx/board.c
> +@@ -70,16 +70,38 @@ U_BOOT_DEVICES(am33xx_uarts) = {
> + };
> + #endif
> +
> ++#ifdef CONFIG_DM_GPIO
> ++static const struct omap_gpio_platdata am33xx_gpio[] = {
> ++      { 0, AM33XX_GPIO0_BASE, METHOD_GPIO_24XX },
> ++      { 1, AM33XX_GPIO1_BASE, METHOD_GPIO_24XX },
> ++      { 2, AM33XX_GPIO2_BASE, METHOD_GPIO_24XX },
> ++      { 3, AM33XX_GPIO3_BASE, METHOD_GPIO_24XX },
> ++#ifdef CONFIG_AM43XX
> ++      { 4, AM33XX_GPIO4_BASE, METHOD_GPIO_24XX },
> ++      { 5, AM33XX_GPIO5_BASE, METHOD_GPIO_24XX },
> ++#endif
> ++};
> ++
> ++U_BOOT_DEVICES(am33xx_gpios) = {
> ++      { "gpio_omap", &am33xx_gpio[0] },
> ++      { "gpio_omap", &am33xx_gpio[1] },
> ++      { "gpio_omap", &am33xx_gpio[2] },
> ++      { "gpio_omap", &am33xx_gpio[3] },
> ++#ifdef CONFIG_AM43XX
> ++      { "gpio_omap", &am33xx_gpio[4] },
> ++      { "gpio_omap", &am33xx_gpio[5] },
> ++#endif
> ++};
> +
> +-#ifndef CONFIG_DM_GPIO
> ++#else
> + static const struct gpio_bank gpio_bank_am33xx[] = {
> +-      { (void *)AM33XX_GPIO0_BASE },
> +-      { (void *)AM33XX_GPIO1_BASE },
> +-      { (void *)AM33XX_GPIO2_BASE },
> +-      { (void *)AM33XX_GPIO3_BASE },
> ++      { (void *)AM33XX_GPIO0_BASE, METHOD_GPIO_24XX },
> ++      { (void *)AM33XX_GPIO1_BASE, METHOD_GPIO_24XX },
> ++      { (void *)AM33XX_GPIO2_BASE, METHOD_GPIO_24XX },
> ++      { (void *)AM33XX_GPIO3_BASE, METHOD_GPIO_24XX },
> + #ifdef CONFIG_AM43XX
> +-      { (void *)AM33XX_GPIO4_BASE },
> +-      { (void *)AM33XX_GPIO5_BASE },
> ++      { (void *)AM33XX_GPIO4_BASE, METHOD_GPIO_24XX },
> ++      { (void *)AM33XX_GPIO5_BASE, METHOD_GPIO_24XX },
> + #endif
> + };
> +
> +diff --git a/arch/arm/include/asm/omap_gpio.h
> b/arch/arm/include/asm/omap_gpio.h
> +index ef38b63..839af54 100644
> +--- a/arch/arm/include/asm/omap_gpio.h
> ++++ b/arch/arm/include/asm/omap_gpio.h
> +@@ -23,19 +23,24 @@
> +
> + #include <asm/arch/cpu.h>
> +
> ++enum gpio_method {
> ++      METHOD_GPIO_24XX        = 4,
> ++};
> ++
> + #ifdef CONFIG_DM_GPIO
> +
> + /* Information about a GPIO bank */
> + struct omap_gpio_platdata {
> +       int bank_index;
> +       ulong base;     /* address of registers in physical memory */
> +-      const char *port_name;
> ++      enum gpio_method method;
> + };
> +
> + #else
> +
> + struct gpio_bank {
> +       void *base;
> ++      int method;
> + };
> +
> + extern const struct gpio_bank *const omap_gpio_bank;
> +diff --git a/board/ti/am335x/board.c b/board/ti/am335x/board.c
> +index 1dc2ed0..e6c5ed6 100644
> +--- a/board/ti/am335x/board.c
> ++++ b/board/ti/am335x/board.c
> +@@ -478,6 +478,24 @@ void sdram_init(void)
> +  */
> + int board_init(void)
> + {
> ++      u32 sys_reboot;
> ++
> ++      sys_reboot = readl(PRM_RSTST);
> ++      if (sys_reboot & (1 << 9))
> ++              puts("Reset Source: IcePick reset has occurred.\n");
> ++
> ++      if (sys_reboot & (1 << 5))
> ++              puts("Reset Source: Global external warm reset has
> occurred.\n");
> ++
> ++      if (sys_reboot & (1 << 4))
> ++              puts("Reset Source: watchdog reset has occurred.\n");
> ++
> ++      if (sys_reboot & (1 << 1))
> ++              puts("Reset Source: Global warm SW reset has occurred.\n");
> ++
> ++      if (sys_reboot & (1 << 0))
> ++              puts("Reset Source: Power-on reset has occurred.\n");
> ++
> + #if defined(CONFIG_HW_WATCHDOG)
> +       hw_watchdog_init();
> + #endif
> +@@ -504,9 +522,14 @@ int board_late_init(void)
> +       safe_string[sizeof(header.name)] = 0;
> +       setenv("board_name", safe_string);
> +
> +-      strncpy(safe_string, (char *)header.version,
> sizeof(header.version));
> +-      safe_string[sizeof(header.version)] = 0;
> +-      setenv("board_rev", safe_string);
> ++      /* BeagleBone Green has 0x1a at [0], they are free to increment
> 'a' */
> ++      if ( (header.version[0] != 0x30) && (header.version[0] & (1 << 4))
> ) {
> ++              setenv("board_rev", "BBG1");
> ++      } else {
> ++              strncpy(safe_string, (char *)header.version,
> sizeof(header.version));
> ++              safe_string[sizeof(header.version)] = 0;
> ++              setenv("board_rev", safe_string);
> ++      }
> + #endif
> +
> +       return 0;
> +diff --git a/board/ti/am335x/mux.c b/board/ti/am335x/mux.c
> +index 680f656..fd3da58 100644
> +--- a/board/ti/am335x/mux.c
> ++++ b/board/ti/am335x/mux.c
> +@@ -317,7 +317,6 @@ void enable_board_pin_mux(struct am335x_baseboard_id
> *header)
> +       /* Do board-specific muxes. */
> +       if (board_is_bone(header)) {
> +               /* Beaglebone pinmux */
> +-              configure_module_pin_mux(i2c1_pin_mux);
> +               configure_module_pin_mux(mii1_pin_mux);
> +               configure_module_pin_mux(mmc0_pin_mux);
> + #if defined(CONFIG_NAND)
> +@@ -356,7 +355,6 @@ void enable_board_pin_mux(struct am335x_baseboard_id
> *header)
> +               configure_module_pin_mux(mmc0_pin_mux_sk_evm);
> +       } else if (board_is_bone_lt(header)) {
> +               /* Beaglebone LT pinmux */
> +-              configure_module_pin_mux(i2c1_pin_mux);
> +               configure_module_pin_mux(mii1_pin_mux);
> +               configure_module_pin_mux(mmc0_pin_mux);
> + #if defined(CONFIG_NAND) && defined(CONFIG_EMMC_BOOT)
> +diff --git a/common/image.c b/common/image.c
> +index e607109..c33749d 100644
> +--- a/common/image.c
> ++++ b/common/image.c
> +@@ -908,15 +908,6 @@ int boot_get_ramdisk(int argc, char * const argv[],
> bootm_headers_t *images,
> +       *rd_start = 0;
> +       *rd_end = 0;
> +
> +-#ifdef CONFIG_ANDROID_BOOT_IMAGE
> +-      /*
> +-       * Look for an Android boot image.
> +-       */
> +-      buf = map_sysmem(images->os.start, 0);
> +-      if (genimg_get_format(buf) == IMAGE_FORMAT_ANDROID)
> +-              select = argv[0];
> +-#endif
> +-
> +       if (argc >= 2)
> +               select = argv[1];
> +
> +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
> +index 96599c6..9e8c010 100644
> +--- a/configs/am335x_evm_defconfig
> ++++ b/configs/am335x_evm_defconfig
> +@@ -3,7 +3,6 @@ CONFIG_TARGET_AM335X_EVM=y
> + CONFIG_SPL=y
> + CONFIG_SPL_STACK_R=y
> + CONFIG_SPL_STACK_R_ADDR=0x82000000
> +-CONFIG_SYS_EXTRA_OPTIONS="NAND"
> + # CONFIG_CMD_IMLS is not set
> + # CONFIG_CMD_FLASH is not set
> + # CONFIG_CMD_SETEXPR is not set
> +diff --git a/drivers/gpio/omap_gpio.c b/drivers/gpio/omap_gpio.c
> +index cd960dc..0a1e124 100644
> +--- a/drivers/gpio/omap_gpio.c
> ++++ b/drivers/gpio/omap_gpio.c
> +@@ -20,13 +20,9 @@
> +  */
> + #include <common.h>
> + #include <dm.h>
> +-#include <fdtdec.h>
> + #include <asm/gpio.h>
> + #include <asm/io.h>
> + #include <asm/errno.h>
> +-#include <malloc.h>
> +-
> +-DECLARE_GLOBAL_DATA_PTR;
> +
> + #define OMAP_GPIO_DIR_OUT     0
> + #define OMAP_GPIO_DIR_IN      1
> +@@ -38,6 +34,7 @@ DECLARE_GLOBAL_DATA_PTR;
> + struct gpio_bank {
> +       /* TODO(sjg at chromium.org): Can we use a struct here? */
> +       void *base;     /* address of registers in physical memory */
> ++      enum gpio_method method;
> + };
> +
> + #endif
> +@@ -58,8 +55,13 @@ static void _set_gpio_direction(const struct gpio_bank
> *bank, int gpio,
> +       void *reg = bank->base;
> +       u32 l;
> +
> +-      reg += OMAP_GPIO_OE;
> +-
> ++      switch (bank->method) {
> ++      case METHOD_GPIO_24XX:
> ++              reg += OMAP_GPIO_OE;
> ++              break;
> ++      default:
> ++              return;
> ++      }
> +       l = __raw_readl(reg);
> +       if (is_input)
> +               l |= 1 << gpio;
> +@@ -77,7 +79,13 @@ static int _get_gpio_direction(const struct gpio_bank
> *bank, int gpio)
> +       void *reg = bank->base;
> +       u32 v;
> +
> +-      reg += OMAP_GPIO_OE;
> ++      switch (bank->method) {
> ++      case METHOD_GPIO_24XX:
> ++              reg += OMAP_GPIO_OE;
> ++              break;
> ++      default:
> ++              return -1;
> ++      }
> +
> +       v = __raw_readl(reg);
> +
> +@@ -93,12 +101,19 @@ static void _set_gpio_dataout(const struct gpio_bank
> *bank, int gpio,
> +       void *reg = bank->base;
> +       u32 l = 0;
> +
> +-      if (enable)
> +-              reg += OMAP_GPIO_SETDATAOUT;
> +-      else
> +-              reg += OMAP_GPIO_CLEARDATAOUT;
> +-
> +-      l = 1 << gpio;
> ++      switch (bank->method) {
> ++      case METHOD_GPIO_24XX:
> ++              if (enable)
> ++                      reg += OMAP_GPIO_SETDATAOUT;
> ++              else
> ++                      reg += OMAP_GPIO_CLEARDATAOUT;
> ++              l = 1 << gpio;
> ++              break;
> ++      default:
> ++              printf("omap3-gpio unknown bank method %s %d\n",
> ++                     __FILE__, __LINE__);
> ++              return;
> ++      }
> +       __raw_writel(l, reg);
> + }
> +
> +@@ -107,13 +122,19 @@ static int _get_gpio_value(const struct gpio_bank
> *bank, int gpio)
> +       void *reg = bank->base;
> +       int input;
> +
> +-      input = _get_gpio_direction(bank, gpio);
> +-      switch (input) {
> +-      case OMAP_GPIO_DIR_IN:
> +-              reg += OMAP_GPIO_DATAIN;
> +-              break;
> +-      case OMAP_GPIO_DIR_OUT:
> +-              reg += OMAP_GPIO_DATAOUT;
> ++      switch (bank->method) {
> ++      case METHOD_GPIO_24XX:
> ++              input = _get_gpio_direction(bank, gpio);
> ++              switch (input) {
> ++              case OMAP_GPIO_DIR_IN:
> ++                      reg += OMAP_GPIO_DATAIN;
> ++                      break;
> ++              case OMAP_GPIO_DIR_OUT:
> ++                      reg += OMAP_GPIO_DATAOUT;
> ++                      break;
> ++              default:
> ++                      return -1;
> ++              }
> +               break;
> +       default:
> +               return -1;
> +@@ -289,56 +310,24 @@ static int omap_gpio_probe(struct udevice *dev)
> +       struct gpio_bank *bank = dev_get_priv(dev);
> +       struct omap_gpio_platdata *plat = dev_get_platdata(dev);
> +       struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
> ++      char name[18], *str;
> +
> +-      uc_priv->bank_name = plat->port_name;
> ++      sprintf(name, "GPIO%d_", plat->bank_index);
> ++      str = strdup(name);
> ++      if (!str)
> ++              return -ENOMEM;
> ++      uc_priv->bank_name = str;
> +       uc_priv->gpio_count = GPIO_PER_BANK;
> +       bank->base = (void *)plat->base;
> ++      bank->method = plat->method;
> +
> +       return 0;
> + }
> +
> +-static int omap_gpio_bind(struct udevice *dev)
> +-{
> +-      struct omap_gpio_platdata *plat = dev->platdata;
> +-      fdt_addr_t base_addr;
> +-
> +-      if (plat)
> +-              return 0;
> +-
> +-      base_addr = dev_get_addr(dev);
> +-      if (base_addr == FDT_ADDR_T_NONE)
> +-              return -ENODEV;
> +-
> +-      /*
> +-      * TODO:
> +-      * When every board is converted to driver model and DT is
> +-      * supported, this can be done by auto-alloc feature, but
> +-      * not using calloc to alloc memory for platdata.
> +-      */
> +-      plat = calloc(1, sizeof(*plat));
> +-      if (!plat)
> +-              return -ENOMEM;
> +-
> +-      plat->base = base_addr;
> +-      plat->port_name = fdt_get_name(gd->fdt_blob, dev->of_offset, NULL);
> +-      dev->platdata = plat;
> +-
> +-      return 0;
> +-}
> +-
> +-static const struct udevice_id omap_gpio_ids[] = {
> +-      { .compatible = "ti,omap3-gpio" },
> +-      { .compatible = "ti,omap4-gpio" },
> +-      { .compatible = "ti,am4372-gpio" },
> +-      { }
> +-};
> +-
> + U_BOOT_DRIVER(gpio_omap) = {
> +       .name   = "gpio_omap",
> +       .id     = UCLASS_GPIO,
> +       .ops    = &gpio_omap_ops,
> +-      .of_match = omap_gpio_ids,
> +-      .bind   = omap_gpio_bind,
> +       .probe  = omap_gpio_probe,
> +       .priv_auto_alloc_size = sizeof(struct gpio_bank),
> + };
> +diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
> +index 3cf768e..d3f8a23 100644
> +--- a/include/configs/am335x_evm.h
> ++++ b/include/configs/am335x_evm.h
> +@@ -17,6 +17,7 @@
> + #define __CONFIG_AM335X_EVM_H
> +
> + #include <configs/ti_am335x_common.h>
> ++#define CONFIG_ENV_IS_NOWHERE
> +
> + #ifndef CONFIG_SPL_BUILD
> + #ifndef CONFIG_FIT
> +@@ -93,19 +94,24 @@
> +               "root=${spiroot} " \
> +               "rootfstype=${spirootfstype}\0" \
> +       "bootenv=uEnv.txt\0" \
> +-      "loadbootscript=load mmc ${mmcdev} ${loadaddr} boot.scr\0" \
> +-      "bootscript=echo Running bootscript from mmc${mmcdev} ...; " \
> ++      "script=boot.scr\0" \
> ++      "scriptfile=${script}\0" \
> ++      "loadbootscript=load ${interface} ${bootpart} ${loadaddr}
> ${scriptfile};\0" \
> ++      "bootscript=echo Running bootscript from mmc${bootpart} ...; " \
> +               "source ${loadaddr}\0" \
> +-      "loadbootenv=load mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
> +-      "importbootenv=echo Importing environment from mmc ...; " \
> ++      "loadbootenv=load ${interface} ${bootpart} ${loadaddr}
> ${bootenv}\0" \
> ++      "importbootenv=echo Importing environment from ${interface} ...; "
> \
> +               "env import -t -r $loadaddr $filesize\0" \
> +       "ramargs=setenv bootargs console=${console} " \
> +               "${optargs} " \
> +               "root=${ramroot} " \
> +               "rootfstype=${ramrootfstype}\0" \
> +-      "loadramdisk=load mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
> +-      "loadimage=load mmc ${bootpart} ${loadaddr}
> ${bootdir}/${bootfile}\0" \
> +-      "loadfdt=load mmc ${bootpart} ${fdtaddr} ${bootdir}/${fdtfile}\0" \
> ++      "loadramdisk=load ${interface} ${mmcdev} ${rdaddr} ramdisk.gz\0" \
> ++      "loadimage=load ${interface} ${bootpart} ${loadaddr}
> ${bootdir}/${bootfile}\0" \
> ++      "loadrd=load ${interface} ${bootpart} ${rdaddr}
> ${bootdir}/${rdfile}; setenv rdsize ${filesize}\0" \
> ++      "loadfdt=echo loading ${fdtdir}/${fdtfile} ...; load ${interface}
> ${bootpart} ${fdtaddr} ${fdtdir}/${fdtfile}\0" \
> ++      "failumsboot=echo; echo FAILSAFE: U-Boot UMS (USB Mass Storage)
> enabled, media now available over the usb slave port ...; " \
> ++              "ums 0 ${interface} 1;\0" \
> +       "mmcloados=run args_mmc; " \
> +               "if test ${boot_fdt} = yes || test ${boot_fdt} = try; then
> " \
> +                       "if run loadfdt; then " \
> +@@ -120,8 +126,8 @@
> +               "else " \
> +                       "bootz; " \
> +               "fi;\0" \
> +-      "mmcboot=mmc dev ${mmcdev}; " \
> +-              "if mmc rescan; then " \
> ++      "mmcboot=${interface} dev ${mmcdev}; " \
> ++              "if ${interface} rescan; then " \
> +                       "echo SD/MMC found on device ${mmcdev};" \
> +                       "if run loadbootscript; then " \
> +                               "run bootscript;" \
> +@@ -149,27 +155,44 @@
> +               "bootz ${loadaddr} ${rdaddr} ${fdtaddr}\0" \
> +       "findfdt="\
> +               "if test $board_name = A335BONE; then " \
> +-                      "setenv fdtfile am335x-bone.dtb; fi; " \
> ++                      "setenv fdtfile am335x-bone.dtb; setenv fdtbase
> am335x-bone; fi; " \
> +               "if test $board_name = A335BNLT; then " \
> +-                      "setenv fdtfile am335x-boneblack.dtb; fi; " \
> ++                      "if test $board_rev = BBG1; then " \
> ++                              "setenv fdtfile am335x-bonegreen.dtb;
> setenv fdtbase am335x-bonegreen; " \
> ++                      "elif test $board_rev = AIA0; then " \
> ++                              "setenv fdtfile am335x-abbbi.dtb; setenv
> fdtbase am335x-abbbi; " \
> ++                      "else " \
> ++                              "setenv fdtfile am335x-boneblack.dtb;
> setenv fdtbase am335x-boneblack; " \
> ++                      "fi; " \
> ++              "fi; " \
> +               "if test $board_name = A33515BB; then " \
> +                       "setenv fdtfile am335x-evm.dtb; fi; " \
> +               "if test $board_name = A335X_SK; then " \
> +                       "setenv fdtfile am335x-evmsk.dtb; fi; " \
> +               "if test $fdtfile = undefined; then " \
> +                       "echo WARNING: Could not determine device tree to
> use; fi; \0" \
> ++      EEWIKI_NFS \
> ++      EEWIKI_BOOT \
> ++      EEWIKI_UNAME_BOOT \
> +       NANDARGS \
> +       NETARGS \
> +       DFUARGS
> + #endif
> +
> + #define CONFIG_BOOTCOMMAND \
> ++      "gpio set 53; " \
> +       "run findfdt; " \
> +-      "run mmcboot;" \
> ++      "setenv interface mmc; " \
> ++      "setenv mmcdev 0; " \
> ++      "setenv bootpart 0:1; " \
> ++      "run boot;" \
> ++      "gpio clear 56; " \
> ++      "gpio clear 55; " \
> ++      "gpio clear 54; " \
> +       "setenv mmcdev 1; " \
> +-      "setenv bootpart 1:2; " \
> +-      "run mmcboot;" \
> +-      "run nandboot;"
> ++      "setenv bootpart 1:1; " \
> ++      "run boot;" \
> ++      "run failumsboot;"
> +
> + /* NS16550 Configuration */
> + #define CONFIG_SYS_NS16550_COM1               0x44e09000      /* Base
> EVM has UART0 */
> +@@ -309,9 +332,8 @@
> + #endif
> +
> + #ifdef CONFIG_USB_MUSB_GADGET
> +-#define CONFIG_USB_ETHER
> +-#define CONFIG_USB_ETH_RNDIS
> +-#define CONFIG_USBNET_HOST_ADDR       "de:ad:be:af:00:00"
> ++#define CONFIG_CMD_USB_MASS_STORAGE
> ++#define CONFIG_USB_FUNCTION_MASS_STORAGE
> +
> + /* USB TI's IDs */
> + #define CONFIG_G_DNL_VENDOR_NUM 0x0451
> +diff --git a/include/configs/ti_armv7_common.h
> b/include/configs/ti_armv7_common.h
> +index 6dc6515..8bf975b 100644
> +--- a/include/configs/ti_armv7_common.h
> ++++ b/include/configs/ti_armv7_common.h
> +@@ -61,11 +61,254 @@
> + #define DEFAULT_MMC_TI_ARGS \
> +       "mmcdev=0\0" \
> +       "mmcrootfstype=ext4 rootwait\0" \
> +-      "finduuid=part uuid mmc 0:2 uuid\0" \
> ++      "finduuid=part uuid ${interface} ${bootpart} uuid\0" \
> +       "args_mmc=run finduuid;setenv bootargs console=${console} " \
> +               "${optargs} " \
> +-              "root=PARTUUID=${uuid} rw " \
> +-              "rootfstype=${mmcrootfstype}\0"
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=PARTUUID=${uuid} ro " \
> ++              "rootfstype=${mmcrootfstype} " \
> ++              "${cmdline}\0" \
> ++      "args_mmc_old=setenv bootargs console=${console} " \
> ++              "${optargs} " \
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=${oldroot} ro " \
> ++              "rootfstype=${mmcrootfstype} " \
> ++              "${cmdline}\0" \
> ++      "args_mmc_uuid=setenv bootargs console=${console} " \
> ++              "${optargs} " \
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=UUID=${uuid} ro " \
> ++              "rootfstype=${mmcrootfstype} " \
> ++              "${cmdline}\0" \
> ++      "args_uenv_root=setenv bootargs console=${console} " \
> ++              "${optargs} " \
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=${uenv_root} ro " \
> ++              "rootfstype=${mmcrootfstype} " \
> ++              "${cmdline}\0" \
> ++      "args_netinstall=setenv bootargs ${netinstall_bootargs} " \
> ++              "${optargs} " \
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=/dev/ram rw " \
> ++              "${cmdline}\0"
> ++
> ++#define EEWIKI_NFS \
> ++      "server_ip=192.168.1.100\0" \
> ++      "gw_ip=192.168.1.1\0" \
> ++      "netmask=255.255.255.0\0" \
> ++      "hostname=\0" \
> ++      "device=eth0\0" \
> ++      "autoconf=off\0" \
> ++      "root_dir=/home/userid/targetNFS\0" \
> ++      "tftp_dir=\0" \
> ++      "nfs_options=,vers=3\0" \
> ++      "nfsrootfstype=ext4 rootwait fixrtc\0" \
> ++      "nfsargs=setenv bootargs console=${console} " \
> ++              "${optargs} " \
> ++              "${cape_disable} " \
> ++              "${cape_enable} " \
> ++              "root=/dev/nfs rw " \
> ++              "rootfstype=${nfsrootfstype} " \
> ++              "nfsroot=${nfsroot} " \
> ++              "ip=${ip} " \
> ++              "${cmdline}\0" \
> ++      "nfsboot=echo Booting from ${server_ip} ...; " \
> ++              "setenv nfsroot ${server_ip}:${root_dir}${nfs_options}; " \
> ++              "setenv ip
> ${client_ip}:${server_ip}:${gw_ip}:${netmask}:${hostname}:${device}:${autoconf};
> " \
> ++              "setenv autoload no; " \
> ++              "setenv serverip ${server_ip}; " \
> ++              "setenv ipaddr ${client_ip}; " \
> ++              "tftp ${loadaddr} ${tftp_dir}${bootfile}; " \
> ++              "tftp ${fdtaddr} ${tftp_dir}dtbs/${fdtfile}; " \
> ++              "run nfsargs; " \
> ++              "bootz ${loadaddr} - ${fdtaddr}\0" \
> ++      "nfsboot_uname_r=echo Booting from ${server_ip} ...; " \
> ++              "setenv nfsroot ${server_ip}:${root_dir}${nfs_options}; " \
> ++              "setenv ip
> ${client_ip}:${server_ip}:${gw_ip}:${netmask}:${hostname}:${device}:${autoconf};
> " \
> ++              "setenv autoload no; " \
> ++              "setenv serverip ${server_ip}; " \
> ++              "setenv ipaddr ${client_ip}; " \
> ++              "tftp ${loadaddr} ${tftp_dir}vmlinuz-${uname_r}; " \
> ++              "tftp ${fdtaddr} ${tftp_dir}dtbs/${uname_r}/${fdtfile}; " \
> ++              "run nfsargs; " \
> ++              "bootz ${loadaddr} - ${fdtaddr}\0" \
> ++
> ++#define EEWIKI_BOOT \
> ++      "boot=${interface} dev ${mmcdev}; " \
> ++              "if ${interface} rescan; then " \
> ++                      "gpio set 54;" \
> ++                      "setenv bootpart ${mmcdev}:1; " \
> ++                      "if test -e ${interface} ${bootpart} /etc/fstab;
> then " \
> ++                              "setenv mmcpart 1;" \
> ++                      "fi; " \
> ++                      "echo Checking for: /uEnv.txt ...;" \
> ++                      "if test -e ${interface} ${bootpart} /uEnv.txt;
> then " \
> ++                              "if run loadbootenv; then " \
> ++                                      "gpio set 55;" \
> ++                                      "echo Loaded environment from
> ${bootenv};" \
> ++                                      "run importbootenv;" \
> ++                              "fi;" \
> ++                              "if test -n ${cape}; then " \
> ++                                      "if test -e ${interface}
> ${bootpart} ${fdtdir}/${fdtbase}-${cape}.dtb; then " \
> ++                                              "setenv fdtfile
> ${fdtbase}-${cape}.dtb; " \
> ++                                      "fi; " \
> ++                                      "echo using: $fdtfile...; " \
> ++                              "fi; " \
> ++                              "echo Checking if uenvcmd is set ...;" \
> ++                              "if test -n ${uenvcmd}; then " \
> ++                                      "gpio set 56; " \
> ++                                      "echo Running uenvcmd ...;" \
> ++                                      "run uenvcmd;" \
> ++                              "fi;" \
> ++                              "echo Checking if client_ip is set ...;" \
> ++                              "if test -n ${client_ip}; then " \
> ++                                      "if test -n ${dtb}; then " \
> ++
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160104/63510484/attachment.html>
