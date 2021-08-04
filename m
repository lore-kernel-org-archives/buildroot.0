Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D102CC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 07:18:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E10860F8F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 07:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E10860F8F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB1FA400FD;
	Wed,  4 Aug 2021 07:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_B_oD2Omdsy; Wed,  4 Aug 2021 07:18:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B1740198;
	Wed,  4 Aug 2021 07:18:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78EBB1BF954
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 07:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E4626061C
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 07:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yC8meVP__oiA for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 07:18:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1796E605D2
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 07:18:45 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C0EF510000D
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 07:18:42 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Aug 2021 07:18:42 -0000
Message-Id: <20210804071849.5E4626061C@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-03
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

Autobuild statistics for 2021-08-03
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 373 | 132 | 21  | 526 |
  2021.05.x  | 407 | 104 | 17  | 528 |
    master   | 1504 | 695 | 66  | 2265 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 55
openzwave-62444b0f979c337d2... | 48
          refpolicy-2.20210203 | 39
                       unknown | 34
                    mpv-0.33.1 | 33
                 pixman-0.40.0 | 27
            erlang-jiffy-1.0.6 | 24
                  zeromq-4.3.4 | 24
  gobject-introspection-1.68.0 | 20
  system-config-printer-1.5.15 | 18
                      gdb-10.1 | 15
             libmediaart-1.9.4 | 15
                   gconf-3.2.6 | 14
               capnproto-0.8.0 | 13
                harfbuzz-2.8.2 | 13
                    mpd-0.22.8 | 12
                     gpsd-3.21 | 11
             bluez5_utils-5.60 | 10
               libfuse3-3.10.4 | 10
          libmodsecurity-3.0.5 | 10
               nfs-utils-2.5.4 | 10
        host-sentry-cli-1.57.0 | 9 
               apcupsd-3.14.14 | 8 
                    ffmpeg-4.4 | 8 
                 openmpi-4.0.0 | 8 
   openvmtools-10.3.5-10430147 | 8 
                  polkit-0.119 | 8 
                    qemu-6.0.0 | 8 
                qt5base-5.15.2 | 8 
cegui-00b4e1fe174da53b7ed72... | 7 
                 dc3dd-7.2.641 | 7 
                         glibc | 7 
kvm-unit-tests-kvm-unit-tes... | 7 
                   libnss-3.68 | 7 
                 mesa3d-21.1.6 | 7 
                  mupdf-1.18.0 | 7 
                 openal-1.21.1 | 7 
                 rtl_433-21.05 | 7 
                   erlang-22.2 | 6 
                   guile-3.0.4 | 6 
                librsvg-2.50.5 | 6 
              libsecret-0.20.4 | 6 
 Makefile:740: target-finalize | 6 
              open62541-v1.2.2 | 6 
                xenomai-3.0.10 | 6 
              libostree-2021.3 | 5 
                 libqmi-1.28.6 | 5 
                mono-6.12.0.90 | 5 
               belle-sip-4.4.8 | 4 
                   gssdp-1.3.0 | 4 
          modem-manager-1.16.6 | 4 
         nvidia-driver-390.132 | 4 
                      pdbg-3.3 | 4 
               pulseview-0.4.2 | 4 
                   sdl2-2.0.14 | 4 
    trace-cmd-trace-cmd-v2.9.1 | 4 
                apparmor-3.0.1 | 3 
azure-iot-sdk-c-LTS_01_2021... | 3 
                 ripgrep-0.8.1 | 3 
             s390-tools-2.17.0 | 3 
                suricata-6.0.3 | 3 
                      tar-1.34 | 3 
                    zstd-1.5.0 | 3 
                 apitrace-10.0 | 2 
                   bullet-3.09 | 2 
                   gvfs-1.44.1 | 2 
             host-cairo-1.16.0 | 2 
                 libebml-1.4.2 | 2 
               libgtk2-2.24.33 | 2 
                 libjson-7.6.1 | 2 
                  libogg-1.3.5 | 2 
               libtheora-1.1.1 | 2 
                libvips-8.10.6 | 2 
                mongodb-4.2.11 | 2 
                  nginx-1.20.1 | 2 
                     php-8.0.9 | 2 
            qt5location-5.15.2 | 2 
              syslog-ng-3.33.1 | 2 
android-tools-4.2.2+git2013... | 1 
  binutils-arc-2020.09-release | 1 
                   delve-1.6.1 | 1 
                dovecot-2.3.15 | 1 
                    efl-1.25.1 | 1 
                ejabberd-20.07 | 1 
       erlang-p1-mqtree-1.0.10 | 1 
                       gdb-9.2 | 1 
                 gerbera-1.8.2 | 1 
 glslsandbox-player-2019.08.23 | 1 
      gst1-plugins-base-1.18.4 | 1 
                    gst1-shark | 1 
           heirloom-mailx-12.5 | 1 
                host-go-1.16.6 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
               libgtk3-3.24.30 | 1 
            libodb-pgsql-2.4.0 | 1 
            libqrtr-glib-1.0.0 | 1 
              libuhttpd-3.12.1 | 1 
                 libvirt-7.4.0 | 1 
               linux-pam-1.5.1 | 1 
          lua-lunix-20170920-1 | 1 
                  motion-4.3.2 | 1 
                   ogre-1.12.0 | 1 
                  pango-1.48.7 | 1 
            perl-net-ssh2-0.72 | 1 
               pipewire-0.3.32 | 1 
           python-pybind-2.6.1 | 1 
              python-pyqt5-5.7 | 1 
                          qpdf | 1 
             qt5wayland-5.15.2 | 1 
               qt5webkit-5.9.1 | 1 
            resiprocate-1.12.0 | 1 
                rtorrent-0.9.8 | 1 
                snort3-3.1.6.0 | 1 
                  udisks-2.9.2 | 1 
                  uhd-3.15.0.0 | 1 
             util-linux-2.36.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/138f57c81987755207c81fbfd475066ce27e581b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c9827ede62bcb415c3afd63ef03057fe7f91c8e6 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5ddfc106a329348c0849680408a371210dfa8789 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/ec6b4d4d47d96fd7a35c7dfba8faf7c4a7e724a2 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/44ab28bb16140d65a7554f6c34bb08d0b21b2049 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/9eecd8bd431f652b6698b6fbb772a9ac85276bf3 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/afd551bdf9cdcfd0b1999bca38ed63c0f298fc90 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a6698e13300506205c5f4fc4b6c52759aab4c3bf |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/cb5a1ecf6ad7a844d2fe2b9a8728e28924e56771 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/d8c350630cc8fb5d1175b6c74827129a86dabe0b |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/a9ea056058aa13ed92795081dbff504e570b7bb5 |     
  riscv64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/d9566b92a75829a9c968add138e5c6966a728f48 |     
  mips64el   |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/39648113f38e7150b71ae51bd7fb0672957a0015 |     
  sparc64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/a137734d1fc3d02b17e4027fac99535bbeaf0acb |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/05aa0754ab1b212888c00feecacde795e3627ce1 |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/71ba4f83195e9d6e448a4b6a1322998e4eb4334e |     
    arm      | azure-iot-sdk-c-LTS_01_2021... | NOK | http://autobuild.buildroot.net/results/11a6eebd0deea679683a93a5c8355d00acdfe51e |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/3db8a4541bc5536da3b428f6563965d763253b40 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/3ff9f0be7c7c39ebc7c05354e1628b1fa2cd4212 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/e3667bc38044865deaa2187e2591f47299fd4312 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/203c5a918a8e8f86bdb4ff78f7f1ae79d4b87033 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/a0346ec48c2c57599704f22cac791a0b490d31ce |     
    arc      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/5407247fd1bddf4f1a4c96801a5d7546cf2df314 |     
  riscv64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/ffb7d5c58843a3a4553e0ebce6e721f7837d31c5 |     
   x86_64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/33e418ee85ee1cf89fc1373c0d016e27a213bd4d |     
   x86_64    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/ad1e492de646602ec514b7ccc32fd5eee41ec386 |     
    arc      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/660c1e7dee43fa441662e82258d33c59454ec36c |     
 powerpc64   |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/6d8208ce1f2d4b719d6e6fd3caa0f23a8ddaa18d |     
microblazeel |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/4dbc0ebeb1a251ac97368e8104ba69437d97b1da |     
    sh4      |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/df4f4c8aa6fbd62df4f4316bdcadc1325e5bc5e7 |     
  powerpc    |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/8d56f425134031edf701b306f6a27d47c2fb910d |     
    i686     |       bluez5_utils-5.60        | NOK | http://autobuild.buildroot.net/results/b47262f79f39965c6d13f430a9a8ea1661ccec89 |     
  riscv64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/b4f3819832010c95fc981bddf2a89567c894279f |     
    sh4      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/6195110bf1aa857d1b7ec389879c56b499cd8d53 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a45fda2bfe2b39bceff4348338947af701a62875 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e21803f28ed6ce7c765a374a8d6c85115ca59c26 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ca8fb344423fb1d269b2c50823f0b76e11c76490 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/163811440981a4789611e0f26743a748e8e4a69d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9da3e4d2b812702a27a1380b7c0e98b45254438c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/97fdcca826433bbc685a0a39af32a8bf91a1cde7 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8de478cf23185a417db4f93f15262f5f4017d860 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8709b8881ebeaa23ff7a14a0ce3ef7d2b31767db |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/245d5356652400318fe647604353381232aae623 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/228a7be57db3c0d4388c71b4e784ebec255861b3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6e8737eaa4bf12882fe1eb135ada7b7ebdddc4df |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bbb984f3a7e334b2a426ad9eed721e43ae29ccdb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/583c32546efcbc7398b7b644b629db4f1beffc1c |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/c3572cf7e0892b77d46b3cba6deec390e175c5e3 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/ba893ec3e1e7de8d730a35c2d2e5aa8ba7943902 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9a8122b4d3d0aa9d71cdf8d21359411b130741f8 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/7a0629957843ca7c736054bed70f3847de8fd502 |     
  aarch64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/41d10c09472fbb8481a72c4f8bed789bb15bb3c2 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/f4922a47b746d529ecbba8458355d767e1f70966 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/0a82a4a5bf56f19d22bf98377de618b2918bb487 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/444bab4ba6864ea402e391a31f12011026e602f5 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b21a739933c42a98ba53c175d92eaac9c682a97f | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4a600960133dfc31a865e6ac22bbf68164986ad6 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ff5573614a7d47f84ba2f0b4d373ab833ff59eee | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1700bb14c2b37388922f870093c1ac22f9d86240 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/eab60d75a8b07a12fc274e54d9c49e519bad53fa | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/f4b4503c5d857a81ed50b36ad22c65e35b45015e | ORPH
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/0b2801b52ab7e42dbf8d623baed411813f02d3ac |     
 powerpc64   |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/6aa73ba75f3cc5efa2e6300cca5717939cfcf832 |     
  aarch64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/8c3598243b934ef8ce96f1d123c40475db86da0a |     
   mipsel    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/d1c73024e33158f19bd9e9d0236198af8a21481b |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/bcdba1d9210973862eb37665c970ce0483ceec72 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/f7c3f0ca4508e5eafde9de6e0148370e834bf179 |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/cffb1675d1bdf0cf3c05be1860a511bbb5772c3c |     
   sparc     |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0ee9bfde7f2906bed2793458d8476c118a7a2ad0 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/f8ea9ef11c3e20a63859094f3543d71a431e0631 |     
