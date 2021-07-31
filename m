Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03203C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:04:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F046103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 07:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82F046103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 390B4606FA;
	Sat, 31 Jul 2021 07:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRLRAIwds8r1; Sat, 31 Jul 2021 07:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF59E60711;
	Sat, 31 Jul 2021 07:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA1371BF8A8
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 06:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE36C606E6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 06:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g87r4FY_r9s0 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 06:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F203E6069D
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 06:40:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 96AFE1C0007
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 06:40:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Jul 2021 06:40:55 -0000
Message-Id: <20210731064102.BE36C606E6@smtp3.osuosl.org>
X-Mailman-Approved-At: Sat, 31 Jul 2021 07:04:48 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-30
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

Autobuild statistics for 2021-07-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 739 | 339 |  3  | 1081 |
  2021.05.x  | 738 | 306 |  3  | 1047 |
    master   | 2514 | 2184 |  5  | 4703 |

Classification of failures by reason for master
-----------------------------------------------

                  exiv2-0.27.4 | 312
         host-gcc-final-10.3.0 | 147
          refpolicy-2.20210203 | 134
                       unknown | 89
              tpm2-tools-4.3.2 | 83
cegui-00b4e1fe174da53b7ed72... | 71
                  libogg-1.3.5 | 71
         host-gcc-final-11.1.0 | 66
          libmodsecurity-3.0.5 | 60
                 pixman-0.40.0 | 57
            pkcs11-helper-1.26 | 57
           optee-client-3.13.0 | 54
                  zeromq-4.3.4 | 46
                    olsr-0.9.8 | 42
            erlang-jiffy-1.0.6 | 37
                    mpv-0.33.1 | 37
               capnproto-0.8.0 | 34
                     gpsd-3.21 | 31
                    qemu-6.0.0 | 30
                    ffmpeg-4.4 | 26
                 openal-1.21.1 | 26
               libfuse3-3.10.4 | 24
                   libnss-3.68 | 24
                    mpd-0.22.8 | 24
                   gssdp-1.3.0 | 23
                libmbim-1.26.0 | 23
                   gconf-3.2.6 | 22
          xml-security-c-2.0.2 | 22
                harfbuzz-2.8.2 | 21
                      gdb-10.1 | 20
                   erlang-22.2 | 18
                librsvg-2.50.5 | 18
               nfs-utils-2.5.4 | 18
             libmediaart-1.9.4 | 16
                 dc3dd-7.2.641 | 14
                 mesa3d-21.1.5 | 14
                 openmpi-4.0.0 | 14
               libgtk2-2.24.33 | 13
                mono-6.12.0.90 | 12
   openvmtools-10.3.5-10430147 | 12
                    bird-2.0.8 | 11
  gobject-introspection-1.68.0 | 11
               libxmlrpc-r3119 | 11
              swupdate-2021.04 | 11
               apcupsd-3.14.14 | 10
                  polkit-0.119 | 10
                   sdl2-2.0.14 | 10
                   guile-3.0.4 | 9 
              libsecret-0.20.4 | 9 
                xenomai-3.0.10 | 8 
              libostree-2021.3 | 7 
                qt5base-5.15.2 | 7 
                suricata-6.0.3 | 7 
                    zstd-1.5.0 | 7 
                  mupdf-1.18.0 | 6 
              open62541-v1.2.2 | 6 
               pulseview-0.4.2 | 6 
            qt5location-5.15.2 | 6 
                      tar-1.34 | 6 
                apparmor-3.0.1 | 5 
                  host-python3 | 5 
kvm-unit-tests-kvm-unit-tes... | 5 
                 libqmi-1.28.6 | 5 
               libtheora-1.1.1 | 5 
                      pdbg-3.3 | 5 
           python-pybind-2.6.1 | 5 
                 ripgrep-0.8.1 | 5 
android-tools-4.2.2+git2013... | 4 
                   bullet-3.09 | 4 
                   gvfs-1.44.1 | 4 
 Makefile:740: target-finalize | 4 
         nvidia-driver-390.132 | 4 
                snort3-3.1.6.0 | 4 
                 apitrace-10.0 | 3 
  binutils-arc-2020.09-release | 3 
                       gdb-9.2 | 3 
                 gerbera-1.8.2 | 3 
      gst1-plugins-base-1.18.4 | 3 
           heirloom-mailx-12.5 | 3 
             host-cairo-1.16.0 | 3 
             host-gtest-1.11.0 | 3 
            libqrtr-glib-1.0.0 | 3 
                libvips-8.10.6 | 3 
          lua-lunix-20170920-1 | 3 
               belle-sip-4.4.8 | 2 
             kismet-2021-06-R1 | 2 
libcamera-3a1f67a8031ac5ad9... | 2 
                  nginx-1.20.1 | 2 
                opencv3-3.4.15 | 2 
                  pango-1.48.7 | 2 
                   poco-1.10.1 | 2 
               qt5webkit-5.9.1 | 2 
                     tftpd-5.2 | 2 
toolchain-external-bootlin-... | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
         xlib_libxshmfence-1.3 | 2 
                      bash-5.1 | 1 
                  cairo-1.16.0 | 1 
            docker-cli-20.10.7 | 1 
                    efl-1.25.1 | 1 
                      fio-3.27 | 1 
                flannel-0.14.0 | 1 
              fstrcmp-0.7.D001 | 1 
            gettext-gnu-0.20.1 | 1 
 glslsandbox-player-2019.08.23 | 1 
                     gmp-6.2.1 | 1 
                  gtest-1.11.0 | 1 
             host-cmake-3.16.9 | 1 
host-gcc-initial-arc-2020.0... | 1 
              host-libcap-2.51 | 1 
      host-libtextstyle-0.20.1 | 1 
  host-libxml-parser-perl-2.46 | 1 
             host-ninja-1.10.2 | 1 
            host-python3-3.9.6 | 1 
        host-sentry-cli-1.57.0 | 1 
      host-uboot-tools-2021.07 | 1 
                       inih-53 | 1 
              irqbalance-1.7.0 | 1 
jq-a17dd3248a666d01be75f6b1... | 1 
                       libexif | 1 
               libgtk3-3.24.29 | 1 
           libunistring-0.9.10 | 1 
                libxml2-2.9.12 | 1 
            luaossl-20200709-0 | 1 
