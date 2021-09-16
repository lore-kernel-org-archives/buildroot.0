Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68171C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 06:57:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643DC611EE
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 06:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 643DC611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED98F60666;
	Thu, 16 Sep 2021 06:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dac0NAB9mdfk; Thu, 16 Sep 2021 06:57:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E186139D;
	Thu, 16 Sep 2021 06:57:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657731BF5A8
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 06:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB40406CA
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 06:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHxfeONRKkTa for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 06:57:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87DA2406C6
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 06:57:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 94A801BF214
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 06:57:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Sep 2021 06:57:07 -0000
Message-Id: <20210916065712.4FB40406CA@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-15
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

Autobuild statistics for 2021-09-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 50  |  8  |  0  | 58  |
  2021.05.x  | 49  |  4  |  1  | 54  |
  2021.08.x  | 47  |  3  |  0  | 50  |
    master   | 202 | 82  |  1  | 285 |

Classification of failures by reason for master
-----------------------------------------------

              host-libcap-2.52 | 24
                      fio-3.27 | 6 
                 apitrace-10.0 | 5 
                 libfuse-2.9.9 | 5 
               pipewire-0.3.35 | 4 
                  uhd-3.15.0.0 | 4 
                libexif-0.6.23 | 3 
                  zeromq-4.3.4 | 3 
                  botan-2.18.1 | 2 
                 diffutils-3.7 | 2 
            erlang-jiffy-1.0.6 | 2 
                      gdb-10.2 | 2 
              gnuradio-3.8.2.0 | 2 
package/pcre/pcre.mk:33: ho... | 2 
          refpolicy-2.20210203 | 2 
                    atk-2.36.0 | 1 
                    ffmpeg-4.4 | 1 
                       gdb-9.2 | 1 
                   libiio-0.23 | 1 
                 libqmi-1.30.0 | 1 
               linux-pam-1.5.1 | 1 
               luasyslog-2.2.0 | 1 
                       mongodb | 1 
                  mupdf-1.18.0 | 1 
                  ntp-4.2.8p15 | 1 
                 openal-1.21.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
            qt5location-5.15.2 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/ecbba4cf873608771821a6dc91201cd2dd2480c9 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/5a970ce8d9ef0a72bf2c109bdca6ae15dd50ff0b |     
    arm      |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/0a8d2f9aad0997e206ed3b1321e3992f88e856af |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/08a5af4809ede335064268a758416afd583bb819 |     
   s390x     |         apitrace-10.0          | NOK | http://autobuild.buildroot.net/results/08d4912f4f9ee7bfb9aeb0e51b3dd55ad8f5bbb0 |     
  riscv32    |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/bcfb6f3f2450e7c19c8438482be02135c0a4fcf1 | ORPH
   sparc     |          botan-2.18.1          | NOK | http://autobuild.buildroot.net/results/e2af7dab7e478230aaae7f7e1ca838ceccb3d904 | ORPH
    arm      |          botan-2.18.1          | NOK | http://autobuild.buildroot.net/results/0de2fa9593608061f2d57039d3952b7f008e4c17 | ORPH
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/3b882a27225c1779df7af0d5fbcead97349f29fa | ORPH
    arc      |         diffutils-3.7          | NOK | http://autobuild.buildroot.net/results/ca6dbfaa5112abbab3f76700483344d6b20d67c6 | ORPH
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/f05f35ab2d126511151aa36f15d9d926c6a8c879 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/a2aee77a051252b59e1322909cde4ba35d027aa8 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/8dda7d95b0309ae9000bb03284a4ff8712c09b65 |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/595d7235eec8d0bf35ea9b412bc596622a92766a |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/b2391781eddce32ef61861c67e157ee422be7064 |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/b649d924b28156300e74faf3f816e99183666425 |     
microblazeel |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/7956596ad9746e68cf478be18ccae58855233493 |     
    arc      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/6aa732a8de0e1edf8273c749fab163dd53ed50a9 |     
    arm      |            fio-3.27            | NOK | http://autobuild.buildroot.net/results/65f13aed7eebe2954f3a63d0aaaa7118a58e8731 |     
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/c3cafc0a3b4bdccbb460ad8904ad484d3e0eb380 | ORPH
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/e4991ea6206bfd1b304edddbcc9e70035d8d54d5 | ORPH
 powerpc64   |            gdb-9.2             | NOK | http://autobuild.buildroot.net/results/e84e83623072db60f1837a5884f8f03303602d7a | ORPH
  riscv64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/2a3e706b3597018e60722ebfa5afac2e0cd2c7f2 |     
  aarch64    |        gnuradio-3.8.2.0        | NOK | http://autobuild.buildroot.net/results/e737c1d436e11869637cf688159c279a39d0819d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/602dec720cc7521620448905a8923bcb4cc13386 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/ac4a86c7dd2ed4160ae130785de2e85be14c9b6c |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a589d55deee8377489320c410ce5093b38189c5d |     
