From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 May 2020 06:27:01 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-26
Message-ID: <20200527062707.DEB5386AB3@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-26
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  6  |  0  | 16  |
    master   | 81  | 46  |  0  | 127 |
     next    |  5  |  4  |  0  |  9  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     avahi-0.8 | 5 
lrzip-7f3bf46203bf45ea115d8... | 5 
                qt5base-5.14.2 | 4 
             host-gnupg-1.4.23 | 3 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.16.1 | 2 
              ibm-sw-tpm2-1563 | 2 
                 rocksdb-6.6.4 | 2 
                  rygel-0.38.3 | 2 
                      tio-1.32 | 2 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
               belle-sip-4.3.1 | 1 
          host-acpica-20191018 | 1 
              host-audit-2.8.5 | 1 
               host-efl-1.22.3 | 1 
                host-go-1.13.8 | 1 
   host-xapp_mkfontscale-1.2.1 | 1 
                 jack1-0.125.0 | 1 
                   libnss-3.52 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-20.0.7 | 1 
                    mpv-0.29.1 | 1 
                 opencv3-3.4.9 | 1 
              openjdk-14.0.1+7 | 1 
                    squid-4.11 | 1 
                suricata-4.1.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/b2f25f9ec075eef549db4489ac886dff682cf9ad |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/61e1fe68249cf89d1c9f6a2490ded82eee65b39b |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/95625ac49e60262a55ec0849a39b9adb5f55e78a | ORPH
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/72a12dc196856d7dd64a1adaa8dd97516bb69309 | ORPH
    mips     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/f7700a627535e2c6d314f71b533e8eafc0171324 | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4e31dc149795df879b9bb60f42d2736d4f1e7ebf | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a1d4b181b2792ceae3f100068d6ce1c707962955 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/f86982701c73993bcd48b82a6b24e47f13e5b50f |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/b0b996934bf665c21c6f3b3ad4b85b3f84204308 |     
    m68k     |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/8de8ee19d6298edd864bc0ee1d201d4d35a7aa35 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/36a104a5b9d29602c4f54ede63a374568bea5357 |     
microblazeel |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/092ee7cb47bb17b720bd017a2c498b9c2464cef1 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/496a18833505dc589f7ae58f2c7e5fe80fe9af79 | ORPH
    arm      |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/ae456694c0b9d28ddf58af17754b69e9eb87a884 | ORPH
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/2e50b35f50846153714606e06a5cbbfa7df7fea3 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/466b3279a223470b92c9efb47827038c9d740de0 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/efefa3ff571d244e60ad264166778faa0648003d |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/117e2415454a4163e556feecc1cb2e11c3d24311 |     
   x86_64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/bbd8f26d499152dfd555e9e20eacab4ddf9e1995 |     
    arm      |  host-xapp_mkfontscale-1.2.1   | NOK | http://autobuild.buildroot.net/results/cbded3d004b8738c0bfc8d8a865c809b8df127d0 |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/df89f4f8e271887940c88412af3a944dc0931be0 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/6a8da389cba1f16b1b2982c89866fe125ca08363 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/a65d0bf1b54d304d933477d6c0aa953591334a78 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/435408f026141ffe484ae8e73c3b9a10940c5790 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/e508e7499c4a198dfe3c2597a7ee078c7db6a068 |     
  riscv32    | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/0f7179ed4706f05551af330d7f12b3efaeffd278 |     
powerpc64le  | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/a03869e2c566d97c261f54344b157b89b6a38fcb |     
  riscv64    | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/0e4d18f08ccb22a7adc1b32bc26376ad8dfc67f1 |     
    arm      | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/7b14ff11442fc91f217bfe74024f4f7b24845793 |     
    arm      | lrzip-7f3bf46203bf45ea115d8... | NOK | http://autobuild.buildroot.net/results/f12f1db5840fe8a80409c7832ad34804942d69d4 |     
  mips64el   |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/09ffb1198ec92e32879a679a2d4fa211b4dacc42 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/22a75554f0f3227dfe2678fab7fcb5b2116f088a |     
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/25176f60713ec7c33f07533c88d0686a31e5f772 |     
   x86_64    |        openjdk-14.0.1+7        | NOK | http://autobuild.buildroot.net/results/00fcef39beda3af67df79c99f9caa15c0f33d94a |     
microblazeel |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/6021b3f3bed8aee9273a468c6315b6757a3b9236 |     
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4a800a38c863f5aea1296ba036954a622da5c642 |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/582ea0e7ad13a34934ea709ec8b80da062af424b |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/66dac9b2aec07f92ee9ddbd0b3e7cb47eab48466 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/52e41331437a00fcca2a0fcb4c690f26f22b27a1 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/e51dc43904f2bd9e0920c0f972e4f63d475f97e2 |     
    arc      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/629649a81fef2be611edf227b059c0d3dc389e99 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/e6ac4bf3fe6c9b96bb50c94b1139c05a46c3ec67 |     
  mips64el   |           squid-4.11           | NOK | http://autobuild.buildroot.net/results/3740e7bc9a3269d2b45146a3ed2b16b0aa398f28 | ORPH
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/201adc2eedcca3b408f8f230fdd4cf305b135cbe |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/3c924d5a4e1440845849fd9ca3d284050b9fa631 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/8eb469e4ef06c913cb3ee1d7c8c57cab21a10ece |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

domoticz-0f411f781ae4fb4a82... | 1 
          host-checkpolicy-2.9 | 1 
               host-efl-1.22.3 | 1 
             libopenssl-1.1.1g | 1 
                   mimic-1.1.0 | 1 
                qt5base-5.12.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/b41c80671c5f3ae2c7bf6b25d44ccee934a3fd99 |     
   x86_64    |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/0656f9b8e7da025dc95db573897a7f682c62aecc |     
    i586     |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/b99ce74027ef866cc3c72cd35dcd06549dd889b6 |     
    m68k     |       libopenssl-1.1.1g        | NOK | http://autobuild.buildroot.net/results/f6173ef374f3401fe0c27e8c1384a689ad66c723 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/8b95bcd1e4fa935253b596f754f83cb06d87e9d0 |     
    arm      |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/c5e8c50ffe912a45d129a56913d12a2ee9f4a76c |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    atk-2.36.0 | 1 
         host-exfatprogs-1.0.2 | 1 
              host-grpc-1.25.0 | 1 
             host-squashfs-4.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |           atk-2.36.0           | NOK | http://autobuild.buildroot.net/results/b92cb3969c19f564db89a4b752c2b54cdc12fbba | ORPH
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/d43ef4d7e182e3ec3b0582dcaff040451f3fc6a3 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fb255c8f448e63a086da88df7ce48647727d3a0f |     
    arm      |       host-squashfs-4.4        | NOK | http://autobuild.buildroot.net/results/21265838cb8f020867846679c069db0338fb6217 |     



-- 
http://autobuild.buildroot.net
