Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618B3CCA480
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 05:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8AEE4055E;
	Sat, 18 Jun 2022 05:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8AEE4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3A56qNxF9-i; Sat, 18 Jun 2022 05:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1454C4051D;
	Sat, 18 Jun 2022 05:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1454C4051D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7411BF681
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 05:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 635D44051D
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 05:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 635D44051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W2OPawxpHpix for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 05:35:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54699400BF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 54699400BF
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 05:35:38 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48D5DFF807
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 05:35:35 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
Date: Sat, 18 Jun 2022 05:35:35 -0000
Message-Id: <20220618053542.635D44051D@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-06-17
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2022-06-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2022.02.x  | 17  |  7  |  0  | 24  |
  2022.05.x  | 19  | 131 |  0  | 150 |
    master   | 148 | 643 |  0  | 791 |

Classification of failures by reason for master
-----------------------------------------------

             host-cmake-3.22.3 | 122
            host-binutils-2.37 | 59
                host-m4-1.4.19 | 46
       host-gcc-initial-10.3.0 | 37
                       unknown | 28
              host-bison-3.8.2 | 23
            host-binutils-2.38 | 17
          host-util-linux-2.38 | 16
              alsa-utils-1.2.7 | 14
                host-gmp-6.2.1 | 14
              host-ncurses-6.1 | 14
          host-binutils-2.36.1 | 11
           host-libzlib-1.2.12 | 10
               host-flex-2.6.4 | 9 
                iptables-1.8.8 | 9 
                 host-tar-1.34 | 8 
                 uclibc-1.0.41 | 8 
            host-fakeroot-1.26 | 6 
               host-gawk-5.1.1 | 6 
       host-gcc-initial-11.3.0 | 6 
        host-gcc-initial-9.4.0 | 6 
            host-libtool-2.4.6 | 6 
               host-mpfr-4.1.0 | 6 
                host-acl-2.3.1 | 5 
                host-go-1.18.3 | 5 
                host-lz4-1.9.3 | 5 
                 linux-5.17.13 | 5 
               protobuf-3.20.1 | 5 
              swupdate-2022.05 | 5 
                 zlib-ng-2.0.6 | 5 
               host-attr-2.5.1 | 4 
             libopenssl-1.1.1o | 4 
                busybox-1.35.0 | 3 
                  exempi-2.6.1 | 3 
             host-aespipe-2.4f | 3 
              host-audit-3.0.7 | 3 
            host-autoconf-2.71 | 3 
         host-e2fsprogs-1.46.5 | 3 
host-gcc-initial-arc-2020.0... | 3 
host-pahole-73383b3a39afe86... | 3 
           host-python3-3.10.4 | 3 
                   ncurses-6.1 | 3 
                     aufs-util | 2 
  gobject-introspection-1.70.0 | 2 
          host-automake-1.16.5 | 2 
        host-f2fs-tools-1.14.0 | 2 
        host-libopenssl-1.1.1o | 2 
                 host-makedevs | 2 
                host-mpc-1.2.1 | 2 
              host-rust-1.60.0 | 2 
                 host-xz-5.2.5 | 2 
              jpeg-turbo-2.1.3 | 2 
               libcap-ng-0.8.3 | 2 
                libressl-3.5.3 | 2 
make: *** Waiting for unfin... | 2 
                nodejs-16.15.0 | 2 
                   uacme-1.7.1 | 2 
                 wavemon-0.9.4 | 2 
/home/buildroot/autobuild/i... | 1 
/home/buildroot/autobuild/i... | 1 
             18xx-ti-utils-8.8 | 1 
                   atftp-0.7.5 | 1 
                    attr-2.5.1 | 1 
                 augeas-1.12.0 | 1 
                    bird-2.0.8 | 1 
                  boost-1.79.0 | 1 
                  botan-2.19.1 | 1 
           can-utils-2021.08.0 | 1 
                  check-0.15.2 | 1 
                 dash-0.5.11.5 | 1 
              dieharder-3.31.1 | 1 
        edk2-edk2-stable202102 | 1 
                   expat-2.4.8 | 1 
                  ffmpeg-4.4.2 | 1 
fs/ubi/ubi.mk:51: /home/aut... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
glibc-2.35-96-g2c4fc8e5ca74... | 1 
                gnu-efi-3.0.10 | 1 
gummiboot-2bcd919c681c952eb... | 1 
host-autoconf-archive-2021.... | 1 
            host-ccache-3.7.12 | 1 
            host-coreutils-9.1 | 1 
host-gdb-arc-2020.09-releas... | 1 
             host-libffi-3.4.2 | 1 
           host-libselinux-3.3 | 1 
           host-libxml2-2.9.14 | 1 
            host-pkgconf-1.6.3 | 1 
      host-uboot-tools-2021.07 | 1 
           libfreeimage-3.18.0 | 1 
                   libnl-3.5.0 | 1 
           libwebsockets-4.3.1 | 1 
                libzlib-1.2.12 | 1 
       linux-5.10.109-cip5-rt4 | 1 
                    lxc-4.0.12 | 1 
                      lzo-2.10 | 1 
make: *** wait: No child pr... | 1 
                  mxs-bootlets | 1 
                  ntp-4.2.8p15 | 1 
               openpgm-5-3-128 | 1 
                pciutils-3.8.0 | 1 
                   perl-5.34.1 | 1 
                     php-8.1.7 | 1 
                 pixman-0.40.0 | 1 
    python-cryptography-37.0.2 | 1 
            quickjs-2021-03-27 | 1 
rtl8821au-4235b0ec7d7220a63... | 1 
                sg3_utils-1.47 | 1 
                 sqlite-3.38.5 | 1 
                  sudo-1.9.8p2 | 1 
                 wolfssl-5.2.0 | 1 
                       xenomai | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/3d82f3a02415ec20d81662312d1defcc9c11cc05 |     
    m68k     | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/f3cafda9259799268c65c1a01a024bb7f70f3d08 |     
    m68k     |       18xx-ti-utils-8.8        | NOK | http://autobuild.buildroot.net/results/a3152bbdb4c380fb19af425d5e27aa8dde408e67 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/63a414899dc22ec8199f53447cc78b3134f8f18f |     
    or1k     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/2d121d8d27b932bfab3bf7ee2011d35427e87839 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/74e4b82a880f81abaee09645c78e82c19e9989d9 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/19332b5d741b6d7d862237eaf281347951d75b74 |     
   s390x     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/c27ff92f311466ea729f61e3bd3cd8d3e7ffced8 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/b21e87b232d73e77253e9116c7b6a695232ccd5f |     
  nds32le    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/9ca4423a8507cc9c10d141e45237edfe78be964a |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/d8946c8fd0d825777eac6277e9e7c1498eec0e50 |     
   sparc     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/0230845b656b8d382d0da77e716432449b396a4f |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/eebdc0d89e29b8d02ee8c11666ae05ebf245a8a4 |     
microblazeel |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7ee15743894efd710183571aaae0239ce9453a09 |     
   arceb     |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/f0bcfbb21c62530acb1d40aa763085c9b9da2003 |     
    arm      |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/7e31c5b605049698afd9373fa43ebfdc20090a09 |     
  aarch64    |        alsa-utils-1.2.7        | NOK | http://autobuild.buildroot.net/results/60c442caf201fe605524f2e8e8932fa0e4bb3955 |     
    m68k     |          atftp-0.7.5           | NOK | http://autobuild.buildroot.net/results/d69f147678d2641b0fe8bade8989e16178c3543e | ORPH
    m68k     |           attr-2.5.1           | NOK | http://autobuild.buildroot.net/results/33643e7c7491877428f573fc0e25f1f314d34f8f |     
microblazeel |           aufs-util            | NOK | http://autobuild.buildroot.net/results/4268b92cbc3f64f487c24fab991c85cb009a086a |     
  sparc64    |           aufs-util            | NOK | http://autobuild.buildroot.net/results/ef1ada0d1c7487db04c93117c37e57c77c6695ca |     
  riscv64    |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/31a255f22445928b4b3a6824b07f0ed9fd138ef1 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/8ea90ddd8417e71ca0d3f6a0b2f7f3ccf7637876 |     
  sparc64    |          boost-1.79.0          | NOK | http://autobuild.buildroot.net/results/958bc876cd1a9f732cff0b384b3a17dbe01a7414 |     
   mipsel    |          botan-2.19.1          | NOK | http://autobuild.buildroot.net/results/e1fecce601643064f0d95a4ae39a2900865a31d5 | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/210e4bdb61c35f53ffbfdb253b111677ada50cad | ORPH
  riscv64    |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/7dc244cca3e5fdcb2dfd4d098f268525b2b0c43c | ORPH
    m68k     |         busybox-1.35.0         | NOK | http://autobuild.buildroot.net/results/14085a92046c8b543a61a3c42c600b3aaa9c0a7b | ORPH
    mips     |      can-utils-2021.08.0       | NOK | http://autobuild.buildroot.net/results/fd1b4ba4d897e16d354aa60ba50203de283546a0 |     
   mipsel    |          check-0.15.2          | NOK | http://autobuild.buildroot.net/results/175d95283662f0c6d9830af9c1bcc3bd24b4ed66 | ORPH
    i686     |         dash-0.5.11.5          | NOK | http://autobuild.buildroot.net/results/333a42065a726bbbe27da78a47ce5a66f63d528a | ORPH
 microblaze  |        dieharder-3.31.1        | NOK | http://autobuild.buildroot.net/results/77c3a8f96b7157fe14e110486d9b4ac42ddec26c |     
  aarch64    |     edk2-edk2-stable202102     | NOK | http://autobuild.buildroot.net/results/d484a00ab3f67b088e5a1ee364651395e4dc42a0 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/6c03972a07c66ce173e2f937a240ca2fca4e1065 |     
 microblaze  |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/667beafbebe0ed9ccb4f3a10371ef1c6dfb7c3b6 |     
    arm      |          exempi-2.6.1          | NOK | http://autobuild.buildroot.net/results/b6017fe7b673c21a2fd1ed64676eda2970f8286e |     
  mips64el   |          expat-2.4.8           | NOK | http://autobuild.buildroot.net/results/a6181957d014380f44be6882fef86870654f22fb |     