microblazeel |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5e3be40177f7db52b078ddbbfdfd7e13fdb05170 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2bfc836756a41731e5ceccc106eac5960d58f15c |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7941fcce395eca7020127270692761535a48efd6 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/81084baed460bfe495416119564aa4ef0fc18cc6 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/3af2975b60ebad6abddab4e7aa57304d1bab552f |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f1c3b562ab0c0a38fecfc10b7905490f0b5aadce |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/984e040e39cf2a09e21581a7a848e2132c7b4308 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/153dee3ca1c258ce17e0b6e3f2595e3dcd6ba8e7 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9288afc954d3067626a22e4a63d03a18b1876df9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f5f9d05150fe2c56778e774fcd3cdaa3ab877d0c |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0e895a01f591fbce6d05a78de30a05351dbf746a |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/8f730847f84798b7d7bfb0b08932952c84b11c7f |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ba31916ae79d68b28521638580eee3de630448e7 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c220d188bdf311aab86dfaf07b8bf4404b05888c |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/52a8ff65682cccc952f14ead3e65962bb2a93831 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/48ac77b27d3a0c219453e79d415f0a050edc3d1c |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/296a5fa1677b10e68ebde3dea4017fdfc5f798d2 |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0ad7313a2580ca5d92703714053af400728594e1 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/54f3c7b018c3634e3db3cc2d938fb18ff72b8cd5 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0249bbc203958392f74e4d5ca1c579a1f7529936 |     
microblazeel |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/36a8cbec838f8c5515e7c06e207f9e1fea321f26 |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/23bfd983e3bcf79dc0211dd0c2caef0c560f8719 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/9309c349748c81c6d6de6ebc4a9a658769247e3d |     
   xtensa    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/dfd1ae09ce81e37680bad4059915f9aca2a44f6f |     
   nios2     |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/426e9863b4a048382829b02464f9ffdfea1084da |     
  powerpc    |    erlang-p1-mqtree-1.0.10     | NOK | http://autobuild.buildroot.net/results/fe33d806fb2f7a037d1ccafe403d5fb2ae4d52c8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/84abf9894cb0a9c967b4e4fde76060ddc3709b52 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3b41e5866c688b6d9c4b67b5ab03b1c4ca90e85e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/90da3a25b59858969dff86ec3929cc981f015e77 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5c8d375a3af9dd75cdaa2039916f0fa5d1fe7854 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/27439b4c852246c08e273e183eba454d13b3506b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/b298107ad466b3d9f508942737c12092ab199563 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/39d27007988c6bbfee878e4efa5af4df866fd1b5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3b5415603c650f10c44755d3070c80852e182a16 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/19bf9d017c0582445f990255d77f1fea9ae88cff |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/c2e966a00d35fbe4e82eef9035872ca3163949c6 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/abb1e3f95d084d7da3d7cd2968ee0dc3bf3e85c8 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1e814c5ffb668575a90564894fc59facd3ff2a64 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/96502e1dd2a8ac0daae3be0f1b8d04d9acdb401e |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/acd7649afd7266d2fbbbf72d0b78481b486cd909 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/550a5057cf91cdb55573b5b258eb013f5246cb0e |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3cb6101684252d310166588e81d2b744ffff7f32 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/1b5aaf35ad73421933a9da6c75e4537198e0b24f |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8d906a5b8c3cc1261f52a220ffefd383019f7d47 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6f6cbc016b4e5cff413f55041f0517148f10ccc8 |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/000c2ced31141f43c901e6abc75fb91a7c50d4a4 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/246dceef57cb1e06b928783a3e60bab788e37e87 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f20964678db41565e0eb27ec31c6237998d5bd97 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/909533ddb814ac34a28eb7f78eaa826be606899e | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/f1e63fb691a3ed59de2359ddc3943c72fd1437d8 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/117ef12c239b0c8601b5127770c293d5d2911346 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/36df787488fc44f6ba05ed3273e99c5a1bdc58a5 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/bf0e9775d8e0dcd689c069128db4cffa5adb8a04 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/43103ebb4382ecdc198e0b5efa71c5cfc8ccb58c | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a1998aa7ef48a2a1950260656d8dd86ffb821dc8 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/c7531e708ae95343bd7be99fe4a37d3c7283cccf | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/95093ed533bdf40d7c8585b318939b5848d345a5 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/143261b21af3c80896df5359fbd9fc7be3a1e8b7 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/77e8c66ee6d490188187c52ea0b2cd8970bf8b26 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/21080dea4bb25dad346651e9e381bf5ce34005a2 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e38812875137576080ceb0d817314de18f31867e | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/f364ba401502e2130e9d882f5cabba6a2260f8d3 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/c693957c700d1e372600a4dd4608a378034d9d4a | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/67bbb4217f2404d68c6e5d14e0bfae4a297883f2 | ORPH
   xtensa    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/6a374c470a082c5061a45dfc3c6204ca747f0352 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/ca29bd0f58ab6f61cc4bf717f0c20d23bd7bac86 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/ec9fae073c53b454052fe450f58d5cc355943488 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/2ab52d46b00543a479db45b6b8ca27d01f3d3beb |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/a8c76460bf1d2edfef0ed4dc4f7e46e2d0df9407 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/8c1e6f9f3b741a814ffe2c7ffdc93925f7cb35fd |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/7fdac5df77499e3180c54f11f11b3c1e1bea90dc |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/aa069df7699ae251ed8fff5b8d856716804bc2ae |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/8d6c31ea42c70482518bda91430f5bc13e07a289 |     
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e58e3f46d0dc84756eaba1b356b06023371f47f4 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a480d454ec3ad14b4b8d95a571d77a93a3903e20 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/984b46d0c67d1b451ed5744be9c1f6a85b72aea4 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/f7096e8421faf2da2ac1e746374804c1305bc7ce | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/d9fed755c817517ebb298243647a5697f564a6cf | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/84c8abf183abfaa5af130e82f9a396225d9ec4ba | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1399cfa0768b306e85e74921220581d032ac8de2 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ccbbc4e3ada2fafcf9253c284bd12d15f1646b49 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8a233b843860fa3f4f036f94b7145d518155d459 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/76ad29bb73277956bccdb51a2622d87db20656f6 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/413dfaec26ec7653477b704be90074cfddcfa292 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/725bc82dbc7e914326fef761c24c183529ff27d1 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/e40c491d97a329a0ca1b8d7d1cca6fa4dcf2b4a4 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/32e6fb511f33972cb122af60f424eab5e1416007 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/cc9b47dd532838a3469bb1d3ace687ca1d9b8f04 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/6a5bc1c686b003cab1e242c3151ab6c82c9e7866 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b60f65399e1ac18aacbcf89fdb0bbbb7d3deb531 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4fb6cffa84f920190c741c76ebc36ac7efe9af45 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2b0b3776473825262141a24e43765cfdef5c1b26 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/11d8ed70c42c7a24673b4ce2a4c504828abcc7da | ORPH
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/eaec757105b776c719d096e864de4ec62e74e6e3 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/4fff08601748342e9f962855a2038885740c1909 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/4a17083ac9376d507a5ed71cc07d5935e3806c6c |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/611209ec9c7fbbe0958a35fe5d95ba84fc4182f2 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/b573407de2d255277cfd94cae3201f2bf5fb3fa6 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/ee6d98fda032b9f13d45c656f7c803eed649ba8a |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/fab33f25b08fa218af91640fdbd8c0dcf1d07228 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/c02cc536bf4248c802c5ece6cf499c81d9497e29 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/625d146c7875910ecc546829b271840d3786b286 |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/de0b544f72e1fbf590624e73e49d00efb4e6b45e |     
microblazeel |           gpsd-3.21            | NOK | http://autobuild.buildroot.net/results/ba1aa625af6a9a97663fce57a1c0c06880e35fcf |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/d1c4c7373638c5831a98be38cb37d60977e1f0c6 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/3b4c31b4e003f5947fa6210d96ac7c1325f08db9 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/f132971af201580a613255894927cf5e60de0e39 |     
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/1e91685529a6745fc5605b5bbf3a8455fe23be33 |     
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/90c5aa2a86c9b49292cc0c8d978655520212b50f | ORPH
  riscv32    |           gst1-shark           | TIM | http://autobuild.buildroot.net/results/b17a37cd1c3348cb7c7f466f852751eb5000c8c8 |     
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/2c2cdaa18180f054f5e614fc17a6d4f8cf117e93 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/49bb2021d52c826425fb927ba2c544799874497f | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/9b3f309fd05c29eaf6c99aa2465854b2806b5074 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/352facec31904de91fbc9682c3aef5731d2e4bab | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/bdfd22d0c296bfb1f256d61a2527e035694fca77 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/f2aeaa5ef5ac849e63c3cd9ceb78de49d0643e2b | ORPH
  riscv32    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/d595f028c13fd763aaf8d39d0c83a45bb052cebd | ORPH
   s390x     |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ed672d8c34840decb8a0f19522c7cdd2074e1453 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/038a3866f999c0becc7828cd57ea9aad34896ff9 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/f865855d3e89e72ef9bd2bc776e008f24549a1b7 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/53607fed3b8d648cb08640f17432574fa4fdf637 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/6f66d6423ab13a38e62b09eba5f6cc2ed1fb4bf7 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/ea264368fb9cf21026e95616922882dac099f9c4 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/08e951fc4f25d280d9652048627aa271539cc95a | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/5a70606d01a6bcadea4ad3d04128f07dd43b7f2e | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/028f02798bb771c4648c282d4c8574b9d375c5c8 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/9759c446e76a16d7cba05e786d33694ffc6d639e | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/61b33da5c2460acb121aca85772e18b3152cd9ff | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/84a7755154e8be58b8f076bd61c6ad6d25fffb91 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/9d5ee64add6cc5985df9e6a749590ef8ddd5ebc4 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/f93fca7b31fa29c645eb411d6561410bf4dba55f | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/9405d809cc5b73c05eb7745683b1ae793c83f8b7 |     
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/2c2e059dc50057530c46e033e36c897e92f9531f |     
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/6cc256a026c3feb8a62d28ea278997e0ce1a0a52 |     
  mips64el   |         host-go-1.16.6         | NOK | http://autobuild.buildroot.net/results/81a3242974da00d52bad386960072585c16ad966 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/694388d91f775d688d1c131a20767c1f2699c15c |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1ba89504f388da8ca89c570e3bb0b3f7c675bd2c |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bb3eccff3d7a798817ab94662007aacda4333c02 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6d1f5ab7efbe10e9e2c79146db57bacd9851ca81 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/38f6cd42c321a548e8a3587a59682d59e38fc117 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/dc2daca4db4c7ddbb5c6cd599c3a4b3733939b4a |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b1dc3bda9c7857996a8d87eb9fe8421ca097584a |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/b32d669b5d1cbbdadfe65417d508e8035d3f0727 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/aed80acb089fd6cca8aa92c26e615441c06bddbf |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/973c0ced9379e61889347b7b209adfca6ec992ec |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/df7796c0e4c0fd843e8d2923f1a0aaad9d50f404 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/41ccacbc17f4f17fddc70c2f15cff051b5753303 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0e24a57655d137cf340d582cc8a99e4cbb1de2ea |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/982e03a76c97b8f35b61268874bfc104381f6cbe |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/f2ba660d867b04977afbd176c6aeb45438aa57c9 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/208c908032a187873083e824d6cb9a30efdfe280 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/10414ff8392d9a6518fd6c643aea3a86cac19b71 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/f85fe5aa4ca1d18c5525785bbbb41013af522560 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/dfc8041de231637f27482f4e0e04862cfc3ca050 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/8ad15903cbb0969ea4f9b587252b79f3b220a792 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/5cb0946b05c1a9c2fbce350a5aa592365103a6f0 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/79553df59d79883292c5e1764da90cb4af9b26b5 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ab13b1d5cfcf52303be7fc4b4cd9b38e5f5c9fcd |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c6f01ba3e7845663556023d4bde12601f3e7eb27 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/44b7ab8736a8cdd5678fbfb0d7bf35ddc76f8eaf |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/a6423ced71026c12fefccbc74f8a2c9f9d490866 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/03b85f2f6daff82e2017f6d2311fe62f1c9a7227 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/90b5bee88c3747ed65e4b20699898cb82e374baf |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/fc779ddfa0a48c7fa2f1cac1a4cb430bd3a28f07 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/6ac7be933f969e51e64f30789e0ee75bc0dd7ebe |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/486e93edc160b61b35f15ce88fafca01dcb05cf3 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/022269afebff60418714af9f6cd7b4c177b39e71 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/046ec5c373b7734a2d047fedc6af0d72267d2c14 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/5b79a896114c11d8a7e351f86db6252f96eccec1 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/7f4949afde1e37c6ded8488c27853e6d58d1fa19 |     
   s390x     |          host-python3          | TIM | http://autobuild.buildroot.net/results/53d51ab704ebe9541442436fb89e55759e9e8e17 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/78349419166294e804dac8a6a71c521234c7692f |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/dc32664ed8da13ba739ecd55900b54a64b9dd611 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d48a2c6ba1ec947fe5550be64637ae9470fcf8d0 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/96a9f3872c4fa4933347543e69767250fc484b22 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bd326b0e169fb59cd9458e849162590825482a37 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c82b00658bb19f7966d06f077f34138179eaac9e |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/dd982c43b01c18bb3e66711ccd1b746b7979b3af |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/4707be4776d547d4637e4c51df00cdbadcbdbdec |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/e9771a19beca632e941fe4bd45c3f5ceaa091e3a |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/689e5a9c0e76d95bb3425088db383319377a13a4 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6c06e8c7bb65d1c708fca5efadd83d9a82a2ecce |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/92d94e4240e5021a7ac69b4a0c95041c0b7b647f |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c3b31f1d70b33b91ba28e122c2e12d881c7300f6 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/31167ebc7994632ff184b48180dfc5d505124af3 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/69831a735c8432aa82a31a593cd30b16c521d544 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/638f964b14b854b81bad317f14d89b402a6e4fcd |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c71c351b0f765ec8f57c6797fc3d68e998b1c7de |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b31271581ef1b450fc3fc71a8fcf8c79a47dc502 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/d71e76a03b9f949b8e3f343f6ad7a45ebbee2a1f |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e99d1eac8b1ddf575fb69d5bc50955ecd29549a3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fe1592bdbf7e79cbe2671ce292c915c06f927b2c |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4f8118bb197946468661984735bbe202d54b3def |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a76fb4648a873b09803088eeaadfa2e81724d826 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3c24167dfbd21661875df1e8e13e7070a7682dc7 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b0757b156d5adb3027b8ec30716016f708b07c6c |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2dee49e995636d5df93878fe37adf14f3ff7f83e |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f267c278004661375330fd5c5106297994d6c5d6 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5fff940ee96fe6c3c5b49722b692e865a4f74398 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/8a07128d34ea5b371a2e0164f9ea0b3731ad2053 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c4b1238b76c258f05cdac2624b15a2280f025d74 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2bbd61fd7588374aa36b2a39608da0748c16a9a9 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e7aa59f9317e1ca8841a7b9558bb1184fc2b0c66 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/003a1f7838758a541b8e608b7d1c4a7e935dc3a3 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d54fa96cc32bb3e3b488460fbe7b2b139757f143 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/069f76000aed7859b86293501b513be4e19adb1e |     
    or1k     | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/9b891799d38c01c6f568fc12e84e7aa543d45ad3 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4b6d7a843638ab19f05a4ba7fd1299e543343e20 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/01639cd7a2565411b5d103a19e2aa10441d2dd40 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/bd0ae670aeeb8ba245bdfcd65bc46529df094985 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/e4613765173738ad215b06f19cace8d39071b567 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/3d23dcf18cc70be2b4fcfe77691e5dff713ed4ce |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/82062a652d041730a0ffb66a002b47175d4bb124 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0878a2d13698cada98e108b05362ddacd5ed647e |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/9377d62d30449f7435a7697eaba24431c7facb92 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/b069a51e1013f63c5dd1e0848e3578f076ad8206 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/5361c7c9d66247e5da570be40e22f3eead3824e3 |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/0f611868d1c7b037946a097f5fee88d5eb662b3c |     
