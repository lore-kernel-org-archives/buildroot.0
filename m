From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2020 06:26:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-05-18
Message-ID: <20200519062700.AF1C0878A8@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-05-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  4  |  0  | 14  |
    master   | 138 | 46  |  1  | 185 |
     next    |  9  |  8  |  0  | 17  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 5 
              host-audit-2.8.5 | 3 
               host-efl-1.22.3 | 3 
             host-gnupg-1.4.23 | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                 mesa3d-20.0.7 | 3 
                  rygel-0.38.3 | 3 
               apcupsd-3.14.14 | 2 
                     avahi-0.8 | 2 
               belle-sip-4.3.1 | 2 
                  dnsmasq-2.81 | 2 
              host-erlang-22.2 | 2 
                         clang | 1 
                coreutils-8.32 | 1 
                 gnutls-3.6.13 | 1 
              host-grpc-1.25.0 | 1 
               libgtk2-2.24.32 | 1 
                   libnss-3.52 | 1 
                   ogre-1.12.0 | 1 
piglit-2affee53f3ad7a96f5b3... | 1 
            qt5location-5.14.2 | 1 
                 samba4-4.11.8 | 1 
                suricata-4.1.8 | 1 
                       unknown | 1 
                    wampcc-1.6 | 1 
               wireshark-3.2.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/2f7e042ac772e747e35a5434a8203475dcd6bd06 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/5f0347a3aa66bddd542bdbb8cd9767af685fc574 |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/acae61ad2e20060cae3beba5e429d3a5f6bae568 | ORPH
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4b4dffebcf77f14c14b85104859497184b1d8655 | ORPH
   xtensa    |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/bcca1360ee7470b3c885a4c45de324a975f51723 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/d80feb6a7d8a5a3809efca57fecb1d4931c9260d |     
  aarch64    |             clang              | TIM | http://autobuild.buildroot.net/results/498dac38b0dd48e9f5202711d589e49dc4d2c895 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/be2ca396faac343d002e8e3997c65aea071cde98 | ORPH
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/6f9381776f78dd209e52a5fb78bea3a890cb17e9 |     
    arm      |          dnsmasq-2.81          | NOK | http://autobuild.buildroot.net/results/65817fd7d1d84e43958390fcaa0b1fe903bfbbed |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/2ec70cb217794f843d95d35cdb2f7b206c0cadcb |     
    arc      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/91c601e5cdb056dfd9aee065afe92c048126b51d |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/a0b3870418b1d217f5fa7f42a37c458cb0d885bc |     
    arm      |        host-audit-2.8.5        | NOK | http://autobuild.buildroot.net/results/c0763cb676984e12315157ed46f6ad3c6fcf2c41 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/cb176db5fa3021b3d5f102ef574ccdc16871a1f0 |     
    arm      |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/47fcf9bceba029accdcf159236addea3cb03f12f |     
  aarch64    |        host-efl-1.22.3         | NOK | http://autobuild.buildroot.net/results/1ba3782f18fec69013b771d448ea2bf7b01d645e |     
  powerpc    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4918028888b40eaf15ec888ba6ef6de25cc1b3f8 |     
   mipsel    |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/4f4beef4a89a2627079c5fc71f925bdd987702bb |     
   sparc     |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/f1bace7db2700d84c98028855f066cb3fa54d713 | ORPH
  riscv64    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/292c6d07ea58ab118d379fd45f307a5810380d28 | ORPH
   xtensa    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/7e46fe5b41a2615c1fce4579701dccd3dd9fc472 | ORPH
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/01bb863d5755d615c4ebbe8255d387e3fcdd8e34 |     
  riscv32    | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/aca662d9fd7052f3b361b731cd266edb3b6c41b0 |     
    arc      | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6546b284cf306a2fde3c69d67daf9aacffa9e143 |     
    mips     | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/db20bb3c11a1a9558a5d8021015c6915f99097c8 |     
    arm      |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/a613a47dfdb5484610b60e487e0c9c61c5b0453c |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/c9a88d3dbdd621a4ff7ada23950d612e4073869a |     
    arm      |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/010ef2c615f3ddc4727c9b7e79d7c0d8defcd6a1 |     
  aarch64    |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/adbfd645f1ce04fe100556219083851b4e9601fc |     