make: *** wait: No child pr... | 1 
                moarvm-2021.06 | 1 
                    mutt-2.1.1 | 1 
               p11-kit-0.23.22 | 1 
               pipewire-0.3.32 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
                      poke-1.2 | 1 
                poppler-0.84.0 | 1 
                proftpd-1.3.6e | 1 
                   psmisc-23.4 | 1 
             qt5wayland-5.15.2 | 1 
                rtorrent-0.9.8 | 1 
                sqlite-3350500 | 1 
                upower-0.99.11 | 1 
                usbguard-1.0.0 | 1 
                  waffle-1.6.1 | 1 
              wpewebkit-2.32.3 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 
 xdriver_xf86-video-tdfx-1.5.0 | 1 
                    xen-4.14.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/ddbbab5f09dcf36b94e3d4717061ac72cb298b5f |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/7bea0b97679b9b234fe6f4482caf95ad67291a40 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/32047739ca05addd098292f8d2859eac7ef5e447 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c598b76286b78a79312c09d7c7da877c7e226ad2 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b68b82f36e646b90c52d92570de4daea58529b6e |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c073a10acf3ecae0b257fb8c759105848f90d5d4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ee33095a4fe1f0f78a7fe0044d8e675e344c7399 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b2cc90b38fb577a56efa8abab2b6fbdbadf7d6d4 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a79d92292d2164e987a80c48cc7653a17be9fbfb |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1472c90f3b8c36c09c139f656c4c21a5618274b7 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/d6c59e624971112707ccd777dc90de1862bbd40a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/159dba5114d06fead798c6ca7dee3ea87951e4ef |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ee73f0ca278f27b2998662b00bc2ace08dadcacf |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/30874dad39a58785a034fae909fada3b3c09fc49 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/a5f2aac22dc1513dcc0c920f810424cad77d615d |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/44d8a5f2611bed469767b448ec9c0a532e970930 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/d8dd943b987f9e76c8570782032e4f185dae7ee7 |     
  powerpc    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/19ba20ec44dd430558058e72d99510a9ffe4d1b5 |     
  riscv64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/c0d1af034f57e427b5591aa8eefcedaeabd4c34b |     
  powerpc    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/e84aa064a2495cd0cd857c30ca4c04d0963196ac |     
  powerpc    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/9943488d9e8344b609baef54692cb6de9d76307a |     
 aarch64_be  |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/13fe911d342665440fe32464b00438135d4aadf6 |     
  aarch64    |            bash-5.1            | NOK | http://autobuild.buildroot.net/results/0d8a3c84f8b178fe2d82df092de13e011878f831 | ORPH
  aarch64    |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/c9c8acc691c0f3a7fbee83055defda67c2e0f451 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/0ab6c15a85faf42b81962e5c1e8c9e4d2d551484 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/f22842ad8bec440131c5458c86a25694027a136a |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/ed9ebaad40ff2954d87bd85d705141aae54d68dd |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/729aaa2fd4633480425b36ed4e9faba3235f5cc9 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/1a6bedd4e9fea215e7cd19ea957ea63281739a48 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/1e225bbfb7bb494879138f7e0e106d84df717536 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a820bb92de38024ade63b8cfb1ad5d1d3000730b |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/bd86896ade084d54d39e99fe3027d86bb5772d78 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/26901dafd6c356ca47ba2d64217fa0bc9f047e38 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/05da9ce732050862e95fb44650c6f6ede071bad9 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/5bf0fd38966ad2a6bd54a379a8f038f200fb0c0e |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/1313a54610adb1ff66902336cdeb0cb71e5a2fe1 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/596897f3490e31c6b8c74152f67b3901279f4ef4 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/daa2a1d1a5a04cdc5abadbe7c40a05159373549c |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/7017f087f7ce9c7bfc7b85cd7aefcc65619e8a4e |     
    i586     |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/c4385b0975c502fb08e5fe930ba6cbab09638db6 |     
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/b1489323ef30b6d49fc6c6a969b4f8274040957b |     
   x86_64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/5c74d3de8396abfe0aff4b65ac8f5c35a5e18867 |     
    i586     |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/684e5df6cedd011b19112a79d9f8a6458a728d24 |     
    arc      |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/62d76bf1cd716bf32c541e79e54491aa5a858abe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1c64bf055a2743a7b4da7cb875a984573811ce83 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/caae9861941a8d64b63d699b86d0ad1ae8ab1b3e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3badd379afd585b7b8936b481552bcb7717e8fdc |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e289db3594e98130a22eb6c1e9f0c42f05c7588d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b1025612ac904fcef35dc5cae49672828eb6c421 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f92dc9aede7c7d107d6b76483a313f4cb8ed17bb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6a636450e0012155eb2bfaccff3b6d2da9ec6b94 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/419eb0908519d58cca72cced423d5ac6b2890445 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4509b2fc1185dd6daab423fb8fb20e5fa4848be7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/986cd4783f63b40aa35476805974b386928fea3c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/49d75db6daa2fd91200f0be2ad7a47464c3673e5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/76e7eff2fa0fcecb9f4135f65fb7e49927015687 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/575ee3b2c8515f1d18c0a2a243bc0eacc0a86dc0 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/48ced046607e1043eca060e6d45e6f387352163d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/875f412d09702fb1a7d10f5d271fd5f2fad19861 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ca6c45fb5ea44dca7acc7f024d14c664a9463c88 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2c34215f27a6052a85c1fdc3da85345c7a97d9e8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a7cd994f39cf92df9262ae7d8bc1c3f90f72b750 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9fd2896ab7bbbacf93ff0f8d6e30c1cad7b1fc79 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9ae0873e10e0b0ea3b4c8437ce5e623966597335 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4ec120d0b0578d8add197995273dc70eddf8bb09 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3371f592b2790b0d9bf900c9a2f28ad4cb35a78f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9634f4b9cddad62548eafd92646ef54fc8f4270b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/82c99dfa3ee5428ed9208485bf26191d5be4c671 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5946582361ef194be741ada0ead12b1d216e418f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/84b37bee7b8a64ba6157d8874aafb3b8a1ee3663 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5cbe02ddaa56a88df3067d995904be60782aef26 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0e42539b58b631bc206b06d8ab43c0fd893e1069 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e6c8d0ac9a006bdb7e35392b20658b0aab08367b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/06060b9249430182da8c30973904c9bc3baeaefb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/41c487f7a192e8194c84919d175ff82ddb49431c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9a818c81953c57436e8b92757e5037562a9c141f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0e0fc1d83969291b5fd3ebf81718da6e031ae9d7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/66e6dd8af0ac9be42ba943c540dc90e30dbf0c99 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d5864257d91ec77356061777154396a092757db7 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/501df48e931b112e3b3bbefeb306ae3ba892231f |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/390e7c727824c62ca95f3b386d2aa369dae0f294 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/827e7803255e21eae2085304148b64aed62e61bb |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0a08dd76b980bcb1d0ce545928c36caee21d6120 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f03e665b312be0af1bfc9a1cd9c38c0c8317b8ff |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4630c23b572914b2c41024b7e7a52c82a588b60c |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0b50ff59fbb7a78400633d09434f8734b2e32a96 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e56db50e0a9c0b9c09df188139223f7e9a6393ad |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a062f0b2bf25de136bae70d34bb5e0117f034058 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b4de2c56a30f31ae4cfd6672f02556917bbf350c |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d23c5329dfb9f31106382c25d332077fd7234b59 |     
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/145d5c3ee15b2c0a0ccd7a6de598b0146f4f02a7 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e57357ec075cf6bd9232dc825115640a972626f9 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a5d27c6196685ab3d445a8dbfa6944f7a373ef04 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/011ee21a38dfc7982bf830b39fb7307e480afc35 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3a17de628cbd6617da2c9b2748e75db18a60811b |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0fa6a21afeb1140b5fba7292ffda9ecce5f6e0b7 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2ede0d1ed72ae0dfc4da3e667a5e8007e34cfccd |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/595b1e554d97ebeb8bb0e78cf608b5dd3f2f9f1c |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ab11d36b9100d7810876b950ce5c398e547f89dd |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6042d755d83a58c9c329614adcf1718facb8b664 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c210bddfbf2cc0d3f05c618178f1a3b8068d8575 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/15bb15ecb599dc79287e092b87c3c88d7afa9039 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/25e0aa174109981692d49b3d7615ce4b8f6b6a4a |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6d3000dd03aaaec95fcc3a8e24ea69a9a3f911f8 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ca42afeb3d7b2d5a21c3e2a06316b38ddf0675f2 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/138b7790f4851487c42ae53e74ead52a193753c9 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/88bd5400211cd72f8706668d12f81a1cf903a601 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/278ff30aa5cc9ea233f54d66dfd2421088951500 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/bd01bf1d81cc6662e1bba3e14e75a3a36c55b1ac |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a71dfe64cdca6ef2c07dd5e8b446264240403174 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e7106bb4bc33ab97c36fd4d7ba0229260415ffb9 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/96262cbbcf90926a47b60162a062d261dfb96e17 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c9e9419d9ec77ac1fb05103d65daabee9d6abc40 |     
  riscv32    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/96a7f9d3df21d7d87de08f73288a29a6db06934a |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1f9172f4fd6c55108081605539f72076925126c0 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d359fca7464a8730e756293cc1d8cfffdea566a6 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8984fee848841ac236c803cf15f2dc235b89a113 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6bf3c46049c20d7038fa7f39b62fc8b48ff5539f |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccec54abbde0b4ed5195d532e7ae60eeb1f3379a |     
   sparc     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f666ecbe2ce378e9b5e5be87632020e743d9dfe2 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/49ae69241a960c3be638e069292b06ca39845277 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c6f2571b85925b433187a4ae815a92d59de94cf2 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e33f441a8dd56ccb6acb5ca9191c88b690f42301 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3cda1101220c655b3de3969153a946b456e6d17c |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3f3d13515b2580d64348a2673b7aae8c574ff7d4 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/aab958c1ea456f40cc511c41f8cb0a7acf08b897 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/07175809d11e748da9e5dbc87e1a22d635f6e45f |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a71c4261781760dbd6f71f6b7e58625a9059a8b8 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/80133ad6771ee4f228095fc839b015d4673e8e21 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9bb300d9dc363853aac4c5d0c4d0e30448f971b6 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c202191e2d3cbcda58a721cbe10e5f4aa198abff |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a784285be3bbfd7ba5530ea2df70fa9a3d1b2a4e |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/70e6e3dad3175024339004f8ca2b94ca9cf065b2 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4c32cb66f4deac477d5c792fb2cbb6901f5047bf |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9a032a446cbc4ec18b2b395e5bdb046a2bd99f19 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/05b5cd8ea26ac1f27047543578754a4b516b23d5 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7dda4bc5d0d74db59eae66936f7f14f5bf79b7a5 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c325323599080de1d1d6f7181aa2e8a8bf524387 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0b35a76e206abe0bad97dc87d3115c0f26e28cf4 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ee33e1cdda504cc60e77df55924f834dff495612 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/719df8333506b4b8d3b3257a17c4d39a52526491 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/92a3e91472844cbfdd07ffa23cf601104034c242 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0b851c91dbe9086b8ec64d768a31668d55a85042 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e384ec0249a6b9f78e079c04430c8a7b7abe9ebd |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/130904f3eb547c790880a89b664703349c31f1d0 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/21d9ca3d678146a8ac4f43a38e75f2bf7ddde956 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/20bf1d0fe7e30d9a183028080be5fe78b8b2b9f3 |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ffb7637b5ed1abe04fd477f8c258f873e0128e62 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a72ab5d98f115ab3e3d4cb608cc1f3841950e555 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ead1870ccdaca3a06f9325116ece0dad3932c69f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a3494efa28c2ead4632d32ae5faabdfe94a37dec | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/653988ca7e14fdcb3a7da6446bcb5ca2b0cfd152 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b54128195a73877559b6accdaddb12f2cf1178c6 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1a7b5340b7bc6dd2e2b1f1f3f2c7d40133d003f4 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/71cc457b6c1db5ebe2b7f482d3c0f85c3d702694 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/08303e171dc343a74d46130ed314cd9230a6ef3d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4704c5f71e49d18cda0300958de83df0e8c21241 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dd6cec1eeb2b94ea426efd7e387d9c7908d00d90 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/3a0dea2aa61d54ba39c99e78486c20f7f431f01e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/79cd42f62cfd8109f5124347017cd3f658f9cbe3 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7cdd6ecfa6dfe3cd1707704d032443f0b77feb0c | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/329af46d0d230291b6f928eb4b7a1821656cb588 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/eaefe8851506ad0cd03adca81f09b13b461f65c9 | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/939566bbd1ad3b1db8e1ac9c3baa0b5264fe76a9 |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/02d8899f86f23e11b9dc23c2f207871e6872327a |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/7aca5167e34580018df1fa9c07ca771f7f528c79 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/1a52519b273b5d52da6f94c0706206638bf0468f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/9242196695446fc44b3abac616769e3c171812f0 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/51cd9578cf7e565bba69252a3ed68c86b19f6c0e |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/cb1fbfc6824b7438e2c48fe1e5d9ffa4c7d8a53e |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/1e687978b8d5ab66f12391c4b25b9808fa9f80f7 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/9eed07d69ec04f2e14c79c71f3686e5a18750674 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6574726bbf4ec07cfa3f9bf7710ad64439b8ccd1 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/bfd459671f3e3a683ae5ffdefa80daacdff1633f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/01cecc5b40c6cb7018cac2685135fbd5dc14e50c |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4dbc7e8aae41ad1028c840970fc58976da717caa |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/823e77dd66d6f048da52936fa7b8c5a6993eade7 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a07212612136d0106946ff1bd00e14adca99d395 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8766855f7d898feb09e20ecafc7baa569abfa153 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/36e8b7820b7e674a62ef09f8be075b3afd83ab7b |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e07646999657a5b6eeb487c104aefdded9ed1ddc |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4d10722bb1aaf3a26f3bcb7e16c276d830cb2238 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/fc613cb7b75bcad7adfecf8b4aa2a73fd7b3bf43 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f85a773872f9c2166b9792c2d1febb488d51240e |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3828e80fbaa669afcc10ec9d7efd9fa410354662 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5766132904234be899fb457029ff0f72a4ad4951 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/595309074224577f0644c2f0ca2f2b0df151aed2 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cebf2672e60f2666e81c7f825031e6dd991a008a |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9ae427d0357a3c10f66c358609e3e865877f481b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/62c5a13147ac4d027d2f0213b9c30f095a8bf977 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c2871abcfb87d07cdaf7f8b1a8d29357b401532b |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b9d6de072c4809cd87be7061db646c14589025ba |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/161ab2df5877b4d2cd7a573eb7f06ed863551883 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/add04e19f76e14bae7100e3e326ef4b3ed674a81 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a5eb035fe02349db87f80235ba99f4429cfa7140 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ea16b234628ead63bba04a9cd9d1c5cdf9a75609 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c80c2a99f56ae67e664e40b729c0f7c3a48daaff |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/91af5d5ede878f7f53f120b2c18b7f68c03badf9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ac41af2a1f106f501607eaf101bd84efd7254213 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eb4bbd67a3438a0b4e22466923b4c840d32007de |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8152f156e677a8a4340776951e96180b2ffe1aab |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/04ae1d4774670e821c02c54d926b5fa79993f321 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/79c8822d8ecacc4b66a3e7a0a398e07388a6a95f |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5438773d9729bc7d425405238af9f5700a45b682 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cd04caa66b1953d9f01bffb6cecf4ae01fc6de8e |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a29e9b2d7226d85a64ef99a5a2dcc2f04ce32131 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f4c6b7a1d386a99ecda6bf065e796a9593cbb1f4 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a2d7adc57e11b0df27ef006632a7917259d93614 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9046a100dc1a253137b8b6a2c05f93648652cfcc |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1df329f94bbb9fbdbaccd92a34692370adae9680 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b80950de2f453a49ab5eff1511661548e2cbad41 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c5295eb193eb93c294fc9be05404b47da9cc711d |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2a93579d724ce992eb3dbcc249b5b210df600c52 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4760bbbacec22b44d4dc8d6a9d5ec8ace6148907 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5360ce5d0e0958aa80a7fcaa7e98ded255ef80f8 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1ca8f84d3a68f6a174dbe2ecb3798065a5128f1b |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/02390ab61f2ede9805a76732899df696b9eeef52 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7bca8b32ce0c8240257b64eeffcd470140e52f96 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6e75f18bebd2ca3c4a7c86bbfa739e890241f9b3 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/329f9d55f630ac3fb5720e339f76a1453c56b8ca |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e251e159e32ec37d5cffa2f86297024ea7c0da90 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8e74054b6bc5d8f8e54948aee007c6f8d240a022 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/525efb3e8186d9490a40e82fe3a3b354a91226f2 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/30dd43f9b2410e02debe340fa1aead295ed6ab49 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/372e1b96ae1fb72e009db44d8310667257e03942 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/86faa0da1e16731b639e9d3d910a4bd04738a37d |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8556b8bb047953a6e99a491ee04db39c463d7902 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a83fa24d480573661d51a0ac12ea75e5b3d18592 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d4b6e6239d406f05cc464b696a0a877da0ea9dd5 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/22036b156707ed49d7665cf6618a8170a0f57469 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/56f81fc623e72b6937add38ee20353d57cc5ffd1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4c8a471df05327092668a0295bfffb6d56aced4e |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/388b8528c1e16c42e557db55c36d574c6ab89f84 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a47cc02c7d209ce0cfab5e2345e9733cf902989e |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b4432e1542b978af3e5b951640ca21238d72110 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b0ad714959d2aa75ddc4e23d543ed379c42ebf28 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/82eb5c7c57abe4df54a0a32e88d8a7f6cb049167 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2240a3bcbfd7c6cd5a89ccc4d65463636b194c65 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/50d6c8dc44101ace3c1b1918f7ab2ecea4916b7f |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f1979cf23b2b8b43ad29f7de53e131bdf4e56cd4 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e2a085c424724ab56ee5fa0aad3a3c65be50a920 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/667dd0e2d350693e2263a37188ed8a189fe9aeba |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2e464257e166229601f1f9ed185226ff0d32e0d8 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/454796b69cba0ecf3b82155bc22a87794bfafd41 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a625662cdb61939b452ea3d483e717ee5cb6dad6 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6f9e583a93462f9c49f67d8d4c058c90efea8adb |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3ebf2fc73cdaf646cbd695babd0c234a07516901 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/80d1147010ca7364451128a4bfd29367574fdd95 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/56365a98cc6b3ccf3229885f53d2929b0d0bf03e |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1fec711e52c7d73c09eae2b9c07aef76c1986758 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/805ccabab7d218e004836b34be039aa9d648daa9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/317b9fe02d1822fd637313046e48513c9c9de3a1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/da9b69c1332f336b33aeb91a285497773788ecb0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b655827772a426961c9656dd02a69cab1b7e5e2 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/065c6137e1146f7b2113481bd6d7b40d05eaeaac |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6665ab15b7eed8e840c9fa010658c861d2acf724 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e388f0f96f029491cefc6ac73ac79b2aae0279fc |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5402e3fc676f83b8bccdcc2bd2b7836b72bdd7de |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/55eeab0b1272c63dcb3a0a5a1bea97212ac6753c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d69c82581db6f629cbb40005f9ffa6e58757a7e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/93bcb687eecbfec9fbe0a3b8c433ec7dfa5572b9 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/eba364a0d69dffdd54ab55748b1b7084ed585518 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/700dae45c505bb031ef61a8e993448c8d1c99d57 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3e12edb52256e728b5dcd0cb6dcaffaa39bee626 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a07340be24f2e33f8af040c439555ddf555bfdeb |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ad959b6609fc1910e5b1f82d42a764f20754e108 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ca5584450e13b3fd2c29f93f17ad4038aa14b3fb |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f7226d710388e3b2a7cfe19b165bd447ca466951 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81e983972cdc0a26aa2d6ae73ebc4c6ba0876671 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9f66af1d23af993a06cf73b05b910ee35fdfeb88 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ed895d7eb8581994faa3ded14fb2defcb9a4c1cd |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/969aaa5cb6667a58a53c7382940eb7d3390fd8e5 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa50dbc9628767aa3753c7829ecf658f79d3a0b7 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cad1f23d1f9fd4b5f39e451a4c8f0b83dbec783b |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc672bad35c3ffdd5347f45a949e42a2bef55c1e |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77db4687f8ea8d0060e2e6483b83f8d115f5e93e |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/affdf702c48d44f074dfd65818ac56482e9c2a19 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/13575acb9053a5e0da72908e10b2db659ee8dfd1 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1ba7f197c6b77a729623f931d4e81a2326eed309 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6753e1059f6b32129f38ce08ea15286ee349eadc |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3601d74886cb4087b11d6fcea0bbd01d0a0b8e04 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dbafd2842f24661a7ec8ca5a25b54a4153b10933 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77070a10ee3cf10cb261dccf5417361ff72105ca |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d607e5bddf2e7d88e7e8eb59fc45436e7808394 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/28fa181dada2133ec6c0c69113211d4d60b1e7f3 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e16fd040a81f68414757a8834f0e26ebe96dc7b1 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fbea5c1255a1948880ec269e4d3e8acc3b0e2c2b |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1ac757ff6f75698873cf2d356a25ec43843a9698 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cb61035e7f9ce38f75e408eeef5a203be795b374 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/215ca198b907d1ec71ec1d38839ad42f7e65d1da |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7ccbcfbf72a603d0dc33fa2072c4178be51f5d03 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2be54d937364539621c5c7fc09c7ed4bcbffb645 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ab6d9cd39d6d8e604728f300a143c9c26deed4b6 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3275301c09f4a09cfd98cefb10314e3c8acff3a8 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e0da3b4912e4e35f8fc75824d4ba614a3342d268 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/28290d73923ab808a5a372a649807a92dc96a038 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c3de2cf2f7f19cb63d8a53f612dad10a0992dfb1 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3ec8cccaac99e3c112f7149533999d1dda2382e6 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6f6a748eb6326038b189f30804da577b976b1552 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d51ce67dfacfe85c8f8c3e846d12e1a22d64bc69 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/028caa6694966dae2b2f70f2cd0d7288e124d4be |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7242b04329e791612b30d7ae4707aaa9405cfeb3 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d865ad8b0753cc95cbe472f8350027d3ea16a51d |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/474fdbc97c630690df4f687c083dfc1541f9905c |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9074c65ff74a341b874b4348fcdb439b1cbbec4c |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/80827971344ef0edbce4fc228c724b8cf56fb7be |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3861b48c76261743d46ad4ce555252f13b3a5935 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c228b446139fb45cca74697bc7face60a6f09d4f |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bf696ef65a967d01b42431e6fb0125be6fcec10b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6cd77665c1fdec42290c2603597102c06acd807e |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/36454ce2685ad4ceb7b5d00157945df4616d83f6 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7428f88600a65c68023286e7c95c990bc8dd9829 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c5c660a5ac69cb06a1bb39369a6dea4b836393b5 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/021c5b7eeba1002d2a1f2e4d98b8e69aeee978c6 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f00290cd095b85758d91bc01cd3b125d63606781 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a055a6447db9a496465a432e9e0f7b1a0e1f0d8 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/55feb9a8b95e5e82cea2f3287ee8e05179385a99 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/525618e093a1b675f488e54d0d871e2ec73db007 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fb87e086a3aff779fca91cc5988bd38e1529c5ad |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2ce2df7deae0cff85b583efd9b2ac361281334ce |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d0a61524b56aa8dcc65e51fcb1e0771ac88db86f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9bf230a42a933ced2be502ab5b438a806f18d718 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/20f14f515d7184f49ffaf8556c550c9d26ae4cb0 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/08f4d5a0480523c65858b3ec38bd5cfd1550d619 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4bf4ae9b16af210e43ac829e16bf63a42d77ff91 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d2acda41c4542ed5d983cb2209283c8b3fc71f8b |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4f90db78ee473620ce4eb822cc84573b76b4eac7 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4b651d7a2583c3401537e459987897430d9cc501 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ee13da103871712f4eb62cfea549015e2f61500d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b7ed51d61d328dbc192c2afc428c47bc3b0f322f |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5d6fbe6556c10e95a2096651f54366bf5f4277f0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/99e6a3970691216d2041c5ca430c3a8463930815 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d5d6fbc2dc199503e229a3f892c13c553b2b413 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d91d33bae5eb15228c8392ee328313f3175864bf |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b04ebd2350ecda381d12c2b972c45642b22414b8 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06a6f5bee1dfe371dc1a5c76f970e9c8984ffed3 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0860ec2c49a4da2aeaa204154cb75f41a8160709 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bddf565a67788036065df9129648001cf1781a29 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8ca1c2e5fdd4a45466ee2dc4842fe0de02162c92 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4029263abb0fab41d1f754e5ef712897dbb71377 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d19202a7d3fe4bd36913c4b517d660da8f68dd7f |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/54e756f55544e677889ddc54176e3c34c274c0ed |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b1aea850ec07b3a6d12367947e9866d7ca184b53 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3c8d69cb215215a5b8cb3ac6a98f8c3665e76375 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c56be5ae180078ed90724bc93f4d23183a3a07e7 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f562bf06eccaccec2cd75f3a60ab71431326fa64 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dff170145c8010bb456f4ac526361d0a65919290 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b7e6b378146778b6c72389e03b2e9d2cef10dc7c |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/deacace298ff5124f101ca7090127aff1216f5d7 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a2b4d3211ec5c435e3aff6c8ea76bebbbbce1a23 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/78d26da7ca259de55a36ac18e21afa480a6a79ae |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f85a588779cd3eb47b825a5154a1e9e612b95f51 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/16458e3c3c09cdc971478c4d06616f4697f786c2 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/870002e8a52a5db5b894b5bcb9201f2631b4766f |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e94bdbf24380661951181f4c99f6fe785deb488c |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2804ea26ad2e840a9abcea2c3b075a443f5c6510 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/05644f5ac2df7de93d0b46c3c6c2e1c213b2322f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bda85db67c1d55f7271c3e424c1c2f723ea54cf8 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d56b64d592d8b07116c381862f071fc9ed624de7 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ff6814f3116feb00211c2d0052ef5e90b47e06bc |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7ed515c59bceeb61fc334635e11a7c5e7cf66f3d |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8f30f92104133e8427a61c27ff349642c02254be |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1c71cd7f67137e29ee387a1632fc7bda70661b23 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/75b885290ab821cad551605fa818a10344587762 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/052037bc13e084922cb3deb1cf8b4f93f7ccb1e1 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8a17be8d1b29e6da4e7f3f873c9553ec219231a3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2c6ea478af7bd846097a1bb3ac66dd78b8bd6cbc |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bce18ffcc284f51ac2538f2b081641894547febc |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/94cd8772fb5bc8ce69a5f92aae20362d3ba1e0eb |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a7d7d818a92728b488e7ab3d8a22ec9e5b11043 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/527a7fcfa103ab76bebb76d9983d7f2728809e54 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ed3a2f8d6d6378c78db1fb799029f0ab7738a492 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ced40389f02b1b4685e4de6a835ee31c436d54e0 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/10a91327c27e0749c77b308459ecf2517f2b868b |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2b88cad0e662129760fd7a1a2b7a4e7114083317 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/34e99a3dd2f23b5b39b5b81683accb73eadc90b0 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/49ce3c1edd8cf5e3398416b040f6f4cc608db552 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/612a4562b3388cd920d472ba65ec7bb0a47a45ad |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7a62c0f719bfe058d6205fc30cc574a24dd187ce |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b8a5e60e79dd4a4667e92218b1e38968c1e08d5b |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8618c6cc6efea9acc958bafebd6742e1deb1de7f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cdc1efdbb633cd3f8587b15c089ff9c2cc1eb67c |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0e1180da706eb7a66e33d44d4efff4445729b644 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6ff9264c20f78eda79d0ec824d445199e08bc067 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/62fc056703eb6447db7abf21828f1b8e0d61759b |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8de2876f6bd1bb10cc4f2a429bba8bd8eecc4e5f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/723f2e2fc94238670511c9e044d2231eb422e73e |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/de3a627cf01a8985620c544bdbce84fecec6de5a |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/36b4735ed0e215d72997cb1e9c9a088c77f2eb24 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b809da28c9afa0c1738bd2383f9568b3a1546b36 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/08bac13d23b8d1081bdce67a5c53c1e11b885c9f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dae4db6d2978a59b10a3e3acf806c969d18c1311 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/74bb98c02a0de239d5266a6c71e9455b2adbd440 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1fde4eb12c36ee30e957b572f6a275006a8f26a7 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa150f523a118cf3109635f20b2578dbefc0a7e3 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/58396ee744812dcbe01ee7cfad32c555cf3fdf04 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/810e6082b81aaa6b51c9e6b0a98ed86e2a536ccc |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/870a1e8aeeab02bb7f0d8d83c7193737872dc6a3 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7085965c793cf2a81b53eb0c13e1128d3004d6d9 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3baa2a62dce2ffefbd59e0706d999d98e0d05f87 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3fb7862be8f8c4bd80879da34d78b5db08cf56a1 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4192fd02bf20b041fdce9ac4209a3caa3ce3162a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/da9ba047f99ee3acc943035dd0f80171c4af01ec |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b704ed9236b31e5bd028bd92d73ff446f1853caa |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1c47b2a8cc4dd062c5278a6afc63053d4aa8e33b |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6e2bb59e661b31e655840907e096b4b8e77893d7 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/01bad47526ad2308b7bc10d6302eaf89dca3a518 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a7f42cbcec15d5a49677f406ff6da7ed43d6d06 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f24ce93830c7de5305af8702a2505dd731cd3c4c |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9e34bec59314339ff3ccfcdffbda4a152d5f6bdf |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc54cfae9b8433dc1fd4402e66da7aa40f54866a |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/02c20f17d99fb55e4f6f2922752bef4a6bf20f3c |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/27c9b10f16b8682eed37957f63ae560b3edcd6bd |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/df54b06cefa88d18e6367a7c068eb1b35d30bfb4 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5e54c95c5115e2f5df9af687e5b29a5d4d0ec386 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a337acb107df187d5fde3624723603ca1d55907 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fa00fd990f384869d785b228ecea9d158af9abe4 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4cc8e37bcfa39dcfc40281e86c699429c0ab9edf |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9d7dd9b9fb7b76ff58ec13cbe204fa23ea484cd5 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4e295e922cda3dded1597096a58bd233f7619f09 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/09925536493ade40a85bf0d6b10a487fe16e23fe |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4c022e981e85e79212515bd4a24c4f43326c5092 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a000577e880578d0447b0d3fc06de57abbf8952 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3e7bd8ce9ac82e34824d8023c307b7f39da3c95e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/82b6753bd17f9281cfb88ce1640f578496c630cd |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81e7616f9229f223cc3d4cc29de1c93693727e51 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2292e9039a39abedb838a741880e6f7120e31098 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/98ab76f5d0fc87011a3d488d18daeea963c3a1c2 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d71c9d07d37dc22d09d3c1c9dcff4d88b8679d9e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/15f8f934eb0f72c7ee14046c29b33ffabb0cf35d |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f471f9dc1355a22bde3380c43a2eec1d8b6c83f6 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/31285affc2144e4e1286b3895da65aabee36b3d1 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f0cb7921e90b2045afe7cd2e13964a3d2e39b5fe |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a3d835692604f954482070d14e29319ea292e4c6 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bed6310be7af6ea235904a795ed834b94dea0e62 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a38c916e56ef91fce86a1a926366154b90b48967 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bd39004ac88ae995c0c15f52356589ad82e6fe1c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/826af10b2142d5e6aa968e0fe7fd6f6f13c07018 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2709e7283db26cbaacec5bad8f055230c142a9ed |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/007dde1531ba59df0743e351acd890d31ffdc9ad |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1724e9fb3a25f98f01eb824dfc1e83a2d85c04b2 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d5afbbab6b24cdb5d075be2306eff4f89a40b46 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5a1bd8a2e7d8d11a2ea50a423bd9ac6fed7f3347 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1b925383b8a37fbc09840071344ad9f58c315193 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c3d867cc863139da33dbeea3d4314e398b10ac6e |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/43d86ab9ac07c70a53ae409650daad03c77400dd |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d2c03caf268be6fbfd72193b18ee6b98ed40ca97 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/66c60e2fb6557b59644d0c7c1773d5694b41067b |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/78e26c5453fae432ac0d8c1dec116b1f543ce696 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5295ae4d8d94fc9c43b44480811b38486493ab1a |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2e8107026decec3d53f848f5e46fe55b2307789c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b4ab5d8340a1af3969534fdb63330a4a3d96ff38 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d4141d9dccb5eff64ec0bd94463c02e16d32ed7c |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/11037bb9894d89434d1c93536d06040bc144aaab |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7e00acab1f151ab155850ace5713760eb7758f05 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b4a5abe0a68da1d282c94f9f5275f358693256f9 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9caffe95ae7016f44ff58bd7821f9447dc150f6e |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/79a5ff76cf5f0fd43cbab497a4c68e8d178a9771 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a7d3a3055716d23e27b185c4708414e3fe621471 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/64110ef456e8eeebcf4ef323a057c9ee33bfb7a5 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/13faf750e76074ca1ee425d79ecba642a7b9b045 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7acfb1342735ba2d7d9e3a663f8f2a5773c65d37 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/50c72a270c63bb7ce11c3c01a9fcbc829edc35f8 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a5f1208f51bcb2d8477b4b1d627ef09e73d244f8 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fbbceb50a153660d187a32c9edef3bb0e0986b2d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2ac2f04ae960f1c359f51c3f0c1b3c68e207b8fe |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5a4ca66c7f8812ec75fda5340410919beb8fd56e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d0f54777aca66898377b1a77c8793cae7f74650 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/29af00d6287c234634addd2eee482d6d4a02a8f3 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d803954b48abc3ae8b7ebf0da94f4846f4e3906a |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ed8fae8618d0d63d5acd3f35414ec5c37b3833e4 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8c4a10d69dc865618a9bb66b58787fc2d0a9726b |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/48029d0f2a37b94cc20e50e40adfe9ae60276ff5 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f7677b48070dfaefe2594528b6fd88ffc4ff2ff9 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c235409d4222ad1f036c56ba681d725b47218238 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0c710e6c33433d7aed9f280e17d1f5688c511097 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c8b5e3d7919e8592334123e10100b128f3ab1b92 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/10def57490ed0978e55c8aaec6117c2a34dc82f3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/95f6c781a26b2aa250228de1acff44af7445b15d |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/05d29e61ecc403b05caa48d225363b84d94a28fa |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c788239f5f3bdc261e7597b0236b697f6fae2786 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d4793cfdc8b955a0725d0ab4347769c675f3a472 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ad474e1133978d05d46d7c2d0f56e423d8dc67b9 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/80aa0e84db8d1eb3a38a548c0b921c01f1616314 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/529e00d617e07653367eedd5395658dd56b2e0a6 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81e8c428ccfc38b971bd484e6d49e4da3f895f3f |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b7394ab66798c336b057e59d1400a8d8341533c4 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3e3b3e5e2ea3e5e5eb0c0c86f8a94e93ca9f3c3c |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/98d98fd3710d67263c7f8e0bdf0d672278f16207 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f974c150d8fecb7dd2a0eeccd72f7a17246a0682 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/377c98189fb0db1c11116e5f6b452f6b78cc80f3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f39a3f6d40b9ef9bb7a2dc73c11c93cb68bddc72 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5bbb51b82e0905c1530fb545c72532e88610e89a |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4438de39b64198599ec82848c99e92f518a14d5b |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/de6cad5f964147fa4dc188c3e3b68f34d0707922 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7b9e76dc5503e531927a53add04333e480daca96 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/671fe60bff67206944d47a493c677774cc500712 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/716d67e85854040928edb24439e4a411f4817096 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aba33b8718c95e534f302467eaeb951061965e02 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/df9e602091df33117454cbdeaf0d6102a681de60 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e10ba848531d40330f2e431cb7888253c6e91078 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0c765420a8b6c44d792b4722c552c56d87ba09bf |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/39beec1be003a32587d58a38b8bf602eebb4ec4a |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b3dfb8cd7c5706682f2999a77871adbd097f56fe |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ea4674bb5ef8c407853bac00456984c72d7ce050 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/66d35ebe4f02720c45bc1fd4d4f0942ecfd31654 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/def6115bdfe1c44dc885ea1f69330f8e80e86242 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6c6a71f541165c09d88081eed59371c9c1696fc0 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/018d9d06c0ba6c3b25d8fcbdc9546ef7578287a3 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f15f8785551f691662350bd22942ba171471e7d5 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/562469946e7d2da400564531ef8e0ab2c501bf8e |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bed1856d3b61e6272eeb7b1c6203553809d564cf |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a33ddbd13a03d50f6ba6447a9fc5c15128d32ff5 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5e20495a7f09a6601864f52969cbef60f1287ac4 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/665659a97773b473009096e431b5b98a91cc8e3d |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2339b96f9730f0c6193a9c788aa157630aa6fded |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9ee05c7d2e6067e513d689e0a1542f7dc2335a2c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/35710550d2a4cdcae970e2bb28a1edc4ffd7824f |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d656b4b9fe4a2c87b0f1691fbb171516a3d2355b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9e7a40d47a5a360b8ca73c2499c1af608047a908 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/13e1caeeef42e7365bcdc600dbdedf0386be96a9 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/38df4aca642a195c77c0a4394cd9bee96a8d3196 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f411ff7a56e8208125c5ac0d3bee9095ac70ed36 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/35656701735b986dc971136ffb63d522904e694a |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/701e11d519a4e1f51e36269662f2cc9b47330ea8 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e75b4a3ba97c902845633d34447cc71588fbe233 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/20ef3dc3549e1df6b4cb6ffb927afe9a6fb191a8 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6be2f1863039a5712e11301451fa04c96bf935cb |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9275708802e7a1bbd8626e6104ccf9f14de063de |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cc6bd4da7f0a49c6cad55bbd50b2794df3b24a53 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a6a06b43ffc4c7d78fcb2ebaa36eecfa4ba92996 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5164220c90db376d024b225e99775540d33e96b4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a7136b18d2eb3ed60b0061d33137128ec35f0ee6 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/60cc75b8520d498df1e793c83ef3bf371a8fb28d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/48b730e0e532133f8cdd150bbf39f6190cfd1acb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f42d462a939c4858fc75ba6fd1984282574b2870 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d4962a8954f2966548e52b460de412336abfb4fb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/59d0348238d5e24397c165fa22366af31d5a5940 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4f779e87bb7ae12cc5a5161c378482e08abfbf00 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ca2068317325d8a3f479690e18e19fe08516e159 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e0699ccfbb93ea7e3ce75f5529be5dd68fbe3cd5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/518f4b40f6150650e50d95e087c04232bd2d10c9 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/202f7ff40bcd82f8942aa251eb1fc3b45c341f1a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5f21fbd349c1b8bb902e3ad2ce9849efcba56d2e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1d38b33f63f8bf856be697316ff73db0b56cba7c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d41fe6ec528ca1dc4561f92527ebe893024ecabc |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/57c6910765c9c9f06e2f698fb8ea5dca54b12c39 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7bd3e20787435b1f965e45f1c70afc02afda8a3f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d84b244090ab75038970fee1ae0a2ca4124c13bb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f307b9b8e48bdf0f5c7b4758b66ff0ae87b43920 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/889099d9adebea039f40dcaf6d8410660341bcf1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e91c9328c497e5c7934356614bb80ffb4524c2e2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ad0324beaa0eba967d4b3ad807fea5e94e3aa48f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2d604e1c7a95509c452389cbbdc4baaada1801da |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0f72dc6e3223f330e761fb3ff50d1e778f55ea4a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d2ecfd5a4d0016c3f555caf3acbfac620bc8aac5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a23feb879e90374252de6317f0cf58ab5f341a5b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2951147d4aa4c4e04497cde555ca796be8f8384c |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/877ad553dd69ed370dfdc2f3e5e3f769c1b32cb4 |     
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/5aec36d1d0a4736fc1f520522ae3967d669bccde |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/25e49d4e29bd02aafd9fef093bc3d2bbc90bfa71 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/09e5e112bbaa37b08346993e0695cc307d121180 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c5fb2a8dc3b905546ef8ba4324b288c730a51632 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e1cfdc53ac468edbd7db03165c7a9921a1a5e6b3 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1f40c1d44f8a49c8d793413062efcec374b4200a |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5b5ad108aa38173014d2ea14a8c195787d4cc794 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/2a0f0e331f0df9262e5d8fc3d1fb7fe34476929c |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/67eedf7e4ae128511506b80c3b372be6aebfa7e8 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1fd8b23c83e29aab75ca189c009d556077664e9e |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0ee399c1fb756cc08f721812757d9c008ae43b71 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/31ad11c58b96050d2cd81944db4ae47182b5f496 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/82af2964a677166933065ec33935b2e2217b3dec |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c7fc77cdb68293336371863da8f938fbf7add857 |     
    mips     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8e66f5dd8c5815e565b29dd85696c75b5bb848f0 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/197dd261d7f90a23c29eee7a82bd02ee39ea6b65 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/43be02d064988bdf14930aa8f23b6b1f7fc601a0 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1a3234f17db30ee88c2244a692946b2518082f1c |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0c1a5f69e5e470e32dda64e5fde6fb340c1032e5 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/33779be66bcf44f54e7b4a6a552801edad419fcf |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/858cf2f7b36a2311d1960a28aa3695a4c094464d |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/4ed2715205ede3f91a1680e8aca3eef2c823206b |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/465a37547b3a202816b5a690ba74286a5b6ed90f |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e4e38d2dcac30760a978183a6414474efcc834d5 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/741047a6ac46a4528e34b223d888137d2a03281d | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/94ddf3a5bdddd72226bdc680695252e321423e80 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2ed701988a76303ae8c4bb2c8cd592a3f5f4b4dc | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/aea3f1a72cf5c15f94b8c1a16319d1337115ea45 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/192907341d05f34962a82c9af4a284ca4b622caa | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/0055a6dd96cce11bc0bba280618dd6cd5a6d287e | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/1fe6eca34edc98062fb70826df9423940a96a8c9 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b15eac89989385e9db0a618f4ede0eff846f88b0 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/58cdeb7cde69cef994a2cdd23fb280949d340806 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e957ae27eaecfe7ab1581d83ce14ff8e1d7de635 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a7c2d91249b7afbfbf65e138bef0d6afbfb7dd32 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/5854e2a772fe65a3c8566b080c03a0d77b965447 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/25cf1bcdcf69ae50127ff595a213f5a4999f1cf7 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/82fe2ec04b6065ed93ce9c98b51c7ef755e800b6 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/594b73613ea240520abd5a37002070dc9aa17040 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/6b829784460c1c6146502aa50df5b1c8a5b61eec | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/5eee06118d331e5f11e330dd278bb1eafefd2fb5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/7eacd4d0d06e98368cd5fd2d4bce734fcefa4d51 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/538e3a1516c33a4e3aa845030d9f4b0d04985846 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/931c2e3cbc8235015f30c40bc63dfac2a6a8de89 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/c1b07559d571bfa1cb2aeda33e54c4e15274cb58 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/1d31971387f842d44545ac1b4f7c757491ad2b1b | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/4cc9b0179514705b67bf1274cc7288b81b85835e | ORPH
    m68k     |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/c5215c42306d5a74d3f381fd859783dc080c1acb |     
   mipsel    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/337fdc4169f25b12d43b7f46022612015fe439a8 |     
  powerpc    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/3d53d610efd7e3003fb020b07cee65d2c7c03e33 |     
    arc      |       gettext-gnu-0.20.1       | NOK | http://autobuild.buildroot.net/results/9168f59eb9fde4332268b4c32d0e09d18337693d | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/cf40da077c7a95dce1870eeccdea745d930c195a |     
