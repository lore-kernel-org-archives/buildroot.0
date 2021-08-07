Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090C8C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 07:05:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F32D61167
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 07:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F32D61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7BC606B1;
	Sat,  7 Aug 2021 07:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79vyt6Vg0SfE; Sat,  7 Aug 2021 07:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C824E606BA;
	Sat,  7 Aug 2021 07:05:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9ACE1BF5F5
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 07:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBD0882F39
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 07:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLOQmkaiu8MN for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 07:05:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B9A182F19
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 07:05:14 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CA8D9100006
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 07:05:11 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 07 Aug 2021 07:05:11 -0000
Message-Id: <20210807070519.BBD0882F39@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-06
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

Autobuild statistics for 2021-08-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 277 | 56  | 16  | 349 |
  2021.05.x  | 266 | 58  | 19  | 343 |
    master   | 1243 | 431 | 63  | 1737 |
     next    | 269 | 168 | 20  | 457 |

Classification of failures by reason for master
-----------------------------------------------

                  host-python3 | 48
                 libebml-1.4.2 | 33
                    mpv-0.33.1 | 28
                       unknown | 23
                    ffmpeg-4.4 | 16
                   gconf-3.2.6 | 16
          refpolicy-2.20210203 | 16
                  zeromq-4.3.4 | 15
                    qemu-6.0.0 | 14
                         glibc | 11
             libmediaart-1.9.4 | 11
            erlang-jiffy-1.0.6 | 10
                      gdb-10.1 | 10
                   libnss-3.68 | 10
  gobject-introspection-1.68.0 | 9 
                   sdl2-2.0.14 | 9 
                harfbuzz-2.8.2 | 8 
               libgtk2-2.24.33 | 8 
          libmodsecurity-3.0.5 | 8 
                 openal-1.21.1 | 8 
                  polkit-0.119 | 8 
            qt5location-5.15.2 | 8 
               capnproto-0.8.0 | 7 
                librsvg-2.50.5 | 7 
   openvmtools-10.3.5-10430147 | 7 
         nvidia-driver-390.132 | 6 
                qt5base-5.15.2 | 6 
        host-sentry-cli-1.57.0 | 5 
              libostree-2021.3 | 5 
                 mesa3d-21.1.6 | 5 
                  mupdf-1.18.0 | 5 
    trace-cmd-trace-cmd-v2.9.1 | 5 
                   guile-3.0.4 | 4 
kvm-unit-tests-kvm-unit-tes... | 4 
                 libqmi-1.28.6 | 4 
 Makefile:740: target-finalize | 4 
                    mpd-0.22.8 | 4 
                  nginx-1.20.1 | 4 
                      poke-1.2 | 4 
           python-pybind-2.6.1 | 4 
                 apitrace-10.0 | 3 
                 dc3dd-7.2.641 | 3 
 glslsandbox-player-2019.08.23 | 3 
                   gvfs-1.44.1 | 3 
            libqrtr-glib-1.0.0 | 3 
              libsecret-0.20.4 | 3 
                libvips-8.10.6 | 3 
                 openmpi-4.0.0 | 3 
                 ripgrep-0.8.1 | 3 
             s390-tools-2.17.0 | 3 
               apcupsd-3.14.14 | 2 
                 gerbera-1.8.2 | 2 
             host-cairo-1.16.0 | 2 
                        lapack | 2 
libcamera-3a1f67a8031ac5ad9... | 2 
                libesmtp-1.1.0 | 2 
          lua-lunix-20170920-1 | 2 
                mongodb-4.2.11 | 2 
                mono-6.12.0.90 | 2 
                  udisks-2.9.2 | 2 
android-tools-4.2.2+git2013... | 1 
               belle-sip-4.4.8 | 1 
                   bullet-3.09 | 1 
              containerd-1.4.4 | 1 
docker-proxy-55685ba49593e6... | 1 
                flannel-0.14.0 | 1 
                       gdb-9.2 | 1 
              gnuradio-3.8.2.0 | 1 
                   gssdp-1.3.0 | 1 
      gst1-plugins-base-1.18.4 | 1 
           heirloom-mailx-12.5 | 1 
               libtheora-1.1.1 | 1 
                 libvirt-7.4.0 | 1 
                lmbench-3.0-a9 | 1 
                 midori-0.5.11 | 1 
                  motion-4.3.2 | 1 
                    mutt-2.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                  pango-1.48.7 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
               qt5webkit-5.9.1 | 1 
                suricata-6.0.3 | 1 
                      tar-1.34 | 1 
                  waffle-1.6.1 | 1 
                    xen-4.14.2 | 1 
                xenomai-3.0.10 | 1 
                       zip-3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dd74edb0f20d204d02dffce94f254157788cedbb |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/64df543ad103405771c9a259353e88d96ee7729b |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/503a3187d6fcaa2a1c4b9ff57fdc7600c44cfa08 |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/71c7fa4110e35252ed35b57d8bc233afc0ebc3dd |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/b218935f5ded61c98b9b9113d351f1a7da55075f |     
    m68k     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/6a881e99e84dc524746def74ea760f233e7e4bac |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/84ecd558d32c6a16a182e581c1b80f65fc45706c |     
   x86_64    |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/79cd2024b3dfc8d3e896cdacf67fb891df81ca6e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e330ae28c7a2209f83f179c0b735d5abb744b8ab |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6ff5738baaf7a246d37c339d0396cc3461343876 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/933bc540677c4c12da43a241e734cc61de2805a5 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/71a40c56d660fe64b3a6be830655c18e0aa38cb3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6c4bcb157411741782e969fc94f4f51186ac33af |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1e3fe3e407b81918a633756aafd0615982a142fe |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c3e93fab501cba0bc751fe64f61606099b11484c |     
   x86_64    |        containerd-1.4.4        | NOK | http://autobuild.buildroot.net/results/ae6c6411f73daa679e2579c1d5d88b3209446414 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d6285836c2f84c0ab70660d9d462edc52d7effba | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2882d0f78c3e949811cc7d80c800f7de19cb7404 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c9b40f82417ca9fba9c4eb4025d2d8838d4164b6 | ORPH
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/25726359153f609da17aca501783f1c566eed0e9 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/7f112600c2a7023cb2a018a80948fb0a7d8bed1e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c4f14e34312cfd7b96f6c91350485ceaba6c025d |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f73ea395776d78d7027413b62837e28b4619a90f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0c89a7fe6e4618ee03215acfb4db623bafa65bb3 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a2a916ae416a2a30986f6b922dfcb63d30016467 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/44a8e78506c0e152715527911e7fcc59872d6d41 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/555ab88adf3cef23ff34ee4ca5b1c3ee9963772f |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c2e1d566023b7043a478f8eef89b0ad578d6b682 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/ea0ac24423242f7b73d0e678ea3f6f0f4d1f9f19 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0b17bc80fb343aed80281d049145d144d1fa6e71 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6b720f3d45ae778d34d7e1d913ab6a642505e75e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/f2a0ae4b3645981e6a20103404285f40e70e763e |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a58d643484ba8fd1ab24dbff78c25b16d032b6a3 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d1b21db6f4edc417613c9a9234947e92032e4bd6 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/fb4c8e83d99a7eac745f11a1011ed6765981ce53 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c3892e49c428ea7ec721dcf2b4ff2eba6453c8a0 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0163937c84ce13a08e46fe4db65a4a0e47243b0a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/91abc16046833727cda21d2b95e5014d154f017c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/2257a5ed4f739df0f7fa9488c9cbc08d2c36df43 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ca3416b53a6fba5e444c0611925d85ba66fa82a3 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/25a7d5dcb6f8bded3f0fb71af9fec2ca61397b20 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/6c4a2a62849bc33e4cec60b538ad2abf9c485c42 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d1c8a1bccb414942adc6a55537fc1c3e3ed60c10 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/fdf8663c1ea9b8bef8463738c805b7ba278f58f7 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ecd100203226963a4f737b6a8ce45b97b8bc8dd4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/528e200b7bb946e25b8c1084e681538186479381 |     
    i586     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/18f53bf5206b957cccdbb6539e0d23d5c3a87b21 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5ebfbaf857385a1798fd52e48f4d1e0d4e45e990 |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b9f80a485c123d2d1aafaa389b70444a8e9f675a |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/cfeb375beb22216b757819ec795ddc462407b18f |     
  riscv64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3da8f6d9b8551cc44899153b95ae0e336b5b4bd3 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/bd4754a6e193517d75b769dab35f4996bdf5010c |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/44a69e0ec41c20b60ae4c2f80ee4342418bbc057 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/103f9dd6bce8221dad71a5cacba3dd83e0628348 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/f0db4fe99cf946df18136764f110b70d548033b5 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/0ecc22cb4f48f190d2908beee0f5e7ed63295e4b |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/a8292fe6160141ada524a07374dfb634f966f8b7 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/bf0f84470e10677987fb37b432af78f33b058171 |     