microblazeel |        libfuse3-3.10.4         | NOK | http://autobuild.buildroot.net/results/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/10099bfb358fc2fa78b4f8fe228c6e5f6c61a8c8 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/71cdcbb7210d4e1846f7e01c080979674317071b |     
  aarch64    |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/8e99a2784217b0fc1f0cca5e7202d17d97e78af6 |     
    arm      |         libjson-7.6.1          | NOK | http://autobuild.buildroot.net/results/452218773e4157c044f9086255d14bfd75f49b0a |     
    arm      |         libjson-7.6.1          | NOK | http://autobuild.buildroot.net/results/e4d7ff05443c439afbeac4053693d3801db25a5d |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/89bd626ff7483098f7f226ec26b5c1a6b3da1c01 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/481f8fd988d3e490bb68bbd9d29e3df1d4702c5b |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/1bfe142cb737040c024b1d980307c113f146613e |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c5cf9a97aa2f7a5983ff575e5e06e5dbfbcc44c0 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/13dd7ce4ae6d0d73e1d0ec72e27a8fb0a06bdbb6 |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/1a58552aa4e5f0fa525ced09efa3f6e108adf4d9 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7e479a1bcbcdf3b69e0c11416fd48a7a0e0c92bf |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/0767c42d54e2783715b7d9d63729a9a1f7de8146 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/259c083172a8dfe37db20256f04cfead9cbf4930 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/9fa52cbfc63ecbddc5c193210a0dc3ee9864ef5b |     
  riscv32    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b77765256948d7375610f946b53e98f4e57eae1a |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/b3a2927b4c015570992652ef2839617807dc9693 |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/aceeaf5f6a196f4dfef87224b7b1a6d983bb871b |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/a8885578701fd8edef88bc297eb97ff9a530ea59 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/4892fba1b682517bef4285a62c75cedc4e9d7a15 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/37b288b946827f6863eb8a929229ddab0452685f |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5904a2a63ca53827af2519dc1c97d993ab425264 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6a7652be22def02f18b7df9566a7ac3eac374900 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/166a79a3b821667068b4d0abcfa91bf25ba6f0b2 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5c36b1391ba80604e72df46d7f6efc3a5ca63887 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/96b27dabb75139ea28bed2be732ac5accb42c940 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8633c75cc4da5b2ad2bd2b3eedca932dee2caa5d |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/296e6dd50a69c52198cf22689d75670c48a19dda |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6fa688557ab54906d6e72d3a1aeb6a7f7181fe11 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ffefb3836777c10374619577f9f8d7fb3da66165 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/07d2a40469c2dbf73c08b2b26d30c27dcec56e10 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/c789786fbc7d327e2a3ca14f4c5a408d16a3d9c8 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/59ea1b28d10e1d81c8252a77a960c74e5d128b0c |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/2227d5909e4114dee64b0e12cc9a6af71225fcd5 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/8fe800ac7f81c4ad1c18b64f040e41146c836501 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/eb7e8f46d7e8759419ab7587787fd07e802e66b8 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/1045584fa80f5e19c9bee9bc6aa2da3d368cbf99 |     
    arm      |       libodb-pgsql-2.4.0       | NOK | http://autobuild.buildroot.net/results/73b06d7f923e5a7294377951f212b89b6cb0946a | ORPH
microblazeel |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/1ad5e86b6f4520fdf5617faea7bdda6bf81cb28d |     
  mips64el   |          libogg-1.3.5          | NOK | http://autobuild.buildroot.net/results/497c4a1ac20b3753b46845d363c8f85bce5630d2 |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/c2b7499fd16e241c78a4f2d610fa5ceb7c4de896 |     
    arm      |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/b41ba05d648a0e5ad17399f959342063953cc20a |     
   mipsel    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/9f375edf4050e928ffc303c4ec6bf3de3c341786 |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/14964d6bf82b5cf4ae43b27562dca044c48e7d2d |     
 powerpc64   |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/1d738b25102342864f380d962d0550f72027e2ff |     
powerpc64le  |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/b3ebc0cf05116494c4e51ee6e54c20c517820cf6 |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/f3a900f3d6680533cb28500fbc675abcbd7e283b |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/cc1f026469a2203605c813223b1b961a2829bc9c |     
   mipsel    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/ad37f411e321c17d627823a456c7a3371ea523d8 |     
   mipsel    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/b6b0895954ba5fa80a7850107d4c22c1a138c83f |     
    arm      |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/d4393fea1e9cdc7274f30e67fed70eaf16afb468 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/f4de3c42469559168b9afe98adc24d5dc2e6123f |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/709b273c895f7c243e3a25f5e710371a2e9f26af |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/c3dfd7ef8a472aa07313ebf999744faf7baaa717 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/2973c5f3682a5c207915bf00fc871eb5902346d5 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/603382d2d05fd0539a90f1efaa86191989a4f3be |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/b1237a1618b547fe603e28aa6443ae23bdb4b787 |     
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/cca6773101d2fd78787e700f92290c3bdbfa69b6 | ORPH
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/a673a299dc4eb12e1ca37082fbd1d0c0d9283b59 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/f4a39e416144c629cffc1697d73f6a5c03cb3287 | ORPH
   mipsel    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/cfbcfc4166ef9cf4acc75d50495b646053227731 | ORPH
powerpc64le  |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/8c8e873b17002d5e67e1b9ec4cb39dd5b1dc5f77 | ORPH
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/d70c2da60cbf16fc04012a9da900b6849f6d5a5d | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e4ad1c619e05af7b18b45d0553dc9bfd5d8fba87 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bd65be9eb4f0810575364ea78df58ecdcc4c5629 | ORPH
    arm      |        libuhttpd-3.12.1        | NOK | http://autobuild.buildroot.net/results/25db1e999950bbee069ba7364a228184a6a77808 |     
   mipsel    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/596835a3b90c4895ad4c16c44eb2837d6fdc6d45 |     
   mipsel    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/d09070c420e9e75f2117d6d4c8341bacfe2b2038 |     
    i686     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/59492cd97b29afc3ef27758c41799afa308ec93a |     
    sh4      |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/1027cfae585fb18f2856ddb22843ef6315fd9e2f | ORPH
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/87de7e62f9363cd343b0c39cdc3d5aad8220fa16 |     
  aarch64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/c672d77b680c47a47159501734a9c5489c41cbee |     
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/e9d968e6869de49efecc445a3551ff36301cf2f7 |     
    m68k     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/4099e66d9867c6e15e283e4865f017ff16dcb9b2 |     
