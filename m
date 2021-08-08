Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE54FC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 06:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C5F6069E
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 06:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63C5F6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03429402C9;
	Sun,  8 Aug 2021 06:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p30IfTOKXPWD; Sun,  8 Aug 2021 06:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACB6A402D1;
	Sun,  8 Aug 2021 06:55:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60AEC1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 06:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F9EE402E2
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 06:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAnXpmda0uY9 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 06:55:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38040402C9
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 06:55:54 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 12B7A1BF203
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 06:55:51 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 08 Aug 2021 06:55:51 -0000
Message-Id: <20210808065557.4F9EE402E2@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-07
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

Autobuild statistics for 2021-08-07
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 36  | 14  |  3  | 53  |
  2021.05.x  | 38  | 11  |  0  | 49  |
    master   | 215 | 76  | 10  | 301 |
     next    | 55  | 37  |  1  | 93  |

Classification of failures by reason for master
-----------------------------------------------

                      gdb-10.1 | 5 
                  host-python3 | 5 
        host-sentry-cli-1.57.0 | 5 
                    mpv-0.33.1 | 5 
          refpolicy-2.20210203 | 5 
                    ffmpeg-4.4 | 4 
                apparmor-3.0.1 | 3 
                       unknown | 3 
            erlang-jiffy-1.0.6 | 2 
                   gconf-3.2.6 | 2 
                         glibc | 2 
  gobject-introspection-1.68.0 | 2 
                harfbuzz-2.8.2 | 2 
                host-odb-2.4.0 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
             libmediaart-1.9.4 | 2 
                   libnss-3.68 | 2 
                   sdl2-2.0.14 | 2 
                  zeromq-4.3.4 | 2 
  binutils-arc-2020.09-release | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
            docker-cli-20.10.7 | 1 
docker-proxy-55685ba49593e6... | 1 
                    efl-1.25.1 | 1 
      gst1-plugins-base-1.18.4 | 1 
                   gvfs-1.44.1 | 1 
             host-cairo-1.16.0 | 1 
                host-gcc-final | 1 
