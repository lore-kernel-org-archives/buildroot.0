From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-24
Message-ID: <20160725063031.0E8BC103A35@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-24
===============================

        success : 231
       failures : 108
       timeouts : 2  
          TOTAL : 341

Classification of failures by reason
====================================

             transmission-2.92 | 7 
             bluez_utils-4.101 | 7 
               libdvdnav-5.0.3 | 4 
                openssl-1.0.2h | 4 
                   dante-1.4.1 | 4 
               libcap-ng-0.7.7 | 4 
                  libsepol-2.5 | 3 
           libmemcached-1.0.18 | 3 
                  nginx-1.10.1 | 3 
              lirc-tools-0.9.4 | 2 
                  boost-1.61.0 | 2 
           argp-standalone-1.3 | 2 
                  cairo-1.14.6 | 2 
docker-containerd-1b3a81545... | 2 
               lighttpd-1.4.40 | 2 
                   ncurses-5.9 | 2 
      host-uboot-tools-2016.07 | 2 
               linux-pam-1.2.1 | 2 
           uboot-tools-2016.07 | 2 
                   taskd-1.1.0 | 2 
              libarchive-3.2.1 | 2 
                blktrace-1.1.0 | 2 
                   fwup-v0.8.0 | 2 
                    mosh-1.2.5 | 1 
                    mpv-0.18.0 | 1 
           quagga-1.0.20160315 | 1 
                    gdb-7.10.1 | 1 
               qt5base-5.6.1-1 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                  mono-4.4.1.0 | 1 
                p11-kit-0.23.2 | 1 
                    qemu-2.6.0 | 1 
              gnuradio-3.7.9.1 | 1 
                    libiio-0.7 | 1 
   webrtc-audio-processing-0.3 | 1 
               domoticz-3.4834 | 1 
                collectd-5.5.1 | 1 
                openmpi-1.10.2 | 1 
libplatform-feafe68e3e0b02c... | 1 
                     dtc-1.4.1 | 1 
                socat-2.0.0-b9 | 1 
libamcodec-6f9b99182f94be14... | 1 
                     eudev-3.2 | 1 
                  connman-1.32 | 1 
               host-efl-1.17.2 | 1 
                jemalloc-4.2.1 | 1 
                  libvpx-1.4.0 | 1 
          chocolate-doom-2.2.1 | 1 
               libgcrypt-1.7.2 | 1 
                       zsh-5.2 | 1 
                 libunwind-1.1 | 1 
                    cups-2.1.4 | 1 
                    nettle-3.2 | 1 
                     php-7.0.8 | 1 
       gst1-plugins-good-1.8.2 | 1 
                    lftp-4.7.2 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 lvm2-2.02.159 | 1 
                  rt-tests-1.0 | 1 
        host-elementary-1.17.1 | 1 
inotify-tools-1df9af4d6cd0f... | 1 
                 jack2-v1.9.10 | 1 
                   fio-fio-2.7 | 1 
            lttng-libust-2.7.1 | 1 
                    fltk-1.3.3 | 1 
                  gamin-0.1.10 | 1 

