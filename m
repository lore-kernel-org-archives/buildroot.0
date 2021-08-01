Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B54C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A5C60EE9
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 09:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95A5C60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AB8605C9;
	Sun,  1 Aug 2021 09:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TvbWPJgh2OB; Sun,  1 Aug 2021 09:42:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE794607D7;
	Sun,  1 Aug 2021 09:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A99F1BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D9F340490
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sc8L9KQBWFrI for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A5C24048E
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:11:11 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B27B1C0002
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:11:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 01 Aug 2021 06:11:07 -0000
Message-Id: <20210801061115.1D9F340490@smtp4.osuosl.org>
X-Mailman-Approved-At: Sun, 01 Aug 2021 09:40:51 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-31
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

Autobuild statistics for 2021-07-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 960 | 390 |  3  | 1353 |
  2021.05.x  | 913 | 379 |  6  | 1298 |
    master   | 3112 | 2507 | 15  | 5634 |

Classification of failures by reason for master
-----------------------------------------------

                  exiv2-0.27.4 | 390
          refpolicy-2.20210203 | 113
                 freerdp-2.4.0 | 109
         host-gcc-final-10.3.0 | 99
              tpm2-tools-4.3.2 | 89
cegui-00b4e1fe174da53b7ed72... | 85
          libmodsecurity-3.0.5 | 77
                       unknown | 76
            pkcs11-helper-1.26 | 73
                  zeromq-4.3.4 | 72
            erlang-jiffy-1.0.6 | 62
           optee-client-3.13.0 | 61
                    mpv-0.33.1 | 58
                  libogg-1.3.5 | 52
                 pixman-0.40.0 | 51
                    olsr-0.9.8 | 50
         host-gcc-final-11.1.0 | 49
                librsvg-2.50.5 | 38
                   gconf-3.2.6 | 37
                    ffmpeg-4.4 | 36
                     gpsd-3.21 | 36
               libfuse3-3.10.4 | 36
                   libnss-3.68 | 36
             libmediaart-1.9.4 | 31
               nfs-utils-2.5.4 | 31
                    qemu-6.0.0 | 28
                libmbim-1.26.0 | 26
                 mesa3d-21.1.5 | 25
               capnproto-0.8.0 | 22
  gobject-introspection-1.68.0 | 20
                harfbuzz-2.8.2 | 19
                  polkit-0.119 | 19
                   erlang-22.2 | 18
                      gdb-10.1 | 18
                    mpd-0.22.8 | 17
                 dc3dd-7.2.641 | 16
               libgtk2-2.24.33 | 16
                    bird-2.0.8 | 15
                  host-python3 | 14
              libostree-2021.3 | 14
                      tar-1.34 | 14
                 libqmi-1.28.6 | 13
              swupdate-2021.04 | 13
kvm-unit-tests-kvm-unit-tes... | 12
                   sdl2-2.0.14 | 12
                suricata-6.0.3 | 12
               apcupsd-3.14.14 | 11
                 openal-1.21.1 | 10
                   guile-3.0.4 | 9 
              libsecret-0.20.4 | 9 
               libtheora-1.1.1 | 9 
                 openmpi-4.0.0 | 9 
             host-gtest-1.11.0 | 8 
                mono-6.12.0.90 | 8 
                  mupdf-1.18.0 | 8 
              open62541-v1.2.2 | 8 
   openvmtools-10.3.5-10430147 | 8 
                qt5base-5.15.2 | 8 
            qt5location-5.15.2 | 8 
               belle-sip-4.4.8 | 7 
docker-proxy-55685ba49593e6... | 7 
                   gvfs-1.44.1 | 7 
                xenomai-3.0.10 | 7 
                     tftpd-5.2 | 6 
          xml-security-c-2.0.2 | 6 
              containerd-1.4.4 | 5 
                      poke-1.2 | 5 
                 ripgrep-0.8.1 | 5 
                    zstd-1.5.0 | 5 
                 apitrace-10.0 | 4 
                     dtc-1.6.0 | 4 
                   gssdp-1.3.0 | 4 
      gst1-plugins-base-1.18.4 | 4 
libcamera-3a1f67a8031ac5ad9... | 4 
               libxmlrpc-r3119 | 4 
                  nginx-1.20.1 | 4 
         nvidia-driver-390.132 | 4 
                  udisks-2.9.2 | 4 
android-tools-4.2.2+git2013... | 3 
azure-iot-sdk-c-LTS_01_2021... | 3 
            docker-cli-20.10.7 | 3 
                       gdb-9.2 | 3 
        host-sentry-cli-1.57.0 | 3 
             kismet-2021-06-R1 | 3 
            libqrtr-glib-1.0.0 | 3 
          modem-manager-1.16.6 | 3 
                  pango-1.48.7 | 3 
                      pdbg-3.3 | 3 
                usbguard-1.0.0 | 3 
         xlib_libxshmfence-1.3 | 3 
                apparmor-3.0.1 | 2 
                   bullet-3.09 | 2 
                   duma-2.5.15 | 2 
                    efl-1.25.1 | 2 
           heirloom-mailx-12.5 | 2 
                libvips-8.10.6 | 2 
                 libvirt-7.4.0 | 2 
            luaossl-20200709-0 | 2 
make: *** wait: No child pr... | 2 
           python-pybind-2.6.1 | 2 
               qt5webkit-5.9.1 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                      bmon-4.0 | 1 
                   delve-1.6.1 | 1 
                dovecot-2.3.15 | 1 
                ejabberd-20.07 | 1 
             fontconfig-2.13.1 | 1 
                 gerbera-1.8.2 | 1 
gli-559cbe1ec38878e182507d3... | 1 
glmark2-c493520253fbfe3676c... | 1 
              gnuradio-3.8.2.0 | 1 
                  gtest-1.11.0 | 1 
             host-cairo-1.16.0 | 1 
           host-doxygen-1.8.18 | 1 
               host-flex-2.6.4 | 1 
                host-go-1.16.6 | 1 
              host-guile-3.0.4 | 1 
          host-libglib2-2.68.2 | 1 
             host-patchelf-0.9 | 1 
               ibrcommon-1.0.1 | 1 
      intel-mediadriver-21.2.3 | 1 
               libgtk3-3.24.29 | 1 
             libtorrent-0.13.8 | 1 
                lmbench-3.0-a9 | 1 
make: *** Waiting for unfin... | 1 
 Makefile:740: target-finalize | 1 
        matchbox-desktop-0.9.1 | 1 
                 midori-0.5.11 | 1 
                    mutt-2.1.1 | 1 
                  netsurf-3.10 | 1 
                   ogre-1.12.0 | 1 
                opencv3-3.4.15 | 1 
                   perl-5.32.1 | 1 
          perl-dbd-mysql-4.046 | 1 
               pipewire-0.3.32 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               pulseview-0.4.2 | 1 
         qt5declarative-5.15.2 | 1 
                 qt5svg-5.15.2 | 1 
             qt5wayland-5.15.2 | 1 
           qt5webengine-5.15.2 | 1 
             s390-tools-2.17.0 | 1 
                   seatd-0.5.0 | 1 
                snort3-3.1.6.0 | 1 
                 uclibc-1.0.38 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a2cb57f0bfab8699b84218ea4f1522692565a7f0 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/aaa1f5f28a8929a79588aeb410a661ab56458c56 |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/deb193f13b38e577a981b2bed1ef23c33ad70076 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6f83ab46e44f11b0bcaba1cb1e73df0f91a602d8 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/91125b12c7804f0ceef3e49357902df31e2c5ce5 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f553dcbfe46ef905872ec42532816f41f8126203 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/965623bd1d5c745562028a0231cff2e920666170 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/46637a139e5ee6adfacb3e46ad3a559a67dc36ca |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f9256258e967bfc7283314d8d7c819e4656036b0 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/b76b959888a1c30e48d97b8f8b2e27b90b380d0d |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/0d553c7b1f84862f2e2e1209fbf202807c8c48f1 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/45f64994a34fe147b68de632a39bd6dcf521b5df |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/da298d813b0e77ac7f134e770b76fa1f762c7c4a |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/19dcc59bd5e903a8dd434e72906fa91dd243e9f4 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/c6181877578217b8208e629bdf8be5b0d16500e9 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/ac9821f9a513305c17f359e2ac621cd2ccbcdd71 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/a23b223a35a05ee4ea6a85e0331e6d041138bceb |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/90f8fa44b54378d5b54c25e0698da93dc18bd949 |     
  mips64el   |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/72c74fc4c6328c31405d3f8204f759faa8315f67 |     
    arc      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/09baa2ae9d075d33a556fe1300d50a8c88b9020d |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/da8ef6e5f5ca374d00bfb06496b37cae689f6b10 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/ff7c9bfdc7efc1558635759a06cac179bc8b7ec5 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/ecf2519def80e704064e63c169b53d22bf863d96 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/825e75fd7e8d4fa016966f4c1377536ce2c9c120 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/95d434095f23227c33b499d94f7a91b42c67efde |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/0776126941e5e616cf9872b364c27808b312342b |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/45934c84e03ba974f631932585e2bc0aad9fdb25 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/005290a81c00660480324011a9a19340d04884cb |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/f5d815f51fce1d96604a006560308b59f37b15ef |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/52026f4f5a87379698dc5a06561b5cb3c58eb197 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/f9c6cfa186d0e19e40d8a075f0596959e7d3c9e1 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/7a007c5bacbc2801320500967b5400fa07c353c2 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/14733c7b1cbf0a1d3c6b6621f367e877a45b6a27 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/57ad0e7625e326b4ac07c115fe643e90441b80fb |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/7ad9cccfafade257c46e02901eca2fa0667330ea |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/2628d8f25cbd4ee2eb369d1aacf1ad4b42b8dd8d |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/37254bd5ff3848367271573b88158b6fc197d2cb |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/b31fadb276226d6685da23e920bb06988622d789 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/14b04143d402278f9c7be6b98e76208bd4e7f5e5 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/e91db0f87785b15efa252b6dff770f1589529733 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/66ee5eb771e37d1bda82d2daa666dc36ad12505c |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/17cd46193de4e2e8f13dd793f253211203bc8427 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/78540e99ef47f84f78bb665150a292c7b6773906 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/150e7ce2331debdb5fbb4923d142ab97efa314da |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/8dbf2fbb6943a6b44067a89716772651ac275c86 |     
  riscv64    |            bmon-4.0            | NOK | http://autobuild.buildroot.net/results/bdd7fc36816bde5a7c2f3dc7f6125190d9fc2fde | ORPH
    sh4      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/00f4f9790194ffba4ac41f3ddf1eeccabf491123 |     
    sh4      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/1b336ad1548801f4342702d52f4795227a8a69ea |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d15e3eee5aa30f2d27cc3940e3546adc1c8cd109 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ae7e36dfd2c03d877fadae4a722d6352775d7548 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5179060f0e94c4ccf67bb0fdf51de9809dd9a8a6 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/090b9537b607e5fe53d2facc73a436ef286fb953 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0dc1da9b04633a0c2c61d0df17bf8194860cab11 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fdc1c69523e0c90fe0ec363bfd38d51d67a75cd3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d9d9a97fcab4951241be2943a96b5556075a7df1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d24d2a418a93a7e0878e3a26622cd0ed2df90504 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6420cda2ce6a403733a6e60688243b306c8a3b94 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/27010c39febc1352ff7f0ec0424bac118fce1d3d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1bd8d269f3dc28ee52fdba43340e7cb5f9eff414 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/08a7e9e8a8259e85b86cb7af06595d475e1ea566 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/96f83b67494bec9a27006a94ef76417ac631072d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2dcc8af197e86fc2f5e84d4a58835a09d5bceda7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7e3ae2dba772233d65d9473e27b6087c360d4d79 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/38d3e6d5c4a864a1e318ae8be2da745180c5c7ab |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b7edb5d7ae531f219a18c25f7066cdabc7aab4dd |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7c015e1181a76d7d73790ca729a94a06f9f95981 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/b1b31e2bd4bbbc299328b8325524efcfec8cf308 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3e8bbb028115974dca50f30b40b0bc4b796b7af2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d0d135d008a57fa877d3b351e4540d3b63442fbe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/963f1f5784390299a963d502d90449feb124244b |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a52d04efa2f1e60a619c3c306f71f3aced4cb542 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9c801d49dbb907981ceb0e2c25e085613e76282b |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6edb0dbdea0cca088667c54dbdadde50095d8549 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/85c04de921191c0ea1f15b3a1610caa800a79842 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccf9f1b68ea04219ca03a22bfd90c0f874c11cb2 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d1abf02a4d7b4d7e299ba16526fde17a4eef0aaa |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7371f635a398d547c31fe29e1cf7d499b3fc7b09 |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/791495ec5221b1b40504adfea37309c2626f9639 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f93b00cfb211b38c250a964468846818373cec05 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/df9860b2fd7e600caa26424b43ef6d0ea89aff74 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6fe91ac96f069ed9f9e617764c486ed6503682f2 |     
powerpc64le  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ae45f1b4d6161fbeec880b522c7b4f6ad8755feb |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/09dcd6c5d0ec10a571accffee08a7418215b1cda |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/95a6c9e50d4f6fcde1bdc40c0f42e78de88b88d2 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/189e2f0d7c5ba6636262eb9d2b30760191b65b87 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/140301b2c697790fcb01fd1bbaa97754d6713274 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2c4eaf583fc284eb0ec05f9498abba3d79a5fdea |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8c184a2fa02662b727522a117fc1304b35c076cd |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4cb003a6b1eda026f17c6f57ce2506f61d5ac828 |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ce9e8522b7b8fa1c7dd51ab9f5586dcfaaf5f8fd |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8ea2d5900aff6b59d7810c999b3c1888c3d329c4 |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccf949047a7c13248af3c9fe2168d36e43179a8c |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/87e6ed5d161fd0bf303ed683e78a76569840ec84 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/cc11ad2eb83ef0f7f105b73a2cdd90961310d0f9 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0119d45147b1971f8cdd29d3b18c54569f6b7476 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1742209750122b7b51e77bf3b15a6fd834c6b602 |     
  riscv32    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/93bb79173561a7eeb4ba4163bfa16f796234bb15 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/025aadd5028099e38ba35d655e743abb38de75f8 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b4900764fb04b52d58692d3ca1e328b650266cd4 |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/dbdc8454e76f1fa0cb4fcb2ac882cd60f95b59ec |     
 powerpc64   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e28d1848cb3a97a4aa05805daa5a05508aac1d51 |     
microblazeel | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fae64de381f01464d5068a3a80ee856dc6ab7780 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/97004508d203784b3a4996aa157e32854bd3e1a7 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4fc482e6326cbd29f01b081540772cef907cb665 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/b314eb58c24a23dfb59cd56c401bc362d92ad4e0 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/481d264d23eb0d3c59547551bdbd92c4eb52cc80 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e32bd63f1b9a65234dee4216dda9b266598ad99c |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccab8710721eb0c2de55f478ecaffc47e62fa30d |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/135d7fea29cd676f71f223273fcc49463c95fec2 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/cdad7cc95cb4fc1097ebe267613b249f84b9d763 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/557422bb2fbed4da8bef720f27d460e59a40e7c3 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/3ac996d2df1b66066d204e1f9c1b26043e8725e9 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0e51111f6ccd3f1d5eb46b37f120b168b66d6f43 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6fdc53f09d84cea595e610867d0f2184a1653a91 |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/e1bad014774b9db0639fe9d442b0a5657d2e3ee3 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5f10018e0d5908217f6c637fe6a9b3393af8d15c |     
  sparc64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/104901b05ac753bb7a6c315dce1191ea3fc6bfbe |     
   mipsel    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7f03491ae8f856e51463c3bbdab57991ce7581bd |     
 aarch64_be  | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/8a8854ce2ce38cb57205e44edbe6fac65084e0b6 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2f0ab9a3a7fe6c955b62c0fbeb27674e822c1803 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/102680b0182e93f442e138fc341ce38401bfdb9f |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/52346be9bcb8071b2ba107f25cd051ae295668b8 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f732e7999396185ee3c7ff6508264854ca2395cb |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/4113952600c37a8428eb1eb39679d6d0d0221ec1 |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ab38cc11ede708cbe1fe3f26a1da3cc803123539 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a19568e0fc111ea93cac2d68a872897c081a466d |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6ab8e1f7cf2678db21ec7e009f31488bf42ff1a1 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f5e8b58e33cd723970db08c70accbc32a5664cfe |     
    or1k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/02a088682071f3fa904e6ab9126ae87e7144ecd5 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7fddeedfa59cf7505b3563c6d0c4fbedb34044c4 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2f0e8172d01d5f7782b79f07da8645f9cd3fd3d5 |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7507b3c5cdcae04804a750f688057adae93cd329 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a6a9dc0af9f178be387e69035f8a359b6a4b11b4 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a81753d9c73a162dd961dd4584adc3d26ec3bb8b |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/103d059d11e1857063cfe856468c842b03f38322 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/1eed20919f86d85fd0f4eb73d6b4a09069a24494 |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c2beaea72fa23818a04100b40332408ad300d017 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5390e9050c289c296aa554cb8adb8e7b24f747cd |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ccb1986a0c9fcfee8c0323473e3057d62af9ba50 |     
   xtensa    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/fca6dcc3c33cc4a1bfb5fb66e614e1e48e66b77b |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ff4bb75c2d143cb09411325131c8848cf06fe534 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f36100da0692e7650b529a86443a96bf586c7bfd |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0dc6029d74018682f02e73953869ecc90f1ff8ec |     
    m68k     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/dc67247ea77eecac3bee04cc8f3d84ba0cbe8428 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f917ed2596b6104d628718356cedc4d6c6590009 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/98a4aec1103c5fd22b09675aee3470c9a9afd8ee |     
  powerpc    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/023a225e77d8009b2181f47bcd1bb917dcdcbb79 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/38928d55007d31c1048f2343b881151b4d65200f |     
    i686     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/2ba3ac883e929a3b5e871f1e71f714f05db5f065 |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c6df1871d736294655b75093d3df5b88a3e0fe45 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/78b8bc5755e23300690d0e7443c21e2407896cf5 |     
  mips64el   | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/808a55f588b453e149bc83568ac951d45209187b |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/6f28c7fc61d3e438082dac6b181cb436f4d19700 |     
   nios2     | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/280180a2e22edb26a751b10de99033580585adb5 |     
    arc      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/d829dc153b9455fd5a2a6a976cef6d0fcadfdbb8 |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/4756e7fcaa1aee69c177ecd8073340506093603e |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/c10f715cb38c56f861ad050920f16b338a7625f9 |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/3b2471d84048784d3f4e0d269482c39877833553 |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/987e5941cf1dfc5d42792b638dc142837f00b412 |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/305f41b93cb037ac0030695ada0b50286ea9f263 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/46d6ac064366936e585b94e63c3e8e3662b079a6 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/76499aab89f201676500c333b49d0e7463e6edd6 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/21e6194d6a61e5c755120f6d0d0b35752e8d055f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/272d1539676d5c2894d59bb04aed458b04653781 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/cd29d847e1a906cea4264f86da0001e8f3d35ed3 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1cd5ff90c3fac5f648cb107cdee42b938950eeec | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/be5d0807f90db4a9994a2b322112d183cad30dfd | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/6f17b76f2c4beebd14c87fd45f4904a9ee244710 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/bfc89884283acf9165fdf8b25d77bacd2ca46292 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/daca659abb6652b7cda78a51dbe243899e3ddc1c | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b74b8800c42d367ef87a01f56f08074be0833b8e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/8ccb03474007b3f6b6f119c6b543e8dda8667e78 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/902f30231e534c8a9cdb586e9f85f67b27e61b25 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/0ac7653ff79f1dba392b16014196fe64b28d7dc7 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/cc903b195d7041b284048c7ddccc4e5671c9f68e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/87e9800a10c597407fa075172e23841e939a61e7 | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/68b872edd1022e279ddaa7ab836122a104007b29 |     
    i686     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/599c4f6186f3e233d5bf24fbe89a0dd13762fea3 |     
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/be48d7a25018bec10877212a2a9201eb9dbd52a0 |     
    i586     |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/aaec3acd840464200af9cba55bba8d2f8704a535 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/32813713d51250b969a1f875eae442e53ab62153 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/efa16355c02d455306b6c08e1d8f4469ecf592f4 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/30dbadccac3455a239c92c55b536a34b16ef5b0d |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/20d0757b2d9164760c624d953cbd634cbe22e62c |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/38f104b487676b7c0068250a5982d42d633cce92 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/258fef13a4b06b808238372e90b1557de9ee1e32 |     
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/9c1c12970490ac47d0b8c6456cad838efa899cf0 |     
    i686     |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/ebf706ecd153b3e4038188adbb5a8a990fea29d2 |     
    arm      |           dtc-1.6.0            | NOK | http://autobuild.buildroot.net/results/46fdfd1571ba981dbfae575f978654ceacbe8fc3 |     
    arm      |           dtc-1.6.0            | NOK | http://autobuild.buildroot.net/results/60203cd2eab7db55c148f458e71b6cea9e0ad0eb |     
    arm      |           dtc-1.6.0            | NOK | http://autobuild.buildroot.net/results/59305de179a5bde415cfd42d75e005b36b7ec4f6 |     
    arm      |           dtc-1.6.0            | NOK | http://autobuild.buildroot.net/results/10b41fd4e4908c622febc654c8284250808242b6 |     
    arm      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/00e6af8ffb65214f2b36223ee4161eaf13604e70 | ORPH
    arm      |          duma-2.5.15           | NOK | http://autobuild.buildroot.net/results/ed838a55f09841a643b05e5a7a7ca0a9d2882acd | ORPH
   x86_64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/2e3cc1c81ce0287bc6c7ec6b1160152351e9d43f |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/6950fa0ef6cb6be76d300be21778db27a6f9591a |     
    arm      |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/bbf71e2edf88bee4ada3974903bf5a9974b0771f |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5b38cab8eae6e7cf2928d17dbb923ae8013a14cb |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/6249b704b09f392e3b21a73a7f930b1188a280e4 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0b4256282b9c926f7672f93db89298fdf6d9db09 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2a94bece815b175ac24de58624a81a37b8b04470 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/c876ecf3958c6fb029e3a6262bfda90f2451851c |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/47ca7c0d03e9fd41b072c2313e30c17c2bf34431 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5475b6f2f8032fc46efe5bb206a90bb02cb86ae1 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/1ba3e15007abe8995b2d45d91175fd86da849039 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/f32333d717c4a1f78f86da342300d1ec09ed25be |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/708d4d285df6f040173f96ca89f3db9b5035c717 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/664d92fb61e1b061d5f5f0e01359e2b9cef265ef |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/cf6c08c0e3496f19a46abf8fc356fe2f5aeed544 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/dd45c80e64952557f640420d4dc8531b9201c6c6 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/765dc1ec0c59d108d4899b0dc4508a09c275ca20 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/2939cc004753198c840c712bab489b2d2968ada9 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/87a7886848355c4dc05b2b5fe90d365a1621d4e6 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/aed93b3ba8d3d16e4ba8c74feff007c65f4cadc5 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/245d16ea6b42880ef0ed267eec6aeb9496bc38c2 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/90c71e7e15046529cff5c54e297116982262227a |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/74b47d9f997b752b8d1e3f6c83503875bc03f439 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a519ab7f718eca238862960f187d6f9b59cad076 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eb3975cf296bcfe435bfa120368322632e08a793 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e6abdc072a4f8a43fd0730371f9aa4f04b82889f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/996142b6faada32a7df209583368dcb18556aff2 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c769d4b432bae31e8d72cbde4650d3080202f8f5 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/103904bf9dfdeb283f64aedfde6b64267bfd2b64 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e195664635230d8ced8c2023b20061f1c095f80e |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2e769c26bc60d5fa0a88f2a5d77c10d0ed2bf4a4 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/59704f99eaf21a0d6fb18c7140616cac5d08d2d4 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/40633eb8d79443d882cab01f1de3bf36819d5deb |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/78f8bc14ffb545f2f1dd434ec9008b54dbad1dd5 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/96189988a7753e089801b48a6c04be9d9baa777a |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/94c3b0fdc2b38b2371030b8dda268dfe45de8bf7 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/738aa6cc0978735e7a2ef43c81567e438682710a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6943dfdf6435f47aa79b43f99c427533ff25aa1a |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e9885f65ed6f9531334b24f1df9b8cedc1ec12c4 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eaaa6cd4a1428d4cf28db9f1ed0aa0e838fa2009 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0214e614dde1d29ddd3a9415fad849fa9e1ed3cc |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c87e147d89fdd03c88d02241645bca095b56446e |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c0b4094881432cfa7a8888c2ffecda3c14455f5c |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/51e19916a32885797996812e2c2d57fa36511e7c |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4ec308d44bcab644cfd1f76a89094660099db713 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/4af4cf28956d1718023c040f1dfe9ca5e0ae40cd |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/56891657bbbb1a0164100babf63a0f3bc7a98ad9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/514ca5f4c548792cf482fababca24e7e1576f5d3 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/59620189ce8df608a610a753ac00bf1959411433 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/092294fd34a9c166b0f422f1fd204b3b0987c406 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/06d54327eb6e097c8f3e4d2c9f3fac9db904aaec |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eaa028620d3074e3518721289abf14bf7217085a |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fd39c9ee93411de3c0874f2f1f069f7f55d169c1 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6a9fcf6cee345d182633ec4345f2eedf49690a0c |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a226e95a8927a2f626408b740f39217b22924da8 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/35a3b3471558b9eddb7e29fe598eae5c122a7b99 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f0b4a18fd3fb5d20fdbc65bf7a44e11915727c8b |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/40b9dd47802fbb7da7acee849757cb79b415db8e |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/02d8e1488a09e39bad1510e7a2f36082ba81c11e |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2447573b8d2bfd8b3b30adda64787f0e267a1514 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/91cabef11b3d8462b1574a06b26f0ac8db535c36 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5b0b7169dd94236c445e7c1d718ace9a1e17184b |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/be407d1bac92597a6cc5d7ab33d86d2f6ed1752e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5c129d9573a5ea80cf0a3596a3c6122330a9354f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1da0326112d9e942c1a69f41e33eb154256c8122 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8cb2e4a9ce3a141c74de360c4f65975addba80cd |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/eb379accdb1c4a0c17b5cf8731a616a6a848277c |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/92cc3faf909ee5e4016215b8eb714716857b0164 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2f484b30f1a5e9caf13b51e4746b3f3c5080c40c |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/83e828b8786ea86daebfe18bea897d9d4c5765a0 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6a25206d6008d89de964f372d7039a49e4680b56 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/664a15f7d905dfe84459075e0d3ff0a0a242438b |     
    or1k     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f31c597b69b22600c79b85e56f7d6e4331a242ac |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e936447277bfc269ec71ef2428a28f27036599c6 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1c59e37bf84228fe6e2a896daededda8819f2b96 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/96fa082f095c0a57588378be98a8d51cb2c50cf7 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/af0519abccc6db1aff19d132556e5d2708c7dce8 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3620d55eacae61e68c95b96767ec83d5b3aab9e7 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/fd1fe390cadb96f76ed56eabcc50cd0f9271f765 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/19117944b92c11677634406da55fa88b0cfc8961 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5419ba3910fd4315954a8c2e66ba51e9135c5a9e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bc24c620db77b271711828f2a94860e729572a75 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a47ef99962541c603520a06fcf7cc88e72c3d8da |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b25ab6a16d5594c8ad4b0e0ab11427e11a1f0b28 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/df815f76ac0559afd1e09c887911bec8631f473c |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e2435fd4c25634e8a229bef4d1446accbab32160 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e170c2c4063f9a8420ca81d574a3f2bdcadbdcea |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06757065ea27de3bbc3da770e4256bb9e0012e8a |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6186a676bf6bf4d36ffa5a150935d41203858f20 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65f09823c25d81d9cc4d3c5ede6f8422942de3ff |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2abd450c780d7340dfce4630c4c0a12412ff356c |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0556db38951848484d83810a84d5bf70f9422165 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dc016889928ea7460b29252b5062c29403e79ffc |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/36dd6c48e69b91f633fac47a93ae7197a3954027 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1b44fc9b25e45e09ed321f55af70622de5760972 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b68f745edb8f81f29fbf78c98926e9edf08dcdcf |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/752c4e1f13c2f0abc6edfd18de5bec19e673f5db |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/443b0a50886fabaaaab9306bdf70d6f3689edd78 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e2c9a39126a116f77de1f7417a448e84d9c56c5f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/faff0128ef7c7513424f5a6b3be8e96ddafc8f1c |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/656e50b58562ba1c641640ff45dc072f19d163b3 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e2fa78eef4a73e3d48cb2e8a535146aaf87e12b0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/511fdd9bfd1111b7c5122046169a5d24f64281ae |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f5c0470c77802201280560f93f60a1d70aecdaf8 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9e873da5adcc05cf6be5a510e8a3b48fcc154063 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/90a12118d7956b1cb19e94ad9983f5be05337158 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c35ab6398d949d351884c4e09c2a060aef8bf5b4 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0fb40e2b09e21a40c6e8b5b60d9577d39bdc22c5 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d3aa8b1798ceac62de08ebc415c914fca79915f6 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2388fcab14587e3a60cdcd196b5a6068665c0ac3 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc0a1f9304ae18ebe8eb80ba1f691c656c52bd91 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a8347d87fb33e48dd5cc3a595b99238712246219 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/70ee950dc4eeab3fce21d19ac8ac27a1f041dbc0 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/caced4a325eabd555617353e06b58ab4e1492f21 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/851ce70153d785dadef8b4d3e8c4049052b11ae6 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c6e2ecbfd5b3bbd64fbfe0c3f54ba155cd833941 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d899ed858aeeff86fc23b19be76e2470c168c847 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c580d261f11ba298db1e68c3e6fb19e8df54aad3 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ce6fbe74da440fe33388edd02d4a0b6d961ddcdd |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f036e8270dd2040e81bdc26670e6198818f4dde7 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a9a859f8aa52bb1cff5e3fcdf7fecf829086db56 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5d6e5ed3c3f92a7e9d92ebaa0dc5885afc78799c |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8d98428c20078cdb40c3ba655056309db222da5d |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e9f17e7a41f7096276f2936ef47a7e77903002f0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d816ec013e42cd5030e7466bc5dd20ed037cc81 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9f928d34d024761e381d702d0006f4bd3dc6ad41 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4d90e0c5df88742f792be7633c4017891f8a409b |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a1432035ad1e7bb42dcab991e273ac454cd87b2 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b7d8f1638985fb1dac218be5450500b9455669f |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/92f4afa678fec5800376e35c9322f5e69c1f7ab0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d79ac19b478f75c3320357bac77c4e559287cbe |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3b4393917dd7333255736ca270733fd75fed9b74 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ec80ed48e8f58ff6d052f4cad03d85e5b305f57f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0f08a749104d1d9ab3ba4a14c66865da47b51a53 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d384ee1b8d93b4bc3a4d4504aa2836bc5d12d15b |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2d79bd9163d3c857c0e507ecca8edb05b5209ece |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/abc1d808ddaa79138edf793ecef921b01e50f5ec |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9f8453abd4628a65d94dbad46e2941942b268491 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7e5ae284dd08d22614101fcfd6b2e5d19dc09e3e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7cde6ba0c955047ba768a9c147d5c28378e2e5db |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/453810cf6b8431b92551ccf4c5ed9d05ad751ab3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/907d0be1ebfba87cc590e62dce62a06658c61c8b |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/32b860df8b6c7231fcf023729da61fe64701e942 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/275abe355076ddde956cf23a803d22d7d6b1d28e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/74027f3ad134fbab35413f23eaa91461a4f8fec3 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/653724cc2de6fc539be09d78e42211a306abe089 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/87c3996836f1c96b2d68cc5f2e177eab3a5c4488 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e31ec5750a3bec41164652740dffa13b410174a8 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/761c6317b35ddafb2232b787e3a53fed1bdf04f9 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/127c8782b6b8a14e557d66e036998cdbeed0285d |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2592bb26d838bff5f615075cebf0ac242f2dcc34 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a81d84523c2e7701c428265a7221df2dd595d797 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b5b0b5e9e71d5bfecf449767ec8a42226026a6a0 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/59230b8e44c4e3642757eed1606902787cd42b84 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8d3eb21c50cc35d3d9759a18b312f42d11f9678a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7ea506d134978fb350ed255b90d5fdeadf3aef82 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cf051dbb156562c7464c02dc487b3419c6c8101c |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/963eb5a88fd9a054a696245c54c1a9398041eb52 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b220e9ac1fd8efc656602bf1426514da2d543e9 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d305697e365b1145f203c44ceab478bd643e4f4a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b17e872f4de1ccb7ee5f8572c0b206d16ca96c3 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c286bb9b35f706c1db52d8106b75584705602eb8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/386379f7f8aeb23aa152e176cb7bf6a4b4b9fa0a |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/025abf9e76600ca53e4104522d9ca1bbfa021186 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/98abf7bf4e93f60ce7d0e65bb9a4f7ebe46755b9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c2c8862800c472f0a835ac7f5d8197549888a1ef |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dcda49276918da7e9a9913ee3e2a1cf043345785 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e93f9a374a0589f45e95ae0e8330578bbf51c253 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/02eb5d73208bf9db6f0c07eb54a9298068da771f |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0baf1d2d09f5b92b4934e17823ead0223fa97ee4 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4c62d3210eabf0424e77a56c9a96d4fae2fba295 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4871d86d57bb214597484b3e68fe664e3c048537 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/818244cd0d09ee8347fd993a0082a210dfe5d5ef |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b64629e95904c0bf981382eebcf566175df0150f |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b98d2d47abb2bb4d3bda79c28c352b4574399150 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/68d897479d02acfd171670b05306641afb123da0 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c0d2c9ad41a2e16320c46698e5b105d5cca2cef8 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e6ad79d79543b82edb117fc84a6a51185c886dce |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1b074381981e37829a638cd5cbc0b0b4862e86c2 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3ac0acb1d26a7e39f3e1c0051095ec9edadf4b4b |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a79b2977b74cee979253e7f5ca3f34c63cca1803 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d191d3b0bb8ce46cb5ff3ba233a34c966d9d5190 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3fe3c6097bfe343ecd417fd218bb9efa1edc7d14 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a80d1fb5cde4399bbb9437236b705020d27c52df |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b766e1f5f37e035fa17874ebf066de78d09e6636 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a71cb5be9e8eb7abb22cd2c8ef612f12b25e013 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/08909d09a09485272b138071153dcc0bb301bb83 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/66186be315b7aa5b903fa8a53bff0af9a5efc475 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cacca2ccf10f6a5f7ac265f1833cc100ea2bb41c |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/34e45f4bda080dffcb008630aab01b383072b4f2 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/91a5f5ecba0f60c65fd229160ef3b89072928d5b |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2a468c076ea685ea573e17639b72f914acb49e8f |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3b49978a04cb579872676903f9bfa42631d11bca |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06eb43432d29be894297bb913a1463af3590d2e8 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c3004ab9568c42db4286ebdd20490313ebf35e92 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ff4360f0cef620a383f74f06ef0947f683d001a8 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/16b329c265384de6fda512d0989b9a6256e9e9b4 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a8c260539776f22e34f7eb5f4bb9f39198ea63dd |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fc95d9016cc3c9b7463568204d69b2c086d54035 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/70962d29a73449051df3865947fdb5db4f04effb |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3df8ee5d8d92bd593ae8dba23a56c9622a4ac789 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dda2bf8e1fdd4076336b7d7688cc9d7e851ee536 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/86d32adbd96c31442fbaf24696ddbe3eb25cf3e0 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b108e75c5d365dfc31f20aa1b621daf3ee1e60d6 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a762dd060957ab6c9f49c92551bf82e57c05bd77 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cf9ed2020ac083c34ea701a94c865e2a132e8fad |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5faeaf340e976a1f4e832ef8e3aed6121da66078 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9a2bd503513f2e77996a5440b4eb150836a8d8fb |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/438230b754f0d7035bb593489716c8482f057e8a |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f77bc3d5837a4b40ddcf74e80461991810f385a4 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d180178b25e0e7ada62fc3b6a92a8271484d9738 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4f779c542f9ae56a8633b6b63d734ea41d282f9e |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0588d015f285d7965b3eb1898e7aac2e00d1b396 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/621bec3c2979f203eac194af9d3ea58116c2bd6d |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/608f92df53a900326ce5491b3b8c25b85f527328 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7973c92ef0d8f1ca012a63b4258773b3359eb62b |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e66a82b18751b86551817370f6981688ae973138 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bf183ed295f81afbc57af16d3efc4dae5c6e2965 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/975ac81385415161713cb625b8ac2fd2d4e2f402 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/758087d8c1fc8d0812cd899cc74cbc5733701a41 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f9aa311f049eef5e6eac46dd4c74c33fd3a282a2 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2c34f839b7c1ec62acbca9691ebb54fcb500e4b1 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3222a1e8654dd279c3cf4bb88345d93b81708870 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7380097eb309b567d6d83d44762ba107f5f8c11d |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e4f6e827b1085a3def4d801b2432b54f717f2046 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4553151c71022539aef3383c12f1d7d58d2d90b6 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/19120a657916246b125a0c1043f25c8787f0d70b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/519ac66557d8535ce0b2be7aa253e60f4211f238 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/afa39e7e0a58a42c7fff755f7d00796310d6cc13 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/78ec6e1036835fa6ef8088d841611be8581bc998 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a785fe43ffdcfd83499b5cbde2f46f99cddbf198 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06e8114fea05b1d1db77bbe1d04e2cbf3066f98f |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d6bfeaa5edd58d6d772cb9ae7a92ddc7e7b90c1 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5bc9e6d9fd53202683686e3d24b9350fd7c28aa9 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ca343dd467845006df7b8cf88f569bfb343403ff |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/60cb8deb1e1aab420af9f96500316775dbd41f5d |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7a0cb8daa78952cac74c8f1c5efae67ca4d783ab |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dd717208ca00cab85acdda6c7d023a050d28779f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1e9666fe33f5bc5b18c91b55c09df03ebce396a8 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/86c43c22a4f15c85d94b58080255d503758e2d13 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cc4878055d88a38f71e3258233941f897cc8384f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c7f735f19034b4c2a7ff0713e9c00128ea876282 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4fe419fda1f9ef9c8d84bcfa0fcd766fc9789e70 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/07d38e8ebd53babbe2c13089ccce613a2e3548b4 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b24f8be18751ef9f18de576ec66799198d92b5d7 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/137bc4cc3e3ae77474603c430d51816dbdd2ac7e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/94faa5fe0d7031611a278b9d8e478ef4e4addcbb |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7fc23f8a7896c38be9dbd6d508cb9f0612d2d2b4 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/89cea7e5def754aeb5dcc7c83e7f96a5874602b4 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d80630b9784a7eb4695dbbb5e4e67f176386fc5f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b9ab794addd7893fd02aac692bfec7d71c8e7c3d |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cd4b7de32918aa4719f60a1a417c6beb7b1b45ef |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/30b656f8fd257b0955023123d1ecfbb38ded5977 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/913a74183f4d8af2772d57a8137b7f885cb8915c |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/227017140ffc5be05e0071689d48376a47864d36 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/727cc49d082c30dbb7a61b7701d91e815ca5bc4d |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/76c449011910aceb14abc94f89a93953c03c09ef |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ede0935d029f210c2a250e885c1b775ae5dcdd82 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/90237e7b26761787a08813be0112302c29d4e0d7 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/053c47f4edb223c9fd156c518d617d9194aa3b84 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4b22506c49d87bf2a98d52b0c8ebf865e0eef2a6 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/da9ab38817d26ca2eb65cc5e10107bdb94c0e3cb |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5cbbccc538e4ef449009cb50c3f5d1a960c336e7 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e3464edae4907680ddf69676b535caf893776e3f |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d1070045d2d2041bcfde0a777f7de916ceec51be |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/87b58dce5a397d29ad7b827230ead875d6d46086 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0511f247d4bede1f3f994a2afc90d4bbd806b7fd |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ac00d9cd8a52b157313b5d6570d928a27aa53455 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/28e743aa59ce5a8726b8b6bbab1091ead13c58c2 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/40712d3cc0fc256cb7d9dcf6d195ac876295f72d |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/548c448abe44ff680885f01f8830fe3312d7f46a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fde875ff17ee739a6e3a28d9b01f9ca47f2abcf3 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/24f202b99b5f69a9cac83a04c8cab0b69984485a |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8972360bd2ed9bc351c9b7e819fbfb6b75309fbc |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5c1ed48f3f8caa63d9d1f3edf56eb62e240bbff2 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a8900fed0eb56754bb600d6d7793eb981064e7ca |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5dfe5e4d474071491db0d5aebdae37d9f29054c1 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f8535ca4cc35bba00063b6609f4ab5607019c475 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d38086f517161bcbf888777573dccc146bbc14f6 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a93c447076de2b4bcfd1529a719824ac9fd8ea0b |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7e1643d9d9b781351cb42ad7b427b4ededf6ddd0 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5ea3f2942dde4b8ebdce6b2746a4724a0824fe7f |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/21f1f191ada10313f4cfdbee64ebe05f2815c631 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/db6a0f9b6f3576b6e3ccc3df3f2a00c2279af66a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/091a082c41b9eeef2835c779547cd6eaf2d42cb1 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1151f2d5d29e34c681a4a73a9e8d2fed6fa8dbb8 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e8aafbabf5f6154788af98be2024886c2fe68f96 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/67c62aa437ca9245a4f6fbc067d6813fd8c78d0d |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ef0261881a95eb5e4485dce1f8cc61a0e9daaeb1 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1f425ca97223447b08f86f776a88189ed606535b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8a26dbff62f53d7261f12be258c2bda62f68dd5a |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f97e02a06761f4817581986e7a57810714693665 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cd8aef5f43abb977d06e685a6e75f91a6346d12c |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b9cba6beef206b38777bd6086335abc365aaf21d |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cc1245d8c22ca022d9f4352790f53192f5edd022 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c867a1f1bbb442b789c0e44b135d02af4e3c2256 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/218dc3d61e5590e03bae3d1f6fe63229e7c90d39 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/eb03ac8381a8c9fbd88b1fca90476c7d6c265e34 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0eb2c2f5d866902167c754be26681522b5994f3c |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/acbdcbbdef5f97efb530a8dcf7e7ba9c08df5a88 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/452add540adb7b94d0603d47768065a87087f13b |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa9fd44849ddd92b15b391d67094f558754c05b1 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8ff80d4c6cb6d13d1569a589b525572745550073 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3b7f3930a01d621dd35ddc47fcd74236765f7985 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0c013a157796be2ca1d160d9bca13e11bcbf5d59 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/abfb5b9c2f2f5aa84e56e9cd4df87712a3b772d3 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b862db544081b21f9d0925480265d8abad0a346f |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/628117de730eb22cb4c6ebda90839171dbb75665 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d8afbdb7338a091ab64b9a92101097a47d722abd |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d8e9559d3ff759149b16c3bc625d722b832adbb0 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/558a2a13f42a8af210332b909646a0672a04fc6b |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4d8bc9653c2171e5784acbd7f177d983ba292922 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/66e43b537bb58b1fd72744b876c78360cd247569 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2ee8208ffbdd2f77e084ea2e42a0d97df0531c91 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f4761912467777ba7dd31358bfe3eadd12f9432c |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4d7200f75834782a8a560c69fabd29ae0ed9294b |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b928530a7f58c9692d13ad60e753432a1a2754e3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9c89a33331a88f48350cfa0621eca7546c3a9395 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6b14eab05e3f8763e35fb688c73e0c878488adfa |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8bcc3497541de5c685e390fd20a35b14a02c0fbe |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/caf1b7029f1d356e2f6673eceee90f9270bb9918 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/26d6703e06c0848c768559644e866e5ccf08b6db |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d2125b49b1572e01a7bd852f270b4c863f78108 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8ea62987e9b3e6aae68438891fe3e6d16b3358d2 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5c1389f08f30ed74680494a1bcdc783c6e458e68 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/493bb63fc6b08c30e3f7aa825833924644360890 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/427a47ce0c991e54df6d88a345af0036d1989407 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/638159f08d451d0c534d6d6fe02bbff47b222b70 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d65dce5ffd3cee532737f1d6733069fd51b0dc29 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c51be78e5a0bb32060fa51e30aeb707d189b2385 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9917fa7b1633a83f430e7143ea1d88c1184920e3 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/96e210c2788fd22313fe5bc97dbdc410f9f93e0f |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bd896573ca1bf87a15ef8c6fb76af4e5de74de27 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3593f2dff08f60743fa8182e179d463dbefa2060 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/16ed92a6187c61890388846c9da7c462de4dbaa1 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/131e4fe035c10eaea939d8b05a01bade18ef8fdf |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/660b2aa40fc00c89cb8aedad010431dd6b61fdf3 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a246bdf09ccacbab47e181bea9a6d0c0b72e12c2 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/96f0946bb4a6b5fbfbe5f57591dfbb5be0cd2a2e |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/477c58f4f194e3a2955896761e2e9d4cfe631730 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/064199c353fba881472e3d817130592c17d15476 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f7629123a9234954478878cffb37564bbffd39dd |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7d66d796443195a2de7a2804217fa6cccb647167 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a1481f2385a4204f6b50a6367d00c0ea34e0efc |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8ca4398777f951bf9199f4dfb665fbb2d4278190 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f4b7ff512b84ac77948af77e6d079f2edb95f554 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bcca13711fca7bcf71f511821ac53904f72b1bc8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/38c92cbc8c00bf754c759feb910b361c4478147d |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/94e391583970797dcc9ed56c9ea56a35f445cc43 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d3ad1c0fb596f81badbb3e7d74ab42a80b1155fd |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/440bdc5e09fb20d9cfc7e83d542db229c9bf64bc |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/da1e6eece16e400b73abb26b5f4a6d74db5e6dfa |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc2c73edf4740d38b2973ec42e3af224710d301f |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f5e825c6db53175399fd884db363003fd6811435 |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c2a14021a35c2d1a052cb1be1dd759a455d02e3d |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c9bfa71b7b4fb6494d68fa53939cc3b4df5bea6c |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/64b472e1a198ff31585c4bb62e898760a064a896 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65121eed42797e8ccd435822d5d2a96aae1b1210 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ef6e8cbb0d88cf5cd053d4bb0668fec9dd450b20 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/39dc70c6289cb6a004dc70549c78a2440753b8b9 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f0697b8a421379612aa108e4c6a26457910437f6 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6cb7da1e9eb5f158238a512fcd3731065b8a220b |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7fb9588acd83d1897de60817c78d6177676707ac |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8612cc61c4b4fc943740b98af1419d724e3a911c |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3c6b227adf58218fe398a5bd2eb7054d11b4918b |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/883e092d895a3fb6a5e961770db56baaffb3d0f3 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/09fac295eb0388a96cf5308ef29340395e1ce59b |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46f4eb342f5e3661d5883001a0c8dfc03519d701 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f1d61b3e5340d13c1538d3a6964ba59187addd74 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4dc6be8fbf32d903267556836fb35b692b0d37b8 |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f48af03bc98fb2764b1c4194496b8419d9c0079d |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f70f5ae5c9f8ff8b54ebb646bc2e2c12c3b885b8 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/907bba9871c920baa44d0c04159dbcf989eb3322 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa9084a7cd68c031d400825c86cbc02e0f0678fd |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/76fcc9db5d4c5d14007f80f37bab872c2c04c859 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/82422bc2cef146c38a495310f1787ed44785c922 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/52f18fae3cda8e0a35894152d05c3b86c4dad0fc |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cf91236dd1874292b55110250bc6dd17a74204a6 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7dbea6b1984c7457f5afe874bf302338dcf824fb |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c183fb09d463338cc58d1dc85be528d298e46759 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/59979bfbe63d2126672977ae4ece330d6858799f |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8d9509be063de2988bde8a3c567fa4d00ee399de |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c27394de42eb53ffdf38816a1e862a014b4da936 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d7d4f2bd8fc9fecd491e8f74cfec470d452570bc |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e9e4df46e17389521be3ff68d3f07e22aa19e8de |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/591bc3a7992f6d4900950a9913d07fdd6c5d6710 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ae8e3e7f472ef4a1ce38a687f0c37c615b989e5f |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3ff3e4f0f94068f6c779cdb1a7fa194a0728d542 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81fcfb00c898b8d200754750eda05fa6eab02524 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3ee7e605dffca6aad732d18669889c365052b9aa |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81874a64a2c5384b851c7ff51fef2c70a68a3308 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2817aa54967d85c4e3eb72f2e510cef4ea089fd5 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e712d5b9b6c7904a361a57d74c7463990eca910a |     
