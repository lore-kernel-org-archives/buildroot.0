Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A19C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 07:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57ED583E0D;
	Fri,  7 Jan 2022 07:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxehSSAaB66f; Fri,  7 Jan 2022 07:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8514083E09;
	Fri,  7 Jan 2022 07:11:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFD311BF861
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 07:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE25F429CC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 07:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TKIkDj3E3Yh8 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 07:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 479A9429C8
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 07:11:16 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 67F1DD29F9
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 07:02:55 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8866220013
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 07:02:49 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Jan 2022 07:02:49 -0000
Message-Id: <20220107071117.AE25F429CC@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-06
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

Autobuild statistics for 2022-01-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 66  |  7  |  0  | 73  |
  2021.11.x  | 38  | 10  |  0  | 48  |
    master   | 68  | 35  |  0  | 103 |

Classification of failures by reason for master
-----------------------------------------------

                host-file-5.41 | 6 
                  xxhash-0.8.1 | 6 
                     mdadm-4.2 | 4 
                  rygel-0.40.2 | 4 
          gstreamer1-mm-1.10.0 | 2 
                   guile-3.0.7 | 2 
   jitterentropy-library-3.3.1 | 2 
              cryptsetup-2.4.2 | 1 
           docker-cli-20.10.11 | 1 
                       frr-8.1 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
             ksmbd-tools-3.4.3 | 1 
                nodejs-14.18.2 | 1 
                   perl-5.34.0 | 1 
                rtorrent-0.9.8 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |        cryptsetup-2.4.2        | NOK | http://autobuild.buildroot.net/results/0eb2a70d70203734395013b1860c7a090b085b48 |     
   x86_64    |      docker-cli-20.10.11       | NOK | http://autobuild.buildroot.net/results/4babe36e71ed822c8ea74408c3a0ab1fd5a419da |     
   xtensa    |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/33761c0d9f826a87ec08953fa2cc8e96d99b30c8 |     
 powerpc64   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/7245413aed7a36fa037812cad4a4115235da42be | ORPH
   xtensa    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a0bc8536bd0ee8a1b9b80a9ab43acec72694fd73 | ORPH
  aarch64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/4f07b50bc1a94ea7f84dfb6892341347625acba8 | ORPH
  riscv64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/2ee44be4d20b04e77b330c062e1b238268640b43 | ORPH
    arm      |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/067d3fe614db9076abb4fe8da2a95884e9e0d17e | ORPH
  riscv64    |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/6a431b6eea4cac9a5fd969a27f4d0ecd661b3d68 | ORPH
  mips64el   |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/c0054a41166aeccd2bb9b6792f1ca69631b03e99 | ORPH
   s390x     |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/047f4d82412a45c39964c55a7a7fa91519632cb0 | ORPH
  mips64el   |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/fbfabd0fd0e2852b52f6814369d1427f855b68e9 | ORPH
    i686     |         host-file-5.41         | NOK | http://autobuild.buildroot.net/results/e4dd9d7f21d39a790e37e0968c6a36f335b8092a | ORPH
    arm      |  jitterentropy-library-3.3.1   | NOK | http://autobuild.buildroot.net/results/7b01eca8f1442318dd35282605fc8815e6afb0d0 |     
    arm      |  jitterentropy-library-3.3.1   | NOK | http://autobuild.buildroot.net/results/c4fbfb5ab21ae0d231eb639add70c18f6427b753 |     
   x86_64    |     kf5-kcoreaddons-5.47.0     | NOK | http://autobuild.buildroot.net/results/b9c165cb8915a0d749577aacd58d6dba0b25aba2 |     
    arm      |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/388ef9d258a45426deef76498f29e789b454a87d |     
    arc      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/e0162cfce67ce116d05cd47ebfd2fb25a962ed18 | ORPH
  mips64el   |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/c36127c93fdc43af95ab803893232f3f185f694f | ORPH
  mips64el   |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/dc4def3b013717d5429e37e624db7d64ef490fa6 | ORPH
    arm      |           mdadm-4.2            | NOK | http://autobuild.buildroot.net/results/6cfae1bf8ef5e5492c117f9cecf8cbef154e25bd | ORPH
   mipsel    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/59b11ede8b55bf0ad01f6482373844fda1575edb |     
    arm      |          perl-5.34.0           | NOK | http://autobuild.buildroot.net/results/2be1e8a878049e404ca16b131332ec3271175ef5 |     
   x86_64    |         rtorrent-0.9.8         | NOK | http://autobuild.buildroot.net/results/4804a2698323e80da546475dbaed0898e7edc76a | ORPH
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7da3584682c284ce7c1aed929fadf0786f412653 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/7be99ab4d2d660850c226a4b2202ba1ffccff32a |     
  powerpc    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/cb4c60102778473d85be7de10ea667c282a225ff |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/6f10eefde86c697e39aa40830978d8f916d7f6ea |     
 powerpc64   |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/15e0a4d80f60efb4f5058895bdc96c30649b5567 |     
  mips64el   |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/2be27ebfe555fb067254527fc4dd9804373db0aa | ORPH
   sparc     |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/9dd8e9166e4ac6979301ae5629b9c2e5df6c2b14 | ORPH
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/d826274bec640e4666885da6806233441f7d2fde | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/7672d5790993e0a99cfead40b53123972e21381d | ORPH
  powerpc    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/81542df98312d44e60b4aae23fc2b50f30e51717 | ORPH
   x86_64    |          xxhash-0.8.1          | NOK | http://autobuild.buildroot.net/results/433ab91ed2c29a98bef64a681f651a56e48290c2 | ORPH


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                  zeromq-4.3.4 | 3 
            erlang-jiffy-1.0.6 | 1 
        host-sentry-cli-1.57.0 | 1 
monkey-f54856ce250c4e257354... | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/03aa44f014b919119c3cec583ebcdf56d518d497 |     
  sparc64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c7c726103fdf4af56089a367fde59653c60545c9 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/339c5fee3102ffe2387712bbaeaeb8b41c7dcbd0 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/129f77be3ded7087e398fea805e8a8d4339e030e |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/61d91e03c28249df0ffee84444a2f359d0a22647 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/2a4c382963bf9af63e440e4ff6beb5a07d38f9a9 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/87dc8827f24abe4629bb6b2be3bc48063b83a002 |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

              host-erlang-22.2 | 5 
                       unknown | 3 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/44b3609ec0d0ab303d9fc7e14ea12096ed1bf4e1 |     
   x86_64    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9f3b9c2ae25c5c87f98b28a30cff1f295d4a855c |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/dfb587e294434b2f64ab1cb803db58d9a36069d3 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/3f2888b177af38b1ef02949740d2cefbf2607a43 |     
    i586     |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/7c9b4e0e2a55ad0584b36abd52e47722eaa92785 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/90d94bff4f222b5560aa2eb8c6759e86fdddc17d |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/145f525743f74c364ac43df3dc304ee9d6d52f53 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/ce17b39b221506a90f7c4f644cece5ed50faf7fd |     
    mips     |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/28a08f675cc11242c2b5704cef90a4d3967f119c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/27fe7985281bc05f6173c72b36ae6c7cd042e7a6 |     


Gitlab CI results for 2022-01-06
================================


-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
