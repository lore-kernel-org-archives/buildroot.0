From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Jun 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-14
Message-ID: <20180615060020.19CCB2087B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   1 |   0 |  21 |
   2018.05.x |  15 |   0 |   0 |  15 |
      master | 175 |  89 |   0 | 264 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 1 


Detail of failures
------------------

      mipsel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/94935c3917bc3fbd0f94e2bd5fb6a2e0c5cdf0ae |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                linphone-3.6.1 | 20
             freeswitch-1.6.20 | 15
          mediastreamer-2.14.0 | 13
               asterisk-14.7.6 | 10
                libtirpc-1.0.3 | 6 
                  autossh-1.4f | 5 
                qt5base-5.10.1 | 3 
                      x265-2.8 | 3 
                    host-rustc | 2 
                 libnss-3.37.3 | 2 
         host-cargo-bin-0.26.0 | 1 
             host-gauche-0.9.5 | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
           modem-manager-1.8.0 | 1 
               mono-5.12.0.226 | 1 
                poppler-0.59.0 | 1 
             qt5location-5.6.3 | 1 
                  samba4-4.8.2 | 1 
                   tor-0.3.3.6 | 1 


Detail of failures
------------------

      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/23a92815a52fcf2a18e4b76f0bc39a7de5934872 |     
      x86_64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/fa6c407481cffadc16095e6b481c365ea9751d57 |     
         arc |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/6f951fbe8976acc8dfe5680d10850790a75b1125 |     
     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/4c6916f075b05ee0a91713779bae077f2fb4ebce |     
      mipsel |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/b905791008e8ab91ec275b4d9a78914f687776cf |     
       nios2 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/303501cfc7080b06a328fa75a0b06c94de563be7 |     
 powerpc64le |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/91e0c1ef76b2ea0e60a6cbe90f0a543aaaa45493 |     
    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/6c26ac135659538b5eab6bfc49e1fb12597326b0 |     
        mips |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/21d50fff82695a5562b29fba71e263e404fe9d4b |     
    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/4dc936f966084f3d1efd4cb2fca51501d1e34eda |     
    mips64el |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/b1546bb3e861c14771bdd03cda9ce2e9176a2069 | ORPH
     powerpc |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/f0ae62d0ed6bac011c507cfea7cd7157671baf39 | ORPH
         arm |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/25d681f9df22c07cdf5a6b8756bfc2d5ecf36247 | ORPH
      mipsel |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/aec24bcae07001dcf39128e0b120603da663b5ff | ORPH
      x86_64 |                   autossh-1.4f | NOK | http://autobuild.buildroot.net/results/22052d73a69d915781426e164d0bc02bc8a94ef3 | ORPH
         sh4 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/88cb0fa3457310a498ac1e7f16274db1ff2f25b3 |     
         arc |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/3f63dcfff1a13e771a4fe45e0a4a215d405367f9 |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ad8fecb12e7dff38d375c44bec46e3b90edca614 |     
        m68k |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/d63e4cd54c4b290f94a1548c23a4ff47829a5323 |     
     aarch64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/cdea506a98483115dc7dacaaf11707164b0dac7e |     
    mips64el |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9c9e0603e1fac3f98acdc5f24453ac8d57b855d3 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/57de220b23c9be23ccf92f29fceca55be3416634 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/abef3d9e10097caa8610f7fa353d241950959b5c |     
     aarch64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/9709a6eca998713d644a1f0ac6d1fc3c924bbdb1 |     
      x86_64 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/ce789bfacd71620c00d7061d653785423893b963 |     
      mipsel |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/05cd48c932c58fab19fcf5fca119b9c180103025 |     
       nios2 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/4e6dfe28a718e5d7a11cb13b4b785907e4d0c6cd |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/19de8445aaa52ee0c97cc3a038fd6bb77eeb117f |     
         sh4 |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/09f81cb4a3d3009e79fdb3173d1f2b3371e98b37 |     
         arm |              freeswitch-1.6.20 | NOK | http://autobuild.buildroot.net/results/283b979437de280ac018da97b4c08327a2b81b41 |     
     powerpc |          host-cargo-bin-0.26.0 | NOK | http://autobuild.buildroot.net/results/1df6d4207f89dac4afbebad0c5138a64b393976e |     
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/e587a1cc3a6500bea684cb5f33b64a5bceacb6cd |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c9b6e98185addb9ec76b34e41feeab762728518f |     
     powerpc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c3cbdeb81705f5ed9506e8ed9a7afa9ae11e1ff6 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/a5833e98bb027abf1b40b0df11d9d6766e8decb5 | ORPH
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/29cd68b2f21e145f72c7e5bde594c65b0b75c6aa |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/7e650ab2c1f87d02bec464a6a4345734a585e47a |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d7e3d0cbcbf5cd2be9475de17f7fb9a074cbf0b9 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/87dd577680dffca8541b46a5beabcc87f60ca193 |     
      x86_64 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1fcc8425d09eb531eeddc074cf1b1d39daff158d |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8e54fff725ff4faefc9a492d874df6015fe09644 |     
        i586 |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/ced1a84caa91fb27a7bb358dd6898e5f85d89070 |     
         arm |                 libtirpc-1.0.3 | NOK | http://autobuild.buildroot.net/results/8cbbfb147e085db35b7b85181b51080c6a6bad6f |     
 powerpc64le |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/356a1fd29741767c96ba812cd64940919969b132 | ORPH
 powerpc64le |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/4b55549fd0ad45c3885eeb045d97d28fa74d5894 | ORPH
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b2e49db29a345c1cf19df9458daa91fb382e8f08 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/5fb0a61aa8a1e2ad238e5f2ab54ab077e570e2c3 | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/223a1b53bd0c4f654d348efd34de9cc369d4fd68 | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/529a9e82c5637d910b8fb4a1207e7eb4ef4f227e | ORPH
     sparc64 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/3d038829b37416afb48e9c4e835f23808a8e1ca8 | ORPH
        or1k |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/6dbf23592300cd0e49c6d2c0cb2e13d32e79608b | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/28e3334bf7cbad47d88e8e858e8b8fad1e2f4c5a | ORPH
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/89e0dea368b572433880d8d610843b00667ce215 | ORPH
         sh4 |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/6f6bfd6a8311de48d7dbab114aea75c15c6015ce | ORPH
        mips |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/51ba421df58c9d2e5c400a2571fb8ce5bd1b1057 | ORPH
        mips |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/ade07d5ddb59f843b490e2c30f8419d2f0231646 | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/7fd80a5c1ed3687a3b2c877c7644f4ce832589da | ORPH
         arc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/07ed8fec61ee13ddcd9a2b8fc2394985af61d102 | ORPH
      mipsel |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d2ac6093810dae160ca72f292056e2b633f302f3 | ORPH
         arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/98863df7aaaa56ca85dbf6b1f44b787051b67b96 | ORPH
       sparc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/5419d53d90bc53930d945e609394bda9da1a5d86 | ORPH
    mips64el |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/1076bb52d9bbde9b5d2cdd9338ae5c7dabf2d71c | ORPH
      xtensa |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/d3a558216ae8129aedd0be0222c0dced2a134616 | ORPH
        or1k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/a1ea793d614d16893891e5ee9d6e25d8fb4083fc | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/3b07aba15054823c3b0427829858b959ec97a383 | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/a18c9c38082cd3cba84fb3d6986928693587374c | ORPH
     powerpc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/f4d9f6340139383b46ee09dda9168748a65e6b38 | ORPH
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/4fb4cccad21a7580ef2317d8bc06f320a5aa5ecf | ORPH
       sparc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/e0cb1264851060815be4feb72dff91cd8d3c7024 | ORPH
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/2f3de958469dfd4ad5be06ccc315d223a92509c7 | ORPH
       sparc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/b98c8e51508fa96121bdde4644bebeb9010a9a9d | ORPH
     powerpc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/62d6393ad3befbbaced6d23ffc322894bd479721 | ORPH
         arc |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/2f85668b8efaa4fdac85a32d3258d58228cbf974 | ORPH
        mips |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/d9bd05bb32654295782ce65b844b0b34260fdf6b | ORPH
    mips64el |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/c1896cfe1b23ec4ddbd380e9124fbdb7d625b1fd | ORPH
      mipsel |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/1ca41d59cac3c17e39dc05ec33da3b8b95a6a4e3 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/7db80b5a22a7f08dd93607eebb92e97c4cfda19f |     
         arm |            modem-manager-1.8.0 | NOK | http://autobuild.buildroot.net/results/9f6859f1854d94d3caba7b5c24d9ca6a14622042 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/81eb988303c28f9220b5f598964404994963cb44 |     
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/1a56f3cafc94b567321eb7b83ad1e7c461dff0ed |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/f3b66e19a6a8d46a56bed454c8947f75f7f8384b |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/6eaff72bd6e367337aa5ce4a3afc5acfd87f1022 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/63145eef205daaf875979f489c1ff8664d3a75f4 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/ba618403753b1afdee87ce0f4448dc0a02c56579 |     
         arm |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/dd2d1218c3165b054b89824a4a063cda7486cfef |     
       sparc |                    tor-0.3.3.6 | NOK | http://autobuild.buildroot.net/results/0f7107d0b703223f567c6749722bc82c81a04d54 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/c98ac0247479ca88a37748d28851f875f9c3a004 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/b1d69fe7a7c5120e3b4b00d9e8396ea2d3674c64 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/bf0da72504e733789b701b2b927257ca86564e7c |     


-- 
http://autobuild.buildroot.net