powerpc64le  | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/fe4345424f967e0dd3bf7ef3951e822badcfa685 |     
microblazeel | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/ac7548ee64b86f66aec647336f2ed09e7163b59c |     
   nios2     | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/4904d969e676ff12e5a7923a3a973898c696a096 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/abc66a4ab934d49e96cb534e007771f088d98a93 |     
    sh4      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/ef4133cd0ea1bf9f5b5b2125ab49d204d9cba3a8 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/4bc0d21be0bd833e66e0bcff37ee2e5572538218 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/30267123e4772c8548adcdf7db743d47ea8b15e2 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/6bb7e4e0faad7eabcaef37c133bb30eeffc7c468 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/82d367f1aeae52cec6ba8a831e1d6020296251f9 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/a51d1874b9b0d483862a7fcf623ab9cfc41252f3 |     
powerpc64le  |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/7b16d57ecefa17d5e8771e5f0496e635c9d9788d |     
   nios2     |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/ba2028b1a38f0587c70b00e130a94f542f2f0325 |     
  aarch64    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/db9b2444058ffcf002e70be6ff430dbbc1a9c520 |     
  aarch64    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/0a53a2813ef095f4a4cd85942951f46fd40c6c13 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/0a2fb06989f794625e6cc185aa8de2e04c1a1ed8 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/625e70f715ce5811ee1058861d2d1f1ec1c893bb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/ae18fb26f4192003829d67275620cf9364ad44c3 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/f2e7997a18d36f0b638bb227daa8d423f9571f37 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/13d61c821273277adf842e0634e00191cb22ac84 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/5535f72bcb028896a407803ea7f24fea90bcd987 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/a71e89fb7477c8e973740448ede466e5531a2e48 |     
   xtensa    |          motion-4.3.2          | NOK | http://autobuild.buildroot.net/results/576c684d84313938021ea8f2b20a76a38949757f |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/9821106acd9f43f1c65f069b4e7705256b154f1d |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/84716e0821c9291a2446eaf42aac40adb850ac00 |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/12f1729cc6e988ac8e8fe4b10b0904908fe47758 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/fb6910d962814019fb9fc3f77d293700cedbed0a |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/7ca35f7c8e0de226d04fdda21434b9d25a109b3a |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/e26f801e1cb1651b94abdedb56ef7c04b84db5e4 |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/4dd65f09972d65d2686573f5b17d658675bd9f0d |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/aa69ed4a09497c2e4a376ac1aa2d9153880b325a |     
    sh4      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/1b4fa7825655819ebaa03edae81f641df08316cd |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/a1a79faf98d0fe899e2cf2d6d14fdafcfa8564ec |     
  powerpc    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/2eab8f9b8b7350bd265e65816837f9a0e701991d |     
    arm      |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/a6b42649638f5cb19165e4f6c3fa24f7433ea091 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fbd97269308d41872a258c84550da046ddd22d07 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1bbc041f5e2e33b080f24b02c4787ca2ffb7c77f |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3c8b597db6210daa5e8cf91f2d0b315a2d596e15 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/8b4e7c32cea01126fbb45aded400cbcbdefad91f |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/193660a62fac9fc5e9410958b9a9cb121df064cf |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5f165e22ea5fa713b58d5ed87ce3673cc56fac6e |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5b3a22c0ceeb43e378d11fac6954fc4f69da3995 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/86d7076be4d21de55e1fd0999d7e9f28220f2e65 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/852221742b6f30943dcf8ffa714a01cd09187528 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d60d3947df54466d2556c3769cac1b5e89f5c57a |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3c4b461b5e855eada9f35ee07f355074e7796a98 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/505d453dc8629c6eb58a32d4849098c381671ea5 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7c96b6eef7de4cd34596d0c801efaa9653a7d379 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d1259068e1b784ed90fd6522b91fcdcb64d10f5b |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/20c9a171a5a952c7acba323e45f03480e8da9c88 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/83677c2ebcc218db6ce44372a5193b6503a623c3 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b40324c86abbdcdbdc07b90f1945a62f45d63da8 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/681a0cd60f3a5849bc60849d31fdc3cb845384d6 |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9f87ab23033e4d6b80360de13bb389fff7886f6b |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5ef661927fa374c2d176decce80b23dbe673cfb7 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a11ad4a25ac3c379e27d8d40dde304b28de31096 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9f88c5b6836e4b23fe38b2530322266e53dd50f8 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cedee70643e59481bb3104a626392258d636a74d |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b604501f5faea14c7b638d51c44860d8361859ca |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2313319d74bdf94db65e142d0c403eb1c216faab |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cd3df588cce56832fade21ddecc5ed158672efd2 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c82b5b38184c4d0a24c45457cf0f78f5f74a3620 |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d9bdbd3823c392074e68056e94c6dbb71fc37b2e |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0c119ddb3ff97d605c5a1163bb82f48405fb6235 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/13f93dea44dba721d04d196b64f6ced6a2f9d347 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5725f3531ade369878f6fb97a27d9bf79f5e027b |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/465f2bb57e79ef9b23ccdd936b9f951bcf8fc635 |     
   mipsel    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e14afca0a631eeb0e4982ba775deb143812c1cf5 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/05cfe8a77281faaa3680b9d6c3c88224cb18cbac |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/aadc21a99dfa187dfcff22652f9eb24ecd394383 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/3afe4b7377a73dda634405a33cb07b6b5489eb49 |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/b7873027b99333cf121820bcd6a74d861337bee8 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/2a6c5119824ff3cb9433f922d3127b5d20e8f69f |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/02fbede83b8b2bca019d74c9edde30e92579bf1f |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/2b0d94d912f99f0f6d535bcefe3ec16fb6bd0e5e |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/062e742b458e93f9ad7627286aa1325ea08f56c9 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/0cab1519f586fef6a2c2e123f79f36188b434120 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/85a2f47e12cddf4a38c00ad8f4ea6438b4c335e7 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/dbb398963eca346507bc5cf845000d7a225d77b0 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/f540a7c16c9f8ab409499773ef7700f80d6d546b |     
    arc      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/3e333f35a685d28b134a1d64c66a6b0747678485 |     
    sh4      |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/90a87c0546ddc47e0c10191209943a746aea2d78 |     
    m68k     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/ddea8b8814048ac5eeaabe1fbf68c035d354f3f7 |     
  powerpc    |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/9d2012f71617e6ebc59a5c13da3981ee3a9651a1 |     
   sparc     |        nfs-utils-2.5.4         | NOK | http://autobuild.buildroot.net/results/6bef233dd750ee31ec72641f28146052d067a7fd |     
    arm      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/00181f6ed2a5bafd13cc0602380e4200a98d4d84 |     
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/141672d18a04464c6ab0a76a40a7816b7ba947a6 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/84271e5755fce81dcb4756e5735419a453b903c3 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/0b47b9ab92aedf8b31210f924bb1a6e736b38004 |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/1c5ff406fba4496498e38ffcd69f04b49dc023cc |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/9f41b53c7cc81a861d73f1666b440a3714fa6275 |     
    i586     |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/e2f2ce3e4eff2ea9a35561305b6f1f4c68d0aa0e |     
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/739c89286e4f9b3047b48c4f4036c728b42f9e77 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/361aa3c0d4931fc52b550548c3fc12e1186b363e | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/73ef264baf6505681735bdb8e822675b51c40047 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/052ee55dd2b402f249c9472a0d180aee92f305ae | ORPH
  sparc64    |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/b24481336806ca610e0e14e147d92804f4ede287 | ORPH
    i686     |        open62541-v1.2.2        | NOK | http://autobuild.buildroot.net/results/0f4eaaf468718f07d9d49498559b2b779a6c68a6 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/df5df16949609aba46f2bd5bd76aa303d0ee3ff9 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/a028a7eeb34a4f1dd4e7621bf537381c4c8b7ee9 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/0a6cc37c8c2b27fee7654378c1176e5786ae0c5f |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/0f6092cc2eb4371ce4f796aa78ae7ffbe73dd2ad |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e2ba0cffd46bc2fb6bc4591d6ebc75e829023d02 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/695f6b6342c2d4ca5a8b53ccc7a8dddab11ebe22 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e0ed3a3deed09d327fe11711f98e90b9a2e551b5 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/e7798484041221fab89f1358f051536aa8a5306d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/129776bdffb2ba0d36e942f58fa8e80c78517ae3 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/8fdeb9b0e83e9b21e2771d99284a327eda70fa7c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/d519d19e6cef90f49d19fb51e8e7e49abd33958f | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9160299ae0b30d241cdf09945e89b6be84e854fd | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/568ea7d0611aa009d2dc3f8cfba3df71aaf59172 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/d80419cb7868141d75586330d473c7f363c51537 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/338704113ca2325afa4b764494aa46b3f790351f | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c61cb30ce5d51f1de40ac9fa07bd5eaeb6426b22 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/348f9a8671aa473de95a4a729a20c823bbca061c |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/04a8fa6fc8027b5e976830ffd847003c3245bbe0 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6ec4150ec17ca23527bd03191ed34adc08f098bd |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/76c4b0b17809db283f063671e79b2249e6f1c388 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2fe50d37d00dfd1d872e2f6036ea684dcd04b012 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b2c631dcb9f828f8d325900ff2cc711b4e88644b |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/2ad65781e13b360492bba5e470602a969be41dca |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/555b805d487f53f2c7a66e32c85540810840eb9a |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/444acfedff5bc6065454fb61be60547b2b2c44e9 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/61b5e60ce64a4e6adedb2f2f11355f61fde5379b |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/4b51d646a23daef6fae3290bdb18dd1e323a85ea |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/b9c7c31747b6b9d5fea8a13c83ef519753e827ee |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/fb4887be1bdeecdf53bd64762e7bafb459d9a0b1 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/b569afad9f7f198dd7de78808e90500c6fccaefc |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/28545d75fcfe12a1ca8e65376c4fb0cfd0bc6bea |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/9a62d9838012ceeb91423e1adaa4e7a597b71e41 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/f01ff81fc5edec65f25ce01c264d42495e668013 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/fd0935836f59532a8a17b716c98fdb83b4b333ca |     
    or1k     | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/683670d214c2df115833494ba6d91b7b05f3fa39 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/350197e1af7b095d1734da7785efb049133f570a |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/6a6d5cfabe4bb9b0863f913355067c9ed736e7b6 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/77c555987b0062a59df0ad188da0458480e4b53a |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/074533d50862496d4b7f9d1ddac3ee79ad211f1a |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/2ec9cc0956263db0894821647ecc9cc4ea40df32 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/65630d341903437b253a8938531a9e7b519ce218 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e0ff74210679215a4b6f4825c1b1f1850bccccd1 |     
    or1k     | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/eed9423344b1962eb7f6760f2ed9660e6c5a95f3 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/997153069cebc5838abf3a6709bbfdc1f4de16cb |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/19dd0f28c4f910e22b86da69d9018ea085c632ef |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/ad70175167f6d15f4bb67c8e717800fe05170366 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/539fc52a4685cfe4fd05c0f9969e2d801923e6cd |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/312b7544169991452c110164f9fe0df4dc9141c3 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/7b0b4b37d83d92f73712160217b277efd92c1aee |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/47187642e1447e2df8a590d8cdc018c4f783e73a |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/b668ecbcfbe438fcf662ebd3d8809f934d9a0720 |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/cb7eaabd706f5d122366a99d2f95001303142baf |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/4058ad218b13df71323d01e057ab98172d7ab092 |     
  aarch64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/e489e5a7a9239430b2251fdb61ecf16e612bde83 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/fb0d785d3b63aea9b916502fb132d1bc15ad1f6c |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/02423d88449ee7776aceb207aeddbdff3d365b7d |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/892b154c67366d7a6e5188e7aca5b41263700b63 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/130e96a397b00360bd423fcb577a34f68f4645cb |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/3ab8fe4a8bb07449e78d9f4832ede1e11f76656c |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/9a67ec4f0c0ccfd39791c8e46be9573de0720ca2 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/16a6dfb1bffb389f79a730a185485e946c09648d |     
 powerpc64   | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/85d7ee4808c10b92a978b969846f1a2890e7d2ce |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/0ddbd41d390ff9989c658d12755077791e644f03 |     