powerpc64le  |          ffmpeg-4.4.2          | NOK | http://autobuild.buildroot.net/results/5d08069acc4c6aa3bf5b0ffdf39748ede44b86ec |     
microblazeel | fs/ubi/ubi.mk:51: /home/aut... | NOK | http://autobuild.buildroot.net/results/b291a1bfb9c050d42d66313b67030cbfcfe496ae |     
    sh4a     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c2d08f297b409d52ebe400100e10521b3a2d5ff |     
   mipsel    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/9c501dae2ce0005df9ea8ab30016f75f8be7327f |     
   x86_64    | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/aba307b2c735be223863992fa9f7c5d020b63ac2 |     
   sparc     | fs/ubifs/ubifs.mk:49: /home... | NOK | http://autobuild.buildroot.net/results/1ba9522366b781e7f9763d1fd4ca038d83ef6f01 |     
    or1k     | glibc-2.35-96-g2c4fc8e5ca74... | NOK | http://autobuild.buildroot.net/results/572d029d1d4969c8c0a048d45272ff8a3c0bf39e |     
  mips64el   |         gnu-efi-3.0.10         | NOK | http://autobuild.buildroot.net/results/7f05c2f41aaca2ff10bd74ceb8fcc542c36f4597 |     
   s390x     |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/2d50b9afeac66e61929aa1aa41fb087f26a28cdf | ORPH
  sparc64    |  gobject-introspection-1.70.0  | NOK | http://autobuild.buildroot.net/results/fdded7522fdd2e32f108021b5f1558ebb3dcb6aa | ORPH
    i686     | gummiboot-2bcd919c681c952eb... | NOK | http://autobuild.buildroot.net/results/cc18195d1e8fa6aeaf438983aef557cb747d1e6b |     
    arm      |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/cd57e2c36c5b07b49b2a693b5e114336594df4c2 |     
    m68k     |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/9c71204a7aa282c0e8f92b6aa3bbaa03d6e860d6 |     
   s390x     |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/6b806d39d477a1d8c1c04756fe1fb3e605bfd018 |     
   s390x     |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/a6209a906ef215cc2db94c7e83ee4ab47dfa939a |     
   xtensa    |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/fd49cef71c35ef58f2df6d590eb225b8b37cff78 |     
 aarch64_be  |       host-aespipe-2.4f        | NOK | http://autobuild.buildroot.net/results/f748b6c96a184b86f425e98844d4caee431aff6a | ORPH
 microblaze  |       host-aespipe-2.4f        | NOK | http://autobuild.buildroot.net/results/fbbf5d1daeabb769af0859092fb4e6f2976358a5 | ORPH
   armeb     |       host-aespipe-2.4f        | NOK | http://autobuild.buildroot.net/results/1fb08513aad60d94a3c90e8d755d44d9d90c58ef | ORPH
    arm      |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/9a8f95228771b125a1abd95757d09b658b88df1b |     
  powerpc    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/ccc4a0ce7601ea2a989f233944506fa3045e6015 |     
   xtensa    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/cfa91057d3c778b0cf68b5ac40cfd5dd80d6e315 |     
    or1k     |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/5a332406a47c760db75f66136ba2dfa131538f9f |     
   sparc     |        host-audit-3.0.7        | NOK | http://autobuild.buildroot.net/results/29b508ba5d1331ce398595cee7052d69b8f26ffa |     
   x86_64    |        host-audit-3.0.7        | NOK | http://autobuild.buildroot.net/results/60baa686e645476b8b83cf17eed1268b85c01cdb |     
  aarch64    |        host-audit-3.0.7        | NOK | http://autobuild.buildroot.net/results/279896f41872da5feefa8fa841db144fbe490e05 |     
powerpc64le  |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/fddd0c43958b69d7ec2744c4d85e23c6f7823ddd | ORPH
   xtensa    |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/e7a5350e70d962e17473778bb5b3c4958e8b59dc | ORPH
   sh4eb     |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/02138c43952ced1e28f59e566916714e205c6ccd | ORPH
    or1k     | host-autoconf-archive-2021.... | NOK | http://autobuild.buildroot.net/results/3162285dd2d7b4f221dec7997b287415a0428523 |     
    sh4      |      host-automake-1.16.5      | NOK | http://autobuild.buildroot.net/results/455a3561c7cb6282dd07c53119a2d76f4b0d4fe3 | ORPH
  mips64el   |      host-automake-1.16.5      | NOK | http://autobuild.buildroot.net/results/8edc9f0084a6d137762b3e7a6d923adffbdec194 | ORPH
 microblaze  |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/b12f45cbcf08053de7b384a337a91d55ea618be2 |     
microblazeel |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/62a0a764935bb41b7e99aea6fac43c00c3ba1b12 |     
   sh4aeb    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/3ced5faa4ddd14ac49353977cee7bf4c71718416 |     
  riscv32    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/bf8e4b5f93bfe402b3cca637282fa8846af6dca6 |     
 microblaze  |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/c9328cea24f8da9470150da21660bfdef655e705 |     
   nios2     |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/2122fd0f3debb0b0d3331e2c158685b0bab694c8 |     
    or1k     |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/e90435aaabe2ce0538193d2e1fca23f6ce47301e |     
  aarch64    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/0a1e9aed5499c8d5001309106ef9b20a6f37f6c4 |     
   armeb     |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/3eab4b810651cfdc69b14a5987907ec9f43f47f0 |     
  riscv64    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/21d7b3a84dff71bb8294db4d05e29210dea964bb |     
   xtensa    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/5460081474e5857c2f1e7b1fe7230ac1d1d24726 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e6b3465354652a0b2f628a9bf521893b51499ae7 |     
    i686     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/bc64624477534cab3492df578b4877bdd20a32ba |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c2bdfeb34e16515cac2c09684e056ad17ada9e49 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/71a14d5a1c99f1ae2d3b6610165a7e0162b8b14d |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cfa6afd1ccfad9d4f5c2a5935c0e25b7b85a3b55 |     
  riscv64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8d5a2c455df78b23d1d7ad7f365301db6cde66ae |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/30408f4a78ed96d57c14ef31b553cee37161fa6d |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3cc3225887c69d49445d82f2afd39ddd9c0dfa29 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3600de1de6c592d7e0aedf31a25f738a27bcf88f |     
   mipsel    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/3c6e66811b9923a4852784e39cff83b2e1beeaf9 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/fc3b2cc04988b7c02f3d756082f46b7e38c2e00c |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/824a21553d1cda103b06d3add3ebfdc6d723af93 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/715e7206b751e132a1df3185b551ddafdf9c5c1c |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/25fb29a41faa3548f0749e55c96c7fa55fba5eb5 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/46951689a69f3d0864df0279ba1c152ee56be85f |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b5f80b38be93b7bdbf1f7da665601e4ea9fef5ac |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f22c564fc77ae94962767e79dc95f1527f418f52 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/527fe768746cabce3fe66b11b4b162b877a14ac8 |     
   nios2     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/71a03f4808f90a53a873b87cdf53da006003660e |     
    m68k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4c88f5705234706756c68d8a7e01602b9b48cb60 |     
    sh4a     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/061330b3be55e3d52e596c72869bbe54a255189e |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0bd6b40f40e4622283c9fa97c1d5bb2021208e94 |     
  sparc64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8e3985acf6c06d2e9b3d99bad14296e3f5e3992d |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c4e18d30b89e0e5052aa15c3a1816ef01ebc6d65 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cf6d7820f759245deadf2185642cc003564c0305 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/290704d075a3df06c1a967716fbb21604d097abb |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/02b7880e22865bc75aba2a8018100c841044edbe |     
    sh4      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/354f4e31114d080b4cf87e184e374b00df798ed5 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/603321ad1968163f24f420d6549c5e2e158f67a7 |     
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/49b36a4b90e776a0411762f71d7b8f8cc8ab2ccb |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/be24ac83c7a9070060ef75ba9b395354eb9a8eea |     
    arm      |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/0ea4554c9cfa4400ad8512e8e62c24a3d53a0b8c |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4847c590e0ca420ed30bbb4eb54fb9582df95d03 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f488253d932179ba9e18303ee6b64630e046c790 |     
  mips64el   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1799854990915199b8714d375fc090cdcdf0853c |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4209af387594377bc1e078c7b95bb99362811fa1 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/e46b696b51e74b3028fe55ac8e9b9fbe0e756f99 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4ce6bd88607a2686bddc922e6b51919aaea22fbf |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/15926980756e724a54e52d97c739c5a6c0db7786 |     
    i586     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/39b42d9aa59d818462c1599e3a4bd83fd4f04906 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/5993296d4f7aa9cbf652717becce6c594279541c |     
   arceb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/947228f404468a27969f95e28db8f35d9db923a4 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c1420bdbc8a0979350fb2990b637b1918162d8e1 |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1d2ed047e5ee0371bd9c42cfd16618db03412ada |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/4da9119542776b19b08547bb604545ab5ddcb05c |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/a3fb12b39aceaaa21622269b3492283cb6b7d8c1 |     
   armeb     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/d2aa05948fadd34a55c43c8f186b62dcb8ac6b5c |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7cc27a9a6255a183d8472c9274caef991c117875 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/9b07a63722f99b4a7ed95fcb493dec9242d2d805 |     
  powerpc    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7ba41d52f47b3300339be5fecf1e6ed091fcad9a |     
   sparc     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/f5d22a48fb082838b5a20571d28b4e577d85c877 |     
 aarch64_be  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cfe20fc4d8a6b1249c929c4351a9f84affe39307 |     
   xtensa    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/b4d551a23758aef29980178f573d18a2eb688b5b |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/15fbc49a5281932bf25af74e4f0b7d75690f036b |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/548985c592c6d711ea5f6dd2aaa0760493d3d800 |     
 microblaze  |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/8a52ef629a3a36a1fd243535595a52d17b735856 |     
   x86_64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/cb65f9259dc2ee7db55b23e450a84bc21cfc8ee0 |     
  aarch64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7e407b264642ced28dfec31b57e5afbfd2a5b31b |     
 powerpc64   |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/c7b8d03bad6e5e87db242618ea1cf46d9717b1c2 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/57dfd6a8291787a8ef5297bb3c2ef90e0d4e8f36 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cdc3cd775edfdac64d473d58fa8de82b3d39a945 |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/c33603557943f7b2bdd4443c9873eefe9143af3a |     
    arm      |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/27b9df8d6afe6570e9258ab215a58cd161bfad73 |     
   x86_64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/cca30677689bd1df1dc2f7545816b4552e9344ed |     
   arceb     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d2b4d43fff7f149c1ef95436d7e4c6fa62984ccd |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/9b48f07865e0ea5ac1cc8ca0d184f1f1dfe58445 |     
microblazeel |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b7611eeb286758298bcb427ae1ea8bd33c20df56 |     
 aarch64_be  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/636d948a47f7a68e36703cd40df9ddf6b4ecbb96 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/083342f1c5fe84ec66a9380b31c7be594f3e9b43 |     
   mipsel    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/20f1c3c224dc8a5b76d51d2a08284adb423c367d |     
