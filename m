From: Will Newton <will.newton@gmail.com>
Date: Thu, 24 May 2012 10:05:59 +0100
Subject: [Buildroot] GNUTLS
In-Reply-To: <CAG6aBkWMBN9uP-pTWo-MoyH7iUBG0mtNgEXdvKff1tDnVf0+VA@mail.gmail.com>
References: <CAG6aBkWMBN9uP-pTWo-MoyH7iUBG0mtNgEXdvKff1tDnVf0+VA@mail.gmail.com>
Message-ID: <CAFbHwiQJN9RaoNsOhjomvEB8gbsMSqa_GtFxp_MPv=-qcWwBwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 24, 2012 at 1:59 AM, Nigel Sollars <nsollars@gmail.com> wrote:
> Hello,
>
> I checked out the latest git as of yesterday,? gnutls fails the build with
>
> checking for
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> option to accept ISO C99... -std=gnu99
> checking for
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> -std=gnu99 option to accept ISO Standard C... (cached) -std=gnu99
> configure: autobuild project... GnuTLS
> configure: autobuild revision... 2.12.18
> configure: autobuild hostname... slacktab
> configure: autobuild timestamp... 20120524T004953Z
> checking for inline... inline
> checking whether we are using the GNU C++ compiler... yes
> checking whether
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++
> accepts -g... yes
> checking dependency style of
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-g++...
> gcc3
> checking for ld used by GCC...
> /usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld
> checking if the linker
> (/usr/local/panda-stuff/buildroot-src/git/buildroot-22052012/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-ld)
> is GNU ld... yes
> checking for shared library run path origin... done
> checking for libgcrypt... no
> configure: error:
> ***
> *** Libgcrypt v1.4.0 or later was not found. You may want to get it from
> *** ftp://ftp.gnupg.org/gcrypt/libgcrypt/
> ***
>
> libgcrypt is selected in the configuration by default -*- when GnuTLS is
> selected.? Ive suppllied my config file also,

Hi Nigel,

With configure failures it is also often useful to supply the
config.log file as it should contain more detail on the failing test.
