From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Tue, 13 Nov 2007 14:05:37 -0800
Subject: [Buildroot] Buildroot fails to build
In-Reply-To: <41370a610711131402y3fe24e85we6c6fd9bafba3897@mail.gmail.com>
References: <41370a610711131402y3fe24e85we6c6fd9bafba3897@mail.gmail.com>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE10947FDF3@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ed,

Your ARCH appears to be set to a null value.

Regards,

Darcy

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On 
--snip!--
(cd /home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10; \
         /usr/bin/make -j1 ARCH= \
                HOSTCC="/usr/local/bin/gcc" HOSTCFLAGS="" \
                HOSTCXX="/usr/local/bin/g++" \

INSTALL_HDR_PATH=/home/estaffor/buildroot/toolchain_build_/linux
headers_install; \
        )
make[1]: Entering directory
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10'
Makefile:491:
/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/arch//Makefile
:
No such file or directory
make[1]: *** No rule to make target
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10/arch//Makefil
e'.
 Stop.
make[1]: Leaving directory
`/home/estaffor/buildroot/toolchain_build_/linux-2.6.22.10'
make: *** [/home/estaffor/buildroot/toolchain_build_/linux/.configured]
Error 2
--snip!--
