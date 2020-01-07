From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 07 Jan 2020 07:17:12 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-06
Message-ID: <20200107071717.90FEE86931@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  5  |  1  | 27  |
  2019.11.x  | 18  |  5  |  0  | 23  |
    master   | 129 | 90  |  2  | 221 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libva-utils-2.6.0 | 20
                 exim-4.93.0.3 | 18
             freeswitch-1.10.2 | 5 
               libsigrok-0.5.2 | 5 
                       unknown | 4 
                libselinux-2.9 | 3 
                   tor-0.4.2.5 | 3 
                apr-util-1.6.1 | 2 
              host-grpc-1.25.0 | 2 
package/docker-engine/docke... | 2 
               protobuf-3.11.0 | 2 
                  snort-2.9.15 | 2 
toolchain-external-codesour... | 2 
                  zeromq-4.3.2 | 2 
               acpica-20191018 | 1 
                  apitrace-9.0 | 1 
                 augeas-1.12.0 | 1 
                        bullet | 1 
                  cc-tool-0.26 | 1 
                     host-llvm | 1 
            host-mfgtools-0.02 | 1 
             host-pango-1.44.6 | 1 
         host-ti-cgt-pru-2.2.1 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
               libtheora-1.1.1 | 1 
               log4cplus-2.0.5 | 1 
                     lxc-3.2.1 | 1 
               mongodb-r4.0.12 | 1 
           oracle-mysql-5.1.73 | 1 
           python-bcrypt-3.1.7 | 1 
                 ripgrep-0.8.1 | 1 
                      tio-1.32 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/f3d734d9bde708271958237bef85f40a69461c37 |     
   xtensa    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/51fa69066cfdb745aa37356febab96f81cf31a17 |     
  nds32le    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/ce5be3aa32b0f5bf3833465169ad90dbbecd3a1d |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/2c3ed0f28e826611228f7837ebbd9eb1f26c1ea5 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/ff41593dca56841feaf146250009fc0de66c6c03 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/f8241bc6502784e95a6b60fcead33b20cf330086 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/a41002822f1676437aeafc152ba219d9a49da435 |     
   xtensa    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/98fc324c77585ea2dcd118b8f3707b90c1c4db9f |     
   x86_64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/aad98aef84f996048b3735d320d7a74530faf01e |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/0d232558e1668b329b045ab58dd3a03d09a51e27 |     
  mips64el   |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/6586641b2294a2d2993bb2d4897b823b58b249d4 |     
  riscv32    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/1a795581a1edee15f0cf889256ad4ae67302cb7e |     
  riscv32    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/90812c5848675aaa03b1f4025d6cc211e070cd63 |     
    mips     |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/60ebcf5a1aeeeb152fdf7c2dfca4d82ab1da2f62 |     
microblazeel |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/3e5475bc4023dd4d48ee797eedb790162951a5f9 |     
    sh4      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/8627ed19efc1eac3bb6ad5da2b4187055133b752 |     
   xtensa    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/a4b1132dfb97b90f3bd38ac232aa2b1a82cedcb0 |     
  mips64el   |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/09bd4b2919c90a6ec9bc194848343936e75c14e9 |     
   x86_64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/0d947999e1a7c4a34c3d834ab7ac66446d101363 |     
  aarch64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/8c2ba6f747b70fa844f99ae8d20f3b476d211744 |     
   xtensa    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/ba4827c31ab2df9a80966f163f59a68358d671cc |     
  mips64el   |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/ca3d8fbab6a9f69c8287e9f4b67fffcef216b97b |     
  aarch64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/ce8ab0c3fae2a7f163e84aa179831e341f540381 |     
   xtensa    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/49735f7370a24870922192d474244822c341562d |     
  mips64el   |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/0f4263278ef87ac04335478b7e245015fa0124bb |     
    sh4      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/3163144d734e091cc6bf0376fbdb6f98cdaf3bea |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/8bd1ad8e88037fbd59a7fbdf21ded7f4b74a099b |     
  aarch64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/afa70e04af9a0e7c121977806803eb3f1ff9708d |     
   sparc     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/c36d6064b2c4d9a7d8e00ec014b3780b81f91f34 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e50ac6fe083b6da4ded7997d506fd379f2c9ea2d |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0babeb0dff9d2500b35fa53fc955a159dad58e45 |     
