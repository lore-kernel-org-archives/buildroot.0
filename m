From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-13
Message-ID: <20160214073023.35853102D84@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-13
===============================

        success : 188
       failures : 87 
       timeouts : 2  
          TOTAL : 277

Classification of failures by reason
====================================

                  boost-1.60.0 | 8 
                numactl-2.0.11 | 7 
                 libdrm-2.4.66 | 4 
                   fio-fio-2.6 | 4 
                pulseaudio-8.0 | 4 
                    cups-2.1.2 | 3 
                      qt-4.8.7 | 3 
               libcap-ng-0.7.4 | 3 
                   kexec-2.0.9 | 2 
canfestival-7740ac6fdedc23e... | 2 
                    mosh-1.2.5 | 2 
                  prboom-2.5.0 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
              gst1-libav-1.6.3 | 2 
                 rtptools-1.20 | 2 
               valgrind-3.11.0 | 2 
  xdriver_xf86-video-ati-7.6.1 | 1 
                  trinity-v1.6 | 1 
                 mbedtls-2.2.1 | 1 
             stress-ng-0.04.16 | 1 
                   mplayer-1.2 | 1 
           libcec-libcec-3.0.1 | 1 
             bluez5_utils-5.37 | 1 
               iptraf-ng-1.1.4 | 1 
              libraw1394-2.1.1 | 1 
                  stunnel-5.29 | 1 
             util-linux-2.27.1 | 1 
               pax-utils-1.1.4 | 1 
     openvmtools-stable-9.10.2 | 1 
                   tor-0.2.7.6 | 1 
        host-gcc-initial-4.9.3 | 1 
                 lvm2-2.02.138 | 1 
               trousers-0.3.13 | 1 
                  connman-1.31 | 1 
                sysklogd-1.5.1 | 1 
                   qhull-7.2.0 | 1 
          libpam-tacplus-1.3.9 | 1 
                  samba4-4.3.4 | 1 
                moarvm-2016.01 | 1 
                   erlang-17.5 | 1 
make[1]: *** wait: No child... | 1 
                oprofile-1.1.0 | 1 
       openpgm-release-5-2-122 | 1 
                iproute2-4.4.0 | 1 
                 mesa3d-11.1.1 | 1 
     host-google-breakpad-1373 | 1 
       poco-poco-1.6.1-release | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
             lttng-tools-2.7.1 | 1 
                    sox-14.4.2 | 1 
                   slang-2.3.0 | 1 
make[2]: *** wait: No child... | 1 
                  lshw-B.02.17 | 1 

Detail of failures
===================

     powerpc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/a5bb7ed17557d7e1287645b50a2ede40a2a03a36/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8119877ddb66b8b2b2760ae76c8759f23e9f7ca5/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ad181f5315a9cb6f5d0e0b9c1eb7f99613b91f44/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a07166bbb1ebab3d2e912dec4946b913b71fb731/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2f6c1e71da22e37482201d37101a48a3f531c7c2/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a0d28d37c4b05ccc65a0a66b923090d67abf1c0d/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ac31bafd99ef7da147b2e1d03a890fe0be5a7919/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/801873de3c33dd03488c555babed1b0e35f2b70a/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c24c78bf54395cf78cac30c606b68a9a968b5a7f/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/567d81e44e3f25860f7c86549848254641980ad6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b4b79fd5240aad6cb03536bf3e37af733d8b798e/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/528ec8f474022708a13190c0e74315a2b2936c94/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/612079d9ce0c094a79d2ac657c7cac44de0f31b4/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/f8baa5079b71e9ab9051ab125763bf5632d5fcfd/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/01ccf08a3abb7284c02f47dd8bc390fcce49f632/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/cf77c314f9e8c2849c49ce5a37b779ee53937d67/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/c9d62518e1347fb7784eb5eba28094d4c615aa4b/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/50795eaf91b313f5647fd8d4aaa21c349b0e8274/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/074133295443180bdef91561ee9458b7d786ef91/
     powerpc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/e424e16e37df62298508f26282d4b8dfc53aa173/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/aaa533384ed5d3cdd9e0c3444e892dcf0f6a82ee/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/46c45eb745cf5851ebdec6753ef9f55950cccdcb/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/4b59280c724162ed8e8cc22d5a94b210361a0b78/
     aarch64 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/c7debd960136ceb205057b9073804466038e9b94/
         arm |                 iproute2-4.4.0 | NOK | http://autobuild.buildroot.net/results/9dd2fb3cfcecc6910cb41c7cc1e507de4535466e/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/73a1724eb33b1547bff9ada9bf700f7afa85b17b/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/3a86071cc1e97b78467c00d5283452efd5a57b43/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/cf80f4411ffadbcd587542602c5dece21df09071/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/a29fa62067b70ae1e4ec44b527a5a3274b8ed0ab/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/c82037f10d15c1d43de052eac593851cd991b43d/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/ca2a4c8ccf597019a95e45c7b2f3f98d85799435/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/6d491a136a91671276dd67be91172d83fa7be62a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5e3d803b1ab69834220424b10cff73a043c1488d/