microblazeel | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/2b92932bf4aa9e1f80cf2fa46222e12e17e906cf |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a0777594cfaec76bc4b77c09e40b737e34ae8ca1 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/354d7814fa269cf2a03aa31a0baf537220290f89 |     
powerpc64le  | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/89b69afc3e7514ee7b4193b2543590e1d6560106 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/f358f231bf39bab4b6476bae4b802d1313fcbc4a |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/58e148c967820911cf92cd4bd510662751e5b217 |     
   x86_64    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/a75633625ba415720c69a5a07d9765189d8d1720 |     
   xtensa    | openzwave-62444b0f979c337d2... | NOK | http://autobuild.buildroot.net/results/608afae0b3ed518fc4a543b5e103b6918ec7bc4d |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/a4b58d4f62d2a81105e2fae960a0160b44135104 | ORPH
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/f4d0d688d5a1c8660fcb7ce6c53f95e5cdbe34f0 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/be2686ba9cfaf0aa6a217d1b25bc9c387c14276e |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/40a56563575ff672813921dd15c69658f8158b73 |     
    sh4      |            pdbg-3.3            | NOK | http://autobuild.buildroot.net/results/af9fa89da4b1351c51fbb53e6fde0352ce250907 |     
    arm      |       perl-net-ssh2-0.72       | NOK | http://autobuild.buildroot.net/results/25747ec239e0b92775aa883e4f531f77d45f352e |     
   xtensa    |           php-8.0.9            | NOK | http://autobuild.buildroot.net/results/01eb091e28c7b8f22f0caf4e6555537ba64c3779 |     
    arm      |           php-8.0.9            | NOK | http://autobuild.buildroot.net/results/526d2e3108ff2506482d1665bcc3ed083961430f |     
  riscv64    |        pipewire-0.3.32         | NOK | http://autobuild.buildroot.net/results/133b97d466a7fec706a4afa5f94d356b9434fa8c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2de17b902640d28da28f01e20e87828557eb42bd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/eaa822673c07b27e0e1119df85cf78d77627398b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1580c9deaed6d055a07299672526cf1d02c68f0e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6e42f0b6675592d6cdec0068d54b874c3fbaef4b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/208716e7d7fe2ee31fe31897b569b5760f03f249 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8fa3cd58c1f40cb1dfe9dfaa22521c77c8524e8d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/6ed67896fa8604f029b2f4bc55f44b540a48f5dc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/311dad407e0db925367c37df7d523f8ee2e0f0af |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e8bec76bad9ee0e5defa8841ac06627d8c4a06f1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5744d7b452b5f8dcab83c9c67a28ee619a8ed3ae |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9348a67b910dafb75fb53939804523d02f0401b4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b20869bbb48edb1f0a847ea9e2e1a0462d6350be |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d8b9769545c4f683c5300cab683b686052a0a466 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9c03e43ae336a1c9f71d93f81ce87a8a133c1da4 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7661e57ccb2eb8f1863c9234bf414f2c7c0c6f1a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/59db7174ed48c25661dfce36b864d13b2d39efbb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/296659de9027a05653af17d15177e26024e95a78 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5fa61a27a27a0608ff2e37a9b7fa4264061c648a |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1d3af342d5d68079cc13ccccbc0ebc71f3f3daf7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/04f9f569e46e0ae1b42635bbc479aa4cdc326976 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/48c9133481e5d11671b24c7112113db89aad21d2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d979f066da446b4cf25dfd0d9372e8cae00b9de2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/7be71d4c5def67d407a23ec27253a6821cdf434d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/3c184e4e92c94b2a14f978e5b7b4be38972e6bde |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f89f7282a395f4789af3720f44173e5c87e85e0e |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e17ba37d321ede7533f5cc030eb8d4c1b4a47be5 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/a90bb1d308035c76b81a203ab66f7efd0f761864 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/29c822bdd6010215f3d4c5d908ba0f786bdaf94b |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/77aa37c3400301ddeb6dd6411fdc2fdfb6ab7a16 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/c61a7779b9f363d30863a0828d6da31e10aee50e |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/fff3803e0fa5a77dae17ddf5c3af5740539e3ba5 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/d789d6a735a7bd45eae4b1f4ffa539dde671cd45 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/5a6ecfcf45f81ff27aab8d463198cbc88fd90e07 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/c3dd5c3859d8b574116c4ae6f847cb96558fbb11 |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/85fa7dd76ffdd7834d129fd7c5ec6820987f4120 |     
 powerpc64   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/8019bdc06f503dba690bbfcb8f0534db48c1aa15 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/d78d4bdb34855b809437ff9445940ba2020d3f0a |     
    i586     |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/8e821eb81a2546b2a884ce5914460752d8709316 |     
    arm      |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/5ae30097249ddb63b4c235c41ff4bbdf76f0e171 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/938f5cd90ad54011ad6d7ad6e09ba00ab7fabc61 |     
    or1k     |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/8e9e29e8af8bc6e84cbd30ea841e03f51c5e7fcc |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/0412479bd87fb315f727410452f25a8660cf6b08 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ce826b080668a1164d13060e7e9fad8cc6bc57ae |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/420ba1cceb8378f3c0cb5ffa0adb615d546a38e7 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/73ac80232fa954d4b82e197f34c06141e939779b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/380829ca12d44be43cfb514180c5c6d805178ebc |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/473789d1423ac86b12051758d830eda9acb5d662 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/debc85cc6f2816d444d4781592e78fced19e351e |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/7101c3bef563f716d067dd79d17fe1a1bd50a4d2 |     
  riscv32    |              qpdf              | TIM | http://autobuild.buildroot.net/results/1bd170f10f4329b6c906c6700040b5cd90b58289 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f0d5461d5ded8cad4a5b5b58c11ecb42d09561ab |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/750206af94ad6ac0f4464e428768dc5ac6bee88c |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/d5ae0721cb3e40255cf184a941684f035b9382e0 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/da4db9046d2ac525382b2eec4918f6c220db3e08 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/9aba007c3e603b550399a03e6996d74cca649891 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/23593f77d5a3cc159ffbd3ef2bc96c46cf6e67ba |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/8f61e5c57c00e5f177bf83c28ccfec956fc61faf |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/76aa768b7d532decda91e58f7b8e4f1c521106d7 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/8260e92f19362b3e9d043ae4ed1575de1bf0bd2a |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/05d0bdb94e592e5dcd61960f8e50dd68143e7f8d |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/347a1b7bb338ecbc9efb6477b60ba9f605cc976d |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3627001f48ca59eac098c9f1f9878c2bed55e74a |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a5c4c5f011166dc0a67c7dc5aaebe7c37f1eebb7 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c75beb0b542ce09c55be960b1f2bafd755f86587 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8813e295d6511b290a3abea6b8e1afc44cc17da8 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/913f0480eb393a3f3f660eee40550c173aaad3ac |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5d00601a29cf4f9796fe556dcef82f1abe36adca |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/53281e759fdeb3705862fc33a7d054e1c0a910cc |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8633c2238367f36c81b0c29c7ad5b2bc334cc364 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/164eedc9adb94ae720bef9e55507350987645934 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/91b95b88351fdc952b7b216b4a3395b4f7fe565c |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/51ece141856f40bd5c97742a0e1798400a7ddf59 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/86226e862fe6d85908a75bdaa8a549b476be06a6 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/6774e397c223537714d8b74d091c47fc8987107d |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7e25377066a211c70358fe6fc73b4e3eba77c5b5 |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/050a2701a8df6bc7916b8c4ca5871337a66fdbd8 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0acade8bc09a75818911f1c11cfd397a44613a59 |     
   x86_64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a7a46f0afe29ee4d7b0f83e5f892b19c1d974206 |     
 powerpc64   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/32fc34452fd7fdb3bdc97d1738956e026b582b6a |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5519213310fc140893d392b2b80995e623fc59b2 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/61978c043782ab71dd7eecb66f4f5b50997acd4f |     
