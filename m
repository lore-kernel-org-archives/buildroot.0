Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50824C4320E
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 06:55:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B667D610F7
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 06:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B667D610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B939404C5;
	Fri, 13 Aug 2021 06:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOqVyeOzXKko; Fri, 13 Aug 2021 06:55:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E0DB402C1;
	Fri, 13 Aug 2021 06:55:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85C2C1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 06:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75EEA407A8
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 06:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfYjZLgNhPl7 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 06:55:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F21E74043F
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 06:55:30 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 21FE810000C
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 06:55:27 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Aug 2021 06:55:27 -0000
Message-Id: <20210813065535.75EEA407A8@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-12
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

Autobuild statistics for 2021-08-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 35  | 12  |  0  | 47  |
  2021.05.x  | 51  |  3  |  0  | 54  |
    master   | 183 | 35  |  1  | 219 |
     next    | 43  | 38  |  0  | 81  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 8 
          refpolicy-2.20210203 | 4 
               capnproto-0.8.0 | 3 
                xenomai-3.0.10 | 3 
            erlang-jiffy-1.0.6 | 2 
                 mesa3d-21.1.6 | 2 
                    mpv-0.33.1 | 2 
                 dc3dd-7.2.641 | 1 
                      gdb-10.1 | 1 
                 gerbera-1.8.2 | 1 
  gobject-introspection-1.68.0 | 1 
                host-odb-2.4.0 | 1 
          libmodsecurity-3.0.5 | 1 
 Makefile:740: target-finalize | 1 
                       mongodb | 1 
            qt5location-5.15.2 | 1 
                suricata-6.0.3 | 1 
                  udisks-2.9.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/13ce676b07251378b92b57d22a685458a21c6157 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ded16fe07442dcaf3372de649edd4af2cf7a7704 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a5a838e3e0d040c0298d3b3baafa4df0fa656a64 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/4b121a89c827a3e278f13a9e1f206734780aa670 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/0515f3e26862645ddbd7d358560c84c79428958f |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/bb2efca18903021b44ee72a13a710ca7aa91b304 |     
  riscv64    |            gdb-10.1            | NOK | http://autobuild.buildroot.net/results/b936ee915fa3974ab9995e53a40fc44868969818 | ORPH
 powerpc64   |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/5eef6a860c48a79eefdd7a4e396150835b454214 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/878a67c7324db3d5fed20e128e4dda3d8d450c3e | ORPH
  powerpc    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d21724513656a9cbdd419c57b26d613601ee8967 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/e7f4527310850d9d4df699d7569772591cfaa479 |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/65765a94e7fc515cf18f516881bd1a17fcde9cbe |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/49c4a3a18bb0f1077660fa020bbf5c827f6de11c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d4c40f9097098fee5fc0ec61cb33fbf5cfd0358 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2f42747f4e7a0e52aa8aa29113c8b4c5fe17f476 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/876daa710cd9e1ec3c59b94e24a7a4043b41c944 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dd43c5af941c8b007173a66382ae4133bb8f2500 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/13adc8f9f97509968399ea683a66de8249de01f5 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/7a8a33398051ff03773a7ee4ab2eb6dfdcaca482 |     
  riscv64    | Makefile:740: target-finalize  | NOK | http://autobuild.buildroot.net/results/f857986b8c9b6d4a843f3694cae8527760540ed0 |     
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/670124669fe4d28e05d731eeb5106dec1e0e2a11 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/9f1b5dbba973950040056804d38837aaf9cc3ded |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/0909a528b3a80c309d998305e0c7c0d2d35ecb3b |     
 powerpc64   |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/fac256a5fe8abcec568d940284e578dc6e2e6170 |     
  powerpc    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/706f146afaaa671ecb0c40c67f6addaca5d2afbc |     
   x86_64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/10258b6b02fc2752132b456d4929f87f74724f22 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/33c75715eddabb4374f7734e49b85541bfb581b5 |     
  riscv64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/639886955bb5cbbb63e63bd9ad310f552c8bcbb9 |     
   s390x     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/60ad1c3360e371590ce706f79faad6baa365c343 |     
    m68k     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b84606af63a48666a9387409526913ccfd97a872 |     
  mips64el   |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/c62159d0da3c7053757f5fcc3a5045ea19dd6f2a |     
  powerpc    |          udisks-2.9.2          | NOK | http://autobuild.buildroot.net/results/a760b9877373e4653ced4da5f738e7d1be40c8a8 |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/c48ac1a3d619df40a12889045f8371c78f541fd1 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/653842aa0403be68c98ee33300c36467424845ab |     
  riscv32    |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/99e450efb229df75696e1557c27b187dcfa7812c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/67446b6ef8dd89ceab1dd9c0601e12d44a32fad6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
        host-sentry-cli-1.57.0 | 2 
                rocksdb-6.13.3 | 2 
                  apitrace-9.0 | 1 
