Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D54C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 06:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBB8682CC7;
	Tue, 11 Jan 2022 06:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xl0pa4Ri6Iom; Tue, 11 Jan 2022 06:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D152D82D07;
	Tue, 11 Jan 2022 06:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99B051BF338
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 06:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9358382D07
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 06:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7AcraaBlsGp for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 06:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D51DA82CC7
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 06:58:13 +0000 (UTC)
Received: (Authenticated sender: bot@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7333240009
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 06:58:10 +0000 (UTC)
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jan 2022 06:58:10 -0000
Message-Id: <20220111065815.9358382D07@smtp1.osuosl.org>
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2022-01-10
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

Autobuild statistics for 2022-01-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 51  |  7  |  0  | 58  |
  2021.11.x  | 28  |  3  |  0  | 31  |
    master   | 98  | 61  |  0  | 159 |

Classification of failures by reason for master
-----------------------------------------------

                  rygel-0.40.2 | 6 
                    vtun-3.0.4 | 6 
                cryptopp-8.6.0 | 5 
             drbd-utils-9.19.0 | 5 
                       unknown | 4 
          gstreamer1-mm-1.10.0 | 2 
                   guile-3.0.7 | 2 
             ksmbd-tools-3.4.3 | 2 
package/tinifier/tinifier.m... | 2 
          refpolicy-2.20220106 | 2 
                 samba4-4.15.3 | 2 
                apparmor-3.0.3 | 1 
                    bat-0.18.3 | 1 
                    bird-2.0.8 | 1 
               domoticz-2021.1 | 1 
                    efl-1.26.0 | 1 
                ejabberd-20.07 | 1 
                       frr-8.1 | 1 
google-breakpad-7515ab13768... | 1 
                host-go-1.17.6 | 1 
                   libqb-2.0.3 | 1 
               libupnp-1.14.12 | 1 
                mbedtls-2.28.0 | 1 
                 mesa3d-21.3.3 | 1 
                mongodb-4.2.11 | 1 
                nodejs-14.18.2 | 1 
                 opencv4-4.5.5 | 1 
               pcsc-lite-1.9.5 | 1 
               pulseview-0.4.2 | 1 
           tesseract-ocr-5.0.1 | 1 
           tinifier-legal-info | 1 
                tinyalsa-2.0.0 | 1 
                    vlc-3.0.16 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |         apparmor-3.0.3         | NOK | http://autobuild.buildroot.net/results/ec5251d05fc25e46dd33d2ea38d400438fcdbec8 |     
    arm      |           bat-0.18.3           | NOK | http://autobuild.buildroot.net/results/88cccf3fe4bb22322f1d36cf7f16e920b758df4d |     
  mips64el   |           bird-2.0.8           | NOK | http://autobuild.buildroot.net/results/a3e189c5eee2de216f59ccad3d56dc1a6753dd00 |     
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/e9dab1bfd05ea7e659a0ec751c6467bc8186fccc |     
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/1fd47187c9936ae385a12cd74c70eb8aa440fc81 |     
    arm      |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/e4fd947c118174a4fad62cbed18816f02d39ec25 |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/c22c5fc939f11e034c350dfc76d138fa0506a856 |     
  powerpc    |         cryptopp-8.6.0         | NOK | http://autobuild.buildroot.net/results/174fe03da7a40dd152703de93af6a213d9cac698 |     
    arc      |        domoticz-2021.1         | NOK | http://autobuild.buildroot.net/results/302f65e535a6a29c7458dce4ff4676219f487df8 |     
   x86_64    |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/c63252f08544ccbad1bb72e7ea1f44091451544d |     
  riscv64    |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/42d078006ff98aa25c4f8b3a015cf96568ae29b5 |     
    arm      |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/68ffaffcf4e8d05f9aed75147104cca5a0ac60e9 |     
microblazeel |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/b03b4315cbcefedd68d6a68f8a895f55a6b1ab17 |     
    mips     |       drbd-utils-9.19.0        | NOK | http://autobuild.buildroot.net/results/bb6fdc13b137261924f879591bec9ddf3a7ebde0 |     
  aarch64    |           efl-1.26.0           | NOK | http://autobuild.buildroot.net/results/0a8616ff8a496719875d21103ac390782ca42e19 |     
  aarch64    |         ejabberd-20.07         | NOK | http://autobuild.buildroot.net/results/0adc757a364ebd375d40df536130cc4ca0c02f80 |     
    arc      |            frr-8.1             | NOK | http://autobuild.buildroot.net/results/41bbbba582d14be454943ad0ff097edaa84e9947 |     
   mipsel    | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/b202f65426be25e7aad196a0a05fbca94da1e847 |     
  aarch64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/e7f943ad6f2a94d4d82ac65e4c611723e369dac4 | ORPH
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/3c4ccc87fb09f40862b66e03afa8cc6d9723de4d | ORPH
  sparc64    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/d2b5949b3f82b946fb33135ba06569191c49c5f9 | ORPH
  riscv32    |          guile-3.0.7           | NOK | http://autobuild.buildroot.net/results/779b98575eb8d0c154f3f3e3804e19b15ee8edcb | ORPH
  mips64el   |         host-go-1.17.6         | NOK | http://autobuild.buildroot.net/results/0945b3caea98be6c77aaab4fec9f11b3ecc3b2f6 |     
  riscv64    |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/f667cbf81163cc11d4abe0f06b83e628139e2865 |     
    mips     |       ksmbd-tools-3.4.3        | NOK | http://autobuild.buildroot.net/results/d7390217cce0efadee0d62a0e668bba18dd014a3 |     
    or1k     |          libqb-2.0.3           | NOK | http://autobuild.buildroot.net/results/2e438c1317188373b99b9a7ffd19ca3693112fb3 |     
    or1k     |        libupnp-1.14.12         | NOK | http://autobuild.buildroot.net/results/478b1664555820657aedbe3f6eb5aec3a5247660 |     
    arm      |         mbedtls-2.28.0         | NOK | http://autobuild.buildroot.net/results/cecdcd64da211dd235efda7a1ba33c1208907c66 |     
    sh4      |         mesa3d-21.3.3          | NOK | http://autobuild.buildroot.net/results/036d827be5c044f421f95dcc061f33b76789e006 |     
    arm      |         mongodb-4.2.11         | NOK | http://autobuild.buildroot.net/results/12b89bdee71411b9ec850ef5e8d7632f3c87f6ef |     
   x86_64    |         nodejs-14.18.2         | NOK | http://autobuild.buildroot.net/results/6c6cc3fb07152172da87e5e15763c34bc228e96c |     
  mips64el   |         opencv4-4.5.5          | NOK | http://autobuild.buildroot.net/results/817d9f6ffdab34d57396c3bd390fcba96820885e |     
    arm      | package/tinifier/tinifier.m... | NOK | http://autobuild.buildroot.net/results/2757e70e92860a7bf636dcd444c97aafdf5868ad |     
   x86_64    | package/tinifier/tinifier.m... | NOK | http://autobuild.buildroot.net/results/2056ba96424806eb8c2e41f29a014b6beff467ab |     
    or1k     |        pcsc-lite-1.9.5         | NOK | http://autobuild.buildroot.net/results/14503c57268616aff87159bfc5ad5153e7fd8cc7 | ORPH
   xtensa    |        pulseview-0.4.2         | NOK | http://autobuild.buildroot.net/results/32b3d88d01ea4b6aad099fa90970bf3074b5837d |     
   xtensa    |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/98d5b3db313000855721c0ad994951fe8cc781c0 |     
    arc      |      refpolicy-2.20220106      | NOK | http://autobuild.buildroot.net/results/b476a32b5d0518f35c9fac62485e7ede408d8fb7 |     
    arm      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/f17d305be7bf5535e0c758fac66b27498900eef2 |     
  mips64el   |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/0c71db6d4c0d951ed78432d3c3898e46a4d82288 |     
  sparc64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/040c5e1314e0e7575e8e0de06bdcae0844bc6282 |     
    arc      |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/3a145a742ab1dd243b82c8fa6a10242372bffbc2 |     
  riscv64    |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/4977bb11825095aec159d44f01e662aeb458eeac |     
   s390x     |          rygel-0.40.2          | NOK | http://autobuild.buildroot.net/results/32f0a8e1392e98e3ab8045792733510a233c587d |     
    i686     |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/542ade6fe1cd6e8c22e33ba9632c19018c8a634a |     
   x86_64    |         samba4-4.15.3          | NOK | http://autobuild.buildroot.net/results/5944753efc113a7c76225458c11c7faafc6c3542 |     
    arm      |      tesseract-ocr-5.0.1       | NOK | http://autobuild.buildroot.net/results/f6e310728b00ae13d0889e4ad1f7d0cd4e92ebc1 |     
   x86_64    |      tinifier-legal-info       | NOK | http://autobuild.buildroot.net/results/8d74a1d6698c1522d1eded771bdc50e80a63529a |     
    i586     |         tinyalsa-2.0.0         | NOK | http://autobuild.buildroot.net/results/a75e23dc585bd071f4d65face5489ed6ac22edbe | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/0898a310aa19dd1770042fba0cd4c2e9030864f2 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/a5e154d16dc192ba5e89fb5030004b7b7b0808ba |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/f67aba89e1764024cead72d8f64138ed36f51df0 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7608338a8372c93a9f20229be95c2ca640e1357e |     
 powerpc64   |           vlc-3.0.16           | NOK | http://autobuild.buildroot.net/results/5841b5f1ed771923b4c99067b55bc11c052dfb89 |     
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/d6eb63493c5023d35ed54f1a06484f8d072728be | ORPH
  mips64el   |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/d7166d32f17ad1a9d3f296bac39ea231c94aea6e | ORPH
   xtensa    |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/8491ec3f852043d18867760c7adf6349e8db2e8d | ORPH
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/3a1bb52324d9bea7e138806f63edf728ba9eeb42 | ORPH
    arm      |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/b406284bd013566452b33302a9332f8b23ff3c36 | ORPH
    i686     |           vtun-3.0.4           | NOK | http://autobuild.buildroot.net/results/0db342fbca14447849569676f2c77ba79f294502 | ORPH
   mipsel    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/672427e5711be790bb3164b79f8589f73f459060 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

             bluez5_utils-5.62 | 1 
  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
               libtheora-1.1.1 | 1 
                  ndisc6-1.0.4 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |       bluez5_utils-5.62        | NOK | http://autobuild.buildroot.net/results/d050dc909f9e1fe6db29f20d69cdd404f609cb4c |     
   nios2     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/bfb56d315dfe9b6a9d7ac5e156f157450eb51b52 | ORPH
    i686     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/460b16121d528b307a7d266c564c77a5ba2708fd |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/2e4f84c318ce0c99378682b59a3f57b51f4de1c4 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/b3c6881b1bcac64fdc1f8a09ff34153a523d6067 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3db274858f5556e163eccbe4bd7a3329f069c356 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d7ee6d14377583cb1b5d80c76f6220ccc577f0cc |     


Classification of failures by reason for 2021.11.x
--------------------------------------------------

                   libnss-3.73 | 1 
                log4cxx-0.12.0 | 1 
                 wavemon-0.9.4 | 1 


Detail of failures for 2021.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libnss-3.73           | NOK | http://autobuild.buildroot.net/results/5cabce045fde39370269d9da7693a837cfafec42 |     
  mips64el   |         log4cxx-0.12.0         | NOK | http://autobuild.buildroot.net/results/74b8a7439b1bfb2a9e25e89f8dd0cfa71e3e805c |     
  riscv64    |         wavemon-0.9.4          | NOK | http://autobuild.buildroot.net/results/a1ad5d09002131eea6f48ea36ed9374c0b2884c1 |     


Gitlab CI results for 2022-01-10
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
   TestIso9660Grub2Hybrid | https://gitlab.com/buildroot.org/buildroot/-/jobs/1956557939  | ORPH 
                  TestLxc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1956558084  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1956558205  | ORPH 
              TestRustBin | https://gitlab.com/buildroot.org/buildroot/-/jobs/1956558206  | ORPH 



-- 
http://autobuild.buildroot.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