powerpc64le  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b5e93eb721d92d6f60377c6e0eaa5a37fa19afe8 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ea053338ccd2d0a59abd7bf2fa7dbbf58ab10c58 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b8e851cea610854b68dd0f06bcdbd341720183bc |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3c4a92a89829ad9ee5d2fadbefe4f2bbee8f4257 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/399d395d4cd429dd3eecee4536951af22a0a248a |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fa7d20b45b34dc883af973d5cda471b2b56d7273 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9d9e46f0914ad605a795e03dad43ef19832be131 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2725fe50d4e6ee6223171a299c7dce2377162a14 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e1b35231b65177d4300f734638049ff3e4b2126f |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1c2a5bde172615e4226aa8245126ced82ead6f9e |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/23758c36c8124a762a443f5fd7b5f27414aba6fd |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/41817a0336a4ca5c2f61a360890f35763d5aefad |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ff9296a30aea5078fc9a7197ddecb052dfe8a970 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d8c491e188a21c29d8370c6cd8166e31eee09341 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/34d287767cccdf6f7847e72ab227d8d7417343e5 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/26b5a8532b60472d7fcd66cf7b5073439d6fb686 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/27979fa51daa1453e40da6b0c332bb2568cf1ee4 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/56ac5555e5f0dc8227777387d4da5ac4aa271795 |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b5af86bf57b43d4820af3f9b11f2856ab5ae51fd |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c7e96c079227852fff2c6c1e701fc85937e52786 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/33286f3b619f9b3e0329b5cb2dcb56e17b983fd5 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f386f0fada0ce5f3113b32cf2f1ab223403015b5 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d00f3817ddc7ce73951400eee9513d8b259b7fda |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e86bad6bcfb5a27139fec882106c9a24d50fb4b3 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1f00f991e674f6e072a8a26cab12ef75f55904dd |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/899ba393b859d9da2731faa7df67bf2a41e3c14b |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/664e94d7b715925f909bb4d6744973bcc00ef3bc |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/17794589358b2e247923244a7cf532e432ef6379 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e8d855cd587cbc36518366c4fc8aafa19502a06f |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bd87f21de14f6ee3314dd8c188550b11ff348268 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7506b8cd1c874dd1cab0df54ab22c1ab96273a43 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c69c8bf4d88aefffd9987d0f0e661155fd04e0e2 |     
   s390x     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/69a5fac12352fca2e9d0f6c27a57f34eec990e86 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3aab15127675f569bd7c703b9d38fd0eafc9b093 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/77220daddc85257c17057f8ba81847ae41b5f6af |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ce328ef3ef11d1a4a51b9530ba8cd40e9710d5ef |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81424edc6211c9c0f18a05bf5ef7272cf5c7d6d0 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e045bb93fa38e5d885256cf74feb622172b03ffb |     
   nios2     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b98c12b5c55ba4a2bfdc65dbc0842fe8d84b5f86 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5198111ce8794a155f6593dae84e63bdd94d4d68 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6a458eeb7fe1fe491d531c0dbcedc96bef41f76e |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9dcd6cb4409d7e12ae016e813516851f9b17c45a |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/60dd0c4f4b00ce764b66aa47c2a165110eeddc29 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/31744f8476819c725f8c0024529515bb8059582d |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/17a87d886b1a2ffe496cb5922193010817e95699 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b72a9c8e9b2ac79e3605a776d9174ca798c713a2 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b64c4a2d9633fe19a241fdbc72cbc5eb3a8acf07 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dc80d0d5bd304f8baa31e1dfe0b379ed03534aa3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/115927c7258c7041e5254d94bed3da779b48a45b |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/87a7c131e877d05d371dbfee1eb58fe80c77f7c0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/108cab3d5833c9d511830aece112e45b89298699 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e5a9352f1673c405512da093740fe4cee8048a07 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c6879afef7bdc59444b2775d729f18ef08733d0a |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b41721721790f819176b55f746dc4bc144290c7e |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2cbc88505174925da4bce3117f518d9ad0cbb1ec |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/283dc511c792944c3bf44d8dd9bed40d0fb76f69 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7a766d8e4a8433d615a5a5397393a0eec1b12ba1 |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/261d952bbf9c15541d6e0987c29bb957ca3f224e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/01231bca03892c7af6e8049b12ceadfd8700a108 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/163c795bdb72959572cfa674453523119d991fd3 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f2998f6abec1b2575b5b2d5cc6a1b2ad95615ec2 |     
 aarch64_be  |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/49579f1a32c2598a6a481ebb3ef6029b649b200c |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b872a94a676930bc3fd7519ed0da9bc8fbcd97b |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a7623b0a0f141e1b4d8309a525132dd465d05970 |     
  riscv32    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/04f011b7a05c61b2bf905b9de83b813067c17a72 |     
 powerpc64   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/eaa27226564cdd0b225f8a831931b4580b809ea6 |     
  sparc64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0a44fa78868eec122bec804e252d5f41330298f2 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b0fdec317de4517a594d1f45f761b970cd09df96 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/764267617e2e603bd0fbfcc5fa0944a828d94fa0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b4b25a71d23b78ed994980fa55ea9500a3a7b559 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/67faaae2de44a7e1f56abda4ea77395550a326cb |     
  aarch64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e5a20ce0079e8695d3b08da277e39272f4e22f31 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/49bd58075c6745c7c50b2bbc9c24234f539d80b1 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/43d17bfe49a4dd147544314aa75057c1475ab401 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a710da3dbf5b35884f9c40225641fd1a81bc2958 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/334690edaa230138e1e921016b88f5455b60afc4 |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3439430440b40b8958a5ac655aeb0a5ee7c6379e |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/61cde53ed9933f32aa323b8348206a776ef46a63 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/41fa59c55237ae540c9c9a9186c8c6c210679a9e |     
microblazeel |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1e06aef83619500e09696b0519881c2f73624e88 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0b2ef6bdcb4175d0ea1335e3cf8308bdc58f73b1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c56e913fa9a15acfc744333dfdd24d8900ef38fb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/faf8b19e9886df02f4512dc4944bd93a03d3a62b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5c4f29e3e4943a9a090eb058a65d423b5eef154b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a1c07fad1ffc7eb234b90ff2e38e8b4e293d9a1f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a64e46e1050bec7cdd37454e2c62dd2c31576751 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/180edf78a45e19da75c0fa58fdeeaf8269e4e409 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/264f579bf9b3c645e26460519405cb9952b67601 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4181524d5bcc2b856d32e24abba96d5de280b723 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1a2e941fcb11697af2831ac25900179993bf6360 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/06405b43a3f8d7ab6ffb14570dd6d348e70d256c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ff62921a1a3842996244e94581cae3040930fddd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/78609636c5c7fc970e3ef44b3714c7952a612feb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0f00b8a984171fcc2c0b04a8a6ac3addc338ac96 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/67b4479a2b40011ea6993e73f8be60a4a81b09b7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6af03bce18b8f9fc97bfa7ba2d491324a71f2db7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/81892663c82065e0aee2c6686054b5e0faf1006c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c8da40fb116a0c3f0018b93f61dad4b0a0b3ffcb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/45cc047dff6f2cfaf19ec118f599fe2d9eba1e9e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a6b5ed20aafa669e365de2b3bd2665c483e79341 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c09b895f1bb04b85c80046f1aeaf4be0db6c2667 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0f751c734ac5308c865a9ec432bba89a10bd2cad |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7d59d9ea3c6dda6410ab47d8b7a0403e8ec2bc83 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ae4c36d1eca200c2ee415c4a1ebbfad97b7a3e2e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/4cfb00be0ff118e3b5bdd82cbc1ed6da8dce1d7f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9cea5c21251cd8fff72c4eced99a4f275b19a165 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/67f85071d5a6a95ca6e92248596a5278d4c79cb8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5b6ef041f0e06affe9ec2ac1430f1ad49ee0d688 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/90672146337d1a08d5e4e1e525f697a36fd6397d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/93be1d2472b2de4485f44a2b13691984c408a704 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/eadae950b1ab6d755c0333dd332e002122be21b0 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c62ed7b5f6fbb1e5a367cabb709a9b1a6839e61a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/afc3f162c040e70035a266afbfa6f8ef239b56f3 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2af3e23b7e52eeb46c5271ac5a9d737b08388f71 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ba54ce2ccc57aa9d57874d2ffa3e3d3fa2506da2 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/98404ea79d1c50da757a7485fb33c80549a74b98 |     
   nios2     |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0c7547e2f8506f18a2b95e6192cdb14596acef63 | ORPH
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/5c42a50943bb4a7904e90fa5099b9813c6225277 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/8eccc5ac8ef8507ba7c11bb394ef930fe38f9d56 |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/bc8f238d33a897057ba18aac542e9623b571215c |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d75472e481d9c446dafc2275ba6b17bdad6b1f74 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/9f7ce69d736b2b41f69f2f32a7ab7aeca58ef063 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/a88f3ea8fb3386b18ec8eb6bdfd236cc9f4ef3a9 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/ce0a3c46f3dad0da8d312577d719e5974122faae |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/221d9042480123b8914b0881839cb3a1c3a2ec4a |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/db56c4eaf13da38b02f40bb2ca988b1458ccb400 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/72f55e31cc12d904d0bc532ffb1bf3bac85676f2 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/338bf2cdaadd90f0c98ee3116bcc911b7706919c |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/72bea05b8f1e6cf842ea989afd27022099f233e2 |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/8bae57693b2bbeea13f4d29c33a6a5e7719e9c36 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/f093dd9765ab31fb9efc038964e3a9d18dba8ca3 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b11b19b1e59ec08942b99a821fb2a095d38e04d7 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/6c5f45f69a4e3dfd4e33cc1ec71479047b01d57a |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/826d0f8a52906c0b9b548c0aa073cb0c82aa350f |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/9c2641525bcf19b559bfe111a8a481d365ef89a9 |     
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e5934d5a9b23baa22dc255aa419e7e38fe4ea866 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e308950cda71be1b0e8f62974407bee52f675655 |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b3a398da93751c5320503082d76501d7f61c29c9 |     
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/5a36870d538c46c7677fe4931833c6c7cfd432d1 |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/013d4a496172aa756a3654b3917bddb3776ac7bb |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/3c529117335f1788348c3d3f7d081a4f034ffc03 |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/f135745395f62cf600ed168fef55fdef6f211d15 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/9fa02becc20f11a64f3411eb050a734ade80b6cc |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/04733368f9a075e73ae66a3cfdc841affae7f026 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/c751d88d218a98ebd875c12221516fb57d9e951d |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/9681addff1bb2bd685875bf637e47d76dc5f4b26 |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/ac8ef7eabf3a56b173de59111e473f3ccf1181dd |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/86b543a4e90d2c5ef147129aba01e7500ea61836 |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d7728e643b161a55aee3fe2d26e35146a878d6d8 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/0a4fc0650890be96d9bccbe3db13fa1ce4d31205 |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/babd1526fd97e75c37adaa2b59abe1af407771ed |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/850b33a14629c50ceef050388c4a0dba21396d39 |     
    m68k     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2ff2761e7c3ad2b8680bf83912c5e48e5e6e2c7f |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/556efa677328455294cb34a79a8ba01c9c5a6a18 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/f8018090e9f7da2cfaf92deccdc91d12419882d1 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b7cad76e6120c1869f6ec5b80fe2cd2a8e497be3 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/cb6899f4fe024536d2d87ae474f75f24fa527459 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/bf4def8a560f992c05c5fce081c681e352de6a69 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/fae4738c539578e94b98f4cc717cf1ff7240414b |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e30fddf912388dc5ec11dbb48080554106660cb6 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2d39ffb41ef8a7c31a346dcfafb73e78bfc09a6b |     
    m68k     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/eb29fd76e5362fbc72a9707f774f1dc83f7fa1a2 |     
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/7002e5917a5e259a680f0745129c24612a393e24 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/c563c6f642c1aa56a071296a80b9a0d4f39d3418 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e1a0681bcb06038faae336feee656898ff7d2008 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d790d3700b8522c5e41ad9870cb7ee10cd7517fe |     
    m68k     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/fe0b034e46b11d58a9c619e7c9884a00160c208f |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/6b0df3f79a688d050f59639c46f5abd4dce3e7ad |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/382ae108a5a2780f4e6ff2823b91b9fde1f8ce68 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/558b3eddf124b9bba04da00a28242c39b1cdb858 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/731fb63c231f7f36179776aa706086c3f3f34aae |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/6b0e04e24e1af211d2f2fdda940d63d4129c8b6e |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/47126acaa535a6a0a532ef52c312028e48db32a3 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d02e768fe014242bce949b978914916d4bc0f862 |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b0f8939daf477bed7772a7ebebe072a0ee6f36db |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/6e30051ff73bc9909d6511aef12a1657ee9415c8 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/4e752fe2cdcaef90367236ff2d5261fbdff9af5d |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e6d4de2f2af268d7f2b57fa59e56781649138268 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/6fa5a502092b336a2b71f14ca0624bf09862a2b8 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/1148a635eed984d308836b454e9eac418db072f3 |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e4cd1c54199276823cdcf852c8fe8fb97b82d29c |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/ddfa0d5e93aa6c6287f153f7fc23d58711fa5ecc |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/5a1bc30b721c190a8bf8be5a9e86c2fe9292c4fe |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/90c470beade9a36bab4c80dce4bb44b3b6a48f35 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/43d103f41e2db622d432dc83b21f0ee698a1f01f |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/7b9d0f9b55f85843fbc88b9abd9df0ed9480fc1f |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/86bae16a3463a83dbb44de9e175f39303724ff41 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/25a97e372de9321a3b66070aed4e36860a7a0bc3 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/291cd650362014aba55c9f11543c566f8242d2f2 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d4917f65bc7a74f8d03d01411f962afbe6267d62 |     
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/24a9a1defaa992ef5b3ecb982ac47e797eb47e77 |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/22f9b5e8141241f179435d972c6323b15985417d |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b8db224a30901aac7d3132f0e9f52fec07bf3b9e |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/a3c30b875654d662a37236d84bce51f6950ef66a |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/e2502e55fa988fad0058746a5f3d463f754a2b16 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/55416fbef880f7edf0ee369c4b3b0400ced65027 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2310e6d326e778f6fd254cd092dfd76e076eac84 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/dc70f7c088f77afcbe28f9108ae527895a7b8596 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/dd92b63329f7a74d699ae8f0e9e16baea627d4e2 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/414f2f335eaff7ae1a01ab4361a5f9a09233724d |     
    m68k     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/7e43375116814bc0641adc4fb02eaa075c7c3aca |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/30396fff2320aff3120473d9b7c4c4923ea9c5da |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/17e597b1e720bc8f922b210d2fd0dc36d6a2ba20 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/24a2de3eb767f2aed3a27f68aa6b9b20dd9e980f |     
   mipsel    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b121d30432d2ae6b3527adaca7dba47c9433a541 |     
  riscv64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/4e18dbd7ed19e9ed17a7c8ff128a67fcc056c819 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/a4d840d4e198d2f1a3eda455c6fd8be84c6c31d0 |     
    sh4      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/97f14e4fac31dd2f8f7516baa37ea434917494be |     
    i686     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/fd4d2837a8d69111bada6e7b26221dfabe6d72fb |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2be9d3dc99e8ba8879444fd8cea0998508675b5f |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/788505ac3523d18d8c9d6c1d9445f433568b7314 |     
    m68k     |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/d69bae58936b5bc63407bd25dce9e91bbc54ce04 |     
