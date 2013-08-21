From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-20
Message-ID: <20130821063005.56D5A52C1CB@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-20
===============================

        success : 100
       failures : 48 
       timeouts : 0  
          TOTAL : 148

Classification of failures by reason
====================================

                  libbsd-0.4.2 | 5 
                 qt5base-5.0.2 | 3 
             gdk-pixbuf-2.28.1 | 3 
               ruby-1.9.3-p429 | 3 
                      qt-4.8.5 | 3 
                  stunnel-4.55 | 2 
                 libnspr-4.9.6 | 2 
               libglib2-2.36.3 | 2 
                    acl-2.2.52 | 2 
                      udev-182 | 1 
                      icu-51.2 | 1 
               binutils-2.21.1 | 1 
                 libfuse-2.9.2 | 1 
                  ltrace-0.7.2 | 1 
           imagemagick-6.8.6-2 | 1 
          host-protobuf-c-0.15 | 1 
        host-util-linux-2.22.2 | 1 
                  dhcpcd-5.6.7 | 1 
              e2fsprogs-1.42.8 | 1 
                      pv-1.4.6 | 1 
                  libv4l-0.8.9 | 1 
               nfs-utils-1.2.6 | 1 
                pciutils-3.2.0 | 1 
                openssl-1.0.1e | 1 
                      gpsd-3.9 | 1 
                 libpfm4-4.3.0 | 1 
                libcurl-7.28.1 | 1 
              strongswan-5.0.4 | 1 
                 zmqpp-31220ca | 1 
                sqlite-3071700 | 1 
               w_scan-20130331 | 1 
               qt5webkit-5.0.2 | 1 

Detail of failures
===================

    xtensa |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/ea895a16026dcebdf797ed35e703b7dd5688a0be/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/99f1c7427b45f3853deec1573d9ab8a50e34211e/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/7c003632a6916f7f7753a5ae8bcc250f1aeadbc1/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/e07d5db93ee01617cdc27b0154a842dbbcd20f84/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/3801d995f13f75984d8b58f81902547e3f9f3cb4/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/0e621ccb7c91453decf16c0b10cb9b55d3029f89/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/af1fc993d731674102a96178d23c1301268cc655/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/597e3d40123e00195ea66c82a527862fe480609e/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/f67aa9ba337c374255ca30d4778fa95d171dcfa0/
    x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/d1898416f4404d119e42a029d44544397e811820/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/494eca30fc8ad81b27bda2a62cdada41e459625a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/26915d380bc8fe840b07876a8fd15d9d9987c7ca/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/c629ed51baf10ec04ce1f7e1a582d3af972db875/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/f440b68f672d79678be4434a214ae6c7a0ceac69/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/14ef44fc21d808ca3d91c3e87b2f78f13b92313f/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/6ad137132421d58a3cad8d85cb646b8b89ffeacd/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/726742c028a14de933a4a9a8f87706399ed79a95/
       arm |                   libbsd-0.4.2 | NOK | http://autobuild.buildroot.net/results/7b06957245592388d6ffa59aaff2ed111b5bd15b/
  mips64el |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/c35756e596a2d41d0800df5dfadcd5ecd55642a6/
microblaze |                  libfuse-2.9.2 | NOK | http://autobuild.buildroot.net/results/34ec28f8b873eddc466d1b1d06c2eb65d69b7807/
  mips64el |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/751ddb78588ccff84ead4ae58b44b3a60b385fa4/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/187577a2a6bdd3d7c4be8fd8699daff14208718e/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/4b0e068534c16882a150dc2211cece46073e5d98/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/8ced20fffee698dca2a0c815eaedef7eb062cd13/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/5815d11d3e38eec7a251f4ce1df6058eb9ea1c8e/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/29883336679c97d91389ed60bba5283786cc99fb/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/0e5cb3e08f02869c8ed2fbc646ffd7ad2162ce5a/
    xtensa |                nfs-utils-1.2.6 | NOK | http://autobuild.buildroot.net/results/b8f8bb90a9bffbb6ba0502901a4b9036cda850e7/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e1ae4411cd2eb56b15fbcc3cb30451ceab50881a/
     avr32 |                 pciutils-3.2.0 | NOK | http://autobuild.buildroot.net/results/fbdfb23788e7fc72226991501fb992063cc6f0f9/
  mips64el |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/1cb2237c539cfdea97bcf8c3413fa606841cecf2/
       sh4 |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/cd9de45fbbd3967a12d57ac02ab8180732956211/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/5e4db1774ad675084e7cfe8bdddbf2bd1cfb729f/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/fce604faee85239b56e1f2974661b60d01987a60/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/74669178bd537377a4547d988d3488edcdb5c5b9/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/cfd44f40373c560d332d8dbf489495269b9c7b79/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a7e479a4bb6c863b53f9ed9391982e87ea3325a8/
    x86_64 |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/44ced82d93b49ac6adf0a840c2ef77bcc606ebdf/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/7cedc18ac7e6d0a252862169f0080c26989354a5/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/f0e98c8b26d486b485e5ead5df9238707de45944/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/cb61846b4dcc66e66ea1dd4f3808baa78a7e7693/
       arc |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/692380e9ac5a558893af92252f1126d6d1aa4e6a/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/37db78eb276257ed4e114a029a87cee5347deba7/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/36a3e9beb6f8c1ebc9e0edbe4c4a7a2b1cb211cf/
      mips |                   stunnel-4.55 | NOK | http://autobuild.buildroot.net/results/f2de29455815fe5b6464f96b2fd33ffe12e5bc46/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/ab81b5145b2236c28864f7f055347c51ceae586c/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/b02f311c30df357220f57c04451777b83c338650/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/975e7c6570f282550343a05776bfa7e126cebac3/


-- 
http://autobuild.buildroot.net
