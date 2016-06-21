From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jun 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-20
Message-ID: <20160621063030.C5B79103326@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-20
===============================

        success : 185
       failures : 119
       timeouts : 1  
          TOTAL : 305

Classification of failures by reason
====================================

                   efivar-0.23 | 13
              e2fsprogs-1.43.1 | 10
              host-libxcb-1.12 | 8 
                   libxcb-1.12 | 7 
                  boost-1.61.0 | 6 
             bluez_utils-4.101 | 6 
                flannel-v0.5.5 | 6 
                   fwup-v0.7.0 | 5 
host-gdb-6be65fb56ea6694a92... | 4 
     python-pathvalidate-0.4.1 | 4 
                 gflags-v2.1.2 | 3 
           libfastjson-v0.99.2 | 3 
                    cups-2.1.2 | 3 
          libmicrohttpd-0.9.50 | 2 
tvheadend-8e637f9f903f6d820... | 2 
              gnuradio-3.7.9.1 | 2 
                openmpi-1.10.2 | 2 
              libdvdread-5.0.3 | 2 
                     gmp-6.1.0 | 2 
am33x-cm3-11107db2f1e9e58ee... | 2 
                   ncurses-5.9 | 2 
                 omniorb-4.2.1 | 1 
snowball-hdmiservice-f75c99... | 1 
                   systemd-230 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                 lvm2-2.02.156 | 1 
                     dtc-1.4.1 | 1 
                  qemu-2.5.1.1 | 1 
                iproute2-4.5.0 | 1 
                 rpcbind-0.2.3 | 1 
 make[1]: *** [all] Terminated | 1 
           python-pydal-v15.07 | 1 
       poco-poco-1.7.2-release | 1 
                mongrel2-1.9.2 | 1 
sconeserver-bbb384404575f8a... | 1 
               libcap-ng-0.7.7 | 1 
                    lftp-4.7.2 | 1 
               libdvdnav-5.0.3 | 1 
                     php-7.0.7 | 1 
               wireshark-2.0.4 | 1 
                   erlang-18.3 | 1 
                openssl-1.0.2h | 1 
