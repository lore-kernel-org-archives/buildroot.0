Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D779AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 07:04:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEA9611C0
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 07:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CEA9611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07AC3404EC;
	Tue, 28 Sep 2021 07:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIJk_PlMHId5; Tue, 28 Sep 2021 07:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AC98402A2;
	Tue, 28 Sep 2021 07:04:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB87D1BF2E5
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 07:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B704054C
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 07:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6a0_uMatAr2X for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 07:04:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CE2140229
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 07:04:25 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 248DB100009
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 07:04:22 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Sep 2021 07:04:22 -0000
Message-Id: <20210928070427.B5B704054C@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-27
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

Autobuild statistics for 2021-09-27
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 28  |  9  |  0  | 37  |
  2021.05.x  | 27  |  5  |  0  | 32  |
  2021.08.x  | 26  |  4  |  0  | 30  |
    master   | 59  | 48  |  0  | 107 |

Classification of failures by reason for master
-----------------------------------------------

  host-python-inflection-0.5.1 | 10
                 wavemon-0.9.4 | 9 
                  zbar-0.23.90 | 4 
android-tools-4.2.2+git2013... | 2 
                    atk-2.36.0 | 2 
                    ffmpeg-4.4 | 2 
                      iwd-1.18 | 2 
                log4cxx-0.12.0 | 2 
                       unknown | 2 
                 dc3dd-7.2.641 | 1 
                      gdb-10.2 | 1 
                     gdbm-1.21 | 1 
                host-odb-2.4.0 | 1 
               libtheora-1.1.1 | 1 
               luasyslog-2.2.0 | 1 
                  mupdf-1.18.0 | 1 
  python-beautifulsoup4-4.10.0 | 1 
       python-inflection-0.5.1 | 1 
             python-pip-21.2.4 | 1 
            python-ujson-4.1.0 | 1 
               qt5webkit-5.9.1 | 1 
               usbredir-0.11.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/0aadbf4a123a7ab4a031b2e61b80ee40a9fe527e |     
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3bb62fd0f21c9442e7051d6356baa8d257d84358 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/8de2bf1df6f7bba293d87c8dd28500bc7dbaa2a7 | ORPH
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/e12992e846fdf4b57aadbe109cf5517d1623b7c4 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/9e2a8f0548ecb5ce9539eda007cd886ddea7dc0a | ORPH
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/5e00bebcf127ee8498bbc86aa6d9efffe991cada |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/d910923a7ece7efafcf8bbe9a34ec001ee5e6aa1 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/052e0ca4e518c2da3005ca2b0087bf7885d1d8f3 | ORPH
    arm      |           gdbm-1.21            | NOK | http://autobuild.buildroot.net/results/effc22ac47350bdbc19074dd724eab16f53913b8 | ORPH
    arm      |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/c08ac7cba2c8f17b12b63497e2cc36a4fbc93ff2 | ORPH
  powerpc    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/3ad362e6694a722e15bd59f9baf1b17f27523925 |     
