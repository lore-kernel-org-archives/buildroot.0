Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216D9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 08:13:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7138161268
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 08:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7138161268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1907280B20;
	Tue, 16 Nov 2021 08:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmiV9an0G9yt; Tue, 16 Nov 2021 08:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B59F80B26;
	Tue, 16 Nov 2021 08:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18A361BF2F2
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 08:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0753D60698
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 08:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IvMNJpy6lf5 for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 08:13:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57B6B605BE
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 08:13:47 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6CB362000F
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 08:13:44 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Nov 2021 08:13:44 -0000
Message-Id: <20211116081349.0753D60698@smtp3.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-15
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

Autobuild statistics for 2021-11-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 47  | 10  |  1  | 58  |
  2021.08.x  | 44  |  7  |  0  | 51  |
    master   | 84  | 21  |  0  | 105 |
     next    | 11  |  3  |  0  | 14  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 9 
              host-erlang-22.2 | 5 
                log4cxx-0.12.0 | 2 
                    bird-2.0.8 | 1 
                   delve-1.6.1 | 1 
libdbi-88b8477d57153b9f736d... | 1 
                samba4-4.14.10 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/1e1c4537400b6b6018068976d812933b1db9c378 |     
   x86_64    |          delve-1.6.1           | NOK | http://autobuild.buildroot.net/results/7a31db897210a1213d95a86380a38538de97fa38 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/76f5dd8717b124cf5ca77a2dfe690f315be4f269 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/64f5aa7c201f03fbaa4560019b44c538ebeb2207 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/65b26bcff69788af17f344641e081817def2f531 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5684d2f7998be52c3cbf4d510f923ecdf9179a87 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/03fcc35ba73b2403f2a37bf3494d6d29c2c5b687 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/0dbf191f65f2d173359abd4ba4ee2c31e3b46f4d |     
    arc      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6738deea8692bc858810a97f000fa02b721724a6 |     
   x86_64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/cb6c10a335d475b6b8cdf7abe996a6d23fc73c31 |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/870cdb9384d29e57c2a81d4755bbbe370dac34a1 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9cd8fc3fb99e04d4ae2a5517d22fc9b765ea4cb9 |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d33888d3daa84f9cb499f65175890e499a2ee721 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9049c670cb172d37c52729d8e9b6f69cd5f18b0b |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/609f7c97523988a6b9eae0b0002f0ce944680ecb |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/bdb6cb4c37ab2f9eae23e25d559c8de3f663a425 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/0ce7699eb2eed43ea1b03a88b6c20b10a3547ba9 |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a25147233fd984971c7a916c2bd21991db8d4c07 |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/3248236ebb0f3e0605f207f780f090fff270b1c1 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/a69659c7f8c1fa7f8713484cbf2d0466ea6fb1e5 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/791ab5d975d9cb1f1a2b735a7593000ba0548a09 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
azure-iot-sdk-c-LTS_07_2020... | 1 
               host-efl-1.25.1 | 1 
                 libp11-0.4.11 | 1 
               luasyslog-2.2.0 | 1 
               openldap-2.4.59 | 1 
                 python-uvloop | 1 
                  stunnel-5.57 | 1 
                  waffle-1.6.1 | 1 
 xdriver_xf86-video-tdfx-1.5.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    | azure-iot-sdk-c-LTS_07_2020... | NOK | http://autobuild.buildroot.net/results/72de5437492156caeecf842e15bc8e74c60dfe03 |     
   x86_64    |        host-efl-1.25.1         | NOK | http://autobuild.buildroot.net/results/0f869b2c2f5a8114989ea3defef943ad0f6cd567 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ce08696b5a43de8cd8a87159a2db3ca355a131b3 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6a23a5d54aa12dea0db4983a5af49aa133810752 |     
  riscv32    |         libp11-0.4.11          | NOK | http://autobuild.buildroot.net/results/82867194b9dfcea5df2eb8e718a6af223612c095 | ORPH
    arm      |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/e519b8057c39105b2f7a06873d8738a5a722c12d |     
  riscv32    |        openldap-2.4.59         | NOK | http://autobuild.buildroot.net/results/dbe270d50a54ccdde833ffae0c23a16aefdfa30b |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/b2c2039190ee91ac0bd45b537b2006062a93aa16 |     
  riscv32    |          stunnel-5.57          | NOK | http://autobuild.buildroot.net/results/74289ef82f02225a7235d580b6bcbac50feb5cc1 |     
    arm      |          waffle-1.6.1          | NOK | http://autobuild.buildroot.net/results/9e311097df2398411afd232ba0178a25d3e91ac2 |     
  riscv64    | xdriver_xf86-video-tdfx-1.5.0  | NOK | http://autobuild.buildroot.net/results/40d872a5f8bcd66a16457e26e568a4bd2c2eb817 |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                  zeromq-4.3.4 | 2 
              asterisk-16.21.1 | 1 
  gobject-introspection-1.68.0 | 1 
           python-pybind-2.6.1 | 1 
                       unknown | 1 
                  xvisor-0.3.0 | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/b22d865051fee63cab510897a44146487e6b5268 |     
    mips     |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/9ac80aab504a297bfdfb92feece332a2b5855ec4 | ORPH
    sh4      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/e57acdd2b8b61ac17f0f9f6758fe201e49a22635 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/13c512a8b9811a8c25c6fdd7b1435950c3cc0963 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/05a7aa54e6b9bef3ab09e69bba798f3675ab8696 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/e48dab37778bc8e77f8acb71e31b2e9495c1b923 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/1532e42a6089def50eed72f9605359e01ea3e1e1 |     


Classification of failures by reason for next
---------------------------------------------

              host-erlang-22.2 | 1 
                   mpd-0.22.11 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/749a48295164dc3f3ba3b044e5d98d7f6499008e |     
    i586     |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/ff1e260d55c3fad5272778cbb30a97935758c598 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/fb4a8b3fcc657d146146ac6fdba03ccf6caadb45 |     


Gitlab CI results for 2021-11-15
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
       TestPythonPy3Flask | https://gitlab.com/buildroot.org/buildroot/-/jobs/1781902632  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
