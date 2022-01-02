Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A0CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  2 Jan 2022 06:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B434180BA5;
	Sun,  2 Jan 2022 06:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OCsPRxuGGNY; Sun,  2 Jan 2022 06:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7F580B85;
	Sun,  2 Jan 2022 06:56:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB34E1BF429
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 06:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5A04028A
 for <buildroot@lists.busybox.net>; Sun,  2 Jan 2022 06:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5n69-GIM2xJv for <buildroot@lists.busybox.net>;
 Sun,  2 Jan 2022 06:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0E0F40056
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 06:56:20 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0D207C0009
 for <buildroot@buildroot.org>; Sun,  2 Jan 2022 06:56:16 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 02 Jan 2022 06:56:16 -0000
Message-Id: <20220102065622.9D5A04028A@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-01
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

Autobuild statistics for 2022-01-01
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 71  |  9  |  0  | 80  |
  2021.11.x  | 30  |  2  |  0  | 32  |
    master   | 95  | 64  |  0  | 159 |

Classification of failures by reason for master
-----------------------------------------------

                python3-3.10.1 | 25
           host-nodejs-14.18.1 | 5 
             libapparmor-3.0.3 | 4 
                 wavemon-0.9.4 | 4 
                  rygel-0.40.2 | 3 
             babeltrace2-2.0.3 | 2 
               fail2ban-0.11.2 | 2 
                 hiawatha-11.1 | 2 
               poppler-21.12.0 | 2 
              alsa-utils-1.2.4 | 1 
                  assimp-5.1.4 | 1 
               belle-sip-4.4.8 | 1 
                  boinc-7.18.1 | 1 
              cryptsetup-2.4.2 | 1 
                       frr-8.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   guile-3.0.7 | 1 
             libexecinfo-1.1-3 | 1 
                log4cxx-0.12.0 | 1 
               pipewire-0.3.40 | 1 
               pulseview-0.4.2 | 1 
               qt5webkit-5.9.1 | 1 
                suricata-6.0.4 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        alsa-utils-1.2.4        | NOK | http://autobuild.buildroot.net/results/08d028004090b2a8292f03910cb9bf80a73ac804 |     
    mips     |          assimp-5.1.4          | NOK | http://autobuild.buildroot.net/results/e6edcf4acde4b053fa6190a45f6d1e00c86bdb27 |     
    or1k     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/c383730b84342532f047a9ea73de19df9d734dbe |     
    or1k     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/bd00ac7f40fe1925800f549029e41d04acc37462 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/945afeae741757641a0463b40598ba95f68d7d24 |     
    arm      |          boinc-7.18.1          | NOK | http://autobuild.buildroot.net/results/c234ba45416ea309ead0a02de7598aa15331617d |     
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/661b658a8c109893f68bf8fd93f67b3bf0ebd608 |     
    arm      |        fail2ban-0.11.2         | NOK | http://autobuild.buildroot.net/results/dbba8135047632311bbcfe3dc1407c2e7a9b4087 |     
  sparc64    |        fail2ban-0.11.2         | NOK | http://autobuild.buildroot.net/results/6a5e91f9912f869b2b07b10b576457b432066393 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/33e8b8c9be1a84a22cdb7fbbc5696de965af4373 |     
   mipsel    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6b7d2ad6b5f3b8d4b882664eaf51d87b55de3009 | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/dc6b337006529b0723d9a18813befc34a1e0f11f | ORPH
    arm      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/b63f85b8849d91f648433f824d2284489c9c15d9 |     
    arc      |         hiawatha-11.1          | NOK | http://autobuild.buildroot.net/results/9f2481ae19461a760d39afa4f99060ed652aa18c |     
    arm      |      host-nodejs-14.18.1       | NOK | http://autobuild.buildroot.net/results/b2379660b5e30c54005d18edeb5e330937841fe7 |     
    arm      |      host-nodejs-14.18.1       | NOK | http://autobuild.buildroot.net/results/a3eadd01dac90d57c26d07d3b276cd813c701168 |     
   xtensa    |      host-nodejs-14.18.1       | NOK | http://autobuild.buildroot.net/results/c1b8b2ca194e34994cd77aa460410b39f97042d3 |     
    arm      |      host-nodejs-14.18.1       | NOK | http://autobuild.buildroot.net/results/d0dec14fff18b483c8947ceefbc5e59ed842104e |     
   xtensa    |      host-nodejs-14.18.1       | NOK | http://autobuild.buildroot.net/results/36262ace4639008d9261cab09fbe6cc2bd6e09fe |     
    arc      |       libapparmor-3.0.3        | NOK | http://autobuild.buildroot.net/results/f3e400cbb5b00fbd7f0cb421c993e46b64ec5ac5 |     
powerpc64le  |       libapparmor-3.0.3        | NOK | http://autobuild.buildroot.net/results/cd757c6b7b1edd938abb13f5d5ad1f60d98b6944 |     
    arc      |       libapparmor-3.0.3        | NOK | http://autobuild.buildroot.net/results/fc30266947a5aecc1e302d88006ffbbab1e9528a |     
  mips64el   |       libapparmor-3.0.3        | NOK | http://autobuild.buildroot.net/results/d26c42f8cc67ea36df43e59bb6f7b3839c57c4e1 |     
    m68k     |       libexecinfo-1.1-3        | NOK | http://autobuild.buildroot.net/results/a5bbdc349d2c1ecf07e9e1980ebe2c8881637bde | ORPH
  riscv32    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/ef4b7d12a1b2b19c64db08170bfb7bc9192ddc2c |     
    or1k     |        pipewire-0.3.40         | NOK | http://autobuild.buildroot.net/results/d1707ad82159aafbddb69c503109bf2e830f0f29 |     
    i586     |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/716fdb10500d59b949e32246538808b2a15cd333 |     
    arm      |        poppler-21.12.0         | NOK | http://autobuild.buildroot.net/results/cca6f072af6c0758e7b75b18753cd53f7bf70f3c |     
