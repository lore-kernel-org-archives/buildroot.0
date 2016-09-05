From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Sep 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-04
Message-ID: <20160905063032.D7B78102B17@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-04
================================

      successes : 213
       failures : 69 
       timeouts : 3  
          TOTAL : 285

Classification of failures by reason
====================================

            micropython-v1.8.3 | 18
                   fwup-v0.8.2 | 4 
                blktrace-1.1.0 | 3 
qt5webkit-b889f460280ad98c8... | 3 
                     xen-4.7.0 | 3 
       amd-catalyst-legal-info | 2 
           dmraid-1.0.0.rc16-3 | 2 
              host-fwup-v0.8.2 | 2 
                  libcdio-0.93 | 2 
                    mpv-0.19.0 | 2 
                 openssh-7.3p1 | 2 
                    qemu-2.6.0 | 2 
             alljoyn-16.04.00a | 1 
               binutils-2.25.1 | 1 
                collectd-5.5.2 | 1 
                coreutils-8.25 | 1 
             ctorrent-dnh3.3.2 | 1 
filemq-e59951489045825d6fc5... | 1 
                  fio-fio-2.13 | 1 
                   glog-v0.3.4 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    lftp-4.7.3 | 1 
                  libffi-3.2.1 | 1 
                libmpeg2-0.5.1 | 1 
                libxslt-1.1.29 | 1 
                 lvm2-2.02.163 | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** [utils/CMakeFi... | 1 
                 mesa3d-12.0.1 | 1 
                    mpfr-3.1.4 | 1 
                 opencv3-3.1.0 | 1 
                   perl-5.22.2 | 1 
qextserialport-ada321a9ee46... | 1 
                   strace-4.13 | 1 
                   systemd-231 | 1 
                     vlc-2.2.4 | 1 
              xmlstarlet-1.6.1 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

    mips64el |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/e040546c7c629178888088fdebe33b5ffab437b8
        i686 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/b9288f0a7ea8b2c8be91f9c45e26359d21be3e69
      x86_64 |        amd-catalyst-legal-info | NOK | http://autobuild.buildroot.net/results/994366f9c1b666c7ba6db7486e4b2d35697dce63
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/f1e2d17204c1debfe5b40cccb6561cdce55b760f
        m68k |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/10805110f5684b6511be127b55c338e4a6151fe3
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9da64fbbca62559e902350e5a41c95e39aab2dc5
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/06586a7bd56b00513b1a0ab697a4ae0f5b3f1e09
         arm |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/a485e6a938e268c7d1e532b9d0c94c4e1dac19ae
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/5fd22c31fd7479b2b917b2b424f6d2c0ac21f6d6
        bfin |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/75f800b7d1bb8ac205c42e744bb416eb970505c1
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/50cec39b0d8190d0c1aa0916828dcb6ec4d1989a
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/d3e501171c2372168f99ae9913e0222b86bdad71
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/aca1529c7aa2cebab4097acc73a2aac4322c9046
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/6b318983a1a318d30acb9c25f17065fbc4a0302a
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/6787ca04d4c5bc00b727692e7220076dfb48d735
      xtensa |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/dfbb32e4b11b4290693783d74eaf990abf32911a
    mips64el |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/682bdd98b3652b5569200270f001823cbb734536
         sh4 |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/c8d34d7789a4f069c449619509ee2764ae1bbb92
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/68c1271c13fbb6a44d8f6624df085e8c1dc558a5
      x86_64 |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/5051f71201cd61f9de40414070747da0dd4ca5c8
        bfin |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/f8d6c6b54975c67ac8f3bf5053a73e2f75286e22
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/76bf2d8c4c2de48402d903db25249e906f7316f1
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/ba04ed4d23c345c268160d1b9a7ae97d95bcfdc7
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/6cb801afbdff1c5323fa6566beb05f9c3d12f4d2
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/3f826d38d26b37f177e3b61768a83c4091b86920
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ab0ca148c5e42d01cff8e03609c0f7dbfe0789cc
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d902396f2fc39c4fc69b495ff39093051ee604bc
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/bb8590cb50c5314a66697b095df32e56bbf84204
        i586 |                  lvm2-2.02.163 | NOK | http://autobuild.buildroot.net/results/e702406ae4629ca9c850aedca51d205c556e0be6
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/169c2f7f59e9f29b54b6947ca94977616f6c1b2c
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/760f3f1d0f54dd81a81a8de056c4554fcab6fdf2
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/80b4954c265945c3a0857d56a49b636807535323
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/f1bab7cc146d2c85f5f32f3bdfa43dad18443608
      mipsel |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/922a026ed3eec0827b4ad64a0d5aa27c05888e18
       sparc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/7016c6067cc6491170601ad22921cef0831cd3b0
        sh4a |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/27a080d5f33a92da30e5c58ec4c81f7faa8b900b
      mipsel |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/eb3f7fcb58b44df987a500b2a0accbe07b9af3ca
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/49804ae917691ff9f8fb0e55658bae9507753692
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/bca30eac0ab2a308d06f9e4b4edbe8ad4bc945d6
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/9e62f10d4dccfcc0840763aeed82457ab0462566
     sparc64 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/92aff3587de0f4671b33ab3f24ec6b8b5f725ea5
       nios2 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/40a5f0fb1767e9c69793b25cb4e439497ee917f5
       nios2 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/87a9e99952c015e626158e288c399549b7615732
     powerpc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/28c2a32bb934888c84b5d80960df127dc18e441c
     sparc64 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/bbdf79e283be177b321534e78e42a16de65d0095
    mips64el |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/9416c58b64667bf1290a854392434a173eac16fe
         arc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/a815eec26a9e70364629884b17097c283f8e3a70
      mipsel |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/f31cfc31e73b3c3a731f946404b28a0e4ba39f66
     powerpc |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/f3672c464b88ff6fd9dc2607db68351e68fc763b
      xtensa |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/f161e4bd2ced27b0a39ab0b918e97ac556bcd713
       nios2 |             micropython-v1.8.3 | NOK | http://autobuild.buildroot.net/results/16d1677a5d859e1cb280d699848780ad7e44262b
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/d95514fc4474a31624dd22af74503f132649717b
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/bbdef27ca95c7cc314dbf77d16561b1b8844a92a
         arm |                     mpv-0.19.0 | NOK | http://autobuild.buildroot.net/results/b0d977b27c22f384ba7fc8c23bd268c96b882369
       sparc |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/6521223b426c3cb4dfefab27bc6021900db6910e
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/95c21c576e778c42e8ed1e66e81a6b45737abf53
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/fea797bfb1bb1f4bee314bf549acb530f05e38e6
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/a16e738d33b2f6b61c9d1af199453514e52da8d6
        i586 |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/86a977393cd4fa0539a4851b020661c3bb654b67
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/5bcb8e403071fb00179f9a62aa69bd594915a747
      x86_64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/60ab51621ff1e1ef1148090c5a8ac1009f6c2a0f
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/fcd43a50d1ac650f10e97e76d5a9f5494f6d9cc8
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/39756bcec48eafed7ddcd11be37447a1061374ed
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/9ba56bf6c67195c66d93af7b4e8e00e4108359b0
      x86_64 |                    strace-4.13 | NOK | http://autobuild.buildroot.net/results/3673eeb8f6482e6812f4e9c391ea402d0dc3ad42
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/0bc7ec68d685a3db60c32d56933f826b4c1b5d5a
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f87620fbbd1c3df931bb1fdaaa23c6664b9b4efc
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/a1ae9e10355cd301e625cce418372a330a4da75a
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2b710ea6fa57daae68fcdd2ba17576975d0c39d1
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2c60dc9f95ff8bab3e88f8765b45fdf4334e5fb8
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/c5c5a6a5fd3dc2e7047f175e09bf6cd555404558
        i686 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/174cdd3aaaac0277e65231aab4ed49fb8e42451b

-- 
http://autobuild.buildroot.net
