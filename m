Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C6BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 06:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54A358135B;
	Wed, 29 Dec 2021 06:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SkjiMvz-dZ5e; Wed, 29 Dec 2021 06:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FBD81361;
	Wed, 29 Dec 2021 06:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1ABC01BF4E2
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 06:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 036164024A
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 06:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xlwjUp4Esqq for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 06:58:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5233540231
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 06:58:09 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7B34520007
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 06:58:06 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Dec 2021 06:58:06 -0000
Message-Id: <20211229065811.036164024A@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-28
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

Autobuild statistics for 2021-12-28
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 71  |  7  |  0  | 78  |
  2021.11.x  | 34  |  6  |  0  | 40  |
    master   | 108 | 64  |  0  | 172 |

Classification of failures by reason for master
-----------------------------------------------

                pangomm-2.40.1 | 13
                       frr-8.1 | 8 
                  atkmm-2.24.2 | 5 
               poppler-21.12.0 | 5 
                  rygel-0.40.2 | 4 
              host-erlang-22.2 | 3 
libdbi-88b8477d57153b9f736d... | 3 
                libxmlpp-3.2.0 | 3 
                 zchunk-1.1.16 | 3 
                  assimp-5.1.3 | 2 
                 libsigc-3.0.7 | 2 
                 openal-1.21.1 | 2 
                 wavemon-0.9.4 | 2 
          gstreamer1-mm-1.10.0 | 1 
                 hiawatha-11.1 | 1 
           host-harfbuzz-3.2.0 | 1 
                  ndisc6-1.0.5 | 1 
                nodejs-14.18.1 | 1 
                 python3-3.9.9 | 1 
                rng-tools-6.14 | 1 
                       unknown | 1 
                    vlc-3.0.16 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/942de209d7654227d574ef3d6505fd14f70b0d22 |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/577e6743dc4573b2094d4e033486684e0b1aaf19 |     