powerpc64le  |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/531c17f6b6410739bb3b0c8212af91c1f6e1149b |     
  riscv64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/8299b1458369720bb6ea773d35fc46c6f18c4f44 |     
    arc      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/0df7fd2160f707b8eda50c366d64d17784c32d89 |     
   x86_64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/fbeee34ffad87a0300c856a134d2bfebaf3bd59b |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/18d0ee27688896ffc1b79fbb8aa9b1a8502b81ce |     
powerpc64le  |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/846adda3a7157dc65c95c7b565bc4db9ec1ac2c2 |     
powerpc64le  |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/efa154c01a0165a6ab35db951129a71c1bd3e475 |     
    arc      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/19d1ce37556a290c8cdad0e138ff4a02edbaa04b |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/bed22c4e40d4ecdb34a370f3b56a21835f4c0d26 |     
   mipsel    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/7b67f73a2cf1aead7fc5f582684388675348eea2 |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/1bf4d7d64e0580a324e0e6164a62a6a6997d6640 |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/d2a3960f1f06e97a151a1459f384f5c3e3b8650b |     
  powerpc    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/c60a9531689b5b8c955775f558ef071aebaeeedd |     
   mipsel    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/08aace35c21ff0206628015c2f94a4b38eff58fa |     
    i686     |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/0361de31c3fc3c4fd6a5078d5ac0211f511d5996 |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/ba6fbbd2ae9572795e8d40d4d58fcb5c94fe5d7c |     
  sparc64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/b96dae6b6a30f5a80de14586371cfaa4a8b88168 |     
  riscv64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/9302952721d9c4ec8a858cf4a2e5e81d83b4fb75 |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/2d487a558b414c72e627b3fb876afcd6572cf02d |     
  riscv64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/b9727dc7bea5d4d7d38296fe6eeeac8186562a37 |     
    arc      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/e9df7a5dbcc6168876cf7e5fe5ff4338bde3b955 |     
    arm      |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/ba5c022c5f69d78aae8cc8ef6cb79a188dfb5575 |     
  sparc64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/635f56c2df68b4f9de4d777f2422b0415f66ba92 |     
  powerpc    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/b6ec492972635599b0fb1d87feb1e25a906e83fe |     
   nios2     |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/6966ad896c33c9e10a2b70df76144999d92f6355 |     
   x86_64    |         python3-3.10.1         | NOK | http://autobuild.buildroot.net/results/8ee7b605be1013ac3f1f227b816aa38060ab26a5 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/5c41f09be7d12e455d7a142ea2c0302307d970c5 |     
   xtensa    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/49b83df3604caf1e2fb30641d4a5a3ce9e2ba4be |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3b41bc7edce11190fe360c74040a19f7fe8309d6 |     
    sh4      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/c8db67ec4334f94b0d10fb1b1d543b5d2e803839 |     
   x86_64    |         suricata-6.0.4         | NOK | http://autobuild.buildroot.net/results/425ef4f74765c3cd227eab40f0ec8698a2f4e6be |     
  riscv32    |            unknown             | NOK | http://autobuild.buildroot.net/results/37ef1654c5419714425f6afff829a9848715e8ea |     
    arm      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/9a7545cede50dd12a9c47e67677ea37b15be49f0 |     
  powerpc    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/994bb96cde3c743aaa4dbec058c9019ae613f301 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/970b9c0fe4969c20d8d78962bf5f018182679e80 |     
  riscv32    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f77732d083d4c332afc601703a914faa83e4f756 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 3 
monkey-f54856ce250c4e257354... | 2 
        glib-networking-2.66.0 | 1 
  gobject-introspection-1.64.1 | 1 
                  xvisor-0.3.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |     glib-networking-2.66.0     | NOK | http://autobuild.buildroot.net/results/30ecfd7c9adb3cb236c60bf449ddd04dc78ed483 | ORPH
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/fa9d8e8785ba74292df7fbb528e1e9a6ed788013 | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2c1e274963484b56556888acc008286375a16e8b |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5dafb691e11f9f172ab9adbb5e100a2674ad7d0a |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c0546b3ec690852d2bda4f17a0d89651b6e5ab0e |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/47643be58fae84410eb32ab4042516224d47717f |     
  riscv64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/d142552c3ee9854e613a45c191cbcae084b7dbe7 |     
   x86_64    |          xvisor-0.3.0          | NOK | http://autobuild.buildroot.net/results/6045d74e7fc6d9190e29cb9157ad32929c28efbd |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/211e93a4d648c99c46d3b8e43f7ae2f48e11f3b8 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 openal-1.21.1 | 1 
           python-pybind-2.6.1 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/d278eb4bd6c922a54325188dab7e9c2c8f4ea3cd |     
  riscv64    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/308a4e0ac1482323ee29b30c705c0874c5f429c9 |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