microblazeel |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/decb53a2fee0052094cd025ff6818b33562dc2ee |     
    m68k     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/c787d17ab1ab532503852c962add1bc1f36f9e13 |     
    arm      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/c246dbb04477c783bee4f11602f9107d1af21c4f |     
    i686     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/802e521bb72e5589efd10cbb3a7be1088636cca8 |     
  powerpc    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/6d6e937135ef95c63001359fec5f8c28183fc0a9 |     
   nios2     |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/8f958abb6a156163b6acff185194363f57b07bd7 |     
    sh4      |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/ab65f357849c9c0b8d62515e480c08eece6ef2fc |     
  powerpc    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/401151ac1eff7d6697eced1747e4ffb89ab77e55 |     
   mipsel    |  host-python-inflection-0.5.1  | NOK | http://autobuild.buildroot.net/results/9f6f2ff45565070c80f4c97bcd28723a36109edf |     
    arm      |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/6189dba7101b606da38d88074ef7b45aaac21945 |     
    arm      |            iwd-1.18            | NOK | http://autobuild.buildroot.net/results/2c4e6cf22e6fb5582470930241904878070f1144 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bc4fecd8ea57afdaa18054147941a496723f37b8 | ORPH
    mips     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/0b2ae52325ec0cfd548b2e1afac840dc3b825266 |     
  powerpc    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6b92d995963831da3707414862f8e1cb96951f8a |     
    i586     |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/1934167c0539f6356b0040a9f94570b7baa3ecc7 |     
   xtensa    |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/bee9e17490606b6f9b1ca67de094ae7e162b3a96 |     
   x86_64    |  python-beautifulsoup4-4.10.0  | NOK | http://autobuild.buildroot.net/results/57e6677932f587c279cc0ed671895740d0cf2304 |     
 powerpc64   |    python-inflection-0.5.1     | NOK | http://autobuild.buildroot.net/results/5e7f6a2efb364d9146e75c8addf17d4a1d07ac87 |     
    i586     |       python-pip-21.2.4        | NOK | http://autobuild.buildroot.net/results/c6f43661845295e760a9637844d45fb2b9366b03 |     
    i586     |       python-ujson-4.1.0       | NOK | http://autobuild.buildroot.net/results/0737c4db63efe2205cb01984af72c270447fe085 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/9af372da0c1de290a401a35dfd5d8cecb20fbe16 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/17a6571ad183fcc9b055e473e755961980f79363 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/231ee438cba571ab62a66264594fe21aa46e6a03 |     
  powerpc    |        usbredir-0.11.0         | NOK | http://autobuild.buildroot.net/results/05dacdf1b31c1d43da211e9452d32a22889090a1 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/c9fa78fe6c1dde659b86e218c6b53e4742a87066 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/7dafed6bb167b39bc9b2cc6a890c3c64b586330e |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/567053f3cf0637564badd64c9d63594c648d3782 |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/89a58345daf8c4574c4cd8871fd691b389b2de6b |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/91ecc39fad6b4eafc8b570377cbfdf120f6dcb91 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/1c1197f19c6a3860028cd203d5a92ec27afbc43b |     
    i686     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0d1005c7f94d81bcf592addcde497e416673005c |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/693a0b18372d5d7caa30942b86a08ef94c840ac4 |     
   sparc     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/dee39598c013b682f167b68c3c310069eff1b4ee |     
  aarch64    |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/53630c6e4b3b4f20242c74cc0462ce37a5e248e3 |     
    arm      |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/6020d950e80d7da8775120b97cc95ecdc1ba054f |     
  mips64el   |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/c75bd84bd783ac1bbba1121ddce616bf89d78450 |     
  aarch64    |          zbar-0.23.90          | NOK | http://autobuild.buildroot.net/results/664fc163be6c30757b1aad0caab3c4b7e68a119f |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 2 
monkey-f54856ce250c4e257354... | 2 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/c06717c91ede84e12af7697ed5ad41e04caf4ea7 |     
   x86_64    |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/ba5d09d8b005488afdfd0aafc27dff0ae76db6e6 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/34ba40f0dca623f92c99dd2f83adb4d937f4e6d1 | ORPH
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0a66e64bac8a4838561b0daa5a8d36da2bffe82a |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/54fb8aa31a0757fa79cc370481f42ab650f1245c |     
    arm      | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c863bfc2da486e14db6ec214d367caa3bb0bd29e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/cdb7450c46d7ecc6530578a913e129097c1b139a |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f6d8fc4d19905bfdc275938df662c2bffe843679 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f884ea9a932fdbd25ae12f5871aff4db8f6ea611 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                haproxy-2.2.17 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
               luasyslog-2.2.0 | 1 
   openvmtools-10.3.5-10430147 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4      |         haproxy-2.2.17         | NOK | http://autobuild.buildroot.net/results/c4880907d307eb70b346c6e70c77337a2121359f |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d2c5094e5b2b70fd9a63adbc594e9cdda90b0da |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/563edaa75da84b34beafa8329791c7c467b7bce0 | ORPH
  mips64el   |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/58e12d9411be9a5da6984b729065ecce0b62370a |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/511f063d075d0e5597f9eb64b9758e9c7a157dba |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

              libxcrypt-4.4.25 | 1 
   openvmtools-10.3.5-10430147 | 1 
           python-pybind-2.6.1 | 1 
                  waffle-1.6.1 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        libxcrypt-4.4.25        | NOK | http://autobuild.buildroot.net/results/812f2e0d417ec838eeef976f44f06d02b1c50e4c |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/a1fcac6f961e8dd030d8ca051cf69322737ef809 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/83997870d426f751b075028c80994029dbce11e4 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/4e15784538f6368fb4ebe7dbfbeca71a76a8ac6a |     


Gitlab CI results for 2021-09-27
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestCheckPackage | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266058  |      
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265053  | ORPH 
                 TestExt2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265107  | ORPH 
               TestExt2r1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265109  | ORPH 