microblazeel |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/48308076ac4d5cbd81718a3f4cb26792a2fe8643 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2f1fe40dbb1f2ee01f359340e15a271328f52b40 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/760a69007c1697e8dbf0e2f183f3f1805f7299ad |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/552d545cd005cb3b90c12ccea233719710c682e1 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/168a7cf45a41d4b69c50e0ef373634af8fd84743 |     
  sparc64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b4deef5c8043481632aa2952c14c645b0fd63831 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a5058f72ec0dda31d181ae1063a02f817cdd53dc |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/27502ea7c8825c330022d9d7e069180af68c3309 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/32b9a1676a949d87c510b7a745551af802da4f9f |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/744a4ef2141c4405c5ca111889e61b8587bbf410 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/e52ae00e56ddeb0e70ca6d7670d843d7543b96f3 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b32f2a663ed9694014941024d230feca3ea1c0e1 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ffb98a571e0861c9cd266393d7089e9ddecf59f9 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a1c3296e58de72cbdeb8c8dfb578867e957c31f8 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/41528f2c4efb71988ef0880d5a7c28599bdf25e0 |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/de58a6d3cc32ae92810ed9452e2123eaba4cfa29 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/39dc5181d2e8532fd79fc5824532042e547b3057 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/306769a53d35024160e482b9f5c2ae11591aba7f |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ac910fec46a67190f690bdd20c813bbdf34c8af5 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1d99015905fadaa3e85731547245e0083f9c1d6a |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/26ec99d78c37188aee03e5191fc0ce8a86471d93 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ede1444927a2fd282b39ce353d775e25c1818a92 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/324b44f4ddc3140587afee9e1d99513592ab90b4 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/60eac5b4ab6af0e318d8965cf817a98e121ef815 |     
  riscv64    |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/73dcb93e3d7cae8556c0da6e9a37a6515e13c351 |     
    arc      |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/a036b71a8d4593c6ecf627f316b5278e3aa92865 |     
  sparc64    |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/de63457edba37d5fa991dfaa83be00d53fe32609 |     
  mips64el   |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/5f0d3b509c9d3d7e3aabbf8b49bbd18b215b11c6 |     
   xtensa    |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/ff00e8ecfff10d051553fcaf27603f48e75d13d3 |     
   nios2     |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/2934f32ce537fba941d7c23c001f40fb7a482e98 |     
  powerpc    |         rtl_433-21.05          | NOK | http://autobuild.buildroot.net/results/ca772963582e10b25d68446e242ccce7fa6a2114 |     
  riscv64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/9720c43e3c7a801e4fad1b3240b5d5e321b0a0b6 | ORPH
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/845e3c824f6a295a558615e40e93d0c8d2272ae1 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/90100519d696c49441669117276fb8084796544b |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/8f06389e8e313be386c45e9e2e859136a44290cd |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/09c6ed268d8faf1bfc675df49fd791644e3ad3e2 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/d88de0bb4f5be97d077de79bd4d31916a52fbad3 |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/304bf6a6873aebc635086c61d409687544ddfba6 |     
 powerpc64   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f8ce730a129775af07dcfbcf4fd2de45b93558dc |     
   x86_64    |         snort3-3.1.6.0         | NOK | http://autobuild.buildroot.net/results/32d49c049d891ede963b333afd50fff1abc4c423 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/f424006435225542cfbbdf75e50f29302657b503 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/3d54e1286c37d9218be124ce1e967e5058b15f6d |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/87f3e486e607390beabd4b6910e885f5ea5fa394 |     
   xtensa    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/ab9db989f719410677092ebc0cfb8a1cf2a38024 |     
  powerpc    |        syslog-ng-3.33.1        | NOK | http://autobuild.buildroot.net/results/270b3a9108f4e29d5611b074ed765a36adc61fc6 |     
    arc      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/7a76e5166d5d8b7bff5d90f528820c7a637ac87e | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/41b60d4b5aa468e3524d89d12bf235a9f65832c5 | ORPH
   nios2     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/ebc48efebd6f92a541c79867a8c1dc3221b27c29 | ORPH
    arc      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/6c452c311993ffbbb3886cd6a4e1d43b52153844 | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/33f00aa38d55e5d3acb7171428a7ef23532afa94 | ORPH
   mipsel    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/26dfa1b90bfb375577cf1c9d442d991a126d0d53 | ORPH
   sparc     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/08bc36f02643eeea2bc43a0f7ca08cdc6ade3281 | ORPH
    arm      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/bbf53fde06c3bfc8d9497d4351fda44daf043d83 | ORPH
    m68k     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/578d73f09ed93907be204074e629a49b01934e8c | ORPH
  mips64el   |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/0ff328e34e91178716ad793304334044f207349f | ORPH
    arc      |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/89eb69fad931301dda0a13a3cca88c6d4c166cc0 | ORPH
  aarch64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/8b68d71708b1ae91e68fb9d9d2eac4c10de46ab4 | ORPH
microblazeel |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/3255b2985548bc5d4ad146bc57c736f58200d691 | ORPH
  powerpc    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/e60dc3ae438bf84af2c2f54b8302edbc7faf089e | ORPH
   xtensa    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/370d05d01ebdfb140429bfdbdbd7bc079355f9b6 | ORPH
    i586     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/0408a42421b3b5b941b41cc74ba86ab4af560c77 | ORPH
   sparc     |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/658a752745f8b924f2ceeb9adeaf4e5e58a17174 | ORPH
  riscv64    |  system-config-printer-1.5.15  | NOK | http://autobuild.buildroot.net/results/fce92069d6f15ee2f923535066542f51ab3a9a0b | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/24424772f4bae94297e06673cfaa9e2b6c6f7ef2 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/573f580d1fe9523acb417ff56fe7ba69187afc6f | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/771167d77733a6a86f6463ffe6ea7f7f6e9ddb4e | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/9d633edce9d332b66b578c8139e04131ea236627 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/c83261212b2ec80898e7daa3a9aaaec55f0c5741 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/e7e2ab854d9b2751d594c4528f59eb2cf09b4e97 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/c3a5f69cd6df7abc8347f56dec11e528b69b5010 |     
  powerpc    |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/7af1ed5a17b6e8adbeb19592adb978d69fdd2bdc |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/5bd1106340ba64387e62a83db01508eaf37da031 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/04c2a06a90451367b664823db0743dfb4a20a02f |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/6ddbdfa09b2393bb3540326e45293fce63427eaa |     
  mips64el   |            unknown             | TIM | http://autobuild.buildroot.net/results/d9b844d226748ebd54a25bdf46811f78b2eafe0d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/e3fef8a10fdd2f14ab1f783f983d508bca90d6a3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/507bf321f3745e247eadda57c7e057fc4a1dca9c |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/a4a57ade1cd02b131eaf51d1d17cc4dbe897b384 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/025d74ab80d2c09d2ee0d32c8a07447dfcc7c895 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/51a7734d37d03e96a19fc53fe6df66d37546dc13 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8a655435f9c6cd070eb6eb04f481c6174ef87579 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/4484079bfea2793287afb43141151c13fb5fdedc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a094ae16da9ee288327eea91182d28363bf55f2d |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/972fc7df534fc1282a3d22f516f00fd52e9daf2d |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d799f5086b556bcfe767a43c9e31071a7391d40 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4eead81391d76edcdd2823e439f9b8d165b9b7ef |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/171803a57cd9e724459581857d1db8a7d42c3492 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/f2a122c40922e27f4d35186bbfe099af47a8d958 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6d4b36ae066acecb39b0321dc92813b96d6939d7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/dc70970048e660ad7931bd3d44a7ce5b21cec933 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/0ba636c4a4bbdd681dca3d67a71f4fcc699c8b1b |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/b944606db45f6d877de2f03c4a59f1fdc109efe1 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/7096b8b45fd60d97ebe0c9faf70827ea409b03a7 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/4ac521db58af8c714f463ac8a996a400d6d79a93 |     
  aarch64    |            unknown             | TIM | http://autobuild.buildroot.net/results/072645323676c43a7cff4bb92fe00926c75e2a7d |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6eb270bb60cd06915d0768bd31a0ccb9ce683ece |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/50e3a35531c5b81d2fdcde6525d26ec4e8738d20 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/dfeec23b49685c83ca30d54a40d824013d2c1f2e |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/497c74b7817a16f7e1dc7113f39f1ab4fd73c9ca |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/283673a75c544f19dcad02659f3b938d427647f8 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/d4b5900e7ba5b5bb160873cfbcf7222a15cf5f90 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4195dbb51475192f074ee608cb738fadf3bc16f5 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5e55a33db14ca1d3248d3e6c3da24ee582ae1feb |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/4a566264e790a2cb0eb40b22d86596009ed0016c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/fef8313531e5507565f1cdd8d7b398b2f063c0a3 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/5e6c946716eecfbdb6f643b999c40706747cd705 |     
  aarch64    |       util-linux-2.36.2        | NOK | http://autobuild.buildroot.net/results/f908bfed6eefbcd03fc6c5740eab1c359545c41d | ORPH
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f5414042dad8f199985f4d4eab50d6126bfe0006 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/02d382ae8300702716b4b3503511cfd97389d904 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a32b9f84586fe803736ee8d0bb760119f2126a28 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2e9cd6a6dcedbf0f5a6d7df369995f08f3e22fae |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/56344480d3168c3ecc08f61926409fb5d909a42e |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/34b5a86264db28b2889196ae00593b18ad8bb482 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8a09db89ebbdbfe0c515f9fe35f65a7bbd0025ae |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b355bb46eb0c6fef051b2bbfda17cf3243d8528e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5dfc0cdb3096e2a325997ccd316111cdc824627b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b5fd80d35ffaa63c6d3f2cf00040a699b054d903 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/acff4d8e96f9bfa03884bf0013accb21018391b1 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/232d146b7410ac6a83ee468e21738bb7196c3a4b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ff7ca3853fc3da6f9b756d860eaac5ccab697fdc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bb5e76d1b1a030bc5fa6dfb230428a02a427514a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f63c9b2d4000610ff469f006b7ea50530ffbea8e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d37dca904947215df6b78eac14021efcbabc099c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d05d3857089861dfd153dd022e75039131f88ea2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d34d07b1186502867e812a10c856bc9a33554626 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c6cc19bd8387ed960074ac99f90a8d693dab9b77 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/24abc559120a0a671f219c5ee630c59e21a3a7ed |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/87ec0dbdb2c26b158f82c3145afab3ac5933ccea |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cc355e36bbc3e7c296fae9dcb1559b83b6a27307 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c55909445e98a6eb20aba790a4dedad8307cf4ee |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7f096d619ee77f05835ffbf9a033c7fe542b18a0 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/165dcee985c93c3ca3296580b1ce2069ed067c0c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2b20822a70459532cef6ba3b7d65e39cff2cff99 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f2f89cd16867bf7e628913f4590037b59b7bd193 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c7e55af3637ef92935492f4c40ac1b8ccbbce14a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6e7f1166ff286f544b5c9bb945b2c65dcfa13540 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/047bedcea3e4ec1581440e13c08aa80229d7b2ea |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/ee8bb3d35ccfdbd3252a1f6c11a1258b5cb6d53e |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/7f6e60d2f3c1756e74bf3773d3a2ea5c2ac91d33 |     
    arm      |           zstd-1.5.0           | NOK | http://autobuild.buildroot.net/results/316a59cdcad882e4f0bcbd4fb0cb8d25299df266 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  exiv2-0.27.4 | 20
                  host-python3 | 18
                       unknown | 11
          libmodsecurity-3.0.5 | 10
                    htop-3.0.5 | 8 
monkey-f54856ce250c4e257354... | 8 
                  zeromq-4.3.4 | 7 
        host-sentry-cli-1.57.0 | 6 
                 openmpi-4.0.0 | 6 
               capnproto-0.8.0 | 4 