powerpc64le  |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/43438f9f12967dad6c2edfc43c63357acfef4f09 |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/8a57a7eb7407319cddc9679f508e8bae67ed37e9 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/b42e14f6643893cc301bbf73734097799eb8c7b3 |     
  riscv64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/60461446dbdcd770f029d6db716bebf11b175f8a |     
   sparc     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d947fca5c81df90508396735c7f88fbb490d1389 |     
  aarch64    |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/f8ff6232ffd9ca6251b681a6093069c99f48c310 |     
 microblaze  |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/3f54c04d3aa2103f52b397c28da39e5cf39ffd83 | ORPH
  mips64el   |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/e5a9cb314bdf1c98e26eb164629a3d856612973e | ORPH
   s390x     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/fff4cb8e52d01dacb1fce9db7d72d9af91199b11 | ORPH
   arceb     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/9acb627409b727665ceecdd5283207757925db66 | ORPH
   mips64    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/13c09620dc1c07c63bb1f627f6782c8b150d1381 | ORPH
   s390x     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/1669a30cbbe75db0f552aca1544fa23d2ac2b9be | ORPH
   sparc     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/21cf6d13ce251ea288f2385d127639a452b8ecfc | ORPH
   s390x     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/25a650e0d59cbb01f2c6278d614295659d3bac01 | ORPH
    arm      |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/90def958f50d8751210d6ff63f19e30b98a32f13 | ORPH
    mips     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/bf92f7caa8e1542251a6c8b0842b357bf28e2c65 | ORPH
   s390x     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/fec9a467f1b6f7984694b0d27fbb053d37843960 | ORPH
   xtensa    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/aebea21bbc8be9bc47858fa9693af5ce2939cfac | ORPH
 powerpc64   |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/e4c666841a71eafd14078d11adc4767395f735bf | ORPH
    arm      |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/7bbe0acb1dcc68c411e88fa6722a07bbfb40e83c | ORPH
   arceb     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/991ef20aa178c2d0d5efe349de6ee42cfd42bf20 | ORPH
 powerpc64   |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/78242a4f03e9900fb6ad2bf37afc00aa1f6a68a4 | ORPH
  riscv32    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/a8d725f0f51c86b840b9dbea68a91b60bfff78b9 | ORPH
  riscv32    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/ff3b809aca8ec54f384355d8a77b10d4294855ed | ORPH
    arc      |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/bd6f7843f71b5fc058fd562f10e19fabe6f46d2c | ORPH
  sparc64    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/96f32e05426720a23598d1df09e28df2f9f1b7b1 | ORPH
  mips64el   |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/272f0684e854058ded495c1fed3cc99f864a8190 | ORPH
 aarch64_be  |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/25fdf88b839f1e56b1c82899d6b3ecb8ef4060b7 | ORPH
   nios2     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/00f849a61e6afe7786946481e603861dadde314e | ORPH
   mips64    |       host-ccache-3.7.12       | NOK | http://autobuild.buildroot.net/results/cc777d68e282d5c24a9870b3aca5f649e5f59ea1 | ORPH
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f963c80ecf1592f260b9d7f7dcc6b7275c823b3e |     
   nios2     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/61ca641a8738762bcf478eb80031551ae8e9ba8b |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/bd15e5bf591795f0daee013c67fc64a409fc9680 |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f94f807fcd3c3f377976f90df4e600598a35baef |     
  powerpc    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d25a241dae420be0c5e74a4de10783e84ba7afb6 |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2063a126be701a20f80a7f23b1c081f14ae75710 |     
  aarch64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c5cfac9a77c8c7d94bfa9ff277ac0574d695d4aa |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/3c49361d8717d7f4d0f36dc1fb589cca59c1feb0 |     
   mips64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/53a2ebc57e7e2a60881d21b832f0f226983851d1 |     
   mipsel    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/234737d7429a239dc6f1ab49c19fe73ed0c6a90a |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0353ce99e5d19a9257a35335c3e1cb1c94068754 |     
   xtensa    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/78f1530ab0ead8cea7fa02a9ff68a3580cebf6af |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/71f25d65351faef5e8b4d1ddfcb39701489cd610 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/6e1c7e1cb55db4f24110e3a62e1aaacc74aa3cb1 |     
    i686     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d61526c322323c96c420d80bf0821d7dd446be04 |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/5a07e34882dc0a508803cfb7158ec4c93d781914 |     
    m68k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/533afe2e4c864a8ca3e17f0202b5786a2a0ca726 |     
  riscv64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/383eeac6921051b5c93e04887b8903d14e58d704 |     
  aarch64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/9f318f5cbae15c1e554b4d7e3ccdad5ea43a653b |     
  mips64el   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/fa0ab70667fb27859ff7354eb5b7928a64abee81 |     
  riscv64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/5640710d12d58eaeb10afa7c05ab51dbda9b044c |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f1fe8d7732a1a30a286421c8137ea3a66d835b44 |     
   nios2     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/9c45f8ad85635c2c1fedbc0bced903964d435136 |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/509adbd282e227848e16e14d1fd122d1fbb7f009 |     
    m68k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/276338e9ac98a6f7c3f43702ca8f21ab0e8f5a9b |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/fffa8a436c00c04c9d4f202070f501485d67a5a2 |     
   mipsel    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/22c9036e90b46499d6f6efb33ddc6f4ad2b3f8e6 |     
 powerpc64   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/7c9e8b227fdc0629abc35cd3774e5e869b7af70f |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/683fdb60451dbdba08474f14becc0125168d90c7 |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/ecf1a556d73068bd0966ff7520e6d8f0a926db2b |     
    m68k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b92f2ebdc0dacc0fc0013f5eb8f56b8b82d2711c |     
    arm      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/008e787262462287ab5ba7ec7ebdb66ccb1e74f4 |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/ef9b20d4ea2d719c5e20dba421101b2a431c37cd |     
    sh4      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/7297245f7daf39abd1f5db73182f0d5b3b5b8e2f |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4322a314e118654d016a8bdf3f952e2d87246c03 |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b51662c9a1096038bdb4085d05413d4892e63d9d |     
  riscv64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/32a3ddbcb75ea4b6c33e51487b64f6ac76c6dcd4 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/085d2bcf2ed10c5cdc07a8b5df42849b70e2bc94 |     
   mips64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/03b1512b6127a259aa33e428c4af48c864360cbb |     
   sh4aeb    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d31acdf1d34fee6544cedef9f1f053293888a131 |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f5f8357bc7261b4762f3326d0f2aeb75d6bfc119 |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/22614cc6c52caa5e47cf41ff117bfa7252716c2f |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/61b95754fd8161f16ab94b4074fa24bd28b2a7c4 |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d8a8e3ebbe952c93777af7d8587aabd8ee406d8d |     
   x86_64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/00ee53f1b36dc41b1b43cfd74f847306e21005db |     
  aarch64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2ceae1b9faec7d76a16434fb4b5cfedce56dd39e |     
   xtensa    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0cb2e060928bfe737b6d3b91003660369aa3cb51 |     
  powerpc    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/cd6fea1ddc8c5ff0258f7b8211a038a39e7ea8a5 |     
    arm      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c0e90456133b4ad8cd0d0b5870463fd63d22ddd1 |     
    arm      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/474b0d7a7cd44f65f86a080a14e276ed844c90a0 |     
  mips64el   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/906d0b6c5d4977cd0cfe407a5b4fad9775da858c |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d85863005e9f12a4c98dfdecff97dc8a9a5dcbc9 |     
  riscv64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4c5313e6e848fcd8ee1f66bd9d9c260c5d566442 |     
  aarch64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4752d805047dd088592c0039e4121b129c36d903 |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/329510fc66f5bc8f0202f91e502a19b7ca9e8420 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b1e5a855528d141f86da4f45cbc9887be96041cf |     
   xtensa    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2ea8bca1994d4b4c6579c760ac7dd039d867fd64 |     
    m68k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/726f90fae1e9e9e953f073d7b7e864b6b685bd63 |     
  riscv32    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/5014805cb66fa428faca14dabf68d47f5bff8dda |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d0720751a8464dcb73cac289f6eabb319d9aa9b7 |     
   xtensa    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/faf6977b93ca51e58dfd2b90ad466388eef104db |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f635f990426857af71addf77c77848e552a61ecd |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/04eb27d3f05eb4dd6c05f335d229d72c6c43cd36 |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/63635a55a3190f22af0327866e0e49acad21ce55 |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/467c72f87d41a916143571fb99d5cc63bf1d0ec4 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/a699285873eae4f1b1585e2d5bab3a3b1f9dc8e9 |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/329856544e13e30f7217482c95f9ebda79195790 |     
   sh4aeb    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/53f7adaaf9404980177573538960ea9d3738cfd0 |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/9944612e6bc61ab0536064817f703fe69dce0043 |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/e7d9dc6472c2214857ca8023fb0de6a00153998d |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/84b67054d919bb958efa4bf5079f7d3b16c699cb |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b8eeff71c95f60a493caf7a45b60682c77f34b3a |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/155e13c9d5e3dbaa79d3088aaeb2bf751c10903d |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/13422d2c0322d550e28f57d7b1ed632d47817b96 |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c9db26ab9fc9dbd1f0eaa515bff34bd947f23c9b |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c5ca4ab9bbb0e9ca822eea2d88797845ffd8556a |     
   mipsel    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f58f1557316a65bd2f20b38168042cdc9f7c1fd9 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4db7e7aaa7cabbde04fb4805f76087830d0950ff |     
   xtensa    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/49a69d5a39f00f8ccf67ca052de8bab6f7d112d3 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/9d14975a79c0acbb5afbda0bc89f368c0d75ba0e |     
   arceb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/fbd3c33f051889ef7817601bd63070ee7ac90712 |     
    i686     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/665c333d8d50ebbaee8e6dbab8ef07f73f57fff2 |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/85e0c244522436e636693a6753fb8567499fca22 |     
 powerpc64   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0df79c4c6e207f6dfbd5e9bbfc23b25982e9616b |     
   x86_64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c8ccf93185a6378a705fe6a49a7175dff0e79bef |     
    sh4a     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0268dbb68c1d69749abb3317e40f4d6ac8e25835 |     
    i686     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/a0f43ac249c671d4f72e02536616d949439ef095 |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/d189cec7051aae7567d0b5aa0d01bd3efff23b2a |     
  riscv32    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2c3aac36561f21d0e7276ca96709372e8e561a12 |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/a25bef4de407b6b51debeb82a282137c51cf09c7 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/54ea22607f383247709e052a3c91b35ba6977cd4 |     
microblazeel |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/6a019c6e2ccf6d43fc982dbc09b6edbd4cc2751c |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2edd043b5645ff952206e0c628497e0022b5f6df |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/6ee380bf74ccdd5b5205574cc0d945b0bd517208 |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/acf986237c61b6baff198f06c8f3309714620ab8 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4d3912a07aaa47aa2ff55b541d9fef8a187ef805 |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b705ae13e1945c56f2752a17b5b762b630ae8aec |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/e9e8b021e8536d925bc5074a0bae70da4cb3aadf |     
   nios2     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b41bbd624ea58dc078ce7549bbe48e920df17fec |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/391d1613f4ef2488be32596e3e30313d56025c26 |     
  powerpc    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/2ba1204e344d154b8135897e9fb7a553f2b4ba3e |     
   s390x     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/6d5aa0b5ab96fc180e51f21ad0ae3dcbd8dda7a1 |     
    or1k     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0004245b7da8d40acc17abcb45ee38d0b6d0a852 |     
   s390x     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4c212afbe09ec9ff0af91d58bbcd4b545d258406 |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/0fa98d29133005fda45ebe7cda69903201f3b3b0 |     
  sparc64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/faa259b0f4997c3318c887a69f73efb7eecccc76 |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/9479b7bfe42a3eafb2432b6fd64b957fe0f7fff9 |     
   nios2     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/eaca58144647837d7c9c5cb359e978a660e8b400 |     
   mips64    |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/b95b385a8cd5a907eceec8d9ff108bfe0f302ae8 |     
 aarch64_be  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/7e298b4f38bf08b109084c4fe3a6bb2241592f5f |     
    i686     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/c0fb3709dd092f10228429b4c4342ae7b08351af |     
    mips     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/38fdd7e9b6856706e259077951cddc477c57e9fb |     
    arm      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/da797e5675dfa2b91537f26ef85bd5e49f21d3b8 |     
 powerpc64   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/71926537764752995ed4bd7a4b354d574ce0a3ab |     
    arc      |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f60709018432cbcf7c2b66e3f9ddc89b2ae850cd |     
 powerpc64   |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/f12092b7066ba02de701d79e3c03edefd14fff73 |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/bd9c9bdc0ba6171978700ddf3112426f53713664 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/5dde0fd2b49440c0046b60df17209e2e7e38d0c6 |     
   armeb     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/993b0b3bc765f1f884a16abe1a83deb3ad6e7593 |     
 microblaze  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/72693347cf7f33457c6b7be6e471b7cb65870159 |     