powerpc64le  |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/36418085157dd2ffc6e265c9259ffc78e378fbde |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/b69010508ee4f8c3ba49c2161c12c444e5cf2b48 |     
   mipsel    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/5a01fd839ff0edc87f70aa4e5fbd9bad831eb922 |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/8e460527615fe6efb14e3347dfd94218263f88b5 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/60a4b9a62ff0f12633b53f4729611cb79f81a767 |     
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/bc87f5a891b618ce1cd8add4227f27964f68ccc0 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/6e2d00d5b6e4055cff6151a0f441f9c2c5db57e6 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/3796f587a0a04d0ba28d215a510c934e09950e23 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/1d10ba2e8f3aa9df64587eb5a77e3cfa2e74f555 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/8e40c99c8489c5cb5c442e5e3b692afe85684d1a | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/82d73faa39dea02e68a20a6ff4e003468a54b0b2 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/a19ed7f16d572129f50f6f4f033a0253431e4039 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/6d713b6bd0e2252cf1cbafc2c7b87800e0ffbd03 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/4f86c6c42c2ccb4867b8cd422d281b43bb7dafdc | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/c8c2cc6bdf027ac43ae5e789d180f63c98351ce1 | ORPH
   nios2     |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/38e979b489f6fdbae9b1c8376b344a3c3d92d4ab | ORPH
  sparc64    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/0fa21b13ebf3128aa5a4d3c0957b425350a8d7ad |     
  powerpc    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/36c2172581226dd9f2ac0eb829dc2d866adf83e3 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/d24eb2f8d1863e928e2885e4abf39bd11d7f5184 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/87b3e5715cfea643731b54205d65c3951fb5eeeb |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/f93245e0817ad62ef245eb293aa1849d5569623a |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/67e5de8aa30f6159ecd3c6cee3c5a232518732f5 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/d0368690de767a83fdfb23fd92050cf1725b427f |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/07c0c0c5c76c788aad59b2179a7574db93ede5df |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/9d7a3cec8407b2d8dafc2a19b3a6aa3bbf9000a7 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/73b4134f919071574c572cc3f4526ab41d9fbd57 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/92278bf8a60bf2f051bac826263c825136953382 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/c6399e12cca2f4406ab0566f97ab4992b67c774f |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/3ac69ef770b2146bc9566aef6d3a1efa481b01ee |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/ff0436b6910d7ac84be14d68ac5cd1d3203f414e |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/4a579346463d0d946d6d2a05723270135d728981 |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/a1b95950d35c6fe0836dadc086113053d5dc888e |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/ca3f8c41c5b93ebdd7663b754592f09204b04904 |     
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ad381f255e447e43dcb0e542d84c633efd37a2ac | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/8fbb86907a647a51424244094c8fe382aa6171d3 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/7f02b0c6b8b94bffbc8fc14dcdf0225621e947e2 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/47f7fdd0be6125ba91a4de101bf00c87e7b2c2f5 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/1a844751423ef59ba4cf689eafda2d527291805a | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/bc0cc89fa0d1e54d1a7b71cac9c6d9c05ffedbed | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4e498233bb89ccc69385ad491337235dba8002a6 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/3b8646d6871603a6a552d17de5a8dc0a9433d05d | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9156d3433ebc951b0174f6746153fbd2b948d3b6 | ORPH
  riscv32    |          gssdp-1.3.0           | NOK | http://autobuild.buildroot.net/results/3299fa4ae6e22224d4394db7aa8fd481d2775a16 |     
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/a16eb64ff7cfedd1685f29ce2a194201b5dbaa45 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/20b61e655e155c450956ce98e98b71f2e64c822c | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/020a134cff991186ce9f3f6b092fb795aa083fcc | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/3cbb13da6c87c84db900578bf5a068372c9861c8 | ORPH
  riscv32    |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8 | ORPH
powerpc64le  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/ba9a8b31e6e275d4db1905241a9153a0513eb335 | ORPH
  mips64el   |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/3c0c2906d21439cf7bace931338f6043526134aa | ORPH
  riscv64    |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/9187ee3988432b975bec3d623a1e3151aed8281c | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/f548c7dfedecb889c3177acf94da952a82514977 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2b3c9c1a7e5e8014678018ffd80ba6371f06c0a2 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/867817e3b822a96c9039e7bdb2f72e21e45c7db7 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/54cace71b5268825d18a4ed42f51cb49678c7087 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/16af20345986b2f91faaa5e6459885ea7064396d | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/86a04f5730cd768dd61c2adf1df3b25332e6d234 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/1eefe58a887f2f1ec2e045ee061ee2921197a752 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/c47a89c8478e99680c2f545fb0113229e3d93040 | ORPH
    sh4      |      heirloom-mailx-12.5       | NOK | http://autobuild.buildroot.net/results/e05999cc302ef779760308b9f0d8b2efde4f2bd9 |     
    arm      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/6c9e5365827df79c7c9c071f08eebee0b029bf3d |     
    i586     |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/297180393c2f2d8025a5cf8de4878be69d7fc721 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/a5809cfbe89ebe82a032cfa6d88fdda5f76a9825 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/d4c716f1e2109c189b041f6e601cb219c3cb9667 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bb931ee35b43a57fb309a6f85d75abfd5a08d0e9 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/32611802fc58091f2937f09f7692c2350f93e504 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/2c54c3449057ba2b873658ba415d7f29534c0089 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/ac52d0c4579b48f494570bbbdd2dfe5e49d29155 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/d70000563eeed257486ff2c34871278adbb5c8f3 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/03ab681b3e70d214a73a716ca8f085cbf2d50f43 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/e4e6af25866a863d6ee0093ee97eea0eb0e5342d |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/29563c5de9ed2bd9a55625dafdfd6758739e8e10 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c1ddf774d55ea15b3fc1787f8b8223a402f324d2 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4db16aff7e8a565335216caa9a70a9ef95522bb5 |     
   sparc     |          host-python3          | TIM | http://autobuild.buildroot.net/results/2a4006bf70403330c826a76f27997d17f61dd714 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/c5f20775fa320d6a12942c9d0b7ba17469582935 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4f85e403a8bcaf6c6058eff0f54274d3fc4d7a30 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/3014c9d083565bba91c915e8df653e3fba3f3f2d |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/882f98374266ef7c61b21c7a1341b22ba6d72ff5 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e5e022c11c9608bd57d826105bd48eb29bece9e3 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/9d9c0226d83fedeb6637ddaa1932bb78d1c4d51e |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/08a296c93e08862187d0cf922c44d6d02063b6f5 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/03790b4b95fd238b125fab1e6861aec242cf0032 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/336c627b9da4baeee3941efc70a1c68a3a6c5078 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/51e2ebe92f67680491ee2868fa761c65b9ec3220 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/5d98cf213bb9b7dd4dea1b8f31bf7277979f98bd |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/bf3766c5783a228b990e857c61e8a3bc395b0c28 |     
   mipsel    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6eb308dd596b697c9d4e9f60c46e0c36c51e2f5a |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/4fb1d884cfe3830a3c0e8013a4a1ac4a9f78af8c |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/ae26e5bec314ae57c724c509092ca65d93aae63f |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/4901a449bdc661e0968e5cc51bb2b5f756ee1112 |     
  riscv32    |          host-python3          | TIM | http://autobuild.buildroot.net/results/586522499e6e8e2b0cc15e90b2987d1d00d76853 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/ff1e8ee00ae13f0bb4dea6ce8ff18968d09c3b1c |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4c9424f5b39deb5b1b12ceadb7eb0c8e5e0ab76b |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/f175d3813623a754e88074b0b0524943441f16ad |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/dc35816eaf65c4fa26616a176272f786aa990b41 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/1ef8edfe8eff610a85c8a87452530f355063c646 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/770ba5446d0ebcf5de64de2f1dae521981e53440 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/1119c41d2feeac68f8b11a6dc511e0b8dd3e9248 |     
  sparc64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/a9c53e2236d24abadde19bfc9e81bda0e9aef549 |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/4ff3bae358029195ef34355a9b064903cffe06ee |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/dd123a590cb7dd9df7dc9830ab26d3306d15816b |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/550af084a1f55d6535f0d9ca7cba5d9c6fce249a |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/c8f1fd14899de0b724d9be894dd4d20ade785afd |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/29d80fb3e0bd6110ca71579af7df62fa39b1a4dc |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/161ee599c58f5005cd9550e5fa2df3f33af72763 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/a8ead2213f918e9073853b381fa378728c4098f4 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/ea2cf554a7feffcfac51f0026f3c347905d42495 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/73e0fb518f94c3e0a84ac7102e16cefa95f9a3bf |     
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/8dc578fff0a486134d226f284c11b059841e27d4 |     
  riscv32    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7c8a369b0d8ea493d9c230bd09753c8e1e114fb0 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c3c8e1e5138eda91359ec6657aa83a95e3c25441 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/552061b3077773b2bed494e440c60e5518044a55 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f182758223facc271ce0e84b215838609df6539 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d899bc3e74376efdb0eb5ddd13658a9c8c78c384 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e93c49490dc2f274a5ff8031ae892786f4b39340 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a77d6803fa92f364577d9b21477874eb64e71fa1 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b9cced44d90ff4de801c6327b56074b27087118b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/611c0534422ae773da7b84b6bc91aeb6cb903deb |     
