Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BF5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B914B61059
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 06:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B914B61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8936F83422;
	Fri,  3 Sep 2021 06:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZzbZBwRN2O1Y; Fri,  3 Sep 2021 06:58:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84345834D3;
	Fri,  3 Sep 2021 06:58:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2018D1BF44C
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FA78834D3
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 06:58:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QOQxhJ60vpn for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 06:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70FEB83422
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 06:58:10 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7563E24000D
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 06:58:07 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 Sep 2021 06:58:07 -0000
Message-Id: <20210903065812.0FA78834D3@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-09-02
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

Autobuild statistics for 2021-09-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 39  |  7  |  0  | 46  |
  2021.05.x  | 40  |  7  |  2  | 49  |
    master   | 199 | 17  |  1  | 217 |
     next    | 50  | 25  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
            erlang-jiffy-1.0.6 | 1 
              fstrcmp-0.7.D001 | 1 
  gobject-introspection-1.68.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                harfbuzz-2.8.2 | 1 
                host-odb-2.4.0 | 1 
                librsvg-2.50.5 | 1 
               linux-pam-1.5.1 | 1 
               luasyslog-2.2.0 | 1 
                 mesa3d-21.1.6 | 1 
                       mongodb | 1 
                mono-6.12.0.90 | 1 
                  mupdf-1.18.0 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/a61725d32320498de28ac72dafbdb78c81478385 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/4efbd747f0072878150fe84dbee0785ffc6de96e |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e57a028480074183a7561694b98892ffd61c9a1d |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/ffbee12f13e3d6c180d8891a428c6c490163083d |     
   x86_64    |  gobject-introspection-1.68.0  | NOK | http://autobuild.buildroot.net/results/2e9dbc0d36600c09fa9e59ab1b1903c9f40661e8 | ORPH
    arm      |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/1c75cdcc183642fd4c15d56825848b83f2ad11a5 | ORPH
    arc      |         harfbuzz-2.8.2         | NOK | http://autobuild.buildroot.net/results/2f3ef17b434a728c41d46cf98bd071d1c9c2d99d | ORPH
   xtensa    |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/93e084cd4ade5823fa5aa3c999c1603e3fccb5b3 | ORPH
    arm      |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/9849063c37c6c2302aa261e19e6db57a38400011 |     
   mipsel    |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/3c047dcfe83e56d7b8f60678fb551025fb3b21b9 | ORPH
  riscv64    |        luasyslog-2.2.0         | NOK | http://autobuild.buildroot.net/results/c6684258980e3b76d63ece3564acd3c3e42f9f6f |     
    arm      |         mesa3d-21.1.6          | NOK | http://autobuild.buildroot.net/results/4b06ee539b1c20c853f7e45575c590979f826808 |     
    arm      |            mongodb             | TIM | http://autobuild.buildroot.net/results/9fdab9caef6d059d15218611edb3e6c7650c7646 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/95a583a57bb76aacb9ac43595889d1632884181b |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/981305950b7ec736f672782b009f065cc94d7438 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3d273d7c6b8237ee3d6a2a875fa3626519cde5ea | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/2a60ee1a00d9439967e201a2ea39e078daf96ba5 | ORPH
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/2ef169f90f9792a8fb0882d2a0a23c56554f246e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

monkey-f54856ce250c4e257354... | 3 
                  apitrace-9.0 | 1 
               capnproto-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                 openmpi-4.0.0 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d37c7c79b66d4c2498d7741f39fa4ffa118f4839 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/50217760d0401790ef5c393971483f83c2799b89 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/041740661be47c7a7e869aabf56e6c35f3fb8f59 |     
   x86_64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/c55c6d2f7471af5bf07a1c5c172beeeccaaa2be9 |     
  aarch64    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/8922a6dda808983311a2e113b5a4f4f990e7e8a3 |     
 aarch64_be  | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/ae6b74147a363ed3b08b48cd5b5bba438f08c703 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/99c0670d166b6efb21dc4df387189ba8233a9544 | ORPH


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                 openmpi-4.0.0 | 2 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
                   httping-2.5 | 1 
                       mongodb | 1 
                qt5base-5.15.2 | 1 
                suricata-6.0.3 | 1 
                     webkitgtk | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/68766cdba488e4e309c19be4266219df585f07cb | ORPH
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/24a1eecc922ae156c2b127ac7ed0fe68eaa1d2d7 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a6997caca00e2333699c9aa15dd0cafa265f8a80 |     
  aarch64    |            mongodb             | TIM | http://autobuild.buildroot.net/results/a14cf06426ce6fbfd4dabb710cc91f37cb2396c3 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/3278c3cf6ad87dc407460c52b08993f526a3fd5e | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/f72d8c6355bfa7d365005720858af7c0d3f193fa | ORPH
  riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/53372b6483c236b28996b6304eaffcbc02385803 |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/beb2f627cf536254d52f26ca90e5bb61334fa37a |     
   x86_64    |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/79d81e51f863492b75ec7ad7a5a601ec7f185433 |     