powerpc64le  |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/da71e9dac7df5535b046684871554b348c9abee6 |     
   sparc     |       host-cmake-3.22.3        | NOK | http://autobuild.buildroot.net/results/4b776174f33cd9940f7bf38df139e4c2cddcfebf |     
  mips64el   |       host-coreutils-9.1       | NOK | http://autobuild.buildroot.net/results/01a2b389525d294bdab3e15fae8bae3f833dead7 | ORPH
 aarch64_be  |     host-e2fsprogs-1.46.5      | NOK | http://autobuild.buildroot.net/results/80ec57720aa5769db68d2f0eea9ee469c46c3b1a | ORPH
  riscv32    |     host-e2fsprogs-1.46.5      | NOK | http://autobuild.buildroot.net/results/552cdba5a191185f0a0ab4e473743f8bef174843 | ORPH
 powerpc64   |     host-e2fsprogs-1.46.5      | NOK | http://autobuild.buildroot.net/results/077ef0c11f375a2be74043238f973e860db9b2ba | ORPH
    mips     |     host-f2fs-tools-1.14.0     | NOK | http://autobuild.buildroot.net/results/39eaa518f7ccadb1e41382fac39d71d6fb871310 |     
    or1k     |     host-f2fs-tools-1.14.0     | NOK | http://autobuild.buildroot.net/results/f3e489b1b491b48e1a12a3a433743424b6c71ddb |     
   mipsel    |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/639bb47d7ba017c66c819e43edee81d28da69c03 | ORPH
  mips64el   |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/7e9304edb578d314400c9b941b33b8d8b0b6a0d7 | ORPH
  aarch64    |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/543b7af39a1171653dc1f3f2fd2cf4e4b657588e | ORPH
powerpc64le  |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/f9d6b3742bc9e09667bdc7679be73d4d834b1b60 | ORPH
 microblaze  |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/3c09783c30d6156caee0bd303bc2b2e246837bd8 | ORPH
  sparc64    |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/198dc4453f87800d6ddc108b378e92c9f6473452 | ORPH
  riscv32    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/803dc1e231d3f1b37b43a9b5650bbb316474314e | ORPH
  sparc64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/caa20178e879386b3565720d1f375993f5ddb728 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/4409ac93019480cb0cb97ccb6d5f05912296666c | ORPH
  aarch64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/d1a97004c39f1318e86963be1b148de3be105030 | ORPH
    arc      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/d713a36ca8f6282d9183bee21364b0a959ca0df4 | ORPH
powerpc64le  |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/fed99f1ae4b5051abc5f843f6da6e9a711f7e4a7 | ORPH
 microblaze  |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/0ebf07926fc17bbcc4681f21ee8447f093732851 | ORPH
   nios2     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/e8546994be04bfd07fc94f950810469ff344f41b | ORPH
   x86_64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/b497a44eff04bc6115cf53008e6e817773d0abbb | ORPH
   s390x     |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/961dcfa0887acc9b911b18bf5c95295ed69ba4e2 | ORPH
   s390x     |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/56dc404fd19720de93a42565042112ad58abc549 | ORPH
    i686     |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/ba6c52d73a2191f5650a03ba5f3e48cae0df05b1 | ORPH
   nios2     |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/0a720fe250b51c97f01b597b035ac0a64a1b1bbf | ORPH
    sh4      |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/2527da3500c91307a146a66fa423531c4c590b7e | ORPH
 powerpc64   |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/b82531135f2fa0c5486d72d0e20626ec998b8feb | ORPH
   xtensa    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/872bf69ff9827b9225fe3d40ffd2a127189adc34 |     
   x86_64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/09e82ad92102a68254b9a3b505754ac2fdd196c7 |     
   sh4eb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/96707ba20bec3133a9150c9d2a290797d1befb3f |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/603e1ffd16246863257b584e27e34815fedb2005 |     
powerpc64le  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/6ead454570e6bf2be3510f2321d1fdaa56a9f9f2 |     
   sparc     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/1f5a94ae6611c5f77a18510ffdb0851b48c4930a |     
   x86_64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/be11f1877ba973e575a45b02337a6024ee1a7398 |     
   s390x     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/08636cf1dc0b64da051b839e62d186008f8f0a34 |     
   armeb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/ccec097d9d80c3f1fa940430e4331a25cacc98b9 |     
   sh4eb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/af09a164c40545c2b778ac04444f9a2a9a874f4c |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/fc50ca6924c4c61f46375c3b70dd24fbe4262ab1 |     
    arm      |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5c1ae29b47abf99da5d755040c3274a4d26a2b0d |     
 aarch64_be  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/9ae0603f9d43242b7a888f9769d06d9483fc5486 |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/1171620cc03110da420302e7671c8e71305e4a4b |     
    mips     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/2a8bfa99c9f5de33f5e38b6f1816fd5481958037 |     
  riscv32    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/6a30d331b979354d7896fc294e57bddfe323dd58 |     
 microblaze  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/cc468acbcdf5a25f59a2d5e08fd5024b935d4d9b |     
  mips64el   |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f0141617a25df32855bef0311020feb4f5d381ad |     
 aarch64_be  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5c5ffb5b3f56c2687815e7a66e4d88a6d42255e4 |     
  aarch64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/ff4d5517bd67bee97fbc5a7ed85c2bb204ea886f |     
   s390x     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/2a3b68aa29ff38720df9043699656a5dc3cb283d |     
  aarch64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/a8c8908a928e22efad542aee43140a0d227905a4 |     
   xtensa    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/0654aa8f5d2b0e2c76d479bbd3b46c9331fbfa9a |     
powerpc64le  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/71fe6e8cce5998034bb8d36d85f71d39534026e1 |     
 powerpc64   |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/737f1a275eae2e411309f78de6266e36922f46d0 |     
   xtensa    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/50047461f50f89d0aaf2f2f88a84b7d689fd7f12 |     
  aarch64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/0b312b611d93688961d7d271e337488d88f58f29 |     
    or1k     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/058ad7f2cd1a8361d5af08e61e73440675af7ef9 |     
  sparc64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/6acdad2e3287a5e3659bc89dd6c186150df890ef |     
  riscv64    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/edcd77f5697b1948f9c1e0dca37ef7657285519a |     
  powerpc    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/fe396dc65f2414b2e4e3ac9ec664bb474d70cfc3 |     
 aarch64_be  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/233d4e20796b0d0c60788e1796afdc5a1abcc842 |     
   sh4eb     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/c509a430d6a142672b44a73e6dfe149f27644781 |     
   sh4aeb    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/5a3db36b7e5051b740d307caa40705735488046e |     
    or1k     |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/fc80d97ce162f921910b7f1c35311a00e3b5ed6c |     
  mips64el   |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/514bd87c85c89c64e478e39110b95e3a4b0198a9 |     
 aarch64_be  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/55fde629e8ab9439e0447c676b77404e73b8f708 |     
   x86_64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c35203f785301c5c9b46f5477464cdfed9073c57 |     
    i686     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/483e0201a5eecb0500ce0b91ddf44eb772c8ff6e |     
  riscv64    |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/1a49890d353ff31899541247418ae185aab4fcc8 |     
powerpc64le  |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/800863d18b1cf7d56b5ce34a31196b00b18d8b6f |     
   nios2     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/4db174162b29d4386bd5cede0e136fd2d7439879 |     
    m68k     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/b83e0a686d813251e1c113741514a0982613bc3b |     
  aarch64    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/430c745e373518b30a666dfa68871fc263d6803b |     
    m68k     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/8a2061059597080325b506f7c6fb0eab898338df |     
    m68k     |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/6ab114ccdcbf0859354db7cd80f2f150cf232926 |     
  riscv32    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/27563775bc68d19d6e121e1487d96b4612df6b07 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/63aff19617acbda0376a588fc02a69143f622079 |     
    arm      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/75425d28efd9709d0b487ff261a88e6656869c0e |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/d2cd6806c5b26e2925f2a2aec16400bfb80e42ec |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/a923a90e29a67ec25159501e615513439fcba1a4 |     
   arceb     | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/b0137ccd1d43d0bf067b2148afcdda5c2c999b25 |     
   arceb     | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/c531d139134d5e944aa961d9e6bc5174292c23fb | ORPH
  riscv32    |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/718ff8b644b419141cc773916cc16ea2b502dc30 | ORPH
 microblaze  |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/07766af594ed3120611573e27b360c2a9b47c9bb | ORPH
    or1k     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/3d0a0d5cb1d4b95bdc747d44f1184ce3e4a9a177 | ORPH
   armeb     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/41df32c103af8077ef065890b52ee7ae2a27858f | ORPH
   s390x     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/b0695bbd1af97b8b83d03a34079a5ceb0ae4a2cd | ORPH
    arc      |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/3787654a3a58b6515cf4d08ede0dced12b475711 | ORPH
    mips     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/04fa50a62e149af89465ac1f4d8750914a4bbeec | ORPH
    m68k     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/53bc77f56cd5732f4f51a2d21ae91c7ab7ec1aa2 | ORPH
  powerpc    |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/4eaa9d2c22662a433f6dda8e1e69b494aacc3e32 | ORPH
   armeb     |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/f7f80834ec3d832c7f229f785e0de4cab6d500ae | ORPH
 aarch64_be  |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/5148401db625c972c7b5e4dd99445c7d892ce77c | ORPH
    arc      |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/992b31a4dd31bf9d792dadb8506bb2cfb36b90de | ORPH
   xtensa    |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/af6278bca24b22ffdfd8dfe3f873fd0cc0ded687 | ORPH
 aarch64_be  |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/f6f095859ebf4e7a6d02b3d61d27ee2498db3d46 | ORPH
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a8b85cccad4501c6f7dfa7ace0a2aa4ea603a4b6 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/4bc33344ca9e6e43509fb1f336aabec8b7950d90 |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/aad9419e9fc289e742cd751c2c1a7809228322c0 |     
   mips64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/40cfcdfb1f4d3d2fd6c4d05fd1cddd25082188a6 |     
    i586     |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/3d96595c2d00b2605040550a703c3b8cdda6809c |     
    arc      |       host-libffi-3.4.2        | NOK | http://autobuild.buildroot.net/results/85b44e70081a8fdca8df111ca5ae6c8c19870099 |     
    mips     |     host-libopenssl-1.1.1o     | NOK | http://autobuild.buildroot.net/results/21a21eb57e03324923b6bee770db7705790e20a5 |     
   xtensa    |     host-libopenssl-1.1.1o     | NOK | http://autobuild.buildroot.net/results/1dec164bdd78fa0434229770fbdedab4259d4910 |     
 powerpc64   |      host-libselinux-3.3       | NOK | http://autobuild.buildroot.net/results/7d4758e1387855dbf6a83bce635a65a455e56af8 |     
   x86_64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/d10998954f1d2f838ff70efffe2b0146afcec3c5 | ORPH
   mips64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/57a62d7b8827b011e73a531243b6f725e57ed311 | ORPH
  sparc64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/7ca19a93227ed1bac6d6957871d0a5af4d042d67 | ORPH
  sparc64    |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/d16c5369f01fde32bf1e195d04fcfcf5e1da23ff | ORPH
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/da1cd033418a9ec778c71c4145d043a713e4f131 | ORPH
    mips     |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/32bada3706caec4b600c99a24f3970e14393868d | ORPH
    mips     |      host-libxml2-2.9.14       | NOK | http://autobuild.buildroot.net/results/9872e651990ebc2d54629962ae31f2ce41598516 |     
  mips64el   |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/45ff65cda72e71e78785319ff5ea04a9d58d92b1 | ORPH
  sparc64    |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/bd1e73e03d06d0b0e3af9809b31e46f86f63b80a | ORPH
    m68k     |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/aad5f7eb72b286cb0515b527099bfacc22d885f0 | ORPH
   mips64    |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/7688395cd8db0821ddde01b2bf761373ac85ed06 | ORPH
    arc      |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/f9c6813abcb0d0a8f69370e04ea6a1fd2978b617 | ORPH
    i686     |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/49ba0450c820e77795a5d6d4e88ba5e8a993549b | ORPH
    arc      |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/47cbb4d674456fb359b9567a64076d4b16353a83 | ORPH
  mips64el   |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/4e4591a6bcc8ac684b76b2911bbd0456b71835ab | ORPH
   mips64    |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/279c5db40dca8e5d8fd9a54bcd5d8fa0308becab | ORPH
 microblaze  |      host-libzlib-1.2.12       | NOK | http://autobuild.buildroot.net/results/eccf7b7bd9df6eb73cf62fdc6059f7a47d3c415e | ORPH
    sh4a     |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/dee1575fc65ccac72aef36642af191b9b6d28952 | ORPH
    i686     |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/c431dab54260b214071c2f064b445676f566d93b | ORPH
   x86_64    |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/23a916eb4bd5b031ae63cd0b47383998c80f701f | ORPH
   sparc     |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/9272a853b87f6f744eaf97d301d1fa5b1143035d | ORPH
   mipsel    |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/c0432915e3df82a7984cd8ba2a58dc8d16998b37 | ORPH
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/9daf94fe5a53c245438a30c430415cc9eb72916e | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/694449b760defea95bf31646d173c0940adb4aa3 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/28a867f0d8fe661b6ca7432c88b9faa1eaee3bd7 | ORPH
    sh4      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c7682b946d2476bd08c9143366163c5c98f2b208 | ORPH