zbar-854a5d97059e395807091a... | 1 
                blktrace-1.1.0 | 1 
               linknx-0.0.1.32 | 1 
                beecrypt-4.2.1 | 1 
                 jack2-v1.9.10 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/3e911f78fd7ac6a93ef5e0cad72f8215f94d17fb/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/121f042c883c376607672880f30a314cd6e1c8dc/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2d876335fa2074a5184f4665d3d762d288e085a9/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ef207aa1c5f2b4d24155b3c5385e7a65f31c5e57/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b6521842acce59375226d0bafeceb58f69bb8c95/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8c0487d6abedfb74bd36631e7d145f73b874ab77/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4a67c97e411a14b90cab793bffa22b13ecb0e172/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3aaaaf2a8b35871f4e51b59511f80dcc73acdb0a/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/3f693f6e63aa6394ab3bc0eed8c4f0638181c4bc/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/aafcc1ecba8e63e0840040fb8e224e82e4b49e2d/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/45270455bd9055845c5139bf04e5c973e8e552ee/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/58646fd780d3ac75107a237c68023ba8f645403f/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/17da5f9180db2d0bc0b564ed1d8d75eb6106bd04/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b050c315bce17c63504190cf9e5dfd8dbdd031f1/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f0184f2f41be18eb8a14c1c3104c6fd7fe00f0f4/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0eb652ec24de7d992868e9e48851478c9a2334d6/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/41b101f3a6a33a970c90c681c66f73ceedef8665/
        m68k |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/13ba2d6f3fe31b5faa2d1918c58cea06933c1c1e/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c76c9ad78e6bd1129cbcfe0f89a4322c321cf230/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/c5df6eb5c02d979fabc23ab5a7d88a1a6f770485/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/cc1fad060e4bd36dbb48a5d9ae2c1cc9e2d79e74/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/3357bfa7df0fc174847c1f1e14da820edfaf1348/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/da37b9a45ab8d39f1ce3da66efff4f9e7e63bcfe/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e97c4ca3ba5fb842dcf2200ca02ca337d280462f/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/759c4169a719d56e99d97fbfe5b1c5e7283ff7d7/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/d4c795147f4efbac0e554395fa90ab81d05b1996/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6b5968c467c81bd83221b48ff2cbaf64c41cb55b/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/0df36dda84749db77e7fedb4ca2c0e15af44d52d/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/898fb4b76b6de900e8b42ced68fb7392dbc8ceaf/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/5f1d08286161bb8f452911f72d3c35a80343047c/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/54cc7d4e3b284b35931e08f9c7f0f902df96a989/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1aaf400e57452e270c3f77a5737e25e14ef1f8fc/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/d586d3e8f5c26ce38b586e171e96a34eb212f2b1/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c4e9df261317fbcdb2015522e90d3e210e235c21/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/bf5d12bfaa6af31ad92cc6f0eb20c64aff66e4c1/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/97a2f4a1361f1b73a397a7e03a96996cf0654f75/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/4d3c16580c2011a85a6ddb699ac21ed15cbe120d/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/06ed84113867237a84159ee3193a8b0d05caeb03/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/66cf68261fa73c2366610f8d14bd02180ba7cd2d/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/f5be56ef9bf94de29e838e6488d3c293a5e4a273/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/fa461c2ab6826e90f21a2689caef04b0306ef87d/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/2d1f44a435a2cecdaa1dcdd561a52b1dd8276c23/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/32d871eb563b8c2b25a58255a0e27de572e976be/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/e98afc8bb4178312e211497fdd3c0080695b62b6/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/70ad2c4d7872f4aa4e29ccd15b423d076dd864f6/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c85a083d97e99526417ca4ea4056d2b371001aa6/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2cae1a9df09a7e5175ab936b884fe492d94678a0/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/640c71691bddff939b20a9accb399e98985ad6aa/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/d262c2c440d7c3cae611257a4164b2ed0e30da58/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/74a8d68510080f4cc3dfaade517da4704741b914/
       sparc |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/58b45fa91360c1b1eb50f7802dadd0dbbcaa4107/
      xtensa |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/6cc810fc0a65de64bb8d61f45baccce9ef1f3b81/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/7d3fc2bab79a9672849ea422fbf1e77f9dec3ca1/
    mips64el |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/b67dd5e1fb248c9a92021b8a9b47853f6a9a6aa8/
         arm |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/429cf111067b8cbd03f94b87a150d12511d4ec0b/
         sh4 |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/94d5968cd4195ada4e176d450b9414bc9bd72058/
     powerpc |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/adf6aeff633d77b4d781dde4509ffe32b5aa44f8/
microblazeel |                  gflags-v2.1.2 | NOK | http://autobuild.buildroot.net/results/5d29e9d4973724f2c3641db07d01d251a2851bdf/
         arm |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/ac65384a325912788790ceafa7db657cef9382fa/
         arm |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/61110fe503ff497a26a459a6c68ec6b91d0f2b6d/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/da7efc198df31cbed1b3e63a2e8add762f832e2a/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/d0be16f9cdf5d7f6ff80f1d66e5e58f8bfd2384d/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1673407b181d6e578579f677b5885741ac9559e7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/884dba2c5ed05c6ae1b2e3745716241e4473ea75/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/9a9621eaaa2b75afc2a84f215896046fcd51b049/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/27710c8f2cab2e0db7f45bdb5a1a259e28f50ee8/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/9899915662c4ded5c22611425eeb1967d3e73127/