powerpc64le  |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/32ef023ab03c2f608d202275cd5b06c53ae78ecb |     
powerpc64le  |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/e75caf3cec26d4bc6f480950a57004d4624b18f0 |     
    arm      | piglit-2affee53f3ad7a96f5b3... | NOK | http://autobuild.buildroot.net/results/8e16cff46e73d92978a0febc10079f777afff4ed |     
  sparc64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/4f990275c2764697c44615a93d38aa5e92256558 |     
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b811364eb935247ea133c376308670a171ff47df |     
    i686     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/317707f5b25acadc58c4bb459ab7fea0dcd2fe04 |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/c625e1c70251ffea2edd5411bf2d4a4e4d6a97ab |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/81946f883e02495c0da6869d0133182349597b62 |     
    arm      |       qt5location-5.14.2       | NOK | http://autobuild.buildroot.net/results/b58df087e51693563b0d92dd929f2605d9543250 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/140f5b973daa2e7b1a55a5fb97ae222b29a71cf9 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/0739c5dc262021c55d27782c54773faebe8f41ca |     
    arc      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/d96ac9ad54365ae616e9fe399c403a5c14cd8a8a |     
  mips64el   |         samba4-4.11.8          | NOK | http://autobuild.buildroot.net/results/3db9cced744b175a3ea52939d2ba720d5d6fd5ed |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/afcfe1d644aaee804bb340efa4c7f8fa9d2a8c24 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/743e02d673f6b4bcca0dd7fa3ce1bbc13aabbbfb |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/50d42dc40eb99a679bb4c8f7cab1efcd6143d2a4 | ORPH
  powerpc    |        wireshark-3.2.3         | NOK | http://autobuild.buildroot.net/results/38d36b3997e5d57a71f44f8bf712e7ac1180f26c | ORPH


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

             fontconfig-2.13.1 | 1 
          host-checkpolicy-2.9 | 1 
                host-dtc-1.5.1 | 1 
             host-gnupg-1.4.23 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/0b031685fac40f56b59a2e0c4bd51a2be649bf07 | ORPH
    arc      |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/5e2e5ae4a9277a4260e1fb9483da602eba57c801 |     
   x86_64    |         host-dtc-1.5.1         | NOK | http://autobuild.buildroot.net/results/4b7ebe0130ab1352abe302541f06df555516f49f |     
  powerpc    |       host-gnupg-1.4.23        | NOK | http://autobuild.buildroot.net/results/a6ea015de2ac124c61c7cb696ecbff28d5c66b44 | ORPH


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

          host-checkpolicy-3.0 | 4 
         host-exfatprogs-1.0.2 | 2 
     python-argon2-cffi-19.2.0 | 2 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/7e2c37fed5464f4ab72e9a593fe9569beb227b72 |     
    arc      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/5261672842cc9bba14d9b093ca10380c8d04e015 |     
  mips64el   |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/41f2b7fb67bc2aa08b909a0f00bfb1e3bc51a6d3 |     
    arm      |      host-checkpolicy-3.0      | NOK | http://autobuild.buildroot.net/results/987e3c514150607e80c31cea49cdc70259a71770 |     
  mips64el   |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/9817ab3b3afa3d633f30e6facda4bec2f1a0ddff |     
    sh4      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/a8b726dfbe84c6a41840cadafb6fd97075f586b0 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/27a65696e6e6ae92dc3ff9875218fcf1945b7fd8 |     
  mips64el   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/426eece9658e77a5bc5417b831d4b59176b2f7a3 |     



-- 
http://autobuild.buildroot.net