microblazeel |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/aca36711fc8766a8907127f21ddb118c830f2d14 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/c4a68d0fa2dbc91e3cd0946fdba4537e6d407849 |     
    sh4      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/205e61c22e55c4c6a7ff92226e0a6b81b5e1af41 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2ad39e0526909c27160a6d7e481e4ce85f2bab95 |     
  mips64el   |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/31e770a330158035e24b7b952bec0030138482b7 |     
   x86_64    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/2ac3a3e4cefc4389a1e23139190f7f92753a00b5 |     
  powerpc    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/82fa6a02c69a0df0479e2f8a81e1890e4557c540 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/b76bfb58f7f305b08b8534a71ca5750628a96a1f |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/1133ebc5e0972c2362f937d062d6632940a4465f |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/8d15cf0515a19883fab63c3138b213b7cf9aa5f4 |     
   xtensa    |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/0f28c38d8cb5ff853054be43c239cc866685abbd |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/0a6b2d87a5b897e9f4cc3d9c6ca9df50fd41c47d |     
    arm      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/751058d1c329919e53b11b8d8b1bcdb135b4ef23 |     
    arc      |         freerdp-2.4.0          | NOK | http://autobuild.buildroot.net/results/bfd9087f2eb41286e9c702d6dd1de0bd80ba616a |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/961d8c346bb743e30255b014656e892dbd9c9d99 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e79383afc3db8273cdb2f391f44fe2e156534499 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b3e3d7fc912dbe1794df630a41f8eb670da20d5b |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/642ff5f7286ff96eeb5d1e1d2e101b4c33e41ed9 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/2565b02fe884c22ea66142ab8b16a8f7523308cb |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/82ea7880d39d8798e7136d8fb84fcc9d1824570e |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6a4eb9c02cd0fa79e29e73d51033cc4aceaa15e9 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/cd8752d19562be2c909c3ba390255071e432898a |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/805fa8270a0bc03e4bc0d7917d26db6ddfe15da3 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ea2c22b3cfdaa157dc6996e500a096ffb4679f08 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6e7be69af5e79a01fda69f2feb51742626bf01ee |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/264880e8bbd06a44eda8b82cff6e3486ed294a26 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/aeeb20c0e21c2e5ede7f2e49da2d90e9b0f59b7b |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/e3ebec5090b65b4869d893584076d21e8d5f4d88 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/ce52d362f49a402117fa92b6d59060c4488baa4b |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/50930b9096b482c12ce0d5bd06a5b0644bbf2cc8 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b07976d5518da4e65dee60bf20be05774aac787f |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/dd4939dc6c1745fdf2e48e67626a1544dc64b7c7 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/49456638621b0ee60c317f05f005f1155e08a016 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d6a3aeefe425e52d4e72627483bfbcb5b58c71a5 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3a732529025313fa3567a9ea26eacd2c899b7ec4 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b0222a984edd2d5a650437f132f5c12ade43f465 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/126833b78e4eb93b2111a5164bd1e2380f3f202b |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f69cf649be5ad31de836a9a7bfe635e1ce8cd643 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f9e0b5f8fde8f800b20391512b0428c19bd042ab |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/25f8434cbd0fdb36155fef59d3b1061a27b82e39 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/86a9fb23a4aba1a4d843f3cd3c7266a0287acede |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d436aa9eb1d32133203fa2afaa0bcfb61dd1af5d |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/2bfa4975601c6a1db57c6a3a1111967dd04c6af1 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8829a03c6c0ee59e82c34dda0da3b36ca2fecc40 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6a51005c3adabc250b0a5223c671488cf46f33bc |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d52d97a6d74193fbd356fc0a5905efe7e8baf623 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0ffd14da6e55bdeb080afa69514b4308167b7994 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b19922fd6a031143fc4d9e848cd94c01d14a2b49 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/cd41e4f65ae166c0f62e59133cbbb34b2855396c |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/418c194b323557454b4258dfa937a4ff28a62743 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6ca681c2f5079ce3675d01591d7b56ec2d398400 |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/f7d91eeba2969cfc26648fb04727c0e17a0406af | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2dd39370fc45e1d221e60ee691464877fd13b806 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/def077b59fd71a76ebf10e8efb19c65a60e9a22e | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/01430407672201cd564db733a610c8fa7b653e8c | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/36ddc2adfbecc8fb6f31c60ceb7a5fbd2bd1e353 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/ef584eb8fc3a9519b49a27710b40fd42352f49dc | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/9026aee5b5e6b532d74c373b49cda1894476e18c | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/97826aede37d3593ab2fea6df3db32c17edbc4cb | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/88f0151b64c453a4b06a821f06028b119babf2ba | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/fb82c115ab4f6a03aa164ce4e79d74bdf6695bfd | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/89b22b4ac7af828537c546b7dd9b5b6f1f0f801b | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/bc670d677aba1ff2a9e9d470f5cf4eca2f310ec4 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b220b4b060d08ea7e440e6dce2ba5aef2ad33f50 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/5b6d583ccb9f404d88010a0c26c07be67f63552a | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e59a0ae2b30b801abf3bf0b30f8c57ab7ae8d18e | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d861746103bd7b4b246e54400a2f73c6395de2f5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/948d744f9814f9889676741334cce24f56831226 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/d4449c604f027fa4473bb076a5d8dfb33352f0ce | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/d4bbd57bb81a825e850701c1e81a86d583618181 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/02de0347d08be9e59b90d8c4a94c92efb5f00f2e | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/2be7f6e741f4d2d72346fe716a963b365c0ad5bd | ORPH
   sparc     |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/64fda231d1453189400082bf4a2670ed1140e113 |     
    arm      | gli-559cbe1ec38878e182507d3... | NOK | http://autobuild.buildroot.net/results/61cfaff7c561ba0d05467e8422183e58efc1d976 |     
  aarch64    | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/5c3bfb6f54b3b18c00542498a6f520054a37346d |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/6d19382e6cd7f3675e0922c7fd00287538b77617 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e394535e781385db960ba9e63b2ae701491e999f | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9589a9d563a63476fa741d9f73f54f60cdca987b | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a436f25684f0d0ecdcc14c189b6deb31b84e6a86 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/298667e7f624e8f19fb590e418f62d64303bccf3 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b29a1f3aef8e82d5aa9527b037a66fe2b27005b8 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/da020d7de1dfba4ce7fd94af003c7e8727854411 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3bdd4476e3aac24e160720f0cbf8fd2f303598f4 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/5b5073af45a9a1abd6f8b50ad515d20ddc407bb0 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/eba531df3394b03e90ed1c1abf50a33dccbe9b82 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/60df2bde7e59b1951c7c1aa6a11757d4f14a6ae6 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/becd3319d47aaa708f550a4fa81306ae2ba10440 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7a582829431c742bfd5990268427fc408fec3e7c | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/dee49b2c6116de00c29f8196fd08af906c195105 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/dd0447ac0bff33d8231c0fa5eac8650c3e156aaf | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9d1b4f17ca574ec6d2ce4d1b8fcf066969bd0563 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f4b5d5ef4716e970dff83339aa70d8c9b2ca1a9f | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ad21d9c5642820ed18430ba95524a6a6e6ecaf60 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/646261beea3e44654e319124f712968d2e7ed8da | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ff59426295a991e5200e3414e1df5ec714d7580a | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/bbd18ff25d2c7a484fd75682fdae89b5d08ce4ef | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/a69d774c210277cc32b888fed54dca4bbe3dca75 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/8d0fe252fcc1f9a9378027d87cd8f0fd28ffa245 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/934f6a9d06a0bdfcc8b2308c48548f870a2cbc06 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/36be8c699f702cc1ed3cb6a3b5768e909eb95629 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c794dc2d9844dd615764122b79b0fd4ffc1c54ae |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/8feec34fefa09dca0dcb9198e35974f01078552b |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/f98d2af1b343d32ab8262ceda95dad25f4435700 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/ec2be8da40d9a532dd669a5e1043211fff88f1a9 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/0e7bb6882293c26426d2f5737c0989cc3070e2f0 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/41881c35ad87aa978a5955f363da9edf95f1555f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/50b6e55366edfaa73e2c133c86f5df7a648661bd |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/58387db8432a27b473346d628969f9d4d58b50c5 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b5da6ce906327a15fb8936e9d69cf8b43f7f3400 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/73b3734dae17b215d87b6cee00a57a985f628775 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/e4e565430cd5051fdde9e2fbdbada86baa41a411 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/1fc37a9c4e2cd8a421a4ad0cc193a29c77b07014 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/a3bc60371ab13e1e416fc547005ad4270a803114 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/1f9c46143a4d19d175ddc8954f7f4570953903a5 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/5e136b1c712d0d3e69a53a677aed11c5bf86f51f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/735152e16404c4149676e7e1c0d727f95a2971dc |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c785af57d2ce37ce15fdf239ebfcf7ffb22701be |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/39084852c45e2e610618c33644b57fdcf64300af |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/09429748d207817e29ad65b720ed1fd0114544d8 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/322db041d73e8e4cfe428124f5bcbc3de7cec528 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/2ac8847393996b57460eb31f1ea3c15a37706742 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/7288fe8e11d0b55bc4d7d33d8ee2d7eebe1a6d5d |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/ee71b90e3906f21d61db0aae7492bc4831384f3b |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/952ffee4718d7b2c9df7c5389b4f25c39958196a |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/6f1552d2470f8eb20a55d8df0e2fa89f90e21cf9 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/9fdde08761aafd5999f352847e56ec80206d9656 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/7f110e7bbc476e8ac1b4fe7863957e64e6ec90bb |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/cdceb28ae51ef6f97ae7f9fb773f0decc829a65f |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/7f4767f94988c59fa2bce01ebe4a28209e338386 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c1cc5c952db9522d2b7c9492aca4bb01df3b8efc |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/d370435fccc322fc36dd0aa52054469ceeefe7c2 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/0d10f1999161622422d786e948231cbbfea6b673 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/312b0c5f9f905e1e499658d5978e30b8fd88a264 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/29d3cab731c23c9d696d451fc0cfa7014c4902f9 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/075ec99be2a1c0825d9e3373b97e5c4e8ada93f9 |     
  mips64el   |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/e498d18ce916a456c0e969cc50cf27e170161734 |     
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/52e7f3c809c22ad4079362146cd14605cb808ac6 | ORPH
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/477253ff5c93112e1c12c5ee7e75a981f213dd26 | ORPH
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/a2ebe3a665d30437d0d08bef292aaf43783f2041 | ORPH
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/93525a548df379c01bbae25507a1524c12b4d2bb | ORPH
    arm      |          gtest-1.11.0          | NOK | http://autobuild.buildroot.net/results/3d23d7c2c340c23e468890e4df73a9b3b142ecf6 |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6772edafbd4dc4f34e63fde86a812bdfe37013fe | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/977f28838728af6717f01e387e60834947351199 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/da4c0dd3eafde387ceeb72356d8ce23f2e7094fc | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/886879e0dcde5a3d92755ed2e2fb4e37baaf6fce | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/4f3fb37dbec518343d7df3544ddc5df74da1269b | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bf6e0b54e67c7650bc89ed969cb9a1e404b547d2 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/c6d0eb05a4cec8a8ef7002a493998b317a07890f | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5097fdc324fb51d30e9c555c84f20bbbec832de0 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/151b00638aec68a530120e2b9059dca5334cf366 | ORPH
   x86_64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/631f8d260b2800f8f551161384521a49af75c23c | ORPH
 powerpc64   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/0e95f56797ed9356a6434038a4844225b641ab78 | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/57d1052353f1ab5b4fba33cdae88c672abbfbe7d | ORPH
  sparc64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/9b1de13c310d1141b5acce2cf76aa6d7c6bbb181 | ORPH
    arc      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/c7d483f968f6fdd6343b3a88da7329c59e67af28 | ORPH
   sparc     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/3e7fb739f872fb16c22be3dba3a733370088b1c2 | ORPH
    arc      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ff681d4b9e169bd6ae42d5aa3e5c398f09ee38bf | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ee5761d9bf918af756eebf0d7bbc4732632b61e5 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/d08cfde28d840d997b2b34279d5b5d88d7bac048 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/4a3fd5c320f5c085aa245e09e3442220a1c41b85 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/74b55ce7a2d11cfff8294edc4493777c84d32070 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/02f41c218a7011cb9036590fe50ab4b464b1cf2e | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/5d1428214dda166061c70586105cdd9d3080ccfd | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c6b8912c70dd3a69470937615ee0cc4b27c8fdb5 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/d80544b6cf08caa6015a6c596dd5946a2ff2903d | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2b14250117acf0ddff9d5343b23bed5a190f44ff | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/9a5df05da5329b489636db1eef577fa3aec6e3ae | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ec96e26038d0212a33c37d998169a362a5eabc79 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/f2a3b967e712ef77e1f8b4d4ce43b6a35296cad6 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6df6e415c60b313572f0cd31d1f4393f0fa8677b | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/469607e48faa426477e87790e1274e1ed6691bcd | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/9fdf9b65c240ec0d873f3edd0f40f28836c4f9e1 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/b98fe311a1174c1d24274edf721fa4ec4b62180c | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/819f8fb6e2859cc631bfcb1d6482ed40302a17eb | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ca0beac2740f5cb9cc3d00852a9bc2fab2e709e2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/732d51db6eeefc9319d6e5e663b5d00dd78da2a4 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/6f47e9495fc5de542ddb22cdc819a7009ea33260 |     
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/96f92058726f4cc5d988319dc90428b5f912f791 |     
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/7e26fd583ecf5f89e0865f810267a6eacc0eacfd |     
  riscv64    |      host-doxygen-1.8.18       | NOK | http://autobuild.buildroot.net/results/cd39b6330b9b4fbea9bcf79236963b7d90697d48 |     
    arm      |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/253ebd7f3d3cbf9bd546ec4ba28c9d30f2c5d7d1 | ORPH
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/839befa5771b6249bb1699e2800648a4dfb32a39 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/23b681ad0f42d3bb7584c8a6bb30c32f294ea305 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a2df7aeb38a52aabaf7b859581386ab81fe0917b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b5670a61088e231996e35ef0330b010b54581c48 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c4aaaa2c282fffac0529ec75449ea558d27dec99 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b0ab2d4b23c290cad5cc285c504845e52c8c9085 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6dcc0aafbd77f6fdc3684cad22c0bd96f99e8a32 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e07a98a56f3cb72d82f0b581876889f4428bb726 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bb50feea93e2f98833fa85755ed7427c20ff552b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/da6ddc7de20dd045f7de24cb857afccf1cd7c78d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1fadb995e8962590ec789574dbcf662d9b360a44 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f2a7f84851163d5115090550a67e0cbec7a78262 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b8157a56ed9c51f25ab76dd9c4e9a827851f4d43 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dc42809e19e3e14d27b2d96eed66af935e3ab42e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4227fe1a4157289848cd58403b6ae3f54e95fd03 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/85472cc9cae173c55874b563cf09877daa480ba1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9975625dd27976fd75ca7ce74cca887bee6d27e9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d02449deb50fae6debc868878475dbb474265a9d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a74d27341a5f883cba90622c7f8fdc07b84fc3c3 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b4d6079fe7fc722e0db7e9d75472f17ca43d95ea |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ba8aa99e119810ec7df7e691cfb056322f878744 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2a350aeacd6641127ff81efa6a277654784d99f4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c4b39c18fbf4847102a9ea1bc5b57c5252c11a5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/0c576470840da9b67422ff9d6a85c59b965bcdaa |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dbdab427e75039b627ff4fea1082019756f79769 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/52e57440f8b37391c8b5fd54e98b1381b3e5e8ae |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b91b1c6f73358c1c7e05abf3ca5d43805c13b779 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/98f28c5b6f07b18e9760274e83ac95062e290dca |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/46ff8dc8d73c3bbada8fa8f42a864cc0f54919f4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5d1d854f2d17a0b25ee2812c4afd573362f15259 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e91f5040250f2043459f0ab3ed964bfadeabb69b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1d2da756c63ec1dc728f5f1fa1cfac6317b669f6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/840ac263069ab2a086563ff7b87acc55e2d70d07 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9a2c60d834dc7527aa2d3366d730cfb3631142a1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/544a1475a3d0d57a20758a08cb0457548e7dc4b0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/60976f1bef2ab4193467250513974083ae3b2e81 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6855a04b1e2087f3e2bab1ec0092fb716bce06c9 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4b69518419dd6afa832939be198f4eccd0f6ee2b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/62c9227c54f42855e59cc30553b89b38ff0c3ac0 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/20b81460613978f34947f85f1b28efb5c1cf0e42 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/698617b34868bc70334463541a25f78361024e69 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a59957ad73290a3527605ba0e374581fadb287b6 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/20cd0cfadc064c638aef975bd19d061a88ee7fe8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f638820ca96198b63e0be0565ca131cb5728e9e4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e57fabc8f2f796f2a7aaedf162c16c280d4c9419 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/cc231fe3a5dfdb0cab01890386cd7fbdd3794638 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f81bb96132a8d6f386b4db3871b9f5b0789d5d53 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/38b020dd30101d9a9bc9d8f49998c731e95ad145 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2a063afe5b29578a78857a403a657e6cccb55075 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f3c4689e8814f1fc409d8f12148978431abf057e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/86eb69e2e8ba69e03d9b800b3f4f3f6c8c1b182a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/40e7bd25c3773a8445eb1c302ee302c3c0a81da1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c655886bf6559312dca1eec067419d4c5d782790 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4c7491d56df6dca8f074e58df7908875b6bf56d4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c0ccea94beb03879515f5093358d61993b4f86e1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5f8a5f7706814213150ad5c7f5a3d7f7666ff0af |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/edda21810176fe7b4751c75fa4c72a7142567846 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b3cdbd3a3df60150dff393a5a79a4e9b50b44e3d |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ed14a21121536c3f27441c6296aeb42a2a55d6f5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/c2f4b371c5add24c165f8ccc46a792b80f487039 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3be35dc3d2ee50326ef1aef9dbd5a0d741295588 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/50db65a99e66db8e036d8fea6c95d23f705bc0b4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fc3caadd4b0a18c71bf520ad822b36a2bad7de7a |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/54d4419e842236053b7733bd21a6b8801a2cf377 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/84dabd1441fb81c371f8f2d034bb67e56662affd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5dc71a882656c49d73369dd9ec31942e75bf56fc |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/80f36d96fd33e8fe86530936b397535a2c66e525 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/e546237f458e4e735500f0eb387f9914d4d73ee8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7f2056d05f4e05fcb95e2606583e95fac8bf3aef |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/bdbbecfffa95c2911d4e64898ccda70322672030 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/8658cd9fd8032b6a4b5991d01ed988d41f1940a8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/208d6013865126d8e704539b96cc0ae92abf0159 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea1767378559c588f56f738f64e03a5ee51adaae |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/00cab20b4e0a43726e5d41790ccbdc52de6f2c5e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ea6bfbbece0be771346c4042a233b21362a8b162 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/ce99a8feb1bbd81a51305fe548ea2892f1f06a6c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/723a98660ed4dd6d69b094ec76a3b847fdac8856 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/dd6c8d5a2ca3924b48ad3e0aeaf39d192e845781 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/a17c85bbf8d0d5e93ea73f7b99c38d004c82f33f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1f16fb85aae5619b22fea35ff0785b78cf8c672b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/48b650949f71098c70bec2e60c57186a6c01bfb1 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/6d07b4a24835372e44f3489b177fd7586a909cfd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1bd43580a445d2dc1c44ed3f481b05da584d399f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/80b4f21210db24b72a722d9b0d8be35cd0c04535 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/01e578578369cc24455f629823bd77dc8e1ba986 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/9e9ecac2a00530252f5bd6cefa04dd6bb7dac80e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b6756e3cb0fed02fb828a769aa0d6863e5af127e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d1d027c693327615486c9291b4641d7bfd1d260b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/fadca46f7a9087ec3951dae04ac66f26d340572e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d04f4f797c4ba6383bd93659a181757cd99fc6ca |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/189773631dd5ad4419a3054c8d9f9129ead9318b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/62ad25c78d7c42e7aadc1b536ce81cafe3907ae8 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d82b27f98da8b94fb836c288622c5b1ba1772369 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/4b84fddc4809c01a68c26fc4c762095aa3c9dbd4 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/1ea8674ad7233b89e3214fa3bd133be839f9fe40 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/7857a1fa3cbffc8090acf7939e35478d6f479faf |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/d56e2eee6e93660a6ddff8461c28cc9424e1be4f |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/162118cad7176b193953d86676f87f95d42bdfe2 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/5924e6ed337bdc7a6adff18297a0945043d0f8ed |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5b487c87e8eda7008febecd217b9355e8da9d962 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/71591024d4914d4e27d1d71bde5d19d6458b4162 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/53f60ccd9ffeaac7386517535454641b6a95f895 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/314aefd4a23e8d5e4919461cf170b92970912d80 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/69cfc21869491f8cbd25163270cb20a5cfd2605f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/53864d6de30b35865f5be93c7be99c75f62d5ebe |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/be13a9f96b8ffdfcebbbd8cfe67f6cf11a26fa20 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/6c8b0efb00a3a57565742fb20344d6f12257d312 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/a5edd4f1c45e30dbe30d26d0ade1477397ca5619 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b6f8c8d58f9e345cdcf1fb053ef42a71bce0a273 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/510f9a45c307256fca711d80b378c91e08406d9d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f4d033b2ecc0ad3bacdd8eb627e15cf111e0ad80 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/6059a7fa0e624d173ba7e231dcc21a3de35522c0 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/fa86eeab1ccc09ce5ddc22df7f895952c760d54f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/fa9b82a84b92aee6bb92a8b5af0551e26dbe44c5 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/cc2ec989f0dba5a4c6fb8aed3d99a944e907c3eb |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/47a5874b638bde1288d9901334429dc3faf6038c |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9384c6e796b14b81247769a0b87ef50b4c92c2e9 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/56b6fd544d39d77b5c702cfce7c5267eaf51a00f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/4432d58c8de50cf77db9f895ea54d92b08ec6721 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/b32f8a40e0a842bc022efcab3d78eb9fd827ef92 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/443d4a37b044b38500b845e282e6d8e07d14aa3f |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/660fe11739060adb63fc1aec521219cd6d1f057d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/bad2c5f09c16ceecfa9cdb474a663f76f21ee08e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/a24fec6d40023b79dc41a097ea24ad3ac6c9b71a |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c92307e42a7b9d64a551f1d5d193f0541ea24948 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/09cf4854ca7f3dea41682a2917dfbab91703914c |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/367c8874e1ed6b0b677cc76a0a3cb3e6759a9c1a |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/de0d486a91bd4417e795abbede19c080b31acb57 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f2530daf2db250446ae71af7d1c0f320204ef7ce |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/0f976fb34e0231830a3738af8b6ccc4d18d2c38c |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/3651e145521b6551de700cf05add590b6b4f6045 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/92351fff20f1031d4171c5af56b1d2fb882eb688 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/5522c3f81f8cff984860bcc5bee713f02829a260 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/58d7f6b8bc6b77ba4c43d4f490a0c388f0cc878e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/8ba737977cb5d3c89ab80cf87b94ec820e2fab17 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f30d3b19f0ae88cd426e1f2c8ddaa7095bf069c6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/47bc82626d5b57acb309187515c218b4cf0808ad |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/ddaeea30b054e35762b165a94f9c7c1aabf6ebb1 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/33625da63670632afd1fb06010ca3e05deed3520 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/85faaf7710854bde011fc70d4f389c53051f237a |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/e217aa8161c74159f80855f7b97282371194bcf6 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/f8612d917d7a512db7689bf701a7b5dd3fa2496e |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/dc942e93fe980fe24eac95cd0fd2330e8a5169a2 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/e498779ba27fe227aa76188d53bff4b7b25e8aba |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/c316c040cdade56d87561d9b7da442b8057ff3c5 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9c8478ab13bf46e91294c1ffb64f761496ad4ba5 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/1ef6bc7acc6adc70b39c09bef41b665032f34237 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/116f40c22946952a8190ccba85d26913d9786e52 |     
  aarch64    |         host-go-1.16.6         | NOK | http://autobuild.buildroot.net/results/5e432e4015e539ad4a0136142bb91d4cd1b55305 |     
    m68k     |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/348f8af73532943be2d460d69a46e39fbc829069 |     
   xtensa    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/f40ab84f67b11bb93af4849d7f3e8afcc1f4cbea |     
    arc      |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/abb32d987817d74964324ca7e6b4fd7f8445c9d0 |     
microblazeel |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/93e905324ce8e513bef65b7afda8042427098973 |     
  aarch64    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/5691ad83a367cc9e9e37591e1f789e6fc6ea563c |     
 powerpc64   |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/f7a642ba952d0c291ec42f09e7729a478ab8324d |     
  riscv64    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/90c51385fa417767e9a5c79f3567de756adfd0e0 |     
  powerpc    |       host-gtest-1.11.0        | NOK | http://autobuild.buildroot.net/results/1df22c3c80133c620eaac106e1e6ea4649b6a984 |     
  riscv64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/411c57acce41db4288099c59eabf9a23cbb059ee | ORPH
microblazeel |      host-libglib2-2.68.2      | NOK | http://autobuild.buildroot.net/results/e845a193d993b858bfa296b28f2a02c30367e73d |     
   x86_64    |       host-patchelf-0.9        | NOK | http://autobuild.buildroot.net/results/7616e216fe138c9c69be7cc5f45ccd3b4ab82df6 | ORPH
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ea927ce8070ea11408f206754b237bf511739c5a |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/c00fe7ba2354279492a94fdcd32fa545c28a2137 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1001daaca78110d0629ea1abf0cd883f4b9bfe3e |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/9dc587be74f97856b7a5df957d1d730519b9d57a |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/773126ef56a3da7e97fc138e7a80cdd4beafec46 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/bcb3d735e0c04441cb5e93d959e54e0e4a77ca21 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9b6ca5ece016c639fbaf160650d7e5364281089e |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/684c30f46f2914fb6b13a938502bfe7d627b139d |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/aea6fd3e389041d37b49511eb26c2822bcfad7ed |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c0f6399aa850174265c301f7f9198097207a8c2a |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/0927fe0c4d22ae9cfb790eeba9d238264f4acee3 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/23b1b1d4c130538c660647d81c6508d0af9ab765 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f09196d1383ca45987993e251b2c7cd6207c02b0 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6b130fe79bdbe6a2277fb8b98c1eade6c7d79638 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/81f29b4d44b0fb5ec3e94b72d156bf2b46d16607 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6cd47ed3477534d84086f73c2c82984e2819bdf2 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/65232ae5e9431a8e18506fa00b380e0c346d6bab |     
    arm      |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/7a9a4319916efe8cd7e04b8686a9ae0b233b017a | ORPH
   x86_64    |    intel-mediadriver-21.2.3    | NOK | http://autobuild.buildroot.net/results/b5eb46130d7910add57aff92432693455c008df4 |     
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/f050706b7726e699a1a9fd23c613c1055b52e509 | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/b0a9325af9e2589ac67db29f7af46661279efe26 | ORPH
    m68k     |       kismet-2021-06-R1        | NOK | http://autobuild.buildroot.net/results/0e923b0c87d5b76d14f5ca80e2167b9393aba38c | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/aeee0db064b4d785bc0862ad0ac1cf843e685473 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/19d002bcffd7653a5142f168944879974a34650f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9ad879af201784460dba6254959bd0689595347a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/8f3f2da263fa08e687b22b5f20662116e7ccb2f0 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2982c614b5008504cb0a1329f1cfb861e4d4104b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e5138ca68241d947510c53f59b453851a145b267 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9d90cfb6592e3012f766826ff9f424576f89fde6 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c2e14c61b7f8b574c1e6a42ca60d561e682fd6e9 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/550dfc4b3411280aa79338590423e016dd12bb1c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ba0af51bff3621b919439986337d9adb6ca13392 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ee1afd85239055d59b900ae2e0acacb779c3d764 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c44d3d1981ab55f8b8dd7f255e61eda072efca78 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/32142d8db838006ce891aeb10a4aa7367cb92d0d |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/3cae83b3078b57869a7c4adb9ac846eac5d9654e |     
  aarch64    | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/aebb0c210a77abfebd89625232269d321f189e0c |     
  aarch64    | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/b5c3c2eafc1365880a8edb66d76ac402f1125d9a |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/8121ecd125d6a30a6cbde251f3bb066daea6750e |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1a89dde86299b5fa97f8931249a418bff2cc3cd1 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e23481b77573488640c8ed5ce4681819ae5f1205 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9d346167d310cfdba2bcc131b2860ce079342d54 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/98cc3f8e3dd9da31225af604a2a752a8c7d5c949 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0a0e1bbed8dce86de61da1de85134c64e4cc808b |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/bd48497101edc7c02b4796ca8a83ad97a89f8764 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5554c1f20fd0746bf2666e8a72d959ee155a9944 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a583f6ed48d3c2b1ed6b432eb3fecb4dc80ea66c |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/50713333aba8d1bbb87a5376176702572cff40ad |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a1ac250a1c46055f3f6d4c2095f15ec5944e8d8c |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/809b10dbd882b0811eed78901408e9bd6995ef1d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6217b7201cc464676a0cf86d7af0f5bd692725ad |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/fe43e71e00e967d36ef38cde3e20eb75fab2a7fd |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6d8fe5280ba116153bcbb2da3be01335cc611f50 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1d3f2d41db4864c0438a7c776ed5b08bbb5e629f |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/64a2a89fa99874db60540accea13918eacdead8d |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/b82e2addac7eb9fb7b9d34273fdacf682f8a4a70 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1f9fdee06fe937e67428033e53107d24fe062cc6 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/62e0983f3a3c6b072712a47d5db11812753fa219 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9c35962010bc3089e5a106dd75b7f34d4cf838a4 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6671963da3ad2026bb7debec9df02d2333bd7cb5 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/6359114868a49acbce6236cbe37f2f2b6cbaa530 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9c529876b0f9e5f88c67fd793ae543b3509bceab |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/c64b989a1fc40f59b80a9d0faee7139b06f7fab2 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/83bdf52ef6f50303b0f181fd1ca51e70ce713427 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0a954b616232a3c7d4bb3d1a28c989064b3dfe10 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/c4c279bbbac0787b3591d02dba3fe6eb1be23913 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/b0917fa368746b3e512c7525e57deecb42a0cebf |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e0fbc68c0cdf26b73fa682076a1e8929df07cb78 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/49c0406ecf87b516b1a185d9adab11fe1e912d03 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/69676166cfc45b5360208b86cfa29cb6e6835d49 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/836c77e2bd1b456ba4a7ca9d58bcda31cb73c5f5 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/1a0fae6ced5afadf20eb75d7dd1f43450eae0280 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/a8b3634a3ba248616d2737423242216bbb820286 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/f22202b67a1fa2c4ad2975ed8f6c2f2111a0175c |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/5ba340107b5362eb9d3e55e8b95deeea94c9860d |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/2907d09767070034f2e18d75c526396a288d8d2f |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/274b19c3174061bb1d60ce5f435b8e508aa1e378 |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/941e18d5f6a104a39d8f35d6756c42bc5fbb1b8f |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/3eed30842c5e650c87766e8c1bc224baaf0d22d3 |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/623e8e475862c52e795b59d746b6f550e66f5b5f |     
