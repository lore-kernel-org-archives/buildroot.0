From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 18 Oct 2009 11:20:46 +0200
Subject: [Buildroot] Missing x86_64-linux-uclibc-gcc and
 uClibc-locale-20081111-64-el.tgz
In-Reply-To: <4ADAC70C.1060601@renta.net>
References: <4ADAC70C.1060601@renta.net>
Message-ID: <20091018092046.GG3498@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 18, 2009 at 05:43:08PM +1000, Mark Constable wrote:
>Any hints how to work around this?

http://lists.uclibc.org/pipermail/uclibc/2008-December/041624.html
>
>make[1]: Leaving directory `/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc-0.9.30.1'
>touch /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc-0.9.30.1/.config
>set -x && /usr/bin/make -j1 -C /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc-0.9.30.1 \
>               PREFIX=/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc_dev/ \
>               DEVEL_PREFIX=/usr/ \
>               RUNTIME_PREFIX=/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc_dev/ \
>               HOSTCC="/usr/bin/gcc" headers \
>               install_headers
>+ /usr/bin/make -j1 -C /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc-0.9.30.1 PREFIX=/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc_dev/ DEVEL_PREFIX=/usr/ RUNTIME_PREFIX=/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc_dev/ HOSTCC=/usr/bin/gcc headers install_headers
>/bin/sh: /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc: No such file or directory
>make[1]: /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc: Command not found
>make[1]: Entering directory `/home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/toolchain_build_x86_64/uClibc-0.9.30.1'
>make[1]: /home/sources/srcpkgs/eth-os/cli/src/buildroot-2009.08/build_x86_64/staging_dir/usr/bin/x86_64-linux-uclibc-gcc: Command not found
>( cd extra/locale/; wget --passive-ftp http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz )
>--2009-10-18 17:37:31--  http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz
>Resolving www.uclibc.org... 140.211.167.224
>Connecting to www.uclibc.org|140.211.167.224|:80... connected.
>HTTP request sent, awaiting response... 404 Not Found
>2009-10-18 17:37:32 ERROR 404: Not Found.
>
>
>--markc
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