microblazeel |           gmp-6.2.1            | NOK | http://autobuild.buildroot.net/results/0213e7e279581a24c10777ee6e364f24223cfc0b | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d82d8b5473748a8c5973facd11143213b20eda95 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4991eabdcbf8a40b34112091707ca19c2ccd1274 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/af317aba01adeee7cb9ab1352bf572944619f426 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/af6959c3a7caa70b06f8278ab4398513f9e4a91c | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d25a0529933886e9972b43c4be179636a341757b | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c808ccae7380a14b9691bab7c293b8eb69b89df8 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/51c7050b3a748acc3929844485fbf6a33308fcec | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/60bc8376cf555664810ef14d38589d7400c1eb07 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/01095bf8e7838fceb64f587d2ef9a7d6cf38e9bf | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/de02e66b06c75ec7a4f79fc16943691715665aea | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f0bf5ea3b5f5e382129d5c88cf17a259bd068b3d | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/e6aa8143fb029e72864ed49d7bc2a86a26a90ddd |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/fc1494833a12d208dcd79162f45037e2e9480f54 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/e00142794b40a8b522f618d947d2dd40ade8a2ec |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/2e63a6a716bbf202a2524bec6e38b6502a1d1520 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/826378dfba36bfc31ca5d3db6a2be58ae00a66d7 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/e143237a0bd8518eb1233183fc46d5ab00f3fb00 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c8e22de5059c560c3ff4e969bd1372aded89d551 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c7d82ea422a12ef84803fc735980e75a6e412ec2 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/66950f5ee08e4b2f783a537081e0d2f9271792d5 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/aabdb9b8096d1ad32cae0a741cb785fa16eb34e9 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c0e9001688c2bcafbf548637744ec1318bfdf72f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/7429df38d9a28f5ca1247e85fefdea8810aab39f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/44cb63f6f9d38468e290290385065454887dfcd4 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/93f750b06b9dcb75055432e97ba8f4f812e21332 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/6ec16c7d06cee70f9c9fcdf62b4eb98bca415304 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/9b85db8d0d5dc0a071aa29f7a5331d4db6f2b7c9 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/525d0f3c802ba62ca0f744c8d8d621b16c691907 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/d3ed6ec5e168f7bd85994d112a755f8b782b8f4f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b9529c94a8d445c24bace17833c5c3c8878946fb |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/516cc16f79b9f412346094527ac51e87b901c154 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/5e5ed22576b12872aa494fbd4292c4a0f2171978 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/f03b21eb0c04139f8475ba711fcfb6ca45636186 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b42cc7ceda08252f4361b610451e4100bb4a733f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/f99c646c212841e068dea94c0fc41749d97542e1 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/a45e7ffb6d2992506983c601cd19ab6aab9f274a |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/3a704bfa1d88b40f7835f8a960c31fa64077cd4f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/fbc99acda1ddb7f839a3a11ad6ed94dca80bb076 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/4ae9bc64c0f9c7b9f80ec8f8c9baf51fbe7f4f89 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/8a8abbcab4ba9f8db90049afc899b9c21732c993 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/9ebc768bf70899e5c6b4a647bc63a4841c4bb377 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/81a33032be15444bd9d152e3a19f8732a32af742 |     
  powerpc    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/a22c6ea5033baea999c49ab8089b4d9e033bbfb7 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/67e21007db39af15b5ddfb62db539d47310f2990 |     
   x86_64    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/5af5c169ff766064840378eea73e492bd8d49b7d |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/e24dfb23d701fc2deedd73bd600fb81fe1a84dc9 |     
  powerpc    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/a98c6a4105bd491da9190d01d6cc66c38e073b5e |     
   mipsel    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/76b40406cd539b0a8f0f2b9dc5847bfa8a2f44d1 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/22aed5156771c236ee83e6021c2aaf26f9cdefb9 |     
  mips64el   |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/3b4f4a2c19696b32c3a70af5792a305cd861328c |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/d231160f71d3db6ee2c3be77656f5a7d1529cd31 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/47a4f40f99c10231dec2bf402c46f3ba1b5d7891 |     
    arc      |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/1420fdd23a04b66d518b7233726ac4f9d94a33a6 |     
    arc      |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/8fa3da654fdd9f848eabd3555f97ed8ca89a8263 |     
  powerpc    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/812aa222e86c4225465fd1be906300bf151e89ec |     
  aarch64    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/fe272f431dbae34cfb00f73f727bb4694676de4b |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/e265d46383dd31d5c5df479142b6e82064dd3636 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/854423d2c76eb5a7fdd7417560b6221bad9a29ae |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/f36cd11a575bb5da7b4092fc21dc36e8c072fd4e |     
   x86_64    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/668853175722bebffe360699e4dd6348e013f794 |     
  powerpc    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/95c0f44fac649d652f9d4a2bf644dbf16b7a8889 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/611916ed17c97bb92db924342681e3f880dd7f90 |     
    arm      |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/57b486935c18f7b88b7f71cd0696b15cec30209c |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/63ca5f15cf408312dde496abce80c1a1e2b4b6dd |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/b86445fbff0ee008dc2eeefe7c016d2f8101b93f |     
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/623e0962c44853c8d069d8137abe821f8fd79d60 | ORPH
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/5807df5285fb725e265d85d8a3d0254fd7958a1f | ORPH
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/ddc6c367826d07e3a7e258b9022e4c485f8b835f | ORPH
    arm      |          gtest-1.11.0          | NOK | http://autobuild.buildroot.net/results/93b7216b27cf7fb3b5961fdf2a552441ea770a07 |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/96fc411ccc0db99f5dbddfaddca9430bae7a28b1 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/f0e80cf4975ed1869234b614e298024cc3dc1648 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/35c5edbc01ab042d22a47e73ed78e83b037a2a97 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b221e0f05aeea25404ab8db9af979df653052011 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/61032cbda6e70a474422fc81137e42db082e831b | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b45c560b348695e6e6adef8408063715a981548a | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/ab49179025aa8d6ea743f93a798f6d41d10b5b45 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b5363c8901892193ab1a301fcd33e8bd4606868e | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/11b0fb5103bcb7be8fd0224a66cfc1fe7c624ce7 | ORPH
   xtensa    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ca962251d8a085ecd18b732a613d678951e57f10 | ORPH
    i586     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ae770fb4b799a1059008235eac653eaace0d805e | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/2889810ea3ee7c5d9e9b164766cdf9a8a88f0dec | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/c206e662e39b86e99035fae679ca1611eae09fdd | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/272b76f48c936fc9bbe0ddccb7894a495ec58410 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2584c37539112b781f2c5396aaeb16669905d92b | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/af53fc5f3de9f21d84825e768bb60f0d0793b1b8 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/e6317726b7ee90c4c7ec103902ce2ba085aa22e8 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/204ac14eb27a6fd706f97faa58007b8f51a765bc | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/daaa16eb774a5feebf3f042dc07e329bb1074c57 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/d19c58f997a77aa70b62840285f81cf5185e7947 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2cb3460dc317dbeb309f17d8bc42cd6f8ad31a07 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/7067852336f61f14a45dd925d4f3055f907dac72 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/db5808532a2ba27d00e8f43212daf311aa8b7b6a | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c8fa2a1c307f2bda73b874db51334e8882cffa5a | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/a55902e2b012596aacfd212215ff9392fe55b206 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/b8811fe3bbee91d88be76f59db9b5b753a3b514f | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/12d4a840c0dcb70c8aafece9147bd59ab0a104e3 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/066154a3c5c2c12062899cea74aaf68feea33fa8 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/fcff336e9a70ba1dcd49c1bd98034b3d1c120656 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/cdae4e57ee07da9be8bdc2196af9744853f1ac69 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/98dd7495e8390b861656fdc22aaedb9647b174e8 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ced6a8f9ae88492c0716576f44c940d8b3d345d2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ee9ce295afbee9160e4f8ea74f913621366578d8 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/b3fe639167d7b6853a9451432bff2b88ef7e9310 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/37221e729b337b9d9bdc532adfe68b0e688e0974 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/2611ca480f7916e38374864fcdc4b2c19ae58087 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/522942057f0f9eb8b04744e5236f77807973f546 |     
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/15b1cb94def4d86bed99c6c4d30874e2ff3dcbd7 |     
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/d5763af0cc3de73c1bf7d36ab482baa0cd1cb22e |     
   x86_64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/0ec9ec94aeae80daf4d4f68e908d453906d8a241 |     
    m68k     |       host-cmake-3.16.9        | NOK | http://autobuild.buildroot.net/results/606cf039c26fa7be8064e7908c07203fd111118a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e4f0bac0b94e6d0a9205bf03831ec00ae14d99ca |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3ff06945a6c6a8bc2b6f3bba992b9025e5caffd2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/76e77ae57682a0c3632f163144253cc0a087768b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3f5f663af65e97c34049730c28515cb66750558d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9521627b394f572eceb265920ca0f84a7b2daa69 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/be80f39c96f47fd9acfa7a0534103d2011696305 |     
  riscv64    |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b6d88a9472ddcee8eae92e30ff2ab5ba28d7a57d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1e93a75e5a496695bef89b685455e8501ccd3aa4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c5dc8f2eb162c9ba44c73c4b282c724bbd952a8c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/87de9beb1244deb88b907390d9adb2026f513799 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7b68ddacc625a976b56af9009ec0a21788003c4a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7409d50e616b001a3dbc9ac82049be323947b89d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d0376bf09438d1ead538445739929eee3fd97aff |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/923593be227911fab5cd90537edec8725f96ea28 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7275161ede11c9610d56aab9cf548c3aaa4338c3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1b28280155d970316a915ac7e896d0613da563b8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7d6ece1845ba466e0e00e5fe3d5d02be82273034 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ec0e6e289492c67d5e0781a62d8d4368e74824fe |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b5670023c9490fc79f3a86530e388cdefa8b8055 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d79d3a360ae1288623300eb59baf1cfcc4012763 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a981f8768fdd328fa75929c622aa72c940e25257 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b09e8ebccb34ab8cf614b3bde2779e321eaeb76d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dcd2cc3e1bf245af545b21ff37300468b3710728 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f039fe60cc56cc522be60b282dc779e3baa51f6b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cdcbc5e373501d3889533fb864a73dc4c2bc8b08 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4d05860260b99c6da1570830c255c3f3f5b9bf8a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4be2b5c9df6759dfc0cf8461e1d6d1dab8a64170 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7e64cff996902e8a2e2e8d0f3dea7054a68e35f4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cbd8dfac374a32f96d8339616028486b71b41cdd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/72bf700f22db18b90904410a07da9b7baa3c7b8a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19dd60eab07dbeaf8b4052916b3c886d31177ce8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/068523ce2c1c9492a1d128acd35d265bdcc2c93c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ec25648e4e45a703ad3cd770e451f0b7197c3445 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/30da6cdec9b716b54435cfa89d2c40873e80f0b2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/18446ac832236a7b63aa73830100a20804cdce06 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7d2d418c346f058e6a6caeea6d1166efdbf025a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/33cd976b0b47120b6a89d2b5871e1b8d62d4e620 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e3600d82ea66a78aeecacd8e648dbbe4afe7a252 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/66c7c24f291977e310b435645ad6969d29c06d47 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fb6650df08ef8ef0d917b888cc0370b40b661fae |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3430bd9cca577b2f76375065e32588b94fbafd0f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bb1977d2b761dbd21f365f5bfb7b3f9d2ee3e3e7 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d2e9a277a5e5a35c26d3bc0e8a00f63a990de269 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/468d5a916f56b2e9c10b4c3003d04952006c1791 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/247b1c176761d2245d6b3d85a441b0a0c83db0bb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f824e3a6a12ab37c76eea480a06e016e090816a0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba5317a25a7c898c23af3e1c062b45838d659456 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/889c56885ecadaadd99e3aeb9d2cfa8a7d362234 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/adff972e3ded2b312059c0d6ad7b49f6b8fe23c9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7e750cd75ddbfac30042457ac3ff57f40fe449ed |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1db6693e2d05a05936a50df49803ec9117bb5c4e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ab5a5bfb26953b1643d73f1a47dd91abaaff8cf5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d217e916a4abd22040796687cbbfab05ee47b88e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e8d9ef348e74b548e353a5e1e559b7da29b22265 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/298fc5e04f255eefe4c54e7f703e7c83749c6fc9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f4eff143e1722918dbd2f4fae5bb4c8e0feaa4e2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc3db3c4a94e55399647d95137be5d538ea794e6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/159a82d75158b1e9875ff416b04388f36c025a55 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba0948abcffa00c8dc4db9e949b16b13e95527b8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a8bad0731edbe62824655e4322af4a3b3d5486f2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7e0844058ade63c74473e8408ab092ef703c1f8c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4c8d49cf0d65154a71af0927334f0abc0ba0a4d2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b7c2103ebac115d7a2cfe3e8fc714ea1af6a9a18 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f867aafa6bc97250b93b766c90bbf73af8ec0600 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e660fd7a5e92de327f87a3ef0196287434aa3eeb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/70dca3962b9ec30ea6cd38d39e611aafb6f94336 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8ac73a92329dc390678cc04bd88b6ba84467a467 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c23498fc10b125cc58908386d935ff9d52e75cc4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/21d8f57c3e07498b7c2ad61dbb92f41f3fb69ede |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b84404b5423cfc819bcf2ad41bfa71a0dc758b7f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4bf07d3fd51fa0dd6b5326782c5e89c4a5cb390e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ec7b04198706006403043f6e27e8cdb7b631a69e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3adefc3541d6d8a1f621b458abab9c4e828c3d5f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d75bea496c5e9ee4b8dfd24e597379e5af18317a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0b82728ec182d02082ee9da3915698c3c599c836 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/69659beb03255f218de0eef51e64e720b1eeb34c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c196fb2535df520965c6dd487318c33cd38d658a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9fe4adc2eb8ee83f60eb737296c9ad4aa82124c5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1117edb86e457692371e4d9a40e7da75f0e90e5d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e6be4290efd30d9c229affa7a8af9b5e0670cda5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/309c25eccf326566854842f22c5b9745fd9f630e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5cd915123f21c73b5402ae7e1d44a64ce67b70f1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/86cac859709f984c42f4516b979eaba44e744ddb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ed0fee7804d481e4790549fc8124d57f4c51ff4f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/adbde2f2c395e0b3fef70c76988b01a20cba9564 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9e27958a0808eba8fcaa9cc76ab70377e4e0e63b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/aae98b6fb6e8de01da1cb6697651119f3ea26188 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ef234cae66bdd9cab217b9b66c02ab0ea0b3345a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/35ae1000d5b89344e0013a71a8571fab4e6299ab |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fbc464161b72fd247055cd9d56e0bf6598329ff0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d181f6024e0f02b17be4a14de52226e09898fb37 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0b64dc175647090ed64d3c9c189e4e9878c8f335 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2835a355ebc01ce6b9ea6356434fe117de6f0e8d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/355206885dbb8dfcc6d9bce0f302dbc6c4d3e690 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ada36615810e6fbde58151139fa44a010556567 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ad11cccdeaf8ba18d97820997a8468bd2ca16314 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e413f131583169432e1d7427ff4f2d4dd3d2fb70 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6ea7e8c3dfd6f9d4ba38006ca6d9376078ae6f0a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/79019eb6dddd9b1ce78ac091632d7abf9b07b523 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/64828a3b7f5448a89f0cd3ac663a6304c414682a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9e60fccf9555a17b48944e29f3bee91174fb1e69 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b90e1664fe684473ce85edaee3bc68a001a04c34 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/23ff108d3e52e4b33ed9f806e559357edef44703 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f97ac4de1c6082f4e0ef4d66ab51df35b2ae7784 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/45fbcfe408074d67a0d2860af583fb80cde0f4fb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3c9dba002e0b68fd2d8379492d4d7f7ff374acfd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2d4ce9d07156c2bc044a0d02e543a2a9f0c67a97 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9ed65ff7a615b7142363d7843de19d4490fafd4e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d022842b54fce719e2bc433a814cf176a90f437e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/19b8acaa53adabb4135b1f4f3c0992b27145a3a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8c8908ba13b6af57f147feebd9ed1b82a8257482 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/05c1418c3c2be6509930d34686f97109eb274e5a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b07161b3cdf40ff57bfe6d39f9f646d99d9238a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/88c2493eb72ab5e5cdf46506857e2fd0445b7a75 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/222df1230fea936c648fa433c375b88c3ca3147a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9a40d2d796eeb93175ca18d3cecdc7cadb4cb550 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ec79869eeb5200141d15e43703391f1505bd89d4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7d812214a03f3262e4f84b6e52683df1bf31ec52 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/35bd623000f05d06fd5b743457968db0a06a4be9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8e36601adcade317ea29f5bf04ada66509a20163 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6e707974d339275ddc43412a1fcfca15b2aced26 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/02af304a88fd783ba67f7721d665a36a34e3f848 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8a6e0252bc79d27c76097b0285ea8ca51cda8b71 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/473b85e8171c27ac77e124d3735640b16c19a4bb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/736c201e74ad9a5b8f1725fc7859bd6b39af4a35 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/20e5269c9c64fac71e321f6e486f83fb5012caae |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2bdf2a9f623f4999328ab9eb2a36b5ffae3327f6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/84bb1dc7380d3f0dc792ac3745f30b522cbc9ab6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e53fa626a6471258d3b70f21622297469eecd4c3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fb035951e0d55d7eec1965ea0ee9a2225ac69ce6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/edbfb254e57119d2306dfd6858b57f4dc2cf5f7c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/88d3ec99a73921a90424241b5b8c08831f9d2a12 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/72fc0e08fbd6365ff00018a4dda872dfc9854da0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f1cfb61da100f3a3ca92cbfbb55c8aa04928c2aa |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/124270d40cc1e386a4bffeb5232ff7a497786a3b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/57585274decb4a9d4df4b62a519056e2abe040b3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f6f9cb3d3835f16b186cff7c90be41fcb2cfa814 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3a75c5cfd4ae92c36031ca21a6a3117813f9ff4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f578bf425645eb83594e42d4af5ebb7386336edc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/013e96544f8dde07764402b16e10b69fd9e7608c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0da57d607890d0ff8808142d46a833760303071a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/27685355fd9157ff5c1c874d626e13b7bd970e1c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a27140db96989bcd17364329fa9ef294e41a9041 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d9aeea583278958b9b17cdd43789a4f6e491f34e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/240130d3f676a0a1325dc7e8a84e863329d19795 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/04dda20ae8911da673144a88e8b6099bb4830089 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3082e3b5e760e76846536442531c3429241cdae2 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/92f626b0df81e480e7087c6b77e7b6ca62224d65 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/255af5fcfbca8ba944ec76b69f8a36d9f09b01a2 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9e9386cd33137ea707135714759eadd55cb55641 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/e4661f916edbbe6d59fca2bfa74107303a3c1982 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/8c352e840832715721e57662fc40de57379f0e3e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b640adde3e6417dc3084a0d6ef7ddfada7ba769a |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/52ea69320da5e590f8275910462a4a73be3750d4 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0ed19f16d7a7bacfd4f94eebcc6944a7b68dd357 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/93d1d6f87782412017e8c9cc51583a07774c602f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/dbb383e95a5e027bc0ab4192c8933692ab9913ac |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9d9a6b85b627e3a701a88c07bea0f8326585931e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5410515535db98e9ffaed77aa377ec25f9df3753 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/27a73fb8072809cd33cd61ffcc15faebe46e9e8b |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c94ae9feab3e799ad6a951f412c52543b447d139 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0a5cfd271f18b26fbb4bd5833c965a3a07705dfd |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0ac8a193289231f3b5dbd401003c36dbc0e3d1a8 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9b1efdeedb5bdb5739cdd9d02bb8e7ca66e50ee4 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/551398ee48a3bcedaf70b9cea93a4aaba5253fe6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/fa9189b864f80b7a6a8e045e74e3c05b78a41ae0 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2f8313e6a917c972dacdc81df9f3886030994a8f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9a4c51abd174c77de47d4a45456a73d9344773ab |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0849e676c488d87ef9e709c6157fcc28ed22b867 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2a683696a17f09cf2b8bf7b5b28b3d375e30f6ee |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9351f23fcfbccad19b7f4dacd7b35a1395ce5ec1 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/fe0b05ff4a134945b4081332488cb7ea5960d5b0 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/67e9cb05da58eb8a88a00634db2c812704a8bc3f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c0e728071d9b7a9549e98abb039c56a444cc0ed8 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0aa2742fc668d6d30561af9e73f3cf750325c3e9 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/885428e553d23ae2deeb000f3effa0dfc647209e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/94e0aabd17b5fc010ca264a2d38e79333d13b3ce |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/393f4cbe97832077e94805359eb1e5c77c582552 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/a92d042922e2890b4b7b44d41ae72eec5e285048 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/7f47851f7e18c9e542247cd29647fc63f1510347 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5ba69b10990ad6a045bfd2c6767ff5583c8bd5d0 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3f9e7ed27beeec68240cbb0836e3ec831610f947 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/39c164c063b411a76ca00e4a8e4c803ba7c29952 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/cd76f5ff3db7480d8d8afeec1f4970c5b93ff0b4 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3e9ff8b00c5d1dd9271c8ba070cdd72bbb092e89 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/903e7d0c781841e0e7e6f724b4c6adb1afaffb07 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/69e1202576623c23b441698d68ed1609901142ab |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/968eedbde69a9a26d5447d114de8462f834d52ff |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f06fbbfbe0d9cc01c52548b4cca416591b47d73f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0eceb7b12cea119121b0ea4f91e4315c261965f2 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/410d74ec4f9bae07792a771a2b7715665185e2ab |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5f689544c9a20ce03d26fe5d4b2d63d20575460f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3b8e3d84beea3b0849663da6e68e9662ec621e67 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/7953123b413c241b72457c962e149acb6f0bd8ad |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/8b5b4a4a75fbc787ca580d1ee898c1f723a54f3f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b66c308866c922ddbaa793999ed693c858e72cdb |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/779a1234af7e50efe1ee115afa612b58981c1282 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/4ec060b67b4634d6f00e952173b4d2b6c8ab545b |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/cba15098b82d7ee72ad0000a813379f63b56c9e2 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f0a6b8a7b590b63d29bf46e4bef2570fb8cb6ec5 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/e4fbbcdf1791029f7fabf766e1ba51755efa76df |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/34d72b2630ba07e407a3ae0da1e56412f8d6415b |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b80c37ddacf776c036f26d56f8039ceac08655b4 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f399baf0ce040788278d80d94ba5ef3a643dd93f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/62fec4c5ff7555144d038abe1cfa3032afa0aad1 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2f10a602743a6278e485eb115e22da6a907b6843 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/71f88f5300748c342b95cf5e2cac2d5010144f95 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/d9edaed7f713b0c28aafd6ba85742ef9a7cd2640 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3e8f8a5108cfcd6a574bd12fb087e90b0d367b02 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/26f36f43c5321b442f6d661dde23b9d129a2f4d5 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/d890467763ec9b842c61e5a0e04ca2e5fbbefaf0 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2c3a584627c1299f4074ec6a794dcd8e8df2a601 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/2e2856794749845926d866acd91232579f337205 |     
    arc      | host-gcc-initial-arc-2020.0... | NOK | http://autobuild.buildroot.net/results/627c0dd1ff8782e298d1f94ff8bfc0235f3df789 |     
  powerpc    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/6c234daa23d6fee5c20480603378f8d89ffb7117 |     
  powerpc    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/7c77344670c66cb19f5f77692fd99f79eaabef34 |     
   xtensa    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/a91713c0a100af18a0827ff0b5fcd0a909fa521d |     
  powerpc    |        host-libcap-2.51        | NOK | http://autobuild.buildroot.net/results/a4af4a2b25a0e0fc3ce9e43446f5dbf5888aab89 |     
   x86_64    |    host-libtextstyle-0.20.1    | NOK | http://autobuild.buildroot.net/results/ddeda41975945383442a88352377f8a7195c686c | ORPH
    arm      |  host-libxml-parser-perl-2.46  | NOK | http://autobuild.buildroot.net/results/585367527d05099a16e433f69be5f5251f413d93 |     
  aarch64    |       host-ninja-1.10.2        | NOK | http://autobuild.buildroot.net/results/1e617f57616b8105f4eae54aeab053eb5243a764 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/eec6b8b530545ef68c3675b3de4958a72f045817 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/07f3e6ad821102ed84571795a9de0b1a980d33e4 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7c8e45eb6009ac86d128dca3bdaff816c951ace1 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/21809ade19cbf01a56e74c31a484a826ee06ded2 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0328f1948a7368e4f1bfb76c2382ac6fc295f070 |     
microblazeel |       host-python3-3.9.6       | NOK | http://autobuild.buildroot.net/results/59457e30fa5acb571724fa30b240cc3c407f7338 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c6599acbd0975bf47887193cad9e93252bdc7a29 |     
    or1k     |    host-uboot-tools-2021.07    | NOK | http://autobuild.buildroot.net/results/fc0b06acbc99bce6b7ba77511e14b8dd7d0e7446 |     
    i586     |            inih-53             | NOK | http://autobuild.buildroot.net/results/28b8731b3c06e303b5b4224a6291080d1726e9bc |     
   sparc     |        irqbalance-1.7.0        | NOK | http://autobuild.buildroot.net/results/577a63432fba2f9ae1ed2c6c2a77c5ce54ac5521 |     
  sparc64    | jq-a17dd3248a666d01be75f6b1... | NOK | http://autobuild.buildroot.net/results/003e759589410a2f26b9b49c67a5cc5e2c2a6f48 |     
  mips64el   |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/835a776b1d8c60bce7c632c2883cd45d01df24df | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/4951b887f457b09b7befdeb101cdc492ffc11a25 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/4adae1d68ceacba8d7fbf9b180758ebb01e8d463 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/16171c18193c2e10ad815eed279993097b0b016e |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/be05289961ddfb97717b76ded6c14539042d23ba |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c601665c05b2f22f71312f95c0b3bd4285c6b2f8 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/609f191e18b2adf7a7831358eebbf32a6d23bf70 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/7d906fc6c471fe59cec9a3fbc7d7185a25d6b4ab |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/9366c3e3dfaa6bc881975613791606fca2f926d2 |     
   mipsel    |            libexif             | NOK | http://autobuild.buildroot.net/results/c6e80f3b9ff74bf828348557ab0e0f0b9b6ded18 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/f153cb66de802d265955a8fea5e4c58702de31a9 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/b5c8397d272e402f59ffa8b44e9ddb3c1a1a56db |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/ee96f616f6663072e104334d7fa494c7c7f5f28f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/46f0f04bd8e8f7165bbcf2bce7abb0c91e60bd61 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/8fff6efbb7ac6c999b4b4682aa61920afe39b495 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e2d7e73e4018980fbcb5d1a3b565ee97d7df3a2c |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e0505f823db9d68102e7426e2e58a9d3276a3428 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/888b72e71533ac428761e788646270e3db688dc3 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/7041b8a3f2e2ef4d58fd4688c76603dcc662b620 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/40684ccfd425ef5a403ace2402ae29ab55f876ee |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/4cf4745c89e234fde7f7237bf4731eb0931e9021 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/d01076a3f972a76f8528f81aeb67978f4592c2d4 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/7f459f34fd4f39f23347ddef9034df3b178d721e |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/fd89875ef77591afdde96804979fb3ee0978bc23 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/40c732b22d897e22ccb06bd428789e8a62989462 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/56923250fbe3813a137c066923a7072934816ffd |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/ca1bf82a27f448bbe61dc3f0f07b6275b9705903 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/359493f9fb135e8745bc8ea0ea8a2cffab7a7ed9 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/ea00e3fda278557683e05024bd97acde1bfdf21b |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/4db04389d7a09e09cbee0412e69b8daac210f02f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/423b901b85d093cd3dd9bce1fc722f815ac03ac6 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/2c3650850dac407540b9862f194e1b611d809123 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5678d4e0d573b7b0f027e44a208b902ed0ffcc45 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/aa15b8147d0dab87a3e629427bae8d4fc49409ea |     
 powerpc64   |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/a4fd1b721e471a5d715a3c04dd99d25a6c13f642 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/55b7fe275851becd3a49f5a67283f4cc9e823237 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/d1f955311bd392fe052dac85e22f454baa8838b5 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/ac61987f136b2248caa1034cd606bfd8711cb0ef |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/02d14a6f99ad1f9d7ac8991466998af3e13426f2 |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/95478c888f8c5d5fc4f4946d88a270f7c829e5f5 |     
  riscv64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b030ce799755ff20f7a74ba1dadee01b5c4bd388 |     
 powerpc64   |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/94ba00cd04c71977d61d8a9debe211148aa8e080 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/0dd326e8bcc70cc6a8ade393cebe21abcd8376e7 |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/7917db4b87a1546ae3542aa098eb96d469571776 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/419813081f594bb8e29601335f641677e10eda51 |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/7cd6bccb1072c4e65f3295e6ec6d86b7dd0012ed |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/4821460ec9cc366a7bb7000bcf2b7d9feb7e2fb1 |     
   mipsel    |        libgtk3-3.24.29         | NOK | http://autobuild.buildroot.net/results/f096bd07e82f55e4bb8f231fd362a71a58d71da4 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/1524e8279647d3b3cd21b0911819848683047490 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/427ac89f35dd4c1c2d8b408faa88f2f742255c72 |     
    i586     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/050243991d791ef121c0faf7fba170bc47d5db39 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/2bedcefceb22e6ab334be85143b284127a649ece |     
   mipsel    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/8268e7841d4aabd260d70405c5436d88519888ea |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/11b952cbb099f22bc421dcbd072e40f5ca53fcbd |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/81f552d81cc19d14fb104c817c8de989a3c42703 |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/ddd276b930f1d543bba209d89c187b2a088af227 |     
   sparc     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/b7e048b3ce358b823b9b0803f4c4cd552df95809 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/fc91b413334e9419b20acb83f0a28dbfbd882e5a |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/f88d2f2fe2199648bb72c4ec03de15f409045357 |     
    arc      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/ddd6bd1d0dcdae778da1a583a32dfc9b2238cd34 |     
   mipsel    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/80ed2a1db48d216278513c18eb149c2aadc61633 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/60ed8a7f738258f8e85c7a1696361dfef2b5338c |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/f75d964594a07e4f90595943e74a98a92d167351 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/86ec83683a7bd1b9ee5371ddfc0ce325f49c84da |     
  riscv64    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/08765b8152bdb39a542dfaa8416aced6e1be91d3 |     
    i586     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/4ba278fa3b5b0face5259977d4a7d8075ee6a144 |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/fef4ec1398196849d7d0b710cb829e68413a7349 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/2d57ee70fa4f24249d59fc48f61be78aa17496ec |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/45115cadac02465504b466266707bf13d1d98953 |     
   mipsel    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/e649cc85982bbdf500f9eb08ad1d7fe994829ead |     