microblazeel |             lapack             | TIM | http://autobuild.buildroot.net/results/39eafea1224ddbf53ba3b60c2c0dbc75fd7f2303 |     
    arm      |             lapack             | TIM | http://autobuild.buildroot.net/results/0037128a51b48a9b30431437631ab67a3e390dd1 |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/62c0fae1c2312e3df708381c79fb732411448263 |     
  aarch64    | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/0ba66f4f13c90e2dac581c4078e9be437cb15eab |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/717f95bff2a5571aa294005d435891276fd1a15a |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1e4848cb339606096ce864d721b65d0b862c6c6f |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/32f0287f32a4f6a0b398a06a06afe329799cb56c |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2f5ccfed78368748c0cc07607b768a3327daf90c |     
 powerpc64   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e50b118122c4fd8b40b95911f402b78315df281c |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d470dcf95dce33d559aa700ba2b3d5f42c107d6f |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bd9282e079a3f4c085bd3f0a0396cb009c7307c3 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7313cb3df07a097e7b85a0e05fd51ca9e658f050 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f4986771356d1a438633cbb2c1f3b40bc2fd9d30 |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6659aa1b8afa9baa953caecf164949863c10fb1e |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b2bd1500d4d634a3b7c38a809def19e74098e5eb |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2a137607aa6348100c1e64315aeb31ce3aeb8cec |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/319d134c6912bf1f9cf0cb1f8de35986afd35731 |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e735eb6313861aa3696d74a3d2f817df2d6d0e05 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/abbb9bafc795704120d9f80dd23afb2cadfb80ed |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/356cc6da3aab862419d2bebbedf59688040f40ef |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/de020e465b329f48286adfe1aea79aaaefc37530 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2c7fb04de9295eb58045363eae50930f4d0aa1ce |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4501f895a00a01d317e0be2c124923c10a12763a |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/aa4602fbb6f183d9ccf9e1a2ebde02cda8ca085a |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5bc018beb6e9c7210e94dd3c0087c4e4246f9fe5 |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/aef02fc20d3bfb494be18e9c2fb98aa210a27603 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f56323a37c77822098b761a7934ebfbdf2f7cf87 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/990d11558822c02e909e4140f11ddb3313b33e88 |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c91797901c1105e7c2a22f9862468b116cd4cb62 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e8b1086c71bda2bb2ddaa8733012eb3fb36dfc53 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1cc77c89bd40728f00fcf757bf0ae22eff4765c5 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bc3d412416b4735413556cc5a38c3f9b95e6459c |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3cb7f55a0d15a70f186a6fae579ff48e85bbcf69 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/44c0098ace37a5acf0f1acebc2ad7e120806468a |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/131fefaa1348c615d81af5582e7384cd86e8e94a |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/31dbeff3d1177709548529ddc0bc6f8262a4e79e |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/43a3fa868695308beb566e24e63db12a49218649 |     
   mipsel    |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/52bce321552d23c10617c4ba4dc5b290e1d43dd5 | ORPH
microblazeel |         libesmtp-1.1.0         | NOK | http://autobuild.buildroot.net/results/9bbeb0d8488256ba63a140869bd9494b10816d0f | ORPH
  riscv64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/dd4ba7ca0830a57c47966766c7f2d03d2b34b05f |     
  riscv64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/265f893810037301b5faafe930e442cddba0393d |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/8c11e6d6b1733a16983e7ce105c146615e62ec7c |     
   mipsel    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/0549f3dc958b7c5f773b83c79f77c291ec9c9551 |     
    arm      |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/2dad886cc83c69b1b9f2cf4630469074e4b94a16 |     
  sparc64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/2ccb8cdf0c4906b3f3617d24d18b04ec912a432e |     
  aarch64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/ed2b8e0c6506f1c8247863fcc6e0f45ca5f87e14 |     
  riscv64    |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/03f8745bbef95ad9ad0b7372e5b53abe165c7b5c |     
   mipsel    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7888af5a115d2cb218320d4f86afa76b206c071c |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7e83a096aa57a55c6568999502c62711f687a67d |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/ed458ba47eb5fb02dc8c6a9f9c3a31a2fa2161d5 |     
  sparc64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7321e42d15fad576c199926585ee2098de4bec45 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/fb2975e181292cdca6c0fd608caeb6f2af381d87 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/6d85a7ad6c2bd201d548d5a0f48dc601b81e3efe |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/9c6721d4e93eb74af6de8fdbe857f604a62eaff2 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/291d5a92ce3b1537c377ddd8f712c03d66afece1 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/5bd955ecd16c9cc638622dd0953df8de8aeac44b |     
 powerpc64   |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/7f7fad1b7c5d0babf18c14c3e8f0bb5c00627a74 |     
   nios2     |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/c005bffa988f84d5d980af2c5c2e122885b8f498 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e274bd43164bb157555a7465cf2e45f63c53c76a |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/9e7775224813dea764f85e80bf30c397c4a61aed |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e493887d6c9c837c85e737e79200b8368c52114b |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/aab7cc5c0474372cab47032b2fe6a6277b78d5e8 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/420da547a77d5c6872b8797da2c578a1ca20e299 |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/27ef4ad6e61215cb94b31101672062e0614ac183 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f53598d6e7402c2c41ada9438bc185e600df0c5c |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/024489856ba1cc067ed87ae1301297dd071bb855 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b858e60da03c289d103d798ac4431362ef2ce044 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/85c261b2123603555de63ddf035d70d8e60d5312 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/99f0093dce4ab51c379db66929be36e2e25b78b2 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/c24b2e3f1a86a16d23ac7adacc6f54fc5cb86ef7 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/77d2a69080d0c6de26a8bdb5a4b3fa5f76dd1fd9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/452c5390e35e9d6d35e45543a3eda72370a5a44b |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/16e3a8b94623e6e569be032b818382c843ff3496 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/35cd42784c1ea71a7f3e780fd7a8405190767ed9 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e78156231b0595e67385ef6d15e89cba4c549694 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/99a46b8af4206bb5ae4ee7ee1ed83c5fbf417c1f |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/504ad329310d34fcfcb343dcaf9eb0858e6c6b4e |     
  sparc64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/210181ca21675f7c8ad70bf1d640a87e94f22bf9 |     
    arm      |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/d48c8f5442b4ae62a23bbc34e63772e1735ac208 |     
  riscv32    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/b5c979b297898589c4e6a4dddef64d7187175f8a |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/68fde93964b1312fa34aee4c750ee52d7170cc63 |     
 powerpc64   |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/9d6b93a9604d51c6f66eb3942e896280b0376b62 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/14b0661d8cd7d99bc58a239ac8f8f9f1cd528950 |     
  aarch64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/4fb7ad9114795cef40e1a4cfa72aa9c679e22c57 |     
  sparc64    |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/ac9029db9b53b637348fb35215e14ec3e3d4f8bf |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/bc9880a287dd8e8d774ec2993f93362a566e8318 |     
  riscv64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/8f7e2c9c4770e3b1867de3cbb8fd56c8933ea4b4 |     
  aarch64    |       libqrtr-glib-1.0.0       | NOK | http://autobuild.buildroot.net/results/7c8782a57c5f32d6eb990df932dcc9c51de839ae |     
powerpc64le  |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/48ad908eec881f7095d4fd3645d79a53423478f6 |     
 powerpc64   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/6e46319946608b863f97fed653b00a1dfbec2b08 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/8fda7bd652c12bfeef17da6cd2a84845eb60c0a0 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/cde3de024cf5e60256bfc43cbfb27b71be247d9c |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/92cc7763db6ecf301dca52ef755cef337f046693 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/19e7fe31b8f2333bfdd0dac3d4058520aa746727 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/80b3c1cb2d7b87037fdf0e2b64ca2a5224a8a7a3 |     
   nios2     |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/5dbb7784a1137c2cd2f8ac028373f69adb2c2273 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/a85573b24c68adb3cf35a53d1543f12e1cca9641 | ORPH
  aarch64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/905003acaa95bd4b96f2c072121af8644efdbfe4 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4e5c75af71e38b4d2b609a17fc1520ccb92500c3 | ORPH
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/5f6e3408f6a027ba047e58102673571c60a210dc |     
  riscv64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/9661487d2405b3a09187bd95e97f208c6f968e3d |     
  aarch64    |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/4598277cf8b3c10205e0a17977cb4dee8b2fb639 |     
    i686     |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/a2657eb18b579752c8217ab356adcb52931f6785 |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/74ee794c3a03d262e257d70477cf0e11b07e72e0 | ORPH
    arm      |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/c18490e2c0c26fadb46cd022b9d033a901a1d731 |     
   s390x     |      lua-lunix-20170920-1      | NOK | http://autobuild.buildroot.net/results/078f5af81a39c3bfd16a7cd2a7809653fdd80a06 |     
  sparc64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/38e0133b286176ff51ad666dea3f8a8722888294 |     
  aarch64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/d9a15775eaff380f4ccf8338e45889049d440787 |     
 powerpc64   | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/206f87c1d7b7cf22c40d5f807950c631a4d16847 |     
    arc      | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/06f06add688b11a7ce51be00f0cb8dbd9150f1ef |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/0ff904b43f5570a52cb88ace169a2977cf128ad0 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/e60fed75cab893b97982f56750dbf26cd6502187 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/4e9ed6991dc1cc0cdcf8d55cb89d1adc0e56ef68 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/c36b747113116aa6d7304c3b1d47189e34129211 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/b6cfb1a6e42f0997374f1bbd01967a3d3daf245c |     
  aarch64    |         midori-0.5.11          | NOK | http://autobuild.buildroot.net/results/3f307a06574d7f11d58d33fb172576a5f9a56b0b | ORPH
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/cfd083decd20167d2f9959c53dd6ecfa6febc63d |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/70f3bc54f345863a711928a029caeb46f1a3c40f |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/7a1b9fb9afec396ae0bbd377a2e7f6ddc6239ffe |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/34d930151c7afd648a7b632f9136812fb2aa69c1 |     
    arm      |          motion-4.3.2          | NOK | http://autobuild.buildroot.net/results/62ec618e40081a250b8129ec6f5a178eb06fba1d |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/cfc471c6d0f0845815b4c6df383ff3c11a1d9a3e |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/c1a7438ebe4f74474735535143a8e70c9d2603ca |     
  aarch64    |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/4888d99404cc4273349ab036035c5ff7e086b83e |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/50e9941974ff4eb35d9e692f56b84b7f6afc89a8 |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4ff301e5e4928d3acd1c0755ed16c7072a3ca3c6 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/ba088641298447d069a948e3c14bcfc087eaa2e5 |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b46ee10373f88f613ba51561b6ba937e733f651e |     
  sparc64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e540887bfd9aa0449947c66c6bc9f9a252bcaf37 |     
   xtensa    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/2332d605707c06da06d466b22fd4363b35351234 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/55c9560f6e4bf3d76674d97fc82533403c5c384a |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/98cc3b321f4f9e7c50fc531665a77d5b9ea2b6b6 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/de2199b86dfc566a9cf51a5a90a6acb4dd24447d |     
    i686     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/01fab199e717895320b40ac6fcad45d4f42da818 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/e4b23d01f91040cbc3695838a27c9e440306f939 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/9bc04d35f0b1477c8f672ff0ce8f4e9d64cf52e1 |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/caef90a506991083c223df278f1d23e00950f4f4 |     
   s390x     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/91af13cea1bddcbed31a5431073d60ee64767a5b |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/a2c6454c8cd1571fb344ddde42d4085cf2d500ff |     
  mips64el   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3b732671c2694b05a0d185f24471f378b88a1bd8 |     
  aarch64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/106c17e4e10d32c76c1db418e075f1aa879d1f03 |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b34fd8d0f8edc9ace69a337f9771b6593cb2a330 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/cf252b5288b7ebf6218acdcbfd2c40e3ee6697b9 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/b6efceaf5bed4178903c3fc25cad2498c5fdec2e |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/0a05fd667b61b61a6bc94a79afa1876d4bb982d0 |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/4c05fb10b93c63a460876638529dfa740b7ed013 |     
