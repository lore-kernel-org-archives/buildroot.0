Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46F0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 06:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7068271A;
	Tue, 21 Dec 2021 06:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juTW0q92Iy7s; Tue, 21 Dec 2021 06:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E5BA8270B;
	Tue, 21 Dec 2021 06:56:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD2D1BF2C9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 06:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 391CA826FF
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 06:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYDXDcgkphz4 for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 06:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0A15826C2
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 06:55:58 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B6DB240007
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 06:55:55 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Dec 2021 06:55:55 -0000
Message-Id: <20211221065600.391CA826FF@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-12-20
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

Autobuild statistics for 2021-12-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 71  |  4  |  0  | 75  |
  2021.11.x  | 20  |  5  |  0  | 25  |
    master   | 125 | 36  |  0  | 161 |

Classification of failures by reason for master
-----------------------------------------------

              host-erlang-22.2 | 9 
                       frr-8.1 | 6 
      intel-mediadriver-21.4.2 | 4 
                  boost-1.78.0 | 3 
                  assimp-5.1.3 | 2 
   jitterentropy-library-3.3.1 | 2 
                       unknown | 2 
       gst1-rtsp-server-1.18.5 | 1 
libdbi-88b8477d57153b9f736d... | 1 
            libnetconf2-2.0.24 | 1 
                  ndisc6-1.0.5 | 1 
                 openal-1.21.1 | 1 
                opencv3-3.4.15 | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/8e5e4dbcac81e1ebf3090bab971f468887dfb152 |     
    arm      |          assimp-5.1.3          | NOK | http://autobuild.buildroot.net/results/8877cc60942b008e615bc23e373a615f3f9481d0 |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/ca22263cef24b0240f7e5c374c0aeebb01ecc63e |     
  riscv64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/176dd7bd9353b4d904a37a8424455bc2ca756782 |     
   x86_64    |          boost-1.78.0          | NOK | http://autobuild.buildroot.net/results/cff4e3ac1ad242d1800111a2ae6aee05f7af264d |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/258f4d3787c9f505872ba5b882984610621ab187 |     
microblazeel |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/9bc95e004e5dcbadea8dc81288525634dc83924d |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/79370ad33e7e4affc563f60f82a29060bab62e9c |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/4291addf7c77eab8e2cdea93f9e7afdf7c11ab96 |     
   nios2     |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/04f80c910944746b6f3e5dbd4856750bc527a07d |     
  mips64el   |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/6f44eb6c8eaa176f60b50f660f3fd7cf84f3d543 |     
  riscv32    |    gst1-rtsp-server-1.18.5     | NOK | http://autobuild.buildroot.net/results/04af6b22cfa0cffb6a3109a3b32b27137ad2e0b0 | ORPH
  aarch64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c1ff4101ebd34398daf265c652230ae79d8a2436 |     
  riscv64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/27946cb9ebb16b0bf7b8121aa64963886f1aba89 |     
  sparc64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8450c930eb89cbd6798f7e3a11579d72bad2afb9 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/8013cc2fff003bc812f7df385562c5d5c8972bef |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/733ae6129ab04cf5340bc55fbe9332b63ed13c2b |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b7cc3d2c8b5c9f1c43436ae702cecd7fceb51ccc |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/2cf41c4cbb0f85b674aeac3b33186d0138f72943 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4b65ef8ff5e1541d2a8341ab43c5be4bc90729ee |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/f7d5d817dd82ea56ef73ae609743c2f29a046daa |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/62836e86d4389fdf681726da917e3b35ec1124e7 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/8d32b4bd8c19316ffbff230b58f6f84368a69d82 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/9a8fc44037973ea1ec3dccabcf9407da63a7fd93 |     
   x86_64    |    intel-mediadriver-21.4.2    | NOK | http://autobuild.buildroot.net/results/0125a25492276810a282c54f32f8dab50df368be |     
  powerpc    |  jitterentropy-library-3.3.1   | NOK | http://autobuild.buildroot.net/results/4f6316a36e18fa263899518fab932651b73b07cb |     
  powerpc    |  jitterentropy-library-3.3.1   | NOK | http://autobuild.buildroot.net/results/bf4d8478a8769fc7b29873dafb18b3ce22fbdade |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/ca6e468f85c807ed5340d75f143a739ca65a3913 |     
    arm      |       libnetconf2-2.0.24       | NOK | http://autobuild.buildroot.net/results/fe793ae69d952a7a07d6d07e179925b67469dff4 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/dce1b2307b4f2bb282f2d6250bcfe800d8dd07a7 | ORPH
    or1k     |         openal-1.21.1          | NOK | http://autobuild.buildroot.net/results/4601a1065739342158ec2fbc66c281aa8813496f |     
    i586     |         opencv3-3.4.15         | NOK | http://autobuild.buildroot.net/results/fda77164b97e9e5517762932df1ad731237f221a |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/b0a6b291d34dd8c42aaabbaed826fe138fecca0e |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fb66bdfbbb804040930c6c355d00b988da507208 |     
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/da20fdba9c4cfb9d5b204a32bf283c8135ed5d87 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c79fa2e2824bc071c967e34accec952a915c1993 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
monkey-f54856ce250c4e257354... | 1 
                  ndisc6-1.0.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/20e3f685a40793b61c30ef949016480bfac8fafe |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/60706467820f69d236cf33f64f7804b18034c032 |     
   nios2     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/852af675c964af888214eece08bc28b619e5885b |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/40bb61131eef01ea5ae6b20df6883a0f52b4bc1b | ORPH


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                 wavemon-0.9.4 | 2 
                 libqmi-1.30.2 | 1 
                  ndisc6-1.0.5 | 1 
                  uhd-3.15.0.0 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |         libqmi-1.30.2          | NOK | http://autobuild.buildroot.net/results/17e95756e8fb00df58d53319d93ac9c135868493 |     
    arm      |          ndisc6-1.0.5          | NOK | http://autobuild.buildroot.net/results/1d75e362e0d3de7ab217c4aee55e4e03c45ae3e9 | ORPH
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/75776800c8017cc8b8215c1be57776bedf79a896 |     
  mips64el   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/2f8a1e1deb42617f9e6e2f4ad206c94d8d8ea895 |     
    sh4      |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/5d12fd26487158b2561847c3ba6449ece8782be4 |     


Gitlab CI results for 2021-12-20
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
                 TestEdk2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1901892076  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
