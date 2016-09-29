From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2016 08:30:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-28
Message-ID: <20160929063048.6633A1049F9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-28
================================

      successes : 213
       failures : 128
       timeouts : 4  
          TOTAL : 345

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 23
                 uclibc-1.0.18 | 11
               libglib2-2.50.0 | 9 
               wvstreams-4.6.1 | 9 
                     vlc-2.2.4 | 7 
czmq-5205ec201e97c3a652c17e... | 4 
                alsa-lib-1.1.2 | 3 
                   assimp-v3.2 | 3 
                   glog-v0.3.4 | 3 
                 mesa3d-12.0.3 | 3 
                 opencv3-3.1.0 | 3 
                acpitool-0.5.1 | 2 
                  cc-tool-0.26 | 2 
dawgdic-16ac537ba9883ff01b6... | 2 
                  libcdio-0.93 | 2 
           libmemcached-1.0.18 | 2 
                libsigc-2.10.0 | 2 
                     lzop-1.03 | 2 
 make[2]: *** [all] Terminated | 2 
                 mplayer-1.3.0 | 2 
                    mpv-0.20.0 | 2 
              ptpd2-ptpd-2.3.1 | 2 
                collectd-5.5.2 | 1 
             ctorrent-dnh3.3.2 | 1 
                    cups-2.1.4 | 1 
                    flac-1.3.1 | 1 
             freeswitch-1.6.10 | 1 
                harfbuzz-1.3.2 | 1 
                   jamvm-2.0.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-0b04ed061003... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
           libfreeimage-3.17.0 | 1 
                libpjsip-2.4.5 | 1 
                 lvm2-2.02.165 | 1 