powerpc64le  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/7716a79f6b41e77264abb1bd98b6539c1b2a4121 |     
    sh4      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/c5b8794432fa003a8d42f0f8ecc55585dfcff02a |     
    i586     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/276004010dc7c572b4f3b9838b3678071b66acc1 |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/5f9ee6d18160b5a673fa6c06a7aa1e7c9a2529b3 |     
  riscv32    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d04253b7fd192a21a2a5544a4c921bfd4321f094 |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/183d99f60ce92c2dc85d61cae135b31d9facab9d |     
    arm      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/f1ba0828582669f23e70d0fd2a24824ea93bac06 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/a1992a07b301e54d7e2b82009dea351c3c0ab07e |     
   mipsel    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/8cb9b569c61b19dd4f772844167c2b1c9a3ce7a7 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/17fe617ac68870ef2197fd0f88bd610e50cda66d |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/c75fbefcf52e4e2c39b22eff32f2a4fd362f51ae |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/082e0e8384a363f15a97c65589bdc707bf527699 |     
   sparc     |           mutt-2.1.1           | NOK | http://autobuild.buildroot.net/results/e357984853f8ca879156245717fadbeaa9b0dbae |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/aea0923629d77b7aa50bd1cc4ec45e304916dfcc | ORPH
  mips64el   |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/2d3dcd3263c3c00991f65904d6123019ab005add |     
   xtensa    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/fe5f5f2264d4dd84a6b32bb63f7e4e6cecd83f56 |     
    arc      |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/83707317d673e49049b7eac3302d69de6f5fb4e9 |     
  aarch64    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/cf2c3633f56d6987228d311101a7f56616d330cb |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/77f9d4d82381555b67c0bdda82e0690287fe577f |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/87e304953b6410289992680bf987bb9764b04bab |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/62f3dd123fdea4a40350ec729f8598dd50f7b55d |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/f7a16a56a4106fe554b7b9a0354293cf9788684f |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/faddfce98298ebf88c7762153665f6e98757e2cd |     
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/80ebd86c5484e87868706d4175cca04e244468c4 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/18869813030f096b2325bdfadb3703f7966febd8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/186700e423a7e45ae88fb6fce2ad128ef2d54b87 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/2e6861f364a98100ffb5880646e00c38c892ece6 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/597659ae89d60b9c9c106f2ecdc7e4fbbe05adaf |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/7d97f991c4bfe40fd1c4dccafc8b9e163e78798c |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/6eed37165f96b9082a46c584fce16147e3e8c7e8 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/4b68ccdd4770f7a60066aecaa0a5181ca36d26a3 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/1ba4e205a9217023c782494c37725ed4c8202046 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/940f4abc236b8a989cac5b0568dcb68a96f71d0e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/de11d1f86c4f285981f0f087abf1624432cc8743 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/262be38f758621603dec5614179d1be6aad34a9e | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/6a0dc25766039e3e9a5024ee883a54a3586a0970 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/41196dc3a2c1c24a3d16422937820cee8c797f2f |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5e9a1048b274b89d410555e131dc01ea90382327 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a99ab87b7d64d18ca78bd9d36e1a848c26bdf3e5 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/684f339abccbdf8d94d8b299772406b857a431ef |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a59539094bd4112f8a9830e8d71878fc96430670 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/0ef3dac3aaeb966441351047e5882a7471537d4b |     
  riscv32    |          pango-1.48.7          | NOK | http://autobuild.buildroot.net/results/ee93965dfeccd9d417727153a2f671e0bdc19f3b | ORPH
    arm      | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/f40fde48d63e0cd91f2070924c5460b1a8565795 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/19d62f186d29e6867b72e49291c18b7f8ed5ac46 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/88287a3c8de55b5745338945201f5b72e0bd4954 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/3c8e4588d11211df62c0bcea0d2bcef4945a96d5 | ORPH
   x86_64    |            poke-1.2            | NOK | http://autobuild.buildroot.net/results/37539bda89b31b2f2f30aed531cca8658264c5ae | ORPH
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b530c1e87eb460b87058fbbf20f3cf5eb4befb0f |     
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/0f8a012e5e3e0872fdecc4094f12f5cf4e8f0ebf |     
 powerpc64   |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/7317609813bfac7f48f04a67b89fe9a99f809de8 |     
 powerpc64   |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/4c6975edb4896cee26c84dc7b4f7b0fe079ede37 |     
   nios2     |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/55b67b2c80ae6362daaac0f9fbdc766f95d9e3dd |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/3909c7cc82ef10afb0ab39b16a3f0e95a92571fc |     
  sparc64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/64f3169e6a0b337feb8d78ecbfa2367fba7de4e3 |     
powerpc64le  |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/dfd94189d57878bdbc292ea76931912366faf098 |     
    arm      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/1f57cb89b692d9b1eed466c9b6f6c570dac1122e |     
   x86_64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/575bba7c886ce43ad1005013d611a57f1645120f |     
    i686     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/ff78edd8021e2e707d0add6488abc8dc6dfc09db |     
microblazeel |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/2159a09f482cfdf6691ad54856ab8d9e30d0ce87 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/eecd773cd477ac156742dfe10bd4f426912c113a |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/040ea4f3240fcb9e3e1a1b22cadafaf49e2a8dae |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/639193d9c60ad376da0624b834869d1f9c96918b |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ab7fd4796be558d0597c67faa2a6a53e41f81e05 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/eb4a39ffa46ebc7e231547dedabbb82590545d54 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b44babc39316fe2f8ba158330340cab75c058622 |     
   mipsel    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/6f3ad3481ba1fc87d4e3fe520cf6d985fc54142c |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b9e0f094ce6bca0b08ebc72b01443ad270843c07 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b96e3d364fd1f8bbfb18904a742e73327d308f64 |     
   x86_64    |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/b3a4af4ac071e0c5024ceb604e744c030e926ff1 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/a23ea049d12a992cede769b6982352ba84582f80 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/8470533d1698836bd25d4fda0a9dfe37c9179146 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/9f393539931b51191cf7128e5c618c2398fc86c1 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d6ca12ca538ed7f41478342a6baffd5ff15af68b |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/842ab7d1bc5af9eec5e50f3adcf1f2e7d3fd3f05 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a5e7457a8f087aec698849b3edf089b2e831b7ba |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/f95713154817cd513ab246deea8350d85ebbebf1 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b4b73de6ced671f8980dff103ec648c5f6ecc9de |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/ba0c8722e91a906c02b90f63425aa61448774cb6 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/c7f9730e7e93fc4bb3d457e573e13f386036c39a |     
   xtensa    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4073901d1a372ae9c69249768869fc54cabfe7d8 |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/cdf184b6c08ab634ee49c76b7726dce395f55580 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6753000bc6f8a1dda2cb8d0aae9ba4ebc2b1af39 |     
   mipsel    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/3706e4e9d3f08f30a41cac2cdef1468d7d01ca3f |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/6fd2a5bf0a36bba7686ea9e4254ba67f8d4aae87 |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4ef97919670b279e0e495a23237da772abfa865c |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/e4a4e4cd8f71d7a1aeb7a0d33ef2abe722a08649 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/2f68aedbc19bf87f95f2ebff30f506d10ef1b4c5 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/e9706819d79d4951d57c2b62f6d450ed366d34d9 |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/a8ca97e72ccddf85e3310d38e6f554658bc59e91 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ce15c4721e83944e1e066fdf60622ea00aa9650f |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c55d88864b73edb167dc97b1426c22aeec4d955b |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5f605f053ae0c183f2cad6a8aa2e6b0b8d6edf8d |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/02150e3d8bb3f09dd3aa8b02d227d0d47ef34f15 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8972763093cd21330085a21d30bd5efa20d2a6ce |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/508289ccebf5758bfa298e9057f674ec6cede052 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2b913470b75a1aa4834cc01f66ab06e718c45c6c |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/88772288f17c1138f4d20a56fe4b299b8fbb4b46 |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/08a47ca45bb1ef843cc404fb7a7899135241764a |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1246020326a4764cff95d21e093cc8bdb94d1050 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/4b5143eada03b69fe1ddbbab0fe71c50492cb02d |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/afa7867165e643296bb3eed2672cc5c09731a1d8 |     