microblazeel |          atkmm-2.24.2          | NOK | http://autobuild.buildroot.net/results/2641063c47f4b85de71b808fc257ec8ba46fa51e |     
    arc      |          atkmm-2.24.2          | NOK | http://autobuild.buildroot.net/results/8a9b3e1b07fece48f0cbd2beffb85f35f0f95080 |     
   x86_64    |          atkmm-2.24.2          | NOK | http://autobuild.buildroot.net/results/839e79ce1bbca0579d28a7cb701592c069afb5a3 |     
  aarch64    |          atkmm-2.24.2          | NOK | http://autobuild.buildroot.net/results/77513447e175c6ca56ce7527034ca17d1517f6f0 |     
  riscv64    |          atkmm-2.24.2          | NOK | http://autobuild.buildroot.net/results/0c4932738aa509f582074f399dfbe1c70ac74070 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9d7318a8b6b494424d58a4826fe70e1c15cfbd36 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7b586f259542eb4d6b4f75e2aa0e828584d76c5b |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/448289af4a52f92663b58102b3a6a2f3cabd57a4 |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/7ca1624e87c118055d05ff83394b80a106a4ca4d |     
  nds32le    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/0d4ac61d6bd963341be055a05a35dcd666ebb587 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/8216300583f5f24cfa41f3ca4b37ae338170fd40 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/00c6d87a18bd71b145f3b6c33d1ea7ab15d70a33 |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/e6e6cd4c778c73fcfe918dac5c73fae8bbd7c828 |     
   mipsel    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/d7fb5ee4fe3aabfcc20420d1ea6f37475d2fd991 | ORPH
    m68k     |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/064af90aa95c28781d96d7eca0f14841fce0687a |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/84e3ffaaa102051c88111a76bfbec46c38bf5947 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4002d3bd7d78688c208900fa21b78d9acc6e1aa7 |     
    i686     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9e1dac629173ee445d76738a4ee131d04c624ae9 |     
  mips64el   |      host-harfbuzz-3.2.0       | NOK | http://autobuild.buildroot.net/results/12b960343cdef5c913256eecf9cfc10045e509ab |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/15adac8423e7869ff2fd6e116b0e95d482d051ca |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/a45396bfeeaac91554f5425893cf6655bf567e5b |     
    arc      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/1580cea6c5242cc05ace73bb50d54d63ed561041 |     
  mips64el   |         libsigc-3.0.7          | NOK | http://autobuild.buildroot.net/results/08aafcb367583da8b6458a12dea0aa6425a124a2 | ORPH
    mips     |         libsigc-3.0.7          | NOK | http://autobuild.buildroot.net/results/6753fc9dce030a7d8be9afd202a5e27bc09a0041 | ORPH
    sh4      |         libxmlpp-3.2.0         | NOK | http://autobuild.buildroot.net/results/e59925e6e4727f93855b0bb5f56d5b0a77863663 | ORPH
   x86_64    |         libxmlpp-3.2.0         | NOK | http://autobuild.buildroot.net/results/ab3c3ace6d9409a70a4a8c1e27dfa9b915be10fd | ORPH
  mips64el   |         libxmlpp-3.2.0         | NOK | http://autobuild.buildroot.net/results/fd767e16cf4a5bf64fb8e0fc972071d3349eaa09 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/f6373b91003e8af01c37e7651ed304d73dadc2dd | ORPH
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/3c045b472717320aad74dc690309bcad8a3b98c5 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/ac6f185f19959d857c7555fe25deb911ed9868a2 |     
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/e54073859c641c040248b3ef16cc02771e51a0f8 |     
    i586     |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/bb96d3a27eca9ebc9fb7058dceac85d76529aecf |     
   x86_64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/5196ea311ab1197caaf17994f516f099e53c1aa4 |     
  powerpc    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/ccd611e5dbb2a2adab8c5013c3549abc451d7051 |     
    i586     |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/bff87ccee8a4cc6acc327af5d332ee558e2ef9d9 |     
    arm      |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/b95911518b1711c93a5d1335889dd105eecb465d |     
  aarch64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/efe5015ddb4bede6669ad5b1e4f027a2e076d16b |     
  riscv64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/2a41491f165325d2db28b094da19af28af1d5ede |     
    arm      |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/18903f5e11d01eb74fb744d664ee9119031e5b86 |     
  riscv64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/d8aba81d9a6557df8c2227323bf3e1c1feacf438 |     
    arm      |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/8203e2503c6e1c5a394baefc1dbfca5d0e7a15e3 |     
    arm      |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/d7c2db8728c5420006a6d7986b6b2c337fd5b140 |     
  riscv64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/f153140c87da7fecd4ec66b68fd865e3268c0ae1 |     
  aarch64    |         pangomm-2.40.1         | NOK | http://autobuild.buildroot.net/results/feb21a438446a45db6a6c234893359f7d6400634 |     
  riscv32    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/cbeaaa7d92313c8682a2aad96b316f701ebd4422 |     
   mipsel    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/7df58a551d22d565637ec0e3a1b872e60d5aad2f |     
   xtensa    |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/3c7e7aa13cf43e3315d8af33ea332b96478bf9fb |     
   nios2     |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/747c0e8954bedc69c369c7808263021f8facb33f |     
   nios2     |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/a47696b66d79008df9d8f5e839e062674cbdb711 |     
  riscv32    |         python3-3.9.9          | NOK | http://autobuild.buildroot.net/results/26200967709f8c5d458d0e43f7d09691b76a54c7 |     
    i586     |         rng-tools-6.14         | NOK | http://autobuild.buildroot.net/results/3ec7df86856aa9bee2f18a8faa44fd58bc8a6657 |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/af8ef053bf218a9e921155689d5f426b44630510 |     
   x86_64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/324d971312006caee485ea5b8c2a969d94ef30ee |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/92feeb94334bb88d1d9798a6607d4f4bc2c7dfe7 |     
    i586     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/9733249390f4e1d094937140e0d14dd882346d25 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/3c7bd405c7b6d18fc1a019e2a401d08ffe285ac2 |     
    arc      |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/3c9893dd92d784a0520a287c4d4a5e760393c95f |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0f04be05a5a12252f1bdd103d3747cbd71802c63 |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/6886ac444b759d513f9fbd51f0ae4817ce300047 |     
    arc      |         zchunk-1.1.16          | NOK | http://autobuild.buildroot.net/results/2147e35796abee26aa7bbab3eeee4fc320885e17 |     
   x86_64    |         zchunk-1.1.16          | NOK | http://autobuild.buildroot.net/results/f82d06e95ac497aa8215268a7a58e929a05b32e3 |     
    arm      |         zchunk-1.1.16          | NOK | http://autobuild.buildroot.net/results/d51f54bf6fbdc355844fd60f372b43b96fc2a386 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

              asterisk-16.21.1 | 1 
                  gensio-2.2.3 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                netdata-1.21.1 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/8565063c3e2b4e7e015c029038a5b7007371ead8 |     
  riscv32    |          gensio-2.2.3          | NOK | http://autobuild.buildroot.net/results/4861be8d48a047849b376f7baf215c784a76e0ee |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9e27d67b910e10b975606f5a51abf86812bbbe7c |     
    mips     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/e7fb39494ad3f3a7f5d87b99ef1cc03ecd81339b |     
  riscv32    |         netdata-1.21.1         | NOK | http://autobuild.buildroot.net/results/67fc86c79eea7d6b222b289cbd8d65a4cacecd22 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8ba5717dc35166652d0304b7b7808698c63dc6ad |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/e833ca3ebc783408b8b2d8267ccc643346f86917 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 3 
               capnproto-0.8.0 | 1 
                libmbim-1.26.0 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3d8533cec54d88837150b8d75104708408ce8474 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/a1fa0b99c4adf335f90de2f16958f4252c30e2f7 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3be16fbbf1d6dca5937ae88ef8de2b892c382aa7 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3a64eecb943d3c1cbeec2a3cba674d39699932dd |     
    arc      |         libmbim-1.26.0         | NOK | http://autobuild.buildroot.net/results/afa72ef07eee07abb6c5eced693124888e7dbe1c |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/da10dc32a20f0303308b5a105dac6b1e772f7e74 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
