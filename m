From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-13
Message-ID: <20161014063022.EEC0210300D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-13
================================

      successes : 205
       failures : 126
       timeouts : 3  
          TOTAL : 334

Classification of failures by reason
====================================

                    gdb-7.10.1 | 17
                  dbus-1.10.12 | 14
           imagemagick-7.0.3-3 | 8 
                libgpgme-1.7.0 | 5 
                     vlc-2.2.4 | 5 
               wireshark-2.2.1 | 5 
czmq-5205ec201e97c3a652c17e... | 4 
                   gperf-3.0.4 | 4 
               linux-pam-1.2.1 | 4 
                    pppd-2.4.7 | 4 
filemq-e59951489045825d6fc5... | 3 
                 lvm2-2.02.166 | 3 
            wpa_supplicant-2.6 | 3 
             berkeleydb-5.3.28 | 2 
                   glog-v0.3.4 | 2 
                ipmiutil-2.9.9 | 2 
              libarchive-3.2.1 | 2 
                  libcdio-0.93 | 2 
           libmemcached-1.0.18 | 2 
            libmodplug-0.8.8.5 | 2 
                    qemu-2.7.0 | 2 
          shared-mime-info-1.7 | 2 
                     xen-4.7.0 | 2 
                alsa-lib-1.1.2 | 1 
                   assimp-v3.2 | 1 
                   cmake-3.5.2 | 1 
         docker-engine-v1.12.0 | 1 
                    git-2.10.1 | 1 
                     gpsd-3.16 | 1 
                  guile-2.0.13 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
host-softether-1e17c9bcfd7e... | 1 
                 jack2-v1.9.10 | 1 
                   jamvm-2.0.0 | 1 
                    lftp-4.7.3 | 1 
               libbluray-0.9.3 | 1 
           libfreeimage-3.17.0 | 1 
               libglib2-2.50.1 | 1 
          libmicrohttpd-0.9.50 | 1 
                libmpeg2-0.5.1 | 1 
