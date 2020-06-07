From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Jun 2020 06:27:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-06
Message-ID: <20200607062714.0211B869B4@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  5  |  0  | 19  |
    master   | 89  | 44  |  0  | 133 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.10.3 | 4 
           host-wayland-1.18.0 | 4 
edid-decode-188950472c19492... | 3 
              host-grpc-1.25.0 | 3 
                    brltty-6.1 | 2 
                   ethtool-5.6 | 2 
                libdrm-2.4.102 | 2 
                 opencv3-3.4.9 | 2 
                 xvisor-0.2.11 | 2 
               apcupsd-3.14.14 | 1 
               apparmor-2.13.4 | 1 
                  assimp-5.0.1 | 1 
                     avahi-0.8 | 1 
             c-periphery-2.2.1 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
 glslsandbox-player-2019.08.23 | 1 
                 gnutls-3.6.13 | 1 
  gobject-introspection-1.64.1 | 1 
          host-acpica-20191018 | 1 
             kismet-2016-07-R1 | 1 
               libgtk2-2.24.32 | 1 
            libnetconf2-1.1.26 | 1 
                  ndisc6-1.0.4 | 1 
        python-markdown2-2.3.9 | 1 
                qt5base-5.14.2 | 1 
                 rocksdb-6.6.4 | 1 
                  umtprd-1.3.6 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/021841657a4420ec637af42794b7043294fe0c1e |     
   xtensa    |        apparmor-2.13.4         | NOK | http://autobuild.buildroot.net/results/896e08c2ee7ea99c19dd6b767a2fedd15b212837 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a13f5298a4ee69fed1b1cdc7f50b3d0b5cf2bf29 |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/39ac6cd3ace20d91bc7a3bef94839cd12743a7e6 | ORPH
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/7c5278c0ff2b2d8f88803e256803b31a75904efe |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/beecb564231fcdad520cb7818be0339df426cdb0 |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/6bbc4de3f857dcb7ff5e6f9fa1441ba4e0af1338 |     
    i686     |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/ced764ed25629eac0cf4c45ce7dd6ae0a10368a7 |     
  mips64el   | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/71e4a50542c4551797f1d0404d27244612b427d7 |     
    arm      | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/369b1d828f8f08912b212e9e13329188687cde59 |     
    arm      | edid-decode-188950472c19492... | NOK | http://autobuild.buildroot.net/results/a6174d9fdea0f37db4a1513a8cca201ba221cc21 |     
    arm      |          ethtool-5.6           | NOK | http://autobuild.buildroot.net/results/7d5bbb560d9be86d800004b0d62469ff321ed3a5 |     
    i686     |          ethtool-5.6           | NOK | http://autobuild.buildroot.net/results/ce233c3eb6b4384c8fb9749802a0afe223b13b39 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/9afd652da03012ae3e526100dee7f7ce9e0c155a |     
    i686     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/52640fb027fb5b62ee65d9a395d190844d0a3657 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/a6d7d59c5f27a72736fd90e21c0b1eada030b13a |     
   mipsel    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/db68c9603727ecca92eff1b5149e5e427cae8e6a |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/2a91d42270defac389fc448a79d1b86449cabdfa |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/d176385422c64ad94c0d625e0372508c8da94d92 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/d569d17b6c1bcc6346a6a1c7164bcdd278428cbb |     
    arm      |      host-acpica-20191018      | NOK | http://autobuild.buildroot.net/results/fe58e834bb67a9aab640e1d913588b47eaf7e4f5 |     
  sparc64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4cfc10b87f603c438b4c60a38c669df94e712053 |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/01c60253a0b607fb72a60a5c309e65ec1857c687 |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9c243ef9b7153f79ce4f5df847071be8150161a9 |     
   xtensa    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/2562f176b665a875ef4fbf8a95e1d33a58b6cb5d |     
 aarch64_be  |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/d74f491c985d0a7d3b857a00de609984f972b54a |     
    arc      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/f619b7437898977c7be86da9f5eb0f6dd1500f3d |     
  sparc64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/d6edcc98ce86962926614f77e0d0683717710d32 |     
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/70e9163098d7ea2a82ee990cb79c402574467569 | ORPH
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/9787e2e0be94c324bad8ed3a721fdfd2fe4d031d |     
    arm      |         libdrm-2.4.102         | NOK | http://autobuild.buildroot.net/results/43d594e2706b93ad1b160f3d12f24221861190b4 |     
   mipsel    |        libgtk2-2.24.32         | NOK | http://autobuild.buildroot.net/results/86c6f55e0bd1a0fe3b70c9e97193aaad94d72a7f |     
    m68k     |       libnetconf2-1.1.26       | NOK | http://autobuild.buildroot.net/results/bb36849bb78c49a22a2b8b39df25931657d14ee5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7b7beeb629167e714099c3cb333325cc1ea3cbb8 | ORPH
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/45b394e965c5a64e1b9b45faeb0f0c2861b3f223 |     
    arm      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/e2195ec441376e34b3249ea9efa86985a64c4b4f |     
   mipsel    |     python-markdown2-2.3.9     | NOK | http://autobuild.buildroot.net/results/85091fbf9812e77dac122980a2996eb27754fd04 |     
  powerpc    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/60feec17dd5464b871d6bd1a8a02171eedb28d32 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2e3e740cda8742849c5bf4636047dc524f4d0c9d |     
    i586     |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/d283dfab5f3204024b61a5a4bd1e3513831317d5 |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/357aa0241281f075ad8d307b765705a0d96ac937 | ORPH
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f1bfefdecae9231b521757604eeb7de04b70eddf |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/ee574086142495a96e3815f4629e865eef490608 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d0d9a05005a217c2d4c1e657bd4235768fb7842c |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-checkpolicy-2.9 | 1 
               log4cplus-2.0.5 | 1 
                 mesa3d-19.3.4 | 1 
                  ramsmp-3.5.0 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |      host-checkpolicy-2.9      | NOK | http://autobuild.buildroot.net/results/01a0c39ffc8886b97c73fd5868e8c83897a1a6a7 |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/3a2dd9f9150883da77e06b7a24f88f3e08861dad |     
  powerpc    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/d766c532ed0f973b64fd4c43e31c8185340b8382 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/b57775536f531b20e245e67a3796895aa65c1f3a |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/ce14647f2afc694fdf107389cf481a36aa9ce0b8 |     



-- 
http://autobuild.buildroot.net
