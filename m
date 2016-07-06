From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Jul 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-05
Message-ID: <20160706063031.0C33B101F2D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-05
===============================

        success : 164
       failures : 123
       timeouts : 1  
          TOTAL : 288

Classification of failures by reason
====================================

             libgpg-error-1.23 | 31
               host-gdb-7.10.1 | 9 
                   audit-2.6.2 | 8 
             transmission-2.92 | 4 
               acpica-20160527 | 4 
            host-autoconf-2.69 | 3 
                  libsepol-2.5 | 3 
                jemalloc-4.2.0 | 3 
                liboping-1.9.0 | 3 
           libmemcached-1.0.18 | 2 
                 jack2-v1.9.10 | 2 
                    opus-1.1.2 | 2 
              lirc-tools-0.9.4 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                flannel-v0.5.5 | 2 
               libcap-ng-0.7.7 | 2 
                   ncurses-5.9 | 2 
              libarchive-3.2.1 | 2 
                    ustr-1.0.4 | 1 
               runc-v1.0.0-rc1 | 1 
               netplug-1.2.9.2 | 1 
               libdvdnav-5.0.3 | 1 
                    efl-1.17.2 | 1 
                 xenomai-2.6.4 | 1 
filemq-e59951489045825d6fc5... | 1 
          sphinxbase-5prealpha | 1 
           libvncserver-0.9.10 | 1 
              gnuradio-3.7.9.1 | 1 
                blktrace-1.1.0 | 1 
                   attr-2.4.47 | 1 
           libfastjson-v0.99.2 | 1 
           host-pkgconf-0.9.12 | 1 
                 ipkg-0.99.163 | 1 
                  libvpx-1.4.0 | 1 
                  boost-1.61.0 | 1 
                    lftp-4.7.2 | 1 
             gstreamer-0.10.36 | 1 
              host-flex-2.5.37 | 1 
                    fftw-3.3.4 | 1 
                directfb-1.7.7 | 1 
     fb-test-app-rosetta-1.1.0 | 1 
docker-containerd-1b3a81545... | 1 
                     vlc-2.2.4 | 1 
                  autofs-5.1.2 | 1 
                  multicat-2.1 | 1 
                cifs-utils-6.5 | 1 
       directfb-examples-1.7.0 | 1 
               qt5base-5.6.1-1 | 1 
                  cairo-1.14.6 | 1 
                  babeld-1.7.1 | 1 
                   dante-1.4.1 | 1 
                socat-2.0.0-b9 | 1 
                openmpi-1.10.2 | 1 
          sane-backends-1.0.25 | 1 
                wayland-1.11.0 | 1 
               linknx-0.0.1.32 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/bc6854d4d677734fb0fd87fdc439f1ee79107ea1/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/19a8f1098d65ea25af7f7f64fb8189b377d409bd/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/d7adbd07c5e74f0305ac03fab615290dfa20e9b5/
      x86_64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/68b69cf242f5ed5905344c6e73e54bf5f53911d9/
      x86_64 |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/2def6fd70665e7b9c34b1141e7709ca88bbd1692/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/a8612a4b38f33b36ea70bbafe0990789f7160140/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/fe5ac5ffc1d36ad28261af2368e5dc8add1d6bf8/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/1d2e15d915c9116436bac5e94550eae97fc88e1b/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/f8ce416a0d1ed0e7111a45cb0a88fdce2bcf03b6/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/1c74090b02f1ef0d30554f815994485547f8353f/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/63fb532f20ab25c747e84f2273fbb0b07e317850/
      x86_64 |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/e8c040e617ae5a291847f91698958c29cc68a279/
         arm |                    audit-2.6.2 | NOK | http://autobuild.buildroot.net/results/e7e3217a49b8eeaaabf14beecc9a77a84bf7b954/
        m68k |                   autofs-5.1.2 | NOK | http://autobuild.buildroot.net/results/032874505f2e371d1dfb2c2964863ea27d31e8cf/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/32c5a437e16500c12d8b57983f031ef35ebd2207/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9903e8b1d9cc4167cabe91d25e5f379ac07fac4c/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/edda0dbc45a8f08f401c01ed2715e0cac6e6c525/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/b4d7e2447440adf7fee0336695985228903e0e55/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/4246de0280d4e7f8765adefd379c9dd414c316f1/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b2d136c859fff72290006a6fafa624aa12f96d0c/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/b9438d35155cbc221ee6e9c3b4d24350e8c113ca/
    mips64el | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/2d6e352cb650a37c4d889c1fb6d476476902097b/
         arm |                     efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/5143f52e60444c2c0ccf0b1ea22b9c16b63c7d7c/
     powerpc |      fb-test-app-rosetta-1.1.0 | TIM | http://autobuild.buildroot.net/results/b055f45b530836e27450b4a716c878bb33b5be21/
        m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/fd4efa82e910001b4d22e971b69009b3d6c8d719/
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/ddfbcf8d2620c2ca87421049f1a18d483d7986c5/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d60909f6829cafc90507b288cf0c176bd8e2848f/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/eb806eb5e710af1e36b544b6ab4979610a387e27/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/2880c4710290e0dca47d852fef0a7e9a9693cdb2/
    mips64el |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/d6fb5db193ddf2cc9b73f4d624c526d395c57b18/
