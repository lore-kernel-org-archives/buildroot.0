From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 08 Oct 2019 06:16:49 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-10-07
Message-ID: <20191008061655.59EB787E5C@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-10-07
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  4  |  0  | 18  |
  2019.05.x  | 25  |  1  |  1  | 27  |
  2019.08.x  | 19  |  4  |  0  | 23  |
    master   | 165 | 121 |  0  | 286 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             subversion-1.9.12 | 16
                    brltty-6.0 | 13
           libwebsockets-3.2.0 | 13
                    bird-2.0.6 | 12
                suricata-4.1.5 | 11
                 mesa3d-19.2.0 | 8 
               target-finalize | 5 
 Makefile:743: target-finalize | 3 
                 uclibc-1.0.31 | 3 
                  ffmpeg-4.2.1 | 2 
          gstreamer1-mm-1.10.0 | 2 
host-google-breakpad-7515ab... | 2 
               host-qemu-3.1.1 | 2 
                 libdrm-2.4.99 | 2 
                libgdiplus-5.6 | 2 
                    mpv-0.29.1 | 2 
                snort-2.9.14.1 | 2 
                       unknown | 2 
                 ytree-1.99pl2 | 2 
                collectd-5.9.2 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  flashrom-1.1 | 1 
                glorytun-0.2.1 | 1 
       gst1-plugins-bad-1.16.1 | 1 
                 haproxy-2.0.5 | 1 
                      icu-64-2 | 1 
              iputils-20190709 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
               libupnpp-0.17.1 | 1 
                   mimic-1.1.0 | 1 
               mongodb-r4.0.12 | 1 
                qt5base-5.12.4 | 1 
                    strace-5.3 | 1 
                   systemd-241 | 1 
                     znc-1.7.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/1b685abecc123ec42653058d48aee6c79071e4ea |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/278d6aed192e7d7a314d1aaa094d906ce3de5b17 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/654e7dca97d7fb06a897ed3258ec78ad2e526139 |     
    arm      |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/56ce3daa930d94084436a2809e11d131a330571d |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/99e721bd1f58aa334f2c6f7ccd0cf10abfdb5d95 |     
  aarch64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/dac0fc81532801adcc662a45973cfc98486b68e2 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/57d7d82dc48734397dc56239f803ac450409f5b9 |     
  mips64el   |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/16183f15b65ac75535b3deea4de0ed020bd1b040 |     
   nios2     |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/171a83d44cdb930cd80b1dfe00bfba4f4feee189 |     
powerpc64le  |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/8b84566401678de821574b8986ba61c7598e19b0 |     
   mipsel    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/c793e1f5670735a75ce54d8c0ba050ef74e0712d |     
  riscv64    |           bird-2.0.6           | NOK | http://autobuild.buildroot.net/results/335b863a022592fb3d4e804069f21b55f4e9eb6a |     
    mips     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5fc659df9ba8988d2a10a3e34427d80e3f4bee77 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2e90b4e4fca2513033ef68c2773a3d227ce6488a |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0b2b91c8d7537b421814a82fe13eaeff4f5aac39 |     
  riscv32    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1d3099121911ff48723e19ff498f72e9aea333de |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/7203227ce536a1991b7942deba5697509404ead2 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/1bab33bce735e17dfb3404fda2c87b6dd00d9f61 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6784c0b3fb40aa068bc5982dba503362f6a38a02 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/74a229ea13e1d5e1ac8cc41c0c701e0b6e0e3cdf |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/28c256918f4d8d3c412c5052318d1114d6e0a59a |     