powerpc64le  |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7c1e1c90e3b6a165c319a865294477d0f5dd9633 |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/05f95f628e77dd1eb1640194e74be791b074de0d |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c0fde61d620b7b35ea6cd56992a2396cdef33a8b |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/9951d836c5399dfa448c81d232b8de54f417ed12 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/43ef758e1af650c7f9c81dd4efd7e0d2cdeaff04 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ed5567ab26b4cab066dcbc87c5a9ee0129404c05 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/31f9e4fac829a6789c712fb3176a980a4d3d2f43 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/5a582885903e3adcfca19f8bc3d871021a4f0432 |     
   s390x     |       s390-tools-2.17.0        | NOK | http://autobuild.buildroot.net/results/b4ebe39e54f80b26bc81b249bfa643140c41d0bd |     
    i686     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/f823bc1f1d4e0d8807a1b54a9f043450c73f7b3d |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/79a5dc48a1724c1c1058855d9da91d1658336430 |     
 aarch64_be  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/6fd3833d75e2ffbacf7449a29435eb954037c6d3 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/47f7cdac9a57295efd3fd8910d91942c524c8302 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8c9c529a63b12f671753d68b5ec38be4a4a2b871 |     
   xtensa    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/9fdad18060f7c0b6e1f5fb40dabc9506ebe4cbaf |     
    arc      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/c9c654fba48dbe2b608223f16612f70292dec5ed |     
    i686     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5248915ff1691d0dc11d2451c1f43fdbde1a6903 |     
    arm      |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/1aa5464343064a92e79e87526eed0547fad815b1 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/92f76d622b0b573258a8f6a7bf9c8650b09586c7 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/42d579ce704a65b911204272a9661ca65730e05a | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/c4abb34173e4958db9979d93c31b65e57dadd18a |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/da8c2b89a3de84baf2427a56f05cf74efb32c88f |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/25b9ef024bfd91dc52e324c10dda1f6418254307 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/f7c41dbf9e13692341f37fb7fed8a4b800e42bf9 |     
  aarch64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/5c9dbf1c8cc4005d72975e77085d61be4094f236 |     
  aarch64    |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/07b4a4b2ef9cc2e346cd61bcf71a3c1d211e5d02 |     
    arc      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/500fc992c67423bc558d08f78e2ac09a98c16edb |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/4f4714483822816f5635fa1791565a0fa507c241 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/5df9affbb8dc0e425d880af7e2ee8067f01a21b8 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/671fdf37745c9b32f7a17a32609f46be4ca7254d |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/71a3a03f08593e9d6bfb68cecc6dada535144847 |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/6e1598dadbb6f814ee073c45800b709cef8ff661 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/500e0ca083921097daf9b430670779f4720be4e8 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/a71b95020b938c05a65a1b2c238801eed5902254 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/678baf40d4b78c5533422dff5582064080eff2d6 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/0c807b6a55029af946146a8fdddb7b6961ccc5a5 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/fdfe7a4bd3b7c8cb6e3668a18d4731f937364228 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/42250ec5eaaa308b02d557d5a90d9a02511f9ff9 |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/c8cbe5c062dcc08ad5aff66bf4e8bedd7e340ed2 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/a975aec0de4453def37ead1056aeaaebe53b262d |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/ac7e49404b2d48039d6d50a6eb1460ddad17ad4a |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/6d6e9dca8756fa105f8933120479ba0c55cc4fd8 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/8db001b60f2cdffa75cda25c261f2d59af99cbee |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/11c1ea203f998999d5455157975851ac1df5a683 |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/858e8d4cdc52022b06cf6155962f182bbb66daae |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/2d9c913d40a8e37f43c34161519e3540774e6102 |     
  riscv64    |            unknown             | TIM | http://autobuild.buildroot.net/results/53b355680be82c268419fa96887448964a62c20a |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/bfb93fcf520f0475866b57de071e25d2fdb1d3e2 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a17487ba28524a16092d4406753211e7e5b66e4c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/9c07cf5c63f8031595e1f6a3914ad8184ee419b2 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/f32fe2efc68e242bf9f9240f82a4a9bc7c7d5911 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/f70d060cf50254694113f19f50a8ef96ef33dd1a |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/30a99b8ea36bd9343159791d06e5954aa7d0cb8f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/99a7c6ff30e7fb3eaba35f70c4df83662e684d0b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2193e06626f3be940dbf58d6d433a2927490431e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/3e5e19a54bb7152bbef47c9caf13792d684eae82 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f11278995f8e603dc97b061819e5c9f01ae60834 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f9380844ff6fadc0452d33c16a94643f923cead7 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/130ab206e2b10f167c2f039d06e62d5fc2649c5f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/4f1d068a824e7ec90ba0101e298c724e94818630 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ac733ee237a603e7fa0042d1d7993c5ab2978032 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/65a12485b0631b9cd0e77e25200bdad56a4de631 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/5d6e6a066cbe2880109495ea2dc1416996a153a9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/306702ecb962519ab83b785fe5d11a18338f321c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/6004ab0b5304f4e64898a16d8de3db61cc0eb80e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fc2cc586d616813d4c4361b9cce5a6036b60bb60 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f67a183f146e48b826b83d7ae50de79c9f50e575 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/de5a7e752c6478003214295a43e39d646c41a173 |     
    arm      |            zip-3.0             | NOK | http://autobuild.buildroot.net/results/0be151a0e3df9b9d2891928c91bf9c48b91fbd2c |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  host-python3 | 14
monkey-f54856ce250c4e257354... | 10
          libmodsecurity-3.0.5 | 9 
                    mpd-0.22.6 | 4 
            erlang-jiffy-1.0.6 | 2 
                 mesa3d-20.3.5 | 2 
                rocksdb-6.13.3 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
               capnproto-0.8.0 | 1 
               collectd-5.12.0 | 1 
                  gensio-2.2.3 | 1 
                 gerbera-1.6.4 | 1 
        glib-networking-2.66.0 | 1 
                         glibc | 1 
  gobject-introspection-1.64.1 | 1 
                   gvfs-1.44.1 | 1 
                host-odb-2.4.0 | 1 
                   httping-2.5 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libtheora-1.1.1 | 1 
                mono-6.12.0.90 | 1 
               netatalk-3.1.12 | 1 
                netdata-1.21.1 | 1 
       network-manager-1.22.16 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
              python-pyqt5-5.7 | 1 
               qt5webkit-5.9.1 | 1 
                   sdl2-2.0.14 | 1 
 xdriver_xf86-video-ati-19.1.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6f9b6631e57935d0624fd0167d95cda036663d04 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/f23955d3b6ee26db2507ee7c28555e39e2668d99 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ef61e2404d347264d75ef54f41548bcfa18f8e84 |     
  sparc64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/dae3e0b683667db1853add58f31f3f6d1d0d99e1 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/2322f50c4dd18b24f61354baf430911e0136b962 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/97faea1d2b4c316e7035b8aa6f7130b85bfeda2d |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/9f8491fe126036a4846ceaebef715deb57c66085 |     
    arc      |         gerbera-1.6.4          | NOK | http://autobuild.buildroot.net/results/41b62dfe471bee38f744bc7215e8616c8ac0a87a |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/577563e79f38ede7025c5c8188d6962dbe7987ce | ORPH
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/deb6aa79b1e0aa658c44d3b0a937cf6617c34a84 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a68dd75942835fae3c786f62b349ce030a7ddc44 | ORPH
powerpc64le  |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/98d2add5518659d42ef451b70cfedb0c09a7d95a | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c94fa185a629df6afdcaa65aa666105f339501dc | ORPH
  aarch64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/bbcfa257acff55b9eb3e35c366914d0814d15965 |     
    or1k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/85e59029db5817cfe591044260da61ba727596f5 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6815aa88219540cf2ed6773de79738f9343fd2f3 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/e96afc61d6de63bb315bbab5c76ae5b998fa3a2f |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0159d12a90c6689063d4c3c3bf10e323ec7f7c0c |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ef6a700ecb6caa80d66a607e57cff9d121dbd384 |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/aebe5ae5a8ed1d35cb09ed49695c7942c40c7930 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/826f0ec287cef05515a4b5bca2d0f10b88499a65 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e46bf77e3abf363c6afceaab0eb6c73d6fccb339 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/ed4e34c68e4b295679182b681f6640ef9a03ad03 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/b21108f834088ace40ef605373fca9712aeeb5d1 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/790619963819bf48977ed04823fd1b3dc6c7d7c2 |     
 powerpc64   |          host-python3          | TIM | http://autobuild.buildroot.net/results/98bf82c28ac716233d5af27a6589f6f9b5346e9c |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4b7fcd1a9eb1695996bbdf47180506ee1a6bf59b |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/d445e2332c1ff09179f34b3e2a8cd8dc02883742 |     
  powerpc    |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/b43e498373b183dbdff760c95324d8cdffee6bf7 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/36cdd0afb663e594870c7a9c92aab62a00b30a10 |     
    or1k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/28442bffd882b832cb92c732e8579c384bfcd8a1 |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ed4c92aecd60baa749e1783d4ef71b84690a9432 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/77733a482568fa44485779feee2f5cf1ad79ba6d |     
  aarch64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2c9a1d7c8b5f2e852bedf0ec140b45fdd1d3ac91 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/ffae83bf1491da27c28785af31bcde1bbec8b4bc |     
   mipsel    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/afa619a71933395678953524ab68c6f229478d08 |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/35c9ccfce92c225970524dc08f0d18855da7a14c |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d96bbe8cdd70840cc037ed4365adac53ee404028 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/5a74e18ac62ebdaf8aaf3a2d9c15a4dfce15a4d9 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/9ede940c82872ad00475e5b1dd4fad313711e340 | ORPH
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/74aa2fa8f64f9af5164b9bef03ec49651b0036bc |     
    m68k     |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/d01d67b9821ed08cc00805371ec43ab7376c3fbf |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/bca2d88003f37f0bb960b4f75c69ef092390f04d |     
   sparc     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/50a8e96a2aef2233ff67b38184fd841d45f3d1f8 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1881852f33777547446d94a3fff34172983f0781 |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/7171d1e30f53602a3b88afef749b0ea63c51a5dc |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/985cb68d109a3df609772859744659a4e60383d4 |     
   mipsel    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/dd272147d81d5ad414389993b3bbd6074eb8685d |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6c85be79cf1ed7660877c7eec29040ab452535cb |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/7c2660eb1930bc8939ab8e3e18f56d288eebf48b |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/403f79361382bd90712bf452512d21329e8436d0 |     
    m68k     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/352c107ba3b12150cdcf3cd615a93282d4396dfb |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/e153f6d8d15fd193419754644405f39af85cc8e7 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/463e8648f519558a3eae3fb0be37c62293d2be72 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/372e6f5bcb557d09f7ff359df6a1ed4fb1de5fd8 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/267969ca752a3d50cb749b17327d22e688fbdb8f |     
    arm      |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/d5abdc4a0744e731e771620ebae233cd9378e889 |     
  riscv32    |        netatalk-3.1.12         | NOK | http://autobuild.buildroot.net/results/83ef44c39102f4705c5220eb7ca199a595ab9e1d | ORPH
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/275cdbbc5574cb3249239990539b402b33677dca |     
   nios2     |    network-manager-1.22.16     | NOK | http://autobuild.buildroot.net/results/c0a3e6331605d7d3563d71dd9c010e71e1c9b902 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/926b52d1aa98940af84b3381ede4796b0b6d9221 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/55cbdd73e7b243c90e90b212739e74a744bb8398 |     
 powerpc64   |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/f22a2070f0009af745954e1039a532aad0524ae1 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/b1bf4041fe7e6593b8f989ef0f434adf578525c6 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/3226c73034cfdda08caf0a38c11daead159d7ea9 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5996b0c94f4618c34ac9b9db734229b1618b1788 |     
  sparc64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/582ca64556b4f51ef6fb2ab440f3abb26624c767 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/7f4654f563214069c087f7d8a8735cde10a86f7c |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0a5f3c4eedb5415e6f3253a089355385c24d23f9 |     
    i686     | xdriver_xf86-video-ati-19.1.0  | NOK | http://autobuild.buildroot.net/results/ccc36c8cd3530153316190f378847081cb5c1c58 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8a6fa4f17f02ed1a1833fa2fbbd0409ab1577b6f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a1cfdf7ba07296905243fe1cdbfe05afb4c2acd0 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  host-python3 | 12
                 pixman-0.40.0 | 9 
          libmodsecurity-3.0.5 | 5 
                    mpd-0.22.6 | 5 
                    ffmpeg-4.4 | 4 
                         glibc | 4 
                       unknown | 4 
               capnproto-0.8.0 | 3 
  gobject-introspection-1.64.1 | 3 
                 mesa3d-21.0.3 | 3 
               belle-sip-4.4.8 | 2 
            erlang-jiffy-1.0.6 | 2 
                qt5base-5.15.2 | 2 
            qt5location-5.15.2 | 2 
                      tar-1.34 | 2 
                xenomai-3.0.10 | 2 
               apcupsd-3.14.14 | 1 
                dovecot-2.3.15 | 1 
             host-cairo-1.16.0 | 1 
           host-faketime-0.9.9 | 1 
