From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jul 2013 08:30:06 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-14
Message-ID: <20130715063007.3D76052C105@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-14
===============================

        success : 85 
       failures : 62 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

          host-erlang-R15B03-1 | 8 
                 libffi-3.0.13 | 4 
             gdk-pixbuf-2.28.1 | 3 
make: *** [/home/test/test/... | 3 
               libglib2-2.36.3 | 3 
                  bcusdk-0.0.5 | 2 
               libsigsegv-2.10 | 2 
make: *** [/home/test/test/... | 2 
                      gpsd-3.9 | 2 
                    php-5.3.27 | 1 
                  dhcpcd-5.6.7 | 1 
             uclibc-0.9.33-arc | 1 
                libtirpc-0.2.2 | 1 
                busybox-1.21.1 | 1 
                    ngrep-1.45 | 1 
                  readline-6.2 | 1 
                      qt-4.8.5 | 1 
                  samba-3.6.16 | 1 
                  imlib2-1.4.5 | 1 
                 libnspr-4.9.6 | 1 
              e2fsprogs-1.42.8 | 1 
                  connman-1.12 | 1 
                  prboom-2.5.0 | 1 
                 libevas-1.7.7 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                      bash-4.2 | 1 
                libiscsi-1.6.0 | 1 
                      pv-1.4.6 | 1 
          host-protobuf-c-0.15 | 1 
               w_scan-20130331 | 1 
             libgles-undefined | 1 
             iptables-1.4.19.1 | 1 
               binutils-2.21.1 | 1 
                 zmqpp-31220ca | 1 
                keyutils-1.5.5 | 1 
                   dbus-1.4.26 | 1 
             tvheadend-5956233 | 1 
               qt5webkit-5.0.2 | 1 
               libgtk2-2.24.18 | 1 
                 binutils-2.21 | 1 
                 qt5base-5.0.2 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/765e9d7d95b63c941ac560d80daf0e029757febe/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/006adbe2e0a667a30336822a086953b4d57b7ae1/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/843d4c3e77ee6c945c7334f30b287cb409a219c3/
      i686 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/fd63b7a19548a31ca833df4c98c8f1c121b46db0/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6ebb6f204dad0f18f6db23aab50b2d2b3d1e4911/
       arc |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/cb227ffa88e0edfbbfeb61c3fbe0fbe8df651974/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/6b3e9239f50cb0c182f2b20d7bc312c2e4c202d4/
    x86_64 |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/877e5421560703424a66f44c5d6370a8743c29bf/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/08944dbe4aacc4196aaefcf9fb219a9172315d52/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/7f58a7452eb02a5f9ad06fd4c5be3dcbebcabfb2/
    xtensa |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/5f06e5b2771aecd6bf640c48bd0574628b6774e8/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/6cd6fcf27e5aed922636f99f55193797a64a6901/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/f3d95e3436a1647f8717da3293dbc259e3d234b1/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/53195f64abd2826500df53232ab96fbb0f1212d1/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/73d8fb9d43563fde3c3fbcc8cae0d5303f48005f/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/198d5294feb06586a3df40359f30dfe0c0dcfd9d/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/6802f57d8a31b79c2b17d9984b51ed9d53676666/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/7eb375bef091402cbacd0c78562b20b5f5fefa54/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/796b3aac0bcda7ca49d14f14f4fc3feea4203bc9/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/28d66c6db4e7ebf6f2f318ef050e2c88108782c7/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/b551bbb1136b0995eafa5f8406621b383cab8f18/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/1efcc842500010b318db873a6b9e4b1b8621b1d6/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/a9512844a36cb772cf96a45cbf654db33a95e851/
      i686 |           host-erlang-R15B03-1 | NOK | http://autobuild.buildroot.net/results/159c97449cb86d9a3dc935f3930466eaab0751b3/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/15ae827cca44b4be10dd5218d5afef074474a9d7/
       arc |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/4af9e893ac3087f2ac55cd1c995e9dcadb9dd97e/
       arc |              iptables-1.4.19.1 | NOK | http://autobuild.buildroot.net/results/a5b508feab1b8073e0a95947c98a160a73fc2fa6/
       arc |                 keyutils-1.5.5 | NOK | http://autobuild.buildroot.net/results/ae31730cce00384325647d982659ebb75aff2c6e/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/ef5d4f76728617eab1d659172ec273173b3a6d82/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/eb134720c95f4bf8bac8c65a7c0d4de1154d759d/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d1d74a91c194056cdef7a309ca31f0d558658d2e/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/16785929d7e872d4812c8b6170a24a219b0a78fa/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b96d470433baf6ecb9a1943d6396dda1a07ddb41/
       arm |              libgles-undefined | NOK | http://autobuild.buildroot.net/results/14f8bab6e34c8f40a146206fbb3272b86a2cec7c/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b66e807769ead5caa3e3b6312e9f7c35c14eafe7/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/9c3fa0c5003a6369e70bfe6d611f7d745742a8c7/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d1fb882fe4d22a17bdd438360da515011dda2b30/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/602379d070c41b9f48495f614563212bd6108a03/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/993a4762017606588ba7ad0c8f185ebb1177e2ca/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/1870c875b7e2c5851f783203c939c97c52ba31f7/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e4d32a3866a812608a5ec753fa64817302dd4d74/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b735f584fa7889ce5a935f4d342c5d7f05135a9d/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8fde7bde276fef987d747566d635044468dade08/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b462414b4eb28368c0237d98e3ec7d303ff2c344/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/ca47641dbffc6bf6d1ffb66a8db2a389b520942f/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/56c5efebedbb34fcc1db1cff5e9ae6f4b75afb55/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/a30c899bffe6b289c871595eea7ab26e3b014efd/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e5954c7aeace265a67e6a9637a3fff83aac7851d/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/98c2a76a5ccdcdbe979d8fa967938061d36f61cf/
       arc |                     ngrep-1.45 | NOK | http://autobuild.buildroot.net/results/9c203bc6ca91da68c9e7335611c1fb56224380bc/
  mips64el |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/46c5ced94bb749f9a1360409d6b2b0eded0652a0/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/7689ef843588475a542274ad73ee1db6e92ae186/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/e3749f0d7a04371d009201e07d805d7dbf24a57b/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/8aab1a6ed0b7a251fd3aa1ede80055dff8e0f14f/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/faef6faf210a226f239eba2e92d24d28017fe32f/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/ae45ed5b7644a861f8c765692821f922ee540fd0/
    x86_64 |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/132eeb5eeed502294e58394e24dcbb4bffd2e0e3/
     avr32 |                   samba-3.6.16 | NOK | http://autobuild.buildroot.net/results/9fcac055b2bdcfc9578c590640db713d1fa08b41/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/e791e3588a85617a523fb1ad0713f8e5cc75fe6e/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/21dfaf51d3dda4da962a40f86537fa67bbc74373/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/62b4f9dc1521c1f5f6078c04eea663b41c4ea885/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/bfb0252ed32c6761e0001bb9329c12d223bb2dfb/


-- 
http://autobuild.buildroot.net
