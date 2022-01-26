Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60372C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 07:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB1460B44;
	Wed, 26 Jan 2022 07:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-fDH14CKaFY; Wed, 26 Jan 2022 07:06:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC63E60BD6;
	Wed, 26 Jan 2022 07:06:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C85C01BF844
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 07:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB83F40629
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 07:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c16Yf5Gwb3W0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 07:06:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FEDA400F2
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 07:06:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92CF01C0010
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 07:06:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Jan 2022 07:06:27 -0000
Message-Id: <20220126070633.AB83F40629@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-25
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2022-01-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 62  |  7  |  0  | 69  |
  2021.11.x  | 23  |  6  |  0  | 29  |
    master   | 98  | 40  |  0  | 138 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 7 
        host-util-linux-2.37.3 | 3 
             bluez5_utils-5.63 | 2 
                       frr-8.1 | 2 
                rtorrent-0.9.8 | 2 
                 wavemon-0.9.4 | 2 
                  xvisor-0.3.1 | 2 
              cryptsetup-2.4.2 | 1 
                     file-5.41 | 1 
google-breakpad-7515ab13768... | 1 
       gst1-plugins-bad-1.18.5 | 1 
                   gstd-0.13.0 | 1 
                   guile-3.0.7 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   libiio-0.23 | 1 
                log4cxx-0.12.0 | 1 
                 mesa3d-21.3.4 | 1 
               mongrel2-1.13.0 | 1 
                     mtd-2.1.3 | 1 
           oracle-mysql-5.1.73 | 1 
               pcsc-lite-1.9.5 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
               pipewire-0.3.43 | 1 
      qt5webkit-5.212.0-alpha4 | 1 
                    ruby-3.1.0 | 1 
           tesseract-ocr-5.0.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/54adb8da5e66e02f3943a681e21e8f26020723ea |     
    arm      |       bluez5_utils-5.63        | NOK | http://autobuild.buildroot.net/results/76eae25f0c53205aad295cb79833aa59cb5aade9 |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/c723c687d5c26206c98cfa84789e9fdbdbad31b4 |     
    i586     |           file-5.41            | NOK | http://autobuild.buildroot.net/results/31246e6d4dd51863c16e17cf5011092f3c4b7bb4 | ORPH
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2756ee8a00d78c2a04762972bcddf3c15564a0c0 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/ed31b5f6ef268009d5f8e76d0c1e18337a9e905a |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/97e3722e8ede7fa2aa0073dab4df654f3df186fb |     
    i686     |    gst1-plugins-bad-1.18.5     | NOK | http://autobuild.buildroot.net/results/eaf1890176431000ea8b371956f0d2d7e9907aea | ORPH
    arm      |          gstd-0.13.0           | NOK | http://autobuild.buildroot.net/results/b9db1a63fa3740b7c6e089ddc2e1557ea0ca0f5e | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/d6ceddf52d22453fe21665b9b865f2c782382353 | ORPH
   x86_64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/562757475bbd1d3fdfe2ce3f5237d8d4cf1479ae | ORPH
  riscv64    |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/271d8a7d670b6a7314b8e2159829a222b54f41cc | ORPH
  mips64el   |     host-util-linux-2.37.3     | NOK | http://autobuild.buildroot.net/results/11bc283f48b058738b89204517daac7d720abf03 | ORPH
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/917191d50af8f97b7bda82a669f3185660f64373 |     
    arm      |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/e8847eabd5df1d9d31b88d69230145916020585c |     
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/f635b4c0032ce5cf8a56f526ba6092c0895e9b11 |     
   x86_64    |         mesa3d-21.3.4          | NOK | http://autobuild.buildroot.net/results/55c3c66c6c909853d47a470e0bbbab7186c83793 |     
    arm      |        mongrel2-1.13.0         | NOK | http://autobuild.buildroot.net/results/3e931bb6833e58f6ddb56ebbc0c599d71c3a8625 |     
  riscv64    |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/f9bcc2f70eba388b28616bbff2d6e3b3e298837b |     
   xtensa    |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/9a6e946cca1fe51ad157e6ca12ce5d7f41e8c8dc | ORPH
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/1ec8035c8f01e5488b5ae4e079badfa0c543f958 | ORPH
    arc      | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/889a0aa9d8e78c066b03a491003fa8cd03597309 |     
   sparc     |        pipewire-0.3.43         | NOK | http://autobuild.buildroot.net/results/192f40a5c6e05fc11507494e19db52a47082fc35 |     
  aarch64    |    qt5webkit-5.212.0-alpha4    | NOK | http://autobuild.buildroot.net/results/f9aac4aa3cc590e77a510223624aebdc8547a8ed |     
    or1k     |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/0aad6294d1f24a9e37e7fa56093aeabdac0f6298 | ORPH
   xtensa    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/fe114a9af0ac0afc77243fd27035477bfc315e8c | ORPH
  riscv64    |           ruby-3.1.0           | NOK | http://autobuild.buildroot.net/results/7fb735e45754f415a32b348be465849d5f0d999a |     
   sparc     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/a566e2dcabb20625fa3471b610674ad46117acaf |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/d088d25baed4e150850c7dc35e19e04821520c51 |     
powerpc64le  |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/953702716339fa18a1f8ff6f9e7164938a3a32d6 |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/ef794d13e33665706c559230533f510f9b09f82e |     
    or1k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c076313116d1673de4ea83771c7ec2747ccfa99c |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/2c4f10e59fa30b51571fdd49b3a4b073321ee876 |     
    or1k     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9cc341458465e085fbcb7f11db3b4fb50dabf748 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/7d43c5b119bfdbef58ef0982d2f7a6260e2b7e0c |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/5bd88a00dfb20bfaec848b9364f62bbf4badef47 |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7b8d62b1243136b236f5b44af024d41be5bbcec4 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1b8021154751346fb5600b2b141980bdcd7e550d |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2 |     
    arm      |          xvisor-0.3.1          | NOK | http://autobuild.buildroot.net/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               apcupsd-3.14.14 | 1 
                  gensio-2.2.3 | 1 
monkey-f54856ce250c4e257354... | 1 
               openldap-2.4.59 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/95417fecaf5976aa788c4c6f5ec58f3d75619c73 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/f165cda8231d63d7b315532a805fca96829b6786 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/981cd03f661e96e86e4dbbd7b2fcb66bf7adedb4 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/360860fa5a9764620e9c759bafe925537f5c36c9 |     
  powerpc    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6ef4b40c949458afafde99746ccdb1cae3427f31 |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/52ce384941c2a7b72563d66fc3e5315d0d413729 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/cad0d08147f78d82228b2e54648a718fb292fb90 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 3 
libdbi-88b8477d57153b9f736d... | 1 
                   libnss-3.73 | 1 
                log4cxx-0.12.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/384a0f8a933ef3f3fd58234667e8aa1ab182ddf1 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/95c73e4235569012043c7c2909b8b65459502052 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/626168546a3ef19fce9fe59be5ef0531e752548b |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/d8b2626828d09351bbd91a7931f5b94e2bf790b9 |     
   mipsel    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/69dc2eb15f7d6c9727b48dfd888f5d611e0ce20d |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6c917351920678771987a9f06c3bb8c0dd489b17 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
