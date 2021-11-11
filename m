Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E491C433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 07:03:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E6461177
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 07:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E6461177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B60B240445;
	Thu, 11 Nov 2021 07:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EmGeQAWa-M4H; Thu, 11 Nov 2021 07:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3766540379;
	Thu, 11 Nov 2021 07:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03C691BF285
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 07:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7ABC80CAE
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 07:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LHIbYt6fsiD for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 07:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECEF180C97
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 07:03:33 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E748640003
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 07:03:30 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Nov 2021 07:03:30 -0000
Message-Id: <20211111070335.E7ABC80CAE@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-10
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

Autobuild statistics for 2021-11-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 26  |  9  |  0  | 35  |
  2021.08.x  | 37  |  5  |  0  | 42  |
    master   | 58  | 26  |  0  | 84  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 6 
              host-erlang-22.2 | 4 
libdbi-88b8477d57153b9f736d... | 3 
                 wavemon-0.9.4 | 3 
               capnproto-0.8.0 | 2 
                      gdb-10.2 | 1 
           host-sg3_utils-1.46 | 1 
                   luvi-2.12.0 | 1 
                   mpd-0.22.11 | 1 
                 opencv4-4.5.4 | 1 
               pipewire-0.3.39 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/e4676e6cde60eb02c392af49a88f393545ee83bb |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/ad1bc699a4787d539b3226007e8fd1ac5d83e523 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28 | ORPH
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/59653e3379e7a430a4d6938ab85a5ae628adce7e |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c957fd0010c9d782fe3c5c42d7bfc3f27dd0de6d |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/10cab47ab7a4dce1a19d34d1bf122e8fbbfe9626 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2e462ed6654bf7bc882ef17c5ed37da262b7b29c |     
    arm      |      host-sg3_utils-1.46       | NOK | http://autobuild.buildroot.net/results/927473508778e1b05a7b4f1b983804e9286970af |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/5fe0e8a3b6fd7908dc0eafe2f409459204e727df |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/a0886b1c294a792c3cbb3593fd13409bb863fc7d |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/bac29c804dea72b193ea4de5f723de47cfa4a64e |     
   x86_64    |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/43b899f85d296593319f63e7e152a0217bc28baf |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/3401a3e2c44262131a3b34a3e76db3e3afe7e113 |     
    arm      |         opencv4-4.5.4          | NOK | http://autobuild.buildroot.net/results/60f8846b435dafda0ced412d59ffe15bdff0810d |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/8f812824712a1f4be601303444230f7b891b0c0d |     
  sparc64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/8afab56021ec773ae5339e21ee293f04d6ff67c4 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/e374f7eedee62aa18b3560ed90824bb573883a76 |     
    i586     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/f3c6cb56ded865b5467110ec7508332a5b714d30 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/93f5726f0e9e91a8072806ab7eb84bdde9c5bd05 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fd80a63c8f432ea8a4a8939593a8c2c781f1afdb |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/6115e3cc0cbd7dddb5139826a21e0559f486a5c6 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/939053c3cee2dda9042de3dc04bc23a5b8511763 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/97126b782a1e663d0ef03fe80ad27231257f9fc7 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6339b5359acdb761b65daf83553e7b6c47fd7328 |     
   nios2     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7bb56677e541c9ef2fdb54f430e272393c18026d |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
android-tools-4.2.2+git2013... | 1 
                apparmor-3.0.1 | 1 
        glib-networking-2.66.0 | 1 
                 openal-1.20.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/c1f872ae7fe78f609356424d876ae91b5589b747 |     
  aarch64    |         apparmor-3.0.1         | NOK | http://autobuild.buildroot.net/results/aaa52b5a8ceecebaa44a0afcf3baa2beca12561b |     
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/81a59757226639aef9267bf51ef2977af76141e1 | ORPH
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1f0286e57242be53e567139b2d4d05a248aaf5e5 |     
 powerpc64   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/262457c5ce7e9f4a246ff59d0641caa0457fb1cb |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b692ce4b362fc54822e43050a205681455648ba9 |     
    arc      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/0d45d9263de29996b30c94df0f276203f605da1b |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e1088b5571888ac7f13655c52445b96d49ba56a7 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/3546893c5b09d882aa67aa96a66c64f8997e3626 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

            erlang-jiffy-1.0.6 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/c1c7a6a9c889fc168d415fac60f4c07f9b979f30 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/f9359a1d62315ed9be4bbf3f6eae0db0c437f14f | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/2c98f927a8ba280f7d5115ce85e37d7bdfee3542 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/c1c7ea1383235c0915e8727861c15e9ae165d600 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/734d5f625d6b453648fab7883e81aeb8d5d0051f |     