microblazeel |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/49a34273b15004d54d687d793190bdde8271438b/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/62e9cd30f84d37b0d8d88beb6597209c9fc37aa7/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/c903af636671ffe11bd677c6d09e940749b357b6/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/967c875a60dc5320f6149b9c515e6cb2e7c45e8c/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/a77c40f953f27806cea01b31770c5fc46f49a1d5/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/6dfc0c5ccdcf875d7129caca017b3d62f4434154/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/0c1562283449de2d011e3aeaca41a055a70f4d51/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/1270070b0eacd5028394dc2acc4227a624b3f3eb/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/3c66b5f05b482f33d1bc6eabe817f6d7aa21086d/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/2f90681d4b2d70138a561426717f79dc73b9245f/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/6f8f8aa831c060dc825fa655aea697aaec64142c/
         arm | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/0dee7ee87728ea4f18b335a1de45659a2b8605f8/
         arm |                  mbedtls-2.2.1 | NOK | http://autobuild.buildroot.net/results/0e9be72ce21b77f1bedebf6b601da8bac750a8f8/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/e7ab00bfc97a330b6964464407c4a76dd724e862/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/8d25328352e67bf21bde008cd406b843a43ce2ee/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/9222230af1f3e2ce939efe5cb0af837929837440/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/c2f23b91068c68f261adfbd0e0233ead1df8302b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/b96c5cb8a928a65a4ffa2247fcce35650d1ca230/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/efc9b79629c78011d403d352bd60a93ef28f47db/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/b586191efe29ade9bc9d2b7d9b9419d58a8443b6/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/c2b26e3709b5a7c88190bb6fc361fd2e082bc8cd/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/29bdd7867032a09c00b057661c693913274d5392/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ad673f69fa71881ca45bfd71aecb9656259b9153/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/4e7a27f4956d7ce2bde73e19061b8bcb58d169b2/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/60cbe2a959861a897f27e2cc77c4af3b3bff20a8/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/bb8a5dbc025c8ee8e23a535d5e95c3f3cdee6b8c/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/80b768ed6efd518313ca49e04a50397e1c0719a3/
microblazeel |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/51366628364f63e4c908eb64b5a4d87f92b43a09/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/429856c0e82838cb84a72ec9c95b7b6f841680dd/
      x86_64 |        poco-poco-1.6.1-release | NOK | http://autobuild.buildroot.net/results/7f0966ee57aea574fda2157562e9c3202bd3819d/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/54ae945d92b9ba708af1c0e359b0bbd726ccdd95/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/febcbea5df4e44814d2fc70ae802ae45e2db2625/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/c2ea9bdf00c25d0836539519f5c77b5804032808/
     powerpc |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/e42608303a681fea4df2cfe6216eb3a30d2f0910/
        mips |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/dc6642b18a97f6e0ac1524fe836226a7ee23df86/
     sparc64 |                 pulseaudio-8.0 | NOK | http://autobuild.buildroot.net/results/a7464d48d8d60e7352c4a385c209e40cc32a7fdc/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/6c9c9e08e77b612c0211d4bdefbed4d590cb643a/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/75f3dab622eab059d0ef2484b50be2a4f3aa96f1/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/79925c80840a5fedc974fe440213e03bdec4c96c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/23795c4789dcc582b6673152327ce8a3c339a254/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/b103b29b420e26987ff062f56f0aacbe9385a114/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/8ea2ad821a1fc2ce4107dfc4f29d226c2d8cd199/
     powerpc |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/03f4754c64532eaaaa1db059a5ac3cc1d3f8345f/
      xtensa |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/78dc2ba07b1d7f888aab94e223f3e0b1a1df3af5/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/38d52923e6b7c824837984e06e5b997f4864e577/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/808e58f969674f23f90e55ee4e5be92373b9c521/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/c530b7bf5d5f1b30e72a743c1761cec7407252ea/
     powerpc |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/1ef40c0e199655e575784804e896c485d14be6b6/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/445ad4366020181b7ececbafc614501f39a00ee5/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/dab65d17a9a19a18b1edc8838bc09532c21ff317/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/3eb5b457e9b1c17d3be15425497270a98a94a70b/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/01c1a08c5a387492535f355a3b382b0238ccdd00/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/6d8cc372db4fbc72484c17b5bafc87abe69318f2/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/dfd2ebf187f69d1a5df84e631a35a5e019345b3b/
         arm |   xdriver_xf86-video-ati-7.6.1 | NOK | http://autobuild.buildroot.net/results/02ac66974c4a3d157c06cc8ccf385e96be633f57/
      x86_64 |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/5f72aacb0e9af9bf19f189d1d0eaaf780ae6056b/


-- 
http://autobuild.buildroot.net