powerpc64le  |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3eff640945b8c924bd04e800ebb607e528b8fc30 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e7a1a7a0a88b56f25577e006cdf143cbd015d647 |     
 powerpc64   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/37ccd7d5435a2da08c277cedaac1f7f7c023c838 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8a256d05902498e0dfc200346c6cc1a7617a1134 |     
    mips     |         collectd-5.9.2         | NOK | http://autobuild.buildroot.net/results/f7ae185a62f553740b4706ce2c559089db54e376 |     
    arc      | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/c23ced89720861a9ecc3e012c2569bedfa094aa4 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/ec5091640fe53229c33a5f61c209f014139d5c40 |     
    or1k     |          ffmpeg-4.2.1          | NOK | http://autobuild.buildroot.net/results/6a4071b8f25be088b8e1d43797296315ca966276 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/3af893222d54789837fea5b39029a08f2b72d935 |     
  powerpc    |         glorytun-0.2.1         | NOK | http://autobuild.buildroot.net/results/eb8438b5e440407adfeed7bd3a2819ca9e8575e2 |     
    m68k     |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/126ccc08454b7722db61d18a844cb5f9c24acc97 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/6c1287f433e160ac7152fa7441bdc343de15cbbf |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/877b50e876dcb14a4a7e5e0a870caf30c5d5201a |     
    m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/202daa0738e73c3760683adfa2ba6a2d08629c01 |     
   x86_64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/e3f2c7496b2692471078a60f51b49853498d768f |     
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/ba06434f2bcd206b6cc3d40bbee7850dcc2bd496 |     
   nios2     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/7b2abfee1b9277594fea44ead9b676ba6fd6eb09 | ORPH
    mips     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/0b078eb7a23987eaf13949e5d5cd7d6b6b8fd6e8 | ORPH
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/bb06ccb9c559a1cafa0fa486edf2eef24720c283 | ORPH
microblazeel |        iputils-20190709        | NOK | http://autobuild.buildroot.net/results/48d4dc8929083acf8117c5eee17ec4dafd0e1eeb |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/8d153f682126ff5600efcaf7c977fe39c9fb1f73 |     
    i586     |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/eda80c2e38e7c02f67f70d5cd3d2a3ee21ece04e |     
  mips64el   |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/88d836b81afda9cb34e972163ce8eb00f5a1e1ac |     
    arc      |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/dda5693455314822f298a082184108980245c9ba |     
   x86_64    |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/5fc5debda4f8c08f1b024e335d53a8d0d2649b43 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/78a2e7d3dee6011823b28a018e84d8b08fef0100 |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/c56a33b0c9db7f5a94b9334a08b3ae6f87697597 |     
    arc      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ecaf701161d3f3eb483908ebd9d3138dd26270c3 |     
 powerpc64   |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/0342099068bf70446a86c4c3291c37964bd7392e |     
powerpc64le  |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/88cb58309ecbd9cc01f560aea86fc35cf256cd6d |     
    arc      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/7f70b327a7db4e51f7c2aeb9d813be2eea0b7ad1 |     
 powerpc64   |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f97477b7ee94aea0020767b73ec1ed06b6456ec9 |     
  powerpc    |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/32815fc7521052e4164d3ca432f80fcc4c489a60 |     
    mips     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/ba1f17bd86c9b20276d3b0230daa1c2bc2326f3b |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/c608cedf711129ed187882ec15db4d8d89e26194 |     
microblazeel |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a2dc5e71e39cd358d1cbe4a268060de7731e37a4 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/72c756eb6ad625048bb66aac21a5a13dd1563712 |     
    i586     |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/4b4ea55abb0a433e4e630ff9fed2f823174acc56 |     
  mips64el   |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/a149e84a8c90e135153849f34199704f3aef3dc7 |     
    sh4      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/69b6885a7cacb27f1ec29061efae488d1b2a539f |     
   mipsel    | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/7e60f453dfc6536d3840f6d2e81c97d16f3da3fa |     
    arm      | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/d05e86173f49a1b9ff3f15ff67be76e83fd49988 |     
  aarch64    | Makefile:743: target-finalize  | NOK | http://autobuild.buildroot.net/results/03573a0f758319c491521c2f62d10f2bb0d2b09a |     
   x86_64    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/79282b51a16589c7c7ee7ef9da3845ca097605af |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/52a45c6838a13a67e9ee22f19fd1ff8e9a57ec30 |     
   mipsel    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/47736564fa4dd57223dfb03e71787e017c56557a |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/e3c15e8c88318b88b44510809658cdeacf6a9214 |     
 powerpc64   |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/99dae97189c89b05ee8d664179394b88ca6cd060 |     
  powerpc    |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/41fb5e3ac834d739e7f7d6d55d7c933a2c96117b |     
    or1k     |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/3578a5ea78fde7456259095037abf30bb35dc4d7 |     
    arm      |         mesa3d-19.2.0          | NOK | http://autobuild.buildroot.net/results/2d3130db142888a396cea30a33c30fe0305c8449 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/51ea6b22e11f727026e939fdac2570144d1ff68a |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/b63b69211d88afa873b66c6da625162855d9faca |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c4c82c74c254b2a411c10d35b648f31e5d242f97 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c1cfbc4ddeb096cfffe68996f9f19b5b3f6fbecb |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/499d6479bf8f0329b3005bf0c554418946f630eb |     
    arm      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/0a4e0531a7b44f0b820db7d1c98b78e1d7df2f3c |     
 aarch64_be  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6c3810f6f8489d3364d43c8755b0a585349f93d3 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/483f881eb4947213cd9ec896b4ac0e0fd0fee023 |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/6b406daae69dde6984d1207299b8a1823fbd1815 |     
  mips64el   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/495affd56ffd431457cb387e8cae7c4b8cdc30a3 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/f1c195e5fe6198c19a86573e79b70d543ea877e7 |     
   nios2     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/22a55bdea0bbdcb441352d628cbbdb7f5044e34d |     
  powerpc    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/5036d1900312649d8b01a57e411a5b3016837094 |     
  sparc64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/fb6efe09fdab6d5b7e9b78d28a5d9d95e7b746e7 |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/e99b37bdb4b2bc03c700af775d17a332886a631c |     
 aarch64_be  |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/1187706d464c6a5669decb12f9fab0228f9fb164 |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/7eaa1502c92cb74caa1b22e68aa3e0eb85cfdc5c |     
   mipsel    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/328d430a495451aad4de2812a2fc885fc79d2aed |     