libcamera-3a1f67a8031ac5ad9... | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.26 | 1 
               qt5webkit-5.9.1 | 1 
                       setools | 1 
             terminology-1.9.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5d9d567313b6da7dd47c9933cace29a02a3421f7 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/5644e409556facc23df83fb280dc099834f74afe |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/b7b92077c87ad65e3b62cc1df627fb39bbec5897 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/bd7ef4bb612eb1386f5d9b8455ca52a1d63087d3 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/4e9023b44e4dd0c9dcab0b49ac4236db49ebaad8 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fb43a702d425e1f9054e02598da545ad5af9b386 |     
 powerpc64   |         dovecot-2.3.15         | NOK | http://autobuild.buildroot.net/results/9f3498b3ed670ecf5b7c3810145d027f73fe014b |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f0d2752060d854dca2e8059942b6336a4bcc3b47 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/cd4d87273ea435390edd274a28b956e1af087c26 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/49598f8266b4954e0389719e384943bad8f4868c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/53a10e142ae06ecd1da1933ee31e83579b66e5ab |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ec036ad713418c74c25488e10acafeb36f3f92cd |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d0da66e4736e8bb7bc00c9d529f22465df66381c |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/033e59796ca091d4e2f715ec041e551cafe4ade2 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/940e18ac773df66de9e8ca2e85df6b3263d4c966 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/cf7d93be0f2e36b829582b2e1287649580ad83a1 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/bb521a71b5036f1435b019dc18dab6b213e0e879 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/12a8c1f31f085f0572ad979506dc6a8efeca9559 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cfc8a3e506c9b5ffee4fe809da80badaa5f6d70a | ORPH
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a48a634fc8b443f2bce2a950605b38c5adf3460a | ORPH
  riscv64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/9c2ef9e5c066da02dea75308087dafccc717819a |     
   nios2     |      host-faketime-0.9.9       | NOK | http://autobuild.buildroot.net/results/1f54f265f7ab8017b0a7ad1f79f87c8d47a9c385 | ORPH
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/3c456f7968b699724f78e354114c00a6ecb89f6c |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0a7242cb7c5b853dc7fcfeba5c1c59b566fd89eb |     
   nios2     |          host-python3          | TIM | http://autobuild.buildroot.net/results/062d0fb999215d9fb2a7b5de8a3376a60ec6eb06 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/28e258db1e01bd13bc3dfa1215b199e21ae419dc |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/e5ce22a98c8c1485ad6908796863c18dca93230b |     
powerpc64le  |          host-python3          | TIM | http://autobuild.buildroot.net/results/f42e960de8282413bfffa97b1f8cf02daa2aa72f |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/41ccf3356b3aec7e682327f72e73b4ae56310c52 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/7f9130903455d53ac280d8cef6e2a266d6f883eb |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/393e6443e884449e56b74369ab9603b4f6bd2b42 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/8ab775ae473acbac95afcff3d7d220fd579a9d09 |     
   xtensa    |          host-python3          | TIM | http://autobuild.buildroot.net/results/fe22d7058e32efa14c5ee85833ebbb9bfabbf3e6 |     
    i686     |          host-python3          | TIM | http://autobuild.buildroot.net/results/aa52304300c00cce5c34049bf50c5f0fb58ae32b |     
    arm      | libcamera-3a1f67a8031ac5ad9... | NOK | http://autobuild.buildroot.net/results/861135f70e19968cd046186ac457fdf45d5438fc |     
 aarch64_be  |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7a433503b5eee45ab904da447818edcf60eb7e0c |     
    arm      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/f8b2e2c396e79a21ffe7fbd576eee3ad86bea883 |     
    arc      |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/05d4829c138b874ee4b9f35f7e8f9c046fde01f5 |     
  riscv64    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/354ef60ecd7780473af8fe37d31cdb1e06725ecb |     
