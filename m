From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-25
Message-ID: <20160126073017.E1636101872@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-25
===============================

        success : 225
       failures : 66 
       timeouts : 1  
          TOTAL : 292

Classification of failures by reason
====================================

                  boost-1.60.0 | 7 
                      qt-4.8.7 | 5 
iputils-c8ff6feaf0442f8efd9... | 5 
        ltp-testsuite-20150903 | 4 
                   erlang-17.5 | 3 
                   mplayer-1.2 | 3 
                 setools-3.3.8 | 3 
                    ruby-2.3.0 | 2 
                 rtptools-1.20 | 2 
                 fio-fio-2.1.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
                     nut-2.7.2 | 2 
                    sox-14.4.2 | 2 
                    faifa-v0.1 | 1 
libubox-e88d816d6e462180f03... | 1 
make[2]: *** [code/CMakeFil... | 1 
                   slang-2.3.0 | 1 
               tcpreplay-4.1.1 | 1 
                  gamin-0.1.10 | 1 
                 libdrm-2.4.66 | 1 
canfestival-7740ac6fdedc23e... | 1 
               libcap-ng-0.7.4 | 1 
              rabbitmq-c-0.7.1 | 1 
                 igmpproxy-0.1 | 1 
                   kexec-2.0.9 | 1 
                 qt5base-5.5.0 | 1 
               nfs-utils-1.3.3 | 1 
freerdp-17834af7bb378f85a3b... | 1 
      gst-plugins-ugly-0.10.19 | 1 
                   assimp-v3.2 | 1 
                bind-9.10.3-P2 | 1 
                       unknown | 1 
             bluez5_utils-5.37 | 1 
                pciutils-3.4.1 | 1 
                 opencv-2.4.10 | 1 
               ipmitool-1.8.15 | 1 
zbar-854a5d97059e395807091a... | 1 
                  connman-1.31 | 1 

Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/f3075737c43612e40332e433f427ead185766c77/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/b6ff194b353022b0b4e07f4d6e6462b0f1068ee0/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/3683c699bf6c0058c58c5ab96bccf408c8df1ee7/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6ca1c77dbf2c8d16602774381dbc678800426d62/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ac2c75d55946894e9e13148dbab8abf041c83fb9/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/85072bd1a628f8f95d2009d1ff4ad3b3eda65e61/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/09144630a3d767be27dfdeb455ad7eacd3893f22/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a1244ab6d79a8a01d0c8842c3636d54e105050aa/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/787397132c064fb6252a51e9e9dbd8c7d6844e19/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fd2574eb19b25ee441c18bf852e2d12eacfc4cb5/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/2e21cff8158ce1791ebc946096614377e159e872/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d7fefa385ea014b031d4f585d13070689d590337/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/f6500ef3279e5b0a7948c911b04326d54b394c29/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/721440892171782ea3f591592d2b8381e1d86e25/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9ba1815fff394690da3963ba525d4715e4efed29/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/46fb592ad55db8ee6e7a433863ba88b8e8b9d1f6/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/2fefe784fb45368344775c7b6f2eb83e1c0c2104/
      x86_64 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/911b0122eb347b7c62f6fdeb5901cba30cef7413/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c0280abc0e3b5d198a545bbd0cc8fa4ef1a2b983/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/8e4eba6d7d051fad0e86d3c8f123202b571935a3/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/0d92cf304ecac22a7d357a82ea6a3c78f188df82/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/2fd5408de3cd7f3d980eb1695f7dc7b53d848d37/
     powerpc |       gst-plugins-ugly-0.10.19 | NOK | http://autobuild.buildroot.net/results/53003be0dc2cb76d497a167023c5c45666fd00b4/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/2824d54bd034de7e3a1a8c8c1a13711ae1bab925/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/1b88708892c9928b8aa9c166a69e03fae8947cee/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/0825da2ddd752b1a15e59ed4a5925305c4904457/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/930d5c0e3767055451bb99c6bc2f3c518acd5035/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/7911052b49e41109423dd231f4c8a707cc70d9cc/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/eeea3caf0574a4ce2a18364250f5dfa0a0049d6f/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/fc01124938a21b978cc12419140c5ae1742322d0/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/b134fcfbcd13ec881556b2540aaded9a72fb2a0c/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7ca49e48deb1325e36368d1123006fe6fbb8779e/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/eabf6e443c90f0f0b4631877a0c81f929d34a48b/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/90896525f4145b6091a232070c508e46b6337cb4/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/8908025225b4d53534f7f5310c1b56c4952a6532/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/925b49c4b6303c156bcc6e036525405269b600da/
    mips64el |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f2a587cbf957de965b3d8a7932d8258eb66f6299/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f656d70dd07a3815a6e525a95c11c56bdbee2834/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/8df1db2aae0dfe79d7abe3eeb7c929e0a5e832b4/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3d33967e37c36852ebaf13bc66ff448d36117963/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/f02e88430eb879d57d4b9ada1afe3493ede2050e/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/cab3b890043886578c110f61e97772274daac437/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/c47ff65f9235ce70cfe45c9593807db7aa0fa055/
     powerpc |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/9e21c5190711b06c95d66a4145dd9b6b3fe4c44c/
      x86_64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/e97053cf7f6e656d727cfddd35fed24b314c994c/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/baaaf2d36c2e9ae2993a1a719197e2f795478491/
         arm |                 pciutils-3.4.1 | NOK | http://autobuild.buildroot.net/results/62849c7f6daae6a49d2588732f341848d22ba01d/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d81a0381ca198d5b934df8cb903fcdca826a7c35/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4ad452eaa6a153d48835b194406b72f3c8cb5f49/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1fa7cb2cc6b761bf4d3caa476d320f975cffa7f0/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1a08e1af6674efc1064e6ead77bda9f98d96d269/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5c7a95c2ef49e68aecf068508ed7487399101226/
       nios2 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7b877ac34e583516577104e6ab9725a006c0df65/
     powerpc |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/66a89690662c563ed4c7a6c0b79a9f1ffcee7f21/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/29db8daafb496a3dd0c1a30f133d50c3eba97f0d/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/0d14312b6fd83e9d8f2488a9e195a8936faedaa3/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/216ca81bcfdca1d528b759c722de177fa1296c1f/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/0e2cc39e461b19c2164117aca174972a55bfd796/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/f113d2b2b2f2d3977d8b890f3a4aa08dd01977bd/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c039b2b6d0c9fdb8bb89735b32a95d340c703802/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/29f54b749156cb5bdb66f6b0b6267e197ef62e20/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/ab2767a6ace1169480cf9133abbcbc549b0011a2/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/9f262f767b93d8a32839b04922b500ebf53a335e/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/84e0b6d524831d4da90c799433d7ba11c673ab0f/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/f34e691668bc6067fe043e2eadf1a779a4480251/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/03125c397b929cabcd3e7357f54a27d21b237af4/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/aaa59f22fe43f01d0ad9da597e30daafe329e8dd/


-- 
http://autobuild.buildroot.net