Detail of failures
===================

        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/30beb2a0d55e66020cda29311b98709e8c0c8611/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/aaa35faac093115ba61d5b0ac2259d5eb8d03821/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/f1e95217288bae69f3579c54e590b1c1a3a45f94/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/30efc792623cc693cf0358865ab17e37e91cc272/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6b3029083636160580d22e2f16c4d08263685785/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2e43351baaa70f68dc16cec75c927db9f3698838/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7e989a23d0daa45b5a3130aca67e60f82f8ba379/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/05f1e9cfe69fb5ba79f6d1cd8ef3da42bf6607fe/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9d2dfc635a58434de43d13c8bc735a66a3b9493a/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/9314e5e032b5c071f7bad1a50ee4476da4c95792/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2954b77c200dbca0d9815765abaf7e93f64c81d0/
       nios2 |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3db1bd78ad6a2a07e73bae7a469f57433d084e2c/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/56ca605cbe03292f27e86d67a70438cf3dfb0adf/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/55f39249bdf7e2fee1892c2d4473af6448cb8f6c/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/8ba75fd307f9fa865abfa469b9499c74beb69780/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/0c99d10ffc163c77302373c939fc1eabb84965b4/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/0e279c1bda950afa8b95e23a0a759910fa0a411c/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/e749272b38cf9b144f699a1c0cb3872bd59a0178/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/775ff67c5405787c63648b3b5841e26844788c4b/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/80f3966a7a2c327cc4e20f7ce5eb987a5f1d13c5/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/1c3db0dfd8ed78618c2ee431d8b7826aaca22eca/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/7e4e06b277144043d5b38f080759321782b18132/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b986d9ce133dd1cdda4c423534374cc03facec3b/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/4df39dcd7517bc269ca5eda1554c6241db8ebc3d/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/4c65118e2f38fc76bfd9515959b622d139c33d9b/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/3fd5b651a97a1ff58718e06f904a603a98a78fe0/
         arm |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/62822b4f79f382440687a734271207e3d0e7f9f1/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/1fd79bd6b1f0b10518f5df4f1701fb778015e2cf/
         arm |                    fio-fio-2.7 | NOK | http://autobuild.buildroot.net/results/184cebfdfdd2cab27ead9ac587886095d4c353e3/
    mips64el |                     fltk-1.3.3 | NOK | http://autobuild.buildroot.net/results/3f2602fa23361e519cce2992ba7a9cef5093d24f/
     powerpc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/bfdf6076b11ecf9c8bd51cd132305796d88179ad/
     powerpc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c076531090434a347a399becb3677584a2daf38b/
microblazeel |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/efb5dcaafea425ac5d023e939eaa801c67c87ee3/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/6815afdcfd1ecb0aa2d4edafa5a9ed3f6480aa10/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ea66912200995bbae2f3a0e40a2b750359ba4568/
         arc |        gst1-plugins-good-1.8.2 | TIM | http://autobuild.buildroot.net/results/7d978f6d5b5f7a34327de921d492112fc90b83b1/
      mipsel |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/4add2478a9c5c0402dfb90f1b6e94752a4b426b5/
         arm |         host-elementary-1.17.1 | NOK | http://autobuild.buildroot.net/results/7e9caffe442dcf40ee41da56fd3f55ffedf3a291/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/afb6c517a7817f2859f570ae53d9367af77f6173/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/0d6545bc62c7ab5db0c435c85dc6086c2930a7ef/
         arm | inotify-tools-1df9af4d6cd0f... | NOK | http://autobuild.buildroot.net/results/c9fcfe2b185b4ae4bafd5dd4331532360b71a2e9/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/916260d34feed6a34ee383e11590c1af87197553/
         arm |                 jemalloc-4.2.1 | NOK | http://autobuild.buildroot.net/results/f4ed572f097a4fe9eb2361e8b44c07e5b878861d/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/2c429e6f917c9024e8d0f6ec42aedd9b59523d08/
      xtensa |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/70ab612c47647a80a7e5502c46fa5901a3068a64/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/e095fb0a1b34226eda10187a6162f983a3bf5223/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/52feee364e4998d07ae3a0fdb8fc553614c28cc0/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f9dc8fc2787ce3e3d44573069497569a84f9b643/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/6749c633c1b4a4e1e3776d123b9bd50f18b217db/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d90d5644efe70e4f32340e9ff11a26b7467339cb/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/8995c91093eb6bbbddf753ebe7a536bf8f0ea969/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/9004a7d2e60b121841db9ff542b557e4e4c2919d/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/4cf66764bcd07d6425c58448d757182fe09d41c7/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/3d32d34e6461485f673f0942dd516e73a8cff772/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/a96f4bb8401d81df5250e50081bda12fdb610e5d/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/e999ad5843fd8fe588b5df555966b9acba6d7e9a/
        m68k |                libgcrypt-1.7.2 | NOK | http://autobuild.buildroot.net/results/16638af89baa06bf709a26e64ef139bb1a51da6f/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/4962f17fd749beca627067524a6a7709b93b15c5/
        m68k |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6ab55e0f04daeb39e5e8e1f35fed07100b69fba3/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/18b04d8e576ac5b9995b5452db7e4e53a3ee0249/
