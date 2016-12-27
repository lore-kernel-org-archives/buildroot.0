From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Dec 2016 08:29:46 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-26
Message-ID: <20161227072946.737AF20767@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-26
================================

      successes : 160
       failures : 71 
       timeouts : 1  
          TOTAL : 232

Classification of failures by reason
====================================

                collectd-5.7.0 | 22
                busybox-1.26.0 | 11
                    sdl2-2.0.5 | 7 
               sdl2_ttf-2.0.14 | 6 
                     qwt-6.1.3 | 2 
                  stunnel-5.36 | 2 
             berkeleydb-5.3.28 | 1 
          chocolate-doom-2.2.1 | 1 
                    cups-2.1.4 | 1 
             expect-2014-05-02 | 1 
                  guile-2.0.13 | 1 
               host-gdb-7.11.1 | 1 
                 host-icu-58.2 | 1 
             host-nodejs-6.9.2 | 1 
                ipmiutil-2.9.9 | 1 
                libmad-0.15.1b | 1 
             libsidplay2-2.1.1 | 1 
                  libvpx-1.6.0 | 1 
            lttng-libust-2.9.0 | 1 
make[1]: *** wait: No child... | 1 
                 mplayer-1.3.0 | 1 
                   open2300-12 | 1 
               polarssl-1.2.19 | 1 
             rabbitmq-c-v0.8.0 | 1 
               skalibs-2.4.0.2 | 1 
               tcpreplay-4.1.2 | 1 
               trousers-0.3.13 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/949db24a8bd264473d244baab7aea808b16d23c6
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/3ece7b3dc5cd45af16f1757a97dfe8fbb86cfbe1
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/cad7082dfea8bfe661c1a00304541e13bcc6345b
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/411dc9ef390f99ef81f8f35b098522539ee7b191
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/07de150a6d9bd071c45d3ce3a8bbd164460fda7a
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/af25a561b69ac6baec8be9f7d820949e43548eb9
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/99381d37002db28566d1aba257418a38c9edee39
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/91e86795f151bbe277128ef7ab652cb9aaa04876
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/11221bd93e1ffa4699b09af7ab670e93116cd10b
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/2664991b6509b0d3fe6978b72f2e1f258d02c7dc
    mips64el |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/aa6aeb0f1142b3dd5f93c4091f00c46dd55f5235
      mipsel |                 busybox-1.26.0 | NOK | http://autobuild.buildroot.net/results/370bb631c4230a4aad94c3e74eabd114bf9e2f20
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/d1c35a6003396942b584f2f2a5e8bf4ac2fbe370
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/48f76b1edc0ef06f39c45545529bebadeecd4c41
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1adc1a8670317b22fd8a27e8455d0e5c2739b1f5
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1d530863f727a097330be6bce29fe00e148bb587
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/822c4dbbdd3d50ad3402f38faab23fc5f4540e27
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4d4e5e0a9c721e6fdd33fe51218b8083f91783b2
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fa5d531dc8ec2a27fe0912a892c45cc186986bce
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fc2e7b03da168376a9603d488015f557562a1dc7
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8feeedd2023d319d429e0583c2e41ba37b02b42d
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bad886e633aa67a3aadf7e06c56fae731bfd9b7a
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5e648dbb1f05a20f148df56c1662622b2817e3fc
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ed3bb09b9196cba9c0806445e6f28a3e52eb5be4
      xtensa |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/30a823be0e9971790a6e82142880685f2e450bb2
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/458ca97f994a8badb532363e4c789131c452c77e
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/86d8aaa47ef7ef493a456aa661a44d66954b5ab1
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9a1f25b287a3a877e6cef7c48e985481f19f4a1e
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d50e41e613399329cd6a66d0abe47e6ff2ab5774
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/42d8a55d9dc21a9d9a3d19e9016e7bfcb320b05c
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/4179011c6db41bfb534e520c312fc295858dde56
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/d563db9b07550270dfd621e1136c381b4a6bf353
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8f75945b140d01cc1c9eea9f4e017d493786b94c
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e8151b457ee8a6755b8cd5dd3be37824dddfdb14
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5b95e7cfea33f89646e9f701e2e8e8ed4b020281
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/cc10b558e5c12a56e3b13d89cedd1f41ab3e9e5f
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/432f3b137c23c1eac02b3e62651f685a0ec7671e
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/c2c033d115118bf19fb812a48378dc5c5b56e2fe
     aarch64 |                host-gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/76808ccdbbef3e6ae9709cde2cfd2ca540ed1a21
    mips64el |                  host-icu-58.2 | NOK | http://autobuild.buildroot.net/results/87471de3eeb19931716a511c275cc80863f8c19a
      mipsel |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/28e269b338424f6352354b3f80bd5f868db707bd
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/c01548a751a08dcb176e8faa78a9850b68da2873
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/760d75564cc0b673353841bb7ece71f203a4d312
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/92efaff8e07a3bb13a94abf2ab296158b21390c6
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/533810941afbdd71cdd3eaeeb654ec3728daade0
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/6a7335d232fbcfb2790102fd78c1b5345c48dd89
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/e3675a93ed5db79b8eadc41125ed3accee72b720
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/8eba75af31a9d786a76af26664fc015dfc05ebdd
        m68k |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/cf72bb9cff8869969c00f0757799d700168b437e
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/8bc372e58ddd7a1a90127958c74c9d2180f54c79
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/4d73c0a62ab35717fa5358d1bfba367034504481
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/d701a4089a964307554f62ca335aa32e8ce5cfec
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/4d5cdb09432fcb868462eab8da4028aff95fbcb1
      x86_64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/5186d11401e0422834c7d25ff6761b10308bd543
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/fd3089ef16798a7b172bd10e9bab4c3ecfc912db
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/1d76678abe93dd51686b48b37a171c543f4631c5
   powerpc64 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/e5e0b77c8969e230408a2b85f13c16583b57d605
       nios2 |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/f304ec1ad0799cdd870f4ac95591bf3d7b76270c
 powerpc64le |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/c20f6f0dced42e743c77e8422e1cec835eb2a5f2
     powerpc |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/61faa2a53e11f6b1790a6ebe98503677d8654054
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f15097a3c3a4b15debe457ed81776a549e65dc8b
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/0d6584b9a60ce59f8f36264a8a8ac3f28ebeab86
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c3c82039efbf16433534d263fc8ccb301fee18f2
      x86_64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/766219628bda856d3b67401ee5bd42ba727c807e
         sh4 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/95dde7ea3a2740549b53321bf7bbfc8f9af13a02
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/c265da96ca933d5aa088eb0e8844ffe5a94990ee
      xtensa |                skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/288fc31cd10ffe3cd93371c7be37d79452a91768
        m68k |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/6b70cd53ad6b9bd5edad53f8eaf0cf81cbec39c7
     powerpc |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/5fb9916af89ab8c77718d1e6e26499c9866e6acb
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/0fd4e03aafdb8797f493dc288ca734bed6cc9029
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/eafcb5d6924881a42f43ab089717a5326385936f
         arm |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/cf026e9b18e86b9890341612050f4d166a7b822d

-- 
http://autobuild.buildroot.net
