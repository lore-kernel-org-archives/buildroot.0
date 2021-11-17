Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D149CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 07:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75EC861BCF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 07:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75EC861BCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE4760A48;
	Wed, 17 Nov 2021 07:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BCkOkdl0T_nd; Wed, 17 Nov 2021 07:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287E96060A;
	Wed, 17 Nov 2021 07:58:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29DA11BF2EF
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 07:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B01740384
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 07:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqP3XZyPYc9z for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 07:58:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 613654024E
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 07:58:29 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3FBCF20012
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 07:58:26 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Nov 2021 07:58:26 -0000
Message-Id: <20211117075831.0B01740384@smtp4.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-11-16
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

Autobuild statistics for 2021-11-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 45  | 14  |  0  | 59  |
  2021.08.x  | 50  |  0  |  0  | 50  |
    master   | 86  | 32  |  0  | 118 |
     next    | 11  |  6  |  0  | 17  |

Classification of failures by reason for master
-----------------------------------------------

              tinydtls-0.9-rc1 | 10
libdbi-88b8477d57153b9f736d... | 3 
              host-erlang-22.2 | 2 
               lighttpd-1.4.61 | 2 
                log4cxx-0.12.0 | 2 
                apparmor-3.0.3 | 1 
                    bird-2.0.8 | 1 
                 mesa3d-21.1.8 | 1 
                  mupdf-1.18.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
               pipewire-0.3.39 | 1 
                    qemu-6.1.0 | 1 
                samba4-4.14.10 | 1 
                   seatd-0.6.3 | 1 
                sg3_utils-1.47 | 1 
                       unknown | 1 
                 wavemon-0.9.4 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/6747b1cb11b129ea4bcb1ecc9645e94fb8e095e8 |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a2b46652a4ed7b1db9ddda0bf3d9f43756f92daf |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/b478174271c3b47010d615a59ed9e3ec755df693 |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/9da4ded18bdc79212b96a8a598fb9cb21aea296a |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/1eeb9054c65b62bab0bb3596556e93e027f138e8 |     
    m68k     | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/d8d5777c1eb0f93ef6558a7a567b62a8814993cd |     
    arm      | libdbi-88b8477d57153b9f736d... | NOK | http://autobuild.buildroot.net/results/ae7b419f8e78794670338ccb8227b6b742d1aac4 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/cac49399561aea24be200e86f103a68991390cf9 |     
    arm      |        lighttpd-1.4.61         | NOK | http://autobuild.buildroot.net/results/577179a3ec591e2948458919a9ce75c939a002b4 |     
    arm      |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/a934e8f5682269822633fbe9722769ed471b63ed |     
  aarch64    |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/8ee45315091ea5df57bd278410ea2a8fbb0849de |     
    arm      |         mesa3d-21.1.8          | NOK | http://autobuild.buildroot.net/results/54ed0f9bfe57fa419e1eb4ebb78003ca4fb85532 |     
  mips64el   |          mupdf-1.18.0          | NOK | http://autobuild.buildroot.net/results/504569fab0e70ff35a4bfcaf537f07410bf2f593 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/ecac99c326899b623421553368e1fefb029af110 |     
    mips     |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/faec4ea02f4a6ddf44d54d5784d9de866c2d8a1f |     
    arm      |           qemu-6.1.0           | NOK | http://autobuild.buildroot.net/results/64a36ff5c2f3251b828c6aa1363da6f5942d5189 |     
   s390x     |         samba4-4.14.10         | NOK | http://autobuild.buildroot.net/results/0daa85ec63c3ba1c96c54f89f8b34e99ab856d00 |     
    arm      |          seatd-0.6.3           | NOK | http://autobuild.buildroot.net/results/5219b6dac714886c7fa4d3687a13b9dff8338df2 | ORPH
    arm      |         sg3_utils-1.47         | NOK | http://autobuild.buildroot.net/results/38a0dfc70a21ce574368b7a485deb231f778b3e7 |     
  riscv64    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/edfee34fbceeac90bcefe1a41330454f4a260a6d |     
   xtensa    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/084a5ca63c1c808419c11011e211995f955c3836 |     
   sparc     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/14ccca5b160a67fa3015bf1967b4b2000f298a4a |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/d6be38394278d920d77234259fd063dada380688 |     
  mips64el   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fb1150a158eb98703059bdabf44508d8725f45ef |     
microblazeel |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/32e5cacec27f6b37913791f9a35169dc1f1fb9a0 |     
powerpc64le  |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/fe7cef4729ef8b7292244ae9b0a4227bbd6495eb |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/96cbc586fe0d02c66418424e6f800a8f4c9a74a3 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b83950df6b1e647d387a8b94e9bd8c9a540beede |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/5509b7e8b36828c73b6929eaed31010f36e5df18 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/bad586545f3169ae7f7701204efbfebfc167ad7b |     
   x86_64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/b988546be68e3674615cd929a55f5ff6c07d93a4 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/bb83cb0c2911741c10a5bf9c0740a40d3af1d41b |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 6 
monkey-f54856ce250c4e257354... | 2 
               capnproto-0.8.0 | 1 
            docker-cli-20.10.9 | 1 
             openjdk-17.0.1+12 | 1 
           uboot-tools-2020.04 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/6e1437ba045114211d4cc9b32d07135edf5477b3 |     
    i686     |       docker-cli-20.10.9       | NOK | http://autobuild.buildroot.net/results/09fc440b0a445ac33fa07d1eefa36f46cf4fa262 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/950f593620870f307fee85ea2670b1bebc7e789d |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c3a454e5bbf377e1341c98a7fbe136345cc4ca02 |     
    sh4      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/91f7b88a6ff64b586ad0aae3548a7b180305bda2 |     
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3f87e535224855eee539c6edbd24ebdb724c4fd0 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/707a817bc23c00645c9d9743826c619ea88f9bae |     
   s390x     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5620e9ed34d9b4f8dc468797451d0b7025ee72c6 |     
  mips64el   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/51d620152428fb6e6f60955b1da37712f54cd04c |     
    mips     | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/6aa458979bcec5cd54f1d517354ce5444b2cfa31 |     
 powerpc64   |       openjdk-17.0.1+12        | NOK | http://autobuild.buildroot.net/results/6c83a3f8b17c491faf8c71c309dbae12db527064 |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/a12b9c50c05c82fdb67d7f0d093c98ff3c52c6ca |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/cfaf86eaf698663e931bb56d500cf8a8a593936c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c536f54e6ddc2f9e6a04c8313251c54ffd03fb2f |     


Classification of failures by reason for next
---------------------------------------------

              host-erlang-22.2 | 2 
              tinydtls-0.9-rc1 | 2 
                   mpd-0.22.11 | 1 
               pipewire-0.3.39 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/c32686af06a01685edc26d3df2b981711f21b64a |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/5aa902480a736be21d4ee7d161a42855f7fcdb65 |     
  aarch64    |          mpd-0.22.11           | NOK | http://autobuild.buildroot.net/results/dd8fddbea705255c87f091fb429094d4ad2b432d |     
    arm      |        pipewire-0.3.39         | NOK | http://autobuild.buildroot.net/results/31014558b6ad72e0f602095c423d48219dd6ebfa |     
    sh4      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/9da501535ac096397436baec1823f210358a89d9 |     
    m68k     |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/daedd055cb0c81deb87baae6c9e7c2d6f10e0dfe |     



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