microblazeel |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/909307f9b4e08b0886e2319308306c9fadd2664a | ORPH
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/ff2c32511f7adfe4bc9afad75b5e2b4af88b2fd4 | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/1cc4fca41b1732026cb0db2a4d72ad2034e8a6df | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/be8257525eeb65ab03a6b7baa5b7166ea7b65794 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/d23a13cf992299da65540198f8528361fe37126c | ORPH
    i586     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/0aea49dafb0df53b2cea0107ac2900593f0bfdda | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/3da89170563b11ee16567dfb4805c1c70c0afd58 | ORPH
    mips     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/22d216a92fef67a9675f2913c88b1bd2d676fde3 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/28884ec8749e43b2b7894c7ee37390a8c735f1fe | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/3f31cfadfc51e267cd606db60cd76f9b5d4731d3 | ORPH
    arc      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c5802255823d3a786a0e21d1679b8422976caabd | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/808a47dfd72c81433065a2fd0a11068505a4a3fa | ORPH
  riscv64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/9dbc5f479418530ce7d60997a83b0577df56645d | ORPH
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7112e2df1b3f33697a90bb522f6ed3e1923aae39 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/0ea15a89a748be6280c2d5236940ef51365cc7e1 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/79ade3852497febb956f081b8c4adc41fae55db4 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/c43be7a587955bb42ec44f5755a113d7e26ccf9b | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/ac9894277362dd2173898b40b4d51d28fb08bae9 | ORPH
   sh4aeb    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b013b98e2bdb4e2827467711c79c37533fbf69f6 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/d5d07584a9585462e2b7242a200bf5d8b1946928 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/e257f786c5a24b5a5357abb0eb6150bc894d0c43 | ORPH
  aarch64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b1f1fc6f6595be5017775c077dfede3631a309ef | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b76bcc314ebd20eecec1ec8184da29bbf7fa9a07 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/1ae80116faa3fb5806eb1f9f0f682d52aef9d9d9 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a725a81e4fcf88a4125de4840b0a0dc42ac269eb | ORPH
   sparc     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/0da9feac902dbf52611ae38554850202635c8e6d | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/0aabf10e7b75a84b2af5a5bd8ef31cd045e4cd90 | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/4ad5277880362c5dcc03d11aaa296c4e6805a110 | ORPH
    m68k     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/6f7e28c372769f13e41c3bf2d56b8f2d0f2601b1 | ORPH
   armeb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/093c299d616835ec1032155fea7029af63365710 | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b476ac69d2c51c6eb4149cd7889979796b531440 | ORPH
 microblaze  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/60c0e4976bd8ed80eea835b79493e05706bcb38d | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/38c90ec33c6ac85dcdf1998b30d1970bcfb9f400 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/fb7d1da79512a6644140f2e46af5edea5c65fd15 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/214818774d7ee28020d55b2ff80ac2944897cb27 | ORPH
    arc      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/df24842d8f50159580c604b928be408ccd4b86a9 | ORPH
   s390x     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b2fa0186c3d7c30fc3eeb70cbef6b7f71a41b735 | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/1382aa11654061700eefc63b1b2162f7ed7cf5e7 | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b16bf92ee7f569ddffc421cee0089ec516f13d6c | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/54246827a406ce456d5e6d39b76571d1d2a2be8e | ORPH
powerpc64le  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/7f4b08f2ac391f5917a5be2ac941f096b1ee4a8e | ORPH
  sparc64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/5719ebc01df279ab683945827972c8f29a4ad67b | ORPH
   x86_64    |         host-makedevs          | NOK | http://autobuild.buildroot.net/results/4e5f33033f8852f84fe6e9d649cf61b76f2f70a4 |     
    m68k     |         host-makedevs          | NOK | http://autobuild.buildroot.net/results/366fb05e5c80e1a4e13e14ee45031685d4289bd2 |     
 powerpc64   |         host-mpc-1.2.1         | NOK | http://autobuild.buildroot.net/results/4217b1468897b609e3ccaa814755b12d2f9dc2bd | ORPH
    arc      |         host-mpc-1.2.1         | NOK | http://autobuild.buildroot.net/results/2bcf9e0919aa01a81874c9bac1e7121f7f9e49fa | ORPH
   armeb     |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/96c91b50ff5aef9db76aa51914d8e6a22a07113a | ORPH
   sh4aeb    |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/c6fca1ce9c125f16c8e2cdf4a07d4afe0b54dc00 | ORPH
    sh4      |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/e13a260bb26109bd668545fa6e7f245f6349e0ea | ORPH
    or1k     |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/cb9b7dc1d1607956fc6bdce8231a236c6d2b8ade | ORPH
    arm      |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/0d191d28ef057f8144df3acd74d5f61729eed776 | ORPH
    or1k     |        host-mpfr-4.1.0         | NOK | http://autobuild.buildroot.net/results/f34ecbd358cfec43c1017a48d45abecc8b08ef46 | ORPH
   x86_64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/139d1f955a8dfba98ac7fb233380885c28f43d8e | ORPH
   mipsel    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/55e78b3ac33d0dfbb59ab5ed50ed73cfcaf082cf | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/edeef6a91b6d1c12f7147db35d0dbe62415fe0d7 | ORPH
microblazeel |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/4799ea8593af9ab0478883725f07e0ef7ba6cf7c | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ad4530004b81b1544911b8e82610833e906c5f12 | ORPH
  mips64el   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/16cd518fb7b425d586c5db28437636ac06cb986c | ORPH
    arc      |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/3717a697593e40b554787b9efb6c11a14c62ac8b | ORPH
 microblaze  |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/f86f0a1cda74b1079f087f62578a4a5ffde934cd | ORPH
   mips64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/b7ed5be397dcaf49f905ceb789b51582137166cd | ORPH
  powerpc    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/35eab51f938c5ba4f3c7b3bb3b2b53d7daa2dd72 | ORPH
  aarch64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/a52b2603ea342be85580f8dac43de69a9a812a68 | ORPH
   arceb     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/ed487904663473a550eb5c459d2c28aa24f2e788 | ORPH
  riscv64    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/5a6487ffebd541230d10614e98f5efff413297cd | ORPH
   nios2     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/e7812e807dbcfec31bba0d899796e16d75a242b5 | ORPH
   mipsel    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d06f53a4ccf55b0bc64ea59dec83ec09ee752407 |     
  powerpc    | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/a20815eaac1a160a965f3879b108203a1285c76e |     
    mips     | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/d0c49888fbdc4a91d7d6f71a5ef821ffd739faad |     
   xtensa    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/c75f32f5c4653bcd42ca93408eb27f0cff2def7b | ORPH
   nios2     |      host-python3-3.10.4       | NOK | http://autobuild.buildroot.net/results/b8bfe7d1e616156ac08fccb7de5914ed673ba3a7 |     
    m68k     |      host-python3-3.10.4       | NOK | http://autobuild.buildroot.net/results/f43ec6ee54f9facc033050a91f9d0e8399bf44e1 |     
   nios2     |      host-python3-3.10.4       | NOK | http://autobuild.buildroot.net/results/9f987a74981ab70e621790798fa3c87ac72b5885 |     
    arm      |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/5c53a3f41e62802f78e61ca9ea9bc5f0d8814af8 |     
   x86_64    |        host-rust-1.60.0        | NOK | http://autobuild.buildroot.net/results/50397e0485ff4ea66bddf6d74b58e78358ed95e3 |     
    mips     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9c887a8b5389e29b5b17e8e4ed1c0fa04d0e5b1b | ORPH
   x86_64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/b98f25d8a27e9b2901e44dd91d869ae998ae9973 | ORPH
   nios2     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/225e053ed4a6386ff3649d4a90c8219f84925442 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/299fa963cfd801a8814d1bc66db54453301053f0 | ORPH
   arceb     |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/699f50e51bdac698d89a63a61e3ff584127b21d0 | ORPH
  mips64el   |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/b697189167e963e746dd76b1084f394ace829399 | ORPH
  aarch64    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/4d60dded520d75fb25aed02157f3c75a570380cd | ORPH
  powerpc    |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/1627fea24d41ddaa399897197ac0b3ab4aab0592 | ORPH
 microblaze  |    host-uboot-tools-2021.07    | NOK | http://autobuild.buildroot.net/results/2c8afabbe976cc84ce5b394ccfd051a4b16c0253 |     
   xtensa    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8fe106bb342fa98e91eb9357e1cd39994cb68e98 | ORPH
   x86_64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/437148262764e0d5696a904816e47bc13355ce5a | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/a3322fa61c31cd2125c7ce44bbef37eacdd9364d | ORPH
  riscv64    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e19355ed701b272d4e630c1428ac36561b47055f | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/d1d4ff68a5bcc7550de4d6b5c001855e3b85afd0 | ORPH
    i686     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/8e5b5429f45a4aadcacb97b78171cbe6a72e77b3 | ORPH
    arc      |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/038f774dc7cf36385aa486a35605c8d9eace4784 | ORPH
    i586     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/31ff44ea0b94a7e56d10f3945e6cb35b7d0df51e | ORPH
  powerpc    |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ec30fbb3e204367bc68f1b66788beed2c3deacb7 | ORPH
   armeb     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0182e95726e18549616d99f9c9940390b8af3642 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/9ffc32a1a729daf302fb452c2293bf83848a9817 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/0bf8e16e481676c90c5c3f0d7e20c500d5b5ca4e | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/e42b0bdb9a657978a1a19cc6cda044d040ab2302 | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/3d0700aa89b70b2438fe5afd6a3e46b39d0531c4 | ORPH
   sparc     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/1e9d72a3933748042f074c20afba15d3ca58f880 | ORPH
    m68k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/308637f14d00acc775bab84a595a52fde4e12002 | ORPH
  sparc64    |         host-xz-5.2.5          | NOK | http://autobuild.buildroot.net/results/fc891374407f5d982f43fa25372a4b35b525080c | ORPH
 powerpc64   |         host-xz-5.2.5          | NOK | http://autobuild.buildroot.net/results/20e2aa2fed245d9fe71f400acd1e5b7954bfde8e | ORPH
   sh4aeb    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/d2c0720fbb68f9d0c4d84a9ac42543d7952907c8 | ORPH
  powerpc    |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/66c7c87ec39885cdfb1d95a00265472324405b5e | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/ec7b9528430b9fba8821afaed4fa0d16c949eadd | ORPH
    i686     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/dc29f2d40e9ffb40503869a84be6e641d18075f9 | ORPH