powerpc64le  |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/0b0c972e185466b0aad8c3486d760eb853d40248 |     
 powerpc64   |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/e95c511e215421a35f50def46fee41024cf2a69b |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/41e6bce4746d395d5c6df72d3ab63e5908c99b9d |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/d3239fde629115639d77504418cc07fa11d18d09 |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/55eec4b1f6840bb47a1878084a69ee034e007263 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b8c115ba6eb0916e5e45370b36caaa842f36bdc1 |     
  riscv64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/99ac8b8862e9feb4cce2f3c33cd210526222cc92 |     
  riscv32    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/b4c9fd1262229e48c8359fe30e5c02f7fb1f5765 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/724bbfc7b5dcbab1afe8e2aa2d6e4057249da7ab |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/c0f14cff0d9e335a1323e78fea675dc1504e31ad |     
   mipsel    |        libgtk3-3.24.29         | NOK | http://autobuild.buildroot.net/results/c7e64660f066fe86fc4ebde7b1b0f53880512051 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/c6fb69f45c3ebe62aad42fc9b85cb85963ff44c6 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/dd5dcd20647d894b09dad05d5ac944e16eada2e0 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/bcaa133f4ac71719219461276a16b024da609d50 |     
   xtensa    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/99564488de4f8db136bdb62d8fe620e1f4e7d2f3 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/5c15be72266123c0f870d22763122c4be46bccb3 |     
    i686     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/8553211d87a2c41d8b47b51bbb193736fce49714 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/abb376b42e487552601352542c08ee4cb0d73f42 |     
    or1k     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/993a4ff875c96eaccb58ffa45d6cc6256ef300ab |     
  riscv64    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/7bd748f23679a4adf7b2e201c944b4abfc1313e4 |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/466aa2c7f03434543c2ad2772ff0f61e6cc8027d |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/e50659d0741abf7ef065ed045de2dbbd4b65e8a0 |     
   sparc     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/537fd2c66747985f1fba0371f46c34727dcc556c |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/55200d4741de85aff07f0ccdaba786a63373a713 |     
  powerpc    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/e94c2c5eed41375bdda1d8d886ab53d4c99e32db |     
   xtensa    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/3118890b059ab199c1e3e2c0efacb4ed06b9a8d2 |     
    arc      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/5cf553c875ab21ac1b180af029fa6160092b18ed |     
   sparc     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/8b9564f03ee6b33784457ef85e049933817d4503 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/458f1e0292761e0871b7cc6b66e6f3799f37d45c |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/1a148cbd14595335746e7d53282994d77dbd9fe8 |     
  mips64el   |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/ea7d190e015d9545c3b3ef464b9528b162fee993 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/e339644bdd1a3684cd4a63e50ce58bd050c766f5 |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/cc50b8992e9753b820d3e0a734c73c9d5f053858 |     
  riscv64    |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/a23f646add8e11c212fa8bd3429ec3ea42023ffe |     
    arm      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/f1630323fbcc3b43fefe2fd1fee93b9080f52190 |     
    i686     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/29aac8cd9af99e3cf2bba2afad7826f12db620fc |     
    i586     |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/7893d38eb8f6bf13557a7984ba8fd636b803d752 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b7aef24001b908c5df1fdb43e71703df9b5bde8e |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a0e8445979a64bf4d11dadc6dab9e165098fcfdf |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/557df215a64aeacdf423ab5b1920eedb2680afe8 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/5acc410cd83415808d068fa132aced7bb05a5d64 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/8daebacb81170b2e200679bc3cf5e66d6da826f7 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/127018584dbaae6a3bfc0556cbce7ffd629aece9 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d3687c8a1f612f2adcbe2d927925c937636cdd45 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/1658ca2c0dcda3cb1d12ba09d552abc9cdd72b0c |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/6d1d3fffdf37ac510fbbb90188a27e2851680404 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/41a7d32906a936017fd4b3ead737384cb2f4f37f |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d4b5929290345082ecf7b65421c61a6ded3defa5 |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4134720de2ed99fc56cd37bfcf018671f66476a0 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/0cf97d9c8274a27e2ae7df5c95d32ca4af350955 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a7e18448570c2451d27033cdbdbe39c178798d10 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/62794e0462feb558d0d225c3f7a98921ced49ec8 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/e31b4dc4ab54ef3fd8cc9aac36d8f1ef5103d40b |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b77f6f791eead746bb7312c632a119b2c8652f9b |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4c04a7301f73f1e7d3c9aa0aca1b320408e32e7e |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/078ded835d7029bfa75fb049e17ea0cb14d67e9f |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/65e06fafef711b2cee849c9f2ade1ac6c192ca9c |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/0ab4422faefab9b08efee7a548d3de045a4588cf |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/db169af83307911fae2419fd380881dc30289e04 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/51beda5757a5ab061af3e369693fd41bfe4c7c38 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/9b635a349afaddad4f925cd8388a841c5a648469 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/2b1025921957cfad170f58388b965c5b77b54499 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a1691160d79549b9daa60216039b7fed3ae5a0d7 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/6b01dbab2adbf3517054d33194285bc02ea8bd37 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7395ecdb566497f7faa8dafce2a1c79a563be926 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/765953f6854e5932e8fe28b63956323ffcacfa50 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/04424cff157ac7720a34de355857646ce2c65c6c |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/d0054a9b7b55f0fbe63485c494e04745dc265ec3 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7d1547e203ff40c448b0686d245a72cfa8543666 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6592b9920b83835774b7b03bda3f6b63fc7aabe7 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/eda01d124de12e51d53076deb931f9a76b9514ed |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b2ceaab2eb479bf1e828cd63847c7f46312459f2 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f05cd206212e0fcea5909fd556b29b49d99d5cfa |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7cc1e2d6ff71752ed7422772b2b48bfc7f2378e5 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/df7ccdc756ddbbe2a052009875007fc7acd40306 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2f578a50353f07c268ccdae40e89c669de820440 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d5bdb6f3818a66a9116262343df11b3561eee911 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b3a65541f20e0d220cd727b4270d270ab9f2ebc4 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f5f6915f27aaf6c0d808cd5643267e95dd5725d9 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/64782c604444be935ec0977824e80e9f0c9b4ba7 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c5df823317cf81e46fd89c0b09d7031aaf0469ed |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/eabf113d7cdb87df5f6136c60cb5b63a1c3647da |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ec8e67603fac4dd2b6c7a6072181ded4bb9e1499 |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cd776e704ef30334e750dc0b343492fd2ec3a31e |     
  riscv32    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8941a5b127c79215f9f3f4a6824cf4082a55bce8 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b54ae6b3e30e6ce237a3a603805db1e5e2e57dae |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/54afdd4340d6bd7850e392c5ede7a9bca413ce4b |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0071633c9088052475606d972fea1da75e28647e |     
  sparc64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1b2cd65f3f9348c07605b3e266e4c682d5213cef |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1b9dfeda58d51701df677ce58d353e380b49b944 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/015d43c3b814f9e749c874d73aa8354b777190ba |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/04b3eb2f53177e18ca6692b0b6b0d41729618f97 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7eace9d2221a72a9f1d80fcf67f714411f4641b6 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0fb0d87ae4c33d61018abc78f031c6bad0c4f337 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/dde12ce92513e6288e29364dc5a1188428ebc5f6 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/24cecbbd64b7c66103424a80c9e49b57a1cd4691 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e6f8935c44af6e36b4057949787aab6ec19b4c35 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f45ddd92cfb9fd16c5676bced0e5bb7537d70a10 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d4b2b8bec1832129e13a8a72a25edc38a5f981e3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6b6f1c8223546600f675ce5d1f88bde56b6a4105 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8678544db52a28650cdccc24074894408a3f78db |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/04f4e96da9aa8b797105e60271e3fcaa46429366 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/647809b70395d84139d62454a8cb5682876eb387 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ffafb2eb64e9c655c3628e838d2eb58b6646da2e |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/698aed31f3ef7f330becb86ca5a0317bfb4de79d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/26e71f24a68d991cf39e8fe5a954f0ebea8adce5 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a7988d8637e7a594edcdfa0b871b3e05e52f9254 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9360a0e5f48ac05ee360d3139c9e71be93ea1872 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/94d0e705e5da5c6ff3f89a08a4dd20e917725764 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/279078ea1b0a6cd581acf485d014c06373446262 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2684b0dc4399651c55a7cfcbe1faa7f397b9b126 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f86e130c86a82b673db5d6a00f600e30a1f6f6a2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/92921a2768f597dc6108c94833956096fbde7559 |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8bb6d79d0fd235fb78c6443e5450ad59c2276ad3 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/87056578fa7507a830f71b3843b5998b795d0557 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e740328cc994cddd37b83709cd145a099a10e613 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/65814c693fd43bed16dd4a74f977419b0e3836f7 |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ea29db85ee955c415289a7e884971574dc6933d1 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/05776587dc90307bfe220df72641186abfe832c6 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7e34771c73a381546cf63fa8fdfc741bc8d6ea98 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0ffbd548acf91d55511fcd6b5e30f1ddaa1dcf3d |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7b36824270d41e1c10c30a9ce9aa9de9f37515ac |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d19b54c9dffa65707352afa38e9bf3fe7192117c |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/99be88c4077e9c3a8f86d0abc55ce5dcc49fcf6d |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2da3e700e369c3888e0f7f0a6cd9658bb2466830 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/97acfc100364414643b00d05ee3212144851abad |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1dde146ecf06bb7d044a1a0c75fb980a2366c283 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/49a70fd8682c5a4cda970f6868c5bcbd0ed51ad9 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8956dc890fe17425f44253ce506c8d46e7b9a87a |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6598cb4ea27942594330f3bee852a8709def4b65 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/96dad437223db2a848c167c680643212d8e4bda2 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/61b14355d42a60bf46ff882d064c6b6b9c959b4f |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5a9a69ec8bb557ae703bde43aa0f1342543acaec |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/23f6bd6b4635a8c97189f903e492a40f4a993e67 |     
  riscv32    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f39bb5b36268eaa4ca0683abbf7fb88bd22a3f28 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ae63d86fc86604d4da335df3beff7f57631a7010 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ddee77674618b0b44e937c2c66bc7910110b0215 |     
    sh4      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/85518551aa60c0fa27fc88d3d9f0291d36f23de0 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a18cacc99535c1c0bab3ad60adabd858ed90d0f2 |     
 powerpc64   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bf87c2efc2634be2ee197618e98c8331f8f48caf |     
   s390x     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9131505b1e2d94beb980aa3cae7f6ca183caf489 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/348cef65f65836aa6b11a6d3fb2ced51859001d8 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bc115d8a4535e43d498469d621334a8abd4bfda9 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8f8fd3800a5648de72dcfa867ad8e1058738b91e |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/af63ec8f913d33d22b728060594a575c99b42170 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/40d8ab38d11befab281111707e33ea5d6d171952 |     
  riscv32    |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/95895c021db3487438141c797916ddccc687975b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5472959d1b661a9727bf480aba02bf76cbe8ec25 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/af3061fd4ab26faf35485d3233a091251c3d0c2d |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/1e59b7962ac1fbd8df5a4e5f2ea1f8e2935e2720 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5f783eb6eaf2c997820f9bc7574ee1de4f3b8a4c |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/4ad8e8b0ac776542129f95d9830bc5ced90690be |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/2c8616837936adefabd76238a9b5b732f036aa90 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/0283c122647efcf7f6dd1008112f82080c398437 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/3760666dea676f43c1e4050e86c344afc6067c3b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/c4b09824137bc302d68aa9bdb41156cb8f6e10f0 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/53af62d01090ebb9d6e1edf6280338c79c338553 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/afe9abb1b4b9d77625c1b0545bfcee43036535d9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/ef1cd02d846b8f3c965a629b4c918454d0efcdec |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/85a11be997a8da20321409f220279a1119aadc41 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/8f3bbffa12e5bc9d5f276939c955e623b3f7f0d5 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/9223fc037241c4c48340f889ab0b757b45a015a4 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/6f8afc1cba1a3923bc0f03604a1b41459034aa2b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/15de467810899883c436cfeb9bcb92626ac4a8b9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/33417b874ce77742df72ca2ee0adc259bc05e1a8 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/fe46da583974ae81a291bbb0d6e0a06d9d004032 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/a74592dcfdd2a48aadde367c42bc7e07bcc32123 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/baa9f778844655beb80009e762edbf954f9ddd3f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/c88939d30dbf90201326885f94dfce66277f8f88 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/d7c1cae4865b3ed466a41a7532c5223e57819a52 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/fc7199d00531d6135b1fffdf8847365a295f1983 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/ea3c4eee61155e7e70ebb4e73811c71495ee8639 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/60f0c58aa6eca48e6de168730ceb8e1563fb0f69 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/5cbfa2668cd0ae23bb33cfca1dc5a8ccd885a7c3 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/27abb287c2aa14a27ca57ec68757e8e81b1ace6e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/2bab776522610831bbd32c7ac85b1bd9625688ad |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/0c079772781b66491c2cdb354c45ca62107d1852 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/7d2a069510efc8a6578a67c95525dbdd8f4debe8 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/cd6df7bd2dbe93232387e95d6d5180dd409da60f |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/59d264a1865a8eecf4b2424131e58011c13df18e |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/68fe3f7637ea46a5b9566c42971b44833a894fd6 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/dfb3b16253c59e63bb5aba52a827dea08dac2d85 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/790218ef68914a2e2fec5fddbde5e5f0d25b2b85 |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ee421ae03e141a050f14a1cfcd62c5a10cc3920a |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a47c2458060fbb59b520c952494541cd32439f90 |     
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e9e551056a5673dbc8143d815aa90a75bc9be2a0 |     
  riscv64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/60b97b46512b7c5e4e05d20fca8a8414a40c4ef1 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/cbcfdd6ce0cf85d372eeec09b4f43c78643e7a3b |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/7692df4b15c5d8be5c2c9deeff4d2f5aca19f226 |     
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/49c63495f620d97c791ce08e354b3a0f619b155b |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a105a1f12635ec3fe46ed4c208e3b373e5fed1d9 |     
    i686     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/2a69ad3df60a141f517acef9a136dffff1bc1cf0 |     
    i586     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/44c85a98af57209a595d27f3934f31b671898017 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/943646ec85843c693f402d5f3b46181ff586eebb |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/f9f6f0dca67e93e932b5a106ed7cf6039d174fd2 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/cbac441b71732c394ea55153dff39647d8ecc373 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8cb92f6223b0b1f422ed376275c21798be6a621f |     
   mipsel    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c5a836e983b3b408e4d9c4e5c572c846ba8336f4 |     
  sparc64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/2e7010eaf25158ec7cee08493715c365098ae398 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/8a7ee0bf9efaee5250788c995cb31eb125fbe660 |     
    m68k     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6d8867c47e173061b1f76e620a82683698809813 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/560981b255e13fea79e55018906353ff04602497 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1277c3c0f0893c60cbf12707b2589492151a763d |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e7b60a52b1cf8fa0d22a458f85c85941bec85dec |     
   sparc     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c0ae9dcbeb9c1af6a60c7e7420d594b09cabcee3 |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/6267e6dfe9d01a53e92fc6ee90cdd1871c4866ee |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/a5cf7eab201c23403c55caed435e75df15e2c9f7 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/3491046b2d7e7dcba2c2024e41cccce59d7b6e60 |     
    mips     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/b18a554b82e97c54ce89377110110609f694defb |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/da04c32e2f7a57d47fb0efa48f4b3abb87527c7d |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/28892aed5092ad02dd56c30cd4d7cbd416859de1 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/69fa13ae703311c8637d77f49538ba25647fa5f2 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/db6951c2992217c00b4278b478032997c0e6041d |     
  riscv32    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/0fb9a992654484c366025855a06f0e746519b7e4 |     
    arc      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/280dd5ecb905260fd600d492592f4f43ff955975 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/ea0b2753b47a2f0b83d705aea3dab43d7d1002c0 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/c90e14e7b81bf51a9fce20f2eab401e27b224bca |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9120e7f3e9f10d72ba070a360f2ccd045cbe4707 |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/54a2fbdf1fe0f32b6253b3e9f9639ee13ba31a8f |     
   x86_64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/24765dd15e1a92754546525bb96c4cabc6546fce |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/63af22bd4f853f64ef1b0873e4cc7afa4ff2d67c |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/96e415c0f91e52aac2c2ce27244ba94efc1d86cd |     
  aarch64    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/70344ec4f68e1fea2d6b73a4610268741ae59e47 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/95616e4859602388722023d7360e9f6114513597 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/726743369b90e2e3882d19db1e30804e107d93d0 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bdb3ddb0f8e7dff2175fa1cc832934524ced8330 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/732824ddb881cb31ab64a5d01a879886c40fcc85 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/fa63ead9079c2e59d8daa11570839c6b514fc381 |     
   nios2     |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/e057df030515662c94006684ed25ac90dbd6ac5b |     
 aarch64_be  |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/bc1f34fe64013e20fad3abdc6bbb833b788185b7 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9ed8bcb660af641d8f33a93b1557c5a3a5c02f39 |     
    arm      |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/9ef3cd56b0041bf6d4155f5ea689dfed30075f61 |     
  powerpc    |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/897ae3fbcac22c9b5b83a8df43138ad476af0f49 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/aef2bdde17754027c44455f40d024f17ac1520e9 |     
powerpc64le  |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/7ddde1f6df7bd7397d8c5fa0f5e81d143c3f2c58 |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/1cf47eb9d80b247915453edc0c3c2e6b8ea2d756 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/ac89ba0d5212f7e3f8906348714c50db301906a9 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/e1ff4ec228ab265ac9aeda43fbe3245ae489f63f |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/d755324f71126219230be33a9f553d83ea7460ad |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/4c315425727d7b6d4481c2ab5eb17b08cda12f9d |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/abaa4e5f19e38546e24496e949836bacaaece833 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/e88e82652f2bf71bcc69acc79b29fd77384b8105 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/87950c8b4445c9a4c0337c32364eddf9c15a0b36 |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/362c694431348fe6aceae7d05ecda2a83930fec0 |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/79a680df1831c4a410579c6ff71b3f9c5d430b4d |     
  riscv64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/01127ed31486efb821eae82a981aac0e5ba95ba5 |     
  riscv32    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/f5e77610efef2d476127d4491fbb601737e18140 |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/a41bc04c4bbc918d5da5f2058a630fe0fc7bbc4a |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/a734ab4b006fa35dc3568e8103af33c66b8fe33b |     
   mipsel    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/d3c5d14b15423a533657de3c51268dcbebae478c |     
   nios2     |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/84a8f603e899b17aab3106dce084e5a355925521 |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/b5bb33fed3937dc8ae44023ba1ba8b1984c23755 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/1706c094313f5e6cb43cb1f9411183026fd97ded |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/2f69e5b8c8280f0b4c25c11812ee432c01d813b1 |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/5108019216289d5fe31dcc61ac1d1e4b8fd5993e |     
   nios2     |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/e79cd4caca60558d0728e2d8aa42ced8708831c4 |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/6a2ee599fba129eeb153eb7771ce7762bd5e67bd |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/f98b8fa7e046c6d7fab1e125f5c5fd4a062ce9a9 |     
  riscv64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/244903ecd5638b815d0a43fea60d05987312bee5 |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/479c599af355b2d0fe2ea3aa2dd917728c725d71 |     
  aarch64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/450cdae53d2e8adf6368b71d8157de2ffca5c5b1 |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/284bc70b296db1f0fe89ca2f8d51cf127cb96e39 |     
    arm      |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/0c30e9047ec3009863bacf1dee8d753d2820259a |     
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5619b3accf1f3b338870794320c2cda6fb54a125 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fdd609f6b0dc37184cc90558ed5941dee986476b |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f660ac0400dbeba2f93cb64afffe549c2b6cb61a |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a04ccd0d2d6590b310fce186823a184463050c62 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/dd0a78dd10f316f1b6f32ae06ba961c67c430f5b |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/195880a7a9d9ac321eb9a7a4c5572623612e8038 |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/8f2d045bed134afb86977d0ded106c5e9005a39f |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/78b89b1ace358c8a88a918f9479fb902020638c5 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/02ded318804a958423d46d6ea1d813e60b439ae4 |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f865c92652801b35bd6d22ecc552e11d2dd0446c |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b86827354de30e38a789b0063106da76df825ebb |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/0681256aabf4353d1d6e8f6023b137caaca4afd4 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/7e0e5ac7a5afbf4f2feb9ab122c78ac73ae1112f |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/7c5bb53e16433667878fad16f70e3faeb7f70944 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/4acc34d0d6b6c4ea116c76a70f9a1535fe2ba3b3 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/357102eb577f7d1b4728d4cb0bae9471ee63a82e |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/4e54e89e4e510a9260de1b4bbaf3b9e777f0aa70 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f23499abd1e838b93426931bf4a8b5c09bfd80d5 |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/d2872343a01f82b4281174ef4bea3b2806f48d49 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/fbb79bdf8d343005296161b4c5fddf750a0eca0d |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/18b24c7a9db44996de54736bba99535b427f4404 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/402ba6b25ccc901e74321619f7fd1bd4622cde29 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/bff82d76fb6448c229d380ba5231d4ac95a63ee6 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/a93485a48be09aa57099a8585da8bd67d6af594a |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2617528610a6c0cbde6a395bc195021fc18551ae |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5f093dfeac2147c92be6b2a3fd1326eaa83e27f4 |     
  sparc64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/70e4840cf9300c061df361a3c9db278b114c8350 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/1074af8aeb91c94ea53a6ab757b8b4c7cee08623 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/ea3a20ffbea8c585cb53bae36cb58fff9d766747 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/e191f39fee9e4341e1495a4f0a461ba92d4098b5 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/575f83e2c1c3e930d0b87a5b8787d5bc8f391b29 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/cc7ecaea9c1042b1ff8b409ceb1d991b1db39634 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/dc287fb77db341b3e0701eb7062ca2f099af76e5 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/9a1ac6ecb286e29466a44c12cb14a7e742f51b64 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/bceceaf1f70c24b5b36fcd4b84d8d27ed06d8168 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/0e5f9fb433806931fbe16258d4246588a0ac525c |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/5295ef6d2fc40cd55336d7fe458412b0d7514428 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/19b87dcb850dc79daccedbca61a96d7855787e9f |     
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/dd842ef37815b28fb26278a59b237a32d4b4fc57 | ORPH
powerpc64le  |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/ba23896d3955fb5c22beac8b2e817e0a1d8df0f9 | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/d0c9264b6340ae53c7ac25c143c95d9ce20ce8fb | ORPH
  riscv64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/73b21d2d74770de969241c6046d21864d222da6e | ORPH
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/2ab78f956b4fe704010c5f8e77b10e384294854e | ORPH
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/592a677fe5e692d281283171155f3df12da7a74e | ORPH
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/8ea8c8b0ea5c55ae9cb417269d5e94360995d7f9 | ORPH
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/03f68025ed64dc27e20ee8fdc1da97468e4aeb3d | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/919b759d0f3ba6191e5bcf50b9c2350c48a0477d | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2d0966421286f0ac653904c0645143c253dd3bd9 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b2ab7477326c4c41a7b5b95ba9ba8bfabeabf035 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e1c2725b0545a79cd5882f40aced04bd995b0a3d | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ebd119a60801a71bfde617bb2bc3f14ff39f11cf | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2e62047f7130a10245b8ca90d004c79f885cc35b | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/79293f2b1a65f3c109e56be23287e790a748e4aa | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/3d5ba4ae1013f3d266934b83bef459d974a29c52 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/9e724f4080ece85e13e7eea9052e8060aa1fa530 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/6ddd43714f857a4f5174b850e237e9447e8387bc | ORPH
  powerpc    |       libtorrent-0.13.8        | NOK | http://autobuild.buildroot.net/results/06d32e2ae73d537d086570f8eaae766a36ed1146 | ORPH
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/5052aa1de14a037417b67e95fa19cc30cb32c6eb |     
powerpc64le  |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/f95f9c6ff9280eca4979eadc83a5bd3fc0d5b51a |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/28741768b04316901ce1e090d91ee39d1c7a6de4 |     
    i586     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/298a0b7ae438c41709eebe2be4ca9c06894d19ad |     
    m68k     |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/55c3240666b8891b5afbc86ed16a807c0aaa72aa |     
    m68k     |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/13ce496f8952a15bd09acfa15c1adfc0ee61f00b |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/4dabae6cc9ed3873e866b90f561b43c9618c7da6 |     
    arm      |        libxmlrpc-r3119         | NOK | http://autobuild.buildroot.net/results/8b11975ecc2f2c4d8d1e4781eba6019cf9c5c3a8 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/71f08a7a7e7e3cc8b87c861379b25484c3c8d397 | ORPH
   x86_64    |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/c91e90af472d92583b2df45c84fad765a15b537c |     
microblazeel |       luaossl-20200709-0       | NOK | http://autobuild.buildroot.net/results/8f6daee66da08a4421105bb805828006a1e6c573 |     
  powerpc    | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/787a0453370de3f7cc301eca44718e2133b03a25 |     
   sparc     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/f5efc62b463110caaf0d059848770c65afaad445 |     
  aarch64    | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/52d35c1b12e437ced8cd83af32f7dd9e2866ce7b |     
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/a975216c064741b4ff1fa8a70006ab0afe047621 |     
    arc      |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/5e882445b670157c5c6f73f123ea9acd73cbe10e |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/dc36aca5378afbafc5696f01527be2570459b870 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/5d50be8483f29929abb9b4d597b57b2304c87896 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/26aa0cd353165a36f2bacf19afafdb549f61e4de |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/5929729b85ea3b633cd3cbbd94dfd2d6acfc9e43 |     
    arm      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/a22ac32249c0795778c4842e19b484a4bd3a07f3 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/ae80bceb6534f02896c489366b42bde7add2a6dd |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/8d8c8acae28a2937236a279ca36fa2faafdd4405 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/51fa9cbbac610709cb990ce7254690be3b51eb50 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/a95a1912e97f2e5e45454c72f0bb42470584f0f7 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/47a079688ca0b754a0f1147747b66dd96aff4377 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/2a9fa3b18fc70e30e41e1ad662632ee8bdbe0197 |     
    sh4      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/4054c9d014d49b756c6a65ad7b07b0efbb83dd6c |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/87d868e71318b10ddd70e2977f8b7f1caa3b51e6 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/7bef1aaf951bae04fbd9cba1472c42d5caa17ebe |     
    i586     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/ef818623263af0c705b87da27c86ecb5a13a8703 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/d58a64c9bb693363036f730b1a80073341960bba |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/1c6743a8c77e9dc9e08623602c2408b270a91285 |     
   x86_64    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/197244eab4b167d00814b72f55ed46b453e39bcc |     
    i686     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/4b278a18dc4da7b880d610e4a8ac624225bdf328 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/1cfabbd1ca11450ce2b93952f7f4e266139ea071 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/b73b83644f96cfa2b88f9c1e0bda6f0b15a06829 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/0c5d5cc928221bf284f30b147deca0140503e1e4 |     
  riscv32    |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/e4990864d84fd329c263b4026576aee92586a9c3 |     
    m68k     |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/ddd7ce1c3930493c5031c9227093f4601895defd |     
    arc      |         mesa3d-21.1.5          | NOK | http://autobuild.buildroot.net/results/72f645b2faf3abe15fa48ab65dc7d45561368ac3 |     
   x86_64    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/658058170ad67ea4bae5627e8d6741ba41c512fe | ORPH
 powerpc64   |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/5cb177daa9ea7c91746284c8561792dd7953a3ad |     
  riscv64    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/c9b12d1d684892fef2a5b35157847e6a200430ad |     
  aarch64    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/52bc7099d27804e50245a4124fc0abc14aaceca3 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0b37e65b17d1320cd370eceb43fcfbcd3937da2d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/372b298c5c8078083426c19382647a9df510e183 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5b9f32a96eafeb56adf704d08a278e8bbf339d8e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fef9ab4dafa472d0061f63d02cba7336a4525caf |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/76e753b1862c1e94bea59b3757d35a39d3a03f60 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/52548ec880895ed0595cb12abe7ce35bb097eff4 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/525fdc4cee4af2213d6972fb24941d98ba0c6a03 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/4fbfdc97b657772962a7800ce4c5b0618a37e16f |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/b52e59b35c60ab3065e17e6e89c87cff31fbf06c |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/fd7f26c9fa861a811e13a4d2b57e307bccd7423c |     
  riscv64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f39b96dbea4ed810c4bbdfa199c8ced6f7e35fef |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/5edcb8a4aa2b41107effe50b5deccf9b75ebc95b |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/95d669425b5505837bbc09d77b286de17c9414d1 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/6addcfe7f82143cf4866e8a1c81dfb2defa7c34a |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/dd4de13bcc44f837e28a4227e0c4f308d8e10104 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/e00197bd4bb2e9db0899a24ebadf07718315539f |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/f75d11e6636fd5eb3cd51727f9496f0e3ab43551 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/6a91d58fbd03492a08403ec8b1b646dcc7a6c7b5 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/9e12f7a27f75428bb17c0da0aa0dcc89c1923ee4 |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/119fe420b6639e014347a3e890789d9d89b3c119 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/fc5ecaed67723f4eb31879792737e2f334a53934 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c41791efa7de923df4ed24a07e24c155ab11725d |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/4f47f58bfae68758b5a0e1bf7288469568befdbc |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c90eee9a5992b7658ec74b36a10917e74e2ae94b |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/8f9d608922f69386d516c2595921c8bd161262f3 |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/849636ff3717cfd4969cd0320c7e6fe1af8ff7e8 |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8a9e284b77179f83d8feca6d462f0bd297ac1362 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0f60c125acdfdac68c3941f84c364caaf4bbed20 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/953722c6ee6b14e9d0ad45761043242d2e01ec85 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0f23eaacb8e1e1fb45f0aa9bad61511223699754 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/84c0101793cdd08c3dffc4495abd286162e127fa |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8643ceb8641cec692cd2ead2779b2a5c891016fe |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/04f6ae44f8dc9252117cbb7a32557fe87212d82c |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c3adbffa11ceb5d86cceecf6aca5d1671386cde8 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/de71dfd62b9442a1859b89a6c27fc8a935f06c4f |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cf984ece44c7100dd5d234e6732c8cdda9ed0a75 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e01d88fde6b310a393f5407c82b60b9786b3a87d |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6b0c0adba5c77ec9c7238e45b06b3550961f2e7d |     
