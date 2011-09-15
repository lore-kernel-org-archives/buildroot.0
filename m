From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 15 Sep 2011 20:46:40 +0200
Subject: [Buildroot] Q
In-Reply-To: <481531316090323@web55.yandex.ru>
References: <481531316090323@web55.yandex.ru>
Message-ID: <CAAXf6LX8HkrKwCca7wxp_1hZPdXsARF6ZvRQYk_4xvoQNR4Jww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2011/9/15 ????????? <sitesv@narod.ru>:
> Good day!
> I cant start make core for buildroot distro.
> I was download tar.bz2 archive, unpack his, and take command "make
> menuconfig"...
> After that, i save new config file and print "make":
>
> [root at localhost buildroot-2011.08]# make
> /usr/bin/make -j1? HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++"
> silentoldconfig
> make[1]: Entering directory
> `/home/sitesv/soft/buildroot_distr/buildroot-2011.08'
> KCONFIG_AUTOCONFIG=/home/sitesv/soft/buildroot_distr/buildroot-2011.08/output/build/buildroot-config/auto.conf
> KCONFIG_AUTOHEADER=/home/sitesv/soft/buildroot_distr/buildroot-2011.08/output/build/buildroot-config/autoconf.h
> KCONFIG_TRISTATE=/home/sitesv/soft/buildroot_distr/buildroot-2011.08/output/build/buildroot-config/tristate.config
> BUILDROOT_CONFIG=/home/sitesv/soft/buildroot_distr/buildroot-2011.08/.config
> /home/sitesv/soft/buildroot_distr/buildroot-2011.08/output/build/buildroot-config/conf
> --silentoldconfig Config.in
> #
> # configuration written to
> /home/sitesv/soft/buildroot_distr/buildroot-2011.08/.config
> #
> #
> # make dependencies written to .auto.deps
> # ATTENTION buildroot devels!
> # See top of this file before playing with this auto-preprequisites!
> #
> make[1]: Leaving directory
> `/home/sitesv/soft/buildroot_distr/buildroot-2011.08'
>>>> host-gmp 5.0.1 Downloading
> /gmp/gmp-5.0.1.tar.bz2: Unsupported scheme.

Another problem seems to be that the download URL is incomplete. Did
you change something about this in the configuration (e.g. set a
mirror?)

Can you post your config file?
