Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322CCC4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C03A161357
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 06:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C03A161357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E9B380F3B;
	Tue, 24 Aug 2021 06:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S99XdNruNZLF; Tue, 24 Aug 2021 06:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA6B980F4C;
	Tue, 24 Aug 2021 06:57:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F00A1BF339
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DDE4607D1
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 06:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VeIUTAY3bOvL for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 06:57:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B2F360662
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 06:57:34 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7D34460010
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 06:57:31 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Aug 2021 06:57:31 -0000
Message-Id: <20210824065739.3DDE4607D1@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-08-23
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

Autobuild statistics for 2021-08-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 22  |  6  |  0  | 28  |
  2021.05.x  | 42  | 10  |  0  | 52  |
    master   | 175 | 24  |  2  | 201 |
     next    | 37  | 20  |  0  | 57  |

Classification of failures by reason for master
-----------------------------------------------

               capnproto-0.8.0 | 3 
  gobject-introspection-1.68.0 | 3 
                    ffmpeg-4.4 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
                 dc3dd-7.2.641 | 1 
                harfbuzz-2.8.2 | 1 
                host-go-1.16.7 | 1 
                     host-llvm | 1 
                host-odb-2.4.0 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.1.6 | 1 
                       mongodb | 1 
                     mtd-2.1.3 | 1 
                  mupdf-1.18.0 | 1 
              openjdk-16.0.1+9 | 1 
           python-pybind-2.6.1 | 1 
             qt5wayland-5.15.2 | 1 
            resiprocate-1.12.0 | 1 
                   sdl2-2.0.14 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/39c26ce5ce4e4d29b31144c6af6dbf300db5671e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d2e4e8c6ad69489ddc6d7537fa143d4d65f57bb2 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/47af586100de4d3fb6c2b0f1f6867eaee679528d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/f8610884b118970a5006a97c95e221afd2c8e220 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/c6b530eb94b30b30362d881e8c6e5ab0bfab4f65 | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/1c7b3db8213a8358dbf8b6ab1aaf99c710c438bc |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/c1f59d9bf6d420b49ab50954351443d3f51b8dd9 |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/a88524474ebfde8b5066af9bbd305c7ef1f45e41 | ORPH
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/121db109825b93d43977aa7d21e21082a8200824 | ORPH
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/74e2c4243467774dcffb4e559f4f7047d0567ccb | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/91f140064a5203a21a3bd592e60e510c5cc756ca | ORPH
  mips64el   |         host-go-1.16.7         | NOK | http://autobuild.buildroot.net/results/7135b53ae030e3c6c94c38e7ac5dec02be5beb08 |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/95170dc4cb554273ea8650f939e7127ea29747c6 |     
 powerpc64   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/eb8d9da8caefa040075e9500d7e2fc463b14713f | ORPH
    mips     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/05802bec33b4d135ae3985ad53fae77c43585d32 |     
    m68k     |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/55aa52ee5a1c82a37fd8a17079bf97a5ae60095d |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/86333d3de24312d2377e71a39f5aad70a8b71939 |     
    arm      |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/a2b6dbf707275e3f8262479c0650cfc7cb9abc8d |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/56fc732ef7e1be47ef269564d70ccc86714e4b56 |     
 powerpc64   |        openjdk-16.0.1+9        | NOK | http://autobuild.buildroot.net/results/2df954482e724499ee163a1d9cebf28db4856bdc |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/8741ccb5c5eba5154ba221b624c7b27174d8de8c |     
 powerpc64   |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/36de93de5e9a69ef1822eefe234f6379c3312e93 |     
    arm      |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/07b7ac6a5a23cf49863f86264bc63b6be369f709 |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/70c6821ad9bdb6774a6b467cd8e04967952f8cbf |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d71104bc884319b60b48407b5f439c8d43e8f684 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f6c81a4c0e7d7382dec38f5758877881ddcfa2f9 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                 mesa3d-20.3.5 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                    vlc-3.0.16 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/57fb99a497d267f6cc4b71744d95a00f0b3f19d6 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ecd293477173b7dbe870d238664541d89fcdcb6e |     
  riscv32    |         mesa3d-20.3.5          | NOK | http://autobuild.buildroot.net/results/5953135ab5847386372094f7f16a9f823efb83ac |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/d4642ecd23b5ab843241e8a6f5001e0c39fe28ff |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/068d724cfd37af02ca3a63db5def9aa65babaceb |     
  powerpc    |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/627c8779f020bdfe8f1dd5eca9dfac434087a35e |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                    ffmpeg-4.4 | 2 
                   sdl2-2.0.14 | 2 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 
                    xen-4.14.2 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0be12313745b1a310da39ce040020ceb7bf4032a |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/ecefac1645ff2ca574a6bbd49b61f70b830c7756 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/259518497947f2e10914f2ac8db4e67cb42328ce | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/b9947a5b5588cd5c1bc3808e70861061f1130e2d | ORPH
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/5a0b8445a699f278b33ae9c1694b0c6a20af5558 |     
  powerpc    |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/a8a66160c34a3706095df69778e8b7bf5291f027 |     
   nios2     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/4c1ade6d8781fcd0feadc3a37637413b28b44874 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5265ca4353ec62a03ecb7c747506014d3a374c20 |     
    arm      |           xen-4.14.2           | NOK | http://autobuild.buildroot.net/results/0d4f60f0c24bd2f71a3318206bcd5697e9f8f90d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/988ccf24ef37f7991c16875e7e4af7818ea52c5a |     