microblazeel |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/947f787bc57f132f757863ef683695173f0ce546 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b7af8147e3584d4f2664a077506e1154a2ea5ffd |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cef1e1bc929938ded9ef041cf518614e13ccd0ff |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/975286cd8d2da0f447f843e21a9cdfef1ff56b72 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a7810b4cc66c81796375c95a7b4f2ddcda1737d6 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0ec86a391ab2e855b39eee35c92c3f91c7e59537 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4714972ea660bdc99bb16d2fbad728a250b7c3f5 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2aeb833cd50d4180cabba8a77765fe70de090a6d |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/89157646e0b75389a85defe1696dfcaa182e7e6f |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f614fac5429db1059171ba38be4ee22d97cefc96 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1903b45bfeea95e34a5db1a2f38710cb5a56a260 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e94a78e97bd0a22836a98eb2c1aa07078db9d104 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a069a2c8350ee8f64caf1473f9ac75c6b8593f75 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8d0e18590d2d191918aae0c5a62442e9c9f28be4 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/edbc4a725b5f29611dea7664584f8ec7d985d3d0 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f6453b03ca4ca12e13fb2c44a9a8381e29b61111 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7e6144f7fd72c01a51e1b5cac4ea6499067a5746 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/97adf7df1d7fb2b2d4e12394e1a7722c49dc6f0c |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ceb2ca228be24b8c7e1f30886ba58d516948958b |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1618898e547a3da2dcfe538e4fb5b5c9838134d7 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ddb617616a4006168f3e7a6700e32d29479ea087 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d1aa9473268ff7b4518a114662eb2906607e364e |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2e06f2871321d4d0cb5a4ff328318d2c747614c5 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3b51ff6b64383d5fd40db02c7d7cc6155f193907 |     
    or1k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/659a8fa4bd0b9306edf530dc2f9f7c690ae4e28b |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/16379efaedd254190c762a60341ebbbee95aa060 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/6132c306dce4ce3454abb54f23c0a282d05511d7 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/80b142fcb3bf2ee9c9bff2c00a12b6220ed82810 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f481ae297a1661cabdefcd4bb56169e3bd43e537 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e0bf0778822f38dcf55926bb00fb33ed24fb885e |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b28751e01d2edea0f16eb883ded46034ada6ccdb |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f5fca00449c24848764f722c7b92a91dfccada82 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/41b836d84d7c4c36032c83a7baba1aca4484bc9c |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/dfb648a09db886646724cd2e5065221e30b383ea |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ab52acabed1b34dbcfb4ece05061eb2b9c757a1b |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/81d367773dfea539ccbe6afa3ff093c31337b0a2 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/85a9bdf16c1d8c4eaa05410aba2bb0d395b080d0 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/186dee9b9085c099d1ba26946563123ea6e3eabc |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9f080bda1d6af0eb2e9c59a70f874aee244f8d06 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/02a22a13cd820905701e26eaca5ffdf3fd7f2f1e |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/314f254c603356dfee6bf8619992c93353605b14 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e34d0a140a730d074249fcf64ffefdc048390d62 |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4ed66bd9328a7b065b39847b26d6d78dc386173b |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/53178d3b7b6d73b3ac794a2dbf1399924c9ec184 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9ec907d329533c49348872d8be57ab94c5885910 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/4fad6515336ede6b3bdf8394c7fba53219403437 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/897197364666a06f5ce6fb61e2a3d68768a7baac |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/0559f6d7e4534def2514dfb96cbebffa8bd418e6 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/606916e32ab2ad25a2db823f6ae85a581dc1702c |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/56194eb7536e8afda4a1f2daa85b31078323799e |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/0584faef3930a5623ba67d55c3d88f3c7d9623db |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/e9fc4d035d7abdf10de15e00bb23f4097f6ccc89 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/8aafa38a505eff2ce0a33d331970bc2e6c0542b4 |     
   sparc     |           mutt-2.1.1           | NOK | http://autobuild.buildroot.net/results/dc7334f1b331e3981415f88499106ee18c98f9ce |     
powerpc64le  |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/b37321adc8f26cbae294a98f40e0a4b652eb6678 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/13bd0f3ea6304f7b99fc8a0da32782a71ed1e769 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/d978ffc4086fc99d4fb6507096a792dfc26d507e |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/1572761180c4d8a0a7801a39556930b9cbf3c6a9 |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/9d9080965fe52bacac7de8f3d32b9e11c704202d |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0779739508cc034144b89531bd3ccff3fe4890cb |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ce8e9d750b09eea600f4a13897e8810bc0190f60 |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/dcbcd742375420bd4f724b3b611dfe0503825c3e |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/dd66498d092a8b7fba8ad5c50de9de0a0143922e |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/8852ce6ecd7caeb11e79efc93bfe0e951d1ec464 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/e3dd931e74670f57742c6762fbb14471088a73eb |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/14343b1d2fac294fd7490b851dc489ba51487ba4 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/474dfc2931c32b8336f19c5c9436a4dc1a2100e1 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/a02150c0fd8bc37f917340b301627efd31d4bd45 |     
    sh4      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/b8bd73cbff3f7e535f8417720432eb30cc88472e |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/e202c264e6be931f5b90bf0ec367270cac4e8e55 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/d744ecead20e932961733582ff5dc5a0f5b4f925 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/cd4b845723de8c023134498a70a641d5acab337e |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/5752d5efa625c5d2ebc018064ce82c83a786a789 |     
   mipsel    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/86b3ec0b76bc1a5003dbc7e1dbf116a1fc314c68 |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/b52b26f39481f2eecc90412c3fd99d661d8ddb93 |     
   nios2     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/958b47931cf390d19765448808953d1c630c5515 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/59248accc2c1e562651935236dcef9b16316f4c2 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/709e3f70992a3ade69edbdabfe23bf45bf71913d |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/13f1d64e609a3c9ed34baff5f739cad2740c8ff0 |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/453dd41c63a5c07e7569b63466ca8c6c3e10e18e |     
   nios2     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ec982788ae66540c3e482a791c83748e0b05767f |     
microblazeel |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/e3c0deb4ead8a71845aa620e7e4111b0a855a19d |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ee102250c86782d1b72e9c22a3c1ce39ca581e11 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/73f47e55b5c2dc47c3b305b7a2062714bb79faed |     
   xtensa    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0a2bb084565dfb3cf84badaff90f92fe7fe76086 |     
    arm      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/b679accd4b1ee751ae2da01cd02b7016dcbb96ad |     
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/6c60bc3fca88261e930d616e7cad173840811a9e |     
  powerpc    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/1f036f41e2be9d05ca4209363f3d8992745b8831 |     
   xtensa    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/2ebb41be93e67a7db4498ad6e3c398605ba6eb7a |     
microblazeel |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/8b3ebdb71ea7b271465f26e8eebcd5ad6e701a6e |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/e390fdaa33c51add3c5f90cc87c943f71ad2b463 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/856281797b49f834b56e7631e78b4b9527530e75 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/e14cc9be0dfa31a03acb16ee8b7d750171586444 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/0fc84eaa8ce0e76fd1532cac0b9a1033022867d2 |     
   x86_64    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/76214dd9e93e772c4e4cf354d43f762b02846c8f |     
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/13a105604ef28741fe733008c03fe68155e73928 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/01cfd2ac5e1b31f19d8c6f66135cff6f37849769 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2fc17c75b0b6c4f546065a27bd12b7fb531fac9c | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e6b9d3534057c3999f92a9e12ef5277d0ecbc5a4 | ORPH
    m68k     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/677c54f9c545ff92f496bfdc36bc7c4e854fbcbc | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6e39db09798cedbd3640128f420bd9f4bc723182 | ORPH
 powerpc64   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/df2dd8d1f041a7617f22fbe03059b850133d6e11 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a1b4d5fa588308d8f00b4eceb822a50568883cd9 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/325401795f921c50d4afd7e7411e92fb59888cac | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ca29714e1d715aacf3ff517b52ac3b52df9c2859 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/26752459e1f7e4c12d73b9f7c8a302825476f59f | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/22e04bf7273e5beb2b119339a86b3fa3ef30a72e | ORPH
   xtensa    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/06919548360ed62b430f341624832c98970b693c | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/33ecfab051dc30c4600a3b45602dc147b96b5832 | ORPH
   nios2     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b9d669efaa94d96ff79f62dcb76dea0d7f71682a | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ae964113f8b2e6f741321e938e2de27f7a3b9d56 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6039237f2ce8aa843368ed11d612a7b09748bcb9 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/5ed79966547b6596be564bbe3c8625db500dd385 | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c9a13bff113ad552573da0653a584e9235a31255 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c0276ac5b0d3b94d552b96d63f73da47c34cf41a | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/64e6c83c0c1912a31779cf9db40bd3fd7a3f73b6 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d3498ba5ad4b2cba972786232fca5d193d14217c | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/be41d42d4b86f4ce656ee576ab8afc13d9a2ffb4 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d59cae78b7c2f75843a856d8cc3f37615fa9da51 | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/77b00754c74368c3ccd40fe94df92af032e11d4e | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/9b6b4ae3d2e82e89587349670e9b44d3ae677efc | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/c310fd1f0f68e05a7d33b529d38f7a1f971a84db | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/4da2623b4217a54026e3fdf30090d3eb114440e2 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6accbf957e68a52c24e9555a022b21c38a4b5731 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f43d4e46379eb84b86b41f7d3d6047150967fabf | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3168c52b9e638ded85a107b05b58e2af16a33289 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a1bc6a0360a5fa79a956dd015ab8604140a5c142 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/a2a5b3d8c42da5135483a6f5db9b3c1ba24fe87a | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/ffd3eee8882745db9d4ac8643287cf86bb186a17 | ORPH
  sparc64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/80be491303580321fee24725c8e801d0c7574a33 | ORPH
  powerpc    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e451f8aa89519ad40b544a97bbff2bfadcf6994a | ORPH
   x86_64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b19eaf52ae848fd534e30ca19a5d81f5b5af6845 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/1750366ba3190dd3f3a1bc8c67c77728d88f00e6 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/6ae863a730feb8c3976cec3417e5f315de7353d1 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/731b1df79b493e706b8ecf6a6aac9f6b093dd7da | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bb6d2d82b8e0538edb559cc26b530f1ca54ce39c | ORPH
    arc      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3f5473198cdddaf74a77751be80f350451fbf00e | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/767c50ca879a68edc0d99d95d0200c92449927df | ORPH
   sparc     |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/24acdbfd271691f086e33d58284eebcc78752ca9 | ORPH
  mips64el   |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/f69ab9ded42aba576eb9758140c4fe2ce1af2827 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/86f806bb8185fa8cbacf9ee2ea4c3a0c8f794b21 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/74e9889df4815a61d87952e46004de7d9d41a2e9 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/31198f9689ce901717671d877bbfc605154f8625 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/bd091d4362544ecd0877ca688503d2e974eab328 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/d8c5564b24ff5b646cdd786d07b3a45ce5fa01ea | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/17bd1d1af4da1a664327f085e8ab74c872c91c04 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/b98572040813f61dc56d59101fae54b27a078ef1 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/f9d89867e78911c2d3ec6a080f5eab21975758aa | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/b7a56b152e627664ce72e8db24796ac152acc28e | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/dc0c99b2f444ea822febb4dfa410cc996e702fc2 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/92c752c80769b960ced4798bc52bcb5d0b19b4bc | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/54e48005819efa31140e3f979bc25fa337427702 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/1a485c9d39736996c5050303f09d4d33f96e165c | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/b95b71316ffa4ba9f299d83701689a242112ad17 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/61324aecfe8ba31c2fea19916395fb5a1222ffd8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/cb029a7b73eed1c361436587e453265ce89405a1 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/28be9c1cf581f74b775f0425edc31848c977cb58 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/f7fa86623e86e09f36cedfe6f88dbc41298b5807 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7834706ac8ab66e805385119b3632823774faf29 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/72b673f7995c785c6c867dcfb19ae7eff7082c05 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7eb48f3a25eea7c83a96ca8c36b14bfac425018c |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/d3547455ce475dad5c92489e8e7e06c19cda8248 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/3d6fd5c8fc8705608a2b6e76ba2a73c923c5e19a |     
  aarch64    |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/e3246ab08b0271ef10035550e239e964f6a6977f |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/cc8f9f5877d1f5e4c252cc7a68f46ba2ae986065 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/fc99084bc627ee499f870ffaf3518cee207f9809 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/425777a2d0f74581db25c7f3263a832a4df0d33c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e47149fcde22cbc819ddb412d5b5a9d46af2f2c2 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1694d42c8078bcfaa530a0c73adda9900e733685 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/7254c0fcadb4e0de802f13434439459d88119584 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ed07341cbe651cb0210a27e94e235ffe97f9abe0 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0cfdf4e2639f6ee11e03d355880d882e78c74d85 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6aac20601c5a0e1ea69e1861b611a4b16baff159 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0e8cfd263ec7711b796f91c5e87bd10cace246e9 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/1ac18ab7850e6972fed22e92ae17df5e50ca10c1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e14781db79033789b1da374cca143c182226c395 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c878ca8110a5031a074c69ba39b0746ed5e826c0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/27e2b68f2b470029319d23f71fb2cc786bb6bef2 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f88742ee21d4127bb7084ec6783053c362716ff1 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/662bc5c2aeecb1a54b3822d4adbb7859f150c48d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/06326ab2450d2a727e0906603ed97fdbf0443e0b |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/610fa7d2960267920fdd4f21758ce3cdd204adbf |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/17a068071d8f54a58d97527dc9297788a732c94c |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/0c11d16d70135ab74ea89bc353a088ae97e29c0e |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/090f39d6df2acfc97a4618cc3c42060598d59484 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/872683775769df61da9a35c996e75a0481d82f7b |     
   x86_64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3ce731bc114cb85d9fb444ebc8874e5e28594dfa |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/85ae6196e70db6d1671446cfdf87851112636823 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/3f54a43af9e24c70bd60c326fb165445ed6032ce |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1c62784678b924cae7ada60a6bb5ff6479c79b48 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/c06a38252b899eb0296490693a98d86e8234240b |     
    i686     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2f7f2626db07bc9fa7e01e08318184d688c4e80b |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/02f29424ce827b2a46c3f2e378aeb3fc1fea7258 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ec2519aba3e00985471dc9006262eb039acb514a |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/70fe6b749e1539dbc06e8a8f12a5b50749ee46bd |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/20cfbc1b7cd91056619fb3e0d61f404027ab469b |     
  riscv64    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f9546099d379f20de99f57d91cc99914a972b0f3 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/44c43e5c37c29bbb923cc6e61e70f3c604fc9631 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/bebe92bcbaabe45003fa5153d0e2cd37a7ca8b7c |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/88922360429d2154dbbee66311edeb90e74592cf |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6998c67075ace2ed086f5b182236904c2cec0929 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/8438ed5f88cb4a170bfad0bf6fb4bf793933618c |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/340c93d20ac1f178e54f4f712e2d3c4e220d6b69 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9e470f97f55129b61ab5054d7e1ee674db81e450 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/776f1d261df859a8ac55eed86876c1193e4eaa0c |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a43ce845bd991ab34507bc4dc6bee282900f4ad6 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6682db27a45639ae86994a4606d78c4a58564227 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/71a168f16148a8a6650a6d02b2caa26e64c192c3 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4594f1a5fa623274de242c56dc774018fc165b05 |     
microblazeel |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/b091f8f22dea973ea23ab80aa9f5b912a4b52cbd |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4fa3f7a75705626c87f1598db59f15c87b3a0e95 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/2c8df050208a2f882093aa7eae4b2caf3bf96798 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/e7240ecce5699ad3e0139d7c6e88a68c158337c2 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/6baff9f9ec93213cc036cbb85d7434247ad732f1 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4ca95e213382918e955e845d25034ee461cb9f41 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ddcd476bd7db0e6dc64685c2443120de13d0d0b2 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/1cd2508130d55f483dc353b1f51cd554d80c6aa0 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/efff20775ac2b6c91c37e041f5a44e7df4365077 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4cba3e9f9fbe1f33ad0544de34c8788aa7bebd5f |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/ab981dd69ce54e666b4e414825263ab5116741f3 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9821da1f357916638c6f361df89e1c95aca2712d |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f01f58edec4a0a2c1fb2704ecbb4c4db5e8f1bb0 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/a3884dbae67c88d99b125a6d2465c9f957599928 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/70f2c70fa3696158d435b625015b8383dc60bf48 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/68939866b814ad66a852825653033e9c77198090 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/5ec4f64b38c73c86670fed2a929f6828763aaf95 |     
    i686     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/59bb2988df8d7660ab7bc35caed3bac57b97147e |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/9855dd3b5a9095638801b8defec962a2c6caa008 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/b7c76837f9405c97a1d67ab17fc3c25980e2993b |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/db6e8902459d33bbb446763ace4279353477637d |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4b1057712058378fa7b6b361969e871e493b337c |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/b6b501c8a8cecb361bd7dd228d059d74a2bf2b28 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/73176d5e61dbe0fd735180aa6733a8b989dcc825 |     
    i586     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/4db7319a8833523f1f8dcaf0d32d7635f3f80f17 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/469d6467f8314e9de62116d6d5aa04789c44fd33 |     
  powerpc    |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/d110db48315c60e1107df79e8a5194c1bea95302 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/679360a78f28f3b4d321a2cd7e19f618237390e8 |     
    m68k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/85921dc2083fc8538fffb302cc7e70ac48962791 |     
  mips64el   |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/7893b5ae0368b3ffe1ae5e733232f28ec4ce46a3 |     
    arm      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/f88e1d9011a172750e5c03201b8b138e025c9bbb |     
    arc      |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/0eb279e533fe8624277f9db2b07b8276bff65eed |     
    or1k     |      optee-client-3.13.0       | NOK | http://autobuild.buildroot.net/results/b28864d7d9a50fba8303ef0bc0bdd359b8428257 |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/fdc9ed8e16a41ca8f49e6ba901105784713c6650 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/3801de6fb95ab8885c471b958a43a8c931aedc82 | ORPH
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/fda2b4fcd5e8e178bee1771fc43f22ecc1d97da8 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/2790dd1e9a459a86f0cf42d9f2183200115fbd1a |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/f8a342512ff5faffeb6c371727f12ba5e2a540eb |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/3f2f6e1c26b7ab100c481e8e6e217d1df4e1d197 |     
    arc      |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/45deb5e19680ba8dd09c484136dd6834a92e3edd |     
  riscv64    |      perl-dbd-mysql-4.046      | NOK | http://autobuild.buildroot.net/results/09eb895838ad56064493828cc40990ffc7b8bff5 |     
  aarch64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/ed37be354af18c17a8f325bab22dc9f23e461e4e |     
   nios2     | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/f878cb18c3473463f8013944fda5564d8a4f6b32 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d95e1705143b84d0479fd40e7180035b07c4f7d4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/67deb10d4357b9a0b41109c2e04fca1768ce57e6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/14d51a61a371e22e4e26fb237cd0957d9ddecf3e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8b90190e8e8f6ff3601c53cb42a799b0a66e7f7f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8ca5f446f128279be24534ded668b5960a1dce3b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5eb2eb857ae775020750fce787be799d0bc72a1b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9de0282f61a90dd35f24c5698a1fe9b210fcd865 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/84a79c8032e430092dab6676cab0ad93b115d59a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7e4b5ed143551d9e887b745fc585db2c3e082579 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dc91650b8d92be7160a72b20d399e4d028f0e04e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4b16a4fbaea839161c5962f6f4b59469ca800300 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/39c13ba917d0015b2bc9a243fa40640bc55e89f5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4a271dde9d563ebf567c2a907b0894fd7857e944 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5b83cfd366fa6fe56793faea9fa5fa210ff0be78 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d5260e0f3de3d7eb6d48f2a0825e49cd28eee6f4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/42c2d069dd43461e7d71b7a6b1ec792373d3477b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/573a4c622ef06773332e24b953a61872c9619bbb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/406347f96028120b70cadb84cb9b12214f77a4d3 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b05f7ecbcbf40fe00789e8d135ecd497268d4648 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1f91d73ea29da9d3241267061dafe1fab8beba5e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/30d56b14172bb9347b1970f9783967c995e5a916 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/60eadce562def403a60e82a54cad7c5a913bb648 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e9c0b93d163b76e644eb259536ba1d170c17ce65 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a59b254500cdf07560edfa39e21c2c735728ce6c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7696b8bd085f5d410e6226a0bbef3214e2716eee |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ca005ad7bba3845eb667dde2db33239dbabdd1bf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/868d37a89c8ff28717aabeec388791e1cf447e7d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/14bc43441d37b0805b8815f9bfe8d187e0f0b152 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/28ba2c420312bfc681fdf34cf390ccc7d4a831fb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9bcdc0cf0d5880f374ba92865b02d84617afb4d6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9d84e4e1a201bd6289dcb2916824c79bd75863a0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/35d4afb6862a072282625e196b2ad40656ba14aa |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/742b1418a1f01e5a8bb99d9f95c3ab452ee4f5d8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/29763c6e338ae4fc4c83b036eb4387359a3f9a25 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a7f628de3bbee6e7b69b27b17e2cc752e876ef78 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9ba2dc31b801436dd2195b3a913ad94ebd817f0d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/84101c15f51471b2b72e1e8a0ab09326a31a81c4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7abc38f8244f2349fae6b72bd3f92a81d46ef92c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c7f9288995705d5034af9fb71a889f67fe1379fc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b1c48a71979a7a55fa9a41c4b4dfd22afdbc5fcf |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8d283f01cb5b4c86bd461ec6cdef4d7aa2e7e8c9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f00845bd1f95e71890d06d587fdc5007869c236e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f73f07507f35a66292ed30e49352eeca506dc981 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3324c68295904d20d1eea5c2a4d348c896dc11ce |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/025cda21d6d41449cbc357f92dd9a189fd257e86 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1e698ce39c499f07c6578170e623f0649bf76582 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1eda6115e416b708c501c51cac3b683f1192f6e2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c0abc69fc09f62c4b1aa262c5c8593186e500ff7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/01f5c695c9d2dc0677dafdc55b64630b97f73528 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b18f51ddabe86194051a0f8a512ee8642dd45f0b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6154dfc266a381ec2e7c98e91f24e126bf97147c |     
 powerpc64   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4c92e6896177b2a526b6e24c422b7248ec5b81ed | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/924db78926da8272019690f3a0129a04bd56ae3d | ORPH
powerpc64le  |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6a9040d36fb41936db523b52614c6441d3a60822 | ORPH
microblazeel |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c4bca406737b311b0888964f9950beecd2b63c4a | ORPH
    i586     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/07c931562accde41da916954c4971b94f3325c57 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a9199d4aab154ba05ff40431c9a1d59755fa3368 | ORPH
powerpc64le  |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/83474d4870247cf03e4040d46a17a7ce9f86e5a8 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b20d045d5f5c63c4a377fbd6507cc5b4646b46fe | ORPH
    m68k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/1a94f8eea5b4842c0b674a43a409ea0bb871951e | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/154d96a92619f03ea6d0760279d1ceb80821ab35 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/a860cfc721e2260900fe653d3e2b761447681ed3 | ORPH
    m68k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/941e4c12e1b5a449380000707c1d35c7cecb42f3 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/09f0419f52fe6c15eefcd6983ed91e2d2bbf9091 | ORPH
    i686     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/3b5b4bdd118950a99370c38edae5bd3bcd5c62e4 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/68936843d8745a6349303b184a43f8551ed48c1a | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/2498aac22ff56730d0d7b46d0b0f78975a62694f | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/29f10da335ea34218143bc13b0f3c9a9f8ee816b | ORPH
microblazeel |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/39955501b757e1f75b92aa7bb7d47bd2cd6ced34 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6df9f772971127ff03600e89f9a7f0a877e861a7 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7d64a1cca3905abe3d0307a963cfa8875cf898fc | ORPH
powerpc64le  |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6da87ec65d03fcd33ce91caedfda5f43544b0946 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/bd8a986268902a675261d9b8fbc706982e0b5777 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/180e792d8d91bddda36308c48bded540406bc384 | ORPH
    m68k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/e2b3b90b44945b41e458aaa54da21bfc4e02be85 | ORPH
    m68k     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f0f137fd1b2d5a53f1be8c27bcec2ad3fadbcc63 | ORPH
  mips64el   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/1451c65280cf0ec9bba1e88eaec74df741e14187 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c4b3ffcf6a745feddaa5bbbcbcd436a81f600c5d | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/46d71f94b432e1c5a8539dc2fc54ff51b4823095 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/981934bb27bfb6be69c5fd95dd726e5c788df0a7 | ORPH
    i586     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ba15413cefc0df1d22b254b9bb60f14625659556 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/725d2829a209aab89d81f0679a246949fdefc56d | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/aab1dafae0fd30549be409f58b37dfa1726a8a99 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/abd98649b6e7051101642bdd1342108bf83d992c | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/8ad459d4f8305d71529c2a957d8311acca983951 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/6429d24f9aaee8fc39780785d5ef3ae70ead5bf5 | ORPH
  mips64el   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f3a1f4e085df1e362c25d85f0cf0b5fa95780b7d | ORPH