microblazeel |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/3413397bc8c43fd68dfdf1992d1e7631218f3d77 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/def381e393dbb489ad65cf67b359a163a112c097 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/dda0558081f43b9372a6c6028732e33dbb1e746a |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/2202cf980d7c792a76f6ebfd408fbff816b9e135 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e4afbca3d9c6e7660826a59296e86e86680ace1d |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c2ddc5b75d84af508168f76263e6692d9b409e33 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/835200ad619804a19fc91222fcd5ba1296716a1b |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/686b1d19758801e4808386b399bce3e6687fb99d |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/6d751ee62b33bd4e7092ab95df4279dfebb70ce7 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4466d21b18b50e4d19705e52b43783d775054db9 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a6fcf8be5f39286f3f59d92b652c46ca66eb0c06 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e01cc32dfa5b54557b80aa740fdbd641ad04709d |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7e42d9be02cb8afc655b139e652503ffd74af5da |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/562570be847a9508be7a266c785bfc8f4a20ba7b |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/cdd78e407fb274ee06d77bacf8af1b3b3a25b1bd |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/2c53ab538e5884cffe419c990e7fd3b33bf16fdf |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/ce851787390d7089d66194bd9380c551f6b49d10 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a4b10be37c9f6c6de713bd8d4d26653ae3c46813 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/be35442bb0643a14dce7c8985d9b088c2eabd594 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/166f0fb4c40cbe33402af8f822a99a1f40243344 |     
 powerpc64   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0607133b3bad2f9453d14145aa4a2de131a0b124 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/977754df8af48e40d82e9999949c4fe3f549f18e |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3a90c1a2286dd12f53e749525c20d1668bb445a7 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b4d009f7ba3098b0f4dd5a30821a7c46c944a8ef |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/269450881946ea74b138c1e486b757f38e42518f |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5969704f14667b4564964d5b664d29161872053f |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/09157c9c8f71e95acabb27476f020975a5c08f6a |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0767007cfb4831a462956338fcc0998f8e743312 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7aaf8c3ddb7cc1c613d2c54e652884180b454708 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/70f1a6fb3fcce5e74848cdc4f3821cb3336f8161 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/40e72c0d7f8e9713906fb5e87dfbbac95daae83f |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/afd3956bc7cdc0af5f6992b3c8915d421bb75d1d |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e2c54918e1b243ca61c8602eadc135f5c23bd3bd |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/68033b6ea4ccd31a435050850f8c454a9d804790 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/fab485181bc6f0314facc43cf094b12cd1ed39ef |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/19ee7e83435f53244da323f21463b1ecc4f92307 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0455d57cad79815d98678c0af5a3212438a7b8b3 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4a7a8f212af6f92b9449034e80fd3b2046b91188 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5b71debd9f1a3dc14802321315906d51d4277cc1 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6760bc6fe3b79710314e8bdb0b38c1a69f816c5d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d9cd383f2eac9c810cf7c0564983c1a685dfeab7 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/fc7fd3f12c70814c12e926a9ae88206ed0f93d39 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ee33b46b71f24152413e640bc2c17635c19d4cbb |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dfb03b3cd35e1723e13c70947e7e4a0b79101f9e |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/68076a94b122522f4b7dde57874f76462daac750 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e5df97baf4dac966cfec741c8ca96f7568963fad |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/81aea21f4b38b8f8603395a8ffb844f6739849d7 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4ca581d092fd557cbae60076f431ca72e93f19b6 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cff3b2dc92b8c5ef47399cbaa5a4b9ebba61736f |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ef1353ed79f2a42ec8262f47831eaa1e68ea9d6f |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/32ea3595c21e5118f6407c813353d8eb3bc23fbc |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/06df891142a769e1f9c9546eebad6f99f70e7e1c |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bd1e448aba9ede5d64b5bff5287c5da2f6b9115d |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e1a0feb2bf159c84426a058099ea42da5fd5c307 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e250983420518463966207a71d379fa6733ae1cb |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/79351c333466821e09c9180208c40025e82317fb |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c24ce73beaf422fbbd6094f33d165801e628971a |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bb5d476126cfd9bf852b577aae9831f1c0a1c91d |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0ba717c6bf9823b74fa518857d92690cc0bb28a0 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/493692af21798e1c78b787a3b1e4bb68a41a9c02 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bd117b373ff30c1b0bc63911ca6f27574667ddc3 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/94f97492d8ce1e2f019b44894aba5f0cac083393 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/11a7002d22fc455451af6e7b5461b29426fdffbb |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/91b7555c6f065f2443350b3b654bb18fc8e4d1ff |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bb9851170d13523cacbae6104b97f12c5add22dd |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dac9f7469460939642d02e03e68e4ce51b2a1941 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/aec9456001d39f3cb78e0e16de9628646caf3d4c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/62aa4fe447ab05a36f55088399e8f7c4ad32a13d |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/946cb03eb0d5305c97344e265d56d264c87252c7 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/764c723084839dcfe4cd6c5f1f378d0509e3b7a8 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/286ae5e721280671eda1e07466cd0b6382707b5e |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/15a438bdab1660e66a749a5febf9fd7c12dad728 |     
    sh4      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/102b11cc1e924445f337dbb297417dd987cb7fc3 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5614f64a83ffc73a8215d98bafa40d5553259600 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d5da319a3c58c0e84da2660556808130c5ae8914 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3749da4adf3e827c19c3fe409ad31d83711e52ca |     
    sh4      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5dcfb9f3706dcbf61671674f8535b4fb9ec3ed7d |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b852be14f705b1e6a22e401b8799ec319fa79d77 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/d3961736fa28c4429351c13a91f52dc60a0d820b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/554c9303d0ca8c61df17a16e6eddc1d401578c0e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/4ebe1d90dd2ae187fbe08d38051f9f68dffd3098 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/821b528741d7777fa625cef250f428315973ba6d |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7ea8196e219d7df491a23cc32b046975d2d206f7 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/ac16addb20cfe93837939dfbf233cd3a432eeda1 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/77bf8f1ba70ef6403036079090b6186dcb7ed746 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/8d43b1e53254d48bd0f8cdfed48fa625334c15a8 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/9462a12d01d43aadca96d311a0ed62366644e5b4 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5fd5168d3a8a3ce29612090035d20954c9f00362 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/843f403a4f43554256e438af561e16beac792f74 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/48c4287a96f49c916602227b382b0757f71174b0 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7a0b1bdeef5b31a276fe62b903026d2639b13a72 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/f5b5b543b97fbad08d9eda5f1524e3611497cda9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/f6a41325a4a7199dfb5d320c5b356503ca9a0543 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/2b29d9a61761e80cc45bf6571a2facbc751541fd |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/1ddc7dfb68c39f1cd87213bbb8b6109e326ffc44 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/8cca94ebb7291c9e25f5726b2c0ffef0ab9b8891 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/bb832fd1f9ae7d61619de667ab441dc08b7742e9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/534c40b7bdbe41385384542ef92571721b00fffa |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e0f78f4f26c4d77bb82910dda7dc2f9f33f80a93 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/841c2ca597dedbbdfe9322fa401196cc4e650a02 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/dc8d96cca83819a7fc0e20ef601c4b45846a1c4b |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/638f6f6a37ca5fafe713ae749ab7129f74377404 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5544b6cfac9c724639ac709c043d88314065aa44 |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/485003d7fe1ee798ad17f4839f14c43284c78cc8 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/88e1fb7973fccd1ab8a9d3596a3369e006f2cdf7 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3ee913abf8708fe4ab6f385a03913be354f2becc |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0b605fe891aad38b462a54f2c7977cce8739d983 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8448a4b9eb77df7f8fe2a4705676705950d98ef5 |     
powerpc64le  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d7d6841d250a7da2c05cdb64f393b098d0117856 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/19f8987ea50f789d9f44847d556dcd47123742e6 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/58acd72f7af2772575c5c5bd0f9adf52c33f5dc5 |     
    mips     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/d6cd516e64987d5c707647c7c976b7644e1a3266 |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/2985b3290ac32164aa6e971e9e4837c449e3ea00 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/854b4fc5c0395ddc733c47362d6bc581d677f832 |     
powerpc64le  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c0ce08bfda84b559ba91868c1ff9f5f3a3a6a275 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8c3b20a5af22db0d0b84c730feffc8c07f9f1ca0 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/eb2a413b0c349ee894014aea6e8d8d85c062a811 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/876c61490b372b530e9d0ef01242ecca11f2f47e |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0bdd75271b3863379c7e0fcd22a5fbd909d34e8b |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0b7aa416d68f252be57cd96889c04821b9782100 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/faf29ea916235a70aa17e1a6405db22d1d97b960 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/152edb58a89158c97cc0ff6a6cbc3f690d15b913 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/878c3b151184d09ead4c29c3607f7d46349567c7 |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3c98da9ec1d205a517da353523fc0057f70660d4 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b23a44d1d3a0c9fa41f5ecd6ff063bdf5b5ef3d5 |     
powerpc64le  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6a71d947a4dd58c2ffbbd00cba6817ebee5f7407 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9e4eac93eaf0e347a297e1ef3c1a66d579692383 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1362f34a1d6da0bd1f2346d206a85ac34cc5ddac |     
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dbfd89b58f74bb428b206217875120e2770bfd65 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3ccf8750bfa8375ab066c072b731ff7ab714144c |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/646893af74bc21504529b3bdf341ff07a0261c2f |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/40919e07bd1aa434d7673a405ad47eb859eff89a |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/eb020c87062a3fade4a6e979394c774d5af428e9 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4923580580b7c8965311f4a0ec468e94d7950e32 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c06837c95392ff77fb76a2b172dcec7c0378401d |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8152e3284cbde446a302029b1ff724b7dcb50294 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3505edc41d56bcd23d941a9fe9e60103d0c60348 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1e0c0bb777acc93f9c62e56d418b723129dd3830 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/189687b727835c01d4ae930d0e4aa3597c3efa79 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8bbd40c266fdcd48d28b22f2c7c3f39f49754bbb |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/61ce85c6f8e1e7a5c1fae60b4750b574fc99899c |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/abe617c10c947970b607a10e70e785992bc06e73 |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/194241ea6d0649c306b8431a904bf4d7e257e951 |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5aa6ae170de26cdeb67e506d2c087dfab3ac55b4 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/62747df03a6af3a2f9e6f226d6964edc893577ce |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b5a39df5c1a7ee30a38b65853c0b86a7477c2a5d |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e69f171b8fad21775b74985b671f83dfbc596699 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f843738ed6c10d4e619b76cee9a76df7143cd506 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c7a5e55309fcf341ab7e67fdfac295574ac4514c |     
    mips     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/5dcdf336c1ec17c45cb71254eeeba970f4999563 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ae6985113b560ed9db8cae2c6d703c56923d7a70 |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/78f244bf636c6a60e0ff5ad03d0397a11ade6a2a |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a526eb80930a55aaf650d54e883ca8875bf42067 |     
    sh4      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1e28626af037c64d0cbcc7e5415ef39f123774dd |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4c3f4d54f3bbcc8522042dc5cbcf19fcfcfe480a |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ffb007f8dc6c16fce46a9b268f6601f88c923b87 |     
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/656f7c7f89d3110432bf67e585b452a81b22c72b |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6c6c69d28a8914d0609e9158ae1d5a19b61e7387 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/739c7ee17ae2b688b430671395d037efe8ef718c |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/4243ec05798ae177f767804859b54233b320daf7 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b5710b7ca151c9602ade6c9f5b3bf6d41750717a |     
 powerpc64   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/617672b7017beec3efd8c0b36fa66a5552730955 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/96d8f45ccd874b53bebaf309a0575b99e166bccd |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8463e846bf307af32ad61680efbf4d0292cdfdc4 |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/134b72780e0e8fd7ccbf25c8c1562ee3453f2978 |     
powerpc64le  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/24a3ce51ebaceee39e7eba5aeea744d0de5565e4 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dbd21c58dc970742ba35e4819c8b2e3790e963b3 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/85455c0074ffa6182390870d053b2529159049b8 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bc3cf6ee5c2eac4a22232b891d1a91ba49f45a08 |     
   xtensa    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/73c079d3dcd5f2abc98c58a32cf989c364f5b33e |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/df24b9b211772444956a672c1d39ab60cbcd6040 |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1cea68d8d9a706113a2e84a4faed01989ef73dc6 |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/0caad1f7dad5660f2588b7c75bc4ab672baccc92 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/09be29b7af715919ef69e03238abce0a8ed37059 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/5a8c3e0f473a9a39e926160851a871ec1e62e3e5 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/383f7d3f521a33826db29579ebc96d161a3066a1 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/547078c0b1a46a2d982b0c88e11dbad7140f7870 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/41082eef428888c21fafaf5a0fe0e7e03a9f5e3a |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/ad16ecadd14d5892b20db66c8840bb28ba1137c3 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/b6755132547e3f97e65e05137be2114f2dfe14ab |     
 powerpc64   |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/3b779bed219728a82210c7eb8f2743913df37336 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/6b8c9d1be9f9f02272cc18e960cdece7322e67c1 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/9ff72fb9407e17c2a6941900b9b92dad5926cc4f |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/d29a7bf7d9c62530a14f4f04f7f06627e0113cc1 |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/fff08a5b35020c27580b93a443de2cd2626c3dc9 |     
 powerpc64   |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/27306ed5db4392a6d886b45a70e07b0a9c2e63f9 |     
  aarch64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/c710ac99e69eff6d397775a7ea523592e0cc132d |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/1ea486d05ed26995442d7651cd336bea4d1ed20a |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/450d76485e6f9b8ba96557dc254bbb7842f4cd56 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/49faea61102dad4fbaef5334a058f918cd0c60d5 |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a90dfeeaf4c989acb87ee2f19fd3088544337662 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/8fa9bbe88c04367c0be2ea1e1b5c6afb75c74c1a |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d31fb11bd1c3e7aa74eff59f8481890ced23466f |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/55b306f64a8867cfc251885a1f21e8f23a5a8a1e |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/e09c437b206d197d5f630b306de150c8ef5b7cd0 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2b2a40e53fe436984d6d92ed5d1c7d157fb93108 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/e29f48684aa76e14aa443cd16dfac871af9d1445 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b3aa069c526f683564869a67b03d030c526ffb6f |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/34a633b039476d5b4e49877b24a937072fa9f95f |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/33dcdb35b831969bb60218ade4342b4bc5aee45d |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d43014aa96f4e6e3f8628b5b6f34810b2efc5dc8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2b586f9bb8e535a6464d8f8bd7234f0df457de58 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/c2be36aebfc6d9e8fab45aa8060980ddfff3ee93 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/dd7be9f7dfdc6ef0aed1bd3c67b374aa6662c609 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/428ecd5156ce37c918fd2083cd99cb8505a28901 |     
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/b602dafc1c7c00fdcb147a564abc871045e5505f | ORPH
 powerpc64   |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/7c66e29b12d5cc609c3dc16a7933de137cfb6e9a | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/42e28282ebab9897acd4c9fd3d0c4b0153314802 | ORPH
powerpc64le  |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/6e68fec4b47a802ea46a93da3d58a9e5f0a215d0 | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/24c458b34117fb9f824a2ad5fb3c5fcb358cb5c5 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/418b403898abd18f6ff5fe284118f624df064988 | ORPH
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/18535c449560f44dead0ada2532322210f8cf568 | ORPH
    arm      |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/1038149f8da075b4a2a0cb6a6f9129c91a59bfe4 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/7697a991690470d42bb62193e932315a61366e95 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/fbb221a47e10804666f49063c29c4ffa07a58f81 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/241ce15e2daa6179a42a179394a070bf192cdc84 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/52475b69f7ca6ef24aad288aefef2b74088eeed9 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/cc2e403b81390dd97777dae1ae7602d7bc30ee2c | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f602ee872643b7b329fcc7760d5e8174b4fc2b8f | ORPH
    arc      |      libunistring-0.9.10       | NOK | http://autobuild.buildroot.net/results/f77b902297c1662acd4280f8e5db41c7fbb0c08f |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/e69a086a3377a0087d47696072c7b2bfadbfbaa8 |     
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/8f2dec34ad7bf28aec8618e37034531ec01d0b4c |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/a4ff4fd4521a0df800ac07ad82941075935d5696 |     
  sparc64    |         libxml2-2.9.12         | NOK | http://autobuild.buildroot.net/results/9f6c42a722d54e7499af7baf810e6f235bc17b92 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/44fcaba971d2511fb3cf54238620465a8278dee8 |     
  powerpc    |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/211e2f2095fd7e5975f5c0c62282a8544b2ee213 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/e8a53a5aa6ec03b5b6ff591b12c08ea5c9f96e21 |     
   x86_64    |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/5bdef1f3122edef797cdebbd3856528cbb195550 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/a0589ba75029d36c3ba552727bf5ccaacfd4151b |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/a625306d30d3425603ab565876f958cbd6f900df |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/bc1b70a2e78d4fdd326a1d1d94c481bf89863ab9 |     
   xtensa    |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/63dec89f6b32c361856ffe6a2a7bb2668587eb72 |     
    m68k     |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/7c266fcea0961a30e415ddc37eb11c535650d710 |     
    m68k     |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/7a2194ecc4089d58024d1bc905b2a846fb707c10 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/7ada1f3c779c15e1d7a75b25963593773ae02b12 |     
  riscv32    |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/e49508161b624b7b2813104b42f5c34ba01868a1 |     
    arc      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/b87957cb9874f1827bbe38d1d6b906960548a96e |     
   x86_64    |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/21fbdda2f249b912fe6cd55c0d3a87c162b5a3dc |     
   sparc     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/b16965547511ba87c6cc284c1789798c95cd4ecc |     
    sh4      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/417326d88c1d01c7a340516feeb48d475dce9eec |     