Gitlab CI results for 2021-11-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...ehs38GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863905  | ORPH 
...inArclehs38GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863906  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863918  | ORPH 
...eabihfMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863932  | ORPH 
...nArmv6eabihfMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863934  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863943  | ORPH 
...rmv7eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863944  | ORPH 
...8xxxUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863948  | ORPH 
...8kcoldfireUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863951  | ORPH 
...azebeGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863952  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863959  | ORPH 
...MicroblazeelMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863962  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863974  | ORPH 
...inMips32r5elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863989  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863992  | ORPH 
...r6elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864003  | ORPH 
...Mips64eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864011  | ORPH 
...inMips64n32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864025  | ORPH 
...4n32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864029  | ORPH 
...nMips64n32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864031  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864033  | ORPH 
...6eln32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864038  | ORPH 
...ips64r6eln32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864039  | ORPH 
...s64r6eln32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864042  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864050  | ORPH 
...440fpGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864060  | ORPH 
...c440fpMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864066  | ORPH 
...Powerpc440fpMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864068  | ORPH 
...40fpUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864069  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864076  | ORPH 
...erpc64e6500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864079  | ORPH 
...4e6500MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864080  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864082  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864083  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864084  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864092  | ORPH 
...erpc64power8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864093  | ORPH 
...owerpce300c3MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864100  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864103  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864123  | ORPH 
...ootlinShsh4GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864124  | ORPH 
...nShsh4MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864126  | ORPH 
...hsh4UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864131  | ORPH 
...otlinShsh4UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864132  | ORPH 
...linShsh4aebGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864135  | ORPH 
...arc64GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864142  | ORPH 
...linSparcv8UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864151  | ORPH 
...rei7UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864161  | ORPH 
...ore2UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864176  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864183  | ORPH 
...otlinX86i686MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864186  | ORPH 
...i686UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864188  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864189  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757864193  | ORPH 
...ToolchainSourceryArmv5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863881  | ORPH 
   TestGdbHostGdbTarget9x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863604  | ORPH 
  TestGdbHostGdbserver11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863606  | ORPH 
       TestGdbHostOnly11x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863608  | ORPH 
...ystemSystemdRwNetworkd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863577  | ORPH 
                TestJffs2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863538  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863679  | ORPH 
           TestLuaLuazlib | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863663  | ORPH 
               TestLuajit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863631  | ORPH 
        TestLuajitLuaSDL2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863657  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863846  | ORPH 
                 TestLuvi | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863688  | ORPH 
        TestPerlClassLoad | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863701  | ORPH 
         TestPerlDBDmysql | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863702  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863709  | ORPH 
          TestPolkitInitd | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863719  | ORPH 
         TestProsodyLua51 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863723  | ORPH 
      TestPythonPy3Gitdb2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863777  | ORPH 
 TestPythonPy3Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863787  | ORPH 
      TestPythonPy3Pytest | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863807  | ORPH 
...thonPy3ServiceIdentity | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863819  | ORPH 
      TestPythonPy3Smmap2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863821  | ORPH 
        TestPythonPy3Treq | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863826  | ORPH 
     TestPythonPy3Twisted | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863827  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863849  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863502  | ORPH 
       TestSysLinuxX86EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863479  | ORPH 
    TestSysLinuxX86_64EFI | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863483  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1757863866  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