...tlinAarch64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265552  | ORPH 
...arch64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265554  | ORPH 
...otlinAarch64MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265556  | ORPH 
...v5eabiMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265602  | ORPH 
...linArmv5eabiMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265604  | ORPH 
...eabiUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265608  | ORPH 
...abihfGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265616  | ORPH 
...Armv6eabihfGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265620  | ORPH 
...rmv6eabihfUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265636  | ORPH 
...bihfUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265648  | ORPH 
...mv7mUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265653  | ORPH 
...zebeUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265671  | ORPH 
...croblazebeUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265672  | ORPH 
...azeelGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265674  | ORPH 
...croblazeelUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265683  | ORPH 
...ips32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265684  | ORPH 
...Mips32MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265689  | ORPH 
...ootlinMips32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265692  | ORPH 
...ps32UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265694  | ORPH 
...tlinMips32UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265697  | ORPH 
...s32elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265699  | ORPH 
...ps32elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265702  | ORPH 
...tlinMips32elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265704  | ORPH 
...2r5elGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265712  | ORPH 
...nMips32r5elGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265716  | ORPH 
...r5elUclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265728  | ORPH 
...32r6elMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265740  | ORPH 
...inMips32r6elMuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265745  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265759  | ORPH 
...linMips64n32MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265779  | ORPH 
...eln32GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265786  | ORPH 
...ps64r6eln32GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265794  | ORPH 
...enriscMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265819  | ORPH 
...inOpenriscUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265827  | ORPH 
...owerpc440fpGlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265833  | ORPH 
...werpc440fpUclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265859  | ORPH 
...erpc64e5500GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265864  | ORPH 
...e6500GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265868  | ORPH 
...c64lepower8GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265894  | ORPH 
...pc64lepower8MuslStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265897  | ORPH 
...ower8GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265899  | ORPH 
...power8MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265904  | ORPH 
...300c3GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265910  | ORPH 
...werpce300c3GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265917  | ORPH 
...erpce300c3UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265931  | ORPH 
...500mcGlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265933  | ORPH 
...e500mcMuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265954  | ORPH 
...iscv64MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265969  | ORPH 
...Shsh4GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265970  | ORPH 
...tlinSparc64GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265997  | ORPH 
...orei7GlibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266008  | ORPH 
...X8664corei7GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266012  | ORPH 
...corei7MuslBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266013  | ORPH 
...8664corei7UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266020  | ORPH 
...linX86core2GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266026  | ORPH 
...inX86core2UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266036  | ORPH 
...tlinX86i686GlibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266042  | ORPH 
...linX86i686UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266052  | ORPH 
...lx60UclibcBleedingEdge | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266055  | ORPH 
...Xtensalx60UclibcStable | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624266057  | ORPH 
...olchainBuildrootuClibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265525  | ORPH 
...xternalToolchainCCache | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265529  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265094  | ORPH 
           TestGst1Python | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265207  | ORPH 
...InitSystemBusyboxRwNet | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265161  | ORPH 
 TestIso9660Grub2External | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265118  | ORPH 
...so9660SyslinuxExternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265127  | ORPH 
...so9660SyslinuxInternal | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265133  | ORPH 
          TestLuaLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265223  | ORPH 
             TestLuaLuaGD | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265248  | ORPH 
          TestLuaLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265293  | ORPH 
           TestLuaLuacURL | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265244  | ORPH 
             TestLuaRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265465  | ORPH 
       TestLuajitLsqlite3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265225  | ORPH 
       TestLuajitLuaPosix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265298  | ORPH 
        TestLuajitLuaossl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265292  | ORPH 
          TestLuajitLunix | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265254  | ORPH 
          TestLuajitRings | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265471  | ORPH 
       TestLuajitTurbolua | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265509  | ORPH 
                 TestPerl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265319  | ORPH 
       TestPerllibwwwperl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265335  | ORPH 
              TestPython3 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265358  | ORPH 
        TestPythonPy2Argh | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265360  | ORPH 
       TestPythonPy2Attrs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265362  | ORPH 
     TestPythonPy2Automat | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265367  | ORPH 
         TestPythonPy2Can | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265374  | ORPH 
 TestPythonPy2Incremental | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265414  | ORPH 
      TestPythonPy2Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265425  | ORPH 
    TestPythonPy3DBusNext | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265400  | ORPH 
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265404  | ORPH 
...honPy3FlaskExpectsJson | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265407  | ORPH 
         TestPythonPy3Git | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265408  | ORPH 
    TestPythonPy3Libftdi1 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265217  | ORPH 
      TestPythonPy3Pynacl | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265426  | ORPH 
...PythonPy3PytestAsyncio | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265430  | ORPH 
         TestRelroPartial | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265070  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265474  | ORPH 
      TestS6PortableUtils | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265486  | ORPH 
     TestSELinuxCustomGit | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265081  | ORPH 
...ELinuxExtraModulesDirs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265087  | ORPH 
   TestSELinuxSystemdExt4 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265181  | ORPH 
...SELinuxSystemdSquashfs | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265182  | ORPH 
                 TestSudo | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265501  | ORPH 
             TestSyslogNg | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265503  | ORPH 
                 TestTmux | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265506  | ORPH 
TestUbootOpensslPkgConfig | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265512  | ORPH 
             TestZfsGlibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265517  | ORPH 
            TestZfsUclibc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1624265520  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