microblazeel |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b59b8425fdefca5d9cb5f83ede4266faec53c534/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/cea28920bf63d0c3432b16e7a6e03eea484884dd/
    mips64el |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5c4d88167de38443f3974e76fdca96502d035576/
     aarch64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/6e4a92fc47ec1ce007206e7cfa091f249f0753b6/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/e5a5f75103e517147ebdf9f0342bac18a3fbf003/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/9b1cbb529a0bcd2c268163dc11217f63c9ace057/
      xtensa |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b5072d4cdac0b2fbb5badaee089f9699516b19cf/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/03a37a2372a4c2e438a073e015c49d9e554b86b7/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/7e0dddaefaec7828641b6545cb973857c173e748/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/85fcdfd6e160a6794689eda5dfb3d6c8e7d39d95/
        i686 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/4d2ad2e7bd1285d828eaea07b07bc9b5b1a1bb3e/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/d349cd6317a80af2db213c4705613ecc8bfea406/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/e7fee090147c8221d9cf3ae225f6fb632dd353e5/
         arm |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/5f57037d6512a54a66b868f572994eebb0548472/
        bfin |               libdvdread-5.0.3 | NOK | http://autobuild.buildroot.net/results/a4a25819a8d956522b8aaa901d34c98b27297935/
         arm |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/856c76c6ca5a26fa915a7bb16f5c07a5b5fadc92/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/217ea9e3ea062bbf3d9fdec7e65db0b6683fb021/
microblazeel |            libfastjson-v0.99.2 | NOK | http://autobuild.buildroot.net/results/d987a098abaafce4f877eab3a2ccfc71c2af5163/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/291ec7da84d6ac1ff71bfbf5f59cb57ff9187532/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c6c754d24d3615591f5ec8114f06798f935dec96/
    mips64el |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/47241819a691639854cb1c08fa376e1245e72fed/
         arm |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b7e4538dea35d878c130c256bfef716390f88b1f/
      xtensa |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/631d252d4e5699f911c806d93fc479e84e080a21/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/c630369fea4194d0e21d5c364ffb5e6d80ace332/
     sparc64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/94a1169437e3b561e5ce6869387e43d39d73c79e/
     powerpc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/c8adfb784f0bd9e165e0204b601d16afae5715ef/
       sparc |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/312b9d57939e035163145f61337669450f2404a3/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/b9f0b5e05f15a57cda9ba20708f558bf372a862a/
         arm |                  lvm2-2.02.156 | NOK | http://autobuild.buildroot.net/results/2892ea77f6abe372d3a9529b9283f755d913cfb2/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e468ef69152de94b32436cb44329284e14c0de4f/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/408ab03c232513382dba21894991a3e5337edd83/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e3e328441d91d19d789e135c2edd95a2d20e50fe/
        m68k |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/027e7fda13d619ef097fb54dca73a4b5186c4fc8/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/bd27075181ef77b86c6a3ec831134247f198b252/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/de524cbef057c7c3cb45125ecf62202a2f74129c/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/165bf4156b27ecea0b226550a42560f789659b03/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/fd52e047344ce91b5fc9f63fb460330c55be23c7/
      mipsel |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/a769563562e855e817a0f330889f0615ed848e3d/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/22417b769e47e6a59e886130f67080ff1fec7fa1/
     sparc64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/0b3a212067522fecf372ef0b1f885c467a49b46a/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/01c21bd8037b9f86061d79c4ac7176df77720f79/
         arm |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/230ca665311d23c9ccc32384931a31f2b68691f7/
        mips |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/b528d30b27eca0a74e5366adf81f871424745c15/
microblazeel |            python-pydal-v15.07 | NOK | http://autobuild.buildroot.net/results/2353a91e2db93fdc1ff2e0c0252040defc7acd19/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/a04a8a0b913cbfda332fe4bcb6d0709278424722/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/b0fe55b163fe58d9d63af1a38cc428896ddf0c04/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/25b6b514583c00ac8f688cfac2ddbcfcc0fa92bc/
     sparc64 | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/6d2c5e7fbd4032afb4febefadd2dfb0e45b63cbf/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/976e1a0761e0c3704709291783099a928050ff5b/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/34e84f08cf33a73031489c711e46e239f0c64713/
         arc | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/79a689e9845f10b1dc151dfd9bfa9b491c81bab2/
         arm |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/985543d0e3bc5fa65a8bdd2432365e4171e13f19/
        i686 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/062c6d19c1a61ab050b6a7ce71da680804fb6dc8/


-- 
http://autobuild.buildroot.net