docker-proxy-55685ba49593e6... | 1 
        glib-networking-2.66.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
          libmodsecurity-3.0.5 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/46b0496af057b80f948c501bfaafef33607b46e5 |     
    i686     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/0d0dd558531215bb7188de294df79c4bef7a52cd |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/ea6273a2053eb28279954824b7d8842b19b369c8 | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b95b3bce142da0b044e47a3d38ec88de811eeb32 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bddd1895c94d39df24e51912634bbe807afad1b2 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/84c119add4d6fc0d7a79f4b70c7e3ced7b1a0443 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/3416ec9d21354f1784f41d99cc554d9179f61072 |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/1a97a9cc5b41907c40a256a04689731bff024e10 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/01f05090ed3f40952c2ea353b9c6d76518025d16 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/df1a0c0984a05a45256ec16cd78debccb98d41b8 |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/826da85cb249eb3994ee01aba969463ef8ca1e43 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/88cefefc66ed2b0dc24e7ec7ac9d2b0f152ffc1b |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
          libmodsecurity-3.0.5 | 1 
                qt5base-5.15.2 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b134536503f3b37611d60fa94802e43834312872 |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/88d2c989eb66938a0056726b319c91c210974e1d |     
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/5d8d4896b59b1024b04188f233221bf3afaa2c8e |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 13
                   gconf-3.2.6 | 4 
                    ffmpeg-4.4 | 3 
android-tools-4.2.2+git2013... | 2 
              host-libcap-2.52 | 2 
        host-sentry-cli-1.57.0 | 2 
                 dc3dd-7.2.641 | 1 
                ejabberd-20.07 | 1 
               libgtk2-2.24.33 | 1 
               libgtk3-3.24.30 | 1 
             libmediaart-1.9.4 | 1 
                   libnss-3.68 | 1 
              libsecret-0.20.4 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-21.1.6 | 1 
          refpolicy-2.20210203 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/4331862a37945cdf97cf908f7ab2b04c741c785e |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/041fff49e4b64fe7d2eb3193ab7130a13e988990 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/1f2dff9352ee01341e04409fd5df60c90f0576e1 | ORPH
    i586     |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/188d07e9e0e734306174495bca97fe5bb81f3e1b |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e154cfe0880373194b4909f8439d9da964b3144d |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/e4a52e327ecf042c080a357e9cf10512698394b3 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/3d0172368edd5f9392934607099b7bc36881f9c4 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/d45959f5223f96f5458f8e4657b1a51cfede41f4 |     
  aarch64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/39c39eabbc99c787107957e27242f21ffb4c6011 |     
  sparc64    |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/bcf4d47e5129f15db31275d2a1c4fc8d58898c9b |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/6038a415ce3f9a5b7c764d2729adbf553ebb2c06 |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/66f5b686803646c34af52654ea5a5507084b1ec3 |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/b0cd307597b32a5f2627ab8e021dd35f5b1d493c |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/528633a1ec363c0749d070e49cf0302df8d1e919 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb15b434ecc20cbfdfe8f54097cbea77f7f2181b |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ccc6c24eaf2fd3a9353b17b17f3ada4abc8c3ace |     
  mips64el   |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/effb98c7bb431586e59625bbf0bb5a52dac9d6d6 |     
  powerpc    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/59e3fea88ed20a3858da291aeae1add59ea0c530 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f60c1164817e9985f8c595629debbf4274659ecd |     
   nios2     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/26925938da5d47822347e3db60724c555859b330 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5c0962fa77d426179f70b6defc454c571d3c22ae |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5d6db4739b265dad21315f4a4efc761385a64bc3 |     
   xtensa    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e8a28a6f33c9258db397a841a6493a455f878fb4 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/27418a923d1bd131f7ff3e5e35f7c00527c054c1 |     
   sparc     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/2cd21e44ae68edf6a8974bf55ee41f0030d56d9b |     
  riscv32    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/738e24750be81f951382d38abf2daa732839c1f1 |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/f1cf749c9cf01d1ad37abaa5d03927d24d3607f4 |     
  riscv64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/78f6773df309762ca1f1dae1cbf4d9ae57844f96 |     
   nios2     |        libgtk2-2.24.33         | NOK | http://autobuild.buildroot.net/results/aaa617ae5ea84b8dca0527520ebe7b29203208c7 |     
powerpc64le  |        libgtk3-3.24.30         | NOK | http://autobuild.buildroot.net/results/aff64beeff3cda9c1321b0c1de8f55dcfffecc86 |     
  riscv64    |       libmediaart-1.9.4        | NOK | http://autobuild.buildroot.net/results/1f199e0071a11d405c43fd8f7eaf78a05dbc3f0a |     
 aarch64_be  |          libnss-3.68           | NOK | http://autobuild.buildroot.net/results/b3989f9aa0e0b2ac0f24d794cb190543430051d7 |     
  sparc64    |        libsecret-0.20.4        | NOK | http://autobuild.buildroot.net/results/054a6296222d291cf0ee6dcb4fa0897dca4dd367 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/ed0f8b77854651173b549ef0d0d2b54b174b5bb1 | ORPH
  riscv32    |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/089022174bf27a16cf494377675ea0dbae8fc1fe |     
    arc      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/274dea66b5fdc3301c8b61021740f95a8e5cb9c7 |     
    arm      | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/6abdae6f8b9849779295c35931c2ddc3d5f09291 |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/eab194db288e9bb2dcb46a3b526db937dc4c24e1 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