microblazeel |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e6f4ca165c4aae0edc61e50d822deb6ad3f1aaee |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/81d0837047d603adf0f50271e5834447b21c699a |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/fcfa843f8e39484fb1d457d1d44748cfa7ecfb11 |     
  sparc64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/aef4db22bfa62886faa9b9c023d1909a672d44d9 | ORPH
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/aff2dabacf7cb4ab5a78d565c409d4f56c0385d1 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/41bdb693e6157d0f998b60653164fc0fd121a06a |     
   mipsel    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/68ee17499a5a8935c76178ffe8931ea721caf8ae |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/c001584cc846415eed1783736c956e9eaaabfdb3 |     
   xtensa    |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/d2d6474aa9781f89b784ad9f7b4220057026e170 |     
    arm      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/77a8903320b5a26e532300a518999b75e77f9bb3 |     
    i686     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/005a16e63518716c6e99c74c618d01be453c76d4 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/c9ef027df8696445ae95aab4ba9b17e8a166bc90 |     
 powerpc64   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/5b9e4bba649da6f4c40826a2e9878eef7286887c |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/8a09f08efb3cbaad001ee1a05b8caa30c9dfe7c0 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/5bd3d178b98f9dfb8e2b4c553275f26114802a47 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/4ddf7a33161dd3453c6152dd847961dcffeda5fe | ORPH
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/85bee83c52dd486a1c4c3635ca9d3d63290c073f |     
   mipsel    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/e0b271c4c11751072ce2b45bdb0496812457c452 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/3d6bc46553c0bff39972a780f8189c35fbd3f7b8 |     
  mips64el   |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/0d8dbfb70b8fd26e10f6a80a7994d2a486dc6669 |     
    or1k     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/b3784c9e4352dc27bd013b4ba6475123bafca811 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/65dd3028759769bfb829f2e1bf2c2abdeaf41dea |     
    i586     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/632135402721dbcf54d4ccfd2fd89fe4b3eaaa44 |     
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/fa5a3cfb6f47245d7ce48a3259aa4ac9ae537350 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/0f427c5088da583969cf2f50695885f47b450d2a |     
microblazeel |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/dd2b8c76fdca24f767d419b9107bd8b42275da29 |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/b8df965598792d930a05f2e7fce2af0440b9ea38 |     
   mipsel    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/2f12bf60647e371f2e137f81518422bfac806ec2 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/aacda2a8a318d7e060183da0e65d89c93ecb2dba |     
  riscv32    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/095832d1b9b353408bc1b57f1ac4312255586d35 |     
   mipsel    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/6a52779b57cb40746aa00e4c3268cfe5e0b1de4d |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/70fd6609fffdaa07be583420dab067da27b7d505 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/f0a4ee6f5ffece5b23071d4df258d5f735278e99 |     
   mipsel    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/dad50b416aba3a79ea857b8ff2e1690c619624e1 |     
   xtensa    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/fa923b896e1d5ece5b2e1c5e428302c2590327d7 |     
   xtensa    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/addfb704daedde1c7926a815c8ff152507982e7d |     
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/74e641cdadb219451fce2fb1553d625df2f5ed52 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/db7bce7cac068e70bbf729cc05f2f1a67462e857 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/546df9e1f4d9187835d7a0b499f5dc2b23d96836 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/7d536c09f8f3b4ffbe00b6f265178a9d8d09d8c6 | ORPH
    arm      | package/docker-engine/docke... | NOK | http://autobuild.buildroot.net/results/3d1ccae5f3e4eeed9a3bf2eb29fd194b868bc0a7 |     
powerpc64le  | package/docker-engine/docke... | NOK | http://autobuild.buildroot.net/results/23e8c0255ec8735782883666f30fe1e0c4817279 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/59f7f8845a3a5ea0e0c1fd304301077c86347d97 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/8d58154d0d0b73b0f3489c634cfaf6838835f484 |     
  mips64el   |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/779fcffef62f0caf6fe6a525c6c2e80b65dbe8df |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/27d363b24f68dddb5eaeb3f1360e4837c6261472 |     
  mips64el   |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/f5f6e9d83cd04f0e7442e03935b69da01c0fc8f5 |     
   mipsel    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/b6f30f78b9d706f2dda8c1ec51c32eb9df2c0486 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/64d991041eff131bc0d0864bd7dd8bbd77744b28 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/68e1eaa8197f1271b53fe447d8c77eef19f14454 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/9cefb5fe3c0aac67afe86a1700ec219286861b91 | ORPH
  powerpc    |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/4b022784ca763fa3a8831aecd074eba71cf1f16b |     
    arm      |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/454309539101c55a572c12c699cf3542dfb21637 |     
    arm      |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/4a59a5c7ea76e22e3c5869f04748cbcec32f5562 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/f080610e0619e646790d95760286a3bb81ba3419 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4916865bfce44ec04125d6d1d8fdc83cdd7a6a12 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/4ea11468659529de11b7842d315339a8ff9d40fe |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/46acfd952b8e7ec35effcb4f42a6b6ecb8a385ec |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/ee004727baff8022e08a8d27d35439784323de51 |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/877ce6d60dbf19510b68be15d22e569960648331 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/57588352978e02a41797c038087bde7d40575885 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 2 
                   glm-0.9.8.4 | 1 
                     host-llvm | 1 
                qt5base-5.11.3 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/9ecb7afc1ed855cc6b75088126f7400f9ba6a345 | ORPH
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/5c2a3d3d94edb7f0af7be8a91db8ba556334e421 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/30572c793cb13585e6c3a86a50cac77e1fd38f09 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/392044605d87250d66754e0503068025cd009a4b |     
 aarch64_be  |         qt5base-5.11.3         | NOK | http://autobuild.buildroot.net/results/674d00639e57ba367d4158b2b344753aba754641 |     
    i586     |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/0c14fa0a872704e5f97701c5179d5a63af65b173 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                  flashrom-1.1 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                    quota-4.05 | 1 
                    strace-5.3 | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/be73c4cb83ba08511d301b9a9539ca625752ed7c |     
   x86_64    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/44799af1785287c8bbab46226f78977a68440640 |     
    arm      |           quota-4.05           | NOK | http://autobuild.buildroot.net/results/4c4010edd1f2e037dadc0a132d09a208acb7a015 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/a32bec66aa1baa7619b230a3c51d0863de6a0584 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/d684de11f58e010713c63fc0a5a9d11c9f52d30e |     



-- 
http://autobuild.buildroot.net