microblazeel |             host-autoconf-2.69 | NOK | http://autobuild.buildroot.net/results/e5b34b32da5c524a8aead2138c2ea727188a6215/
         arm |             host-autoconf-2.69 | NOK | http://autobuild.buildroot.net/results/a366bd3fd1a87ad102840a8f93cb68647a5fba48/
        mips |             host-autoconf-2.69 | NOK | http://autobuild.buildroot.net/results/817be7b3aa428e1081a4ad4b7eaed37046b6e470/
         arm |               host-flex-2.5.37 | NOK | http://autobuild.buildroot.net/results/fa69bfa23a573a6129427e6af3a6d3b63633550a/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/f5fb704b82fd80a262abd89a3cb16ec1f17a95a2/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/606508e1e7b197cf35107a079e4d77ee774f5167/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/e6909843f7e36a74873c0828b7380a8c5009106f/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f127903a7982a07d4e2bb66cfb0816b9f7b01b67/
      xtensa |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/91c91dddbee7a5cf012efb074354ffbc9c5e34a7/
      xtensa |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/35a218c1ad5ccb0634b9fcdbebd8732e1de9e63f/
        sh4a |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/38e9c436d939dab5a15acc47a6d84130b589c9ac/
     powerpc |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b6463fa26c6e0885b854093c8343265d3b51b5b8/
      x86_64 |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/f72eac3e2f995e93f0e8f215e68ce4356a696dcb/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/c3d066153e0452e553ade05ad6043981c6c1e967/
       sparc |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/94c3229047c1537096551c0876fe22b97ba3a2ec/
      mipsel |            host-pkgconf-0.9.12 | NOK | http://autobuild.buildroot.net/results/6710254cea6988008ad568388a588a1d2c398bde/
        m68k |                  ipkg-0.99.163 | NOK | http://autobuild.buildroot.net/results/0f2cddf89af3ad4330556acd04ab6cb080370e24/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4195f0a35565701eaa3bd9149933f8603af6f9d1/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/56504df74db69bd4d07fd1bbfce784ffafbeed34/
     sparc64 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/79298e01c0df3c19acf3b674e1ba09a918e0d2da/
       nios2 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/f534720789152c26f140cd10bdc29da7a7b8817e/
       nios2 |                 jemalloc-4.2.0 | NOK | http://autobuild.buildroot.net/results/674b6022f9a403528a758c0785656d2bda79e0a9/
      xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/fcbdd513c2682ef048b2ba512d662ffb726664a2/
     powerpc |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/4e563624a184e65a30b7f91a9ad47a606447f73a/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e1b199e3d141e675e0265b2bec3b09db88cd1044/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c5d19e4460e8df5092d9189e30b4349fc13c19c0/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/54b54727445abbb52f126bdbaab0d7354ca21ea5/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/45e1b6604c9ea6eb8b9d231a2e461b13935debd5/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/d286fac1b0a9ad9d91a0df693e7eb09689951271/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3a115d259a0642f077852fe1380fac3ab8abf433/
     aarch64 |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/9c877a7ffc5900fef77fb8c07e2850743d68a3cb/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/e7fda3449001261234674f7dddf8a18a644976a4/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/053c3d87f814a534c324310f1559d20cf12060a4/
      mipsel |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/4ec2bb75921dc289e4682573285d94111adddb13/
       sparc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/b497eb10239e5a6a6ae4c97f8fe13d68bde4381f/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/c0285ff8ed47b7abde7733d345a615deb450acc4/
        mips |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/27e4b71062ec17e59cd618c99a5e2b9c34bd973c/
        mips |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/f7badbcc4247d92487ddaea3a4a45920cf840d17/
      mipsel |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/a45d4310e9313d7e12a584e373c54916b5502d32/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3e09ed66bc9705ce6e02560f792f1872e2ff438a/
       sparc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3f588651bd8565962274d6f7930c7c7031ca26af/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/77955a015d6027544b4ba2cb5098cc83fc7bcfce/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/215c4a5512b9b7bd9c302e46618fa7319c6dc293/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/f2e1761d3579c725a489b3b5fa9883e7664c6fe5/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/959a109587a5b6d81c945fee3628088e4b7fbe4d/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/d42e6d766eaabca6a7769d598fa855194469e8d7/
     aarch64 |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/6931ee5d0a3c897edbe0c248b1c3d82c014936ce/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/633dadb81882b7ce555d5dbe6f605d70ee953c8a/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/1e7d19431c07eefaebc273c0337e730ed9dfc5b8/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/df3eaaf0101e6056297eb50f356a952fc288b2ae/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/afdcec776c6a9f9cca4232c2404ec067fa413d7f/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/27fd771226b9f31b14255590b10cd0f1006b8ee1/
         sh4 |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/3caacee3bd3077e086b78b243aa43b1956e7ac5c/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/9c76d5864fed3cb76984a57c550f3b90b5186241/
         sh4 |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/d6ffd1ea0bcd31de1d416d16390fd6ca99728818/
        mips |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/deb67e74d0c1b3d7b8c16d93c854865add7712dd/
     aarch64 |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/ff124ba58bf48811b6c57d7ac7d999bdc01e235d/
    mips64el |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/eeaee4b566bf29e6e48ac64717018385971af1c4/
     powerpc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/4edacef1794265d4719ac62f61c868a514b6d840/
       sparc |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/5b59f2d0afc730fbc966352b57a3223ff4c9c044/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/dfa157eb1d91516236ab3419ddf59568ed335bb7/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c4be7e47679942b122983ee99be8449639045c14/
        sh4a |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/64292c9b24e6079ed16d413880e392bc0a35546c/
      x86_64 |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/6a9b4d7b1b3cd72e32579fbaf5a69dbde0fea8e4/
        i686 |                 liboping-1.9.0 | NOK | http://autobuild.buildroot.net/results/a678cdae9998d693ebd4772a3603aaec06a75200/
      x86_64 |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/70c19ca70e99ea3562386b7948512bd82eb32081/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/4c712f2c9d10410dcb7390715635c36de816df57/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/9de83089cdc78541d67d20700f2de5d42ccae6a8/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/4d4029e24c4c2ceb5327bb81588bd55a1298e39a/
         arm |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/8fa721747b696cd0463cda9edd66a9037972a56d/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/71f76baef844f56c27949ce6e4904c8b39b23cdd/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/efaef169916d7a61eb2c4c3882d0e4e029f5cf70/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/26202bba3c6ab4e1a62d32593954bfad77700b8e/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/c1317d052e3c27d84ce58df2e06347d19b42a531/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/81a72439dbd38a01152d7d9ced5e2e5c682eea35/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d7b22cdde0e994a9592416f1df587b77363f8830/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/a91e9bce7477a22db16443db0ebef9611b4ecebb/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/29c0c9b3b6552261d90ef6ebc261c3db22618372/
         arm |                     opus-1.1.2 | NOK | http://autobuild.buildroot.net/results/61051e83717e4704793cc2d4ce1a8d8ac4ee6584/
         arm |                     opus-1.1.2 | NOK | http://autobuild.buildroot.net/results/fd5fab18e0289288a5be583c1bea4dd872ffde79/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/063859ad460552dd7c101115500b7845045a134f/
    mips64el |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/35d72aac0b0cc0ac92bf309d1a957d7903b1411a/
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/2c50be92fbdcdab405d6d8c5bfe4718b4b3f6038/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/cefc70a2a8a646a9ff46638de186693debd807f6/
        i686 |           sphinxbase-5prealpha | NOK | http://autobuild.buildroot.net/results/741f04fce74b4dfc4d4405d14c82c21f67cbfff1/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/92535976d95579a4fb2617ca2699c92e7d2a548f/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/6f8d158dfc6c56beca4a252e0de49dff0c8364e4/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5b26f452d4af20ea5b351d8f871fef29811c3dd4/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/641a5592c71e1b14b0da0ad3ad1428515f23727f/
microblazeel |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/0180911431a78ff94290227ef364c5e2edb375df/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8db605bf995eb63d178c98bb8cfb53819e3433d8/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/23eaaa95c19f3966e159f0e809d97626a2593dd0/
      x86_64 |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/3fc423a316c0216a939a64105265532c77c32a51/


-- 
http://autobuild.buildroot.net