Classification of failures by reason for next
---------------------------------------------

                 libebml-1.4.2 | 9 
              host-libcap-2.52 | 3 
          refpolicy-2.20210203 | 2 
                apparmor-3.0.3 | 1 
                   gconf-3.2.6 | 1 
                  gensio-2.2.8 | 1 
                 gerbera-1.8.2 | 1 
        host-sentry-cli-1.57.0 | 1 
                    qemu-6.0.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/d556a4a79ec8487a3c422f9ee228f888c0e2283c |     
   nios2     |          gconf-3.2.6           | NOK | http://autobuild.buildroot.net/results/654e3f6b9f796ad60a28bc9f8fd93f3b2c432d58 |     
   sparc     |          gensio-2.2.8          | NOK | http://autobuild.buildroot.net/results/c1b397eea1c2eda19149844cec4a87d55651862d |     
  aarch64    |         gerbera-1.8.2          | NOK | http://autobuild.buildroot.net/results/79e495b2a62a8ad77aa95fa36864edb9b9cb412a |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a46b5fd9e09e721b681982fb878a3e648444456d |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e716d68e4ba85d43e0fa7fdeee42d1ee4dc8936d |     
   sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2c309e08b2f742a7bb9996557197f695c648c7c2 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d09f0f56f11c15a02e02e84016e3b15b54381ae2 |     
   x86_64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/7c4f741b2d0ef054fd7802a687c6e6f7ad15b793 |     
  sparc64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/ccf947345cb597cb47448c0e32a113975b581efa |     
   mipsel    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/36298b7ed18dabb71c4149bfa0785d4ed3e28ae5 |     
    i586     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/730bc0f3e1eab5570f28ad45a042cda8cb1a46e1 |     
  aarch64    |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/e39fcda962f8d43bc92cb1fa5bc5f3c5f941c79b |     
    m68k     |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/26a39ac14322254632ecd7c2794de0018badb204 |     
powerpc64le  |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/b63c078aa4d7e82a28565ddf7833f52e70568174 |     
    arc      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/8976b5ff5b72b5be8ca91ab4d12c248b8e682a2e |     
    arm      |         libebml-1.4.2          | NOK | http://autobuild.buildroot.net/results/5dc1d056911dd08eda7bb3e7769fed16e9e30256 |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/63cc2f16bbc56a59077571076b581522f6595c57 |     
  riscv32    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/b9aa00274d7e293d7f58f48239147517f9874679 |     
   xtensa    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/afc53139fb5d100ab331059bb6fa5d7477c31c64 |     


Gitlab CI results for 2021-08-23
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
          TestATFVexpress | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842591  | ORPH 
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843432  |      
        TestDockerCompose | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842723  | ORPH 
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842594  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843359  | ORPH 
...h4aebGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843361  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843364  | ORPH 
...sh4aebMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843365  | ORPH 
...tlinShsh4aebMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843367  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843371  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843376  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843380  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843383  | ORPH 
...nX8664corei7MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843385  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843388  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843391  | ORPH 
...core2GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843396  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843399  | ORPH 
...6core2MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843402  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843410  | ORPH 
...6i686GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843415  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843417  | ORPH 
...86i686MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843418  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843421  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843426  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843427  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842729  | ORPH 
  TestInitSystemBusyboxRo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842649  | ORPH 
  TestInitSystemBusyboxRw | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842684  | ORPH 
         TestOpenSshGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842898  | ORPH 
TestPythonPy2Cryptography | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524842963  | ORPH 
...thonPy2ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843004  | ORPH 
        TestPythonPy2Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843019  | ORPH 
     TestPythonPy2Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843025  | ORPH 
    TestPythonPy2Txtorcon | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843032  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843045  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843071  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1524843075  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