kvm-unit-tests-kvm-unit-tes... | 4 
                    mpd-0.22.6 | 4 
               apcupsd-3.14.14 | 3 
               cutelyst-2.11.0 | 3 
  gobject-introspection-1.64.1 | 3 
                 mesa3d-20.3.5 | 3 
                 openal-1.20.1 | 3 
                 pixman-0.40.0 | 3 
            qt5location-5.15.2 | 3 
                 dc3dd-7.2.641 | 2 
        glib-networking-2.66.0 | 2 
                rocksdb-6.13.3 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                   cegui-0-8-7 | 1 
            erlang-jiffy-1.0.6 | 1 
                  gensio-2.2.3 | 1 
                 gerbera-1.6.4 | 1 
                         glibc | 1 
             host-cairo-1.16.0 | 1 
              host-clang-9.0.1 | 1 
                host-odb-2.4.0 | 1 
                   httping-2.5 | 1 
                    lftp-4.9.2 | 1 
                 libp11-0.4.11 | 1 
                mono-6.12.0.90 | 1 
                netdata-1.21.1 | 1 
              netopeer2-1.1.53 | 1 
                   sdl2-2.0.14 | 1 
                    sslh-1.21c | 1 
               trousers-0.3.15 | 1 
                    xen-4.14.2 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/087b9542cd75d15ef4c2cc18fd2acf3fe6cb6a71 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/98a58c0751b8dfce4534dded33e6c262f59836c2 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/1b48c593e3d160d41ff7a458d99fb636b7aed4ac |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9002acfb7fad32ac43ebbb7d0437eb352fe8ec00 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dfdeca12d003dd4e860711243e8102bbec8ffc70 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6fbf47dc1437478c0145e0ecf4627c224f0c4d09 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fa5b562f37672d137cf1d2b6486ca6f9155d6a26 |     
   x86_64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/97eb3cf98a18a9ab7a0911d52cc6f4bd4816e046 |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/7452d83ff0199b836a522d8779aed8c8a5a811e4 |     
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/3680c030ee74054670445d20a0ea89cc001d1d46 |     
    i586     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/0f92f130211d62327d20845dc2d034f343ac99da |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2e52844279ff9731f68f9b35ca6106c132049c11 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/93fe4a48740fe69ba1e077604a74cc78a247a92b | ORPH
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/68a09ce1fe0d767b6e49a3ac8e38f22ac5e14896 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2e01a345980172201c3206d723fbd5d83fa9dcb5 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/430c162489c91479817e4193792b8c7ee47b983b |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3813af0fc48f0e329469a0a54d5bf86c31c998b4 |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/612b547cdb9bea089fc0b8b17c5a0cee89955dd8 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4a70fff6fb0637f0eaa4c81e46eae7442bb17eed |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3f5bd0f15f93044a26d1cf85521d57e508d1e67b |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b91f0f036e22d20c8eb9757d635e02bba68180f2 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/684cec0fd91da6dff85a7cc69eee0feddd92f55a |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/5d4f6ab2e8388bd12729051bd1fc1e50015a38a7 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/eb33f7281a496d23d9681382e984f0b5f0f88ed2 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/b2800748c522d89f2e67f9d3d962ec6dd3c003a9 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3aa87ec71e217bef4c4f7e65800a25cada2b4166 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/709841f92cbd86650b60d0cb01b275f404a95f83 |     
    m68k     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/420cb92a0957ecbafe550970ad0fe2c65e138b45 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3302a07e5bcce9052943243aedbfd5a92eedbecf |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/81c4459abfdb43fbb7ddd3ab48bea31138decee2 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dea92b93c77a05a575ab6eafb85f576715e735cd |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/9827e764573aae6c1095c127d1f46f207709d680 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/d3662dd33d99651fffd385ca17598439d17686b0 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/601d29416743baad4316843a79afaf30628bc0f8 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/b6b9ea09981ee7007fedecd8803a54ba38fac348 |     
   xtensa    |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/d1638ec8db2acb89c6d20612f4544a7a4eeb22e2 |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/e47c15101ac4d8284f42d0f1de86ab8e3227659f | ORPH
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/84291ed92ad89ae7b3bd76c93ea79c1199acac5a | ORPH
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/79018c8861c67b0572d3fb603ef77ddc9679a1e6 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f15a5afa6edcc7dc0e14c4dc4dfac2bf054fcb1d | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8386e68b8d23022d03ee20fe66895985017e0795 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8ff7b6da8c39f13ecd36b579f871f9e677fcd900 | ORPH
   nios2     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/265039e9a025db4dcb629373c9314524f95e0f12 |     
  aarch64    |        host-clang-9.0.1        | NOK | http://autobuild.buildroot.net/results/c2b1209a15ddd7c04c5648c8f4117b62eb46cae4 |     
    m68k     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/0ac81444d9f35a050e1374f2d437828c270f6303 | ORPH
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6e20d328a75bf9b4cf374ff03309a7ab340671fd |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/cabfe95b65c5cf4b92d38d75eda7f038db00e306 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/da7b8d89ab665309941129f6e3d1f157cadaa96d |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/ff1092413ead10e67b56e1a70e562eadcda163d6 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/5babfa10893ca7af2083f807c73327471a72511e |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4f2a2f710d79c5474a17ff2747cb67eb6ebaaa28 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/8a9fd28a1d9ec30dfb85a04b09ecf4c05b2d86f8 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a9cd3ba44c28f3991d1cb48d063103801a8ab23b |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/588e164b99ced7a4bfc2fb9792a608afa76fbfbf |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/9c43905df26cd575ee230951bf748c33bcd4ad22 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/1322797158e02379dcac07d4bd4db272898c17ca |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/a2207a59e3f10fbecac5ae971683e51eb71a04d2 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d920f61d4be9cfbb717c7e129daad78b9c625ea7 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/7787e3c6a63d025275752a9c44314ebefaff3e98 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/ca34fecda99cfcab76060e70815610730683f1cb |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/5fda06f0881725b639b6a2058609ce23d8329777 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e49e30e89981b9acbeaf1127cb33c080b186e741 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/545995caed242c04c48b610934aa335527e0bf0d |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cfe42fa3104f2cf75c885f9b1431ca9521d9e46e |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/68f3d5f8bd763abbc23f233679b270058bd9eaad |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e82d7c94c24f0d24099e6b3141dc2d70f0484b48 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a05f0dc96daeb2557bf0245c749ae659c29b5c47 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/13a3b8ddb8903de848dbe5d130aac97c2cc32171 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/498dad52087aeb1676c9d8d34d7fa94a9c2b847d |     
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/1e08bc05741ca75bde01780d73b2eec829dd6c90 | ORPH
   mipsel    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/35212b3ed55ce822101fa43c55d44625349a2e47 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/38f87220ccc161c4b2c272d6ab2c25e1c9d692ea | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b7b206c69fb82a20353688856541e0b61a33e161 | ORPH
  mips64el   |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8800e09607bb15fea8735d7f1e56b97ba4abc013 | ORPH
   sparc     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/32c547682ed26a4ddaaa6676c85e67bcfa5084e5 | ORPH
   x86_64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/9159559d76ec142c70fcb6667dc450382503591e | ORPH
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/10b0c6211b5a5c31114c2c45c5094f472475fdef | ORPH
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/11fb17589f253532abf7bf36c3f85300cfbd3f26 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/4f03ff3b9ea650294dcff379cb45180295f3302f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/eea68328ecd16f74fc9788c8d318fdadae7767b8 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d68222f6104eb63c23ad2b9e2db691446b9d8bb9 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/704f4ee1f69854a68c3555b3cea85cfe0753b07c |     
  riscv32    |           lftp-4.9.2           | NOK | http://autobuild.buildroot.net/results/159a7a2266660c21fa820dc985e4bc54de1b12d4 |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7dfadf918876ee92f9d7fd78493f1c6a67193cdd |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cc1337119883a9a22273327811aeb13a18c19cfb |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/efdacfbf8d8a66f959b232ec6facc57509d90939 |     
    i586     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d60fb6d5926cf7bbde23dab4d57d42b01b099d1d |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5d8a593262324c521d5c8ae36a54bbe874b5e9be |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8ac188c566bd33d6b37ed67e5753d9600ea38c75 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ef47bb1b1dbaf507677b2dd49a4367af9f704aff |     
   x86_64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8b3765804b1bc8a0b645d868255f01b85c3f4c34 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f3936513cf1de3b096cb51b204539645988a20c9 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8a0d809720ab0b145696c18994f331767eb0af4a |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/3c54fccc62b9d17a67f3a919026ef1c1c0cbedd1 | ORPH
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/d62c3d2208dc0db34afa8adc95641b772158d5b9 |     
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/4ed643d6079503ce5a08566e7ef8f4b5fb99dbb4 |     
   x86_64    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/293cb359f4fa8fc781a10c4c6503b1d55c27169b |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b2dd4f2a2a5d934ab8ae6bff48ebd7faab264e61 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/772297480558049a4ff4799698b2dbf74a499008 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/a517071f75b1c50493c06940b8d843c0547a15b4 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/f633dbe926c71b90cc5f15d9c92de7913b57c190 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/12111777a922a001e1717454cc05b98f9a3f91b3 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c1a386431314b3673e62d301bdb3a7e58289d8a6 |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d07387a0a02d2856b1a8641fc3dd8ccec55d8e8f |     
    i586     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/44e78504336ba8d55bcb7730874d43de7fcba81d |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/98113e8814f6d8e694d7f9656757632e7e090b84 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/1dcfcebcfb8ed0bb91528e7ad46925e1f9ca2222 |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/3ef679d0ad2394891bec96e98bb3525c77ae9271 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/effa5e0f15daf8d6ee44c6074c60a15db835bc50 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c757b98490ad1aca5e8fdd49af9f1f1541bd2695 |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/ca29a74372faad345bc0bd1b785d00f829c35afa |     
  riscv32    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/7e74a509e90e79a4dcea459f8c1f55502ba51c94 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b38c53a17e569f66991a6200889fa0abc56ba549 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/9e7a8482df4f030495c97ebb489627bda1f4f625 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/ccf54492c60a343dd2261043c821c5c50a422923 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/ba4a5ac701f8a3d742a823c6468fbc0742d6cb1c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/474e2e6f071c0c19bbf2209f9373805a1b73efef | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3cb6e1695d2a41b8e3b42ea8484d721ed9cc170a | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3f9bbc2c0dc888066bffc5d62b60a9fb0662a66c | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/1f8d15297fec9abaaad41c7dd4c929079d751e8d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/d3cedc0cb3ab8105fdf59c2176a90fb15eb1b702 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/cf55e2dc9dfac6c3ac640021727a62f162a1ee68 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0fa0e667cc2ca994ce2327367b5ec2e9fa7af3cc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/49009aeee193aaaef3046b60a500cec7828b256c |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/7898549ac16dce6b025c507ffb7aa881f82964a6 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/ed9e23fd978a603822d069ef2a7c74e65476c935 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/addbc26110a02e5b175415ad62472f20877b8508 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8bba636e3a245b8c540f0679679fd14cff982cb6 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c94d7016d2344ba82f871617a57f37eb0d2a306a |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/00773d01fac40b333afc9baeb7eee2075223d1b1 |     
    i586     |           sslh-1.21c           | NOK | http://autobuild.buildroot.net/results/eab164f3754c75c79141ed5cb2426ae3faff6e09 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/d04fe0943a82a86762883d60bede2fe0546874df |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/76b4ddfbe74d1384cc0f81418b5534ea5e6f2f9c |     
  riscv32    |        trousers-0.3.15         | NOK | http://autobuild.buildroot.net/results/cd49fc66d0736d8ea775f12dd78e257cf3fe3395 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/28d7283d0b4529df2a89301e19a43b411f0c2f09 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/70f34a075723426eb3404ff9620ea3b5cbec771b |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/3f8f524182513925b4b6a82ade757416c7df8e9a |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/3fd1b1ba28392843cf7752800898b51ef97e5263 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/118f7fe837f2d40638b5330095957015615fdb04 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/03fcad9d487b8f9193a7d2e254c301527eaee5e5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/81d47d33ffbcb0db38475d70e8d91f7163ec34fd |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8e3e89d0d7e883dcf6fa6fde1ea0dd7fc9aefd33 |     
   sparc     |            unknown             | TIM | http://autobuild.buildroot.net/results/6366fb1a44aa222e0e0d3818d2f6ec21738c3a9b |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6073a7fe163d2f259b792fed70f766c19dd0d50b |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/01a1d0d76bab539de25294c66ab661b7ecff85db |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/65ef72845d9f97001fa020caf025198c2d3de4d7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e8f66c5bc9939f9ae8447da692c08ce439deeda6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/98a18dc5dd6426877c2bed0d12d73a6bbff1a71e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bf64d02e2f713c6949e9e1386abc482c9e465913 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21120f58fb237315a522d7fa92db156f93d35324 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8704e688289b4989fea46e810b593feb24b3d0a2 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/769b741a2585d482f072d302c379962891f0a19e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d12605273f7d3294c06461e7a43cf5386be5c944 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 18
          libmodsecurity-3.0.5 | 15
                  host-python3 | 14
                 pixman-0.40.0 | 13
                       unknown | 9 
                    htop-3.0.5 | 7 
        host-sentry-cli-1.57.0 | 6 
                    ffmpeg-4.4 | 4 
                mono-6.12.0.90 | 4 
            erlang-jiffy-1.0.6 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                 mesa3d-21.0.3 | 2 
                    mpd-0.22.6 | 2 
                   sdl2-2.0.14 | 2 
                xenomai-3.0.10 | 2 
                  zeromq-4.3.4 | 2 
                apparmor-3.0.1 | 1 
               belle-sip-4.4.8 | 1 
               capnproto-0.8.0 | 1 
                   cegui-0-8-7 | 1 
               collectd-5.12.0 | 1 
                         glibc | 1 
  gobject-introspection-1.64.1 | 1 
               libtheora-1.1.1 | 1 
       network-manager-1.22.16 | 1 
                 openal-1.20.1 | 1 
                opencv3-3.4.13 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 
                   python-lxml | 1 
                qt5base-5.15.2 | 1 
                      tar-1.34 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/3464048e7614d42cd34a9aedef131ca51d877995 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/ad4f4d13e96e11a7ceb499e6bc7e538634c6c8e2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/9ee96381cc67435fd4907af4ceb2e0df8156bcae |     
   mipsel    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/9a9d8ac05400d42c97c210ef5334cf40d2d53980 |     
  mips64el   |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/7471e19c5ca3cbcc1197de950b24574c1ff30237 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6e1303d3988c61e0a6cee364c6265be7e59169e0 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/5c6c5cb7f7846fd00779d659c428c1fe55a3025c |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4404e7160c138ee4e7c44f68fdb5d9c84d3cd06e |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e8fe44d82819a1054c29a6f7b13bfb829c6a2463 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/7b8480c56e4294ef8f95e74bd4d0e6e8067faedb |     
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4588a12b91a096283280c38aa1beebd97dbc4ab0 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/f807362c2368215df2e53487e9945357a8dcccbb |     
   mipsel    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/88ba0f4ed01f93c18bf42761b602f6490cb2663b |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/61c769560f6cd8378d7c0e0ac6034835d812d508 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/2ef025f698ccc0c9aa3bd2e61413bc4ae3fcd634 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/aec9dfa890d3a675da2e636b78e2ff3e48d628c3 |     
  mips64el   |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/cdc02e3f416a3bba90586f7bb5683044df706c80 |     
   sparc     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/38dbf12db6e5717829da8d3330caa247268160db |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0d0078f604b6d355595bab7b1ba253bb71b64beb |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/a52450a2c3181441eea8f36b8c8c1904f81e3f57 |     
   xtensa    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/4e2b61fde8ebe6976716a4d5df5fda4c6623468c |     
    i686     |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/dd2c278dc37e176ae678bad4c210b2f24ac8c4c3 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/ef84202322f8777d0942ceed6fe7d80576c0d64f |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/698cbd799ae7cf69cebe1a2ae424ad1e760cd360 |     
    arc      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/e4cbe1768613ebc91300e94bcee88eb92f7304c1 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a39cfea222e12b0ff06a9f976e9527e4c2122aa0 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/72acb8b6c14649581c6ab15b6afff92599f0daeb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3afa870d2289be41a78230bc3d5438526ab341cb |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1716bc0715a3e99881132bd6364a47191f94990a |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/a56b0ea0b8f5a1a55df309fba4c7d9c39e8cbe52 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/0a7e9afd79859321f61e52f88aafb1e6324622ad | ORPH
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/2d284dc02a69ccb88c2f0dca1ea648e63eab61d8 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/fb47d3f260ae9adc344cca690974fb53a39fddaf |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/dd787628097bad7a5ec6f87a5927ea33498cc9a4 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a07439fd94abedd9fd029bddda5a3c1ba2f0cde0 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d494d105a3366a745e7e27950e230021e18b4e5c |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/5601e62ab72b27ec717e1975ef94ede12dbb5790 |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/18b3788e7dc286cdbbf6d44f04e3d560a7d1490e |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/78157a144ee7c9f6da0a01dd6db9e859a0f23ba4 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/adee5ab7dc69dd5dc14706ff9b11904c4bf6a1c4 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/53bbb23374cb65226b0787f3e05b33e02a8cbf00 |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/dae0d23f6415f29276689781711a05059b3efe63 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/02354ef412a545274d3075c7e42c7a200d6671e9 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/4694f854b072deeec49bf011d41a69eb7dcabbe0 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/1249d20ea7a6ce024230cf7bbd909e1d60c22f05 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e6e45343f26f6abcb61b6ed3fcad95731ef8dc5b |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6e6b3d78c76c3c6071751dd69fa8722c499bd1cd |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fc9c15a872625cbf44b114b1028b62e61ef9e2b5 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/080b5b7046f633a113ca2a29cde9d7c58e1ec01a |     
powerpc64le  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7ecaa171ea76b86777160eb12edde382cacf595a |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5b55fa85ab638cc90d2cbc333783d20c2c49fe5 |     
    arc      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/b387cd1f19cb4717f762d7b7085d385cc6e7a44f | ORPH
  powerpc    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/0909657c17bc423cd0665978fb86fe15207c7181 | ORPH
    sh4      |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/8184540cd9c83c6a872fdf790a548b90b666217e | ORPH
  riscv32    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/5fcff912d7821c98a84f7fa4451a014bce6e4d42 | ORPH
  riscv64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/07e4703e129f6adcd7ec569a47423f4323a9d49f | ORPH
   s390x     |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/dc3d97e2a7261cd739d9634291a755e65eb05276 | ORPH
  aarch64    |           htop-3.0.5           | NOK | http://autobuild.buildroot.net/results/a18289a2b1dc0139cc1e926ea4fcf92b372dffad | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9fce8751ebcf7ca085e541d129aaf3db92ed01e4 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/7dc1706fdf650ff14d7b1cbebc140e11cadcc827 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7e7d219d3032e3121bd7682200e5f8417fbb1444 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/329d4dceb7c31d733f77817917ca5fbecda9e6ae |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/4ebb5b7299e652f94a5644ef810fd597fb120377 |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/a79940cb5c3ddddc73949a2dbfbf2fb0dbf7fd06 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/8d7ce59f1bd2960e7265b6f28cd55b3217b85230 |     
  mips64el   |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/97bacea7d347e3df7122e36fb28ee53d5babf2b8 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2d0206d733d86448a84fb45125d0decd2d1fbe26 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/6f0623ad9f7deff2e18d5d30c870de9ac4025163 |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/c212074c717683d732b8173cdddb2daa6b829586 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/92558aed21ddc28bd6acee098508af214b95e24a |     
    i686     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/1acae6d065ef2ec5be4255e224f141e81fe9af22 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ad70690ab94e84350adc9dbf6d655f206bedc3f6 |     
   nios2     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/35e436afb0f0c10d53035ab816d21fd195de7714 |     