microblazeel |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/10d7285d07f633b09a9198dbe17f0dffd83d4e89 |     
   x86_64    |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/c522c6cec9522b507b173681ae4ad343cb408ee7 |     
   sparc     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/06c1afe40f8d31c2a076e9686d0ac04c237c451b |     
    arm      |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/4bd9eb9a1beb445b261d655816331acf0810d3d0 |     
 powerpc64   |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/15f3a67763e2b3bc786ad71b6c9a5c7e646455b1 |     
    mips     |       subversion-1.9.12        | NOK | http://autobuild.buildroot.net/results/61b60b2b6d1758b23049265514dc25a08fd38a03 |     
   nios2     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/696f6ce6bd382d3ec3f8aa5bb6cf0321247ca9a6 |     
  powerpc    |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/f48894e0503d3fa1cbf18c05fc42c5a5cc0389ae |     
    arm      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a0599d58539ddd95b4e9f0bb6c8532055f49758a |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/03f120ab0a78b7edd639398d8d5254a233b43c2e |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/3efed780082d9a03a16fd4e6f36dd9457161a59d |     
 aarch64_be  |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/2a72920d2ab74c3264a10fd2348fa97ea980e15a |     
 powerpc64   |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/30f9a6432da719cfe61ba5e7dead6c5c17f6e2f7 |     
  mips64el   |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/8c9bd2c6bac10cab3c5eb69fe98342c88cc8a4f1 |     
    arm      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/1b8de071729ab4798f96a71104e0ccb546e154de |     
microblazeel |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/e33dff7b1c5968c4e29a4a4997b360a356517cb0 |     
    sh4      |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/cd79c40e2c85096654091fca85bcf8a30ab0a901 |     
   nios2     |          systemd-241           | NOK | http://autobuild.buildroot.net/results/7015a59249ed51dc796610a587f35e8a389cea1d |     
   x86_64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/ada102df95331c6205236f609c991cb076dc8aa8 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/a6e1dd29ad92b0f645c834f9c57f238c40af1ab8 |     
  aarch64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/9e0a8502c8fe2ec5744e04b0abe666c6b9ccf72e |     
    i686     |        target-finalize         | NOK | http://autobuild.buildroot.net/results/e5f9a98ce698dd7fdbce1e7e890c808150e9ddf6 |     
  riscv64    |        target-finalize         | NOK | http://autobuild.buildroot.net/results/156ef6b1d435a34a4654ae913758d65c0d8da976 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/9ce3a9803498870880b4b28934653115aa35196a |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/87aaa7c3e95ac73a028120d9c3905fcd4885a300 |     
   xtensa    |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/ef1eb84fc7e659073b53afe7ad31195bc5769696 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6ecb395ff502a4d36b14de88e03d3a37ad3079d5 |     
    m68k     |            unknown             | NOK | http://autobuild.buildroot.net/results/5b5ea83b2368367c72fd2b83700e4a8942db14f6 |     
    arm      |         ytree-1.99pl2          | NOK | http://autobuild.buildroot.net/results/13aa71a4a9151621b63910f36f0729217c5f5583 |     
    arm      |         ytree-1.99pl2          | NOK | http://autobuild.buildroot.net/results/f8f23d7e24b19178bca7bc702c1389e6f62b2c37 |     
   mipsel    |           znc-1.7.5            | NOK | http://autobuild.buildroot.net/results/f3394de616cea4f474b6d5887aa0d5f5dff05281 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           host-libselinux-2.8 | 1 
               host-qemu-3.1.1 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/756e24257f2307c4cfab3bdaa1330ee54c86c2c9 | ORPH
  aarch64    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/82ac83f9abcb50f5266c7f2eee70e2b5519b7c3f |     
    m68k     |        host-qemu-3.1.1         | NOK | http://autobuild.buildroot.net/results/7c3486112e0ad7641d2fed0c0d90358d754c64e3 | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/3599175e1c776c9ddd984c8a35f4515e987617cf |     


Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                     host-llvm | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/599c7338ff75ab0cbddd2f309677eed572a7752c |     
   nios2     |  vdr-plugin-vnsiserver-v1.8.0  | NOK | http://autobuild.buildroot.net/results/5038273bff3654044fccc3d76f6432a4f6900171 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 2 
                 libdrm-2.4.99 | 1 
                  monkey-1.6.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/c18d9bfa63b421e370301904f1565ed86dcf3c37 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/6223d2c25776165a7947b030df4e4c4e23147f8c |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/3d418f003c306f000fd443a1605717d007760ec2 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/2744604525d1bd97abb2fb1c6a3c2db7610cb38a |     



-- 
http://autobuild.buildroot.net