microblazeel |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5e9a8d0b06d0d1c39f0f7c9ad419de4853426b90/
        bfin | libplatform-feafe68e3e0b02c... | NOK | http://autobuild.buildroot.net/results/24ab18b1aa0b91ad59d622506e932d05f824626c/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/1bc2e6c1c173ca346cd3b81e3b90e74eaa28401f/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/b955ebadb54721fcb86d1e98341acd6acbb3b38a/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/90197a75d0ef657fc50ce5d257e660fea93cd131/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/cff79184b1985e3abb9a441ecb0c373ec5e5796e/
        m68k |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/fd3cc98f4cdf85cdca7443977a86f288eb0a8137/
      x86_64 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/32b20c3079d42fe9d312b5321902f7df46f5e1e6/
      x86_64 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/9af22fd428d753e7d7daee45c69d349aba366dcd/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/33e7e84cdca332d6c08a0d43a96dd833e821ab6f/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/75fe60baa26b4d3095b9f2b501d83c98863ce4c3/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/bcabe2e9052a011db3b7a0a8b90de598cb0a8600/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/0a76ec79c8b9f0accc57762fc92fe85c45ea7d37/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/fe5c464907d38893b9543f7091b3ff1ad387cc3b/
      x86_64 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/3e812d382c940f1e39023b13a43b21d06b01b51e/
        i586 |                   mono-4.4.1.0 | NOK | http://autobuild.buildroot.net/results/87795236e69cfec52beb5e418d3a44111ee1a9ab/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/092a740356d4084cef8f16f087c0fe34a346d11f/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/5096e5dfe0ea7a7dd5449b602bbea0764f2a7987/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ce7e7860782984c5f81c08e9c1ca980d657df352/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/bca92de883fe7b731e2aa735f988ccd6bfa912d8/
         arm |                     nettle-3.2 | NOK | http://autobuild.buildroot.net/results/35418d33efa902d3a1a82b2cd58d8db1b1172e49/
      xtensa |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/ddec64d64e3f320a7ac3b5d8a00efeec3a1b1db9/
         sh4 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/568abcbd250d3b1a355b1274b312c67da5e9205b/
    mips64el |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/ddf90905bc0ea2f24057c759317db18542f6ed68/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3230007a60caf67de48b87446a2bbf562b70ea94/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/8eec2ee96d5c4f27f8db61838067d1c67e2ec38f/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/12f0de95cb3e4af49c4014a0220da642da32e914/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/3ff015ac5afb440dfe3a9f02b76e8aff70f62d46/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/79245202b1b49f6b74dc8a5d1e7678c08ab69fa0/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/8a3f0ae68c7dc97a7ba042d8e481284bd8642921/
     sparc64 |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/0ba281688f5955c84123707dab640ff53d7bebca/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/becbef2c2388b219d9f28b0ee0a2d3aacff911fa/
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/bb9e9879f376224cfedf9d1bcfc5e67ec3b00c89/
         sh4 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/2db08866d83a09da65e5e8845a96693dd34c3354/
     powerpc |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/72b5e8a3d4c1d27c61cdad5a90691117d0dcfbb9/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/bd71ea91f2f670f6a4557dae87ea48aa508258e7/
        i586 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/82f4d2da92e89afb213de606e311385fc7a4af5c/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/3dce3180edcc2a8cf13673e632023318dd4287e9/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/2617de8dbe22c9acb451ae0cc04a024ff362451a/
        mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d5636feeb27d1b6c8eb1c4218a766df7370193b1/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/205f1742e3ea8ad9eff0fe47b2f8968c39787bd0/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/4048219babf3c2f4bfa95bf8f2c38a5aeffda437/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5f3dc4768a76808296e62863a592e7925f727d4d/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/79df38a63e81e5f3a5777c905e6866ccecb4b5ca/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/7f7b58fe3204bf3b8c54b254411add3a7e3f89af/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/565c5bf47bbb14c080bcab3e8d802972657b125f/
       nios2 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/f57de3d7738632c74ca588f3707f648d345246d2/
       sparc |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/e08c29bb1d50b196ed2198e17b5f7b45b7e756a4/
        i586 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/3631de90f844fbf99f7ef85b0cb5197a1e57c573/
      x86_64 |                        zsh-5.2 | TIM | http://autobuild.buildroot.net/results/6ad57f35a6fdccb3542241c091afe8c1571ea05c/


-- 
http://autobuild.buildroot.net