microblazeel |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c11aab286d9d22506ebf391dec4d42bb747e658f |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/25a6dacae82ef8ed91c974edd19f1bed58c0d5df |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f732fb470803796fbbed31f298e78283d78cc753 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/9d4964b5405afecdb5e7961113a1b4fa2301c442 |     
   s390x     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e202147bf4f84056c15737a008b315709d6bf635 |     
powerpc64le  |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/5ec2ab531f19f917f81a9ea5ceab040560af41a4 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/87a71afe6b5761a605a5b70c595a7fc95e82e249 |     
  aarch64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/822fc28239aaea56977d1093c278371f671fd4fc |     
  sparc64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/01fa0120b9f5326ad2cde30f2544ae74428d24b7 |     
    i586     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/a2afe1a1b95c23b20461a7d866a3577e06aa91b7 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cfceed2302d28fb07e86be71c7520c6fe2668eab |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/02845c3356b967f81f0097e0055f80ecccca7a38 |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/545258df1aa40f946d494a8968e93c50cb409ec5 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e4af9a5118c3ab478a253033059ab1819b977236 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d31444f3c41383b6fdd98c9326f7c2eeeeb64e30 |     
  powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/81644011d81867267043811b701fe0a03e96b24a |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/0ba3997171de05a7f0bd628708b67818609d278d |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/fd9a5a2b19cb35575f0a61be6b96968e302aa62e |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/65eebb955137d027ebbb151e305d2a2a4b4a9dfc |     
    arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/df7d09bc1cf9eaf91cde429efce9c8134f2930fc |     
   xtensa    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2d342d765664f1748735b7c44af57eeb0379763a |     
    arm      |         libexif-0.6.23         | NOK | http://autobuild.buildroot.net/results/533ec3576909c652f10fd483832f8524cae44ec4 | ORPH
    arm      |         libexif-0.6.23         | NOK | http://autobuild.buildroot.net/results/7dd222e06d1e6611449fb8fe7516817c9ad43d65 | ORPH
    arm      |         libexif-0.6.23         | NOK | http://autobuild.buildroot.net/results/1f2aaf471bfbfff5be7de2a2873cc9adefee5b61 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/2ea84af7660acc74cabddebcef3950eb9afffbe5 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/15fd99eed3d6019b7becd7b5c7cb3d5aec04cc78 | ORPH
    arc      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/b39c6aec81278065a242ae0f7f2a397e5db11cb2 | ORPH
   s390x     |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/bafe1c54b345280fe14e6c844f363b175949e91f | ORPH
    arm      |         libfuse-2.9.9          | NOK | http://autobuild.buildroot.net/results/c1779b93dcd8919adb23abe68f0b3749d4ee9edb | ORPH
    arm      |          libiio-0.23           | NOK | http://autobuild.buildroot.net/results/2cca5952e7d677cd0d5fa97aa1a7bf3e722df3a2 |     
  riscv32    |         libqmi-1.30.0          | NOK | http://autobuild.buildroot.net/results/4b19df5a6e4b88c30c436006731864ec9fa0b7a9 |     
  riscv64    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/aa0075d07691e7ff24ee6f20cfc850d93bbe6084 | ORPH
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/67d641ed61a8a3040c945f0d05a1c455510fecc8 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/95a47ff90b0aeec3882248638fac18ff07a2bbc7 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/8f07b52aeb4162c731d5e5ae7f5098153b1ee649 |     
    arc      |          ntp-4.2.8p15          | NOK | http://autobuild.buildroot.net/results/7de024c19ef823c78a92e39531e70937c7f2074c | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/270d309513de404e5b1ebf03f5e95c5671eb9ccd |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/7e05fc954a4269dbed82f254effc5c68ce9fa1e3 |     
    arm      | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/0ee1b4352916f816022da26603fe8c083101bae9 |     
   x86_64    | package/pcre/pcre.mk:33: ho... | NOK | http://autobuild.buildroot.net/results/4075d3a96451ce54b09117025c5a07a44730c527 |     