host-gdb-arc-2020.09-releas... | 1 
                        lapack | 1 
                 libqmi-1.28.6 | 1 
                librsvg-2.50.5 | 1 
               libtheora-1.1.1 | 1 
                libvips-8.10.6 | 1 
                 libvirt-7.4.0 | 1 
 Makefile:740: target-finalize | 1 
                 mesa3d-21.1.6 | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.4 | 1 
         nvidia-driver-390.132 | 1 
                 openmpi-4.0.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                  polkit-0.119 | 1 
               pulseview-0.4.2 | 1 
                    qemu-6.0.0 | 1 
            qt5location-5.15.2 | 1 
                      tar-1.34 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/b57407c6c41f37a51acc6ba8a8061e230ca1b00d |     
   nios2     |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/c91d6d512ebfa8121e5dc11530adc2b636bd3172 |     
  mips64el   |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/8d4544b83b65036f4df6ed67c987a06a4f62c556 |     
    arc      |  binutils-arc-2020.09-release  | NOK | http://autobuild.buildroot.net/results/5b851965fe4de854ce23349338348ae925b0ef10 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dce00fa95fdc5ae2ae42325207f09da6e4bb412e |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b33c65b2c20c58f13fb375c61da5d6c53c44f42e | ORPH
   x86_64    |       docker-cli-20.10.7       | NOK | http://autobuild.buildroot.net/results/32860432bb9b8304d32e105dbdcceea5eb8bc504 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/0032d835c775a5c8b0d020f0475fe34c7b15bb3c |     
   x86_64    |           efl-1.25.1           | NOK | http://autobuild.buildroot.net/results/2c68cf640a3e19241f6ebd8c51b468bd90d598ee |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a81857fed867f2772764b721d8a2af26202055d1 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b80a7d2a62b97ad8d1706270d7af4a1984272220 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/03ab144ec8043e8346370e463ffbbadd63eb93e4 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/216f4a3e63106e8bafc338b760ea82d7c10cd5ad |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/a575ed8bf47ddc92b58fbdb13190440e7163e1e9 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/995456a0d090fcf68bdba094f40ebf85ac26423b |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/96fd716eda7950df5cfe4a7f460ff3dd93ba8ce7 |     
 powerpc64   |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/29c5f6bf32bd703010f8268df6463b91c667f2c3 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/0287019eca58246909ac828d38402387a34c422f | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/2b2eed05916ab61b431cbe429e8edf4caca1d3a8 | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/11c4d59277c65d756b9fc707c755fdd21685389d | ORPH
  riscv32    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/671dd2580cdc84bdffa19eb5b2c36e0c7cde85ca | ORPH
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/e8b3ee967884877c8f21c314c6407e8a67e69e94 | ORPH
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/adee9857ef12290bf7afff3f80e5adb0a2c33421 |     
   s390x     |             glibc              | TIM | http://autobuild.buildroot.net/results/3fb8a5cdfaaabefae6017004d6cc80464ba0596f |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/cd85a53eb895328a9b7dc1e63c5bd2c37f81cd16 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/4b4d1491bf5c9e5658971ff65027d19ec93bd6ad | ORPH
  riscv32    |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/a1af0b8ef78cd17f01af01e779de464038ab8b3d | ORPH
    arm      |          gvfs-1.44.1           | NOK | http://autobuild.buildroot.net/results/77c833f964e8b1a5f3ad346ed4113a9780278115 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/0330b842471d968dd17bd04f361a8921d2f42a47 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/5b49561c2ddc5dff743cde82f296319070e2404b | ORPH
   xtensa    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/c204848d95a7125023a5ad9d636275b06efddb32 |     
    arm      |         host-gcc-final         | TIM | http://autobuild.buildroot.net/results/e34e33aae80e34ac2d537bc709ff11e887710bb4 |     
    arc      | host-gdb-arc-2020.09-releas... | NOK | http://autobuild.buildroot.net/results/d6a2fd2310a30f6c961febbb03b686e3cae24e81 | ORPH
  riscv64    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/5c10d311bdb3da5dbe3b30047f8ed049d68ee0dd | ORPH
    i686     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/a27a096d288f573495e262543812ef96b4b03c99 | ORPH
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/0dc4796fabb03e6a648275e108549a5ce5094610 |     
    m68k     |          host-python3          | TIM | http://autobuild.buildroot.net/results/4d9e431bbe9b089b6dd6b6b8b1f6a58b216545c4 |     
    arc      |          host-python3          | TIM | http://autobuild.buildroot.net/results/90e45db3289310effe61fc5b4276feac942bbdf3 |     
    sh4      |          host-python3          | TIM | http://autobuild.buildroot.net/results/6239b5876c7d39c4eef55307fd3f613c43ce8620 |     
  powerpc    |          host-python3          | TIM | http://autobuild.buildroot.net/results/6d70aafda2f4fc60fcc27719133253f9a824288a |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e49fbcb5e2227d1310695e67adaf8ea4012f1046 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fea30fd20c0d62937d89a2dfdf883d7f793901a2 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/99e9cfe5f5ecbba927fb79e18f405d52b2e33b1c |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c95f93880af13e89c8aea038654f2e4efeec0d0c |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/96e086abcc47ddf70020efa134302174649aa0b9 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/0da081652dd73ee45912f0d844b46aa10264ace4 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/ec0cd1c2c6751bbed02bb4c7f47ef6daa7ffbb0f |     
  riscv64    |             lapack             | TIM | http://autobuild.buildroot.net/results/a1f8190cb9f9dba964fa7f338abef39ddd0b5d01 |     
  aarch64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/f38ce2103d539b03d533230a52d142ddacf6dd46 |     
    arm      |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/cd914b608080d0799547aaf71e5d6e95ef681cbc |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/911a0260e945ca7755863b6a3f55dd5271ac9659 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/237aba0c16a34fec1b0fe50fe08cace438eda1bf |     
    arm      |         libqmi-1.28.6          | NOK | http://autobuild.buildroot.net/results/5e1e4a22e7d6c7e1acf85e97961ef77767b236f8 |     
  mips64el   |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/44e2757486108c133bf898fddb6de8ee79df8eb0 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/0247d24739dd39af899573fc7e0ed6a0e6cc9711 | ORPH
   nios2     |         libvips-8.10.6         | NOK | http://autobuild.buildroot.net/results/06cd0408468a987520449c82c67b4db2f5b949e7 |     
  aarch64    |         libvirt-7.4.0          | NOK | http://autobuild.buildroot.net/results/0341be10c4c36f37b5b6486428e55170a42b7692 |     
   x86_64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/0ca5c5f6be69ea7351d2bafb520db201c1df5faf |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/f6068cebb5ce779ed96493d7fc35fbc6da019f13 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1d861ccb8e3bb93b8ed58778e402d45ca6a342a3 |     
 aarch64_be  |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/d296ed6ce31a82c38c81299c2eae11c5fb0cee1f |     
  riscv64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/bfa55eeaea105a91ab86835646dc0b4841906d27 |     
    m68k     |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/1885b2d8c08c80a1767e47ac5b92553d7d1597db |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/3f3daaef8d9b9aa23c35f53f7ae3ed1ff4742b14 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/904e996a894e691a57407315c4f9bc6f908f2ed6 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/0f8734be3acab83db1564d339aef36f9941f5f8b | ORPH
   x86_64    |     nvidia-driver-390.132      | NOK | http://autobuild.buildroot.net/results/aa9ba9981887b710194baccf28a265587fccb038 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f9e3a3aeb1f94c0808c1e8ac3db9ded930c4b216 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/5b6f3d9b7a54e7ad4abc11912d1020ec8d8ad4f6 |     
  aarch64    |          polkit-0.119          | NOK | http://autobuild.buildroot.net/results/b3617a10baef07701a5e13848c674a31b9f31df2 |     
  mips64el   |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/33cbaaeefd8637bac4ad0fbbfae7c369de4875d2 |     
    i686     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d526e63a5a91876f8e6e560048775bbb5ead079f |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/b63dbc1cd499adb42b4b0266c128a0908cbe5202 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2413689d53953ac14348637c879e5d9eaa7e695d |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b298029f85d983051a2bffda755ac1425290324c |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/564361a655b9e5faab17e64fbda9bb4f90ee8867 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0f81489de0affbb4320b6cb4017bcae991e52d53 |     
  mips64el   |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/96739b581444887e848b915986abbe47f8cda1df |     
  aarch64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/7b43ad2d52ad6fe38026d49a8042ca893095e766 |     
 powerpc64   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/434dc112bc09e11ef396f60943f015e0e8d39c7b |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/f40e09d621ab5ba66dd97138dec174acfb7fda2a | ORPH
  riscv64    |            unknown             | TIM | http://autobuild.buildroot.net/results/5ea5a2b4cccc14f5ad20efa1b74bd677935286ca |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/e994fda00edbaef3cee61d91f11690422d1ee193 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/66f904648add42009f973d75d817cce6304fe270 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/81bac09870e9b31b2d721e2a09cd230283fc6912 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/43b8c187da0e04a550fc4bbe916b8c7ca34e2203 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  host-python3 | 2 
        host-sentry-cli-1.57.0 | 2 
                       unknown | 2 
                  apitrace-9.0 | 1 
