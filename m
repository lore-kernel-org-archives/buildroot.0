Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C98C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 08:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCBD608DD;
	Thu, 25 Nov 2021 08:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9YwpEbLWxMO; Thu, 25 Nov 2021 08:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C873F60655;
	Thu, 25 Nov 2021 08:01:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 704AD1BF36C
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 08:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E94E4019B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 08:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dyXSIww7gWfN for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 08:01:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EF8640018
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 08:01:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 32EB8100027
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 08:01:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Nov 2021 08:01:06 -0000
Message-Id: <20211125080112.5E94E4019B@smtp2.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-24
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

Autobuild statistics for 2021-11-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 58  |  5  |  2  | 65  |
  2021.08.x  | 62  |  5  |  0  | 67  |
    master   | 82  | 15  |  0  | 97  |
     next    | 14  | 12  |  0  | 26  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 4 
                 wavemon-0.9.4 | 4 
                flannel-0.14.0 | 1 
              host-erlang-22.2 | 1 
                     mtd-2.1.3 | 1 
                nodejs-14.18.1 | 1 
               pipewire-0.3.39 | 1 
           python-pybind-2.6.1 | 1 
                samba4-4.14.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         flannel-0.14.0         | NOK | http://autobuild.buildroot.net/results/459b16f61fe01772cda61b3d721f04f52f401fe2 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/850ac085f86633ab552a8b5803a0ef4be7a4c29c |     
  mips64el   |           mtd-2.1.3            | NOK | http://autobuild.buildroot.net/results/59f196dff7418a45b1c15209c3afacdb4641d884 |     
   mipsel    |         nodejs-14.18.1         | NOK | http://autobuild.buildroot.net/results/69b29efe62cfd229d64881ae4e0eefac0200f69b |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/faa5c9f01c3a6638e703b15bef2a258127b1db90 |     
   xtensa    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/b74e4676daf51c7aa80116040a74bb8608d148b4 |     
    arc      |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/688cd02783f011fd22333bfcf4dc4623121438d7 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7766755833ea8299ac79a572781486d2acef581d |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/c61a3ddab05740e80ee7d5f8db78141fe49ba35f |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b327fb2a0ab6ca9dcd138b987efb1fa067ba0d4f |     
    mips     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/053450d7569213335d188c6a33d549aafe94c334 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/bc003494d26afbade7a46f5f220c7268d3a7c722 |     
    arc      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/0b2e50f9dcbb89a07161783d4f4500294558b9cd |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/3795361a8a26c129b935c3f6129cdb08f48bb237 |     
   xtensa    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/f4f2786517397c9c1d1c1333f9af5e11d73ade19 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                       mongodb | 2 
              asterisk-16.21.1 | 1 
                 x11vnc-0.9.16 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.21.1        | NOK | http://autobuild.buildroot.net/results/ca40b36873720754b53f25d412462419e65b0722 |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c5f790cb86898407546dc709687386b8bca5438a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7cd2935293913185d4cab3750e9d1db91e0455d0 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/d27448b068027d290b1abdc73c24c08529b82e87 |     
   x86_64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/bac7e4087c00257692b40dc170f4d414a9a1fca0 |     
  riscv32    |         x11vnc-0.9.16          | NOK | http://autobuild.buildroot.net/results/885c6329ca55050c91e293cf92aeb21c82d5c988 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/311cb0362667d721bbfb647711b89d3bfa61ccea |     


Classification of failures by reason for 2021.08.x
--------------------------------------------------

                      gdb-10.2 | 1 
                  ndisc6-1.0.4 | 1 
           python-pybind-2.6.1 | 1 
                suricata-6.0.3 | 1 
                       unknown | 1 


Detail of failures for 2021.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |            gdb-10.2            | NOK | http://autobuild.buildroot.net/results/feefd19f7d733aed80a556a41dc44f452c62764a | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/4c9cedff019e62715e05661ce604b1c4ee7fbbc3 | ORPH
   nios2     |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/f0ac71441a6ee7332baf0ef6f7d762014dfb89f8 |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/05f352735399ae7cac28284161e9afd6c9375e72 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/1a2749ac324a3d6c7ef904b3b73c4d80d41113d6 |     


Classification of failures by reason for next
---------------------------------------------

              tinydtls-0.9-rc1 | 4 
                   luvi-2.12.0 | 2 
                   mpd-0.22.11 | 2 
              host-erlang-22.2 | 1 
          libmodsecurity-3.0.5 | 1 
                  nginx-1.20.1 | 1 
rpi-userland-bab9bf8790cd69... | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/904f32f3953b2f5921cbedace060c899f154c3cf |     
    m68k     |      libmodsecurity-3.0.5      | NOK | http://autobuild.buildroot.net/results/96b3b36a8d8ad1d9bc2a0e4870738a58e0695ed8 |     
    arm      |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/1a6c893c966cb1621e99857404946eb5dee423d2 |     
    i586     |          luvi-2.12.0           | NOK | http://autobuild.buildroot.net/results/0e2274fbdf9d2a6569937a4e4ed24519b7f736f7 |     
    arc      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/9d510dfa8beb71bb98b02535e6ec7a914edc0f52 |     
    arm      |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/bfca4acf950f1e47da22e06448e0ce9cb9084e94 |     
  riscv32    |          nginx-1.20.1          | NOK | http://autobuild.buildroot.net/results/90b6f7e79f4802a71f58412a9e145ebf80088341 |     
    arm      | rpi-userland-bab9bf8790cd69... | NOK | http://autobuild.buildroot.net/results/be4ddbc77694a3e17718b010ef6773a4b525de8e |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/eed9ecc66de1ad266c05f5f89fa1601f3cf3dcfe |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fdf40168e59700108b96d37f006cf145becd28cd |     
   nios2     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/89889c8e3c1bd387d338fe3129344fab3d64db7d |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/89e97c301151728ac49a369621a7c5a9988571ec |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