powerpc64le  | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/1c33ff383a29bdfe741928a1339dd9f4a7cc70a8 |     
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/c3c598bb74e3199af3b286272d8ea04e96220097 |     
 powerpc64   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/30f32bac302dee1a835d461bead4b5391434df06 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/30405feee411b6c106b6bcc0e77d9640a2e2aef1 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/0e3679a9016768af3b22fc39bd0fd3ba099d7f92 |     
  powerpc    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/c92ec3dfd9fb23d1c28ce9328bac029ad70b6848 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/43e1378c4e995ee2e52f8b338a9a547660c4466f |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/bcbd31a8a07259d67aef7012b857a489d54f2ada |     
 aarch64_be  |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/73fd64e2d358a971c4baa1db8ff47e57b852d957 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/23588e5d513d9e5e18d61bce1032f56c6b31c077 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/f8801a3f5f46e630138874e85a4e49f3bec2974a |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/5ef8bdd0898bec8f51b1d56a169f14a28337176f |     
    i586     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/76ac66644f4a26f8c8d3bd3d2cf66f249a80996c |     
    sh4      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/b03ea3f88d73ece1ea76c5ef43f57e3f53230947 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/6ab4a3cc3892475011224dec40ef6463c6ec1a65 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/710e4abd4dc5e5cfb4cd7fda20e83d61186010c1 |     
    i586     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/8e30292cf331453ff3f79f1570e8c58cafedc86d |     
  riscv64    |         moarvm-2021.06         | NOK | http://autobuild.buildroot.net/results/027b7d15e6a6111409ed17bb29e001b6c6d9e0cf |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/70eabd60ac53b1ff424f55f5de1bf1e60ac400db |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/9ebb43f9e82803643a61e8b72ab10d7fcc4f23d6 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/216ae9c2a5d066acd5e9d6ec1ce3e50e77439b53 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/3c6c6051550dc2d08676729fe3d9e722df2b7d21 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/57d52fe235d7075882dd029587ce1b7e730d8b9e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2334f764000c9f0745f0cb1d9ee8e6391483db70 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/6faba89406d1834bcb10c43bf3ce832089493572 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b7fbf7928e3e50e2b41df94d0dfad85a73767aba |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f5cac7d39f09121ff2e78b07d0f54bd1ec312fc8 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/13c3ce68a9d30ae671a6ada0df473d6373848059 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/87b59f8ab58780985396451af4804aafcdd000f5 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/21659ca2b9dbe36ee184291c57b2b20b0b1e6768 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/75f6dafd898e719303025c9868c57b62d4097a1f |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/977fa1138bc76ad672cb4147575bb1ac40d7b3ab |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/a2a588d970929f7b5b001d5469adde19c4e60e99 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/8119c0670ebc7b1dc34d4e2a5e2315752a8cfdb7 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/6be7e0e311e7ea7d98c63477878171b9d2278f7f |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/98d24b56f51c0700c8f9813954edb3e5e595a371 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/6d7b7ff918cccb0121babcc86cf2d4063c90fdce |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/86f0eaaa5ba510b0d215bd74cdcbb3a4e1892bca |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/4ba561e3b682853ea2d3e26801219b9468564d64 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/daab61d5c78718bc2b9998d15a93ac9796781f39 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/03b338d73239365f5382973b32197bdacdf79d6c |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/278848a6f42ff4ddba545788ae666c7c96280678 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/282703263a696efa08363c10e60675453db2a2ac |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/ccfd98c18fa464de3ecf1794b22202a8f565fd40 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/beea5c95548253ba173338713ee4f79200202e33 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/3a0c04516914baf5e05379aedc3a6a1cbe53013e |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/105ef4851244ec2eebf77be82985e8c222b3138e |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/9036063360ac9ab5026795bfe4f98bb7a234fa30 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/e02dcaebe63a2b797f74bb33c3c1fb9f01e10492 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/e0b64e31b389e8e14408b331f2fcfc011f8a0ae0 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f6f2339b04a61c975ed7bc9ebd63afe3f0177d88 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c6d569b610da03dc16f090bf1b65912a1cb3bdf4 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/bd24f6fa5280b2e3a6ee7c9a140985fceaec14f9 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/95fef70ca6915bb8c710113c05c3720613aee0e8 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4277292d9c7f80932c40c81e05e5cd5db8451693 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/65209dcbfcb38ef6635d3d1198f456b4892ba18c |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/548f571f11ad77323fcb419338d3c1d2e7092bfc |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7669fffb288aa2d725bcae5f06d622fbe8d7a2af |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/01fe2208d2c3419c955ffc2391d804a6cfe89999 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3cd10cab20c4357237cabb69ccdcde72777d0f09 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4ff9c17f5f460b2fa809ca3578abaa64dee0c9bd |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/802bf176d6ddaa683756d3ecff954cebbb67fdb3 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/758aca6df55edafcc7edd5aff38de66846214b63 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c318298e4225d1d5833a48a04d5e5f5670cc4889 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/53e68a1ef9a3b87c74c91b211db83eb86f276f0b |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/77585291fda36a85227231c716275edcbde5a80c |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5ef42f5db46b0057342313d45efb10ed0211e3d2 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/69232e91072d6ed2b05b327b62de00da8a448b2a |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7b017e0bb9bbc6502c43254286a16f4a9346643d |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5c4d4951b700527b7d2b7475e8e27786cd237af2 |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6a5461cc24a10e8b75ef484acb597b46755f08f8 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6f33b6e33f96d07ab602a3d5284caf2d506bba29 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0ea266787fb890f2c93a60a76dfb2a3ed7f5eaf7 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1b3bd2edcf40f1b1666afa1291e0a394fa5949a9 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6763b06281100b139a647ae4f8c27a783f72286a |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/62318f9041934b74ad3200b9d7e12cd4aee07653 |     
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6530907c8cc31d738e5e797b0bddd708c810ad6d |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e8bafa01dce94d57ab66d19ccd4953fb86b39117 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7ddd7842e871111bffadf799ae4cdbb8698c6d6e |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a974d8d0c7137a2fc93f1028f64d7e92f4bed26e |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/aa46438051d0372a084f007320de8cf07e0a18e6 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/eaf94cab4a5f1edd0446533db7253ecfa748c776 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3e5049403b43275f9a93a81b86475ec21b8ecb06 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b2a6f1131095ee8f7314a08876f067ba3f45dff8 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/624afe87cd8154a5fd3ea007b01f7f91d5ca49de |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/edebeb5db29ca939597b516e88b6bfa0717559c8 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ca3e88c41f2227c971d9637e8cb6f1c8351ca61e |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/548a5056086adb5d09044ce161b5be1247f538d6 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/457d4a9d5e74d54a819e2a9d9c2fe1e2291b63ce |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f1fa2c220f9109324fed1fbebd96b9ae3fe2ae31 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7133de7c6aa2b40cc877136b4730bf50d0a55db8 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5d3514e617f468033f287356909f4999fd14908d |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/5a7f173699f14309500597dd4f72d8d77b838563 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/89899234850657f80a55fb5db88f457a5b893f15 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/87f5e6cf2a5695d16948eb5d84f17cccbc3050a3 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/fa907966c4b61786e652bc688450d73cc1feb9bf |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/e95998d19321773badbc121eaa943272b354f9f5 |     
   sparc     |           mutt-2.1.1           | NOK | http://autobuild.buildroot.net/results/bce4978a7a1be7a0e298adfced2b49786977f148 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/5e69487397cd27fc4f70ee815ff1042d6bcfbb23 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0533cbd02013be3abc2d31f30a64b6bc267e123c |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a97fcee7e411b21742bcb0b33ae07ce97c230da3 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/34bc1c4fe78f5fd70f865e79553f62db9cab92db |     
    i686     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/003687b8cf296f49a8c8301ab1195dccd3ed42aa |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0a2e5f50858e01eca5616345b5705490dabfd61b |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0a383d9806682885ddfad13b7e0fd0277c9bf482 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/e88f7f4463903950bcdc4f0622a35dce2715b4ea |     
    sh4      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/217e8ded9ebd155f4e7646b8b51266832481c5bb |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ed4d18519134251828b189119a89b5a8c75f1e53 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/bb878ab91ddfef534ba6bf55bd454885cf7f692b |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/43771dd5363495a7f0cad4b682c408d012774e28 |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/39804e7b352b3f6fcc647e80e81e692911bfd0d7 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/8461b57b07c45587f93b5d3f306135f798a289c0 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/5cd16f2f5d3a1542d1412d5c923e7bff3c303513 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a42f4fded9e7ed581d7b5249e68f72e1228a8507 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/d3170385cb538d61aedcbb985a2667ab4e769999 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/3650212071ebc8a49e392570b8401fad19c89c73 |     
   x86_64    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/24d76b2b16028c7b09cb8cf1f5338d4c79b78ebc |     
   mipsel    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/0ea8c7b268ee825b5a0728633bc3ff0d4a2316df |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/4cb21e96b4d39720c6417ef9ae7913481061f5ef |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/5a0cc5a0e4961b38c97c947032a2d4651733c6d5 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/f74d08dd3fc1f774f34f7ee4d2596282e9ddbb30 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/8cdfbd1cba5a6998138659c35364611f63929342 |     
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e2937da7da9972c3f50ca47e48334236621bd70e | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e64ca8f9bf212a31f8a628a4e4c0d62082f640c1 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6f8d0a44d6970dc54c6921438d9b59a59e8b9789 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e1d83c8b1e683a2bdb0734d009cbe9b0c297521e | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5bef1d8ab60acd2f92ad9f6b61fccc7e8fce2298 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f9916ddb83111a91d313ba8d0ff651b7cb5012a6 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/affc7e01145c5d4c0f06df96d407ad2261241ba6 | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d6b9f7398d663293b99c91cc540f9054badcd9cf | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/00760fa388d7f2002d417ef88ff7678072094ff0 | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/63ebac8490554a9e7de7169b56e261afc760179d | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/987649c2f1275ee91c04b5a9f981990a6de483ea | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/641f84e64a1ffab14c2b91a9a6f0030313748d67 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6ebce9a1e1c1a1f0286f88286f563b3576376a88 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9c70be4150d15f687142bcad795eca741e62dd00 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8f84cde83567bc3c7acda33c3449e48eb9055688 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/33ece06f04ecff372bb53211094f176437af0426 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2fc34d73933a54780b7e46dde64647377d7e7967 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6fdcce8ca3a2d45994f3faaa1cff05ace56bd607 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4330f51f64d88a71cc96c356e6c34e1855b2affe | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0b4326a92046508ed3dcc5e3c06fc67524c4ea37 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8a60e9a11d7ed5b38678763a9bde7bb887e2e803 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6dbd43e029568b837d4ee55e4ea733d62308eaf2 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/46480c00498824ae9fda2394b337f1864d1cd498 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/24da9450c1b2d74a61e72e734ece63e6c7250942 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d314633bbae734c06789dd47c4564adb393d9e2c | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/32e27b130611f5bd21cc0b5e3922546b7c79a07f | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/22e4fa946c9c6da6dcf9ff74453786925a904dc1 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/47d124b5208325c01b66cc14f5e9f1869136117c | ORPH
    or1k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c9fb16851d3bc735af1504d66389329c380edf14 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6ab41c737179f670974462a5d3e015952c279018 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/970fd4d0627e7279a1d50012519b214465b29c38 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fb0ac929a7611073171e1f33c74b6fdb8e150c32 | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/dc84d86feff9b609e5c529491f88453f0fa24996 | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/cb273f2a290a2b35b7a4bc4768a5146f22536d96 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/73ec0d08ec0126d3b6c0c1f58f294782030e702b | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1e103a4a4366d889df76ce9cd0bed944d67bdcc0 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a78f19e81e5f27d92bf5430aaaa603d63870d241 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/86a7073c94632bb5b20028358c50475f7177568a | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f669b2971d6f59fb42f2fd381c9e374b9b79d0a1 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/46fc8cd370d14cc55b20e149dd188289d666c3f2 | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bfcfdc67a524510a1112a3762d1415cb76bbc97f | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/0eaec2e917bc6afa79fc28dd7f12d750365ae6dc | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/00a0926c4c93c5661642f47a945d92c419e95ddd | ORPH
  sparc64    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/502d69ec8f7cde8800d4b99ac2bd1ab0a8e598d1 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/dfa3dac8ffff8c15a162db39fb4fc43611b17666 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/67b301d5087d5624053f73dc6bb8d705a32f239a | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/7806f3c62a710af55039108055f1c5f264b9045d | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/c423d26a4b25a077b4d657f289210acb90ac86ef | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2f2acdac91bed5475dbabab4cf18851171cdf3df |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/5d6c0716eb7b62024e494b8c1a672a661f1a17c4 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/baf2525269423f97f5b6e6920083acff391c5aca |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/d4e4ef365a7d727c5e9ea7f109a9cf6907202770 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7bafe1103bc6ab1de16f9c647300aecdbf6fcac9 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/35d5a5ab365c48bffa6f182967857bd27c9fc76a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a3bae5c8bc5b5f85f35dbdac5e6d5edef53d5e37 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/37943b69fa459f0204147823b074e01cb0d2645d |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/77673674e9061b12e20c62115235ab63839700bc |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/9e294a075ec9105b16ee7c42c68e4e1892d897c1 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a13008ce434889e9380b86bdedac2ef27ae4fec9 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a07c4b935b20809ed376053e96a07e461cdc83e7 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/04bf860dd83706983348c46a91f1a56604f16b74 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/f4a673c4732680f2d8ce1f55c58dce8b5cd0b4e1 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e880580c2bc1dabe1542798fb9aaff93adf45719 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/799d1c7d7924b29ac291a391c1187b98b95ad403 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/1cf25daba015de2ce13ce6c5c95dc14667d0d8dd |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/12e6bdcff65ca3f55d402737d0f6f9fd9b7f4e2c |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/f07a940abe06600ded6cff6c30f07ca63ed07a07 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2860ae7e13221aaaf745d259309d7cea888d0911 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/080902f81a59b7778797765810aaa4d7a897742a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e1cf69f6ff7815253648f82c1856a0a9d9983b5b |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/150a6d065c9f7875e7854ad6a87d4f73873777cb |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/0a66a472be2a0caa188cd6b3cad5e9d491343734 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/abbab3a80534ec4b47b553369bedf3f34cc58ea5 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/52f191a812b71d1f86d43f7bcdbfdf7ae141a952 |     
    arm      |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/aa5dd4f33ada168e32ed186df842e64e25aa0054 |     
  aarch64    |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/f33bba8cb1fc20529f36a4730f0664696b8585de |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/7fb84aca3d21683548925f19e8eb72e35be700ce | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e70ce5c27346e6d25bf3e93fc979bc0218b80b1e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/c94c0cb336b6ea773e31a0affc01dea4a650aa1d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/27cfe3bcf58c110e6aa67170cee8f5b43c7103b0 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/259995b8e947c60de12e032f0ebbdb3a6f3f4e23 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8da451b386089eb7bcdd342a81c5aabee53b74af | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e215230fa859f60ba733c2f607eab248b3ed3ca6 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/42e8ae05341438a2b16b42721e068206fdce9cb8 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/22351adf636329eef7964a344e517895f9ead8c4 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/73d44b7fa8f7619423a1e05d1e5ae352ac20b437 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/31afe4d45a3ba2d9d8e1e25386d00059d887cef7 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/268853e801d5ce6bc3f5a2c10f6cef72eb25c535 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/44918976d43501bea12af818e209ffbad02153d7 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0db0c0a3874a8b4d412ec787047b71372e48ecb7 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8ce3d7f51b235695c25e3801218d2aa9a072bc32 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f1b7f6cd5588dbbef5a4127080940a55fa4c5d42 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cf58cd4a5d4178beccfaaf0375acacd80658aa40 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9f8a3a1fe6f21b2a5b6b5a0a942b6f5fff1e21b6 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/935c28bb3a59fa18b11d4996e0f4771ac578bc32 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/883ffa7666df1d3449805caab23144e93baa51b7 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ce89bdaae2dca0abfea082c01ab37162ec1e6d5b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9af688d636d684a68729ae1e5db4784f5f36cd09 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a398d786d66a1d78a87c4ebe53f27b37f97b9204 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/8adfd7cc0ceb06c3d3714b255956e28320326160 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/4c9b8057ec14079770f9c196df7922595ff64a5a |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/cd6574918561c1a8a26e06dc390f905ad8edda5a |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/62ab7d6f0c8a876dbf1ec1eb811fd8ccb55f77e0 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/071e0d6af1676a8df6b53b812b001c5ee35a2c99 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5a440cdf1d46de6482b381b393e801d28a05720b |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a88ddf036d6d16ffa0e55e36ffe51e9c0bb73cd8 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2575ad46c6feb74470403b19ac91499c28044462 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/bc975acf606607890dc9331c1b11ff788816095d |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/14a5342fc86809dfa615bc16c21463d66241f775 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/d8bccd12048c0105979dabd6932a63ff3685b434 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/491c269eb86a2aa1e99aaae9526fc5162507b648 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/34c9cc2542f3a48bad693f7f052743f34414233e |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6e21239bf4fe955137eb93c526439a46fd1e4607 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6029ec5ad395df17e167573a9c02ffa10d3bf0cb |     
    or1k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3b20149ccd545ab1c53cb606a2bff1633fa70a5b |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/76b993433d03b6a41069d35fa443ea141be1dbab |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/452b33940a7d96ec61ca3308b2b4cba95b06657b |     
   mipsel    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/574c29ea56b51fbcfc968a0493b39846cbd175a2 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a65ac1a7af83bf5c241dfd44beb6acbe2a8a1054 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/c8642998c445346768f82a3c049f62f1775f6601 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1b789c517cdecf83239063dbe17877466aebcdba |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f1c42a6d29dd056981e8f59664754b6c852aac72 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/468ab13f21773bec2d47f605f9632f5ff750bf13 |     
   xtensa    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/fd4c2e7fa75aea19e5fe3c09a6e2de3f4906e998 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/d6d998c9de6e567805d76cfc4b9c561d22eadd0b |     
   mipsel    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5d78fef28fd9470c41c8da17bf8e765520947951 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f2a59681014525a462b5f90e339fb381a02ec839 |     
  mips64el   |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/7fec040d7e94acb0ae613764dd90fa641edfe595 |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a2c3e9e48fd97fd1a489ce8436d92b125afe71bb |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/c06363cf1c54f4ed6b85573d292f7de8de207305 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/73ca04cd88530b0dbd25faf4ffaacd32b1b26f7c |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/c5e0cf1bda317207f358a22754bee041882b427b |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/65a979e3763a710079a1324a76576be00ee222c6 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/411f98fa30cf1a531b2118ff81c6f1476d89d5f8 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1c56159423cfbd8ee94d4d0d27d4602b4c04ce76 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3b254affa6caa435031c5970becf7c149bcaff65 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9a31e589832a9665f9a6ad8622fef439658c08a6 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/72503f3d6ce57eb163a2f7a6fdf73926b3373447 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/358e5e42abcaa32b627c8ed1c6cb2238e674b7b9 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4ed4ebe273217f727a82aff23e40ea6fa01d3910 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2a072ed622ff200986ff55f2a6a9cc6d87d98a72 |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/0af92f8e0a9699ab5eeed713d5affc49f44cf3ef |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/fa391deef8be95f5d2ba12752e7f72cb41ef91f3 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9660e76af7591caa0034f430eeab96070cf513b3 |     
    arc      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/785cae06695f4389efe6e1b80da633144b84ba18 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/8b428396123e58931c8c6f89179d49755bf630af |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f233bd997e1aa8165837b7502be4a68ddfd09f2d |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/e1f1f8810208f34ee8be4e4422e727edcced291f |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/b8018e7d0bfa4ead6f95401cd88ce1e7c700edb8 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5e96aa7df5992e11d367f754c7c96bc810946fdf |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/42493bad43952fb22036dcbbbcc15d04107b21c2 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6fdde26360c551bfa70460edbb9d2f51a6f7cd67 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a8c33788da68a22191d99281f4ff2f3707d5bdc9 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/84f6c69d56f7ce23ac90e05840f29b63c9e78802 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6057c37ad2fb207b19f227d83ea8a2054f3bc8ad |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/47322feb48a88401b2889bf05263374a9af6f10e |     
    m68k     |        p11-kit-0.23.22         | NOK | http://autobuild.buildroot.net/results/c0368a74501372a3999ac0e25569f7dd6b297f92 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/8c3e4666fed6b7e3cd186ec2c9a1f5ab68001521 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/d89a973a638234fde9a546e1104e280737362d59 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/ceb7dfdf497c7271db954d627f4ed71c2c0b5816 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/ec463657a203b597fcb6b30be1cdfcb7b3f60e1c |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/5bb3cea2b3e9f4cc87e7a478cd53036918da561e |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/b065fab5b44d9f27c2a286b0ce580dd12661979c |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/7e834adb6961ad4eb4c20335ccd9dca8e311c9f2 |     
  riscv64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/0e1d16bfb334efd5719ca0f716428d91f2249cde |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/89c001fb6f217ba9133a7d260b48d14000091eee | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/921ae05cbcd6dee35690e4a5a586187a6b0d6ca8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c8c1bc2c3222b677ded8ddeef66914ca9518c28d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/64117f7bf6968c754cbeb567ae781289f1b9b2b6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fb1fc1a0f937db88f3b7a7861da65a0372ef1bea |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e3cb043829eb277a75dba2753870b2d7312c43c1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/09134b3c542560f8e2ebba0c2171e3db16619174 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf2bd1a2182ac368cf5e4aa7d9b3b49bd7dd214c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3845ed17926ffceaef369b5b879b9fbce9cd8006 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b125206c191f4bc2eaa2ea970ec8f4064370b68b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/50ab492f6141bfb5f80e2079a7eceee280de5cb8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e99c267974b107cf397979e56fa3fd597d15e70a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b4b7addf18716b353183af73145d290066be6284 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fde5ac1f13de09401975fc4cc17c67cc793a41a1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6869f64f2fe8005931611d01743450329ca7f4bc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/500c25bd24e3424342818f6d35244553bb803f0d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/aad96f3b39490610025cf93578d6eb02a716cb85 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ed3e2cb5c0b8e64341874d0ade04ab0891d47439 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2c505b0982b74f7c9194a4652d51b1caa40b7e7e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fb09703614c63153e305268e877f5abbb50754c6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/599b71dfe7e0a05776471fbfcbcc5b1c64b8f4d2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b376f71fae6457e8d950883063bf6fd41633b82d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4c5dfc1114a908b9576a10d676f4e6f8a8cb0059 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3c6d0517cde06ef59537fccf4fc80d3e7c1950d8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fcf63c64f133470d38e2a40dc9c589e6a558d162 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7b2153a650abd3ae9c904437116add92a416d811 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9c79e913de6d3a0a603b9addeb0ca3422274afd3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e7d7a499f353a0836fa06707407b415ef73b9b14 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/33de3054ef04471756b2d717f6acdf2c38a2a8c0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/99157c581d4e61f3dee988b3ef906f3adc9785f5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3d685dacfd36443b725a13e9b788d2d04732b255 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dcd733c7511bc40e04dc6f9aedb180f25585cd84 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e8d393725d5adb0b12c912587b82b62365f407da |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/72fcbd31712f9405c9ca28f558a971db5f8176db |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/325f78d3625a752091fd92d58d35f43beb1817d2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/35e909cf99087d4a95cacabe886de328ca089ff5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8940ba2fe0a5ce708d3c7a2977615ce693af51b4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7f2e4b0178bf93ff01f2461f444da0a6efee0a34 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bf36ed022799e99845650a32c78c7753dd111034 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bcc1c83d5848a56de79e7a3aa12f473da516518c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9f23899c49efb2aa8497f50c8516cca117332d2d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/38ede44d662669dad7b4de876756d0f56ce8556d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/890527fc53507e7c84fcdc5e088e35190f9a09ad |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ef36c7b48db6e2ca37f9867024a465cf00a38e86 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d2efda93331dbb356c69b2e04cda7e31885ab20b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/674376d527206c00556cad5f00a453317ce4add9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf3e0940a8b1836950a079e1570925585bebcb93 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e373ad7b7dcda96258f91ff0fcce7623377e6f19 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3655c5943c5036bae41f8335ccb5c83ed7fd56d8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55f90394f9e7acad3825354d575b9ac30037ab1d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/eb26c6cb55a367f0005b83a5d71dff7d8c125785 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a956dae1035eff479b19fc839660b7f70a0c9cc7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5725a0bf283fed67d900692616eac2e52c6c99a2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/343bd78a98e4b690ca21360801c6985c1b573344 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d3cf4866f567ffc437b43b321a8d264f664e8ca4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5bf4edcf6c4ab1d2b4e6287e67f121418be02982 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/315ca7af7213fed7a798474bb0cd73fcc82ab199 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/df6361c3ba7602c864248f75c63a84368183ded0 |     
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/fd578fecc9b1098a0189fccef33a22a30489efc4 | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/2c2f39f69ea884a065a87ab8a53a9df69e434d7c | ORPH
  riscv32    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f854f24dd84c42745395a179228ff18b48606837 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/232c20c7fcd15f2559d73bcb1afc8d837046f49f | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/adf545c36438b95de1fa244a992c4612eba453cb | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/89c0e7e9e079488ea756383db015ba924f462de1 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/d8f4da7295bf55053f6b1ca12969f9faa2dfbae6 | ORPH
microblazeel |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6c71bef760642752752ecb67f3855390b48c2fc3 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a86bacbaab0113f469cb1e7e4e2d4dc9b244827c | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/e2a7464a6424bc728e984cfb3e7def7dc833bd06 | ORPH
    i586     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b98bc0704a17107a68a10e7fb8e6798e7bf20204 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4816c5a7cddd939f71e2107bfd20d3fa3c842653 | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/5d459f8f3cc17e146736e2b41413bd9f7214d746 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6e644ab5405a3feb689463ec2eaf8bffe540c274 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a22e9986b0f7564f8004b4e03226bf72d73f912e | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c70f20def6c9401ef4453b87f3e3cd8c6d4f357b | ORPH
   mipsel    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/24677221019d1e704e72b876334e8aa7f72f5f5d | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ff603518f67f18f51a6df7cd344689600ab16c00 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/be66d9f60365d87bf022906fcf6fdb8d5be9736c | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/8398a1b91009c972b2c5747183ebb6746f83af3f | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ee6f35dd2484a2a4b1456114fbc2ab0c75c2689b | ORPH
  mips64el   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/be479e71c831387321c327bafefa4355776faad6 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b8a04e52e3e09f8e81ca520a3014b5bfee8a0ad8 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/2c653fbf0e1528d7ead1ee5f55ca2297ef3c454e | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/925c1a1a3f34a4b34ab10abc0e135892d5211283 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/82c991f8c45e4f564a4dc4c4285fa5dcd4bcb42c | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6eb9ab2a8ee614fd0527f10c297da13cbbdb12e5 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0b6329be4010527b5b7b1f19df74f1f119227e59 | ORPH
    m68k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/90cc3c1edab20a6241984c5a26d20e4b41f79c33 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4f85080f2b84b67eb72c246cda8ac402c0ba2575 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/8b3bf0fc4895c0df4e9e53d3901d6807e9a4b331 | ORPH
  riscv32    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ac14110d232b77488e248c7e9b105d53998327d0 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4d2fb0565c32aa1c7ed031843914431f06e17f3d | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c12f3206522c2c17034523ff0a116be57ee2b55d | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/68276b36c0404db9a6afa71b1a30c6644cdc4165 | ORPH
  mips64el   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7c75f67427cad1827ba7b2d8314ff540f8404628 | ORPH
    or1k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/530f3c85252e5a0f4585dd055813105047c38f7d | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a22dcad42d4a8355f81a91ccacf0daaf2c971810 | ORPH
   mipsel    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/60ea89fb4c940d83302c9d2c38ae4ce8746210c8 | ORPH
microblazeel |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/14e20c4f64836670a6ceb4e37cbaf8d0a3a902c0 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0bdc64ec1d0d0fea6c6df480c5f8a280b0b82f3f | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b26aca28fbb6119a442351274c094cdb7c2f5b78 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/2497b707c3682ce7b211c59ecd550f19a589b1f7 | ORPH
    i586     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0e6ebe4fd70fb55fef44560ff0374e17d2ef7ebb | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/1413252335abe1b419350227af27ceda27bb9ca5 | ORPH
   nios2     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/eb64558ce12d6d2d57ae8b9d9eb2500071065978 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/18f0cf31d55d3de3b98c54a9e11fb0a53bacd62c | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c0819809f030d8a68f2d0989e3812cb8a055d0f0 | ORPH
    or1k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/23f5f3ffe084254f650426532865ebfddbbbe097 | ORPH
powerpc64le  |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b67863d452edf912a0860f929661b4d4946aa7d1 | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/bec6d52cbfbeabcc3b9052d51f760ffb09a1e407 | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/3213b1c500a5b0fe81524d258f009c386da0f73c | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f77b28d0fd5ec3172f0ffd3613f7c582b90fe662 | ORPH
    i586     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/81116fd0140589246dd601e23cb107212811a833 | ORPH
   mipsel    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a38af878b404f23f40ddc8219799faa96672411e | ORPH
  riscv32    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/5692dda42d6ffa229b7c38468784b57b10740929 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/76217c0b5571aab9ec9440040b2d473acaaf6c2f | ORPH
  powerpc    |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/6ac665c0b0e54a3cec138d5cef766dda5679514f |     
    arm      |          poco-1.10.1           | NOK | http://autobuild.buildroot.net/results/8f0788d6b4a800fe0fa20df7b8c1b57783048b0e |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/0c3959a90d2d33ea7a8d0f81b3d5ab31e5682ffb |     
  riscv32    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/6f181b57e0a1618e6b4bf8140cc975925ce35bf5 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/ff8e05e28f65c462e2036239184259e6f3857844 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/bdb7bab1106784d8a9fc70392a8c50b2b75945d9 |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/11df9768f17de71bcf49931675ddb7ff51a768d5 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/fc176f176fe458c4aa70f108b66b19073d04f041 |     
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/61bb97f6b05c2886646c73304632b4ba1077ef0c |     
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/391e4a49476c68eda30c95a4fe83292a4f85d3b5 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/2876e73c3220cd6aff827fbd0cf7118fc235947b |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/73daf8e694f216f4ea83ce2eeb80fd8bb996a755 |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4abfa81c11ed1a2583ba3fd70ac18ff7b2d756c6 |     
  riscv32    |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/5856c1dea524468f81086d2d243c72e3dc07017f |     
   sparc     |         proftpd-1.3.6e         | NOK | http://autobuild.buildroot.net/results/31343d370fb5de6a5cffae4349f750247ead3cac |     
  mips64el   |          psmisc-23.4           | NOK | http://autobuild.buildroot.net/results/7099828b398084779155361c7a0402ca8b7e3e11 | ORPH
   nios2     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/d2ceb514d05d9a6300eff0864869c467111fd2c1 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/86749030a916ee2c1ef292d3876e0714fc426785 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/ee2d0d82c3f482d2d62928168b232f27565febe6 |     
   xtensa    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/e4cc1551e7c029956a326f89dd0f617447a91e35 |     
    m68k     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/8592ad777cf438a299cdad5fc5224213bdf43401 |     
  riscv64    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/624b514eddecd0144b3ebff4e6d0ce9a97ac84ec |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/430b44daadffeba84450c7af34905760a8314176 |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b642e52d313180f1f17bdf980f29550b19849113 |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/08b97e32d56102a5ef1d525b89dfc9551ac85595 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/c4c449e1160ba969504efbad584a67259ad27373 |     
  mips64el   |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a47a5b69e7759172a295f0558e94d49d7302d382 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ef9c8884cf5b7a16b78cac738f74487a975aa0b2 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/8b2b0f880fbd4c11ee944e98b6777da15e57b1f8 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/8e0a92c7d8d7c290acabfd965f11a8bb57addaba |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/91e62a6792f1c5a5210e3f18ae8216ce53d627cf |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a7456d0eae50f682b671eeb12bb72ec2f6e07d39 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/76fb0c656c7b79ab425bff60ca9f009f41efe37d |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ab1fdc03cfb3e21c444fff9c1fa4583decab4744 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/c13198a00718a3900c5db6cd369d5eec6d53af67 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4b83a2cace21ce2d9d160970325e35221ff04d21 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/851cc0b91063b2e2564f774b5556cbb0ea616d7b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4e116f2f1ba6bd5e205ce363f1dede69c86f6a0b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/807f013a2b58baa62fa1693de49adb196ba77d99 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/22ba80dc9aefdc5c4aa38afa831a7e7cff0fc8f4 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/2d5bc9582dc0e2635ec01f53761065b32886faa9 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0f3c9f4545efad8b30f23f88e18413de38571636 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/91f5fed0d1ec27a452482e9279058711bc7e8afc |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d8dd6f5d5c98a9025aab88efadc6ea04da1154ef |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1835a679c251e0339df550dc69f7adadd641b2a2 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/cd887146d9a067266acb06d52010c216b2ffeaeb |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6fb1636fb3c06a3514df83b8f5eacaa490c112e4 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/68172035d83cabda447cdfdb73da72625155e709 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/483a53d1656848c8ffb747e15fabdd7851c73bcb |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6974682c568ca4fd401a7d4aa1212e73ed894f61 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/971013d551dc0ce0e52acdfbe10b9d5cfda8fa19 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9efb510d4365a5404ed573f73e7553e671224234 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1368964433480bfebbff85354772bfef252490b2 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/18f3e7f5b281e74981478ea66ed57f1e99696f6f |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e3828e37fb711478b9be269048a474d6a930721e |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/5addd90d5d9b4da33fa71a99e29028b3fe3f9217 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7c67bff301addd209aacd7b6ad042ee212bfedb0 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5cff854ab568cbde8443565a71dcfc4a6fbb0b98 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6be2b263fe8c5bc5e32fc002c30f6e412c0f3cd9 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/2d74e136564ad6752ea285191c4a6a8192e0e3b5 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/327db6cc00536627b759de9d894e48dbbc94b2d1 |     
 aarch64_be  |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6e1e607561b76c009658c2b87fdf8c4aa4e1fdb1 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/1a08d53a6e6b0f182754f6c45cb1b6e56c6105dc |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/362840f6b7f3510f721fcd37b657604a7217973f |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/526dd0012f912e00fe290a13303ef2c0fa2a44ee |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/fb3f6c140c67588a18bbb88b81801522fb27bd08 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e586486c2f14d9c11f24b99f0fa7030b5212fc39 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6c588fd66c44611672073ce5eac128efb1f27602 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ccd80d553a8d016820acfcf34db024ae38b3fe79 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/38e1bba74b40ba8069369025da8a0cc6c9e79f8b |     
    arm      |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/8f7df34abad844893e605cb102926c253b53ec72 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/07e74c89a32f1098148ffc1aa5ad12ed05fcbb32 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/584d8c0c5aed7e07649440e4a055519c850a2277 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3ee7f4bb9c88f6468ea366ac71dae5a69573e23d |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e44b88693d64ef52fbc593f22767148667f37dd3 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/58011b4d217c0a3647d2f3a01662417ad5dd864c |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/16cc26493a509402e69d82f04b83cb8313b557ad |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1b982de4f61135685362b9974a0f3a63e9f10252 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a0629fe52986de494765a168319c2e08a73c8885 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3a2809c19eb8804aa413ee46d531a1a74d43c95d |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3f1a00e763d6f6250b65fb65632956646c8ed882 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3b1c4818f5b7422aef1b89fb806c315af897db25 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7ef5826dcc56c87c7005f5913c3b45e399297765 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5256285c979947d1fc584bac8eb21561a29a5a44 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e32b97ae35b62963181c8e665961e928f3e8a43b |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e643edc750c729715455140513423231cc19ffd0 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e46f3402207b9b2b1d412258bf44013f5d62da1a |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/45d39f08e83beb40b92855f14d3b4ea9ab475a6a |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0839aa64b64a069af344f9bab115716f108b9669 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b8ba081aafcd7ccfb580ed7650f63d08559b19a1 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/cab50aca2d2cc6cef9159ae675f636c494d29f37 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5947368f004aa42dee2d40a0d8da0ddb70ac79a3 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3aaabd8423cd4009ed970222cb41e44bea73d5ab |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8fa4a265273a5dfd2bbf8160be069346b4161077 |     
    or1k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d2f0014bc965218c61bdb312192615893af9e780 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c6f40d65ef5d508047a482777e0340e299de6fbe |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e28fcfa731de13d401e857d6522ad7f4eddac118 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/091f9f5e3845ced64c52ad86ce853568d34818bf |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1acc6d3a10a2bf569f1499b4bd35542f09d67edd |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ba3772eb948569fcf43a30f77901ab0baa03e74a |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/88c236c2cf32a3121a82276a69c76ef47aa19dba |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/05da0449ea0e42c0d2e1c32a4b2443277d89c8ca |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d4cfddb8138f158a9d9c1f17c81b90071e5ec140 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a5f85904c8e7959c946e566ccb62c3245369822a |     
 aarch64_be  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/713ae4b4063444e0f6eaea88b8a8d55f2ee105e8 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8518e6f7a86b84f49f9e3ed6b5381e01dbffb4b6 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/fea647cc962d8360cfa32710c6c1dbb4c77238e8 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c976d492abb5225e1f2917264f1cca39b1b30e12 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/78d943d63b700e672505b7e31144c8fe586b96e8 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/15a0f8be947a8c11a896d871a716cf5865af9b82 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3ce2b2df52b71a2e41ec32e15bf12b20883a8689 |     
    i586     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bfe6743d241c058321618d896c07d6690de9685e |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a15bb96f97bc82d3c2ee01755952aa455421ab33 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b40da363d51e074c3e6fa45aa096057823bf0342 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8fd7bf7188a4fd69ef9f1a57cc6de2b447912e13 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ef505a8aea3244419c491acdd0640f0a43c1d9d7 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0eab4772cc8417e6c89ab9f71ef358b183812c6e |     
    or1k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e8ab41156b5798c8e5b01d6c5b3bd7009eff84ae |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/17ef8b87b1a4503af82b612c62f3bc62075e2173 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/30afbbbbf1c42daa1a681e4cc13b49b4940df8c8 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bd74c12cc4f3d96baa4a75c6b386ab5d5b2bdf40 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e8ec602b7c4d354859d4fd5e4410d49368019f23 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/de8722ad70f24a8d2f78b9d0c5dcd9601cea2fae |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e3669e5706636934cb72e03bf489ec7507b541b0 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/010bb3118e0696b8ac8b5bf275fa2a4a8c3a704f |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/31f35a7622dac7e81f586a7f070146ac386da2fa |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8c7fd2d74f845debb6f66a9468aa33717c95f85f |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1569dde994e15af3653367f2e499305ea72bd480 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d6a1bbc769486827f843894e6639245d0bdd48de |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7f641ad4a782c400e0018baf56d5e08ecfa38b23 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8731b98c223ba389d4c34c105e01498e21699a81 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c8788de52623794fac5fbfd0514a277e95982940 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/594a1f35a497fe87b9fbf5a3795f103c48b6d6c9 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/75442128d8303095b5f461b796781d25fa3a264a |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b3c975994fd12abeabf96433188b2a0becda350f |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6122849550365a0f228fe02b28a35707bbe53d80 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e54f233608efe60cb4dc37f98084db27c05115be |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/afc5fc8af50527fb3dd138e676d800b9416faf2a |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/95678808cf486cae178663ba526be0960751ae24 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/40f540f1228bb0b7f20ce409f1bad70577c4549c |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/556955f0cbc0cc1976bf30bb3a02b750213e1ec5 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c0043c3affd57fc5e2ab1fd5c2d102073f53a944 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b9b5d91281f90a7f54f209f02180cb5902216a59 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ff3910d8e44456c6aa4447369ae0764f8db2212e |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7032d13c4a1b5979f6737d1482a8452e26c705aa |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/03f087f98eae97e96d825e85fa8d3f90afde9538 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/47e3c76306a9aeb4469ac8ef943e94fa15b4f026 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b91ac99ce2c085b64d40e73b1aa16f98619e7f3c |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1f5aebd5975a8e27040a008fc721ff3e4a7c6a26 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/aa7350e0d9ab292afd665d60cd60a95a5f1ec041 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f4115d38ea578beb905f22c7076b0872cb2996fe |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5d939a8f0ec2121378ef73d3f9b5b0f60dd38d3e |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6b0468ad271939df5af030770355f7e85be693c8 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/95d3bb8ff846fba9f50a9fc18f32ebd9c408d7b9 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/76b1a62e7200c6c7ddf5233540598cfac17bfa01 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d1c6dc40401174c727eabc2afe861a0e5fe9421a |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/cddb398404ced59d5bb8aad36d505fdb27b79d0b |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9d2f412a83c00a6225125c2f00ca835c6087bb7d |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/09eda242a7e97d65e01b18a1cce3cd95873d921e |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/add352fa077982b66f1260ef561f99e50a5e40b3 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c77d79d97c54cecf8d2d67a001e03f1b7448c2ae |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b15e0a7323dd6c1f5a9b3849e7b621e613bb1679 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a1b1acf6b4471c165eee2aa42b85c3e9d2dabf9f |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ec71d7dd866fea47df3e4cf9aeab142e4b034c04 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bcb12a6c026efaecd431648618f87517ec08f0ea |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e331fd4a2b6a86fe86ab13a22527e946249ba840 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/93f07bbab3b8cdc432e58f8583efcc1dee21c30e |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9c2ec0c9fd26d8ceac62b3040e34fadec423146c |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/85aa5e17f3aaa2156c3c71aa80567326769ea60e |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c2861e7852cfbf0a2d3058836814625efe6f9e9f |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/496eb027780d18bd9e936e60e974a9ae16a82241 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/858ecda223e1b07438ce8cf159629b6e8c2f6ffa |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/47aef15e9606d067c76d4c4feb47f98a0e9aad7e |     
    sh4      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3071513f25513bb4df56c125bf529f4404e46eda |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0a3cc5eeb8a01b608a68543a9692d8daee0c4ece |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7280fb0f6a71ca1e2853b9b375d6233eae36dffe |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/66549c9d9d629f925ff76fad798cb2953386be56 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6c79a01d6b9233f3e68c174410f227de1ec8ca7d |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e6ded8570e995bb1dd48cfc08568b5465e9ad583 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5d37a635a994e725ae4ce0ce8f42ce39c879f751 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/af43cd4450a83a2012e2059a6c20a1efe629595e |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b1d1974be6bc28da6fe5211747d16d7bea4f5602 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/28a23c707e58cce860e78e569748379bf60326d9 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6a9598d46f42602053b4fdef5d58f7c8c68efbb6 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/042d24168d6a018e8df330d9eaa4afaf020a6340 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/42f198d3ff35ed7706ad4d24d1da2eabfaa2c47a |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/00e782eb23eb24c809be463c6636b91dafb1eb11 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c679604f2db9882476244705c11a2f87b889995b |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f6db0df6f22a5667b2ad7bf0ba3e78c19758f79b |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dfb67021f699ee66552fd0fd5227eaf5eb3aeccf |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2048e56326bdb4ca8fe879258aebefd65f11534a |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2efd037447114f3986adbc92d88fa992b3047287 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/603563888323c7bc7b396ef921f624e62d11d54d |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/316313a077302268a06050c056fc7b5ac210c4fa |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3fbdd97e9b64c78c438ba2abe83aeb4ddd7c5c8e |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/05036c1e5ab7967dcc91915af871ca0c38b0d62c |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6857638e08e819707a3c2627e587c0aea17a7af0 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9423600ae550e579e1b9322e3d1a29e0730b91e6 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/90d69f966f8b87c4263f828cfca625a8493c3c65 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0a22ed315106fdd6534f28fcb9a08e52eeeabda0 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/90322dd7a05c224aaabf31703c8056c82e80d3bc |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/afc9522aa1f4efa99f337cf2ce002b3d46a7c167 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/99f899ed0c6800e17997b717147ac2218825f110 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/366b4dddc8c641071396ea57723c88ad97c7a566 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c61b01fd545677f2e074cee1cbdbe009809065fe |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f7501ed6b66a8e017c5114531b3ac64668327f77 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5025df54d9418510ab10cce4f88e22d745d95e69 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/76c1071a1d149d6fe46cb5ecafe4cace73e24b9f |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/91c6cc84855d7a6df1fa40bff641c46c91e23de5 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e8e8050264869e0445762a5b703642e629e9045b |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/bbff06934e4d30ffffdf44ddb4d40fe3db2cd4d8 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3a4feb304c67797cfc3f85bb448fa1fcb22d8298 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/e9f1b1ed829980242125931b3682560b888a5630 | ORPH
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f7d9623f63029dc1a75eda11eced2932abc20088 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ec7ecede43c6ce78121ab00f37a2b19e893243a8 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/4741aacfd28d7fb593987b3723250507e60b6adc |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/c519ac33d21e21a36ef9c0ac9db1b81cb6748b93 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/88020de9b7f5b1ede1ca928be41acf1c8d97e009 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/e5d89f9e9744e65d776eace6b950f287cf67c798 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f72008713948e41e356dadee58e3247af93d4ee5 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8868f42a46772d1315353f0957669b83492e5a78 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/683e100a59ac26500efcfbf814f058c2e872404f |     
 aarch64_be  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/77fea2eeb070639b7d198b539150bc0d534f571e |     
   x86_64    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/5fcd167b934a9eb986a5d9817143ca94d0100e54 |     
   x86_64    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/149a78a0d45d33716715de47e87e928ce2bd3331 |     
    arm      |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/be0402cec3048ad1390dfbd4ce82b6e99d41ae7f |     
  powerpc    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/6aff1e1a2feeb9b446d389e8904e4aeeafda624c |     
    arm      |         sqlite-3350500         | NOK | http://autobuild.buildroot.net/results/e8b236c0f630129de521fd52a13b722cbd98eccd |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/aff4c1691d30bdd815cd18a3b23703e49d2aa26b |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/5a021d561d24c0d5a6c92296146f44701d331505 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/8720d1ebc2a4b6eddc736f4f7854f5d5f956d7d0 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/d129a8bc674d52593edce5cedbbf5d0103a2767a |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/ef532743f981731922a5d72494f44d5816d7f1d3 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/05a5a0a203a63db5df9e5b03a40a5710b9b4d5b0 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/1b58dcad9cffabaa8c487134a5205ff479bbc002 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/8641a98a85fb5f04da7f5e1fbd3e19d7db36eeb1 |     
   xtensa    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/3747477bb00509e2f99570870ea594ee065765ef |     
  riscv64    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/582e21c6746c2831ab1e77f6b94ea0f7fdbca252 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/4602b0d1ea4b299596de55df0e52b6881c8bce59 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/d0211858b48215676363b37192677ad8190a6e52 |     
  powerpc    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/ae2fb7ea249e84ddcd4e4b9445bfc25d256b32a9 |     
    or1k     |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/7f591c122ea4c662e4015c3727d5e2b6375bf682 |     
   mipsel    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/06333652034074bb28309bdb40641734088f3f0d |     
  powerpc    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/52f30efe48749409160f85af2adb06d60c7831b2 |     
    i586     |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/4eb38e78f838392dea66bec01c09a632365882f9 |     