powerpc64le  |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7b35c255bb4a809f3c61b6cf755935b931d3bc43 | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/059dbbfafb3e2db2f59a0d393e575a66843a8828 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f57f1565ae53d31c5c1063c4d30a4f173beb976a | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/002ce9655f2a9709cac1e6c9feca73900210f955 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4f8c4716c1c02338558fcab63bc6a8e14d8e0a46 | ORPH
   nios2     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/5395b1f2cdc59cec5b6cdc553d978332c1cdebcd | ORPH
   sparc     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c8af666e13817173a3256ae5c615e65ba5e282d4 | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/b597d271280324605ed1a543b486c1bad87c139e | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/8099d98871a7ed86b3d25828655bcf8ae81ba9c7 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/cb502aa51cd366547f63fb84692eb9e1861413ba | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c447890786768c8afe2a159e639cc621031ac69e | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/083eca16e47385065a474efca1f61ff641eac666 | ORPH
   mipsel    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/5192254cf5d1098c071012d4b8ca9d0943208380 | ORPH
  sparc64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0737e27a7d51f2cd219b0ba27373f4cdadcee6e2 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/13ea12eb66808253980b1dc8f79a0bfcd46e9ca7 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0df209d2154d16bbef1eb1a089d64ae54fd508ec | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/4cbcba0875d9345743838324cb6a94f9a275d8ea | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/640acf3f31160b3bbe5bca3c9f7fe58b6316bf95 | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c91ae869962bcceed31815995768061056dcd0f4 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/28546b6173743f92ee493b73746d33aac135c438 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c4c4fe00ce1ca7fd2548d920839d1d989a74a6cb | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/df318259e36de456259c4793f283559d85b72815 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/45a5eb546e5481df9359823c1ae27c708382b04f | ORPH
   nios2     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/c1caa20a9d28d52c7c462b3af35e5f51b5ec7a68 | ORPH
    arc      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7f832913c3b6b07e683dba2355f0616f486fe304 | ORPH
   nios2     |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/d53f40609ab2b99118c0e195bcf935622eb8186c | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/f66c72349ae69dff7d2c22b34edd89a043241935 | ORPH
  powerpc    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/7ee1104d5f5c4ec987d0bb1763ca01d1caf27cc3 | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/0eaa44b3754b4a4832eb2677cacd6fab36b7a3f2 | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/cbc52e6c4270ad7578f86387c29770484f6e2840 | ORPH
   xtensa    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/501837b48861315cda489136fc02a8cdf139a666 | ORPH
  mips64el   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ac6dd1dcee952259c7aec50643b36d3f75373f14 | ORPH
  aarch64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/92c4acd512fd5f8076e3529dfa8859fd889b7efa | ORPH
   x86_64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/94e1b05ed2130a2055e3c608fda9973b6c6c0f0d | ORPH
  riscv64    |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/92f49e783559a17f1687970b52a09057ce40f7e8 | ORPH
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/ac918cf0050c6e9a53c740aef9800850ebee3dca | ORPH
 powerpc64   |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/67c24056f31a5387bd2a3465b77c65f10253a02f | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/1e497adef5b41da9a7fa72a7f12bea6a8dd8e117 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/633f896ca66a24c5598163d77f173a518dd4e273 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/3efc31cca2f410e0ac424eab560fd14ab6f8b2b0 |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/dcb70cc17f976a6f0430fca07a0a4c6adf943f5a |     
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/7c7d48658fe5ec667c7f8bc6d427a5552beffde7 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/5cc1d2ee776dba340b6eec2b44b1acfe7ac14a02 |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/2c598824096f1eab190e7196a14406a8c80041f9 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/2c57db65e1bfc1eb85c655b8190a80187bb8b782 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4462091063835817111d3035b7a82611810d9fa9 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/797766267217d45d9dd86e44f6158c2fd4a0b815 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/a910e70a3f416ad06bfebdffe418d6b3d3172e72 |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/8e45bfbcd224819af347a7ec62011fb5ba2161e2 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/f44681eb84abae946c79414e9fe625c462e2efaf |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/9fa5ed5477ae3106cce7843afe2451555712951a |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/41f5091357aea23127f628bd0e2954864e56957f |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/9f3035e41683a45a9988b5587b0754896bbad903 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/73af2dacf94086e0d378194fdf5c4c1f93f7d0ff |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b8608ff79e647a4e189d6a3067b668977fe0edec |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/2913b8b3b66415075327256d46cbf57e38dd22cd |     
  riscv64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/ab691e92bae61e8cef75e3abb0c2e37095e05df3 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4ed7ec8ed0a6210533a3ee89b53b7bead0f4fabc |     
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4d725a0f6a94c918c6db135e7c3cba95c2556bd3 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b3964fd1fcaa79810f9255ddd3156b9fdae6cb21 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/899f1b1f281218fc32c8d9104dd1ad7a1e04a96f |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/1c97e3cab01b548fb5338a714d9d2839d14a5f92 |     
  aarch64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/75a88e491ad3c6528d52cc18589bb8f122f8d0c9 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/d217b2ad1ac3f2757021220650e88cb58cd75e0e |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/76c05fa4cb0de7118a4e801c9dc29eb0d181d20d |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/be3c5abf6d6dd8eaef8056ab264b13d14d0c2a13 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/bca0308c8a2317d787653161430d47471850a4e6 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/edf203d61e741aa9bcde543e952db343535e4450 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/4bde7851b77e4e71cbd83c97e4a55d7eccc1dac5 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/46d7a6d8293a0fd2323f7cfe2e49398107c4505a |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/5dbdbe8d45be00562825bd9df1d6de663e33e8e3 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/303641135b52ba13a8258fce46a8c048e8764874 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/de00507a8106cffc31236ec6494dbdff44509615 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9d7a1e13ed896be84a8e005b733fe9deb71ec2fb |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/bb63c950522df9660bda15bdac19ee18e1d171d6 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/2b8ad644f51327e6d3073510caf4265732f19cf4 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0b08e0fc861497d0dbb0413d3dbe0aef3d1b5103 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/13a0309272fe2f68847cb628c8b73b8c5a1eedb8 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/2725ce06d493cf69647a095f6401a33e95f50fdd |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/e843a9ed8a32cfe4953d12c3ca2b0ac66e3a498d |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/3994949184c7f32f0b04a39c74dccd58ff143b54 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/da687e8685984cfebc5d16f756ae64b6b46b2228 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b7811f064c9270ce74029f3cbb7568e33663c5ff |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/44b9ba44b77b79b28d61f6f070c351f4f2abb099 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/8938577c6fbb1210f08e1bcbbd28202107fd17d1 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/97494c9638e6c7b50af3a0073e560fde1b88dd01 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/1645cedc4ab1587fb32ae6af66e981031a31f04c |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/39d8703cd877656e95c5a2f6bc713ad412484d03 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/80a649be1146168f4318377733ff4ccd85e508e9 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a0caeffe9a7a1cdf0eeb93ee4d30a4d1172a87bd |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0a9d4954db76a643a188c6d002c8d5495e2e540f |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/eae6b13395e6456bbc68b70c03370fa421183aef |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/0858e2254d1ab59aa79e6a6748b1f6075dd5a878 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/61399f3771eaf8757ff87bfff20194c2db42d694 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4a51e90a857212b441aea33cc3c2ee4963c845b6 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/55f30013572d06b00c975f5a9afcf2c756021055 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/00ace25b06a6264415e5df9639520c48ab700568 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/6c0937b8f0bee8b374174965a7c35fb3f9a02fbc |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f06c914b7ebbed48572585d762e8f9e5d307a377 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c9291e4205daed9db2aa81e94d7de6bacd846491 |     
    arm      |     qt5declarative-5.15.2      | NOK | http://autobuild.buildroot.net/results/0199408e710be1d7a8356e758df39699e52cbf65 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ad1336652f9ec596747433f811c89d27776828fb |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2ed2f31a14d83a5a950ffc49e436f405d31eaff6 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2e94b6b6999623dc3f05234132f06c7843ec73c1 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/f8b91a0c937f68c0a44abcab6a338a4e81c3adb7 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/3e8eb745ef9df71f944d3e2dd5685a35d8b6f29b |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/a03d1f0171e7d3066587ffd320e4e96698ef31dd |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e8361ffe873c4f5a63a7e4489475ffb8ce128209 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2852cf90aba081cc07e5a74c99e1d01537908e95 |     
  aarch64    |         qt5svg-5.15.2          | NOK | http://autobuild.buildroot.net/results/d9c65cb9b249cc2952ad121576136823e9f4986b |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/84f62448d1bcd496816713799d88b9ad3081da60 |     
  aarch64    |      qt5webengine-5.15.2       | NOK | http://autobuild.buildroot.net/results/140b78c337872887b1d3b2e62df5acd19274ccec |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/1a4100709dd4ffbe09e1a197e7428fad808bae72 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/0973ac787b541a169e10fbc2f7056f21cf3d82ef |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9652d0f64c68eac290693167f3d9de07794c669a |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7130e383bedf91858248618d26241fe1be3a4b89 |     
    i586     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/54ca8623a98937a741085a531ee67ff9181b0370 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d3871ff0267179921595fc7eaf937095acd194ed |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3fe5f5d37e2e5ee263b82b31232ddd365b786f71 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/85a3360126817eed33f59546588936b4f4bf6013 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/f963b60f910b9d7abafa85a1d045cd5da33dca40 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6891d4854b5f674864fe11be538987d7cf517940 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8c44124cdf56321fec6734f8d946ed6de7b0aff4 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/062c225729ac48803b78f70e56f2720ea4836ba5 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/56419bf2403a977b1fe4cfdd82769d5f598bf3d3 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8e7de3c323e862dccca7c4fd1074687648e2f692 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5910bb4c54e770318c1faeb03f86ca362bd1290f |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a586f41f31b273497744405b153ffe7ca48ffd4b |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9d75f4614ebdb4b109b47f0b7f9a55f7d5e8dbc2 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dd2b95177a6047c3596b6c7b92a9656710b9603e |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bc66d8690ec407f32119746f027301786993dea1 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a853caa69a3d52aa2632e791008963d37f989bba |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1b630f9ed3f4072ace5d8e98f3cee21639126ae1 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5556efd9a69764e2a567f16492ada92fee5497e1 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7d6a1b657617319e319287e2f854cb01d20fb8e5 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/651a43215f3652d089b0fc5dde9ac3a073b8c0b8 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/394170a42d9ff4d227386a81412af32a10bee15c |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3d18fec45a0c15bc5f84e916a41d077454df39f8 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7f509c11b1f5c05cdd4d5d21727b7b82327858cd |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2f8fb703d1aac958b3aa565ccd980c9fe42fb35b |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e863efe9ba7778aa931ac1b6313aca21ee5211b0 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/40fc9e0229b2db34152057d7ea94e2a6322c17db |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ec57697cb50ce55030a8a953fb808b78f3b9aad8 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/60c699d0c0458b4b461d44065ef2ad8ef4b8e503 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8b65abfa3ccd87eebaacd552bb9ad927865f1ca5 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/591aa15dbc942c34f2eb9ad37f087dba4b783212 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bc7e8c2de22e18e5112cc862fd42fe8b7677a8d8 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7bd28922ad26ecb439a9168542818e34f6ef841f |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4c8727c486a1f904cbf49d323201853732c9c8ea |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/949ebc2ed5096e293175510de395948a259667f4 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/cf271f9fa9f80f19a4a8ad5d4f48c957cbb16cf2 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/adf9137b91af28e6695a7a1fdcec1f84f4982790 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ac7592a9913f4a5c7f688c27d9cb459c6816d717 |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/382c9982dc5176b70fb52c4759a9a6ff92a57271 |     
    i586     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e41cd957e4b90ebe8e6be2ff7d291cf40851fa2e |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/445b11cb5ace49c3b0f38481715c38a91598c52c |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b2aa0369f21c38ca5f2e63d0d571fdebb662dfb6 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/31236dbb1e27590913b5533a3cf47d7db2535107 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/fe87f92bfaa2686e9595f7492449985879bb8f9a |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a8af2975ed1cfb32634f2228cfcc2814b3b81392 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b618e256365079434a94213a26c206e3cb9caa41 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d02d9e0582edef3450f7333c5b439a23e1d406ea |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/19e29f7abe1511d4248cc64b7b598acbd4e9c6a7 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e06cd43dbf4b4a7a3abb81efbfc01172f24150af |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/94d8adab9fd0083e24d5112ae7daa56e7944793b |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/838266bef1deec560e336d03a64d64fa1990c344 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/10824080ae870a83863b458ac7553c273f2eb92f |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b7da1a3f3fdd9d7264a00cf709aa9575c9b4bf02 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/14f20b0131c82b5e9312d75ceba36cdff571e5a0 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b57277329d1627f0716d311efd44e7fb959cc2a1 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6d9f272922906bfd095c5a24b6f90d6d3f080dc6 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b3e243db92269f6d8c78c608202f19a957fb9200 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1d1df601313be7adb6a55a153f624c90c8d3e491 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4cd117099b0cb5dfa59da40c01af2930ad14d276 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/35a3d021890426690069ec6c047848375de86b4c |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e0f6ceba55241ae58bfdc11a7452522ca3662a92 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b32da7e5dfa1843ca4580cd4b4338d648d880f00 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/68bd81d111572b2d33b0030b189d2e58a8207af8 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/184a9e2cbcf5b0e170546c21474939d9473baf23 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a0185c0c16dda67a375b522f15dd90e1c5846756 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3fab781df671ee4d6641536a941c8882c7c4198a |     
    or1k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9d87e7d5c019a37333019f6f41a12e70b1da1824 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b2e19a9a97ed36c643b595e9264dfcb7942d6d9b |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dae7fe9590bc2811bab22bf096616b88dabd09f2 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/200e439ee989da97d7d44dc61c673a5d1a464a76 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/44520c3546c0896ea0912bab645cc7ed1bcdf42a |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2082081847ca15d815f16105b3cdef02305daf39 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b423df73fe8e11fa28f9e744d4e5bcc5b7ee0974 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2c29bce76af1d6dc8a4f5477e682ae36005cb485 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c7a8d7e52d2b3615319a28c0ff50d0de90b5470f |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3008f741c0d9fa055bfbe3877514e9c12b0c4804 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b67e7dc2f78b6203dedd39716405179cae3ff384 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a1d43942193dcde86be92874f8a00ee6a2a36318 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4ca54cde7cc5e2807d9f264f1059bcccb7698719 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1b23f6b9eeba1d836907581ac43ab1144237837a |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a89c0c231b5a6f1475856068e6162511ceb70aa1 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/63abb7070c2ccd0cc550b35d73ba00e82bf361c7 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9777ac173aadb3319098b6b3275a341012c5880b |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/72154f9bf5624adf2c452d2c5f0c022636dcc027 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d0adef82f2ebba860d8f192c281e7a549317c613 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dd0b7dc998dab8c676be6ecdf993a6352c1945e2 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/21d0496412cd3b57a232c63e90b333deb44faa32 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4732874436550a77db8877e2ed60423c4d8e9140 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/dee2f96697d013b6d693460a8756b24f087cfc93 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/10f1a8dae5185672790f36e20ac438660f9595b1 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0999a9a1b580154f3a33e1cfb0454a744d6e98c9 |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/3f62424e6a07d06244473503aec7878361745a3a |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8e60b05717230cd159632724d18919879d13ec5f |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/da6a6aea78a64a84b6693f508dc2d7d4963af1f9 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/041aaed9fbe25d296b4309bae7f04ac3a3643547 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d44d6689d4683ca3024c2de6f1a0b47bd803f93b |     
   sparc     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/60048830374e5776ce956d1d5943d90fd437d31a |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5cfd4ed8ad903468d9c4580638e85663fa5c0fe4 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d9b2a6a2f05c2ebb9b363fc34e99d45ed9c9319b |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a48405bd679cea818262537022daa79cbe7b8b32 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a2ea866b1eb0ba8fbd93472af3c76847c4ba879e |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/08920d64342ff015d7427595bc1b19cb82503a7d |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/70ed7f0c01eb1245ebfb5ca56e6e553acc729bb7 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/34ee2e09ebc17161bd8688f0c5eded2b3bcb80ab |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5f6da7f60d1c4fd5107d2f88d9dba697685753d4 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6fbb78cd2f358dc428949481f84d5506cc9d924d |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/56d952684c9a7789b3aa25ca1da0cb15df27c802 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a9ae317495be7cb93c24dee0a9b6ae17c7b28b07 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/bac65366065d332e250a12f15523f071ce7ee51c |     
    i586     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2b4faeeef71b6e2ccbf620b3da65de4fac91f870 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/80b277da21213f47ac27354b2e87543cdc7dab0d |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/5bca0aa618ee13f6123a5b145b8794d55cbb9229 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/9b9da21bee7dd86a93d873521c19512d2be48b0c |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/0267c7b09cfce86755cb3eae80a4924c54c0e038 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/3c436bc72c68982e24f3fbed78183814934ba12a |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6dc1d0674cd819d1ca7c00df4fa9f5a863c28b21 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/2b8bd10afe601eddb88ded0b2540788dee0a6a1a |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/29502e5061b9f0216fa2e693ae716d65eee5e12c |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/dd1afd9e956498c223d6598ec790857d45870c8e |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/1261f2aba11d08246bbe3d645a1d4fd69b5e4f53 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/e82b9fcf05257b6916724e93549c9c093b2b6dfa |     
    i586     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8920c47f51d8edc1ea5ab40079b58507b592cfb8 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8545890970c77587723c1b21d50c113ac08eeed4 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/dd8b6f98c8d5222c41fcfbe21abe0db06c276aea |     
    i686     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9fca3d3cb1aefc7be408c51dab780c3525b28aa8 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/cd7c51310d767ab2455b2f8a4f834d6240318376 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/472c7792b60d8d420d4bcdfcd816e4e2923402a6 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/0c87c72a933798e573ceb5971514e54d5ab636f7 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/c54b55a2b3f3912da7f12c0f4fbf0b1fef963341 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/fe62331aa5c682866499cfa3432e4c1a265131b0 |     
   x86_64    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/306fbe442d87a142664329ae0949443e7551914c |     
    arm      |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/ab7e77afde5c9ffadfc389fa1a84d87ea63e7f09 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/9cb83b73431b19f17348d44a1c7c394864edc439 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/f3c24303fcb9645bfb22858ab313299a489a56eb |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/82f2c2708b4f35bf0786f2fd72c6798cc3e3c297 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/e7ae1de990f0de2e6972ec338973fad40436d130 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/82a54e925f0e889c6ff942069ebe480c3eaaa7d6 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/5e49c63d0dbe1afaf32b9a16b8c13033ba21b7b8 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/8d04c171e89be3966c311a0d0dbec1c87d9075a4 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/985c8dc963ad394f21c9b4e2a2477ca600a0842a |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/10b3ff81ab108f39ac980b79eb7ecb31270a7a0c |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/bd07c4102937af7fb0dc9ea0ba7b3e40f3b10848 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/8b01c13f0bfc4ca0b3d7c99b285c914849389147 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/519ad3830eef2d2b2114e9432b676b2c5d239d6c |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/6c495e89c0471061643bb18fc365bc9ed50d0f02 |     
  powerpc    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/5ae7b1ad4862abd0dbabc529cb5c15110b54f5fd |     
microblazeel |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/c9256c68f1eff56ddab89df742130ee6fd1014b7 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/d52eb77bceae8ac58a4fc8afa25694bcd4cafe99 |     
  powerpc    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/278aa2169b94b3b753c25cb8a870d6412b97f2d4 |     
   xtensa    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/ea7ecc1cd6286a5dbc6c037fca950d33e9fc7d16 |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/193a305ac52fa43d830246b512f358fe77345d96 |     
   xtensa    |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/b9c76c6a164faecc3a6731656802aed2e0292d6e |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/e4b937c7421024bfcc4fbfa1a90f016134d3307f |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/77ad004da8ada3d730e7dfaa75f2d8bf0d6dbc02 |     
microblazeel |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/6b3b6216c8eab7932b44c876e642e4dc552c905c |     
    arm      |        swupdate-2021.04        | NOK | http://autobuild.buildroot.net/results/4b5777dad83a45acf0973aaf792d9c4695ac4ffb |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/91cbe93c5a89582c05547645a4d4b5f994e4d456 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/a35042df137ecc30566718ee7b093ea55faeb567 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/b847d2af5cbc02f1497587dc6c9f22062ffc75d0 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/5fcfe09de58ac94254933f211357466f06adefbc | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/11cacca6aa813475e5c67a9d37608cbcfd49088a | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/500a29a67f4c0b8a697ff2598112ae28966945a2 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/7584f48963184514e5673ba110bd2d06ae34c768 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/d1e6ee6e74a30f4a087026b70b029d883b4caeeb | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/f5c733d306d6bc6b28ba6ade5b00b683a83329f7 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/fb45e1fe7463bf5160c35a116bbf97fca0cb413e | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/cf3f0c596c928275433222e8fa6132e443b24808 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/9ebb907852bc5950a286be5e47110c0d3293af2b | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/c49cf2ec0e28b7e92267b7b199eaeec642d07c6c | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/d8d4887ef57c4b27155b4d5cb8bb761639301367 | ORPH
microblazeel |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/5f66e441e5da60f75277eb5578eacc1f4c797c56 | ORPH
microblazeel |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/958c588726488c8dd2e1bc30cb05395f0b28b960 | ORPH
microblazeel |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/6397993e01ada29cc063d0f6f179a09e073d4161 | ORPH
  powerpc    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/f090e1abbc75714cf69da29bb03460e8b356d769 | ORPH
microblazeel |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/a9adce504123cf69631ecd00cfae6e911de5c362 | ORPH
  riscv64    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/63d0d63af5b1802a3490809a7ede4958ee191a9c | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/8f91c8c3e7a0d8aff5e937f7b09b61ebab169b11 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ef4330734804146ed937e4f94a4b75b14dd1feda | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b25735eff695f43ae1590ba43d4303f5adcbe356 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/27a6fb34b3dac0552c544bf74cbe9279c133a19a | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/eac7e669c2857594e9fe622c4ea93deaeac1dad6 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/17dd9ef840e1f92aa9d7d1c43e15c34de0331201 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/16c062bca19beff4097ef79a6aefe4dfc8f793c9 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e7dc157fc483dcf49063097f399aa7d57b4a41de | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c781298fe4c37d247b5bd298d0e59d5ea13edc71 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/155d4bb67cc4af0637b6ad669a24e0043faaf77c | ORPH
    sh4      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ee8472f5fbff2f53ce5ece1dd03d13c3b0d1fe4b | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ba1c9363d30157c60a83678a19dc005b1fce1b90 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ff7d9ca3ee2180a0cc3de9d7f561b59b35eecd72 | ORPH
    sh4      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/675178053ec4d4d2f6015b46ed2cb1bfe888785f | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/025f85d17aa28807f054043f45e3d79616f0ea8f | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e2bbc6580735fd4d4448fa51dd3fe94f027f7e6e | ORPH
    or1k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/1e8e4f0e6ba6d1c84821bd8df499b12155f149bb | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/edbd361265eb193946510af7f7854d32f4711a8c | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b10acbc7f00bc6d17c02202423db0514fced07ce | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b08ec0de0d459d8bad528dad1591bee2ccbeea00 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b547998a83908803a181566eb9c235825d05fc7d | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3aa58411514735f9a578dcadaa7126d20a3b79b5 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/0058a701391befb9a2d0422b48472b5959a1691d | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/a258ff1b3a9680814e5187b3b47c0bc68d88aa57 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/127eade0f3bce7935e87d320ffa4f6e617df3b04 | ORPH
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/a5b652959d3e2f9b665b26405f76241d3b134e7b | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/9bc941cdc394b8ec6628390e5d6c92700dde3d82 | ORPH
    or1k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2100cd3f8df5eb9915da0937b7fc3b3f5187fdde | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/198a43c30a91659ad365f92b6a11aa0de5b0ca2f | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/161cecf4fa4c5221f2d0952f434ac669be16ee8c | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ff6a424af8647583fa8b8db6e814ddf61ff0bebc | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/74ebff34da0f03d77245abf701f2ca9b2286d3e1 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/2563ebf6b81425ff247f17b49f777a1b86f3d3fe | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/5dfa5a14a3ffc7c95cc4286105311daab3811a59 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f70f743fd5ee10ba80b228080f29f903aa59c4a3 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/27687dfad747245a98407944263e61b3ad8b54ba | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6b6d52acca874008c5ae954a7108099a9cb80c16 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e477e08618a01ea752890306e7b5f4c40d6c5ef6 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/94e339413e96510239c8d84e4c309c0cf348e13f | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/18b76fdcee87b1e81d748a3c7c6bb9056462fbc3 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/552bb45ab09cc5442b210e18ac3d52beaae2f85d | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/c0800084a9abe0193111cccd14e86fb625c59e12 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/34d40bbbc5e1c74902917d53997d706ae8276dd4 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d393be3680b1aa16d23abae618af2fd3b65dd5f0 | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3b0e029e40f233645b5baa784d9a8e5e99019fa3 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/bc528a2ee7e6a50388cf17556576bf91cd8dd018 | ORPH
    or1k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/4c832785bce2420ace85e3cfe2d56dd5a762a877 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e52db23a2e6a465d0f67f3e0bb88cd5374ee02c7 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f91950b1e5620844bb04a65252d0836da736965d | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/833b3826335d2cdba79033b71994d8a29255ff2d | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/47cf5189e477a3ef3fa25499eda8345a18609e9d | ORPH
    i686     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6234cb684ae96d5be65943c46f1e24ab5c182ed5 | ORPH
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/67da55d74185afca369296bb37eb79d2b894577a | ORPH
    i686     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3300ab8efb5acb35e5f2e140d64814a08059f073 | ORPH
   sparc     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d1da19b6e348b4ed90b57b7bf2e769b99df99c7b | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/9dc58e35dd24a38e4ae0d56c208320db5bc3087d | ORPH
  mips64el   |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/27e03a9635e702e354a6f9edafeeae06bc9a78ff | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/ae2be8e070c265b3157e6f3ad396c164318d3b5c | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/fb25073e6ef9950e33628d5aaaeaf901d1ccb064 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/71ece14b69830e92f2fe6b41b34953b87008bd90 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/73adf295e0476c178e1b5e7adfaae5e29a45cd4c | ORPH
   mipsel    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/4b00cd10838d6ee257d9ead9e82984747a3e77b2 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e97ce7cdde6a0ec0a5605e7533e565a023e196c1 | ORPH
  riscv64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b6b9f36a247a8242b9885a2168f16972c80c2a9f | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/27e2cab8b117d920a2b951f695e730fa3e938787 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/95ada0c2d9027e069d1c60a216f92e65a9f8ee67 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3acf23014dd1a399692e78fbd78a70bb219745a0 | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f1a7e9599be26d7c8a6a268e21c4732178eaa249 | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/f8924faea04bdddeeb09a496bf5f9ee9427f0824 | ORPH
    or1k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/5986eba2f9e248fc5b77c02f34175beaf3a72a13 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/251665c26d2d8422934751dae2e11384902411bb | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/be0a8d51af9efcd21f86a997b1836dc92d87d227 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/46506ef40fa2665c33c04e5e31fb04ce7961049e | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d59355f7902646e16e6f778f57c415767db73c25 | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/9605c3acf4f64134dcfdeee370f0de7bd79c9d34 | ORPH
    sh4      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/78c79c2e21a536a650a028a2fce5bd10b553c213 | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/9a13aaa0fbc4fc7c5e82321aa37d11b678684174 | ORPH
microblazeel |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/6eb89993b92aea2ad7a404aa2e025c06d13ac9ac | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/513b35c5d74878c5904cd072d04b0a2302f805a3 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/1e55ec1f1ba6fae58f9db4f54d90e6b9dd7d7acf | ORPH
   x86_64    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/af227d31b238bdd3c52e8f04f527ce05a9d016a6 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/d35ad6d8066a3ce54b03cd79bee35a5c325006ba | ORPH
    arc      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/3183d6edb1f33ebd95b37631c8ee43b34e7e722a | ORPH
    arm      |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/87ccda09af5c3da8a9f1e476ff35c2ea864b6680 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/552bdb204dd40244a480b427d4b68b7245bd1360 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/50d04a96253645377f3ef1242c46430d2b46846a | ORPH
    m68k     |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/db0d8058f4ac106f608dab4f801dffa3ffb65993 | ORPH
  powerpc    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/e839ad1a3c743cf61eda77d553b0cc0610e0c233 | ORPH
   xtensa    |        tpm2-tools-4.3.2        | NOK | http://autobuild.buildroot.net/results/b2fa4f92feb1ab12571954094fd829feadc13e1b | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/955619c96f6b6c3a32e359a5aa41040b3511265e |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/711e7bd541a082928625ad752a49dfd4ea9f7cc2 |     
  riscv64    |         uclibc-1.0.38          | NOK | http://autobuild.buildroot.net/results/5b6be3e33da4d9a292f52f7dbed7c07896382ffc |     
    arm      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/6d27c087547a9cf59d56b2f7e48b8aa713802e78 |     
    arc      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/f40de08235cfda917d145e49a688c97d70c05b92 |     
    arm      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/7f69ed267848d1b42c8f2b680f99116812f62589 |     
  riscv64    |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/0c9e6558cd72a281c22803ad1f7e844eac6d57b6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2e70f8ea8c42be6ccc415b47214120c5c7e48aea |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/77a4b94a16af837e1e8bf5691db02d7915f11fda |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/746b828f78343ae0c29845db1d9045a3ae5ea6dd |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e66165eaf57e62ac08c7c536493a662406e78274 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b83c13be65e596d719bff86b57d30d307a2d11ad |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5a72d0a728078baa84fb0541960fe045dce84b13 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/65bcda4ebb35437aa6d8365ead8605e64fc396db |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/78751310e08b1899f63a910be8b97a4396e66873 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/2dae878cae30fb4a7abe4b0a9caaa93218ece42b |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8b67ebc08881b5f85b863ad652399300a449afa5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f7a800d7700a529fb004d318ab5749cf3df05b2 |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/5ff347b9ddee5b3742f71c62004a753167e21561 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ed8f7979f80eb3485b8e27bec4977d21174c8aa4 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/723dfa714a1f698d6fadacb479a85c6d31775ef5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/730932b5bff4e3398849b58c39fe674b0427cd4a |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e25926211b486cc460006a3460b12b5629228fb6 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/bf93f804a4aa9b6647937ca9e87d698b016eaa1c |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b0bf79d1b00909571a6e570b1c3d9a52aeb9333 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/dd014e37159685e5f172c89ef96097166bbf9ea9 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/3e0f69afe58a0f93718408b69b63aa6630124daf |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/52390a6288a9210848aae010388d8a6d0fcbe275 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5c0003168cf299b50f48f5518019b95eca3ff0f9 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/22995522fa59a9cd387cf3d927f8b0ec7c267670 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b17e8a7d4b812e29ac2384cbc6e67cd59a780905 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d29f5412971c50d5d5e6268b39fc6544cefb1e8 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/652c73781e2acbfb4f188336aa9f8c1db94954d6 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/07fde7f0b47874c75a99e5103ec672bd8e7c7c9e |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/03c30651713129945b06fa02677839c84d5d27de |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/bf1b077d0675adb1c73d23a05abb4980a82044a8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/a7668e459a85ee1fc644f53aa2e6e8febfb30d55 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/f64f58f65343bfaeb08d61875e8a1c1b67888419 |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5ec1e12f76869565481c897f826582f7663945a4 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/79397bfaa2b859793ec44e3c840f19423a5c9dac |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/953324af6761dc3d8e763bb5ec5ce693fa130e91 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d971bb2eb300a74947250970a926c1561f6a55ea |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0d007fc8ffc147546de512465ead6b2da78d5ed |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d4cfa453cf343de113c6a55b304e6e1c818ce79 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/8eee8b5e110604e3d4452e82ff443e8ef7031730 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a06a17f9833270234322adc26f587f41e08eeb54 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7b783316b139921bf037b4dcc0b41bfa5d5a9e0d |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1c67a9a8fcfb1236b7e571769f1df933b0d94246 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4364099f2140a81bf5053fab66ccba9611ebdc2a |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/10ea102f859287bb13f0a6527beb6251f36c3389 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/7cb49529120e6bb9274c889b3cb1e9b3de78e16d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/499a196a0e1504d38733a21e7199feeeca7be47f |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/7e007c12c56b4216d2d9f12054f7ae2551b1ce21 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/4217c2cc52d5c2b786372ed0258ac16001876871 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/13186a63d21e64351be9a130fd297f2918c40d6f |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/8bb976a83f68c0812ae73df1d9691c7f166c18f5 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/c77c39bfe779d6038b3ea3afc03788788ec8650d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/12dce36ae288f78437eea78c8d013e791bdf9a69 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f0b2ca4e0a6346c2c8d927dad295b6174a012613 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/1935887afac33f972bae7838930202c5101ac5ed |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/b08ed1c25f2a87342a44467186037f2ee4c3215c |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/29086cdc10b994cd265e8d9b77c62e8d74d26351 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/cb3920b7ae8bd3ab25458f1f208a877ad93bca4e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f41f780e054e6dfa9dc07f2ccaf698520e56601c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/ec223cf0ef813ed21375d18480050bf825b50ae6 |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/f04e62937ac32d955c374ebe7377fa3db69e5a11 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f8ee151ee04bf4647d12dffc2ab067586283cdd8 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/658d46a423116ef691356751edf3e1d811649197 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/a4de66a896609d26ea575a3840d204b2f4241296 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d6846223387c3d085504b2fea3eb555ba334d794 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e11babc0f64b9449094d308994a1327f782cf5c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e1251af4d4fa372e9fbc55b7a8e937580eb46b5 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/2334f195f4eeb68d4749eaaa3a5660f50e4f9c04 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/58e5d9913addc958b243a9daef91562e7554b7a8 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/866d55874ad20b6c29cd05534bd95b855689331c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/26e95a0883778bf2f6420ac7343bd99bfdcd32b9 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/c2fbc68baccc22d68f7da25ecc91797cf1c33dad |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/fcd83daa57b458144a01a88474de3146c013c1ec |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4472f25eb604085e992d5c7f588aef43692a06f0 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/826fb1e0d0e0757739387dd337fbe80b57c7682b |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/1d2bac25348627c5976a8deedec316b1b4757c6e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7cfed7a7c58214adb31b7ddf748e75fe51be5680 |     
  powerpc    |            unknown             | TIM | http://autobuild.buildroot.net/results/929c2a534f2fabc97233e090a57e229ca80437bc |     
  powerpc    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/1118f1b82077771b81d9fa914c1bd12f36a2a8ef |     
    m68k     |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/ccb4fa8cc84704cea3e30b72512227c1e48a246f |     
    m68k     |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/ba87ee1a43afa26e5d7f577f327350cd14e479fb |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a54623c5230020e320f3a5524421cff34b591041 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/07351a85d99db01f44fd9da597f6094b19a1c4df |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/53f1407f32e68a701fd089c6df1f3d4f980b28be |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/8d5765aace540b5f1b3c5c920d8fd64c1a90172f |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a3a4a47e54c79764b22c12f3ddfc1f4b5884c0ba |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/db9b33a51edc8f8639ef096c6633e5d538bc35eb |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/7dc47f72658d8bf4a47d93d833a6a5979e1bf36f |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/4f648ed4455a70a916974d55e2dd97b96eac3af9 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/aedc4a2943bbec1edd78e47b01b4e2e78387cd96 |     
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/dc5dc0986576428654e05c57cc961a359694bd70 |     
   mipsel    |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/3e4f31eb017878d3417742cbc83e16bc848db98e |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/1e2223ceacb38450c29f1d54ef475a572b4a5586 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/f67e01b47f4d165c65884b31cdfb687983e77bd0 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/861d12cb35f387033473bc0430f9227feebdfe0d |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/92898df0b02ceb01bcc0c6bfe1c253019b485ba5 |     
    m68k     |      xml-security-c-2.0.2      | NOK | http://autobuild.buildroot.net/results/d237a034ffcd57af3f45aa4d4925490587bb8819 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5942bdcc8f5ca9374d9c96610721d03f31ca8c08 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c853cc9119f56fbfe1aa88596c23ee2c640923dc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2c94fd632db0ff97d894975a4e92a6850c6404ef |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/15de4c671d173c4d181164a0c65d00035c348c5c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/946725d918f907511a979e3b40b8de6876d145d3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ca4d3b8de3d3de53b0a3e1cb84ec370d5938d951 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9ddae9bd4408f1664c62f2aac1487530ecf7c927 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b79c7385282febb63007058a502cc02360649877 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c76b0770c5e82c88e8a7d384e01f48f0d9c87f5f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe14e8e39d9a382a2f1488bc1b1e7dbcc2e6104b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/652c718fcf6448578f74ddcd308b15012e384d7a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d04262f8d169eba6e7c63242b1d45516b3f15aa7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3122ad24a5d854d22a0bb2e5072ca133a615fad7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b4ae0e63678b42b9415f422a65011db90a1650e2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/82a69990f0833382d84a09daea28121c16d03b4a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6bd98e14902b9a27073df6c1026061016a2ae71d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f5906df7a2dd1bdfc590944ac00dc4b3acc00955 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/edfc512c589305c29ce8d501cbc4ac4d5a12b863 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9f30248f91fb5f20ef8dc5e6da3b113d90bf5dde |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/62bb7b17c9014b104cb0b82638b72d3274e5789e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3ab8f80c302826a885950095fae02b51fde2b9ad |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/14642a1673e149318d1ee4d12886e34a509b1622 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21df621dd168c20db750089ee739d3fad4583e1e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/71d1e86d06ca5314506f6e86f8c16deff8ea6386 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5b1d74d94d2d96b81f8f0c2c8e3f4741684c2a12 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4485c91aaf6506d6d0f32993f50981dcce719d09 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1a474a582adc0f528db0b4d4ae39dc4811959ca7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8bceeea813ecd03ec4482fff53b3f182615e2671 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bb2173e05edcadf2035c1a4d46b7d3e861ae5e0d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6301883f3ab3a9615afd255deb884a137444b5d2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/629aad8b483d1188581a607d5c526693f1b4666b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0613aacfc96f92ef586a869b6309bc0c95fb040a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3b3ac68487bf596a1ef643d2ba9de135c09dde6f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5a58d7681760d51f71ea8cc2d163be8ac4f8f7a6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3e0c9945b4578f63e8ae134bf5ecf7b570f1682d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1cc608d394b938b60e7e7ba756fefccc4283fba6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/be65930aa7fe48177a7812c4c862225ba7890cb6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6b81eb89ad9083fb4a935dfc4a78a8524a207217 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cb038977aed6cfedf0e9dde1afcb1a110174501f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4e8835bd9455391d13a8b373ada23e96c134895c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/67a2ec61226f5203d10f873e27090d4deaceaa71 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fd3a101a980ac46a5f33320a5753b05bb3b4491a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3c4b0f2b75520f6b7ca7e30b3a44c38f91d59a2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5813f61bf3e9c65bcc114539c67c6309b993b80a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1fdeb6d82ca18d1c92906680c4ecfd6d571030dc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f309912f08a7f3b21aca90ae2afec508f7ff4c2e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8be10d0d4e84fa9c886e7367bfb17ada73720b8c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0cd8c0ce5b85659a41bcbe4cf62c4127686f23a5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2011419ff552893cba1614b5c585c733fe2ca4ea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9c22d0d46ef0301ec6ebdb16e9aea123ff1f56ae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4e46d36746387ca046a3c9c0da96ae373405d3c7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b0dd01c2216619423524f246ec66656f18501e18 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b9967c6b589566f3322166093a53b8b38c562b03 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/75f6d8b3f111dc3a493bcdd2d5b1978f72bcd316 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bb4155a2002903652ea700c5b32637c72f3091be |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/44372c597fe0d698e80d61eba1f5d794f958ab5a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/20c69af9370afd7d819ecee894ec867fc64b8dff |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4a4675ebcc1c7cac4795ae7f52cd875b77a99fc9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c3e412ca93521487c1da79d54dbf19f8e37fcf07 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e4d28493bd9184a67ed947c9812cd81d7acf09d5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/00835eb8aef26bec4cca18ef2cfdecc50445c694 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a7858131e29c213251cedd82ba6086cfcb565e43 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/16b1dab395f3a396cd461b9154d0e90f86929fcc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1658d576c8388e6539cf76a6a29da542b0d2b335 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/542fcd7ad9825ef68a7e283d998fc0619f91edfd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b03903341d255bb1d8d5f320b5c56c7a853216c5 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ab998a23683c6384c159cb66a83172b0092a6c93 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ba6e286fdda78344212c44727bf8351034a2c76f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cd3f587590b4b5557b516feeb33576ae417b3ad1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/700847301612f6fac59e824119a750abb33c7f80 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9dfa213bd8dd5634c1a5e13cd5e85995fedceaff |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b103be6dbeea6a15c0396c33c98d7a91f2ba3dd8 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/dfb6fb1a1e3348921cee00ea6a155130966cce61 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/31db95e441d59472d3dc0f77a6e232c699f62f53 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/233ef973ff5a81020be9fdd70c2d0982dce7d162 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/7feeaebb07d2bed3bd7dd6c83263b8af2e634fc5 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/4460961a9aafe79289e440f064d1270bf062ecdb |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                    htop-3.0.5 | 116
                  exiv2-0.27.4 | 56
          libmodsecurity-3.0.5 | 21
                       unknown | 18
                 pixman-0.40.0 | 16