microblazeel |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/efbca5c764e509152e1527e21a434b54b97180fc |     
  mips64el   |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/15867a117e68a6eec67974a32d3ca61efbb0e8dc |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/3418c3d6fcb69ebb8f03ba8eafa6591e81876f28 |     
  riscv32    |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/4dc14fbaed35ffa7a42eaef66769950e3aabb985 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/6a05717078735a14f8aa15914b2498619a110ee4 |     
    i686     |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/0a9fde652123ab0c598ce7c8e07b37c33ff4b31d |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/22d507cb69c6dc30cf4d9b8c0f021209d4b878f1 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/c8c35765643f4b872dd6dfdb10352dd4fcbc3049 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/45f079d7a1cb0b99534994296b3df1ba43892758 |     
 aarch64_be  |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/6a35bc389bc3d4c55771335f9627b28eb276c512 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/4bb2f62d55dd3328cec5412cd05007ccbe6aff07 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/129de0a775d31fc5121f65dfc4590a12391115b6 |     
   x86_64    |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/21e55cd945aac63b9730fc8e459333d72be187dd |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/d8c3d46a71830cc3b400ea9afdcbd6bbd5291992 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5547d1d57591527be29d3a3c0c602cd240687ebc |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/c3a88788e1ca4e3c225da459033a02ca790a8fa2 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/4e3098c802f9ff4ce242746fb3e97954c2d164fb |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ff867aff355076ec03673a0a9b77ba7b05f48c32 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/0e778d2c38ab00c1d746491ba7173f889f33f817 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/ca5e1c1b711f5f181a8f413a34198a69f7c99c27 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1497972f2c9bb922e22d703a2b910d3d179ecd91 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/1e9fe1eb3ff711387a33555ce1b429e8b99eaf76 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/b7fa09bfdca5f5a9a5509655c32cb05fd7cd0181 |     
    m68k     |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/1e0a21a49c9905423de4854981585f3f5213040d |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/571be7ffa72f30f58763cd1d5c434db7d2c54ee9 |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/c4d78a539239f89d068456a2560e40c6a5fa3bfd |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/09938d2a518693a945eba1729774ae7c721fc6c0 |     
    m68k     |            setools             | TIM | http://autobuild.buildroot.net/results/82edcbbdb8365e67d0645fb3a1c34c65d9fa40ef |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/7f47eb1212a7e0d961df21dcdade332a4c7fd104 | ORPH
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/35aa42601d84d5822c8ea100434ec9fb0e77be66 | ORPH
  aarch64    |       terminology-1.9.0        | NOK | http://autobuild.buildroot.net/results/79ac5cb692a4fef8144a89f727ce79802b34f5d2 |     
    arm      |            unknown             | TIM | http://autobuild.buildroot.net/results/18a8cd5d12c6f236f9ae607f099c28755674359e |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/bac52ebf2ec5731732fb619a478a89870df136f5 |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/6dc34a9a951d4786392dbd3ed3b9232ee845a013 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5b7fee3c8bff4547c22de8751178aa023fa849e9 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/1139da070dbd286eb6e9dad911c39c3aade80407 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/448efe22e8fe058a1b354a3c124874e30b9ce138 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/21eb5559a0b5e246076a790471c5e4f462921f23 |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 65
              host-libcap-2.52 | 21
                  host-python3 | 10
                       unknown | 9 
                         glibc | 8 
          refpolicy-2.20210203 | 7 
  gobject-introspection-1.68.0 | 6 
                    mpv-0.33.1 | 4 
                    ffmpeg-4.4 | 3 
                      gdb-10.1 | 3 
                 mesa3d-21.1.6 | 3 
                  zeromq-4.3.4 | 3 
                apparmor-3.0.1 | 2 
               capnproto-0.8.0 | 2 
                   gconf-3.2.6 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                   libnss-3.68 | 2 
              libostree-2021.3 | 2 
                librsvg-2.50.5 | 2 
                lmbench-3.0-a9 | 2 
          modem-manager-1.16.6 | 2 
                 openal-1.21.1 | 2 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                   bullet-3.09 | 1 
            erlang-jiffy-1.0.6 | 1 
                       gdb-9.2 | 1 
              gnuradio-3.8.2.0 | 1 
                harfbuzz-2.8.2 | 1 
             host-cairo-1.16.0 | 1 
        host-sentry-cli-1.57.0 | 1 
    kf5-modemmanager-qt-5.47.0 | 1 
                        lapack | 1 
          libmodsecurity-3.0.5 | 1 
                 libqmi-1.28.6 | 1 
                mongodb-4.2.11 | 1 
                    mpd-0.22.8 | 1 
                opencv3-3.4.15 | 1 
                 openmpi-4.0.0 | 1 
                  polkit-0.119 | 1 
           python-pybind-2.6.1 | 1 
                    qemu-6.0.0 | 1 
                qt5base-5.15.2 | 1 
                 ripgrep-0.8.1 | 1 
                   sdl2-2.0.14 | 1 
                suricata-6.0.3 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                  udisks-2.9.2 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/09613a24da5c98a6ec5f2861780f990ecd760194 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/114f5c5a4fc3f72dc2f313f00711388198d90934 |     
    sh4      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/eb1fb2daeffe4189312abfc94b3860916503e548 |     
    arm      |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/e16f6f1163ad2164e51851cce59eb42532e92fe4 |     
    sh4      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/32bfaf0aae57ed18c18e82a72a958af9b3e1b241 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a8a1f1b00bb123f65535c16c43ad065b7978d35e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/c4c29889f8312486e8b600d56ff0aad5acff6c15 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e8165df569148adeb9b0e84a987570b35fbedb89 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3d8910edbbaa9e93f57817b0a01d6d82cc0e4e3c |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e9bfe5a47a7aa679cee8eb8eca8c0fa4ab19cb33 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/31e44b757f98560642cdf099b13a04143891b881 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/95f47b1723e3bc0f3d0c3fdff3ed9bdec468bc62 |     
    arm      |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/630cc1b81590f5db5d952aa605839e0a7cb234e1 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/538ed07fd62ed1067311efb73834bc21c1540250 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/561475a86605d6f36abd92ba9f449f3c4d63c289 | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/ffaa8e00fa828f9a23a1ffb779e50f6fe039cfb1 | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/7f154aba381ff1aad5d8f8b2efc3477d2ad7d249 | ORPH
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/4172ae311ee6236c754cbed2d7b3228f0a084161 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/d790a367cc7160eee4ed68c54b61b5c4018b3235 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/fdf85fe0c1202aecc5e5eee0b798dd0dee7fad74 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/bf4aa31f821604b868d0c26dd0d7f2fb2a9fd1e3 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/ca9d92d4096bb274bfa2fb3c6797e3bf7bd49d62 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/e1e5657042e3f55ebbe5170de4835f1b906d6376 |     
    arm      |             glibc              | TIM | http://autobuild.buildroot.net/results/05278f366a5c835f29a54c3a577c42bb20856087 |     
    arc      |             glibc              | TIM | http://autobuild.buildroot.net/results/cc0be0517c93ce43eec1841bdecf69a6dff7621d |     
    sh4      |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/efc1f7dd8dc2e198a84dc40e51716b04823a88dc |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/ce85036a79a613f2f6bb58888dd774b948afdeef | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/0246b40dea69aadec7aeea6e7477c606f2a93532 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2950f2743809764231a29c5a4a95be7387edfac8 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/c0e2890324ac5e948023f12c2fb5750f6c77298c | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/028b5f1421a19225d346472d2900b18c8215bd55 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/62b262be191733ebc229dc1d391db47a1e0211b6 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/311d2d2fbe5fc8970f52eec9b4771fde5025364b | ORPH
  aarch64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/7d113bb63798b4dc0cbbf11b70791abd36887553 |     
    sh4      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d0ad33d750ed5454ae225586d5e50c3d9a76977f |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4fd48042b2b6b55ffd2c152bedd65a4e85e008cf |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0a50f8d3da92a8c9137c5b0e0c1fa0838169b7f8 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d8c06de98fad00aca6543137f3621ec3b0d36d26 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cdd3c407875e0678ea31d59dcb39af00b20be802 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ecbffacabf6007fb072f9921a15586cf8f67719e |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9f34646a2b891fd8b2c24ca527f812800a4b4376 |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d224420c160b4e664d3f7b2ddbd7bc432b0bfeae |     
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/63cbad32456aab5fb8cb19a5ec2cce2b62b83357 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/16a22771becd6c1befff613ce04938e14e0ee3f4 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e50b064c12fc8a7e1e7fb38ad3a9a01713857edc |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6aa0e5b0f9ddf8f52974a38bfbd4be992584e161 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/3cfcec1c77c1f535cdb8cfdd2497b7148bd06ce2 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2856fa704a949eb47040a0304456492ab4a7378e |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fc3c5ff799c359cc2900f82f3bea16f8ebb48b88 |     
   x86_64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2c4eebc786b8df8da7ab9ff82a80aeaf6e16b557 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/4d388893da5ca80290ca822cce2f4571713bf808 |     
   mipsel    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f2fe56ac155b708b7031b6847e56796aeb31cd13 |     
    m68k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/6c0e9e8b6496ce4a0eb77f5437a734f58562c4ee |     
  mips64el   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0669c11a81879559a9163c014ea94f4e491c3c24 |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e13009c81b92b39e0ebace0472847e908ffb6dc1 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/08cc24e9f069cec284e64971bc28a9f3f19c11c4 |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/91a3b4b88bcd18f4c2f54c855371df2881e79a54 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/23bf744507c31b31a7aa3dd4b1661e6695be28dd |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/03a6fc2f5aa5b811db39a6753caef12dca81d9b2 |     
    arm      |          host-python3          | TIM | http://autobuild.buildroot.net/results/58ce6d997c2f138651ac5c3bd2d3bfa43183d8a2 |     
  riscv64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/960cf77e96a457b33783fa3ac2e2948ef0787433 |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/9a9a10bfbe59c820a65051afdad6bdc9a94950df |     
 aarch64_be  |          host-python3          | TIM | http://autobuild.buildroot.net/results/50f6bfd7db6ae9114b8e5fdcc771d54cf3103dea |     
