From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jul 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-13
Message-ID: <20140714063012.3B5831012C5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-13
===============================

        success : 83 
       failures : 74 
       timeouts : 0  
          TOTAL : 157

Classification of failures by reason
====================================

                    parted-3.1 | 20
        gst1-plugins-bad-1.2.4 | 11
               host-parted-3.1 | 10
            host-python3-3.4.1 | 8 
                coreutils-8.22 | 8 
             armadillo-4.000.4 | 2 
                oprofile-0.9.9 | 2 
          google-breakpad-1320 | 2 
               alsa-lib-1.0.28 | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                 qt5base-5.3.1 | 1 
                  zeromq-4.0.4 | 1 
          perl-net-ssleay-1.64 | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                 gnuplot-4.6.2 | 1 
                  prboom-2.5.0 | 1 
                  opencv-2.4.2 | 1 
               libcuefile-r475 | 1 
             host-mysql-5.1.73 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/b218ce813a3b92edf2f206fe6d7e55c86945003e/
       arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/dd5fe776e114c6124a55dca175d818fc5e545493/
    x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/f32980932d6519fdc0e371dec3400888ca802073/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/2aac0d2fd1eb7fdb5da847c28a4e96d8900972b8/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/04851b10e53dd26905056730bf2bfac6fd84a534/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/234bf2425b69ab18efc215a946a0eea870346764/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/8bbf3c7282860a6eb7f4091cdbe9cae09c1e74de/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/0541e529ad2f9e35cc610344665d078493fdfbda/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/8383d58dbf39b578a41ffcba0a7afd1852b786ae/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/6dded1a8f850f10e85ecc26621ada93ab7cc914d/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/50430c1417cf0317fb24ce32b92d66d717f6213b/
      bfin |                  gnuplot-4.6.2 | NOK | http://autobuild.buildroot.net/results/14846b8d1a054409d1cee9f3ce1413f08b4c3634/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/cf9514c84c6b0862a9755402efeff11ef08dc066/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/cd521f27ee847e697c7178ef51b28a531929bd5a/
    mipsel | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/10f0424a93a9e7b48426e14d4448b1e055e5d499/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/ddada8127261a6e6a243169b9210ef8aea319aac/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/7fee580a89ae162b98a4a38f6ae08f90f04b761b/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/3bd24c5c72779042729c55aa68c43f1996bf48e2/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/aa0cf9811351b3cd2edc506c2f3e43aa7134ea2f/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/a96abae33a6080415b7649ef819913552fb14372/
      i686 |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/913d61c6f5a2729e88be7ace0afa155ff30b8ec8/
      i686 |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/9512d19f2a63e95ff628e5003c3fb87e984e2a57/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/71ab2ef56d9c994a33686ede4cd43fc26b7f4336/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/ac33ba38330a0599fdd4b8df3d88dd650fc03d01/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/1a9d2df0ae5b095e49e0a96766bce29389b149f7/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/38a4a4369bf5d122c131e2afd0ef711883bfa834/
       arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/adb395f81d55df296239be38d69f106a4e1d86b7/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/2893e467f9fddbed1ddef8b4b513e0af2f59103a/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/ceecd5c6844f13d5133ae80f2dbe0d74daa48356/
    mipsel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/87f68c8106b35353afa0c19e3f3a1cc373c4b38d/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/5839234261041c966bd9aaf829310e449ed01bdb/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/3daa8413d729717534a9bca676479c0fd7a455e0/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/4a6e9411db48c3058f8c09787b27b85eecf34574/
       sh4 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/5d4c67c1748754566c648d9f62708b740d5147e4/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/fb3ba10d1f51aedd3af524478e52be4f87f69139/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/e234d0aebf8ff1b59a8407216296cf8fbf16cd87/
      i686 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/9625d3b2236adb8483db5512fa0b1d8e3b8b7532/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/32175325ed45b3028fb5e6c3bb8a299eddc88441/
       sh4 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/a9c56b5992dd371310d7d7b83995cb8272929dc4/
      i686 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/93ee41ac9e0a53636a918205691e463ea4552322/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f2fdd889f8212db59be6a7a4146f172f300fd2a3/
      i686 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/16457a310792abb463b6807a7d1d6ae28d1c5b48/
    xtensa |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/75c8891d548b2717d17444316bbeae5f37ead44a/
    mipsel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/3c65eb77f219f2fa028a462c20bf1a49f413b7fb/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/c5b6c7b72dfb9f452dbb1e68631e07aae00ab053/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/99d12ca2972f5b2e5c5f98713767bbcae8a74e5a/
      bfin | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/dc4761bd7436e7e11fa9ec647838db3d091b33f4/
      bfin |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/697c5633f9e6e72b992414389cb7e2a65efe8b1c/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/cceb55d8ccc367fac34543ce97a1d876649a6b8c/
       arm |                 oprofile-0.9.9 | NOK | http://autobuild.buildroot.net/results/d96c14c4ca646e15f1e8a3aee967193f1b3c3c9d/
       sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ba3da20576e35f515165b04281e2dd88c445b025/
       sh4 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/6ebe4212abee4012daa46125eeb5c6ee0085fa46/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/8bef3ebe70c98ed207b6818bfd12c21c1180892f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c0e2e7bb77a82dbf09f59106ccf7372283087461/
    x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/55b6ab5f03c7ddc7d96fd23c38d43ff5966fb2b9/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/6013120aa5370833b489a17def803c120a31ad68/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/93e7f9d513eb8211ac06eb5713d8e5acd63c5baa/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/5a7142a29fe96b21da20c03073d7f382a611335f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/8327000b8381b139ef40f2f4f1aaa066ef712d56/
      i686 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/3f5556b4aad17714c3da401582cc74a931e2ac1c/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c9fcf89225759994d6ea01d06e69d2461c874a45/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/1b33195c9c1c41b0076583c0d02f9828d822ea42/
    x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/f65916efbd914648597a48091ab5216ce759864e/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/573234a6949a143f6111c0766a6e086b3a04a348/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ab66a5785f7a01af82a835ca61ab4e92451d36a6/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/038221c3efb691fc19cd98ea2ecb40baaceecc9e/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/321f494b9bde1792ccde10e061f174a78c790b79/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/fc419781500f62998911d0244f43c8ce0c1ee7ce/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/7b44b470087cc468e59463a94d81041ec762e2a6/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c4dfa77d604ae178822f859d99e454b31ae9cdc4/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/0139b8b3da82d4750a9d726841d35f9338942e77/
      bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/c3ea501d2ba5e17ccb3f88c0588ddf00fd0a4649/
       arm |                  qt5base-5.3.1 | NOK | http://autobuild.buildroot.net/results/57988ffe15ff485f2a921743f32e5d651343e8b2/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/4c3501c181b3108a52adbbcd5eb20e70a8c4acac/


-- 
http://autobuild.buildroot.net