powerpc64le  |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/eb0d5997935f41f08c4d4a91b0de0e86a490068c | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/f4a199516cc87a8a3f53fe9cca934e1b478ee1fb | ORPH
    i586     |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/e68d1fbb8792ae014f8ac001945a93ea93696682 | ORPH
  mips64el   |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/efe8441b7b2b8903fcbcbce2282ec3f21bbc77da | ORPH
    arm      |         iptables-1.8.8         | NOK | http://autobuild.buildroot.net/results/3b92edcf0676ec57117b69e31fd7cc1095a24744 | ORPH
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/251fd4f68fffa389cf29fd6350ae088f5122f032 |     
powerpc64le  |        jpeg-turbo-2.1.3        | NOK | http://autobuild.buildroot.net/results/c3a14d73a05511d6a26a1a971b4cda02f0816b9e |     
    or1k     |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/043be37df705789eff334441a61e9d35d35ba398 |     
  riscv64    |        libcap-ng-0.8.3         | NOK | http://autobuild.buildroot.net/results/885737e674817fc652c387148d0ae3836ce699a0 |     
   mipsel    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/3e747caac72fac44df8c737a9b54663a272baa6d |     
    m68k     |          libnl-3.5.0           | NOK | http://autobuild.buildroot.net/results/5fa417cd799ab1c3118bca5080bbcd8d3a5ea579 | ORPH
   arceb     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f8a1991eacefad3feaf0aa3032d7feab19199d3b |     
   sparc     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/f118dc31b538f0a5fa71364f0c6fe2c353071ac5 |     
microblazeel |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/6bb0206893174fe75605409c2caf7a66125517d3 |     
    or1k     |       libopenssl-1.1.1o        | NOK | http://autobuild.buildroot.net/results/a3ce02c91fcf93077bb28bfc3361379ffe2d3081 |     
   mipsel    |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/8df9ecea0ee229389c037cdb06ab04081f5f5d00 | ORPH
   sparc     |         libressl-3.5.3         | NOK | http://autobuild.buildroot.net/results/c785e371ca0aa48e3a1dd4d400140f5b20b0d6b6 | ORPH
 aarch64_be  |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/c09c3eeeabc7a3abcb614fc92c2d3713f2ca9150 |     
    mips     |         libzlib-1.2.12         | NOK | http://autobuild.buildroot.net/results/fafa073045a6d6ccc0128d77fb93845c7b1b4b81 | ORPH
 microblaze  |    linux-5.10.109-cip5-rt4     | NOK | http://autobuild.buildroot.net/results/751b3e87c351d6a58c6b2a181fecf1e75d79a8c5 | ORPH
powerpc64le  |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/c44a100771d690b5b33a4b38eb6c75c9753f4e83 | ORPH
   s390x     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/637b5efbec12fb863d6890c1f163e3a9f95f43b5 | ORPH
    mips     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/bbecaa303381c1a1f0ce1e700ed1e13bbafd6473 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/9aaebf78c36d7e6a9131663969c4677ae24cea42 | ORPH
   mipsel    |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/fee737018bf2b3e73cd0ac251c0e29c1a4e70b6c | ORPH
   armeb     |           lxc-4.0.12           | NOK | http://autobuild.buildroot.net/results/d4a69c7ec9fc2f792a532a3c3eeb367376682f22 |     
    m68k     |            lzo-2.10            | NOK | http://autobuild.buildroot.net/results/943c98138ef49d43087d5b6d89adfd4ed0d25a92 | ORPH
  aarch64    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/6c459cb5b2b04b38d1e6e3814fd07dd3a2e280ef |     
 aarch64_be  | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/0317d93f856f15988d24e9e2f4ea047c054a6e2d |     
   xtensa    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/1e95bb37a91a06b196ca13dcc4fa4adc36a46eb1 |     
    arm      |          mxs-bootlets          | NOK | http://autobuild.buildroot.net/results/7d7178ea3875cffa28d3a4aba499d1108616769a |     
microblazeel |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/4fe9d7fabbe7958e91fd6f9eb5b512e450e3acc6 | ORPH
    arc      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/c2cff31285d2c528a3c4e624a1074ae4266ac723 | ORPH
microblazeel |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/af21cda8e04ba7218cda7c5848def8e296e1179b | ORPH
   mipsel    |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/97c6a0b87684783b0dea2f13c82b1dc6c2167192 |     
    i686     |         nodejs-16.15.0         | NOK | http://autobuild.buildroot.net/results/2f3f4fa720ef50d11812a55f869cedfeb6d8bad7 |     
  riscv64    |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/1e5e7978b2bc8f957394a28232d485e5e91c092d | ORPH
  riscv32    |        openpgm-5-3-128         | NOK | http://autobuild.buildroot.net/results/39c55a95e1e6e1a60ff3c3a20d3d4629c1e38503 |     
    m68k     |         pciutils-3.8.0         | NOK | http://autobuild.buildroot.net/results/c6b58434115d74486c2b4c3030a5f2fd2917f30d | ORPH
    i686     |          perl-5.34.1           | NOK | http://autobuild.buildroot.net/results/abbaccc0efe7e5bfd6d7b19fc6012b4a2b74655a |     
    arc      |           php-8.1.7            | NOK | http://autobuild.buildroot.net/results/f4077bae8f879828e343475318cd2ddb99e09ba4 |     
powerpc64le  |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c007e3ea1594396f7d3ae2f3539c37904e5a34e9 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/05b29651bdfd7a5042ad8f846898c54cffff18e3 |     
    sh4      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/0cf3a3b7c14ba9ae248cabca5f0a35cce3a7fdc6 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/7815c01987fd17308c898136300e11ac749c08cb |     
   nios2     |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/e1a14c050a4a42f9f11da9f735c928f87bba465b |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/f2a1d2af350f0a2cb15d5f8e1d503fff2d3dd7a3 |     
    mips     |   python-cryptography-37.0.2   | NOK | http://autobuild.buildroot.net/results/8710c22bcac4c156b1f2af51d0d3ab6aae26d67b |     
    sh4a     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/b3c58e4dd8bfb5c4790d10490efb09eaa4dce14f |     
   x86_64    | rtl8821au-4235b0ec7d7220a63... | NOK | http://autobuild.buildroot.net/results/08057ac2a171ac12fcc766e08831cc532a196195 |     
    m68k     |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/85435396ba035c847c1257241c25e929790587dc |     
    mips     |         sqlite-3.38.5          | NOK | http://autobuild.buildroot.net/results/34ae65190ed4fb5785350c4bcbffc41f55dcb3b7 |     
  mips64el   |          sudo-1.9.8p2          | NOK | http://autobuild.buildroot.net/results/8436c27ff6cdb20ad81882e379caddbfe56444eb | ORPH
   mipsel    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2426eb4c88237bfdd204e586848a46a4c6809dde |     
    or1k     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/55e849f8d738f256f256783051fc86d20c66d150 |     
   mips64    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/6a65d357aa7708963298d8cced7c66701bbd5b9b |     
  powerpc    |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/46452d766e3d7f8bbae56b5a06d7bbdd7895110d |     
   armeb     |        swupdate-2022.05        | NOK | http://autobuild.buildroot.net/results/2daba669c4b6db5430ffe21e4c7ae74ac69fd788 |     
   s390x     |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/df4104b2c06e0a49a8f3f1d91babafb2fd0f076b |     
    arc      |          uacme-1.7.1           | NOK | http://autobuild.buildroot.net/results/a1e73178de1d2b9833ab2c3b30c6f73fa09ff94d |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/73e20c30b89c330132877af0262ceb3a5ab411b1 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/3fb3e9f0c3566b10c90fcd26382d6985c1a43c52 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/47395c72b3d0f9584a685f230c6c44515f2928d2 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/e6de35da10afd7bc7f777502b152990f87fe4e0b |     
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/670cb8d6d6b2ab67da4c150a13d5f16878ca3af8 |     
    arm      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7810c8447629c8592a29c6c6c5190dab395bbff3 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/790cad27b1dd2e2dcc0ad0b282e9d7bc84eb2a3d |     
  powerpc    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/bdc25169465a4bf6d25807b2b9c84008f2a5be87 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a16e9c341f1878ba1cf74a249230ed5bcef92a2f |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/472097d95c4288e5d5b21eeea09f6a7854942707 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/37edf40cba94ef7d0a7aeacda9c3a2e6e5c795f8 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/fa4b4a13b429c5ce4e83847b2e8f6f632c85bacd |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/9dec2c3c8449b2cadd96746a4d51e1cbcfb1a716 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/443bb050289ee4868d4e23a1a049ab2c478d4d46 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/2a30152412d4039920b40b802701f120a84482a6 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8d71182da3f8828bcd51011d6b2974780e76d281 |     
   mips64    |            unknown             | NOK | http://autobuild.buildroot.net/results/af76b5402e3b050aef372989bd81a291ce108fe4 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/94b4bdc904e6ce6f0c01101ffd8ccbdd03a02bf8 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/b73cd8f12517ae52568e8e254dce85d218441a69 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/492046989e444ad0ef7f48d14a84043e9d2b5a84 |     
   armeb     |            unknown             | NOK | http://autobuild.buildroot.net/results/c12d6640b12342fea3136e4537af4e426b3a252a |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/18b54b0d82637d5b27dac8f87f615a51610f69bb |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/cb1b5e0d61d9af9ad87e0539fd33c8e2932dec08 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4c228608ad47ea076dc2bf101cfb88f75f10a3eb |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/91a1659ef13bf94e3ad604355eedee22629676f7 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a7d024828517e34ae79056179f8d57e18c189d43 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/a736ef2250267f74e4a75ec6daff36ec204f0586 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/77d258ca03d9f0003b15064555beaf96fa099a86 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/751e8ffe2c18e6c10762e30310d8a31af8557128 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/44c3f43182c4589d26116ab19f13f723ac3cdea3 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/81766d975953de852b5ffc458d7d8326805c18fc |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/120521ea33b0adb2323d5d3b808e224cacf1d316 |     
   arceb     |            unknown             | NOK | http://autobuild.buildroot.net/results/b6f87b5e91f006b2998cb395a8f14b54f42ec02f |     
 microblaze  |            unknown             | NOK | http://autobuild.buildroot.net/results/946d6366df366c71739beee3b875c3ef91bb2156 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/f5be225ec0eefd2843f7bd9033fc32f7a4c8ebc9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/52ee5cd86f11f5ef3e0bfb25865414065afe9ea1 |     
 aarch64_be  |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/55c7c4ace46485415e74603f8182186fc9f5adb2 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/dc7f2e1410e3dc58bd0436555e81303332ebe053 |     
    arm      |         wolfssl-5.2.0          | NOK | http://autobuild.buildroot.net/results/ef5736dfdcbfbb16bacbd95d79c78142a6c2f636 |     
 powerpc64   |            xenomai             | NOK | http://autobuild.buildroot.net/results/8646e23d37a7d8ea402a068e26865f1f8bdd5018 |     
   s390x     |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7d6dc3c6d65e4887db6aed7f70455044500d0e39 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/7f6f3e2cbbc7c190949805f448c612199c87b4bf | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/3bc0d5cb4873b44b8863440bc835e4590ebdccdd | ORPH
    arm      |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/5fd2f90961b88dc02752428f5c14a95e972e4d30 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/366097915b27a753df1b18ed89429dcdb6ee8371 | ORPH
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/e8a56ae2d97f206a2a625ef87bdbb95f194d79c5 | ORPH