microblazeel |          host-python3          | TIM | http://autobuild.buildroot.net/results/d01d96f7ef7e87295729bc488835abc39e9f7621 |     
  mips64el   |          host-python3          | TIM | http://autobuild.buildroot.net/results/9b9770a2771527a17b9a0168037213e5b6621df4 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9b7ffc30e99289fef6622ac06a4111e723c48b35 |     
   sparc     |   kf5-modemmanager-qt-5.47.0   | NOK | http://autobuild.buildroot.net/results/822db2a650f98a5c59ad0dd4eb80a6df86444221 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/a2e2243ac6569636edd961563631e57c5307771c |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2041b6a498cecc5959fe524a54897b946057b501 |     
    m68k     |             lapack             | TIM | http://autobuild.buildroot.net/results/792e823ae5f908ee0a80dfb94d0c76986837afeb |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/0db04d2fc0b2500186fe6b2ce24e803153a667ce |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/013b79d91ee867cfb41d90996ca6827aa9dd4524 |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6107cf36d6ad960880cb851dec381c67ff4df306 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/01ceecfcb1aa5c7e506f00fc62731a9f2806a6a1 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/66b6b0794ff8947f119a1edddc04be3a41b85ea9 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9a9dcc301226952e967e0a354564cfa97dd6136e |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4c5d8e0be5491c8e1302aa111958f8ab76441c74 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5c36b3304ded78dbf90df03e2d9f9dabc40dd9c4 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/19b8ccdb14c075623cb00a465dc78b8a00ffef9c |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5c280323352a0da06449b2601a6554da0f0370d4 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a6f684cf47225d1a1b63351536c409dba5516f7b |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/953085add02fdb6457757af1aa3e49dcaf4c3ace |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/82644405882cb25e41ed1f24cd545350a69c2f6e |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6e8d0ebd2fb2e34742cc6ae977b1beb0988bd777 |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e6ac3ac82602deae89c812a39a2a723257058e90 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/9db30ca84d8bf145766f4caee73956c17950d8ef |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/612c4218ab588d31b184c0f55161d16a49658005 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3ca86158ee354ccfc0637fda80feee5c8b68c0a1 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8dbd53c2fed34c321c2e8dfdbcedba106ef7181d |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/226af39ee49e440a123ee8e51e79f61f1b4f89b5 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1eeabf919ed3ff1d35b23bf1ed4aff9f3828f3ba |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/650f301f3dde8b93fa173357de0abba8d54696a6 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5c0139e0d48154173ba9e3613863e259dd6081a0 |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5c0b668d1a2476d1d6520a7f73332b6c2c3dd1ec |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/dac4a87683d69178c81a33149b65bd171f64b1e6 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/43f3101cd0752b55d6a4b0ee31e3b2d725393716 |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c946b1dd38c1cbe3a5ff67ba290080c14502eb1d |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3033fc7011d9aa3db1823285772e582467a24046 |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f94500fbc2a62312cf25b2e2424d81e4f74786d0 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/c2eb2474b043988e23cd5d3de9806cb24303a618 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1c3a2d5bdbffbd969a6813071d3b768b630c1caa |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ba65dfb578f758a0ce9302330245addfdf5d391a |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7571cc7b71217efe0b490eb4e20b9ac9fff8c8b6 |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b08f728a3e7a4bd34fa35ab73680a777e8c893c8 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/87a3ae3f534442895f7c22c15b7f9f687a66d435 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2c490bdcff3de08b63ec1f28f0cb91797434ca0d |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f5bf0aff39a863376c0f8d24d5c4b0568bdd2eba |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/111c8fc3dd46c20f3e5350aa8c63bb31cded7e08 |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5532d3cd605a521e9d8a9ca73b2f30ceb253ce8e |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b9e0421979afba25c4c99273bfc195cb429a3ddf |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a085e30a833f058d2b1b1063339e1ff3ee3f557d |     
    i686     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a09b968089d982fb8c07e5a07ae75ae7feaa9248 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7c4fbbd74738dd9bb32278d66a30c99eee286fc2 |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/1aa8565c4e5745fa0538ae42d0c9a9eddfcd949c |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2143ce85925f195af61b87c3c27738d914ff77d1 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/133e5e4a4861d9da4535e276eadcde8353b0ac83 |     
   s390x     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b6267db1f987ca727f384ffd4b6ccdf6c00ab072 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a4f5679a8586fefb79ca412e81ac0751855c0c73 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2d243a6c3d8748f5310ec9fea916ee8227625903 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/4085d2e43d5b1cf41e9dc388b3d15b69728e8b2a |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/fe8ae6d9e9075b7d876705a14e1e6be4838db080 |     
  sparc64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e14c34dea880958af00f778cbeca84065b5768f5 |     
    or1k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3629b70f8598475da208debc2e0f545fd743fc54 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/743f9b4f1a6060823e78f5919c7d49fa6c0430e3 |     
  sparc64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6a60605d176acc5ac43feab2ba2a2bf303db0e55 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f880cbce4e16b8e056d5a7fff18468a3c763401b |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d8939993b0d737ac8a8bb731ef90082c9506aaaa |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/aa4ddd272a7666edfcd9f0143286368749169df0 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b8c4fa3578226754f983b76a72d90f8bbf8ff09d |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/bde4fd419972e907b695920f376c83e4fcaae962 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6abe88af492c1bceedb2c784d0168b1cd4a0562d |     
    sh4      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8d7aa5f9d0f206d278c08104f15b48a6f82cc896 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/678967131792521443532a330b5d605ad6b97002 |     
   s390x     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/76f7473ba643f1f1110d87fbf3f690c40405d879 |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/a440324ca5501d1f1d15e56604c5ae22e72f96e3 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/2439ab0bd4229a3f27c014f8f14991064e5fe8c6 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/6c78efd8af401cd19635ea91f20e33cdf55691b7 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e9a1356867ba2e09d504cb892a937fdcde45b5cc |     
   nios2     |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/e006e93e2343607e6afe9cba4096057558e1615d |     
  aarch64    |        libostree-2021.3        | NOK | http://autobuild.buildroot.net/results/202c858de17b3c067333c5f78ba27dfb0060bfb4 |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/73a164e5e67694f430f00d9cdb40ea32e701a61a |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/48d7624d65c80a6cc36685e53e82b855f31429d1 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/7b6c436ef8598f60882ea941b7e4b833d255d61f |     
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/3511585fcd050351f59446f5d41512df9eef7913 | ORPH
microblazeel |         lmbench-3.0-a9         | NOK | http://autobuild.buildroot.net/results/e2a1703339ee7568e8042e1a9cb7821c7c489a77 | ORPH
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/da60a0a003b6e658433db730484636e8bd5fb758 |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/ddfa07227d17876bb718aadbd38c1aaeba278569 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/ecf78a037d680084638eea59c394657bcf0ad7a7 |     
   mipsel    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/98895c8de1f892bd84cf3dfc645e231e057765e8 |     
  riscv64    |      modem-manager-1.16.6      | NOK | http://autobuild.buildroot.net/results/e0e09026e9fad1970052ad0e2e5efc442fe85ae2 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/0cd5369182af8b9b3b299d75d15ac9d1e7c56add |     
 aarch64_be  |           mpd-0.22.8           | NOK | http://autobuild.buildroot.net/results/2e3e7732c1b6c23fce7ee3ee568ceb97c0a59eee |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/136bb34c48ee37475b90fe45d564134538b64ed4 |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/474f53a1764b529a12050eb40da047b62a73ecdb |     
    arc      |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/46d7df99ed822ac9b468db9b9e1a514bb3227bbb |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1986fbf46b68c7aa53afcb9f37f7e562f2f4039d |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/8e6f9b529013fb243554cf4ce45be66feb43282a |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/175746ae08628e82924fb23fa05e4a4606445ade |     
   x86_64    |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/2fd6d93bfae827c014b61e8c1c16876fa47d2175 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/17ea729fe2d05df198594ab2cd8733e561d4acfb | ORPH
    arm      |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/7bf90435afb74ebb2439b7c0cb4f78956ea9debd |     
    m68k     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/229a57bdd4fd89cf98d1a26e4e63917babe51557 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/ccc349163a30189e04039e827b50aa28c29df2d6 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/45d77b5898bcdf395f2bf8189c4e7a7fa4f7c8bc |     
    i586     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/cf481f3c26098be3f55ff520538f2a7c8f0af041 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/74d52b46b9a356dabda3f575edc1e3e24e5e4b5a |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/d832e8f9382b19d6482a45ad85b876377a3ddbec |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/76112a3b0e0a3495d56eeca50bde9bd8d2a2756b |     
   mipsel    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/7b17df55aac923b0103c21674d41b0a3cdb3aa5c |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/ca328fad6a3e2a9e0db0bf8ebd0507cfbfabbd2f |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/1498efcd73ed3e8792f99a0f98d276267bec48a1 |     
  mips64el   |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/ad91eb7459a712224a67a049a2b80385c1135fe5 |     
 aarch64_be  |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/5a1e5f3046c4d5a42578ed5d001a3adb42e9cceb |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/ecff67db62b8f560c91942b52bec10a8dcf9e7a5 |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/40dd7a2b3e31696ff2a53fd7ff2f67e44760bbc3 |     
    arm      |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/fa98f05d0a39eca479538dcf02ab7af25f241487 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/6bc6c9a0e7295e0af45606bead1c45d0cb5be173 |     
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/7558443348076f4eb5ae0aa2acbf2f803a06abdc |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/275c0baf67885adc93018877a1a9be589b632e42 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/444cb975725f54be2e57e64ea45fd222bd650c6c |     
 aarch64_be  |            unknown             | NOK | http://autobuild.buildroot.net/results/83c6db8b6bb2e59cae1f78d563d664c9826e15a1 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/4ac09ede781b891383cad220dddf6704c490f7e9 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/37f535eff755e9212ad837eff7e8516498e3916a |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/bd04b0bd8e7fddadf98a37a768e90eb439b7b4dc |     
    sh4      |            unknown             | TIM | http://autobuild.buildroot.net/results/2f773d10e26826e80a6944066942d5f5f8a18321 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/19e03fce531b7450e315dfb73a878d994be5a590 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/eadaf3774a8aa615d7544fcefbc5920c85713b67 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/fe4aa785d8608336a4d745687e5b427f0ba5b149 |     


Gitlab CI results for 2021-08-06
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738145  |      
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738152  |      
       acmesystems_aria_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738157  |      
       acmesystems_aria_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738158  |      
    acmesystems_arietta_g25_128mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738159  |      
    acmesystems_arietta_g25_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738160  |      
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738164  |      
                         arm_juno | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738175  |      
                  at91sam9260eknf | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738190  |      
                   at91sam9g20dfc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738191  |      
                 at91sam9g45m10ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738193  |      
                     at91sam9rlek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738196  |      
                     at91sam9x5ek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738197  |      
                 at91sam9x5ek_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738200  |      
                 at91sam9x5ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738201  |      
             at91sam9x5ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738202  |      
   atmel_sama5d27_som1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738207  |      
       atmel_sama5d2_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738208  |      
   atmel_sama5d2_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738210  |      
           atmel_sama5d3_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738213  |      
       atmel_sama5d3_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738216  |      
       atmel_sama5d3_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738218  |      
   atmel_sama5d3_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738221  |      
                 atmel_sama5d3xek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738222  |      
           atmel_sama5d4_xplained | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738224  |      
       atmel_sama5d4_xplained_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738227  |      
       atmel_sama5d4_xplained_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738229  |      
   atmel_sama5d4_xplained_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738231  |      
                          beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738258  |      
                       imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738470  |      
                        imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738474  |      
          microchip_sam9x60ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738514  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738516  |      
 microchip_sama5d27_wlsom1_ek_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738519  |      
...hip_sama5d27_wlsom1_ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738520  |      
        microchip_sama5d2_icp_mmc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738528  |      
    microchip_sama5d2_icp_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738529  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738568  |      
                   orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738580  |      
                orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738583  |      
                   pc_x86_64_bios | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738603  |      
                    pc_x86_64_efi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738605  |      
                   pcengines_apu2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738608  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738712  |      
                      zynq_qmtech | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738795  |      
                       zynq_zc706 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738797  |      
                         zynq_zed | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738799  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738800  |      



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
