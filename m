From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 09 Jan 2020 07:16:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-08
Message-ID: <20200109071639.4D08685DC1@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  2  |  0  | 21  |
  2019.11.x  | 11  |  7  |  0  | 18  |
    master   | 140 | 103 |  0  | 243 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libsigrok-0.5.2 | 17
             freeswitch-1.10.2 | 14
             libva-utils-2.6.0 | 13
                apr-util-1.6.1 | 8 
                 exim-4.93.0.3 | 8 
              host-grpc-1.25.0 | 3 
                   libnss-3.49 | 3 
                  zeromq-4.3.2 | 3 
                haproxy-2.0.10 | 2 
              jpeg-turbo-2.0.3 | 2 
             libopenssl-1.1.1d | 2 
                  snort-2.9.15 | 2 
                 augeas-1.12.0 | 1 
                 binutils-2.32 | 1 
                bitcoin-0.16.3 | 1 
                   bzip2-1.0.8 | 1 
                  cc-tool-0.26 | 1 
                    flex-2.6.4 | 1 
             fontconfig-2.13.1 | 1 
                    git-2.24.1 | 1 
                  gmpc-11.8.16 | 1 
      gst1-plugins-base-1.16.2 | 1 
           host-doxygen-1.8.17 | 1 
                host-gperf-3.1 | 1 
                 jsoncpp-1.9.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libgdiplus-5.6 | 1 
   libpam-tacplus-1.5.0-beta.2 | 1 
               libsigsegv-2.12 | 1 
           libwebsockets-3.2.0 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.3.1 | 1 
               mongodb-r4.0.12 | 1 
   openvmtools-10.3.5-10430147 | 1 
               protobuf-3.11.0 | 1 
                       unknown | 1 
                    xen-4.12.1 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d95ea2827051799db0a2de70466981af220eef66 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/d220409d9445fa000987ac183b5b37a1df91bea5 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/fdb9483b06a1dfa0806df22fc795819ba6da8a38 |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/ca5521ff5261fa5d7e8fef55dbad8d9d60d80fb3 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/24c1b7b4664a690d4def476377191a83640b146b |     
   nios2     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4d2c056cf8fcbc49d3ac61e41e42ecc99ed79b87 |     
microblazeel |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a4d7f8a4ca572e3d0b6bfd7279b60b444ee7a018 |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/b7001ffb65270b099af6f68d15f6387aae5eef80 |     
    arm      |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/7f482aac233ec15d113ffc5400e2ca4dfacb4d45 |     
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/ef8f96808648e0c7b2eb1e3f8e722ee4502e144f |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/8f557c0d47891ea7dcaec7a1a34b7db6dc2e26e2 |     
   nios2     |          bzip2-1.0.8           | NOK | http://autobuild.buildroot.net/results/10e9d20c7eeebcb5ff7901e5e042be97007e9788 | ORPH
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/2dc398fc5ab27564374908b5ef83135b6265b79e |     
    sh4      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/0bae264e5a5cad858b7332bfe866b91962fca163 |     
   x86_64    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/5ea6e87d0239a0b053325526de5aa29057777266 |     
  nds32le    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/b7c26e2291cec805c54e8fa744b57f7135a6dc55 |     
  powerpc    |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/b92233430bd3c909932fdead1ed04c28b43f3156 |     