make[1]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
make[7]: *** [libavfilter/a... | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
                 openssh-7.3p1 | 1 
                    php-7.0.11 | 1 
              ptpd2-ptpd-2.3.1 | 1 
               qt5base-5.6.1-1 | 1 
          sane-backends-1.0.25 | 1 
         systemd-bootchart-230 | 1 
                tinyxml2-3.0.0 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c1debdd00f5b919fdef0cbcb50cee3d66b61cbe1
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9c0e44415a0e2cfba5b06989c823868278aa0b02
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c60fbc2a0862abf8c528610e17d8d41351cf9d21
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/31830d1edadf85e54be687db151b16fbaab3d5c5
      x86_64 |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/02a2337316dd69b4fb78423219edc808f3b94ae2
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/67e61a9876af4aeb404c60e955a802a64b64819b
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/500b234ac561c8339aa1f771a4d27e9a8a40eda7
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/2650eb23adcd0d6c36fdd6d2f594d27b9edfbec5
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/1beff1fc4b36ee58e78e39238a117c91e9e6b392
        m68k |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/bd58cd7a98ac1b214fb7536591ef138288b0959f
      mipsel |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/c3cf4bd96b78c0fcbd44dd5136e9b0b93e12c728
    mips64el |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/923c57bb0a1befa666414c45cb6022cfc764f58f
     sparc64 |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/89fc9f402d1ae177343f2ee62f6298d318a6f2ce
        m68k |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/95d646ff4931ce2beeb618488cb3bafd70a25582
      x86_64 |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/e66125cf2bb18b73d55fce1741c3f90b1089f994
        m68k |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/873eb2533b85024110389a17f9cf826cee7b91ca
microblazeel |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/bea29a8537b9669e1e4a979e0c67e501823d1c82
     powerpc |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/03966beab99e651e284b791566e30e8863edebc4
         arm |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/03511f02cfb9b30ee8ed9a27daccbe648b443af7
         arm |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/d7239108e80666aa31c67459880e311554f1d6d1
       nios2 |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/8d43adc225fd1118d7fa4ca550aa3ec8d0899b8c
         sh4 |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/3bbd77407e6f8828d7ee8809c3c329d301da5318
        i686 |                   dbus-1.10.12 | NOK | http://autobuild.buildroot.net/results/a74ec8727a17eb39239ca29daafaa391e617499f
        i686 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/601dd4d94c5f2db74f16a50ad60ee5f9fddefb1c
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/52ff102dbfb5e439d6cc303741482d2b224dd323
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/6a339e26dce20f9159827c35a112b6daa92519d4
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/81f460fc1080785eed07f05abcdbfda17e872009
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1687e4a92f0f568633f0a01c8f2c8021b650cbf2
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ca6c2a485bab520a5cea4929d6af943db6b5f060
        sh4a |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b1a8161279899ef68fd81752c9897e89b29c2363
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/4e09db7a223cb65be584e237d864e5d5f069f7fb
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/54adc8ed191f63be64ed035e40d9981c9129af26
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/792ea8f2c001b9705d08625828846065b9942a9b
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/254d5272000b082b1812a743e7d244edc4958b3a
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3558292b98feeb6cce1601b14b57ee972d676d62
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d29727c532a00472ea54ab9916932ee2cda40da8
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/41a39b96e0bc30fff0a94343e35567fec7318a58
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/64cf7cd3a56aab7578fe8ff2cc4729c7844d13e7
     aarch64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a2e69be9851b04309c99164b1a51bdb5b3762dde
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/9402b2b9062d59d532f4836eb4528dde00456d83
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1b2d8a293fb3a34326e88ed3de74b581487dda43
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/082940dd5b671a98b137595a5251e831956083f2
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/7f2074ca1933f147a1d3bcb89f7db4dcddc0d1f3
     powerpc |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1f103426b115d8910c970e00274ea4156dfb9ad9
microblazeel |                     git-2.10.1 | NOK | http://autobuild.buildroot.net/results/d180a188cfef0a44991948e97855a3b999ea2ee9
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/4d19fd0cc3a2df3be5b8413809d8c618164d4592
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/4ea960268c1d5cb40339138d5fe6e0db4284cecd
        m68k |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/ba8b26d06849b37170f8c9dd97dfa6f6b34260fb
        m68k |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/66d1267512988c97bd9f2c4a85d164089926f4c0
         arm |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/f145c332a797832e0723948b172519de496c0cfd
        m68k |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/a2caf7f6c0dbd85a96839b72e47ada70240ab270
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/aa4c73c29ceb8a7688b16919cabd0ae2f3bb1f82
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/bb051de7b80396fb8e9812cae39f3200362e947d
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/24c1156e9d453bcf89ed787376232b6c0579ef62
     powerpc | host-softether-1e17c9bcfd7e... | NOK | http://autobuild.buildroot.net/results/0ef2748668fb8462b47239a70030c980a3b6349e
        i686 |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/25fe60ada9df8819387e66c0656ffc5489b9f496
    mips64el |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/88845dac5dc967f8ff0721418fca2da03a400811
         arm |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/e2470997971b50b15d5637303dc6bcaff9e40879
      mipsel |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/3a1149b8c71a2227c519e0717cbcd7d3113aec93
     powerpc |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/78cb9be8c3cab4b3359ba8d2f7d24b3b3c53e59b
         arm |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/facb769a98e57bce4382e5400efd3d713eb1b2bf
         arm |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/3ee1dfd5f6f0eba39df12e451a5d7d3a1f991796
      xtensa |            imagemagick-7.0.3-3 | NOK | http://autobuild.buildroot.net/results/6515e442775a116383d60f7aff0fbbb6eed3d354
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/d7231cac87b6d25a304129cb16a0c753123b1fe1
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/5f95adee78eaba3a15a1ebc73d2491757fe43a1d
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2a8466fc222b2708852f299609f227a0ab53daef
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/4b2e27706b53225d263d23455250e0b7b802e445
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/d8a39b9f538bb55e1a335c1aea9f4102798d16af
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f158c49a8b5768a7c8f63c76a10472c8ef71e7d1
      x86_64 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f90931d44469c12d9c435ff8a4033a72cb18f598
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/dd8ff7df733745937cd53153b355a168f3fdd3a0
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/a2d87669e3226ff95bc57b2eb93ec996d1e61806
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/bf0712f2a8e10d48827c9cd4662fa16ffbcc3992
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/88d5930a2c4608abf10b97c2da6cdae0ecba9438
microblazeel |                libglib2-2.50.1 | NOK | http://autobuild.buildroot.net/results/fafb7e0732b869ea4a26c8ea3207e47a4796bac5
        i686 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/6853c21aa084952bc232f0ec3e96dcb972d8fbfe
         sh4 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/f917581455bbb5534ac0cc10a70adf79f19e6889
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/feecc10769d3f6126e7e89b6d3c017bb7c767f53
    mips64el |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/7d555c220e7eeae63e2ad77534ce31dbe79c406c
      x86_64 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/f19dc86bfa2e76acbedf59990b5034c310c8cb74
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/e513b806ff539f0bbd1089cfac54e16b61eda645
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ff1f6fd90aebb54c77daad758f0015315ef697e9
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/8a42bce1d3024a17734948ce02504bc0c64f693d
       nios2 |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/cf4a3d7ea81a1d6b4db0042cfac8fe1ffc6fcb1f
       nios2 |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/84fd507aa9482f5b847774a0c8e6f54af7a039c7
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/df4ceeee2a017b84355ea5c3cc784e4f50de3d45
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/5c58d05ffec1bd73e3d4e5f2fe3ad8e58df765b9
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/c42117fa1b5a8e0f99ef3a035e93def706e52184
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7776330a57568c3aa23035be5fdb57b4f2a96eb7
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8b220a387cc148d1974a25d3e274860696eb1890
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/ba1116662465302a502cfcb10de6f37d956c0872
        i586 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/9c1e1eff6a8cb109f665f2c1154b190643c11cf7
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/f723af8370aacf5f9336bb44bb3f7a9a37b0ef92
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/0fb2bfc16405354a858119bf00594baa798da0e6
      x86_64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/b2d3cd5c941d71750add12b377844a86f1b099a0
microblazeel | make[7]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/c1be2efe00e6821299bbfb70319c61c6506a44d9
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/3529f236d226e9d6e6e12913d6513f5595134147
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/8c73cebc1d363387fa0e9af80f3736277a090d72
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/b594d940d34bac9cb9bda370ed2c688f2f810213
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/601baca27c1c64387f973ccd9bed45746ada94cc
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/6c0fccdc2634ddca2a241c7924da3fd5f21e8094
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/5b3ed7a8fdc1c18b2a5afdb95c8d61fc21014d77
microblazeel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/7395c97d4ccbc8f076c5485b094570c8af015756
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/b1bbb435cbd9889d5202876cdeb6b863b5805fda
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/901ca5d24e6ff803908be4dedc978370d724d414
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/9435c0a0b63efb9375ccd0c108ed54a7bfe3519a
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1a93eec959f208486dbe089e07e6b15e74e5e0e0
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/4cf280ce5f74d271cde814f396ffac72297a17e4
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/82cbc49500e144bdc9da5272ad76c7ae227ac66f
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/010d2d8c5db1ab6a0cff187a0d1e197480e200c7
        i586 |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/171073549cc0404caec4d929db159c5c9623bdfe
         arm |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/7e6e7aae836c3581c9c493a30adcde588f114498
         arm |                 tinyxml2-3.0.0 | NOK | http://autobuild.buildroot.net/results/0bec1ecbf75eb1dbbfd9f4460de71bd57950977e
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/64397eb13c2a42af7a2b997db51b2665307c2934
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/0386ed70f3ab448f18af0f6d1638fa9bdc3cee6f
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2a0f7c68cb5bcec72a4f4ed9dee67e2da84c8608
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/525097ad032d1b5bd668e6d0a2ccb7bf1a3bbbc3
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/10267ed758adbb28f4958c6741584cd5d1a533ae
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/8b362e0c868638e2bd5e5ce6ed4e584fab13f7f9
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/056b3299ce45552fe3e7cbf5aa68b223f8fa458e
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/d47bf66fcc9214e0833faac3bdb7d4a2e3050b74
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/e8727f1184782d9acff8ff07f7b94dadaefd96b3
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/d4db05d328ec2cda547a5aec7f646e0ec08f5f60
    mips64el |             wpa_supplicant-2.6 | NOK | http://autobuild.buildroot.net/results/4275ea6e9f5a18d2ed42c93bdafbe6cbd50126a9
        mips |             wpa_supplicant-2.6 | NOK | http://autobuild.buildroot.net/results/e9ad13cbf9f2486e3e3a6d71a7953e9563bac987
    mips64el |             wpa_supplicant-2.6 | NOK | http://autobuild.buildroot.net/results/ac32cbc5a8e1881b7f0f014d8e3cbadf82adb1c5
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/eeff208e5bad3fd0fa47bb09388183d424c830e6
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/aa5a6a03968d297d7eb3b0d40b344cb2192544b4
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/c639fc4c5f828cee646673495552cdfe66080a98

-- 
http://autobuild.buildroot.net