microblazeel |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/48e009ff56564289af12e14d0d3ec4584285f8bc |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/28cad9e2eb6ad8fad9eb454b1a65ce9082170735 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/52963f5b49fc0de023277a626aac4646da068aba | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/9c816d49900241d750dc1d555e53f184ebc71111 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/ef0d8b68e97812e64b25e634cdff96e9fcd3321e | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b156aaed559588942ad761e511a15222bcd37374 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/acbb15d742a3209ee60c55640cd15a05ef3f015b | ORPH
   xtensa    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/b59746b569d863171ff60a9873012fd35a4e14b6 | ORPH
  powerpc    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/ab596d740616663c60b897833a39c29a646d829d | ORPH
    m68k     | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/7f0a71d2a761ba51208072717a41057e4c89998f | ORPH
  riscv64    | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/6d22fa2ef2b6e9ef629bb834b2af570e5f53bbee | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/289a057d89cdd4ff7d05b0d16ace10102547a2e7 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/fe924c8a63ba5d4c74100cf52b44b82efc6261a9 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6c611c73095ef07e606dd9df4a81df6d723faec2 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/474c82a7a13fe97307368eda3903e47e85490a32 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0fcd02a18608e067fbb4ff9a195e4b69ddcbfbd7 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/98b9209899474e48e657abbdbc77386b538d57b6 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ac48faf8a41b6637bbb968ec91a6ad00223311fd | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c58930a3c6d65d9545e25c9be7cff060723b7373 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/43aa42e4ac20db681241873db879e9dbb2108aa9 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0647609adf28deda4bd04dba4751f42d7bcb1d32 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/335d881ad0d1e25c78420f4710fde5bf66a5186c | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f31d57087aae11220378f2e37def4d1c55bfb309 | ORPH
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/abab17649142a6634cc0b4958c57be6a311c6eb5 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/a0842b252b06246c5dda3f654d0c24af58b44a0e | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ef92dd9495b735b1feae49c39a3538f9806e2f58 | ORPH
    i686     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/cf9a4ee9e43d5b3ed8f232d77d6688b7371557e2 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/700b1ff6d242b08e86d5f5638d311f57c145a4a5 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ce0146efd17304abf6f02e78f5edde09e2898898 | ORPH
    sh4      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2325b3d2185e7d49fd3f1df86c1056919434af52 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/7684a8a97ae2c79297032a9985aa55487c360c62 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3ba7799f4a12d4d7a9ed1151e3174304e70edff5 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/aeb92bdf339551ab52873860f93dad5c3e83c772 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/85404c6dfc8b78b93d1438d82d89d9b5f6b328a8 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/636725b5789ecf747b01bb611d7218d1a947508d | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c3472a865ee9b83be895efeb4592913033a610ec | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d17f8d6612bbe55cc298e55f427801447d377323 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/bac7aa7503356d03cdc1e18d0e68c3fd19900e1d | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/cf259d64181ffd980f7c13ab75ca92b941d2c1b6 | ORPH
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c3d83ffeb5c0aa8f97a4deeb098201563951d15c | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/734bae2b43b448396e443ba021bd35347da61464 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3dd153d82ee7a1a725d83ee0169c153490c31b79 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c65032c0312e53ad97d0bb1014c41c429f35d554 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d0edbb205368afc6a1dfffd5f4eb81a6b8dce03a | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0bab32b89e14bec5eff58699fb918d894d1a9858 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c517a1b69c419df68c58e944929eb231f0c71f80 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2d846819219db8ba7d5be7ad604ee62108af9630 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f74f08b5fb90e074bb6199172179ec073c53f3b3 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/380b118a6253b13dee5ad531b985d39309654b34 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6a223f4b6545d05ed58da8bfea3a853173d6ac89 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b1d964b62e9ab66b29d3d2d951aa90a15f2ff9f8 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/a811985d61781b1447d0b58a3e5dec31b613460c | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3e51a190caa91e57d0f3ac2f7f9e3b9bed79c215 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/280272d1bafa5d4dc2dbc8efcd9a296ee9863fe7 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/9ce7de831964a17ab4f6a450678fd83f6a051c41 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/285b93badc637e08f0ea6d70bec45bc7671fb913 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b07aba7b5edcee3061a164c57a04f99139aad053 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/853e64c7b353e69c47df4bfc6b3f549678d95df6 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/352ee444bca14e4a4b59062f561ab72be8308a0c | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/35953327947fb768ae39c30674f17c365cc1e716 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/65d6542cfa202bcf8da2a9479d37fe0d72227cd4 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/cbef7077ea564b30cd45a38bae5e04db2aa12998 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/19449c5716ee6e29d7f456cc91fd1ee9b96ebf0f | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/672a54ec359ba38a69d800c379720fbea9111c3c | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2c4b5338dba381be34eb9fef85e0fcba6db8d628 | ORPH
    sh4      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/84c28cdb5b3926459969a4c9d41d31abb0680d89 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/31b0b5dc45e2e9ec72a85aec385867fa32a49e07 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d040235d177946e171abf7d59567c79992d02789 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b13f92be75f7ce568637d22162172f5aac2a46c7 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d223735607e0b4fbcd139c49d1ae6501bd99e840 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d96bbddfe785fc2aaaa84f1cb445c0a9cfa72517 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/15fd37dfa7ba443067a73de55aee1ba2f7c1020b | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/92fd8ae996727737f8da317b4a7a1b462e339f5f | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/8f3d96d6775bf396a39b26a1e89cf32feacb224f | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/84f3586f625034b00c5ce84a47744a97fdcf005c | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/340fb44e21bd5f0fca8b1f75b1e2e53fcb9a6bd6 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/a4d5ced995cc1aae43f284f0fed84002c9266db8 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ef8dec7d626bc6e2eda5bd28aba8e9b8f22152dd | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/5f4a29f23d73a1d7583edfbd867af0f6a6d75071 | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/4ac913d2ce9f32aa58c0811006cde4291269e535 | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/15cae8a1187ad993225e21927ae5bcada72aa8f3 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/da34b2af1e0b1d53ff05f9588f8e1fb7c28b6f87 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ef7b375e18d841f72b79a6bf51fc71032a857904 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0cc4059542fe7bccc7d65d79eea24efe92151862 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6e7410ddfb6454298a8f22bbdeed2ce5adf791d1 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ed516541b29f5d29b2ee2fab8d848b20437ed85a | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b9de1e64e059c9a5d82793343c1c3ac9bfb82997 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0c6fe60c6f280cd9b2edba6ebf7bd72927d816ac | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6d077f0f916b4f7fb77991587804d1abee1b4822 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0e56053674d55c404ef2adf2f379ef9dc521e59e | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d0c7de0a5746a4df814fc087697661d0d67de2aa | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/40b79475430e0587c1733d3282a7f0c5d6e7243c | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/37d8036aa08f105d2a4c6219db0a961228f87bc8 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c4dcf35fd81b0b5c1b373d2dd1282f0a16bb445e | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/93bdbd4057cebf60e73253450ce8554553dec634 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/53e782c43b5477f0af50879c9bec3baebbb3bedc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e0ded74b81f3504173f7e14b19020b7f3aa6edb9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/77313d49b2bbce049f6ced43c9ec386e5697803b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ee41c78c159ae71cf950063650299f7c3aa0414 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c965d033ab9a2b88c783ec71d93a936d9a1b514d |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d4bceed08189389af785027202f684f27cdc827d |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/e71e8fb2da95579877baee75e992b61e7e37ccd1 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/184208672c513319553949859db5ae3acb1d0450 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ab950fc38e297ceff86c79b6e7fce15406e1945f |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/00a9ea3231c97886081645b10843d8221171172b |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6be464955fd9398b4bf5ccc5d011f50beffbe311 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6af1915bfb5d6cca4059f6cd1cfbc53c74b95f48 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ce11d250bcfdc680ab617ee2c7c3580de0d91a85 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/7aaf6f563f46d01e3585489b2584a2cc81731232 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e499a02f66101b1f9e6e5214bcc58a8f700412e4 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/b078ae169130127e2f161d61ab111de4637510a7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/57f3b06aeadd76d9ae19e57cb35b30103d69f7de |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/eddde5c251fe1174eec0cafbc2fb0b4a598a3426 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc27c0817432dcc9092d8f22c4e36dd989b43b12 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/40bf4d794419ae74d801919a0437104e70231b12 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/a4d0c266b888c85a70be59b870883b18181dad4c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dc5b9ab685fce6c4bef1d57b3057244e09a881ea |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/92ca86a3afe79d5a351172cc2a131c6b1faf3fa2 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/348113e9d6f260b35b4fac08b638dbdca3cccbd1 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/4cb2e30029611e1c5bbd10254bd3416fd380162a |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/00c01ff24f6cf13b26abddb752cf443982f083a7 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/99763600554726b7f58aa56b236ecdffc064e4cd |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/abf70d7e6bda24e5b2af36a78a5aa4877d70859a |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b66065ca71aa7b438a0e9f476fe70d40292bd384 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e62e6063f69237045a47287b6bc5d9c463095f2f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8e4c7c92851af94d1503371709d58802ad233c7b |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/45c8c05e1cd4ac893a25ac6c761fa7797fc6c7d7 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f2ad107e0c50fd4156341d7b49e67f5f9ce4e7b1 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1dbca9389ce0289fc9a18e0f956f99b4d7561c8e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5900f5491d8d26c7f0f308b8057c11a046983ad3 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e58b11b92a21b829763f8528e98e0422498b2c78 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/82558d250571919b7700d2d3b8f84ed12a79c111 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/5d1d8f039f957d4b24295c467d02dfa1d2d1003e |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/279d87b9767d03370fdae7a9ece697c82c504fa0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/04750d4e1eed2337a29adbd3e1f340977acc175d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/5549ad78d8cf9a2f92a24455a74beedb057f0cc9 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/169fcce846de06fa7da50530bf51f72e95514174 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/364016a8a029aa59361b12dea5c0384f3252a601 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/9607700efa001a97f7e0db4cb412b77ffdc4b06a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/e7748fb059bb0302a5e82dddb7d0f61d389eb467 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/9fd4c48958b766620cedaa416b7d9ae1e8361eaa |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/31ded1cacaa374f2197bbcb780d66fd86df44a42 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/22a38c3f2dba93eae3216348ba4b1484c659c829 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d8fae169137b805a74fd55e29938997176b1ef7f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/daa6704952c1b6fd764c38816ab6ee71c2d198ae |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/d5bf9ce705cd2d0dca911c7ffe815a71993339a2 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/a017c10171237b769b90f7cf7938800078835a67 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/1ce992793a9d541cbf169b59871ca1926fc0b998 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/084aaa90eed9fa36b95cc9fa232c1e91651c91e4 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/442d9070f05a8ded67d197b160ba8aec2c5aa675 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/db922cf2492f628932b9c7bb3a6e79fe7a1f4472 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c356c10de6826d429998c95d3281a60591b92cf0 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/e7455cde04f7e7d343cb65b2089b081e06a97589 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/0e8a459f63528da8befe16c36f7b3240d9f2bd05 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5dfe669f25aaf91a85950e658b11ae572c9d200f |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0bf43aa9d8f5a2041d2817efb7e4b61d9809728b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/be55cfca59e5b8fdfed20bfc41303d0d6da64ce7 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/dee9a64b576ad414b4445dc07a663694d5f07df2 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/835289af48c2ac103550dcc6c6d3a0ffe1a12af5 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/325aa4afb3a3d92d171b2573014d1c6674d51e80 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a746b23c33519fbf95e71a1c7ee9aae8e4e0c26c |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/88d30251f7a0bf0c2b176430fef41453dbdf783f |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9d30d083713f291ac52a8957b6e56fbd107ab084 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/0443369dcb32a2ae3d74eec1bb1074eae492eeca |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/7a8261b67c4d9ee64caea70c0b777dddd1646146 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f3a1d502fd4880a4f9d3e73b5e02ddc0879fb8d |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/76c5dbbec72a91f67d3e5aa1ee5550237073b133 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/32f8510d35231a9213ba7ddd296ffa49877b2cda |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c305b9d29bd0c13ccbfa06c427bdef6e1cc77a28 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/95e41a9ce12ab8a8197442b36084be74676a795d |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/07d5a291ec63dad1a30cd0cd18ad6e395c20f4a3 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/606f274ae5a130857a4c485e870b0cccbc2b72f3 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a58a42fdd0414033e960e7b9576c5d94db77b56a |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/de9f40fcd97ccf36b66c8752a6fb723a6f8c2020 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a9f5e9ada72ee3f2f856766f4d50703d9188b32 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3948743230bc0e3c16fff834beba179e64c5fb5e |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/b8d20dd55d14d12660b7674e3284dca53708d756 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/bdc6a159d77e283a7d10911e9f463baf715fe9d3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ac4bfc654c064d4ef89c4ca9188cf9dd728b227e |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/2f064f56fb3a3e93f7c32ead80c4f1fc16998cca |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/bc2e5ea6e2b1b222199619452f35238e4acdb5c0 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/532e5cd41deab9f7bbab82d5a9c1b5694022923e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/09c6166ccaf8d29c583c76816855462e61ba5977 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/68187a50c16c5c9c8ac89104c5c535d5c8d3ec46 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/188d63df2ee3f9eb076179dde93da3f5b7315893 |     
  riscv64    |         upower-0.99.11         | NOK | http://autobuild.buildroot.net/results/1fe866070c42392d2cdecb1f69601b506ca58b21 |     
    m68k     |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/ab4e4eb69552b65e48952077219008958abcb54d |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/8d4000678e972c416a149e06c348f6de932aa8a1 |     
  mips64el   |        wpewebkit-2.32.3        | NOK | http://autobuild.buildroot.net/results/001d33e3687c3b108bfdf5ae5043280e7e313470 |     
   x86_64    | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/7d65c8085a1ae122da4acc296538f2277b3ec15e |     
 powerpc64   | xdriver_xf86-video-tdfx-1.5.0  | NOK | http://autobuild.buildroot.net/results/167987ada988cc39d249d913d6a761da4ca0c54d |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/9079ea2a2e9d72f4a1eebfa5c159eccfc2fe2d79 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a4b15864f3f0f1f7de01c78041dae8f6c82ea9e7 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3a24ad8a3463758a9b5acfc693b09a707b74761f |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2d41876dcefcb1b5dd2cab9cb69aba40c841d05b |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/b6571146f40d6dc7d5882fadefbe3e259f76fa79 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5e54b666f02cafd661b75a41ebfdb54396786e58 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f46763d661b67fbc57a2114b3e0749737dde08c8 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/015635d18f755ec3c74864a885478a735fc33079 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/167f68190b714bf65db77626206ae3d38e2e522d |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/1f28321b4d1d874aced6748ffb5b7bcba060b83f |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/ef51c78a6f7c179f9ffccf29b2fe2a794e6bd6f1 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/cc72f50ab82bb5d6d9098fdb927e970b614577de |     
  riscv64    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/ac86ea78a140b454c592bc97d5057090dd6a5f7b |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/8f13adde7d6df49b957c85a5874be8535e06cb95 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/f735ddae2293aa43723261082f2f70f15456c918 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/ac01046cd55d2e928445b4f63840a7f8c12372f3 |     
  mips64el   |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/f7c5ef524e2514a125b0bd1df17878a76141f9c2 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/e569c7ff281fd96192de372627fcd3cae7861de5 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/035799ebe0af0adc7a886ef141341aa033aafd7f |     
   mipsel    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/b3da601fd7a32257bf2c51c6ba9994e4fc7b8928 |     
   x86_64    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/955aa0ee51808cdc6d69c1c847424aa83fedb2a3 |     
    arm      |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/e6a79258093c5a4de189254109ddfbd9547056c1 |     
   xtensa    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/15cbb89dd1c016baeb52b1fdeacce6f75415fbfb |     
  sparc64    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/025029fed28132acfe138b7d9995b285fb68048f |     
    arc      |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/965da3762a3e756c041cac1c9c88697c34921403 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/9212c4d0ad5ebbec6403f54f7529a658b0e5c394 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/cdc728d6db53316639952f0082dda5d4e9a724d9 |     
    arm      |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/4624fcb42728418cdf7f8eddded55baaa309a180 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/48cb6820dfce058fa278950f4bd56f87c9c30842 |     
  aarch64    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/92431d67c74be9b8bdba70c96304d2dad3339f90 |     
   x86_64    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/fb9252de77e020182fea7e9011a3e402c49d926b |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/9b7fba55af306df9aeb90e469de1ccb2ebc46986 |     
   xtensa    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/0725c76aa902c820696eae34914f6153bb14d8bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5da6e7b022650b0fd420e4a44be36f2ad5a42eaa |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e2d7795f59474d17c3c0cbe39c2596f9a7b496b2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/28306fb8954b1dcee7efabed01e5d0f081df43ae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6663b7228b7f33c9a2f33c140bb3a837f993e4cd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce6267166a3527c76403b9bd217f4337393d168e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1be91ed0233979d99ceb68456888ae2e835cfbb6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3b678b46886dbd8804a6572195a46d91252f61d2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1598e1ffbeb003ad7e8a1bd555e52ed6a4215af1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/faccdef82ea3826793843cf9de89fe4a8512a4ae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ca7963b103c140080cc6a53631a2767e2c9dee64 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5c873ad1a94fb33f27578ffa757be8740674e34f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9d94dfc2622907cbd1efe2332f290df3964225cd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/97f93660be037c4dfcabb3fad0bc5963d962a8cf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/28a53028524cf7a86e01a5ab1b6e1f3cfa86ad0d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1be0ee4794ae2aa0ea71c332b14a77a04c524807 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a17406733922c8399cab0dfef35de9c1f8b8dc6c |     
  riscv64    |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/78160452c717c0566f2707ba5a7b83c2bf1324e6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cfd680991b38c21ce84ef716acc042c4aeef99f4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0a9c1f055a1acea73825dcfac48e2f85b1a18373 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/28a359a1ded567e4e6728bcd8195b07acf58f048 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7f26119e639425c6d90804866e645eef729a5f52 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b88d780dbd67a66237b0dd325d281e92e9d2743d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3ebbd82355b5278123310584626dc17f64182b12 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/db3936dabc6ede1fdaa9002b80ae78e5c8287aaf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/82209f59f75be5cce00604624d163522c669a450 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4705b44653fc41ad9cc71c2a7abbd7f1a93996b3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bd24936fd3290b9f854416b4d2a5874b4265269b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b462cf6fbbbddb539f28cf5e9c47d15125e72f9b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b831d0b9909371a6878851c020c80e629478f4bd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b59955db8f595eb8bc6eedafb8a37d788515fa75 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3383e845b8005a3f4254a04d4d64f248b833f569 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9269a1cc12b10c669af3250277fc4f098ca514a3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/87605eac4c9cf65c944a645c0f1107235d45e55a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b738b3bb62c84d14f25d13600a31b1971408ae60 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9614d0897e79d42d97ece7a859ac0e92d705c23b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b2898b13644fa9c1e6e00c29f7bbd3fcda59ff3a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3a06429470941746be5cc3e0438095cb0478d8df |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3403851764c770e58c2cc6256a0738bc232e6386 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/019d0aff937d1b0d8178c1edb563b42e41debec9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/72d912f0b0f9177f8764095df7d839e1dbd68049 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/222e6c9f6f66975f9b335a4cea1fad59c31520ac |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b1c38e9edfdd059347d637e96023d6ca66f6af9b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/50d7fc016398b50d713312e328d7d6a7fe94869c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5bed49c2029bbd1026b730b43cc775de4aefb8e3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f16d895caee52c38e44815aebc9c2686416f0a0b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fb49dfbdfdb1254ce511a87dbde4f04da3ebe948 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/5942698e6de68eade949c299fb6c9b32e78f1c4c |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/f299767a4e85c298aa7bdb3473488e9bfe7e32d3 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/acf8d465dd5187ccd811de8f1c7ae5c8e4bc18fa |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/846fb00420d03533225133477fe817a0a060e3f7 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/7fa40bc4601156ce28cca10f2edf0026577a4110 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/c321ab91e674efed8523833ca7c72f3eb2f55ddb |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/1a0bea90803c24f629ce9e4dd9cd39edabaf4b57 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                    htop-3.0.5 | 104
                  exiv2-0.27.4 | 44
                       unknown | 19
                 pixman-0.40.0 | 14
                  zeromq-4.3.4 | 14