microblazeel |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/fd016cc248d394ba34b3984a774b3c97da1f17ab |     
    arm      |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/e04bf9f791a3601915b9adac24013194070e1ac6 |     
    i686     |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/457a4e26ca20be36c2f2067fc9142c4dd944f6c5 |     
  mips64el   |         exim-4.93.0.3          | NOK | http://autobuild.buildroot.net/results/a7c905193bf86e8cb8f50b30419a5109a3390d42 |     
   xtensa    |           flex-2.6.4           | NOK | http://autobuild.buildroot.net/results/7848040e9e97533834dde1ecc146592645c80fab | ORPH
    arm      |       fontconfig-2.13.1        | NOK | http://autobuild.buildroot.net/results/b15cd29601018855ba6ca7f576c315fda423dc03 | ORPH
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/ab514f9d1ff57284321f3f9b752cd2baf23681ff |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/a25d511434bf4faf5fda8e5d2133625d0e5b8d4d |     
  aarch64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/832938b55f930b4f872dafbd562ea317fd52f3cf |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/99e4bb451e1642a3c25b6ff5787c5be1fcd50261 |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/b6ca0fd38a26eb118423fb098e394fecd7775ab6 |     
   xtensa    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/3079ee22daecb048826e6cfe8fb3db6e1936e574 |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/502c9504df9abf8f04cc45a05bf61ec3ef1c39b5 |     
  riscv64    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/8ef9ce01b0e09d2b7f61634bff2d4e068179183b |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/b2921e3b7f6fe2a0ff97d24074cb80208510999b |     
    mips     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/c77ec1f45d38b22fbd61440f979544b8725adacf |     
  powerpc    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/38496725c2b5b7bdeec2038f79e01d3e47322563 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/86cd2749686084b572b357a7df7d7e85a0bfdb0d |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/f4acaf3749e89b3254dfdf24a9c219397dc88dc6 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/a6a2af222407484fbe8e00305d27409a3d766efd |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/12f97bd06cf5e974dc2539e77a9e4a682a37adc2 |     
    arc      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/80a5ca918976d0c39c44746b0b7114dc7979ba09 | ORPH
    arm      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/42614a976bbbf050b20ddbe894506f92903605ac |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/3c4be97f0b010aac978cb6a6a01975ac0b9193c8 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/8195057eae615384a7da2c2107ddab7484ad3f92 |     
powerpc64le  |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/4601a74902e66a254dd2d32586e431a1809d7250 |     
    arm      |         host-gperf-3.1         | NOK | http://autobuild.buildroot.net/results/260eff27527ff2c56acb7fda8c7d096d92f1eefa | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/485d12a1538ddd298adfa50a4a641bacd0138d4a |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27e76489115fb66d2a76ede4b7085d7324e00764 |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bf8287df667932b4af1526b74b623e9afa01602d |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/fb661dd3c86eabfae4d4bbf312e3d73fe8fb4aa3 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/8a4aa48051335793487df6f8d8a301864b52fc97 |     
    arm      |         jsoncpp-1.9.2          | NOK | http://autobuild.buildroot.net/results/f816229b835f61fa3e4c84aa659d30f81191f369 |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b0d0b354ebb74328a0d63ac64f2541c4d4210e21 |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/21f014c3c32a19a0223a4fb7d632aa599c1f2ff3 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/95a483870e2785ff9f20c4e6981bf4b43b8e7b43 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/935b1bbf0dd15fce77448fa0dddab1cb1e600c9b |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/cfa946973dd3acc60d4816273b8a64512da49737 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/03fe3b4a1d2185a7528531c301610ba20221cc95 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/552781c4a3c44656a9fd8aefc06506784c78e3d4 |     
   nios2     |  libpam-tacplus-1.5.0-beta.2   | NOK | http://autobuild.buildroot.net/results/cf15b09bd7501c017a4e8cf9fb80857197d4a433 |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/e30db3689459700668fcc3298e111fc172989ed0 |     
    arc      |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/d604181e947506e4f9fcf99992b9fc1c6bcfad89 |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/c79e040cdc4ab7bf5cd7cf31726152a41f2d0a7a |     
    m68k     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/7f42d490c2c087926fbd5e1c69bfd1f8be01b36f |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/b58d707c1beca319a36f041048110da019230700 |     
   x86_64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/e8dcc78ad4175498370629aee913c516d5c764d9 |     
microblazeel |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/dee393a6424bfe3f829818475935ff4a12a32201 |     
  riscv64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a68ad71a914099b89073377c24bca84ca3e93608 |     
  riscv64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/6476d131d971202bf8b1325c0f77e324d4274d11 |     
    i586     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/396b0688b4dd858a58aa1ab678bac67ac071f4c3 |     
   nios2     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/cd111a3b2351d2165b56210c9d7a45b27c7e54b9 |     
  aarch64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/58655799450f647460b44bff2e370cd0a97970a8 |     
   mipsel    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/9a34ecf0aba2b985b42589a3a38a84e00fb907da |     
   x86_64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/d6bcf7120c7acebe03d197ff42f177849361e8b5 |     
  mips64el   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/fad118f13c0fe01b4a03e6e76f4b1df1eef863d9 |     