Classification of failures by reason for 2022.02.x
--------------------------------------------------

google-breakpad-7515ab13768... | 1 
               host-go-1.17.11 | 1 
           libfreeimage-3.18.0 | 1 
                 mesa3d-21.3.5 | 1 
                nodejs-14.18.3 | 1 
                 uclibc-1.0.41 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2022.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/57afe7ea677e0c5748d32d5e6ff721747413dfdd |     
  mips64el   |        host-go-1.17.11         | NOK | http://autobuild.buildroot.net/results/805aa2a483d47d57d8a8fe96637914dfb341783b |     
   xtensa    |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/23114f930233c67dff80630f696394ffe0c202f7 |     
    arm      |         mesa3d-21.3.5          | NOK | http://autobuild.buildroot.net/results/eb03aaede2739001e53c563575fd8bf79e8d736b |     
   mipsel    |         nodejs-14.18.3         | NOK | http://autobuild.buildroot.net/results/c5c2b07e714edd888449b322f9feb109fc09baa6 |     
   xtensa    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/87f240f3af7c4eac7a9f3738788fe0b3fda07146 |     
    or1k     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f0097d2b1f8eb0ddc8e70ecf65d81b97f6d9d2ee |     


Classification of failures by reason for 2022.05.x
--------------------------------------------------

             host-cmake-3.18.6 | 18
                host-m4-1.4.19 | 14
              host-bison-3.8.2 | 7 
            host-binutils-2.37 | 5 
       host-gcc-initial-10.3.0 | 5 
               host-flex-2.6.4 | 4 
              host-ncurses-6.1 | 4 
            host-pkgconf-1.6.3 | 4 
          host-util-linux-2.38 | 4 
          host-binutils-2.36.1 | 3 
                host-gmp-6.2.1 | 3 
                 host-tar-1.34 | 3 
           libfreeimage-3.18.0 | 3 
google-breakpad-c85eb4a59b6... | 2 
            host-fakeroot-1.26 | 2 
       host-gcc-initial-11.3.0 | 2 
        host-gcc-initial-9.4.0 | 2 
                host-go-1.18.3 | 2 
            host-libtool-2.4.6 | 2 
                host-lz4-1.9.3 | 2 
           libwebsockets-4.3.1 | 2 
                 linux-5.17.13 | 2 
                   ncurses-6.1 | 2 
                 uclibc-1.0.41 | 2 
              alsa-lib-1.2.6.1 | 1 
              containerd-1.6.2 | 1 
             fftw-double-3.3.8 | 1 
                flannel-0.14.0 | 1 
                host-acl-2.3.1 | 1 
               host-attr-2.5.1 | 1 
              host-audit-3.0.7 | 1 
            host-autoconf-2.71 | 1 
            host-binutils-2.38 | 1 
              host-expat-2.4.7 | 1 
               host-gawk-5.1.1 | 1 
        host-gcc-initial-8.4.0 | 1 
host-gcc-initial-arc-2020.0... | 1 
host-google-breakpad-c85eb4... | 1 
                  host-kmod-29 | 1 
        host-libopenssl-1.1.1o | 1 
                 host-mkpasswd | 1 
                host-mpc-1.2.1 | 1 
host-pahole-73383b3a39afe86... | 1 
              host-pcre2-10.40 | 1 
           host-python3-3.10.4 | 1 
                 host-xz-5.2.5 | 1 
                  jack2-1.9.20 | 1 
             libapparmor-3.0.4 | 1 
              libgcrypt-1.10.1 | 1 
make: *** wait: No child pr... | 1 
                    pimd-2.3.2 | 1 
               protobuf-3.20.1 | 1 
toolchain-external-bootlin-... | 1 
                    xen-4.14.4 | 1 
                xenomai-custom | 1 
                 zlib-ng-2.0.6 | 1 


Detail of failures for 2022.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |        alsa-lib-1.2.6.1        | NOK | http://autobuild.buildroot.net/results/d75577e72fd34708a2f9c2cd5918ef7ceb65c5d8 |     
powerpc64le  |        containerd-1.6.2        | NOK | http://autobuild.buildroot.net/results/4b0d70900e3fd086d9ac009e04431ad4f5237240 |     
   x86_64    |       fftw-double-3.3.8        | NOK | http://autobuild.buildroot.net/results/5fe335edd3fddb1ba22efa9182924e0740c935f1 | ORPH
powerpc64le  |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/496e48e66dc46af363eca2f92d86b6560a9c5589 |     
   mipsel    | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/adf03a0c9c5759f65345df24a30a289c6a13e3c7 |     
    arm      | google-breakpad-c85eb4a59b6... | NOK | http://autobuild.buildroot.net/results/a245dbc4e7eafab523be3cfc021d9af44981f34e |     
    m68k     |         host-acl-2.3.1         | NOK | http://autobuild.buildroot.net/results/143673fb960d3b954610a3c2a48501d23eb5b06a |     
   mipsel    |        host-attr-2.5.1         | NOK | http://autobuild.buildroot.net/results/a5e61004a1aa635cb89e0fa0a69ae23bbfcf98a2 |     
    or1k     |        host-audit-3.0.7        | NOK | http://autobuild.buildroot.net/results/82a77f32b08b656e12540bd741158fd9b3f8d319 |     
    arm      |       host-autoconf-2.71       | NOK | http://autobuild.buildroot.net/results/c9d019ef29d280497c5667261683943d1ab4ef9d | ORPH
   armeb     |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/d5314990d0b63b373744258811c8a1ea76cfb676 |     
   mipsel    |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/223af03c4a5a9f162e28635764cdcac440aec55f |     
 powerpc64   |      host-binutils-2.36.1      | NOK | http://autobuild.buildroot.net/results/832571bf5823870d109f0726a59a9dca9f5104e9 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/7b44e8c98c36ea430d802429e91da5fed197ed79 |     
microblazeel |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/24c5b1cbdacb168a64a318734153ef726b0bebb6 |     
   mips64    |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/99e360b1f1a6f0c40adbb5a5b6a592e860b2c541 |     
   s390x     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/1452013aeb19eb035d0f125491cc9c76c4c7cdc7 |     
    or1k     |       host-binutils-2.37       | NOK | http://autobuild.buildroot.net/results/dac10e8bd8903b9125a038997eb8524c41b7afea |     
    m68k     |       host-binutils-2.38       | NOK | http://autobuild.buildroot.net/results/d4e08f0b11b7baf1e94a7cde44ecc56234014937 |     
  aarch64    |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/ae2cfcdeaabf6cf58bd77ae61d2dc25a683cf708 | ORPH
    m68k     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/4f13766eeab08516679c8c267539dab6dbd70dbd | ORPH
    i686     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/6b5ab43f868409ecefe97e3bb57198201d242616 | ORPH
    mips     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/e06f0b370e0a8df04717c60b0361265bb4d71f09 | ORPH
   sparc     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/a44184d502b4f14920eb3c1d4d156ff66c6e4eeb | ORPH
   sparc     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/a4ef66ee58eb3faff41194bc45dd6738d67c746c | ORPH
    sh4a     |        host-bison-3.8.2        | NOK | http://autobuild.buildroot.net/results/de3610f68f25c2d494fabe67672c31fdb3309b0d | ORPH
powerpc64le  |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/8ec59fc87d309da35c96f0606c4829e458f91ca3 |     
   sparc     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/236ec648166d0da8ba245a893e862859ce5c159d |     
  powerpc    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/61fbdad38cb115ee0f84c1865ea980fe339a99af |     
    m68k     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/da12b60e67b993d81f40d72b16364505d3963613 |     
   nios2     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/0aa071c31afcc379babe10c372e85cd9673956ad |     
    or1k     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/c0a774f1f3a77bc89baa0fd5ef7d09a2015f1ba7 |     
  aarch64    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/e567a93645b21bceb6351ea89918cdcb9ff08a62 |     
    mips     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/4a3aba1d5ea3e28126a2c0e49ce70055125981b1 |     
  powerpc    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/3fc354c2614a63427e2a8a1dd26e837cfb59a471 |     
    arc      |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/d14c785a92db87684d95625576412e3fc5a1c0d3 |     
  sparc64    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/fbfeebc34bc933e134962ba580f16e999d0efca2 |     
  aarch64    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/f1d3766ae3c9528d43df23103cd777ea08b8a8b5 |     
   armeb     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/aa43454bd9863a6aa8d63c107cce2279230f72d2 |     
microblazeel |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/3bbc7451848400e403de8354c86652f8fdcae0b9 |     
    m68k     |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/d8954898ed0b2906d81a4f256dfd3fd84a1d563a |     
   mipsel    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/2a4e461ffe6a093d185a7781297fbebfe5d58d23 |     
  aarch64    |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/081df0537a56d5db8026460fd62deeceb16cbed8 |     
    arc      |       host-cmake-3.18.6        | NOK | http://autobuild.buildroot.net/results/f8e5358b2023e65228204c961da48a3b432ae5d0 |     
  powerpc    |        host-expat-2.4.7        | NOK | http://autobuild.buildroot.net/results/01bc5cb395166c61e7a2025ef9fe3bdd4e2755df |     
   s390x     |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/572215172d21d90447d78e3851441e13cea65884 | ORPH
    sh4a     |       host-fakeroot-1.26       | NOK | http://autobuild.buildroot.net/results/2f73f189677effb3dacc29b99279c38a90cc69b7 | ORPH
   arceb     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/7447944c2f8718b2263fcf57069c456caf61b6f4 | ORPH
    arc      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/5da426b7b01b5c4bbee642b7efb07d934d98b158 | ORPH
 aarch64_be  |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/691744a7662bf4541ed17d421d06c80dbbc6ecd0 | ORPH
    arc      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/fd0700e7b8c60e5d489bde90225c2e836d37e331 | ORPH
  riscv32    |        host-gawk-5.1.1         | NOK | http://autobuild.buildroot.net/results/ada8fddf8fe4fdfd157905fdb58d1d7d7a8771af | ORPH
 powerpc64   |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/8c91616630e6bc688e7cb0388b60236ebc9ff222 |     