monkey-f54856ce250c4e257354... | 9 
               capnproto-0.8.0 | 8 
  gobject-introspection-1.64.1 | 8 
               cutelyst-2.11.0 | 7 
                 dc3dd-7.2.641 | 7 
          libmodsecurity-3.0.5 | 7 
                 openal-1.20.1 | 6 
                rocksdb-6.13.3 | 6 
kvm-unit-tests-kvm-unit-tes... | 5 
                 openmpi-4.0.0 | 5 
   openvmtools-10.3.5-10430147 | 5 
            erlang-jiffy-1.0.6 | 4 
                  gensio-2.2.3 | 4 
                mono-6.12.0.90 | 4 
                   sdl2-2.0.14 | 4 
               libtheora-1.1.1 | 3 
                    mpd-0.22.6 | 3 
             util-linux-2.36.1 | 3 
android-tools-4.2.2+git2013... | 2 
                       gdb-9.2 | 2 
                   gvfs-1.44.1 | 2 
                  host-python3 | 2 
        host-sentry-cli-1.57.0 | 2 
             kismet-2020-12-R3 | 2 
                netdata-1.21.1 | 2 
pistache-f2f5a50fbfb5b8ef6c... | 2 
                xenomai-3.0.10 | 2 
                apparmor-3.0.1 | 1 
               belle-sip-4.4.8 | 1 
                directfb-1.7.7 | 1 
       docker-containerd-1.4.4 | 1 
docker-proxy-55685ba49593e6... | 1 
                 gerbera-1.6.4 | 1 
                gkrellm-2.3.11 | 1 
        glib-networking-2.66.0 | 1 
              host-attr-2.4.48 | 1 
               host-flex-2.6.4 | 1 
          host-gcc-final-9.4.0 | 1 
                   httping-2.5 | 1 
              irqbalance-1.7.0 | 1 
                    lftp-4.9.2 | 1 
                 libcoap-4.2.1 | 1 
 Makefile:753: target-finalize | 1 
                 mesa3d-20.3.5 | 1 
                  ndisc6-1.0.4 | 1 
       network-manager-1.22.16 | 1 
                    php-7.4.20 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
           python-pybind-2.6.1 | 1 
                          qpdf | 1 
         qt5declarative-5.15.2 | 1 
            qt5location-5.15.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                 systemd-247.3 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
tvheadend-febcf9818d7c37fec... | 1 
 xdriver_xf86-video-tdfx-1.5.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a28dbef4890acc3e60480134ededf8ef30783ae3 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/165044278a22b1fb773e72d63593a4bc615bb0e4 |     
 aarch64_be  |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/928c89da0f3a4e24ed2c7c41555c7e3658225e72 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/390f33347c7342e97cb4791350477834a7cf8ed9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/77a48796c3a460f11a7cd201a8396a81216f4de7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/18b2ed4be9418a0ecf0c7a9206d202134cd59be3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6a76db8eff57185021474ee648e9478aef886fe1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7b6ba98aa33432e25bdaf01d4357b69d165bf843 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0c3cbb2638932ab5224022ad30b88a577defb170 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/49cc54355914ad5a624039542cfaca2f7bde204d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b06d2b958ba44df02f644b9c0600069f81ae1c80 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5f8f3dc0a6765d9fb26b2f6b6a8cdf876fdf789e |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/cae3448dbddccf864d9f32e6b072d2d752ae8c4e |     
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/05df129493f32e28bc890b1dcd6f63ef6716fd40 |     
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/b66332592eb2e38cde2a4ac0bda164d18a41207e |     
  riscv64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/79b96e4704c889dd712271d8afe93bb98d93a56e |     
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/aaf0147eae5da1c7fc208f2c4aef0dc03367d716 |     
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/5c6bc89887f6e6936a1c9810c954ed873b18fa9b |     
   nios2     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/0f6e5839ab6b5c702ec0de428ca103a83054638d |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d0a126ebde36ee49071168d41c19193fcdddbc77 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b0f0d076b97e051a4a10076b991d34db0f0d0378 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/72723448b14aeb82799d3b24956ed5cdec59d8dd | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6cfd0d32994cc902f5ea0c0999b8db124278ec3e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/efb2bdf2bb15f0ad896243b7280975b4ba13013b | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/44700300f687f760ff54bff70da9b377a9bf9248 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4e3dc8e526e3eecc56ca6b1e862e4021a4ff60f2 | ORPH
  aarch64    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/34d8cf36c7d3b04ffb76b38f6e2c186acc2878d0 | ORPH
   x86_64    |    docker-containerd-1.4.4     | NOK | http://autobuild.buildroot.net/results/4380bba72a8eec07fa930f3562c370b190260c8f | ORPH
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/7d88f0bf95f0bcdedf67086c1fb41968c32d493b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6437bfd4b64c8e46354403d3211fcd4f6f3abbc1 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7da829c15c5433cbf3cbb3519c6d9d4de20cf176 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/be931b26c0a50cd5880050d15def29e79f39d507 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bf3d5d7292098d8ed53e56d9191525b946bc0cb0 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5d2088f510b65b6af2d857bb1cee212e11a2d5d9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d30595887708e11963ae3e7b72176b1844c461a |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b40bbe66feeb040b5707f7625f8826971d8f734 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ad8633179bd3cfd4dbfb27df24460d428cf2f150 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06f184ade8c75c4504aed066fb3f55d5096c9bd6 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/74a4d4d29a078d2b6eb2f91c18a575ca7b9377d9 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/122b06d135b05b1acac1b5c3d4e23ab1db501bda |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0e289108fbee2ac0a53b97dd12cdb7a5d6de4282 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/194daa8a67014cab786e49cc9399bf785a495290 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2020dbec427f5deb462ff554b991f39f9acb390b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bf83d30d198c2b4e69692c7d4c8c11b626831feb |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3368e5fc6063a834a027ce2e14896408f71f78f3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/816e13d10e71605cb5c8d8f695eba33e25a1835d |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/da214754e8c18c61aa655fe51b08f17f76f8cc2a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/96489092afd1fb3d5b6e78048bd1aa03dc72954c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7ca7fdd6fa1702bfa894af5ba5b0f5f0108c4a5b |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3d47e2da41dba736e977bfcae30d64282d00236b |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/07b9d34a4d2174d639f9fe4a987a299a5f9562ca |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/be01a790af51c1c83f6ea96aba8e522c4e321890 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/96ac58f6196ed8a73d8d8814178ca9a7826db1e5 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/139df002a316e60557146669376e66f26cbde659 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/041c695b7de243719ceef292b0cbdef77dbc4ba4 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77e2f49f8c91056d63e1463989032e40eb572cfd |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3d15b0961f36cd480b6297ebf4a5f322508bb22d |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0d5a55e30ac2a9afa818383e17587a3a479c77a2 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77ecef6e2729a5e85c302137041474ca38861687 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6144cdb2b0129c5acc109e07fb82e542c788de33 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8eb7a416051a7eb9a371ebd11036b700cc0d9d46 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa4547c7a69ec4ce7f05fd3677e2f0a766df2b10 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/005d66f0bc55e210a735c4370ffd771f45f4d53a |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ba2661d54ed580c95a969531351a43cadfbd1d70 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a44c0b8c1ac067b67704519c6e0260732bf80e2d |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dbafff5e5e7a02eb0f957b8db56df7e261cd6dd5 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/84726923281cf4fe11739478cc854e72ad4f5714 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a0b947e838888cb5bc9fadb318403aea5a2d9da2 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46ecaa4c095b6e3e7dc5ab43872721c5408f1227 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c9b07162a3e2b4eb22e715ce79813569d899c132 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5ec33128e1182317513c0b0af11cc78a07bb3c40 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c79776a914847f3f61f2532ed10fc9fb9df7ba26 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e22faa87015447d8e3aaf7782fc44e288f15e151 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0c12803e882f2fd9820186f1b3ff82f1ea6d8db9 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8abffdc7ae25e44a9cdd3eb86dd2c3a9a3ba76e7 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f6b13269967ebf13c5851b15fdabf0f91b0ee4ba |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8375c3d2ce6953f7dd061eade2885fd5fc9ad7b9 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/8be4111442d59267e66ba27caa65ceb17d29962d | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/0acbbcd393235429887c3c820c790e4f16cd6f58 | ORPH
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/d672824640dc97e09be852924a11f0c2e34c0f79 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/5165b2cc9331f96caf0a56680b2496185cd7d1bc |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/b6c66b56b8c2138e3137f749a83b7b4331ab9153 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/40c84c96107d4cb9bcce59b899d7b4e1866101ac |     
powerpc64le  |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/392cbda3f9e35ec607555127794d2bad4d14ae4a |     
  riscv32    |         gkrellm-2.3.11         | NOK | http://autobuild.buildroot.net/results/7eb68d290e2cfdc6525297727ca0167a018ef0f4 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/99ca82a99b161cda9cdb7cfdf2014aca4653edb7 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/13abecb4bafbafe8a663641b7c924c07e056202f | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/ac40254dbe37e63af4b8f48ebf3de67da286bef4 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9d75d9345750e9ab97619cd0e7606fc93406a099 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1986b7d6ea0b91c823c46f72a6ab3ddd222cca46 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9748a07a683e313a43c147265342d5043a10d25a | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6fd269c9974773c8a897e50304cd699828dab127 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/56ede01cdffb02a378d8237b6d86b9068c566e32 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2de9cc3a8cc8413c34760924fee625272a2de555 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/aef2382bdbc2720e370ff6a96c64b077b25b3d36 | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/af131b3166d8810e9435dec53f1a147f38870594 | ORPH
  aarch64    |        host-attr-2.4.48        | NOK | http://autobuild.buildroot.net/results/8e9a577fda45ff24e969f30ef0dac5659752d62b |     
  aarch64    |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/c1122c29300ac00bb1344e9c9eddaee83a846fbc | ORPH
  riscv64    |      host-gcc-final-9.4.0      | NOK | http://autobuild.buildroot.net/results/b60770e7b9bc723d154a8f5035a66229ab5e51ee |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/f5b6a3e0cd20c36a6470568c701f481f40242b84 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/7ca40919df39b918f2fc807202af5bdc4d92959e |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/27e10bee533507e9182517c999b78a40a4f74749 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/02fee4460d3f0f261e68b181971f35dca2c48389 |     
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8b0d1eefa1e894fe10359ad48bd443b5f0eb5780 | ORPH
    or1k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/99b4e9b208b3cf70784a15fea4866aeeb9e7422e | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bb67157d68b3b7ac0d8fb82780a2093182d9cc50 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/804b15a1571e9a2fc398731c62d65329dfadfb27 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/62d84cad124903d80aca10f24e88bd7d54dbde1b | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6948907db075e69e0400df7ee40696f3f8b7a6ee | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e7d0b54c7330fed4691e7cd6869d677d78a9c186 | ORPH
    or1k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a0cd0db0b8e26514390837870a788f53b4e02659 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b0e04295c40b1b94658eb2f7ae262c3dd0003120 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cf213121bab6f0c7adfd78ac54d30d5a85169c57 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/14dd64c59c7edce3e863cb2d74e6c266c5c1ae99 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/64e8dada44f1b51287bd32f0319998ecab8869d7 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f2c6e7013134a140151fd7884aa38d7821b6bfc6 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bc87c52ecad029280af17be43a36d6f9bd88e587 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4acf16f4d93460b30d9a6912bc0d1fc408c79fe9 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3e78e5b66c77f8ef22ca5fa3ba4f55ee29000d7c | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3ab74cd220708675e39590330b71a28958629bfb | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/01fd88d68fd2b3e97a43c2bff6cbbebc95e36444 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3c071aaa0d5d7c66229de26a830867d4376c1b51 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/76ed90c6ba6879776ed2ac4f358c3dc78c2c7a3c | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4e49caa3325b1b7721d2675a9464c26614b6ee13 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/97ad98195f50e0100e7a50de972d257891e7befa | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/839d1ae030935bcc3246308a0c7c010ccaa7040d | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e0934d1c66a55bdb5a3846e1c58447f0ae2d6817 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/eefbf8c9e5a73ef312e6efa75e600b7d2ce6ab60 | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/23a8ece61dea34747a5b9b0244c537ee68fe1de2 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5678f4d8b1d3735b7abf187b0c426fc0fe3755ed | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f2736c96977f8887761664c689474e3948249a7e | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0de5a5ea66eabad6ae59124aa527951afef4e0bf | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6ae7f2c04dfd0df98440418a46c1ac049eb794fb | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7f80100cf4d1a923679ba67c8dec881133a5d5e0 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/299175d6ec1518be6c1d2e86cb31fada2ccfb003 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6a139d916839c3246e50801709a8bbaefcf70d84 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3dba46ea3794b21013c8b58361e08744f2a7fe83 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c46174406c06eaf20c933b368de233d7abb6a69f | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a3d598c3091f50925b8ee6ab5d94ff10aab18a17 | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cfade4fffa1c7c70505438d9ca8f0bd1b1c77c97 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c6f1a32163f5c6a656b2d640acbbe6264579c104 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7330c17d028e5067879e43602c365b26179def66 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e753dd47a284a508e4711de9bc1afc7ddcfcbb23 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7245aa5b7ac914602ac1329ef8aeb25b323dae0f | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ebc0de6247fe6d1d9208ca8c7c525abc07352dd9 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/899851dfcd228d36e3fc797f6609c9795c7fa53f | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/27b24c99af8d0a69c8cd07babedc5260d7d66b8b | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a96e6594946e02d68f0ec49c300f99613ff3a9a5 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d9b9e7af1be9c7c9bd7bbb8bd02f6561b59f48be | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cdbbe67d04890c80a4519af6e794b91706746084 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f0f9b03f6e5580d347214335872d1c635c36fc11 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/87e0d24d78fa92a077f95d36353463933e58dbda | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e5ea470d8ca475854ddb78fd4738ee8af544f293 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/19d82de6f4be3c27b9a70c029026528b04710731 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/abb3c46b5bb617cc7119d4198567a5b3bbcb4253 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6475f24474de6e6fbaccb795e668593ccaaa2ba0 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/07925f337f2843799e005a36e23bd8bd5b03cf8a | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d8cad91cd3becefa51634a096e8f2326424395a7 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7ef583f0820a4d444b6bcf04dc0f6013b8dbefa3 | ORPH
    or1k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3fe4c804f9890f3b1d4ae0477f9bb8d2659b2a5e | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7ad64f4b259691c64c9117e2b41ec39dae604e50 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/70340c2a90e199e52b4694c84589c5855d28d88b | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/72c3efbe1ed69ad97a28e8d9800d1dd9286ad1c5 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c1c31d257d0c0b726d9decfa47d8ba208a629ae7 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/abd7bc4b718bb82e6e3d62a2c6cfe5778a135407 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d60c0a71ebaf2359563ee52c1975dd24a81cbaab | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d2458cf416f3591ee60eafc1e1f10bf4b778e2cf | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2dc644af596756395be0d537bd96ea634ad9bb3c | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/210220dc1865a3b158c3bb856c4ecc34ce47f027 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/19ad9baec6c7bba20e761e644e59cc984efdd653 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/739997b258aee2cd7f769bfbcef993925ba7f3c9 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/301a1e74a8b589e2bae686951b150a89847aea0d | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7a46978ef6edc04fb10c5b98fe6739300554c883 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/04365345fe89ac190651560468141963f5093333 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2d5e96d44c4d1b10e0e37c507569662f298f90ea | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/74863ef7300109de8856646a2fc6060fa921a0b6 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/585c8857e1e16c07b60faa3b2464109d5fc5c763 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2177350d45415b726c42301ae7880ea95547bbde | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f902a67ecfcf1495a059474886e53554da29e43d | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/adaa57bf78fefe225c90739b7a2e0dbe1b17aea5 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6c9b5a12796e24a568638eb9c54db7e53f1f280e | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a9727ef72146569543f7319fcbba05c3bd9558d1 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/85094b258aa6b85818881cc958b8a0e0873f4f8a | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b8a74a064b6e06f0d403632bfea059e3ebe4ae9e | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8df0c841666398b102245c4296fdead696a1910c | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/55e74927d91960c39d1b78f689cac22673b860f3 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fe85dbeb735b9581ca75020721575a9bf71f6bef | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5114e86dffd349074d3ab53a2b4545a3cb5617a7 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c84e6822043558ed1f69ecb203caca62fdc6e4e1 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e36a99362e2d51a795681efed5b195cca7d8877a | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8309524ac611371e38804e1da35b04f09e504306 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f459431d2f5a7f062454f9bdeba736447b81f11d | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bf25a49d5b39b18ac8ee5b3dbf14e62b0a696ec1 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/418ba047400a9eb7eb5e12cb1b8563f3fc831ea2 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/725fd2453d0c074bc27e4bad446188a68269c1d0 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e7c04a17698187354193477514003b5732f09218 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a0851d48a94d981667b0da83a545e71e2d2cd820 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e3af7c64ac60d406c9bca203ebdc441190f75e84 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e3a2132835c7b51470f967e886e87e6b0e657fd9 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/579bfdff6fdfd0737ee2aa4777fb0ecd288bcb45 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f6ff36565cb680d3c4eea5f3d5eae6c8fdb58367 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6b2fc7d5e9395b47299170683b7d4a9d31f8a975 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f6ef7f164f9a91ab87cf3ae1756f3589834c5222 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/041d1d3a2d1378000417573099333558c90ea97d | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/36881764d2f5ace82e30b08397cd15fc9e015477 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b34f45904039270791017e2f24f6e99b05745bc0 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9235eae31972cce7cb40b41cd81baae12f4974fb | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/cc60a45ad1094991cfff70f616273fc8b1ea6f29 |     
microblazeel |        irqbalance-1.7.0        | NOK | http://autobuild.buildroot.net/results/5c06eb1512bffe2546537bc021944c35eed6a35c |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/25c191836794ee8d8d8fdf4ed92a108243a8c79c | ORPH
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/d66ed856147d0c631517a026403ff0090b98d80e | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/8c091828efb7fd877a42a9e73fe0c4c9be2fcaa3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/eff89a9bb94c73200e50bf011bb998cde70de413 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5c0eb1cd197ea3da00f20adb0ba1c516888adbb0 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/883b8078e805351ccb085dc4a069fbf2a49cb581 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3d4b8e4baf46f095751739bb048aa5082ff7406a |     
  riscv32    |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/971963d06beb29f0db7165e07ddc4a6ccb4fa21a |     
  riscv32    |         libcoap-4.2.1          | NOK | http://autobuild.buildroot.net/results/a68444961c635b23ebf2672e8e4898f88e1e2780 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/53b1a3dd9e3eea9b98d8b00790d5df6d96c7a52d |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/98ca368c7303d0491d9ef842bb9a269d83638a47 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e0452bb1c8341c0a5dfda30fd111a4d4ea5c1281 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a948c8df5bbcf0114827222ed75f90c5ebc4b574 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1f7cc2efdf84409c85adfbe9f048e06541311e43 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f27a77ed93e3a01c80990d3dff666e806b9c2afd |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7c24d1dd581e0310ecf8f8a71c619fae52ae69b5 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/084b70ce291ce2d3613fa2d12683581fd37b4d47 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b6a6481eeb7206451e102472cde97c7a8174302d | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4e1ba5bbcb04111fe09fd5b628c1a3096cf1e2c2 | ORPH
    arc      | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/2cd832f3f8566e3a95374676890fed311cbd807b |     
    i686     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/2f640886eddcaa8debff59199bd12e71cb4a337b |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/27bdd5e98cb948e65602d671b3a106b560ed5db6 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/57e44ae046e87f4d1b7edcf808983b8aa747f70a |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8da7a6aaad11bf4c32f3b052c072efb009448680 |     
   s390x     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1e940da1925f31fc4c7bebba2c08110ebe04d9f2 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6a3db7d3ed7d43142cead4e298c5b682c49d60df |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/fdd8432402e0d7eeb269cf421a04be7b448cb5c5 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8274acb6e6e99ec700fe4a01aba048d74202121c |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ef065ea0210f32c4c818a2b44773ed470ea2e52a |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d8bbd4ef6beef8a8be1abbed8929e4efda55560d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/cbcb560825df5c69ccb06e82549b78dd8dd1863b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/765a67e205b9abf5eb7b91c239ec37de9b113580 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/183f99c59d88a3434227f60c806bdd61cfc6bdba |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/92c849e50ba4fac24c8b78a64011ff46de892ae8 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/79c8baaf5d29493f610258c6069a417b815414a9 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/f39b12571874ad90a6b22c91a29d122fb7a64d45 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/967d58e39aa8b0238f47eb6fba00593b428e24b7 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7a2f170a513c5cc223aa6bb346ae1d89f6d30ae8 | ORPH
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/d70d96fbc2b95cd2dc286a345f97d3594d584ff7 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/cf1ea69f1443ac3c46e83b66992e5efadfa47a7d |     
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/023c6d150e3affe8bf07f2d58924f22c886e2faf | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/d6a7df41d094adac46f006452f695adff89180e9 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2597f011c87ce2b63aba5fd0332842aca5a81758 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b07a5e15d9262e518aaccb4ef306fa0935ecd33c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6e35fb5dc39a7be24005574448a673c3bb239902 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6089d13206cfadda8b1175dbaf77c9fdf421eca5 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/88895978e33f6ec1726cb2179a80a7d007b4a914 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/5cbb4230cb42f3e1482cd5d37834bcd43e30d871 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/c446dfad6c40e92c32dba0b52029becf1632bcfd | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/13c2b75d0ebafc3306c1ea42ab17bcfe90102d26 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/4b5235398f2cf5d966fbddadee0f0315d79a7990 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/39675f326408ffca7d492812fab99d6a989a9a7a | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/dfb71d202cdf7b5135aa8ad1db6a9028b4e2e47e |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f97e9638d6505d75a773b436af87d78f35a81bdb |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c6991b5c01363195c80d721a53bdc3cc0ac807ff |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/392fd79be8bdbb0ee150021f33887c3bd302ac7c |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9e57bba51fb5c3598d14e16aa1c627d1c7cb5919 |     
   nios2     |           php-7.4.20           | NOK | http://autobuild.buildroot.net/results/c6f48a44c99e131bdb5c61827a33ef9b9a923651 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/7dc88f93e60dcb172c62c500dfcbc5da5c73742f |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/ef241780bd2a8cd1fb2dd7c1d3cea4efa1c33735 | ORPH
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/6e09e1cfca3528279bb31c7052d78944d631bcce | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ec2ef235cb4946ab5fe96ac7c5814b63c0f8e073 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/908a2d1c087a0cd41b50c96acdbdcf3913f43055 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c6132ba391f74b2853209bf5b561b0c0189273cf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3b8af94a540b60f1befaacce77a7ea71f11f9a13 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cdcc08911cbf872e3938ba4c9b8fa38cd4b6daa3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a1afdedf46ed9ccf877fd5095deb7aa277a2fb4c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/66e348a193a2abecbfb090c71628cf48801f2ec5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/de88564dcd89c1fa8e3dec481921be5424489486 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/83557240905b7df89343b615052837fd4074a080 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6e964970978c20ea3759812a72ce2aece71fd6d0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/80ec1c11f39444b51502068e4129a96944c2ab2e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e16ee578e217beda4fa94c54f52379a48eb0da2c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5d7272f97bdcc7298e5245cdceb2d483e5e400bf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/05881d9322d17bd5abc084fc0a7dc93de8a01812 |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/abf4133aedbc6fcbd23a6f6c51373f97582c008e |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/8f80b5b749b62999857f6889daa2df3d077a8ee4 |     
  aarch64    |     qt5declarative-5.15.2      | NOK | http://autobuild.buildroot.net/results/ad7a87877514bd27c2e887220a3bced4f54f3e44 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/3e395cf3df1267eab328303308cc71315e5e875d |     
  aarch64    |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/a409853c6be59a466165ceb5a97c66945e0446ba |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f1228ebd88cdde96460e54137c4bd3165acbab28 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/791cd52509ddcae6b872855326353c843a142dca |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/eaea917f13dd707a3fb422da4e0f5cc7bedb671c |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/06fef04d1b778c545d31dbec70f3d6476fa2c321 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/0228a5efb3928ba81e296e5ee0f75f128c03275d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/29462b45698556cb4caa1800a0c9a5157cea13ab |     
  riscv64    | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/692bb0d176f4dd99fda46c6f420204e081388aef |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ade52a7bbd5a3d8294fd613e4e129f6defab5001 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/0746fcc540fc7e2901ee0a89f76396e7c7706fbf |     
  sparc64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d46dadb6faaf6b0da9c4f5ce732acd9b5f611755 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9ce4acb5f19e5f2f2397e41fbc75921e10421ba6 |     
  riscv32    |         systemd-247.3          | NOK | http://autobuild.buildroot.net/results/cdcad71e05bc97283fb9f9ac3330629156a03d4b |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/fabe576619f08bff2f83eb819a95fa1bee000f6d |     
  riscv32    | tvheadend-febcf9818d7c37fec... | NOK | http://autobuild.buildroot.net/results/ec40618b8e9272c1a82f5f1ea82a9e5ae2b95919 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/ade26e3aadf1aa9c5976fcb2d99e69272feccc47 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/df04cb84eb2d1ce2a93326d67d807f509e6b7a61 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d9be97ca70fde1f651181408d123b4e47a75fc8c |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/88461f1e16cf906b9e74a376bec2bbc5e6deb1a2 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5767a9479af0a28f1367645741a6dc726360b654 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c174785dc89967dc36a33084e2ba6b0a9a482da5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/022fbf4520bc7646a8aa8eb03b8a11ad1a264d9a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/99b778114621db99ab5c76a1cf87c9f200b9c937 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/88a685996af23416f7c1d5ab1420874b5950f4de |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/43e1d1c5faf10ee3593a7dfaba1d58664a1c3045 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a30899c57b2b1d6a5bd6fccceec26248862a540c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/3aa2b05d2b31cf7e3074d39a0362ee1d14829588 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ec9e999e02c2725128173c1834db11fe94d1114 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/04cea404328cc1624907d6a3569ff2416733e161 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/366541b5dab1d81877da68c3363aaa8188dbc14c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7ebe7061ab7ce88c09e45a28f5ae0a27ed4df0b2 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b3b049ab2f3f14d4b7503b94bd40997ee620c39 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/711b2caa608e8ad63a7932053862177542ed7f3c |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1e7f60868f6f0252bdc2e92c5e599183cc78c475 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/3941a92f95daec9e6da98e623049acc3ab89ba96 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/e0f8dd310be1b8d4c3f6e6924eec65b604d28e35 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/73b036abd9bf7ca662916a971013c3ecc5c67f17 | ORPH
   x86_64    | xdriver_xf86-video-tdfx-1.5.0  | NOK | http://autobuild.buildroot.net/results/86dde84b1681978e5e81ec4e548e0165d95134b2 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/289fc70a27b28e8be6651108a6f39d8f2cd36b72 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/171f2dfc2b41f8b30dc89aec177f8e8ba2948815 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/398a4fa88ab0843ad593684425a10a2d74b717d5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f01881100afb8f8aa034ed341e7ddb239a26e4f2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/82b676beca596da0145f7b918752201e8a4e83d9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/469b56a6e49a1b1263c57b8ea272d99982d75119 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/eb302693830b84e2e4e47821efa7edb9a300202f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/26fcd810e960b6c59a8ec9069f26c301e1e62734 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a7753dc903cbfcc69e05349adda4b2af96b84ccc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/11cdf95a4fd7a25939ce52c97d8332be1b895d16 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/097e12716585f4d5f0eb9c76ba7f29d71818e211 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3a3c2e1496d0238f04ba843cc298190e7fb6dac9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/103543dad9c8043fe9ddb775f0eb355895a23be0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/23ad6e496d8c530eaa8f57e4a0fca3da7222adde |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ff58f9d9eeb71fba581eeec128193233bfed7c9c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2c59300a33db17adaeee95d88641b7a41b6738e2 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    htop-3.0.5 | 92
                  exiv2-0.27.4 | 45
                  zeromq-4.3.4 | 16
                       unknown | 15
                 pixman-0.40.0 | 12
                 mesa3d-21.0.3 | 9 
  gobject-introspection-1.64.1 | 8 
            erlang-jiffy-1.0.6 | 7 
                    ffmpeg-4.4 | 6 
          libmodsecurity-3.0.5 | 6 
               capnproto-0.8.0 | 5 
        host-sentry-cli-1.57.0 | 5 
               libtheora-1.1.1 | 5 
                    mpd-0.22.6 | 5 
                 dc3dd-7.2.641 | 4 
    trace-cmd-trace-cmd-v2.9.1 | 4 
             host-cairo-1.16.0 | 3 
                 openmpi-4.0.0 | 3 
                xenomai-3.0.10 | 3 
               belle-sip-4.4.8 | 2 
                  cairo-1.16.0 | 2 
            docker-cli-20.10.7 | 2 
