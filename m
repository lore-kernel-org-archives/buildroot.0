Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 07:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3D1416C6;
	Fri, 24 Dec 2021 07:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fPK34XmfKQmt; Fri, 24 Dec 2021 07:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89866416C0;
	Fri, 24 Dec 2021 07:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF0241BF3EA
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 07:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA0D840142
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 07:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id In8mB4EJJWXf for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 07:10:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 247EE40140
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 07:10:23 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E8D11C0008
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 07:10:20 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Dec 2021 07:10:20 -0000
Message-Id: <20211224071025.EA0D840142@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-23
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

Autobuild statistics for 2021-12-23
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 61  |  8  |  0  | 69  |
  2021.11.x  | 26  |  7  |  0  | 33  |
    master   | 93  | 31  |  0  | 124 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 4 
                       frr-8.1 | 3 
              host-erlang-22.2 | 3 
                       unknown | 3 
                  assimp-5.1.3 | 2 
                  boost-1.78.0 | 2 
libdbi-88b8477d57153b9f736d... | 2 
                 wavemon-0.9.4 | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
      intel-mediadriver-21.4.2 | 1 
                log4cxx-0.12.0 | 1 
                    mpd-0.23.3 | 1 
package/php-apcu/php-apcu.m... | 1 
            qt5location-5.15.2 | 1 
                suricata-6.0.4 | 1 
xdriver_xf86-video-openchro... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/95ac7098ee62c2137cc09b315dfaa231a65265ed |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/8f699cdab1c273800b6558bf2a2939862ec26bd6 |     
  mips64el   |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/adf393410a83f0b5c7decef0e6cf25eaf1ecd51f |     
    i586     |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/bf240783bd5a9093700e9ad3cc93952e15826dc2 |     
    arm      |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/9afc437791904134e7ed04e4fcede6d894b035d2 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/73498a4e5c74e945ea18e73223e113cfda4ac4d3 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/2bf5b8a72dcfa6066ff251de56bf7933d57e0999 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/1e81a7276873cc22bb7050124b593620907fabf9 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/d418e997b959126f57b66080146810cbca421fce |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0bc033fb6372f4ed190f1d7dad0f15082037a685 |     
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/311f2d695b5fd03f766c2cd0d6256a85c4c67e62 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/27daecf26c55a01a1181634e7617b6c07ac7fd8c |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/eb0a4ec7faef784302a58f3eeb22b68a31af12ba |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/31ce0c788115938a490b5a34efa8d030704cc980 |     
    m68k     |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/6bb0ff1c55c33ffb1083229d36d556fa36fd93e2 |     
   xtensa    |           mpd-0.23.3           | NOK | http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9 |     
  riscv64    | package/php-apcu/php-apcu.m... | NOK | http://autobuild.buildroot.net/results/5aa2b14364c4a84b71f62db6b5ffdf2f38320acd |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/d1f27ef9f83449276950a62d007048446a8ae472 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b29148fccf7e8e151a455cbf8c93d2b5983b9c97 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/b210443f576164c2b4520e908d77c2604d750a7d |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/04d6662b9f2091acf415af7a98ebb01c68eee1cd |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/44fe4f82880b45b14c656a96a5ee9ca879efb722 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/274e532f87446d68eef3b5a68648410b35b785cf |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5e3e268bc8cfafdd1033540c5f42a01cb1d4aac1 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/f60127ae8cd3e9e0cee0eb5264524e59e54b588c |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/ecc2fc8e8ce6209124107511b90d2025ad06b953 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/68604c24dda1c0e97b0c63abe4c4e16c3924f6c6 |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/de7c5bbabfdcabdb83eb2ed5e36b95535ae69a91 |     
    i686     | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/2ef8b8a912f4c8fd248708787f7ba0086087721e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b5c8ce548b381e806bb2684b96e0b406feecaf0d |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dc58c4e0f0748ace16fa9e74f693c1e4591cb8a2 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   uacme-1.4.1 | 2 
               aircrack-ng-1.6 | 1 
               apcupsd-3.14.14 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        aircrack-ng-1.6         | NOK | http://autobuild.buildroot.net/results/b6101a320ba65e2ae1ea085bf7e9d512cfe3e7fb |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/310e8254bdc9a2a8a3cda83c77a9c1631b0ea2b7 |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/604e074f0afe542e746ad0cbb2fca5cdfaa7cb0a | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/65256bffd6c65222bf72c1f0013d5a5eb5e75629 |     
microblazeel | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/517fa9d95a6f56ef3c8b561c4fbfc291a5cb9e82 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c1abe1929a9e6d7982178aa59f3c93921ec398d5 |     
  riscv32    |          uacme-1.4.1           | NOK | http://autobuild.buildroot.net/results/1915fb40f477806e1755535b943c81554dbae2ea |     
  riscv32    |          uacme-1.4.1           | NOK | http://autobuild.buildroot.net/results/ec395c89f78764e319a768ac9e6de00bb17338fe |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 4 
               apcupsd-3.14.14 | 1 
               libtheora-1.1.1 | 1 
                  ndisc6-1.0.5 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/590cf81a811ed57c1254876851e983cdb1834ce0 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/0cfd5453b41be5e6edca4e172908f2caaf1512ac |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5977db91aca60a3a26476b9a6f52c25fb4aecb69 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/ae1f84dbab3eee6b6a64acc04e3969c0b35ff215 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/e1bc7b41c7c4f09b3cafff67b376835889a96ba2 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4088b61c18c2dbae0616d9b55efb0fe550d8f5f2 | ORPH
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/b5cdedfa21c26d083ac80d8ed1ac8247f0077b45 | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