azure-iot-sdk-c-LTS_07_2020... | 1 
               belle-sip-4.4.8 | 1 
               cutelyst-2.11.0 | 1 
          libmodsecurity-3.0.5 | 1 
               libtheora-1.1.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/43faa31b65f8aff25baf069b72dfebb6e4250490 |     
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/fe1ea8a003ab3eaef0f823808e7a3148c7de76eb |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/2d64b084e7fd514d98256b0cc2dfb5b9b97b7876 |     
  riscv64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/487be2a5af36a8c64965d753e50cb2d9ff901e35 |     
    i586     |          host-python3          | TIM | http://autobuild.buildroot.net/results/ceddc7ca4ab1619dc7e32070d0a89e96e633655a |     
   x86_64    |          host-python3          | TIM | http://autobuild.buildroot.net/results/9570ceeaac6dedfa8cc4a05390a7c59d06976cf8 |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82186fef6e7c5bb510b07e6e82bcae3c909df9ca |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d31a62072a8401836163c1167bfa3b54aeb7901a |     
   xtensa    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/e67748c131de3d588389134e3d3d11f50566673d |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/f40454ad2d269627c10f069ce14f274b9120de5b | ORPH
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/65dcee4b8d7c88d0e0e3e8c2083665f4a11170c0 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/9ee2e525c059c7f74ef085cb5bb30683762991d5 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/e3a4a8cee256518c51b7ff5a061dd8c6fc7ee8e3 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e83988f625729396df461f6a1cd228ccce5a47b1 |     
   x86_64    |            unknown             | TIM | http://autobuild.buildroot.net/results/9d052b6c7238b93d80faa457deb25faca0800306 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/a066db1c91d9589f1b08fa0b60b1bcdac13fc1c6 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cdf623ee3beac3c316608703070f9c055b91f95a |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

          libmodsecurity-3.0.5 | 2 
                  zeromq-4.3.4 | 2 
            erlang-jiffy-1.0.6 | 1 
                    ffmpeg-4.4 | 1 
        host-sentry-cli-1.57.0 | 1 
            libodb-mysql-2.4.0 | 1 
                mono-6.12.0.90 | 1 
                   sdl2-2.0.14 | 1 
                      tar-1.34 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/95881d24d019cf9079786c9666d0f3fd64d7b006 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d90fd12d5a260107f42cc8b9c8048ca941d55c84 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/423e0e1af93b884467824ee76289f245310a0299 |     
   sparc     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/d742b6b1c5a540a5e45571290b9ff69c9b34cc10 |     
  powerpc    |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/306b94a04a2acdbc6b46b4b4d03479cadbb38e60 |     
 aarch64_be  |       libodb-mysql-2.4.0       | NOK | http://autobuild.buildroot.net/results/c84f6e0857941fc18281a3aeec0ed942ed5df0db |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/2e5270cc76b0b73ebf740c95830bce407f5967e9 |     
   mipsel    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/e0eb3501c1b36784098f151643b2477e9ffdc8a6 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/6a55805e31683ff6b7660d30c4ded7e65dfd4259 | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/85067ef93096a5e403b6cf8086b6fbdfb8898126 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/cbad07235e949bfadf324174f3bda54edc15f51f |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 16
              host-libcap-2.52 | 4 
  gobject-introspection-1.68.0 | 3 
          refpolicy-2.20210203 | 3 
                       gdb-9.2 | 2 
                   libnss-3.68 | 2 
               apcupsd-3.14.14 | 1 
                   gconf-3.2.6 | 1 
                harfbuzz-2.8.2 | 1 
             libmediaart-1.9.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
                qt5base-5.15.2 | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/c4c7c46c926a1d5f1197aa11247e5247e33242aa |     
  riscv32    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/3c57844abb70b688c6a037d95b55b1504724e4e4 |     
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/50e3fd092339f32b03ca2ade78de9da24ab1766f | ORPH
   xtensa    |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/7212db7fa9662c08a333db51a4c44b0fe02adb18 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/71159fc4d455b55302e6163da73fcdc8f1f37388 | ORPH
   s390x     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/b6907ea5d8360c7481b752d19229417d9a648e61 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/18422e658c093fd914656e2baa59bfcffb195b54 | ORPH
    arm      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/7910a39e3c7cf4ec45bafb1545a9c003b08b9124 | ORPH
 powerpc64   |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5f84a47c12977d40b83a822f4f719372784120f0 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f4fc0f2e5a3994b9daf7b9f3d8de5d43bd885ae4 |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cd1f07847fc43dd8914a3a19d812c58f569664f7 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/275f5b5f624656cabd556a8c24e3f63466d9adb3 |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/84e5f0a7e6c5adc8266eb882cb0747f52339b87b |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3f4e01584b0f90efab4a60513452abdda873e216 |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f82dfc0339c53b805704a45221a4d004d419feeb |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/6ce7dc8dc0720f68276d76c2198594068328abeb |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e0d97824b39cc23beaf81182a5958334f84d2b0b |     