monkey-f54856ce250c4e257354... | 14
               cutelyst-2.11.0 | 9 
  gobject-introspection-1.64.1 | 9 
                  gensio-2.2.3 | 8 
                  zeromq-4.3.4 | 8 
            erlang-jiffy-1.0.6 | 7 
kvm-unit-tests-kvm-unit-tes... | 7 
                    mpd-0.22.6 | 7 
                   sdl2-2.0.14 | 7 
               capnproto-0.8.0 | 6 
                 openal-1.20.1 | 6 
                rocksdb-6.13.3 | 6 
azure-iot-sdk-c-LTS_07_2020... | 5 
                 openmpi-4.0.0 | 4 
                libkrb5-1.18.3 | 3 
               libtheora-1.1.1 | 3 
            qt5location-5.15.2 | 3 
             util-linux-2.36.1 | 3 
               apcupsd-3.14.14 | 2 
               belle-sip-4.4.8 | 2 
                 dc3dd-7.2.641 | 2 
                 gerbera-1.6.4 | 2 
                   gvfs-1.44.1 | 2 
             host-cairo-1.16.0 | 2 
                  host-python3 | 2 
                 mesa3d-20.3.5 | 2 
                mono-6.12.0.90 | 2 
   openvmtools-10.3.5-10430147 | 2 
           python-pybind-2.6.1 | 2 
                qt5base-5.15.2 | 2 
                xenomai-3.0.10 | 2 
                  apitrace-9.0 | 1 
                apparmor-3.0.1 | 1 
                bitcoin-0.21.1 | 1 
                   cegui-0-8-7 | 1 
            docker-cli-20.10.7 | 1 
                dovecot-2.3.15 | 1 
 glslsandbox-player-2019.08.23 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                   httping-2.5 | 1 
                 hwloc-1.11.13 | 1 
             kismet-2020-12-R3 | 1 
libcamera-ab72e6641c56e876f... | 1 
 Makefile:753: target-finalize | 1 
              netopeer2-1.1.53 | 1 
             netsniff-ng-0.6.8 | 1 
                  netsurf-3.10 | 1 
                pipewire-0.2.7 | 1 
                  polkit-0.119 | 1 
                          qpdf | 1 
               qt5webkit-5.9.1 | 1 
                  stunnel-5.57 | 1 
                     tftpd-5.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fde14252166fdce81cc3d1c7da6c35537838e504 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/3e2886f8d9b2971078585058f48552822ff46f81 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/85f4d37d2dff20f7d4d87ad41b5051f179d2d776 |     
   x86_64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/4c1cc8daf765fc5b5be4491f9118a3d5c72699cd |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/256fd0a4b4b6be1740409c88b079a258de11148c |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/7fcc3c8a814d17999343b4d24dc6b8c648143e66 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/e512f8e0a277afb2ecd34846d49b4f68e1c0e103 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/8d74aa3ddbd4918dc13b84f091885a225766f72d |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/24f69126333ebfec7bc5f69bc6fd5d99fc3e48a2 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/c2e07c62e642e8ee42ff66b70a38517de4fd77d6 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/579e89253dffeea5513a2615fb66f094632ab9d9 |     
  riscv64    |         bitcoin-0.21.1         | NOK | http://autobuild.buildroot.net/results/ef8e582ba6bf1a809efdafc1b4cdf1a774022b9c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0f881d66f3986f62609bea1c36022b0aab2fbb40 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/75266514f76c81a6ad8fb44b117bacacb4edcdd1 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/054fcd8eb12d32c38a02dd9d78ddbe3fba86574f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c501ce3968c37f2e96b45e4ae263794eea6e8a3b |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/37b4422c6ba45a50d5ed059dda84206d6b89f59d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/5e29ab81902c6bbd1d9c4f3b9bea0a131ba4a21e |     
   xtensa    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ca2ee2ef61e5125871ec665714c8c776a2caf0a5 |     
    m68k     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/b0d29eb0d7275be16530a99fc7d291f70257636a |     
    arm      |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/fc19c15291bc45092d8905d0695ede38ffec6d92 |     
    i586     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/cf91e27f05364635ebc55ce4717035264eec3f76 |     
    or1k     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/c143a34aa0858d47e877bda90db4f7851a4f51a1 |     
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/1b940a914486a52f2fe85f06257440b81ca4ffac |     
    arm      |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/1c8c91ad45b525a83b0d8df1c76d418212a0a69a |     
  aarch64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/5c7122099fa07c05b4d0dc18a3f1949d280f767e |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/0d0c651f5e99239c0093bcd9cb0b8fadc1f2c09d |     
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/c618794fc54dd066304218e0a6cdeeafb113c7ae |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/73a9878dc9a4ac78afec116299abf7dd78c322fb | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/7ff96371bb01a9d889331429c49fa1e20efa34a2 | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/29b2e9f183c6390a22411085f3ffe7122152f360 |     
   sparc     |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/6faa407ab2a87b33c67657e8f768a6a81d3df9b9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/493b404d0ff3765d9ca783f571129e8d8a7ebb2b |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/91a65d7bb910b1b67c6e1ef0380265648cbf79d5 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/05cd97a17d4a7e4ca8e0fa051a0716a6f1593019 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/be8dea61d1a7e15aa2ba627dd8b4b29b9e4603ba |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/647e9dfd770a9885c2bceba69c8b3ae3b8e2eb97 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/945f34a649a40e6785f989583f35c310ae1d2849 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a80c56331e6c6071ef28b76765d93e938b13fc40 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3fbe98f769cab3a1b29bb8fa8549727b8cf2cb63 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d944c344083c4eab6aceb6b1defc4b59868b436e |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/689c54b5c31fa5df9596dbada2414db43dcb8670 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c8070663a45e429bad4740d55f5ce29a66c98722 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2f0e8bafeb479d0bf0778fcb7fbf0505b6cb3d6b |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dda7283cd088313e8c83f325d39d8b97cf6ff54c |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a909e3a7c2b1f8b0303686acf6a13c9cde36253a |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/37fbbeb089d97e3de985a52f2b77f4624941d171 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dc3deeb9363af44c34761aab500cded207befc72 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c0a3164068527444aa9355676566e10c998f3627 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f2cbf9137b9724148c33fa4d6fdbd66c2fb83cdf |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/12bf898fb83a54529fa9909e554b50cdec405dcb |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f083ed43107d1d4444615574f4277fd18990b3f5 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a1ec660b5b5af87eee045d2779119047706c75ea |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/84b3875e1516e80f45ed36342b1c214df1a3a20f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/213544ef2a9ed54a99738e919efc5bbfa9c1fd85 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d7111214e40e72e7f624af161aac88453a3237e8 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c546c766a76b4be96efcb7409c9a76c03863a0d8 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1c51534c513ab46d11bf9b838e0b036ecee26266 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/720fc50963f391e05b91a7c484169e1e5c428fbc |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/631f91181f54aba87d8d20fe3699a26b58b9434a |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/eb606330a7679d5ec17b54076c2eaf2bc4e49d8d |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e188a48fb386d95419c862388b331145c7f2c8e8 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f141091b94b614ce12effbcee1763093d8bb6462 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4b45f1b82fea748c584d69f83e74e2ee948c3959 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a071db5c52a84cc644d2723d222888d7d3491466 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2283d57b1b75b49d7055ce4513b339c7e32f25b1 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/46edb49575b12df6feff36b2e74c1eddf6ea5369 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/70d149c5f9275b9afadae51b10e5ac5715638f5d |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a724813175decac03e587556bb0cca5093d5387 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f89a3f1ffcab555e13c27cd07d4a9136aedebef7 |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aa4e2dc020093d7ae74cf7507edf00a59ab72c3f |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/50002eb266566089db043c5b5dcb541eed3415ed |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d791dde17ced66c53efbb386d3cc5023a5c27a45 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ba5c1ab5f86092bf742e0e2743c3f8538b016fed |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/552dec36e236fa13fedb452d6642fdd8fa919987 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fc4c4bfd43f9d93494acca5ead90a2c9cf6a7701 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/15722a7a2c11b35627cf3ed9f59255f091544d09 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/57adf8d3fe6e4dc652258236be3da0bbd5c9f43a |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/edb792b314e12e41cf71781c5e742e38d5b10569 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b4b039d7227665bd07401bcc48937ea14eb1716 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/254b0371ed470c093ef139b4903979299923295f |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/699a3c04a7de9b515ce650c0e423d0ab2e4ab796 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/56a7de636cee03fdefd02be2fc5cd25db9c7987f |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d51ecc3c79ba079e987db9cd68d9ac7524346487 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bc70331f0ccad23046676e2689e5e80c440bfd47 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c32cac890ab743f1253ab3d91a474875d37bd19c |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/61136b0b27336970bb9e3355b0b5507676d1272e |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5b1f2064c7c09841892f0ea01890cc32eba7fa68 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9c3a317e2f733adaf9cfe1a92a0f6113f592e6c0 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2831b5b692a344b0369f2126836e4942d02ef3da |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/8b78ea11fe67162dc192b7cfdbaee3765b4de81d |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/65a09548992d64087438ac710bd03171b8aabfb3 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0404f70eb1016a375865ac3c5dfeb8e4b202a318 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cdd877b4dc9c2b6aa01fc67c7a3e931b5f0a8f14 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9967460e6f953969fc3321796fb2b35e4c396ba8 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/84b655885ae0d677289cabf6658f2018ec54d663 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/4fcd9e14cb7dd8048e4d3f945180626014a7df3a |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/7927dea99266e2394f65ddaa2031649f0e15843c |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/f6e6880daee983e3bf8eb2e71ce8bacd6bbb5af1 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/a47332d1c17fdb3f9d8e0a4088aa396878e02710 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/c6c7d6295b42d205673aea6725af74ba1c1eb244 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/6d75889bad1e9c6412a12f242acd2cf46299491c |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/710d2aeb374e7bb4fceaf98c436f587d8df2dfda |     
    m68k     |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/bbc1a6556426c8ef8ed6ce44a5ece02d66cb53e4 |     
  powerpc    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/76a5b35358fa67dbdf83e3dd323fe610bcdda1f8 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/1a2944d015b8dd26ef86d7cfe9100ee90c9b8c46 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a26d78460f20c858b4c2b43a35f699e742c007f0 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1f317c4a1711633ffa02a549475fc9178cbd6aed | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/b784d8ce017ebdf8c03afbeaa7bd576b94d539f7 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/db178cbefecefa9e19ba4193f40c474b206875f9 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fc2a1a8528b4d74762c7ce173a90aeb5e1dc0ea8 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2e6739f8134d1d1954ec26f571a68ff78b7f93f7 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/94c3af932fbb17a07c3acd17c6b6f61738a1fa71 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2a2e85a2760619d5c4369537f37c9e68f7ca395c | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0628911e9c412b86ff61ae219b735476d3881ed5 | ORPH
  sparc64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/4a0fd296a39376364722bda2ea2ad8d436ae264f | ORPH
    i586     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/e8ed60fd2fc31984b79d436604004782e1f9b4da | ORPH
   x86_64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/b21f76a4086af5a0263ad00ec67cbea8babca71f |     
microblazeel |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/f660ef56ec86ddc38dabc3544b759789ca6d38a6 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/49b602f0a551660e8289045bd2d504016a2c0120 | ORPH
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/513401d8519b60e9394f8284872824f97d61c286 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9bc4dc80bee7f02c297207fd523e93ea495ddf4f |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/905ab5aeeebc084220acd0474dba757f37714028 |     
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0e5fb9618cca6426d5999414cb9d3e0b65968e0f | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0f585a86453d35a8a32abe67ab557a02e94aa18a | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ccc9dc6928a45ba40f619c47c17ce1f15b6a2daa | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4d06939488d01f816ea3fad0b65d188088bb7741 | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7239a5091790fbc8c8709fbca849b109abdd0bc6 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/20e7e9d48748a54b12eebcca47e0b8ebc94aac39 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b586758b2cf256a73954b1567eb6ad9397e0b89c | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8822ba7b752c0fbd9214b96643d59e5257522b6b | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f5b2b59de83ddaadf151552c2213485a542996a4 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f2faa07ecd875a248a67305908507a5396d9e3e3 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/123314b09849266226c9ea48393fb4789a253dd9 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c2886622d169ff538da6c68f6860abfba4714eda | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f12470e2d3956afc043c0949de1d92b52759dc33 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f6814445f9918b22e45617578260ca5bc57b3279 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d7a893272f1b9e2dec5ec08a9878462f98cb9ac6 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9d6b5ac153145c7a0f0d51056f3ad5cb2b88d50f | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7ee25624ee7911e1a4acae26ddef6dddff1dbdb8 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dba9e8c11361f78e58e99b09d183cc4f0dac0b7f | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/daea3fd236ce2832a883da2073f28eb3fd57056d | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/adf73ee78b8688f8e8e8c3dc80e58897c7d1c399 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ce16bbcb581ca4b901a3a34a2c0404405a1e89ac | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5345d6d83bc242be36930e70d714ebd49ccb7986 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1ca14d553fe8b08281d68a772d681551b9217e79 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/af40c28d17a3bf3bcc6881df61b8236ffd9e8ee1 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/67e9d21d2f0f196f10fee1d446251049efc154b4 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c81bdd2b39c1817e7ccaca36477561ebaed1abb2 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/024932ced7eefc35c59f5b1a348550c95c57c47d | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/76812ebd58479938d8c6c6f85542b39e074fa066 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dae1ecd3b040e47180c0f4170657f0a32b95fe49 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/45ca6ff331eccb4c5c0a2ee85b2d3ebcd7b3a73f | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6a9f30c2bfaa7ad1717e2bfa742fc124f378757f | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/98dd06246d4276e71e7c08e67c2b1074b504fa3a | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6d11bed05ff51236a3cd45917931c6f8b36aafd7 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/91d97339540d0e9ecde157e1faed5343f36aee71 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/39135e24740fdc8dadbf4ad511499c5989f43fb4 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/753aebeda8994c0d2d27b60a4cfe11690bf5ba56 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/83b83928204b680e0a863c622bc22ba14085b793 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e84b19338e6b3ed26c3fb44e90c81c566f29cd25 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0de2899f63300e4dc4fc444a4968d411ff8bbb79 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/22c98d025eafea013573ab4d07a2256b43c20891 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4a0ae6d932b61d61d3e503f56b2a079d9a0b6a88 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0385f11a3829901acc4c922eed02aa1de8f84d80 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9e5b1c82fb06b711fe36e8f405b474d9607f8def | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5bf17f5fd8a301741687b8a32b725475476a46f6 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b0f7f1b1cc87bf17fb31f3839b858636df5246c2 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f34b17f3fed0bac5a08779ee0cfb1417568b62b6 | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ea2c3adeb2418d872330bf8ac8e1e62be2b29363 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b7821c12d116501fe669ad9a84c4de4e6319f166 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/61cb826e240ffdb6b186d1871927205e1e9c0f5a | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3edd40884a8cdef1944dc5a5288913ff8d457f60 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e1dedbb47083404094a6967d5ca10564c68d3152 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a7756eb22d95bbe4b46ca968853d59c0d624803c | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5d84fd37e4c88723e4bc788cf1b5407cda8368ea | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/17c4cfbe8d45c075c61eb8d1c363865624f72c16 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6d73a595e5f0e92afe2b721bb0b6033f8fd29b9b | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b5efb77b985c749aa8e39ac64b5c9f23da29e06e | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/58509727d02e443b89ff471b947d7d7ee1bd2b48 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3f596a22689d94403a23ecd7a8600d7488ceb84d | ORPH
    or1k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/59e9fa6ecad4957eb687ffb76306c7e9c806a7a3 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4cf9f954a44c119ff7250f9c2a27049d189509e8 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ed8e7f7d61d7371d324dbf1d490de1b39b012fa5 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d49c415ba7693412fdb4bb75ec49819ba7714a6b | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2e65208e011f6ebb7eefef4dac6dffbbd52e60b4 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0b8d0fba52859a23e30e676e50f7b9e75bd6ae97 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b386b7a11d01e556c0378ce9c0833024454281a0 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7fcac529704ac8e367648d1cb31f5988edc43c4c | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b2229d1105a9bfc35d706653aa386cfb4205bc50 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2fb41851293456dc299862e78125d455b418efdc | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3f6ef222542fecf05c69945da74fa53c70fbe413 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bd298c8bdf6e294fc3c3e3a6b5e5a1609d95c06e | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/26d8d016488d1f93e9d5d88abf9272ecb4d782b4 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b748f539749b43a422962d7d87ebc90b8e38b84f | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c4e95ac08d01a4b76abcf0435b2e1a09a6cf4e8e | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/15a9f6e7fd54f9813233b3c45f72128957d618e5 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/53035d2aa78854d02bd0ccfd4eda0e51f0bb3351 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fba6cddefc2b3243d340cbf55e23f752ea0a1852 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/38a69b6c8154318600952f4822e02a7a2c21fc6d | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b80ecf8c62e747ec3d940f69931235fb3bfd480e | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b32982115fdd5b5e30dc363a5dccbc1ae0160b1d | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0b3fa687ef224c19c23410bcf2b235045cb8d0b3 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ffdd142e8bfaf3a1dd39a8e7123cf551844f88f5 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a375a7642673d452c2bb08dac7881b8f59eb7043 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d9a779559a1747666afbd4993b3e501888095f4a | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/083f21f28fea05319c35f3b8952728f17cdc6f49 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bbecf1e7dc9e4523ab2cccaefd33ab14d6a72fa0 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/47552769006cb47d4fffd248936e1a1391910ac8 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6fdf19a0bd3e4487d6c3a338bf8d47fc3158dd62 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/da7df3c43846b822d248d52a92cfbe94c1138689 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9bfe8fb2103ad89abfb39ad383a9092e369aac3f | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8ce942d5c93720e91034aef9e346687ca812e923 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d9a1af305d21f6f14cbd03b18962ad6f0e14a20a | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0e3ddc41c31c4d8619148070a3c0dea4dc8ca81f | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4ff347cd1acc6695542cbba8fe770c70de34d276 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cb015c64c9843e9adb23797accaee6c957d8845d | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b9dd45136570d6fd0a4e6fbedab9392936f34f1d | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cca9d81f2b576f224940c2e45e0bd62880ef4ca6 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f6c0fd7188e938683488217954c330024f1ef4c3 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/cd74a2820844b0f11f6685402d9c0a3c8def1500 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8bec8301712cc2774d402ceb59e81c75b212f914 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/caa7160831509d72d29fbde8a3f8d4201ba2d5f9 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/69bd6c1cfb2215e8ba123bcdfcca63912a295f2e | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/956ac7226289dc4249c7077c3007a459ef2cbd96 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2292a618daa3be15febec64b7e357436a9bf2bee | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/77043a9ad62bdbec963fca6b3e3ea6ee7e182806 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7f8449ef324da72ae813e40f7c1349813bca412a | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bd061911f138bb4d79defaeb92e7a554a7192ef0 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/da56263fefced33730029b888fdbbaf78e46589c | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/74eedb62ee9e67bd5fd8f9929eaa86fb97a5bcce | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a08656f8e3874046eb7bed215cdec2105bbe1f2f | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f2e531c39b5cec68e7eb445b26298dbfd0589e2d | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8709a1c6093c18978287d14d48010ddf1293a7cd | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/101193e8e1b43ad6d3063fce3536259a290bf90b | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fe9e64e842ae37c4176fc2096aaf8a25ca6d4f37 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f775bf0a8ee0c4a4ddbd1af0860896881f885e15 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5f2b3905ebc144fa6a01422f854096cc3e84c8f0 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/15e7d13ae6eb225df03a23a12a5809398ac2918c | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/ad19b8bb8637d187204e5cbde7df070755e86d29 |     
   sparc     |         hwloc-1.11.13          | NOK | http://autobuild.buildroot.net/results/0c56c503b4a218a89f2abe24c2543f082764a023 |     
    m68k     |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/ad8a86b52bd6abb9a3b91b9b99e3c4e8164bb725 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/f656b42042736d3c96da2999207ebcd302c7154c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/08013e8b781905ad70f2e67e087dc55180d9dc55 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e84e391d681257b6cc0d1ef8dc5cbc598e64c6d7 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/337071154d879dd8025a6ab36c106fa5ada90e5a |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/81eeacdd8f486cf7fbfa25a4514ddb8c89cac56f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6c2cdcf827764c8e754986c516e19be63ff43c7d |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1ea90a4785481baaebc80c37c63fb8ae0ed80a6d |     
    arm      | libcamera-ab72e6641c56e876f... | NOK | http://autobuild.buildroot.net/results/cc7eaf4b1bad31341878560bb55b414792b0fbb7 |     
  riscv32    |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/a6d1284ce5acf56a17c6aa2fdc0e650e8598f737 |     
 powerpc64   |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/311366a966aa504dfded9e5c119cf1443dc04e4a |     
  riscv32    |         libkrb5-1.18.3         | NOK | http://autobuild.buildroot.net/results/a845ab5c0904f8058c49f5f37d5865c2eaabcd16 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/54c7a72959097a37fcbeaf65fe39f33a25eb1b9e |     
    or1k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a93bc5b21411bd28baa43f86ca17ff5157c438a2 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3674893b488d38a0b925a30826f612c9bfd82be8 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/05da1c6a83ab666924422f511fcb99a25933f522 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4442c99849ef3503a970b42378f09a2284a7a50d |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1fd3538e108be9c375e80b13bbd2ddc2825fe86d |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/811a4648fb8a27cf0434c09422ecb3b4b17f5871 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4e485913d1dab8e2227f031017530801b9ebfb83 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2d5cab858ebb952012ed2b2cabc344263af0b218 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ce355491138c281c5c8605d80f4c7e83cf6e2d60 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/b2db98c9426eb95dfd10d451cedc4d56f8566490 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/31cf6072c71c65130f8f1729b0da1fb3e858c7c5 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c621e51de60ee600ed0554f20c86edb22d02b473 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/38583efe72c497f89be83ec8612d2418b0e6d6ba |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/fb4c1c4d286b4ab2ad46b540a8d6b66f97066eca |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ba7e209a751943845a6d0869da57458e7e13cfeb |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/50cbd470ff20992dd61d4b40107a0219a56c0b1d |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/17cd409200ceb98c7ebe86510aa5e770efaddbc5 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bcd2c515ff1811d4846cd3091a7ec4e1e6c671eb |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2d3f9b5f269cc97d3b5e511d1a92c8c36b732825 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/239eb49acbbcac761b34cba7f9ec98107e8ec04c |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e9d5e4855a3634f68b86c82189bf84587f8e05b5 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/dee6508de6c7d18e05513e60ec5ce46d31640a29 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e2b1d55457653e688a5942e2afef38abc7f678d1 | ORPH
  riscv64    | Makefile:753: target-finalize  | NOK | http://autobuild.buildroot.net/results/7b7fc3aa189e310e714454008f9d6d8a6c3d838f |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/5375d7cafaf45c05a38f8e77050f2b7db0ac525b |     
  riscv64    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/fa4c5777aaca5f90ff703f73519bdda76b0f69d5 |     
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c63339beb11cfc330233035a23f94ca879cff706 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4aa9ec5b90e3540a5c23bdf46322a53499115622 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/91e26a16ddee5253771118fa1f21d3d8171d9fdc |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/5bd164db87a6a96bd2ba889d6dc8a750c8a1a3f1 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/903f1025077d97b05d6b1c7c8b8c4d4ddcb508b9 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a79997554d087f61c073a6023d0dda017343a594 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/fbea6e3716aec400ddcb1a99f8f556e08ae37a35 |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/55523bb027ef98480756a5177311c3993588123f |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b11156d9c29441dd9a0eaf23bd3283c0d7ea474b |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/4cb8bb5188fa3aadbe4d07f46946fb27a3c79451 |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b1fee11dc045943439725589269e51a7867ea12a |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b69ebaee84018bed3c2e259ecccc9c53f9849d50 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/85855187111f417eb5e841a584cb123213643c22 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/3377541c22f1c569f8b63bf96e8912441c52938b |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fb517971ebd7c24ff3f43b1998b90919a00b294a |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/20ccccd7b775a7aec3d85b2fb9065025f8c44f22 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/4f59145d0f7480808ae80b9753ed6f4050347137 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/80b6d2b89480bb029cd3d9836ac8dfef8b41d93c |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c0f241005eb7700bf7f3a03b75076dfc0c58a473 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/d2d6d200f03a40df63c6f396998cbb245c3e0773 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/20c9da08cd8c5926aebc8a850471cb18efb83de1 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/64fd6e8447c63628c6af8494a3ad710c5299fa80 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c5589966fe93cc2922bf09912469c367a2ba281f |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/9879af5f0d470f8c16b332e8f7f7e0924a3b1455 |     
  powerpc    |       netsniff-ng-0.6.8        | NOK | http://autobuild.buildroot.net/results/a135689075ac83a73ec1a6ae4a6d96abff71074e |     
  powerpc    |          netsurf-3.10          | NOK | http://autobuild.buildroot.net/results/f2f0309d7e88e914c8b76c7c10ed61ac6817074b |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/bedf92c7ae0200b0ff967d6bcf318c0105272c1f |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/0b19704ab515ef42010a0c3a1ccb4b7223d586bf |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/34b8fa816fd55a84712aca6f5ea9b19ba3ccd11f |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/28ee2fa95ed2b5e8a27b63f732b02794dcb4b5e3 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/e22d80ceae332161287a517f331aa46ab5aca861 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/3797a71625e02b11b5e2410026583bd0dc74893a |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1f5e4e50921eec42f708de3475e094099dcc0b85 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0b498c3d6d9586f54907fa88233bd2a1e29d6d8e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/336d136aba32dd254ea15c89ba368e62e810d229 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/25e2cfc972bb1d728687ee5fac89ea145698c530 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/162b88d2d5b8b8f39d5f806c4f211d5fb1092042 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b302741b7ce2b20ab4cd32beb6361fd8d33de0f9 |     
  riscv64    |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/6c35ef7b4cb4b55aa447a63918fd98d36db0be9e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8a2fe1a9fa7a262b05443df6756d25b65a440389 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bb191b0132df21e91e1aa264465a18e97fe17ee0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/dd1349e7494694903ef862bee5d42d1e8fdc2760 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4ccd930ddeb5f7e922a67ac84eed5fefbee9ef95 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d09932654e98b866bd107872365ed0f838fca3b4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9867438f83b1bd7d85f6fc5ef7b796854c3983a0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bc53e53743efa189bd0ab764989cda0f29331786 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3f0431637e6907f2e2694deec8f0d5a0b239b2bd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/400ade957904b9880b31d80228404aca4267537b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/15a2d2a1a775f67880b242672087b12ac8858e0f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c099a7fd0a8ccefc8e6d1de9f21a2ddf2a635152 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3f80432586f66f7d14d7a16acf11c1c2ab3e22b6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0e697a1d3c604780ff88ddf4431ce630bd31a910 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/31872045ae3836d68827134667fc33d473fb5630 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ecaf1372477433279245d63cca4d07b8a6f345ea |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c1f9319131e87240f060e32be5b388e514b2dc01 |     
   mipsel    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/42a8f617c01c85e33ae6371b0495101e1d8dfdf6 |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/4f5c1fd92d5119a6fe629327a67f46b55d59be1b |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/3a64ef9dbf31e15ee63d82dc8015d508040c2f88 |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/213428c56f6a5ba18c3043083ba66cb0e6cf96ba |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/87a058752fb9852a3e70510234143cb0f8e7f482 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d039514f687c717e65dd4e693b416745cbd33a99 |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/63803587842503ed325f2514a8333f6143af0efd |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/04ed4dee10aaf10ec543fb61dac69c90e1947afc |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/718771c2974212a336a93dbb2060676c03fd22de |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/acfedc4b471ce95a75af6cad62f5aca3da65957d |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/47ff514bf8e6b032828e5a0bb08223afae6d0c62 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/49b8df91aea5f07eb291b774947a5b8bc403dc6f |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/6377a9fd35165454e34150c59922af61f06a47bd |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7ab01ca29ee0578bdf20b608a0bb7c25369ca2fd |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/9afd437158003fe5dc3338eeb60a0bc52b6bf07c |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/07d5088bd9810295aae8b9838576198d201a7f79 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/730e533859780f53219ffb30d64f13d0fcd18f96 |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/ab863beb0235fad431698c29c5d7ac708fcd6fe3 |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5bda414136796042c657b0b4e2e95acf260ae33d |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d2d379b13791839a720b3ba1dddc6ff8432f4dcf |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/52ede2faee43275eaef7f263e29caf40fbbe6b9f |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/83f4ea87689429f9aa16cfdf71ce2e264b9c1bc7 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f8c54092ab8a8febcebcd7bf85a0c25433564223 |     
  riscv32    |          stunnel-5.57          | NOK | http://autobuild.buildroot.net/results/35d8f2a2acfd550d9fc612d08de88e46f4c1e964 |     
  riscv64    |           tftpd-5.2            | NOK | http://autobuild.buildroot.net/results/1c6998b3818ca859603176134459e8893cc5a7fe | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/63249ffa3ce3832a3d8d3290c8e4f3ba3090aac1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/8db4303055f5bb45f5b52887e531bd2e344006a6 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/3a01287a5ae764ca182862c48435400130611102 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/32bc75c29c12375171dcbc229cec8c96fcbd6130 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9268e3dd562ade0f4a8d7f2475d13b2bff6ed9af |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e37c7c6d163624758b298ff5b5a08a002547492a |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/edb2ed2d95b96c4f010517647d5e989c86e67eac |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/76287ea6c579463429f8e46f32d38bb4df370eba |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/e93b24de2dac166ea17478a3c0c4672537bc951c |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/82d57081bddbeb08827c0291364838547af80068 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/58423f9e8f70edab3ae1ab94bd9f072d027217ff |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5450eb6d2984a5ceff73e441c84096bf34ba6c10 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/3b9abc848edbc6e06fb76cfc938cc22ec7b8f64d |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/08f498361a630153fe09ab2aa972d1ea8fd45edc |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/d05f8b2fe9a67516b882ca5631a9edaf04f69e61 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/1411de044d02bf06925af3fef8e757f353ee08cb |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/fbb169143568094aa890f38ec18c2f9d61a0657a |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f5cb6f2aa5e7cbd632a70fa058418347e8683543 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/b07d9b01c27cfde30b1b40ae34202f31ae9e28f4 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/f4bd74ccd12783f674f7171ddcdcc73a4ef3d337 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/c03090ba2f44b7990ca51d774f4a9052769c4a10 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/af9df629fba7bccd095fbd7d3612195b980c9893 | ORPH
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/ec363cf8fff764f9ca704abd5be43cf92377e393 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/ba42eb5f3b82d0661b6db986deed2fd78c3b8843 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c7c677912c0373a7ec85616fe0363b59bd1ff012 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3f84c036914fb0e151f3bc4319c549a005e90a7b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ce453b34431e092996af8ff0882c53236d5aaacb |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7f8c96c60ca09fb22b222143238de0ef9858390d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c7dce17816d01c4cb95141c900a379fd927d3709 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4e719a47693318809664550e8f2d6289ec87ebb0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bc8b3129c48d9005d489e820c8cfed956e8b402b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/69425eaf464b441ec77e6b7c097ad51a830848f7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1105014c3183f1442d798985b3460f6eb7c7baff |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    htop-3.0.5 | 119
                  exiv2-0.27.4 | 52
          libmodsecurity-3.0.5 | 29
                       unknown | 22
                 pixman-0.40.0 | 17
                  zeromq-4.3.4 | 17
                    ffmpeg-4.4 | 13
  gobject-introspection-1.64.1 | 11
                 openal-1.20.1 | 7 
               capnproto-0.8.0 | 6 
            erlang-jiffy-1.0.6 | 6 
               apcupsd-3.14.14 | 5 
                 dc3dd-7.2.641 | 5 
                mono-6.12.0.90 | 5 
                   gvfs-1.44.1 | 4 
                 openmpi-4.0.0 | 4 
                qt5base-5.15.2 | 4 
                      tar-1.34 | 4 
    trace-cmd-trace-cmd-v2.9.1 | 4 
                  host-python3 | 3 
                 mesa3d-21.0.3 | 3 
                    mpd-0.22.6 | 3 
                          qpdf | 3 
            qt5location-5.15.2 | 3 
                xenomai-3.0.10 | 3 