make[2]: *** Waiting for un... | 1 
make[2]: *** [libavfilter/a... | 1 
                   nload-0.7.4 | 1 
                    ola-0.10.2 | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
                    php-7.0.11 | 1 
                privoxy-3.0.26 | 1 
                    qemu-2.7.0 | 1 
               qt5base-5.6.1-1 | 1 
        qt5declarative-5.6.1-1 | 1 
                     rpm-5.2.0 | 1 
                    ruby-2.3.1 | 1 
          sane-backends-1.0.25 | 1 
                  squid-3.5.21 | 1 
                    tiff-4.0.6 | 1 
                 weston-1.12.0 | 1 
               wireshark-2.2.0 | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

        m68k |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/ade81f450db2ef17648195d027581e547e5d06e1
         arm |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/0e8cb6c7bc1d4924c20e997ab2ab0ac690c00579
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/5191eba8c4f2d19715ce4c5e9f44eed4f3a6dcb7
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/04fbf198601a6514f0cc1cbe0de3ed6bcaaf6fea
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/df98939d4c3639cc454c1425547f0dd816b2e5d1
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/c13f548f04ecb7ad8b1e5e8c21599bda0b272de5
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5262f6c7fdf94b84952ffccaa1973989f3f79cb5
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4d760e15eb255e13bf1ad20773926ad54efe2141
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/25fa7b2728dbb483b82317a0d58d85fce44d9558
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/63f63a24204a012d3418d673cdd39c7adf0390ae
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/02679d750ecc4740d497a00df219436b1196fe5b
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/fc65f7b95764ab2a325cb59ad3e6eb88952125eb
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/897b54bc1376fe193f2b864c9196c638e1a7e6eb
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/92bd8b846c4147ebc80e488fe57b4a68a975e53e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/9fd3331a56d1f41dde269f4f1055fdf05f3de26c
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7bdd71b754ee64f75966439f39a9e36cf5e1dca0
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/a7ba30198df2df8ae4cf04b3c6a45dc80925d9c2
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/b986556a4ec05f4ca1a646e52aebb6ee1b1da5c2
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/f027e4482074b7919da1bfd0f795338d3c319b66
       nios2 |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/8afdeec20496dddd6e87c910ec00cf67b9efccaa
       nios2 |              freeswitch-1.6.10 | NOK | http://autobuild.buildroot.net/results/851865c4351b2a0394507226ec5de5c0d3ba5c1b
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c183a3ba927e4c049fc713df40eae7405c478688
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/735ce27adf897e3bec36c8b2e97daf63051d3760
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/63f764f140f507da609af27a8744d4b9d776f5e8
     sparc64 |                 harfbuzz-1.3.2 | NOK | http://autobuild.buildroot.net/results/9109f798cff49f4c9769d42685f5ff619ebe2ea6
      x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/27708b79565ecf87d5dbb4c4ff861f2169446e04
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/6befd60047aa07062777da7437bdc415bccfd88c
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/66c33177685cf7f0261a4db1b31d088847fcf725
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/7ba5a94cac7b61782596e33227a11e64083afb0a
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/31343fd23962355bc7b94fd3a6cce8ac48a38c08
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/e7a603176a93adfe0b63f05141e7ce3d74133b19
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/8716e10cb187d3fd256998db63c86c22828d0d23
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2e7bcbeab4aeb9db7a332687f2e3b9c9ddfaad3d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7bbbb8b95c9054684d7c7b05eb45d42a71d54cdd
        i686 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/37fb74a0e65278dbfcbb33a6950afdad8cf014c2
         arc |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2f0b5593c799d1b44485cac06ce25a27195f2382
      xtensa |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/daa0861746e7690001635db54c6cdc42a735b856
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cbdbc87b27f95abeaf0ecdb15980c3deda3c34c2
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6904760cf2e666980365fd7014f5472593043329
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f6025e90a93a735f7aaf745127e33f5c70c6d6e0
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d82cee4c7b655d9b006be3248f89b91af1f87c09
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/62f67fa1d0f606c37fcd09b13b12bfd825d58613
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/416b1ecaa613554c185501a8eea5bbd537a937fe
      xtensa |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/87680ff03cbc24aede2b018c3f41aa1ea69687fe
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/28aa01e15a348d97bf7423c09a9c1b1624afa96b
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/90faed661862e4c7b3833beabd9b1c6edb8e4ae8
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/13e2a8e809a900337857fdcf44112ff6faba5e0f
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/664cb4d11c04012b05374d1764b865e8b87a595c
     powerpc |                      lzop-1.03 | NOK | http://autobuild.buildroot.net/results/c60554f7b84d5050b86c1735fb857856ddfa4dff
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/9648d35d7d037ee3a29f18d3d56bf5abd7d54e2e
     powerpc |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/f6df5b9c408e67881c5f67afa0d57132a593ca60
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/8fc36e73fd623a9da180d00433680d2aa1cf2a5f
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/eb84fc85e5cb8bccf0721d87f9d0afed3b9dbe2d
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/c9b52d5608bbc829ff41ec6dbac94c0f93820e9e
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/fa6cdd018656ef4478508c3bc965e5a6c22dc4f8
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/2385aa39ed6836f68fb88009a50222e71cd0691c
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ad34201d9067064da00400a97398193a657b3e3c
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/214463ea7861298d0b00c0ad68ac942bf6db612e
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9d56e3a4bfc977205eae2c729c9bc0632ea86284
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5c3b048a397a5e9f72e57e716b28fe5077af0ecb
        m68k |                    nload-0.7.4 | NOK | http://autobuild.buildroot.net/results/b0d10b82f2308a92a8d6c8ac768c9efa2c1770b7
     aarch64 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/5a17aeca0469c7318d610f897c5f62c6b5848331
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/af78e1e266ff0ca6a752aad9828fa0e47a029efa
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/9563f224ba4503e46ffd3ccf9e0af987f404d947
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/fb2c5cf6f2e75a2560f99d8fd4d4cc4b5ac7b1eb
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/449da1fecc71f309b6854ffe09dfb2554c5cb977
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/06689c1407b18f30192099359e85788b75c74289
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/61532c31701c9bf756d85c639a00627667baa4fb
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/1e001e34a65f6da6861cd80f7b89f0b722f254c7
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/eea76c2cc1562d751dbc9ee81f9872811ace656b
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/3ce98530619beb4a200da307ad81887b9606bc54
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/31e245bc2179cb7e4cf202972d8ab9bc1e7cf341
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/a7bd860f7a6b5a708912de468a2f048799821f55
         arm |         qt5declarative-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/ce765cc1e163fb3d70a8709abeac40b9f2836438
       nios2 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a1c049dc42971cae5f53f2a7699c8786760abd82
      mipsel |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/1a6910f693532474cf24e916ae23d400c1e54db9
        i586 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/0bb95c7ed69dc148cd6e16b5c8c33a6d7469c1b7
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/15502bbc947268df0e6b112f7ddfc9bf1759f1b3
       nios2 |                     tiff-4.0.6 | NOK | http://autobuild.buildroot.net/results/5f5ba7545c75a3176d2a270d388120941f373362
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7c8d2385a3d0c3b9ea402979ba4432a8405177b0
         arc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/19cac4880ac9111af7e2886a30e996c4e3c76c84
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/b08848ba330297820d047144eac400c4a098a972
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/e853b7031bcc6d3a4485916b6cbda028a0de18bc
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7c20794ec8b366569d61282de013f59b6fc32ece
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/d75f8e8f012f39c689130eb5920d343940d49590
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/7b6bf6fd96c8641ddb895222b022ffbdffa267b4
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/da25a0f71eeade9c046b07ff813164fcb4d835fe
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/01a85081e36fab5df4073e9004efce9ea8352027
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/6eb860babd0c471fefe45084c55476436e1c0889
         arm |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/5354467348203c5cafffc8539ecb181d0f14d4a8
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f0f5fe8ed9a6d073511b97e23b6c9624d631d238
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/bcb132335eccae740111eb004027c23e410746e7
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d15a588234fc3883e80a4ac8795b3bf672ac225d
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a73e2b64516d369373d2dce7e79f4aa66fc9f866
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d58733f7e37b09635875d3eb053e4cd7167e283f
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/961c83e25d028a7cff7fa024a85a117b34705719
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f40237bf7f27cd7d36004d92a244bb92392b17f1
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d38f23df0752fcc2e3dcbe50049ab74722d73d24
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/654b501e16e9c8bbcec7109a3ac7e590377caf84
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/dbb6d206b828da98f3a3799c826919813f50c70a
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/454d5da1d48ecf36a33982ec6f47b70dd3e40030
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9f81e8d7a457852c6b1c6740b17c277b9f5255ad
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8ca68adb881a150ee9271fa3b1baa422ec044ea1
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/b406a43c09638aec6e8d37962d4283270a3e053e
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/38bd2196cf2c0d7ec9487e50349d382daa607490
        mips |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5e661c1e67408128cdb92f2bfba7c39fe88b8cc5
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/90b06d9c8a754395c0c128c553dd34c0a3b8117a
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d077e38a52caa3488f3d759639f2ad8a75007cc4
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/94670161d8e50b702ef865cc55067f2573c9f5f1
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/52f85001ec394683ba1b35a035c6d5d0206150ea
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/a7ab7fe634dfeb32d5ff63b6b7054f4fab577b89
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f54435766f8535a1cb3c23aa3dbac30a251e44d0
        sh4a |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/81da07c24ed5632586914be2ecfab3568dd1d73d
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/43c9cef07c780d553a09e8b2c96da310ba73b4d2
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e541b67c29a8c6c5b31e17a3d77d248c1413a664
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f1531d8459eb0221b8425ff5bb8f1863faaf3d90
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b41269078b9a2efc5b05a58309c15aaaca6c6360
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/07a4f9c6d2bac8a62f770d4b54fa81c03e55f44c
       sparc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3a33f1e1920a766e9a9ad2441c11890acf569714
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4c3aed92d79b28d27304915879be4465f7c73070
       sparc |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/aaa61b4382e17e3e8b812f553f1138aa25d8198d
    mips64el |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/c060948197b60611c5d5f85615de938c401817ee
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5ff2c800c9e46f33763d0dcc96830fb845330482
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/863b9820b819650dc97a737705f5b3872694394b
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f06ccdd76cdba649a82ecd290687c135cce4493a
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/56a63336f800487df99624a321741ed21f083e21
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/57192e00d6e70fc2d958434baf97c3fd86990d36
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/190981e5014d693e7c4db42676b1bbf400f00076
      xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/22f9c60e4b98f0099c9705a7eba89ed8b87cb290
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/d283921096e90d0e6294c6e97c6eb2ea0d2ca8a7
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2352cb3ef231d7425cc52cd9fc843ace68902a94
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/ad5669137f6b374e66f0e1bc5f5fa7a1714df606

-- 
http://autobuild.buildroot.net