microblazeel |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/783478d4b52f8f055cbcb1b7a70238c039497bba |     
 powerpc64   |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a9cd06b8e1911a4d35b41790c51d2ee6c67693e0 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2945b56a6b8c6a4d228fe43a01baca266c698c6a |     
  riscv64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/ce42857e962d6bbd952dcc47a279d2edcddb2eb5 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/caf1d353102e9559a29a16a4641f57b4f40267c4 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/7b1173eca97aecf7336f6123dffaa636e19ed537 |     
   sparc     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/01d2b255ca26adee7e01020f50ac471e31b99dbf |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/0e3a8719a649117a98b1f6f186bda2fb9c8f6fb6 |     
  aarch64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/cd3601baeb9bb31b050cde6d2aedb52d9a2190f4 |     
    i686     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/9b6ce8ade7f198727d200eb4531408b48b80f271 |     
 aarch64_be  |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/1e57549bd75867fc9171e8fb93399da082da673e |     
    arc      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/2df489a94551005bbe9e1f1ac7f661b949cae0a8 |     
  powerpc    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/a43980bc100ca05cc6a167b8d16add26066d447f |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/7b8dee0d3af1afe32d371fdfd2218e8206bcd2cd |     
  riscv32    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/6e599c728b2fac857b7c34ee0e9afce4bfefe257 |     
   nios2     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/75f7e3cdbcc7df98e5e5b631728f82453617a7fe |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/80fa6032a5f396a63d6133d98091b7afdc485e67 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/10d2d28d8192ff3ad086bea6df2731637720f8d2 |     
    or1k     |         mesa3d-19.3.1          | NOK | http://autobuild.buildroot.net/results/b8d9b08ffaf20c46db5aea77841989d37dfa38d4 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/b8cefe7b36aeddbb17d976b458251b7b5b83afb2 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/817854b31c98eee726df186b440c1683fc35afef |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/1ae64631b2e0fbedb4084c2c2f6ea1ee01e6e564 |     
  mips64el   |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/5a95bb20697c39ae7aa9a628fad08b1b57a9b674 |     
  riscv64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/62a260c48a3437ae4f5a6134deb29a21fc8637cf |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/e7e326875f89b69105b48e28010ecb13d3bea1bd |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/1b62f813da5dc1a8d6d73ec30021911b92e923fc |     
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1974fe60cdcffe45ec075322cc939424f05800d1 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/b45716215056ee539dbfccd340ecd065a1d3bc10 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/436891453640623fc1fbfb46972d63aba3fb9b25 |     
  mips64el   | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/f7c2c03a2b5a0147a041d873c1a36143861be764 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/d5e2b87192b1b2c10f8dc1ab62235b18a824ea14 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/56560f64a77fd3961256bb95746eaa67d013f9ce |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 2 
                  flashrom-1.1 | 1 
host-gettext-tiny-73fc3e7ef... | 1 
            host-mfgtools-0.02 | 1 
                      icu-64-2 | 1 
                  spice-0.14.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/46b54d2e88beb3ee1e8c0396d24e116cc178305a |     
 powerpc64   | host-gettext-tiny-73fc3e7ef... | NOK | http://autobuild.buildroot.net/results/d40ff6e4b06ee269b840c724af7fdb05e31d8136 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/f1e8cb928e030121929c4023d6a9bcce3bc46072 |     
 aarch64_be  |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/74a3a4b6629b2535c8668057fb253048ebd3f698 | ORPH
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/04e2e211e593872c701d512c3aa2bb9008fd8516 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/414294c4f09f83c85593cbb2a8bbf587fd27658a |     
    i586     |          spice-0.14.2          | NOK | http://autobuild.buildroot.net/results/0246710c94b4d6f788e7ca8d5342c7069b5e42a3 |     



-- 
http://autobuild.buildroot.net