powerpc64le  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/b66c8fb4588915c7d0359ca9cab2e32e83142880 |     
 microblaze  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/d20d40e1f2165c7d11934e2e769f7205d801bf3f |     
   xtensa    |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/2d61c7f50d021f855f5ca732306f697019c4d2e6 |     
 aarch64_be  |    host-gcc-initial-10.3.0     | NOK | http://autobuild.buildroot.net/results/f0038bb2aec76e96ae218e38f7347b27916bca81 |     
    arm      |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/f6f237c9451095cf006a41233d2105d0eeeb174c |     
   s390x     |    host-gcc-initial-11.3.0     | NOK | http://autobuild.buildroot.net/results/c432824d27c8c07c3e80e49eb31b9040bc1950c1 |     
  powerpc    |     host-gcc-initial-8.4.0     | NOK | http://autobuild.buildroot.net/results/5a6c006370078a94387a46159edaa5de4b74115b |     
    arc      |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/27ac38bebacda2496ebea5530aab87898df6854a |     
   sh4aeb    |     host-gcc-initial-9.4.0     | NOK | http://autobuild.buildroot.net/results/379f6fcf0b3a83f56b50c5d917d49bc193d68de2 |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/53ab85b45b01114ddf7c51fbb6bb6d13cde45a78 |     
  riscv64    |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/3007add310f3b5a32d0276414deca6cd559a22a1 | ORPH
    arc      |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/c7210d9a54938ef52542c75e62f299f2957472b3 | ORPH
  powerpc    |         host-gmp-6.2.1         | NOK | http://autobuild.buildroot.net/results/d8cc72a22048efd6b8ae2b48cd70aac5fb7ca82a | ORPH
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/65dbf7d8e79ac93330ce7bbb89391830a157487a |     
  aarch64    |         host-go-1.18.3         | NOK | http://autobuild.buildroot.net/results/a6c0408adc580e2c7f700e300368b0132ca83e24 |     
    arm      | host-google-breakpad-c85eb4... | NOK | http://autobuild.buildroot.net/results/3560604874d5801650d54801d4e3921ddcc64d04 |     
    arm      |          host-kmod-29          | NOK | http://autobuild.buildroot.net/results/3bf7f44c4f8faf40265bbbc65fe25f549e7fc013 |     
   armeb     |     host-libopenssl-1.1.1o     | NOK | http://autobuild.buildroot.net/results/b27d46563005ec733e5397283fd0e5ab62e0dd74 |     
    arm      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/1aab32e5b0d027ea2aa192849d894f003489c5e5 | ORPH
    arc      |       host-libtool-2.4.6       | NOK | http://autobuild.buildroot.net/results/c04da618a589b66a0562d1092ea17a2dacb12bc5 | ORPH
    i686     |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/683041a4ee73baabda5f0fef1703991de3d1be78 | ORPH
  mips64el   |         host-lz4-1.9.3         | NOK | http://autobuild.buildroot.net/results/9dc3b2f5f67b8c80365f1359c588a7c35f81db74 | ORPH
    arm      |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/f5cf311d8d7cce4b58e626c6030092d77c89b7ba | ORPH
   mips64    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/2165c99e5c47daebb7af41c5db30dd21ff19f66f | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/30e7479be53f3ffe7466554f56f96d44f0960bdd | ORPH
    mips     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/2a9750b42892fea671df09af91fe08de8d3acf34 | ORPH
   mipsel    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/b5fcf7ea55ed38eeb70e9d1fe85aa87e400cec01 | ORPH
  mips64el   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/9eb7cdbc932312a027c897bc5ca109b4a23bfe77 | ORPH
   arceb     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a395ca2fa1e10e698b90c409b66a0fd82ba58d5d | ORPH
   xtensa    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a1521ba64f2992d9698712760c3349c6167e10c3 | ORPH
 aarch64_be  |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/e29ce1389fd24809defe92fd2ecd0d57c18952e3 | ORPH
  riscv32    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/26e6aab6ec0033dd3277dca308932e875c822633 | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/a9eab44d6b8d4e6b1706642eee2d45ccf465c01f | ORPH
   nios2     |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/187d23662cb36449c70a83c450b69a5a5f123da3 | ORPH
 powerpc64   |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/948af8e22131138e3e3e9a2f2a4e9245974d5a4b | ORPH
  powerpc    |         host-m4-1.4.19         | NOK | http://autobuild.buildroot.net/results/20d419c288577a6a49fce36707169e90b98fd6bd | ORPH
    sh4      |         host-mkpasswd          | NOK | http://autobuild.buildroot.net/results/3d0c4b6c91fdbecd5d62b08e13742f72c96b6f99 |     
  sparc64    |         host-mpc-1.2.1         | NOK | http://autobuild.buildroot.net/results/647c436a0f937fc0a1cc0bd49920b1273aa29077 | ORPH
 powerpc64   |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/59c036b164c2607c9ed2f9018e2003426507173c | ORPH
    m68k     |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/47f1d19e08e259d334e90f1103cc924ed3efd715 | ORPH
   xtensa    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/93f3f59697ba7e8d01d3af7e4852e2c114af8a7b | ORPH
   xtensa    |        host-ncurses-6.1        | NOK | http://autobuild.buildroot.net/results/d29507105b7968141bbee11f7391009ddddd55fe | ORPH
    arc      | host-pahole-73383b3a39afe86... | NOK | http://autobuild.buildroot.net/results/b6eeebb5adbc9aeb43c5d723511ba4a1fa30dd0d |     
   mips64    |        host-pcre2-10.40        | NOK | http://autobuild.buildroot.net/results/f7f74bce4de7e0a30d92937c8c2a307fb0ac23b7 | ORPH
   mips64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/ba6dd4fe515d599cb635019be2246066c93a2d2d | ORPH
  sparc64    |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/ca17c0cf60340cef8947251acdea7a0a024e98b2 | ORPH
   sparc     |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/45ef74b077b85ca020e78d25587aeef53e32c54c | ORPH
    sh4      |       host-pkgconf-1.6.3       | NOK | http://autobuild.buildroot.net/results/a164c1408aa9f98dcdee5e910b2f02007771f31c | ORPH
 microblaze  |      host-python3-3.10.4       | NOK | http://autobuild.buildroot.net/results/684162bf6bbc864daccbb8af265a65a4e0f58578 |     
microblazeel |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/9ab95e814d4d631de71f79af9caec5af17e94467 | ORPH
    sh4      |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/5fe2365bbf0af2cd3ffb1f7215e4e0c1a8478178 | ORPH
powerpc64le  |         host-tar-1.34          | NOK | http://autobuild.buildroot.net/results/2e5f1bdc358d74ed666f1234e1f74ba82a4feec5 | ORPH
  mips64el   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/42efc7e256aa85f8b713e5af048835a521d20070 | ORPH
   nios2     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/5b1162b9867628da9c67a4a4b07dba81c0b1b8d4 | ORPH
    or1k     |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/ed4fbcacae995a829a4c8acd7f88afa28d8e8f73 | ORPH
 powerpc64   |      host-util-linux-2.38      | NOK | http://autobuild.buildroot.net/results/545fa529705f392ad5484c773fbe7084ad93a518 | ORPH
    arc      |         host-xz-5.2.5          | NOK | http://autobuild.buildroot.net/results/6bf3a8f6c381303bc00d6e5bd28bbf96e80a5d7e | ORPH
    m68k     |          jack2-1.9.20          | NOK | http://autobuild.buildroot.net/results/5425aa517bf15b608fbaf67b37788e86966be21a |     
    or1k     |       libapparmor-3.0.4        | NOK | http://autobuild.buildroot.net/results/c1cb1bd6bc7dd70a1f727a098c924e97aeeaad6b |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/2195859459818ebfb8412899b9878253e053494a |     
    mips     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/12a7fe9a354b7d1b14cf1078bb11f149f0a9e515 |     
    i686     |      libfreeimage-3.18.0       | NOK | http://autobuild.buildroot.net/results/7890711cca8ea202efc145122f63f0cde90db1dc |     
    i686     |        libgcrypt-1.10.1        | NOK | http://autobuild.buildroot.net/results/ab222cf7e01c5464ace985781357008670bf389a | ORPH
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/f339bfea314ce03eb8682da87b1eb71c97c79434 |     
    arm      |      libwebsockets-4.3.1       | NOK | http://autobuild.buildroot.net/results/2586fe52d8650fc1422258bc32420f60fa945d0f |     
  mips64el   |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/2e2caa6cac28df3fd30de206579df82ecb7ce38b | ORPH
   nios2     |         linux-5.17.13          | NOK | http://autobuild.buildroot.net/results/795aa5798394aecd5e339f01b1fe6e0372f476d4 | ORPH
powerpc64le  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/3bbeda6796d155a918c697e500371f9737d4b0ba |     
    arm      |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/fcf61cf7718a1c0aeac3f49ca8c3a393f1773816 | ORPH
powerpc64le  |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/434293f413b5a43c789feaf493a02beab2df5f91 | ORPH
   mipsel    |           pimd-2.3.2           | NOK | http://autobuild.buildroot.net/results/bab90340d76b3bd4f6d0160debd436df2be69650 |     
    arc      |        protobuf-3.20.1         | NOK | http://autobuild.buildroot.net/results/aae45faa312c14911cd8971a69f07f4270a3990c |     
   armeb     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/83699fdb061e51aa2f074efa7d4e0511396ca5b9 | ORPH
  riscv64    |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/7c3f83f67b7934a1cf1d38a55fd81f1c3a841110 |     
    arc      |         uclibc-1.0.41          | NOK | http://autobuild.buildroot.net/results/cb743a142539b4f0fa1e21a4cb93b877ee24b65f |     
    arm      |           xen-4.14.4           | NOK | http://autobuild.buildroot.net/results/8bbdbf2d01a4f1502ebbe6f9a2de7c49eb3e4057 |     
   x86_64    |         xenomai-custom         | NOK | http://autobuild.buildroot.net/results/11e40db0a87c1675ff6db46f2bfd30e03263d1a7 |     
  aarch64    |         zlib-ng-2.0.6          | NOK | http://autobuild.buildroot.net/results/468a309864ad4799fd1221a6a8a2e060716e933b | ORPH


Gitlab CI results for 2022-06-17
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737864  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737872  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737886  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737895  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737898  |      
                      bananapi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737911  |      
                 bananapi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737913  |      
                 bananapi_m2_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737916  |      
                     bananapi_m64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737924  |      
                        bananapro | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737927  |      
                     csky_gx6605s | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737955  |      
             freescale_imx6ullevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737974  |      
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737988  |      
            friendlyarm_nanopi_m1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737990  | ORPH 
       friendlyarm_nanopi_m1_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737992  | ORPH 
           friendlyarm_nanopi_neo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737996  |      
          friendlyarm_nanopi_neo2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737994  |      
     friendlyarm_nanopi_neo_plus2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737997  |      
            friendlyarm_nanopi_r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597737998  |      
                          galileo | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738000  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738025  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738026  |      
               kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738032  |      
                    licheepi_zero | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738039  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738050  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738087  |      
                     orangepi_pc2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738088  |      
                    orangepi_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738091  | ORPH 
                   orangepi_prime | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738092  |      
                     orangepi_win | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738096  |      
               orangepi_zero_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738099  |      
                           pine64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738104  |      
                    pine64_sopine | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738105  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738111  |      
           qemu_xtensa_lx60_nommu | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738171  |      
                     raspberrypi2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738175  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738179  |      
                    zynq_microzed | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738235  |      
                zynqmp_kria_kv260 | https://gitlab.com/buildroot.org/buildroot/-/jobs/2597738243  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