powerpc64le  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/cee6ee7cb90021704f93db447895c92e6b5b2f4c |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f9b550001bc4593fe279fc1b8309aff84ef9847e |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/a7b93ae2f924ae9d6cbadb5b687c7348ad56c8d6 | ORPH
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/a91f79c95841ab2244fb4cfee8237f2ba37eaa4c |     
    m68k     |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/ddb293529eb3d59e11bbad0f866066da2b2d3e16 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7eb23f047f6ad2a406ad343fa19656e9e8cace77 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/8aad690e1556130589b41cb898f756cd427e2eb6 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/fe5ca114abb7a75717ea69a84c2bef97aae098ac |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/43be7179b3f28f3fa48db1b236febb7d16a37d0e |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/cf25e20a2680c0705f45e5aca2fcf512872eae9c |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/48cd9668a29dd6ec6481b5bb3f303b6b44f80fea |     
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/5b3853f56c9ec4fc4832bc51ba0363c8de228ebb | ORPH
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/b969d83d4d4edfca1c042b53884de570868cdc43 |     
    arm      |         opencv3-3.4.13         | NOK | http://autobuild.buildroot.net/results/a40a2a364c9ddc514c69991e706d9be79131b3e7 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/9de539d8e8ccc11392a4e053ef129b72ac979cfb |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/fa936a5f412590d128f39dfac07543ff25008778 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5dda02851d7e46e93bcbafe79ebae9fdc2a5795f |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ac036a4b0dbbde94cddb2fed4d7a2f341724debb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/be439794956eee4632163785cc49ea073ade9048 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5dd58b64443d7e0245b4e35d032c42f4609a9719 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/de86b346a0f02c65a76ffb67386c12790fda28d8 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4ee03ee53d6f586e7433ae8f47d82e7bed6240cd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e3fca6d3282dafa21b26a18bcf55a912026b5f42 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/863716e7188452a8ff31d7f1ba99725765141b99 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/72ff0cb5109bde902cc79d3f13da0dba80848381 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b6dd4fe83e6029331f7b9719999f81380787f158 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/2d6b0d374a30f14675dadaa155ff3b6a4488b55b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d47d7ffa962b586529209b8c06b45a4563fcb078 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/8273609b9dadb473b85a7e2d5cc6616637faaaa1 |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/4de2d35fa8783d537629d69000b7c847c28b2786 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/12ccbfb98b4f43c895d7fd979f535400422c6caf |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f117850d23719ba1313152c68a27b3d1ef238afa |     
  riscv64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/416044c2ccdb6959e002692aabc87eebbb67ad31 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/1ad224683ad671c07f465c03f5aa42cd43e0dba5 | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/fb4ba3bd03ddf4ff75aac845cf6e1850147db5e7 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/fc22b4b4cf6e523d10b82348a33fef0d9ec6023f |     
  riscv64    |            unknown             | TIM | http://autobuild.buildroot.net/results/ef11a025522406254213350595f8ae8b9f54fd70 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/254559f90fa7b407ff395311e319e32a42267adb |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/3aed9f3c11fb8ba61bdd327b2f99b55b7dd5c504 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/35797155f9f5c1ef3962b1478ffb207f4776c33c |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/2a1f66a9b72445f64c2f7bd87a1a85eebd4c1a52 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b47e61b8bd9212defb8505ec091c407dd59a5a6c |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/10fe5701fef2ac6811117ce2ab5d699d43602c07 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/8a0457bf22618ba1ed23478e1f647993f72b2f52 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f3324e5f02fe4645eba98f2c4a588699dfb790ed |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/5eda492c83daef236783909c440cacf41b6d7c69 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/396a7438eaafea6a03abd784f07b4b11ca3a452c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/536725432d7f4bfc0945024bbca83b873cc1e2a4 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