powerpc64le  |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/edc2249ec86c60f2c7120ef6bb9a942ec64b857c |     
   mipsel    |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/0eddd551771b77db600bc6a5ef968d41d2aec3fb |     
 powerpc64   |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/26f62448a522d6dd8dec784d7833c1d208537400 |     
    arc      |        pipewire-0.3.35         | NOK | http://autobuild.buildroot.net/results/55837dac75639d0f980d1f3671563cc20caf8bf0 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/083d938a707170e521ba5d69f7b5b4e4ff60759f |     
    arm      |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/f220f8d9ee80ceafc6adf447aa5c74848b230f8e |     
   nios2     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0ae6ac2e40aaf57507877e4aa815807259044d2b |     
    arm      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/0e4d9d8a66ff3fb2c943fbb19a0703a6e3d18e13 |     
   xtensa    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2de3138662d4b5adefa08b4867ff599ac2ef5574 |     
    i686     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0a3aeda36f6452da3f5a01b2472d95915bae38b6 |     
   x86_64    |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/14ebb5722635821c2663f9f922e9d06021a0063d |     
  mips64el   |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/0153f028f74c52ad0570218042f843f36c923792 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/db6dce187d1f750d07cd6ebd931cb33feac5e3ab |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c4385ed80367f55d0d68ac76a2a045fe6949f51c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/26cd13515e7c73ceeb8c28a6d66d07a7d582bf4f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/ed1376242525e5f0b1552420d6555573fed58e8b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
        host-sentry-cli-1.57.0 | 2 
             libxmlrpc-1.51.07 | 1 
pistache-f2f5a50fbfb5b8ef6c... | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fbc61539a7f86e8b5570c7f5bf2f3203a1b2e380 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bd94a3e60cb46d51ff1f63e1e978bd5436891281 |     
    arm      |       libxmlrpc-1.51.07        | NOK | http://autobuild.buildroot.net/results/bd95d49bfe2aedb5bc4232a18d5996aaf722fe7f |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/90a7dee9125e69464a47ffb756efcb1870602f1d |     
powerpc64le  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/b8ab116d42c22f1d9d726e35441a346903e2370f |     
   sparc     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c38db001121337aa1b9aa01c27998ea1ea78ce29 |     
  riscv32    | pistache-f2f5a50fbfb5b8ef6c... | NOK | http://autobuild.buildroot.net/results/5a6ef7ec5c931bd328647d0baf34a585c8809d9d | ORPH
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/212d71554c4ad0882ca2f9c5f946cdb7a32a0372 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

android-tools-4.2.2+git2013... | 1 
                    ffmpeg-4.4 | 1 
                libexif-0.6.23 | 1 
                 mesa3d-21.0.3 | 1 
                   python-lxml | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a28fed3c6105a37bf80df0d5fed23da1075473b3 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/950601a79b17183734356cc4f25ece5d788a0888 |     
    arm      |         libexif-0.6.23         | NOK | http://autobuild.buildroot.net/results/c4094aea15ac616e6100d78087d28220c457edd8 | ORPH
    arm      |         mesa3d-21.0.3          | NOK | http://autobuild.buildroot.net/results/a5d4f6b8a3634765510f0ea54df3885866f30e6a |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/27356d89a7986c91c3caa57e06e9e9aeb4ebcb3b |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

               capnproto-0.8.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/1c9ae4b3fcc1eba5c12b32c162e33280c8b96dba |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5a3c6762905a98b0c9d9c966061c43e241347c2b | ORPH
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d246b5467ab4484dd47b3a40cf08c5c3086080ba |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