microblazeel |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/d92b5238b0b9224904e2f847ea8fd1039eb60577 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b797c75fcd7a09ad723421edbeda8dc0350b7a32 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/3b65a7890793c50a6305435d95d64d6a00265ae5 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/44d0b59bfa7d23854169e5514ee505b7b01a7753 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/65b64f6b5ca6d18b231d538868850f7aab5c11c2 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8f09a09d0bb06e796dc6bed6aefb325ef2bbc505 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/39d2ca01bb2abe284ef01da80cacf63ac1046d58 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e6a53b8bb7ebfd8ab0df48f75bec96d4dcfd5de4 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/32ea34f59d765327ff1a5de44d72d4f164cee4ae |     
 aarch64_be  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e9f5b74df9f54d4b157ccce952656ce552b49d41 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/517eacad44aaf450053c72259fc15c4e925c45bb |     
powerpc64le  |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/996c0052a89302c593e6587b953e77662650b722 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/e9a19f69a63fd779aaf7ef794ad5cfa3cbc11415 |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/3cd9e8acf7bf66b5dcd7d5b95ff7d56205c41e03 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/83e01ae64056a1f838fe57757b4de06f6ada8095 |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/7126ddcb47a23e0542e3733d9019f04de58f0208 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/80cb352263a8d03f90f282552fcf29963d9e0738 |     
  powerpc    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/8b0c5f8316297e1d27c26864672487014fc423dc |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/5f9e9f55bedeb07223c2d4667ba221fbc64492e0 |     
   x86_64    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/8333650adcd0c49313a3b2b2affdc638d9d725e7 |     
microblazeel |            unknown             | TIM | http://autobuild.buildroot.net/results/490fc1baf62dc933e6cd577403d65b3052f791e8 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