kvm-unit-tests-kvm-unit-tes... | 2 
   openvmtools-10.3.5-10430147 | 2 
               pipewire-0.3.26 | 2 
                   sdl2-2.0.14 | 2 
android-tools-4.2.2+git2013... | 1 
                  apitrace-9.0 | 1 
               belle-sip-4.4.8 | 1 
  binutils-arc-2020.09-release | 1 
                   bullet-3.09 | 1 
              containerd-1.4.4 | 1 
docker-proxy-55685ba49593e6... | 1 
                ejabberd-20.07 | 1 
                     flite-2.1 | 1 
              fstrcmp-0.7.D001 | 1 
              gnuradio-3.8.1.0 | 1 
                haproxy-2.2.14 | 1 
             host-cairo-1.16.0 | 1 
                host-odb-2.4.0 | 1 
               libtheora-1.1.1 | 1 
                 midori-0.5.11 | 1 
                  ndisc6-1.0.4 | 1 
                   netsnmp-5.9 | 1 
                  nginx-1.18.0 | 1 
                   ogre-1.12.0 | 1 
                   perl-5.32.1 | 1 
             qt5wayland-5.15.2 | 1 
                    xen-4.14.2 | 1 
                  xerces-3.2.3 | 1 
         xlib_libxshmfence-1.3 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dcc5b1c5de7b7dcec10ff74898632c49f25f6535 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/36785d9ed320dc178cf9ad8d2810107b99949eee |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/61bca035091b9e3b95bf6c736b2f32a6c3e0fa79 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f4f7f0c840b3261a5a83c67ec418f21b0bdeb542 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f61d341288f3c89aaa4837622355578ee007cc26 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6a753e659c921368936b9050193034e49aa95de9 |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/269cadef6fbb6accb3fb1bcbd6a293376c8b72b3 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/50de8ec3e022650cb77ee2870f299e9f8b5b88af |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/4cee24898808bd6bd81ed0811602e8dcbcf223db |     
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/0b4de58d44eee80a6b42f73194509dcf497ab7a8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d1e947ab2ae7b6dd0fedf3c83fa953549aaf9972 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8de9669105fe7ea75cf83f4df1795a3b4c42d7db |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c34f558dbba5b11d8271594c78edba61a539fbc2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/85403185daf9dd7a2f298e3f2025735b7e8bcef2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e3ff170d473ad2dac5cb64406dc698b25258e1f0 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fd99735d34ed27f6c5d3b2d90e60c602b15625ff |     
    i586     |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/e0a68b3a4d625daf451d389be20f931f41ccb06f |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a640bda7d255215e2ea119ad3cdf944bbfa75b66 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/dc4c23ee60d7408c1839e9b529900c7aeee641a7 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/18783b65189f4088d1f645c109d34a4c9dada76e | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/259c6bb09608c578f3dca983a35e9034e594485f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/104e2af4a20ad8b41ec8c972738b7994484a6dd2 | ORPH
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/db47d8256cc77cdd8c8e077bc45404a46340aff8 |     
   x86_64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/ae993723ae994770f5aef74dbe738dd5388c7cfd |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/36cd14e0e8bc4d0a57675302f61afc47bd64729f |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1bc12d32577725ec48a6a5bcd2344a03b23bfa31 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/1856ca8bf9c9711ffe8305b909db05121295ea99 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0d68fdc25305f9edba768af6e95537f191d480c1 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/86bc9d26de69631820c137c265eca865877c9398 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/648dd040e27673e8e1969e62fcdb8bf61706c0cd |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/941edc4a14474d3b044a3c7dbc00ad9d4a01b7a4 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/53b3457dc09e4aa2a3c7ac259731bcabb19a0f75 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5fc608a6318d82c519d121318ac94558081fcdc7 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5f602be28d3dd4ce02c5f3e630dd49a86a8aa5a9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/28f76a223225de0a6acd0d28e5d992544484c30a |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d076f5908d810888fc022e501c91bf1e7e290aab |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c3649fe4cf34610eabb546eb4076b24b277462b7 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7e4add58a0ca65d8b8c210c328e7dea96a52e362 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/574bc3a010acdbbe5483baaada687abd1bb00bec |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/886f3f2c5a72b970c23442731b1737fe4bdaa390 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c06c23c76df305b8f9d10ebd07ce425b9df9297b |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f86ab3e8c36d926354d7f041e3a869af393d5e42 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/22a7fec69518b007a618ddcac0d4ded377e06f3f |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/03f49cd75dd59c24a29833934a35a1a481b1e72e |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e816ae4cf81bf419afbad13ddaf01a6dbb783e49 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b4159a1bad2a574954a2f72a8f4220f130cd4974 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f8874ed3396ba450b95da0eedd3fecf480955559 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/49b5f6229bdf205b824177288cd44c41c6af7575 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c60222883982e25d72c0cb91609889b104d83288 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e37d96297ef059283e03e1eb56af0792df8920fc |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0811b1423b3a91f622f7cb30afd3039130666adc |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/033e96cdaa3c0794fb52801e9bf70a9bacc9cdfd |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c84c8b41892ba8d6d2f64ec1005438dc844f4b32 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e997a79d9dfca06cb0237e034e86d8bb118e51a1 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/23b19560c0ff53151338edcb308b2748cecce179 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/6e690b5f6cf66570ce1c0af1f9d2d72ba9c78d29 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/64e42c37889dbf1c7f61b43c4cb8cbd549604386 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bd90dc3744f23e896233ca77eb3952e1bca5a2e4 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2eb4a1108da13b2b433705b8e150d2a9623f5397 |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/313ce37ab6655a1a5204d7d5502025184ec62c60 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9429c8e88576dacadf3bc58733298008dcf28400 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/1979bb9cd022a08ec873047649c7c1f5747ee485 |     
    sh4      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d7e1e873d4ed8da0d4de8185f762d1de269dcdff |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/c7137a659da33c5eb0eaf0907e9f92f046627c6a |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/06c02cc0377572cf13224e2a4c2d987ab246e73d |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2b31a27ed4884169dcb1eb64586d721019891a6d |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a4277af681d7efa5349a34720f36f559c3f5b1e |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2b955a7771ed73ce2cc14d5e097fc320b4c0e958 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/62439bdbb029843749fdae70f1b0f965fbe012f9 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/af4c974b114952a73f45542026a319785461144c |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/bf8f0bcf1799c17984b32dcc49891647b8081669 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cfa9d44efb0bbaba47d25d3ccc08e92aa9ac00d4 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9739e15cc41e92e3e84f02079a69a8a097133b53 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3d400352f0c218ab36eaa2760817097ee769240c |     
    or1k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3bfa101b4b0b35f4e7f7d76a96464a5b4d041406 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/690b0f60c4079b83b1d0c6e66617b3b40d40346a |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/227b7a014509d60f5635cb72e37104702c770e41 |     
   x86_64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3fb7e185189159a0ca6ca6275f2cc10aebc0432a |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ed7c790e350fca298f7cedbb29dda8cdf8b35b6e |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/655d078bcb35facbdcb438531c4da226031fb4c1 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/60ef02d7f43bf163e0dacb340170a22053f7f978 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/35805e1917ed417025ae878fbf51fc9873ea3b3c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b1852a53293487bfa4ff35162241f688f31fb568 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f7001f478cf95df29e1a4ec2b7c1777f2d7b89e4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/89f4d16b13e2f4d084f74f489e31cbeea2a5e48f |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/81f832f9d137102299eae9b090caa536f0a3d1da |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c0734c042f0924a4a7e0687354706caabc6836ce |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6d437d47dd44facc23f185fca7394c849db0b2ee |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9afdcc8d742ebdc0218a3fbd1bd8c43e346401cb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e4052a40f529225401d5a17215294d097450ab2d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a94a5aafeef35099445fedd54cd387e32de7ea2c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/cbf4da7a683ee43c24503bf703f807c1da458d56 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/34bc8048edeb3f910e4a379def56e333aad44d9d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/77558f3f882b93bceafd9c75c7e5ae1c91de2412 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c10dc230bec228e6eed60e657c644fbf1d4c3779 |     
   mipsel    |           flite-2.1            | NOK | http://autobuild.buildroot.net/results/0bd08c442c808b95991c4cd86e481fb9d0eefbee |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/c7b8fc386d2fbf8213a1c0d493adf7998f75a66a |     
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/d77d14475094f957446f0aab708e3d5201e94e38 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/463e7717d6b165448bd52e9bc59b3c2aca13f5dd | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/1bc5ed7a884474dfb78edea89fdf99b4f041fb3f | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d167f4422c6c02a1b869c7b33561cad285a293c1 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0f292aeb4110054553ee3af53e1a082b87973485 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9045e53258c982da75ab483e533c6fcae1dea9aa | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a1ab870eca19bd3065fe6dcd31a0da751d9c06b9 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2a1e6b8002ce5944afa59818d2eeb56a1eb59918 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/6b9a39936282b7b0af4f2f56181f9661f6fb9bd1 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/129ad8b281003923ec450ac5730835df35ad6647 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/191648757b03f8c205c3d2d4e62ed9ceee764129 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9ddac2986c8ec0e4770befaa0d01dd7442d34b50 | ORPH
  aarch64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/f8370b14612b6d400fe971fa20e83f243a2e2a87 | ORPH
  riscv32    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/363ba080db88d0ade20ddd4258a75f11612ce435 | ORPH
  riscv32    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/17ac305743a3e6ac0d5c4d8850cffe126cd869be | ORPH
   mipsel    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/6a07f7440298ed8629e88968be626470d399f436 | ORPH
    sh4      |         haproxy-2.2.14         | NOK | http://autobuild.buildroot.net/results/21fdf22564ec274511a4b50a7c1042570b545005 |     
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/6982aec11002c30c22555284ab105093b53443e0 |     
  aarch64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/6cbab911cd20b98f8367011d0a59dce53a2c31a7 | ORPH
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/15fe08d636f25319eee736bde513c621e0d30aab |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/13e48514352654099bfac3dd0b1d6e9906dff450 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/147021defed909afa0cf453f25e328e387462596 |     
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3984b81a946d1bea1b81836ffae9f1e699bf2eb5 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b2f8887335d4ef65b3df2bf11b9a77eb97aee62e | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/07fc70bb1ef758cadfe8c46d2db111ac3bf56538 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4bff1d3d77d9518748d55420c038633c37efad5b | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6ce15a86df932806f036b4a5beb85166c859466e | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/41099d70846cfb33a2173c0eeee779fb51156111 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/82c6615b15476c3a58e617ce43aca6ff0d80db80 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/59646877ef32b56f18991638e2c398e45c4b4cfc | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4df6a46567385aaa6f6051df50ee19f65ba55879 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/7df7cfbc28ebd192e354894758b565a79021a8aa | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/70c05c3557875bc73e89654b1ad9d4df05984b92 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/13423941ef023bbe542bd0444f53bd5c4bc6e6c5 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1238ddde2ec431f8233261edb7c5fc37a7a9e00b | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e41ce0989c9cff1bbb42703d769ce58369338aae | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/33426b46f04da57b413386697a692c3ae6e26a77 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/904cf640b32db5c205c49cefbf71cb035cb1b31e | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ed7cd40cbbf79ff1a513a910068aa2320cb6f106 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ce69b3ee900ea458b7d43ab45f0332b83e4698d8 | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4656a57ba9df7be828468ca06a780c06adc64d35 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ca2064a29e87f7d35379ca38be0c165b5d21b8da | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/26f91c6435a02dea66d4b15fa78a635c9c9f5310 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/99492bfb4066ab8866f628b0c616a9f7c6f012d2 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b3a65566c008651bceb912a4faebd3260611cfc8 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/46c102da44da01e8514a522c7d059aa4f0e10115 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bb565494126c5900aaf4d04ea3d802fa30359a14 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4cf2080b2ca52d78a4257a94e3b83ff234676661 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/df9b5b56ed0bfcbff2fa43d2679aada6f160064a | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dc25bf715924c0b71ba5c8126c23895a2884e320 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/97f5d16d644ad91c3a95bbb890b245efe5eb75e4 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c8aaf64825cb2360c900f8e25d31dd0c546d39f1 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5a43ef98a6ff9ab188c0172736fc67960826b890 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ed6f21eab0346e09cca1712b2e5c7725e25f3be8 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b84a624412afad0995ca68f213626a8960262267 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/99c193ca233a1c4409d4ef3d9d1f1e68d28c048d | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d706f3ac4bc427420d9d586923378872fee93046 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/812a82eecee928039118d4e03936133cde7152bc | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/aa3e38e054518032a2563f8cfc8289301f2ce748 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/77feb3be51c104e6b6bb16135c82560e45bd46f8 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ab74fe0fcc9e99dd26d326fb58181b79786eb5e9 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9cba375c8654c3b43454ad3f79b69736988f8967 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/64569247d066e06cd5dd21902c893892b51ca773 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d6cfecfa6f212a152fe439d365062821d1fb183e | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/43237d7dd81f78b89dade117c92062d9cdfbe0b2 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a9787ebaeeb9c5f6936e394351d6bc4b1be7ce8f | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6b212efbe34bb49e908e6e7a2d8a4c487f943a47 | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c320a215fabc2b9e58a4f53d3244fdc4c0fb3979 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/08d151daada254015436e4542674458970f67d6a | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0d465b5d3802155139dc98829a3ba8904ef50766 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0381b561d2b74ee71b6d23d18af55948937c7ed2 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/42a3b02ea4167172b12750fb0b600faa84bd6e20 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9028181065585e00f72d0040f56e510845240713 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9f69586501714cfefc25e1457fcac715ddf259d9 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8217da27ea20212ab90bac6a114ee4b61461eda7 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f3ec37bff915ab8e4736bb24c425949f6054b070 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/07cb42284d7d1187353103f26223fa7f7ac2f88c | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3eb7195d3e1ef2bd56093d56ee43a975b5096d8e | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1d2d07e01e477ccb1985d5f830f7a6ce2dd1dd80 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/09d833c5e8fb17b97c981aac49ec8cad5836d6e0 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3ee87d4195ece3232fa1acf7949ceaba6aca9ea5 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bf1d5b87389a6fce59d708002d1834c3ccbc7d31 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8a2effe5efeb17ca52269ededcf728730fab310c | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/41b6a48d99bcdb06fc5545118c22d21db0ef4a76 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/31bab85f1879210ad1e8f9458c23d15d1cdbde1e | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a37cf6425dfd4639a7d1a1e79d72d002326b50d6 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a7e434f8753d11ddf9ab4eba49607519d2c57167 | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/db7798018619f4c1add7dd34c6aa507473d53e3f | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/591ee4b4ae8df17dfc5b60ae0c40cb30122d8110 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/838800c3cc7be13b9e7519be73498f0859b6ea26 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3f712badb878deb9945b42cb74b44743caded3dd | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5f3bda477cd1b15c0f7da0934e5e8803176a6cb5 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e019991ab6e7b26083cf5f3dbe9f68f621bb8154 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8f3e0976f920b8418ff685558034578e13814006 | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/20c080d4cd05cb1e211a37eafab880202d04c27f | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b202821f9864e765c113079195d4711264f36661 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/4d0852c2d909312d338f346ce66437312939627b | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/28c75670423143ffbb00cc523d7d6ed41aecabb2 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/554f5452f1908c958c8767585672c30a72ff9da3 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b3dc893010aa023474b3d205a452347f26a5d3a8 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8d782fdb61e167c6888d8af120af3144e98f9286 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0eee96da746b4ae6e53fb0115153bfa1ef81895f | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e1c2008d524100f2d6da16ab33b483d664f7cc50 | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2bf0f1d54a043f160a840ea469adcf334aa2576f | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9c4ee4f73cb7492d742c7cf6d9616788b39da8fc | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bc2610ca216a4c00a69cb7747829d5e6d82e50cc | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/07d79e81bc5d62f591cae8083cafe29a8e1a5746 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f31500e4ef81c8cc04d221382e162c77b52b76bd | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/802c34dc7905c506a4464a37b4c79cad5b5fd7a6 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d1d74b5fb98fb0ffeb7ecb0e0c31a2a3d0677a8a | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5baccd5173878dd3d5c4ba83e249fc28d23094a9 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2ee027170e2a992d31fedad3dddea557470a8dc1 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bc1c4bd0558df469d8eca1af548040964ed07594 | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0c65a52c52bb1588f0340ad9fcd089d6be9fa705 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f04e7aa0c85f181c7f63f2a8eee16e8d84a79698 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/06da521fb126cd3aeebb90ca18a32ed1119a7283 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8de09f5a9cd904061587d6a39f9a7da35c0408e0 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/2fe34688cef1b0afdd1c08aed6d795bf13319399 | ORPH
powerpc64le  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a9b8c27a96504cb13911705e3aaa7a270fec6f8b | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/baf570c2f59a9c4456e5711d5a091fd7f41eaabc | ORPH
   xtensa    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bac5997b9939fc3332853c85c3745a4d6f9587f4 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/caef6d00adf5298d0f9f4c55b5c2b8d5c21ad5d5 | ORPH
    arm      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/30cc8e7531a2bb20bf8ccf127f0c5a3834a34b6e | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6b5bc4ce4fc3c678bc55b34ed983976ad8412860 | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c85cd30bce313c51b396a7e03bcadbc15b349a33 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/fb7018c49620ad854c645499feab8add92df0d98 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0d6eef024b0e2399cae8cfddfec86b2f693606cc | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/d4d49f646a1fc83924a48ca8a185e3107f1f66ce | ORPH
    m68k     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/74f7c5634907d6ef17ea674d262d3864945c6c01 | ORPH
 powerpc64   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/87fc23ca72e397fc5ca6eb40ea2eb147901f5530 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8ee43e8836b7cbdd3fb02c0f6f2f9890f08e7de3 | ORPH
  sparc64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/3b67581f03a00f3c801e1aeb8655732942af782a | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/17a22fe5ea19929ee797f407db2726a9c9a9a928 | ORPH
    i686     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/ed875c3735ecd243849b10119eb61e9a7d79c388 | ORPH
   nios2     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/bfb53448bf2554974c256087f3efab432ff891f6 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/c415f11fb664e04d5314b649ea2e31768da2067b | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/6b1e76f0ef547a1aa9f3daf02f43a55fdcc0fa2c | ORPH
 aarch64_be  |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/350a2f81ac6ed7d99fc5cf1fdb562fd8251d2b7b | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/405d412e9cc18e1c5a9b3c55a07702215bbb7540 | ORPH
    i586     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/e85a6ddf837fb5bf83b520e7aed47d2b1e7993f4 | ORPH
microblazeel |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/f58920cca90012ee5f1b01e4ae795abe42cc803e | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/eb339a47db12cc928f9d1847de22cbef4955fc3c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/76cfd9df7768858429b83bb7d73239114aa6dc47 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c4fa91098d26b95a59c0ddf8cf2f907f5d76a6f4 |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6bf7bcbeb2eba1fea567c479157ce36e84e29f0f |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/03949c63ff3581c1f8714b4f5bb272049fd47b50 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a81c53e508670a0ce00637009d288fabc9e63b74 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7a409291b85fafb96db4d6d90f3b3a07fdeed7f2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/56d13da080147134d30f80f1a713097daec259bd |     
 powerpc64   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4c8830afcdb185cd1c2cdd2bffedbb543b5cf8db |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8c5534dd8f278cb0fa5fee264d83b4d2d77b6184 |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/97df4696e8430dc1e9bc67c0ddbdb4c03f2a7249 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8a93631de7032cebcc2a216f8019f516443421bc |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cd47e54ab5469a661ae3302bda81e880e19acc5d |     
  sparc64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/698fdef89bfa7ddf723df17b7830d5324e82c1f8 |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4a41a10344ad6050b909e925fcb91dfcd6d8ac13 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f8d2e086cffbcd51a0b9e92e3b9fec46f6c03176 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e469ebff6139921fe55455ec1a5755cce324e18e |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0ef11a19339f547f0310fed3d293922e657c4cf7 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ce64d63a7a797f7b6b677193900f179d03c13186 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c8ed5a9bd209673cc58159cf0c6e0bf87bcec37a |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2f84c41708c101c21049fb6a348a7de9293200cb |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e6fa7bfb5f1681d980d4827069b28857395222f6 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c1575a460786355d8b3f2cdcbb0c877c17623a49 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/0b1a5ea089015d6218b5254edd6098506cd2edfa |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9fa7dfc87dadcd4be1afafcfe510e152a93eeb4d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a812c2461fbc2bad007216508963736a802be5a5 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/43e4cf75e804c3b4b51cf23cc1120d1c0a670965 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/805064a9022e356cd8f559f9d5fff9caac2c96f8 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6be66da53c7fd9bc56ca8dd6c0c06d632f964e66 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f794e4975018e82cee61b71e36cffa9d793b0f7d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/bad7570a8bfee18083e8933be8e4f35a47295798 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a5be6c101c653f2037f35f8143975fb1a2679d07 | ORPH
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/9f1681ce3d8c64467c1fc51eb3f6869d86caa787 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/ef40a5ad8849f0afc884c57d3eca1d6a88297604 |     
    sh4      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/d42aaf9253a9f4170a2ad861b1c084feda1de07e |     
    arm      |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/bfb49d54a74ab701e6c54f48b73d69d5e63cdc56 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1dd69cbcb18e45144684ca8949dbbcd2d125677d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/85115d352cbda39bca21ef0d217fd8db5034a893 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1f0a8065abdbb2bdb6226d78b6a397db5b0b618c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/da44880264a111dc6dd9833e146b6aac9467a88e |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/814eb57a780af054beb917fed413f369fb7bd3d1 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/2515866707bb406be9c5785c48b09fa9da08303d |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/de0dd94ca551ebaa1eb97ad24e5a8cf0f2cca74f |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c2579006a86226ae3ea2efa95b0cd2f87fbbef7b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/5fe86f546034768056c49c66db76e9979b20ba64 | ORPH
  riscv64    |          netsnmp-5.9           | NOK | http://autobuild.buildroot.net/results/c8d39b44c31799bdf9afd05f050d454f1db30240 | ORPH
  riscv32    |          nginx-1.18.0          | NOK | http://autobuild.buildroot.net/results/90a9bfd68fee3b35f00cfa352445bf0803f152bd |     
  powerpc    |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/e568ed5222ba0e61eec6caeabc6d4d3577afd5bd |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/5b973b57f93640739be28ade918b2a09fa86569b |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/2fb2e9129b07ecfe39ff9a75e1eec8ea7dba2fd9 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/6e8b3e4c70a9f8306f32251f2bf306c1cc39b3ee |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/cdf01a0759c475dcaebfa498edd88a643df794f2 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ef3330d79d8e5f6399f84dfad293523bc388ae8c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/f606a98ff42299c3a4c0a01db84906fef6108dc4 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/65919522e64ea1e8709ce06a7b3d92ababca412b |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/eab4893570266dbf2df81c3af3d8de514f88ef0c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/03916cbc151b5b9aa6b728af50d2567f07fa9680 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/0d3d2c44efd1a82cf5126f5354bbcbc81f3183b8 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/c9f73c365b92abbe501ea127b9a8e4e0735d7e2b | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/eb07527896d11e36e1ffdd83a8b779de4dd3988b |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/f48bfe3ce5275fddd6bdb9a41a31cb1339dcd0db |     
   s390x     |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/1f277eba737d3c5cfd17f4738daa1bba3c2e96ab |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/d2d7c7e6f6ffcf17af3f760ef704c081d9446b24 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/f6b229d874121b13a245515c94a4548cec066e7b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e1dbd48a2e54ddb5bbe2107a3afef8ec338f46be |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d12d9472a4f2915e8b85cb81a55fe2ad42497e29 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6212f7109347e7a53317f594bccae17690da4e4a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5744524cd2738a957e3444e2b31ba4d4a4f4dfe0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4da84ed4a2d09537e207938b3f30e41a80683e30 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/be4b08da5db4c70d3ae9c8cc7da7db2e7881d5ff |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a82c6c15e853e1d55e7cbc0654af85985a3398d0 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7a447ac2f63649c6edc93aa085dfbf6fe5df39b6 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9769ca3fbc6105b0fda00bd9b20e47898671801d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bd483bdffd52172594f3a9ff58f7218b571edfef |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5693d02aee690953df1c13deefa3824db73522c7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d2ac7743676a535629da0bea5ac20bcef476ae0e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c27b79ead5f4000c87819dd43d4b0e4855c2bb16 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/19aaa1b363df2c16da4b63bccf334c46a4590f68 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2585c973ffff950ce61d6b00b4ec2ee734ad9f39 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c61a729c5c9665f23e2a20cc28d97faaaf58ba46 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5573f7b68e91481435162b732125bb496104566a |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/69f33401cb672586ade424e7f1fd70d20156e4eb |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/563af93c60787e9071988b7b6743300e3ad565db |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/33c1094c3571de2de126ee72fe6e2d97e47c27ea |     
   sparc     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/4734642501145d695a60b35c58fe4380825348f3 |     
    i586     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/af0b1e6243459a0ec0b2a510f03222bf062ea4de |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b67f81a78bf73dbd2b54c8f53d8b8a8ecce0fb80 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/70fe9681050770b96f064a61b27717b74313ea89 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/a006339df5cd8bbff82ee6d1d6adb72f74f0299e |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/52eb5449434edf59d733db189307168931ad794c |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2640a3093a1b30231231a8b1f57d733d4dc3208e |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/ecf6b0ce4c0ac937550f93bec96ab1771fa3b5f3 |     
powerpc64le  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/368bc0cd79576164610ed7aedaf113c0cfc691cf |     
    or1k     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/75ce104b151070aeefe177fb8918d9f615871031 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/7f7bb44a8ef81b04efeb28b6c0d07d82296f98b7 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/42e123d2a845cec983b76ce6417799ac8b02bb64 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/147180c0c4be5e676cce08290582ac74acd56ab3 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/819acc173aa5708280aff9fe5823421ead63f922 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/b1a451814c781de995e60bfead0f1b31136e8c98 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/0847c7530689b6b167c320157f93172fb25ff2d3 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/6556aa7e1e3e303e6658c046ff5ca1d690a17600 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/a7cc047e41951dd1fdc3a806cdaab51bae0f6f1e |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/8e0db43f33e864bc458cd22b323f9eaff49ddbea |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/93fe248a7791ddd7aac88713b906d8d46633cef4 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/7c928f9fbc36d8728b7b6389490875fbfef07fd9 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ba31c97a87e974bc208aed506890da66744321b |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/92ea04729a30807b60f921f468a09b954b6af6e2 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/7f9706517b08afcb0e2426d934bd62e4718f1854 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/63ee664308b095c2f97cf88d18f33bea0fcd470f |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/f25b5fab30c1029d35e2453e5ddecdfffddc61ec |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/81af5f318f0aa826cfa8ded36808b8047e77d9af |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/5731052ccdd94ad0b98603d70b0ef8c6108daf5d |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/cba1c6d429afea36b4455222357c4177ac11eeee |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/37440b1a26334a29c5bc52a25b6ec4bf2b184919 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/933a57fabcfc36cd63f4fa7f20b30e268d0065ab |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c075d01f74f33a37b7590350fd9095b5da189bc7 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/58909675927c7e408f7e6a8a43e502d5b907a175 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/6b11a50bbf8ccdb325a8d9e82f6bb35313f7c973 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/a040d5ba5a7d43eca05b66808476c6bc9e413b94 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4cd51da78b66b18ce1b839291efbe060a5288c63 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/caf7f3ecfc08033740a3993e5a1370a3a7bff02b |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/5c35b8253d107f6232ff740589e1216aa28f4c04 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/57dff2ae6d2dbd3c2ab152e1b027ffb04d78bf90 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a8896fe0c17f7c13f4077b85129415f939b0c626 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/9f77bbdef13ea1f7f5870d43be448d10c5f5b6b8 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/9f3b7cadf9b783a9b113578bafb8382331e0220e |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/77fc642db97d7acf4f3b39606e2154ef0a8899db |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2bada512236f8fb2e53adbee45c7d7be287ef74e |     
  riscv64    |          xerces-3.2.3          | NOK | http://autobuild.buildroot.net/results/20b668ef731cb207cef49fa5ebb556d61977a407 | ORPH
  riscv32    |     xlib_libxshmfence-1.3      | NOK | http://autobuild.buildroot.net/results/fd753b6adeb363f0ada6745b20adc2b08db795b1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dab53f6ec0a7808eac9aeb54c0885a97f48e4811 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b42d8b79bb61001c8e10fb107e8c2dc664b9a299 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c6bf44370b87b5af065bfdd1eef5feb5ed38cf58 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ec80aba562270aa3c7baa7beb719cf89c6cdc966 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/834aa41c99be2c7380f137df987a874c444a1120 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4a9fb4b22a6777b27d533c2d9afff4b8bd5a677f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/09225d56746c3768f287b1329dacafc15aa614f3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/0b1217b2f3fbadf1abbee603f4ea5786885d3339 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/580e08b2f5eccfc7e780ba5f73507d9d5232c2ba |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e991ca0f71ca9923dfd951c25afc1a0db9606ea4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4c15922141d7185ae3da83f84c5f6a06892e5f1a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2ccfb480d66fe22325343b40e7bcdeb495e8afd3 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/99d0c75286fb30a514f2024310e718f8641a1f46 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/86a3a6a7b76508a4a01014f91e0962242ae9a294 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d71148b145c9266aae0d4413a06be443f1cf7a64 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c905b7a943e85f4411035ef79fbeafeb40495260 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/9648d6537483a4b6bf49b91465f8c307d13a456d |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