Classification of failures by reason for next
---------------------------------------------

              host-libcap-2.52 | 5 
               libglib2-2.68.2 | 5 
          refpolicy-2.20210203 | 3 
                  autofs-5.1.7 | 1 
                  boost-1.77.0 | 1 
               capnproto-0.8.0 | 1 
                    ffmpeg-4.4 | 1 
               linux-pam-1.5.1 | 1 
                 mesa3d-21.1.7 | 1 
                mono-6.12.0.90 | 1 
                    mpv-0.33.1 | 1 
                suricata-6.0.3 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                    ushare-2.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          autofs-5.1.7          | NOK | http://autobuild.buildroot.net/results/ccbda68219bb8dc8529ddfe8baa32914a907f068 |     
    arm      |          boost-1.77.0          | NOK | http://autobuild.buildroot.net/results/641875fa2f10470c05bc4a7bf97d02c00c114a0c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/d976e0eeb1ec04f5ff14249cbc7bfd9935106439 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/7ffa5d56ffd6dc53f5b928bb2aee2eef77d6b0fc |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/debd5d210405706212531676cad65bceff469359 |     
    arm      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/cf9e633aafbb043596e070a3681652c19d828c3f |     
  riscv64    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/f9782a2830ace4669286c360b37028553d63ad8b |     
   nios2     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/8f47feb3b95077b551105b5a34e8b417cabfd546 |     
    or1k     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/d474e6878b62df348efeb6c2ec0c7ec3985d4efc |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/a4f85f702029d8cfc78c149fe203df49412db173 |     
   s390x     |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/a7a0fe23f6c7f68f849085a021d54117d1d92c06 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/0abdd56ae47973177a24d09b0f585d8ea9013eb1 |     
    arc      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/a43f003a5979cc092b091b1ce25f7c7c1ed92a41 |     
    arm      |        libglib2-2.68.2         | NOK | http://autobuild.buildroot.net/results/26d778579861a124f60489af05c69446bfa658f6 |     
    i586     |        linux-pam-1.5.1         | NOK | http://autobuild.buildroot.net/results/7ff5b4cae0800cf633b76d21a5f1086cccd81e8b | ORPH
    m68k     |         mesa3d-21.1.7          | NOK | http://autobuild.buildroot.net/results/8ff85d35f055e02077a60fd215b99ff6b60aada1 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/778cc8d7d951f772b9ca2db3fbebe6359a3616af |     
   x86_64    |           mpv-0.33.1           | NOK | http://autobuild.buildroot.net/results/bb11651efcab032ac2c74169433f7f30ad349eed |     
    sh4      |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/2b6eccd56e2b23b9de7185c347f040f359099ff7 |     
  aarch64    |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/9bf3a1a4718921e9d02a3f7c28fb6eff0212ca46 |     
    i686     |      refpolicy-2.20210203      | NOK | http://autobuild.buildroot.net/results/c67ee17f8bfa896226ff64da36d0fba9bb73d5c4 |     
   x86_64    |         suricata-6.0.3         | NOK | http://autobuild.buildroot.net/results/b348fae7e327ecabfec04fce0171310cdab9f6ba |     
    i586     |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/47ead7df90851269a070e5089a836019c6fea453 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/a942430ae8f359d2cbb90672cbe7dbf32a4352c9 |     
    i586     |           ushare-2.1           | NOK | http://autobuild.buildroot.net/results/3ef8571b5f218cb5639cc05923dd55435ea1d4ef | ORPH



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