libcamera-3a1f67a8031ac5ad9... | 2 
 Makefile:755: target-finalize | 2 
                 openal-1.20.1 | 2 
   openvmtools-10.3.5-10430147 | 2 
           python-pybind-2.6.1 | 2 
                qt5base-5.15.2 | 2 
            qt5location-5.15.2 | 2 
               qt5webkit-5.9.1 | 2 
                   sdl2-2.0.14 | 2 
toolchain-external-bootlin-... | 2 
         xlib_libxshmfence-1.3 | 2 
               apcupsd-3.14.14 | 1 
                  apitrace-9.0 | 1 
                apparmor-3.0.1 | 1 
  binutils-arc-2020.09-release | 1 
                   cegui-0-8-7 | 1 
                  gauche-0.9.9 | 1 
                 gerbera-1.8.1 | 1 
        glib-networking-2.66.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
           heirloom-mailx-12.5 | 1 
           host-doxygen-1.8.18 | 1 
host-gcc-final-arc-2020.09-... | 1 
                  host-python3 | 1 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                mono-6.12.0.90 | 1 
       network-manager-1.22.16 | 1 
                  nginx-1.18.0 | 1 
                   perl-5.32.1 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
               pipewire-0.3.26 | 1 
                          qpdf | 1 
            quickjs-2021-03-27 | 1 
                 samba4-4.14.4 | 1 
                      tar-1.34 | 1 
           uboot-tools-2021.04 | 1 
              webkitgtk-2.30.6 | 1 
                           znc | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/34d7cf9f6fa0beea37e6b41a38780fff6ab2d5f8 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/10b4f5cada0c4f10b494441564882711651d69e5 |     
    sh4      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/874b1205575bdf9a0e55e5d910ee93ff0c4cb4f6 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/b5ff7393b5436b1a3a28172d696e6742fe0e6c4f |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/a8855b0f3b4d141c767bf2ff9b9c82ca3fe63854 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/0e7796759be811f51f12320573de481c8d27bddf |     
  mips64el   |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/8d4d3e2b66465b5ca9dc57d1fe6e82ee55805b32 |     
microblazeel |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/a1d397ac3876e0d203a7a454dd104b83a53fcd58 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d249478a149735a0dbf76546c9358525c08f6138 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/cf19350d6a1013fa4c280760b6e9cb9271242c14 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/db61796f4ed49ead47ae54a9bb2d1cd2984bc8b7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a232a22991bd21a8c748e6bea09198437f0dd9a9 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e865b247d2bc4a3071ebbfa8496044cac3f928f7 |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/abc28984f77cfbbbfd411deed462df1e38fd86db |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8bdd37daf1c572c8aa75db760d8f67ebac855f6d | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/858a97f4b52426ecdef1c1b90038f032e117f6d7 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a70ff649ba5b3c13bd948429333f96b2d23a8695 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9ceebd87230c699a6b66bd622146950eb3a72928 | ORPH
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/085960d10d85292266e9779471247fb98c8aefdb |     
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/ac0138145881c3f1685a685f350302f7308a9c59 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6517745182683137e3b524783ae9dedef4c81a3e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7cb61c458d538c533e17cdca4851435e199c9815 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fea41d81e0e448123ad997625209ff3cf374235f |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c980c97bbaa6e6f18b8c532586951cc39c8385b8 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b7ab612ffaa9396b423994b952cf6a0e762a4725 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1214787ba5d7c1ffcba6b94d3a87e3e08dce1276 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5ea9c96810dd76d5d51ab47315006730d62b6fbd |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e4c1cd49a4b629412e217d3e05de9d4a69cd2b45 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2efeb5884c78e2fab0bd28ad377bdddebc573c78 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4848b8e90542bd927598a490689b202f0bb7c63d |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2346bcfa1933cf4d0e494d4c04de461af4065a24 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c58faeda30ec4270b10a2aea67b84ba4221cfbfa |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3eca0674cd00301dfb1f7923514f786589434757 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8daaaaf91c576c76b09726bfe065413920e5f79f |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dd8aaa28037cc966dcf01141e2114d2e4b13fe4c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/49b55818d58cf2c4d847cdbb1e516ff9a67cb5b1 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/41e1c4a0d30541f9cf28761029c129b2c83d8c09 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/180fa5d6b34ed87f9851b65909c786da26e650cb |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/73d9872e54f4082ff6d944c2f3977d1c2695f6a3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dc234df955010b924becdd4301c1dcb49f4a46aa |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0e6bba9380fea2ed7b9c1fefb644910ea5b86cac |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/852191c6943699b0a833923300cbb2560efb3ea5 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2c8734514ec8d4a44da6e8d212a6182407d506a7 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7168efc79b566aee91257bd5b45752e48ec06ff7 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/26b74474e649c959dc2bfc50bf0bf6f99aca225b |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c1eb193532735782416a8b4a175b21ac46feba74 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f57a88721a45375c24590e1511868fabb63ecea4 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6e781c25d1444b873eed290a3444a8aa204dbf32 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/402a36f7a78d446e21050b09c5e610a1e9be472d |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1ee1a3001ac3d75474d30a2aa3ed1dc32d5e6a9c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/40c62563989828ad1ded807d67ee7a66855d96a9 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/86d943b90fc44665d2b41b24ec7495406f0bfeaf |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/de5d8326945989e75582675b58974e2dd9625d11 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f7c651b6877cf50ebd5f8ceef41f764c37b8da71 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/84e59d296dbaa36d78451084ae349b9489d72d53 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/555b01ea25aa694f90cc1c2375756ea49e0d16c0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3beb48a5eab5067c82d5988e3b7f054c7435687b |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc8991e6033d4c24a3c92a28bbb7f4db3d5f1205 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81c639cf3b7e4ed9583a852ff3955a47e5fd4237 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8eb675311fd3b6a52e56c4565a5041d66cf4a1c7 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a27c44d867f0b909b987ba23f0f4efd0ef0885e5 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1e5060f264ecb98ff544d0d5831d9072e2c0e626 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/475dcd06db5f3a2fc099c06c7d163378bda422a2 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5aadcdbfaddca38dd0d7cfa1f03dade2de405412 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/80bcde69793247438eb42c4bfaffa6c4bb781949 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/10ba473eba387037a68725da5e38cfc94b2ba31e |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/837be58574c085495690841c91c0766f4f2ec4b8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fbeccfce2e173312968408fce481c204c9de57f6 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/747c49ad30f5eb9782cd7202e97e1fae1ce7da1a |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fcdc022326dd91c500a5923a2639e24fd0fb4229 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8377eb4923b9aad89d457dd94acc3b943bb29da1 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d30370b541a0186d94562fef56bec80d75be1d23 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7cde69cdd8fb88c344855d2667fa6e1fe108c172 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/eec1b63ed435ac545c9bacb446d5878ee4f7ee67 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/28a8104afb894e501f32ae8aaf67f7b20b3fb175 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/70d163da730b24badc9f5371316c6486285bc035 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/002e2f851d881cb0b3b38f7df63e0086cca4e61b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0044bc6d8cf41c6ba0febcb9f0e8b915de76b810 |     
    i586     |          gauche-0.9.9          | NOK | http://autobuild.buildroot.net/results/d2b6c8c5d28296829607f849529e453340cd19b5 |     
microblazeel |         gerbera-1.8.1          | NOK | http://autobuild.buildroot.net/results/d0e4594d3283e0608087b478842b18068f84a5ca |     
   nios2     |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/20ee609c2ccaec077e374d67cd2ee4bed3b32c5d | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/724c369705539a4e8cf4f2a2ce83d6df95431787 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/57e93c86e5aa57723914b195419f5746e7f6e48b | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/aebbfe08e691ab3a605e832adaff34b8d7e32098 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/eb441625f0a9ff093f01fe36b7cf4196bd259561 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/746335632a2200f9c2a9d9adf4e58bc7d4cfb471 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fd5e546a51e60bb8a8183d625fce2f8f4c925728 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/4be1addd8da2e8123bc05c3e87b214d20337aa77 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/863dbc405ac5fd9ff23039217657b57ea37eb696 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/07e869add80326494025991920e3955a955add0c | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/74a10f32b47d17a11c1fd912d4fe7bd8fd44f1ca |     
powerpc64le  |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/85dc8c6819ee2c2366e5a4e16e09b653e7543bf3 |     
  mips64el   |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/c0735008e06d45ab31df74c81c370c9cefd7fb80 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/5e7a9f11987baecaa975eeb03602e12088d141c6 |     
   s390x     |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.net/results/3a2e686b91b92a8635e12fe8a3f51b6b7c1909d6 |     
    arc      | host-gcc-final-arc-2020.09-... | NOK | http://autobuild.buildroot.net/results/db835f3b37051cea274d129b561ac6d8268fb657 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/fb43c832879497e499478a93db45d929a87505af |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b2e52f61c60b15e9982bfc1f2eca59bfeaf1571e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99e87dc01c294eb72b3e3ab5ae363970a2a0efe3 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/11d04cc5ce0ada862bd5cfde3901dc074025b263 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/44b45150e5abe490b357e426e97b7a78966a55af |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cd40a2fd33ec1227aea2632d08489f0374f2dee8 |     
    mips     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b1aa684098094bdab377db8f7584fc31fc26ac12 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b1ee0825dccb0b90851554a3cc92feae463e3966 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7dc7d627290a7f619a24897ee7f6ed53fd11cd5e | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ffaac0f25aefac970bbd1240fb7c0b1fee3d58c3 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b65dd61a16eaa56e97a75a981c81313634a47eb3 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d268ff299b34d90ac637c37c671f6cc578fc7466 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fa9bb1840c29b44146de86f36265c84736575c09 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ae4b657bf7755957368667ff304e5337bfbe897b | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/eecda2d9b6f1c092e3f03f5b6c7a7dfaf1736cf7 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/eba85f30a135fa80b2d4e101be6ed6fa85437f1f | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/63fa590d79a9714db01f05b589c479b1c4db5430 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e46d3fb45a57021f6cc98ac325c91ae97cd2bc9f | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/96ceddfbd8acd1f36e60c8dec01d9c248fad5c18 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d563ee1ad5c9f88374dffba479ce51f6c5ff70fb | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5dd40bb00199b651b8b80fc70b28d12f9443b914 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2944d22bd6dce0a9ccedd4333721b019b40b2e7b | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0b296270a374b29a97530cacad0bc0b9c9096fb7 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/73928d65b16cd89a2c017f74de745a0f970e96ac | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8cfe56a984500369dcdb3eda2098c13a89834167 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bb8e0d44ddb1302283218893da4f21e672dae25b | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b4ebe3726845b5ea84c3f14cf14fa852bd184dbd | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/abd4e8b933703ddc4309f0693fae4287482ddd23 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9c48a17545be7892f278f2b3fc2f9c8748f19cb9 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3fc57803b1cfa6e6b842b6de3f56d64942ad3fd7 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ff85f181680cd8bd5247bd004fd28f16dae3e192 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/46215363baef3d2003f986860456fc99c4a9ac9b | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8302e5cf6fe5ac7764edb2a2a1e0473997193edf | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ad39f8dc3493816be75466ecd3bc8cfbf83d3abe | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ebaaf1d8893a952fe8dfc963ab7410c1282398e9 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5ba34c6dcea036d2364bc6bc5b212554e91b573a | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/51cc190a5ec4bfb694315256bc3ca1bdb677e465 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a1b3f9548796b3f79edc765ba5c888fdab021e1a | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2da7b494bd896798f3a4ecdb0b755f7ca3b62853 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f2b7c4840eda7a734df25a496c607cf9365a1afd | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b3fd25fb0d77507c88f6e2867f5f448ddf5985ad | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/617a8119bb3f96dd19205a6e0349ed5d4acf255e | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e09be0d97d192cf962f53ac24713ed0aa3a756c5 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/180f6f08cfa32b9fbf485e163bd6cfdf4de2ba4a | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/858f2df7b972606247a9f6ad62890c7d5d9387cd | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3656de9035f6f093a1455ab9306f9a97050b8345 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/590b661cb46aa87d0e3fee5f937a1429fb15803d | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/73bd01ba97db88bc70c6c7ecd18d6eb444f33c47 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8aa54c03c906b21a33d7632742a1ad4fb0448411 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/34a7a0e99f3eb59a5ccc48579011529dd17fec7b | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d5d27b945c70f2c16e8c2085a09f940dd93480c3 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fc5643c170df0f74ed1c0f3d6c4fd6c3013ce40b | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/466d79f3c7114f95a3b94c1b9f3564efb20e57de | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/987b80b21e6d9ce0396d9973f08e93e61f52035b | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/68fd1dca7e1bf5ea6991492fd139b4c5942f82bf | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/43e204acdd9e52af4b98e77d7e181c255ecefbd3 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d6ad108fdc5c05496a0074994dfeba7513d8c1bb | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d76947db1db4647fecb9876c28c20d7511ee7417 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1e324bd8dc9901e0759107c3240c10d0f3f5abac | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2bfcbbea3fab96555955e6c1052cb4b3ad2f2b51 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e92de39e51ddef1c232ab7e552315cb1c34f03c6 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1c3862b150d88df2db43a3ed905ea648fdf1ee5b | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/84c93211faa6c0228c36dde3fbe7c1896b3c9858 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4a1c7989b09318921129388b379093923b93021c | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dbc66f39d8da6dc76f3ea3cfd5dea2284783e9a2 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fa03c7acb8be2a9dbe04930c6de1e8ebb2cee9bc | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/78254159fcbacb23b87d70c0a4ec710fd3b486d8 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f1155bc90c7a0f44219bacb51844488055c30f44 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/25557f2e0be59a42c95d5646a7a7f3974ecf3cf5 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d1724d448b522c044248bdbf18c022f5e086e491 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/75d5cb3272c96a85d8ec4c8587db7c1747a83d8e | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e27957f3962174260bb34dde5e31993bdb32e73c | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c21b5168e8c50cd56e412937f34d0f1d84ab7b6f | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1907bc853b45dfe236003037683a10227bf95199 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/16d01757709d3bab5a3ca593dbc8ec92e562095a | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1e997213dca5008c9b91ccffbc7309161cc835db | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9b5d22da2db60bd265cc6a43e31f990da8980410 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7cb878df16425cf6685f8f7593e2dbe52ff7799c | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ba63330ef32ceed6bcca45c4386ed0ab01a68035 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8d7ffcc237d6c4a0a9e87c01d561790084bb947d | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f72a1dfb6f9bfa4c5134388a699e17d69c4c0051 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f931fede000daa3d4d004faf7b710214325484b6 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9b6b708fc2d4853da8ecc635040faec875aecac5 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/441aa75fb39d0785da8b085b76d1b9630c17725d | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e3b6fd8c7d3c16f2f119a08e3dd81a2001e8d042 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/80add03242f58f129f13efa38dc1679b75b79b5c | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e918d70e10e089ee24cb5c81a2da960707367714 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/77eaa8d480af99788d1eee54a2f1c3940f4b4315 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cd1ec47b12a09feefa1d8bc8241dce9752c27809 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/edc6f4a830cef1e66f7090896f0a382eb69750ab | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fca0c93592b83988ef83e1465aca1389d0480271 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cd25ec1a2f5c485eea3f7225e19a46959b4c2411 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/eaf743c4fadd80590b17865425dc21809efbca0b | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bd24471afd37fb25326c10fa9a6cc4b28680adf9 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6486eef66d9fabe59027fee2ecdfc645eef4dc1b | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/abe2031d172f2dd3793ba7b6bc5f5dfbeba3dcba | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c3747ccff36c0dbfe4db31553420b80dd5fb9f62 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/84444723b02f06f3bcb12ca09f67d44433a5f8ed | ORPH
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/e88393ace793cedd7887d3290e2dd0bd7f905626 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6d3d1ab125db97f67759fd9cabb84b7b1bdc52f9 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/3191af3e562bf6be195d6386fc24ff300faa81b7 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/badc9a31a65be600beb08d4202228f290fe6b7cb |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c891b8ec1a0005c1a475187bce1a8538f96e6438 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8c398ea4716808f63d3c173283b9e7186d17f2e7 |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cb93ba6c6a4eef38bfcc4254142fb8a6f3ad6fc4 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bda6682d68b5da5bfd01fc78d6e1c033f9ae59bc |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/47f1e0a157bd91c7c2bd63e643f94ff6562cc695 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7c5df357be7b8a3c1d74b9ba4680cec29a8ea8b5 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a3c709e3afe2a7de8345680138e673f708461041 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/5b98946075e11fad616566efa55f705f584cec54 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/8de1dadb95e0aa51e8f869ca046adc7d07acb20b | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/25a1c18991ef75720623cd4f800da15074af2b75 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/304a255b8530a8eb5fe36e794767db2bb1ef56dd | ORPH
    arc      | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/5c309fbbc30f06a656abd37416b60db9df1c9d29 |     
   s390x     | Makefile:755: target-finalize  | NOK | http://autobuild.buildroot.net/results/48df11af442e1a13dde32bf8cac1f991a4c30d29 |     
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/cb655109848cda3eb2c8fe491630afe68743cb37 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/286fdfc915df58e378b3f221129b5c65848e48da |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/8c8e42a5a518d98c94a99257ed2ca82b042c7b2d |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/3a7fc15dbf8b199b192afb7804d4c7f267522fb6 |     
   x86_64    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/8fa6b6de22eb79c65d4e6ef1e712f5a6b0c78ba1 |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/eef10a9c4b99692458389c17879597c9ff5eee63 |     
    sh4      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/2fd5bc15293d1bec2f3e3e20d4698b7c013fcc25 |     
    arc      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/98683fee543ba04639a82e48c63473da4e955e3a |     
 powerpc64   |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/507e39746dcefaf4d04ee8f3df6ab69ae4fb8458 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/34dd6ea152925e4f2775d76081666748900d8e91 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/0b9467ae62c53909aceb9f8b5d55f8eaf437b314 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/d3e68462a18f36c5d106a7ca59311934e1a3c011 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/d9fb385903d3397ce197bd5a66633411d31e0f05 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/b2c5a52dcb81776798d1f3e64c470323d7ca68be |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/43209da36efe5f968ff1a0cf00507c44684211d4 |     
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/3307a807607b1b52d2c79519ce5a74837c2e9e54 | ORPH
  riscv32    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/7d8beb2f3122f0a6cef046482ef77174dd172719 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0e1d4587004ef4e5e66f2dfad378d7834af5d8d7 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/7df623cd0ee3111b929ebd2f34959eeb9e4f9cc2 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/972aebff098e60ebbba9feada1ea3519ee70f431 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/529a95fde2584c31cca0a9d96682f213888157ac | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1ce667dd187b5c77e506e2ad1270a01841da5b36 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2bd81b60828bef89ad191f40f516790e07f301fe |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/55b86ab7ada72386c8cf984f6325012d8b84475f |     
  aarch64    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/b83922ca9141fb28d3b7b2d892c415d4c8ee06d5 |     
  aarch64    | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/38733eafcccd62639b1dbcadcfc036769352bd53 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/fbecb77d40ad4be974a23146163a0d15499ee6a0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e7399d99e49e532ed9545b72a851fa20a2377bd5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1164371d10c0dbf21397b6936609c182aa8242b8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6c1eec80600e4babb57e85eda4a2c418cf719e1b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bfd7e9b288683448b095e1d094d56039e05da49a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/40b540a75aa49a875c5c777f74f84ecc165cbebf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e57c875b16d62dde5a8e64d652c5e281b69e889b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/13580da9423b17bedd852663d7e06c795f19a18f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b3ba382db222fea6ef4abc022242e581374c149b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5baab3f2924b33b340b341609b8985de12251d3b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/227740d2f4406e1b0081f8d2508323fe8bbef90e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1eab2275d0b99089fc79142c9476be7fde149c3d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7caa2870b3d111dd62f89a25b236fa9c6667b352 |     
 aarch64_be  |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/0ccb8c112684bbb8091e1173dd06c570da4d91a3 |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/211b10701e628aaf6f606ef3fdc71bc5c307d78c |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/433d7d0fd9617024ae17759280a2723167b2d348 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5179d8dec09fda280069c68e85014b7322448c91 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b5b0e13713aaadd810d3788aea685e59f5a9e7f2 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/22106e5037d041180e0581543a8a9e67deb971be |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/92d02c3db04bffa789fc18c3daa05ac141d0b318 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/5d0e916ecbb43ae753834fb6ac9e795093ec293b |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/04afbcbc827c79024f857e1d3d4386e3e44a8bb7 |     
powerpc64le  |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/f91dcb319ce66965ee783e19295e47f0a7c64ff9 |     
   s390x     |         samba4-4.14.4          | NOK | http://autobuild.buildroot.net/results/5a84ee51afdd2dbab3e6f68a1df2738de98055e8 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/323c347fa7fd7e34e82b0925808128adbe17aefc |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/abe2c591d09db14195d83f40d6b3f4e59f3ff1dc |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/c7455826a21b9d7eb93e5460cd636d0a50e1ad43 | ORPH
    arm      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/5696b72bf89096314293690633ef468f9899026c | ORPH
    sh4      | toolchain-external-bootlin-... | NOK | http://autobuild.buildroot.net/results/ece682121ccbf2bfb23452f97d6bb673150d5a44 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/bb40be36b62461426da47e22e3cdd2256db8e470 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/40f5e5d9f76e08e0cb61a0ace2aad344dc941725 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f2b023958d2320c927ee7c21fdcc0ae261aa12cc |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f2b9ea126c90d8d0f1ec12760e3031dc1e93229e |     
    arm      |      uboot-tools-2021.04       | NOK | http://autobuild.buildroot.net/results/04c08fc714ee3af98bd91a84d6729f16f1a32831 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/b748a570dc8273c396f56aa1983b4280acff3fcb |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6f18bb2de5fd3902b1f2d5a6ec6755fffbfe3e2d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/50b64533c4af47b77d1b8c604531cedc0db5e0fb |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/eb0441d610f8048ec9a80f0745659c1e3d18d65c |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/bd974c2122ce5628646a2c3628d20474d6ec3d0f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/eb9d62a0e6cb5be78b075c74b4271d7356019092 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/7b27143b03ff486723d8c0fce26eac8f913f066e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/847a7338382b0ada671da0f1ef2725004331eef5 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/d60ef871bfa121dff5bf9800a53195155be186d5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/756203f221711542e651f14fa9dc803c0e4f88c4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ab922cd5e152266766642b896dab194a539642c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/12991f65128e3e1d63e10cd9b72403071df1671e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/9950dea979d6e4b8d695b72cd9bd7be4a13074fd |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6c84dff8d918c39da3c9545a5de262ecea9f48ea |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e6a6073629a846eb03dbe7e0559980e618367a0a |     
  mips64el   |        webkitgtk-2.30.6        | NOK | http://autobuild.buildroot.net/results/b30f4b4275f48ccaa6b26c730c66fe50ccce4735 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/3b8c40cd99ef0fe5f391f948b0b8b55386b1a835 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/839f1c241e79ee3a42f7bfec2e26698f05f209cd |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f052c59cfe1f55a9d8cb09ad4c41daf10b79e487 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/5a723ff59e9f7ab6c56abe1448b728539875c6cf |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/6cfda4f495fb5321a974f777fddb8b93db4663bc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ad61b58e56f06c4a8b74c8829ccca0539b7773a9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f0562df2c5cd51ab1f7b87561480058d0044666c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9bce1c600f3bc66b61bd46af39f1f21baf2ebbc6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6452174be602266ee1fb1699c454aeb282c68e13 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8d410aedcd6966f63fff0931b3798f803741fa5e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/945da6f81129353699f834d959a4644d14b0a6c1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e46b159832b55a9e25d1974651995bce993e4c34 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/669b29333e637519ae0e53120c7431e23c676d78 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cea2b222cd380e2b8f3524ff9334d64ffb68bc52 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a5cb14be3854955353478274a04840e5af0574c8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8bb988ccd89515a6e68c114a0034c0a6a53a269c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/92e3fea8ef77441a081e6e4905a43c275ae1a0bf |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/22318d9aa6c32c2331850e19248a037d8019cea7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b124e9a39184c58021bdc63b6e2c85267cfb535b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c0f312df120aa4a4593095b00563556378918961 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/76001c92dc3ca350b8120ad276ceddfa356dbe30 |     
    m68k     |              znc               | TIM | http://autobuild.buildroot.net/results/d892b48113db071599eabbd06e896e134d8c5cbb |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
