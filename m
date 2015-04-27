From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-26
Message-ID: <20150427063016.5C6D9100D9D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-26
===============================

        success : 160
       failures : 57 
       timeouts : 4  
          TOTAL : 221

Classification of failures by reason
====================================

                      qt-4.8.6 | 7 
                  dhcpcd-6.8.1 | 7 
                 leveldb-v1.18 | 5 
  toolchain-external-undefined | 5 
libubox-5a0bbefc8fa44044625... | 4 
freerdp-770c67d340d5f0a7b48... | 3 
                  python-2.7.9 | 2 
                host-gdb-7.8.2 | 2 
              postgresql-9.4.1 | 2 
                libevas-1.7.10 | 2 
               qt5webkit-5.4.1 | 1 
                 python3-3.4.2 | 1 
           libmemcached-1.0.18 | 1 
                     gdb-7.8.2 | 1 
                  tor-0.2.5.12 | 1 
                    liblo-0.26 | 1 
                       unknown | 1 
              xmlstarlet-1.5.0 | 1 
                     vlc-2.2.1 | 1 
         conntrack-tools-1.4.2 | 1 
                poppler-0.32.0 | 1 
                 clapack-3.2.1 | 1 
             ctorrent-dnh3.3.2 | 1 
            python-pyqt-4.11.3 | 1 
make: *** wait: No child pr... | 1 
                libtirpc-0.2.4 | 1 
                  boost-1.57.0 | 1 
                   perl-5.20.2 | 1 
                gnuchess-6.2.1 | 1 
               openswan-2.6.42 | 1 
               libecore-1.7.10 | 1 
         network-manager-1.0.0 | 1 

Detail of failures
===================

       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/dfac04187ad39148a7767fe280a5add3e86c9044/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f834f6aea9ca99b85efa5baaf52af96557a3034a/
     powerpc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/d0a199a558f0d7fb3ddaa8eac7c08f693d185b54/
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/3074bc311136abdf55438bef2c10460653f81a0f/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/98d8fb29fec899683de8431b9c572dd9c2b2974b/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/bc6e89d4c6598ed3ae11c4f4811927d62b37a2c6/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7412b739bd96c49312906a7f36e472bfe6484844/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/6fc2c26570a2cfdc5f62849783ed3ff7c06ea30d/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7aa7302b5fc8504011298d855e1322ba8e57aa9c/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/331e3a24bcfac63758db054c7e7f8125af842194/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/9320760345108d7cb1610da5af06ccce5b741e03/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/e6c2ac69682f409f9ee78a3a6155ae356c3368a4/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/db58bc912d1ee46af77f3c885bbc0cb80ad0c937/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/1df13898d3fb9edb4911e271d85de744b4211302/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/05bd1352a311846bf2848e62fb359e27f21876bd/
microblazeel |                 gnuchess-6.2.1 | NOK | http://autobuild.buildroot.net/results/04e7c14c20f0e056e63a712be3821a3f5c94cff1/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/3c9594643841845ad160ea534a161b204e5d86b6/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/d3cadd93bc7c72bc63626d7766754f28b129d9d0/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/45ca09e083cc84c663bdd06c3a00a80abe34b9f7/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/04308ee3347505d85141066d6f027b79b64b5e27/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/22f51776d8358ab399d2c75dbab4128af28af7d3/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/fedeabb3d1dd10ba4dfa8f061c65ce234c63a96b/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/34f776ce696eda643cf629681dde361dceef58c5/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/5376ff42436d522c2e5652fe0f029ca35d8d337c/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/556268643b702f0556e0edc3d6e1af83fbdf69b1/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/f4248335c8839edc82fcde28bf9ceb8307efbc37/
         arm |                     liblo-0.26 | TIM | http://autobuild.buildroot.net/results/16e98eae446d71337dd8777aeb65e5daff266f9d/
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f565e0d0a4116682665ad4a161cef9c919ed4258/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/85292229b125d14fad1b360af8bf3064a972603e/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/51b60e4311763db46595a2900296890a038903d0/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/a97c480b888d458c31e87b667cc5f277e8a3335c/
      x86_64 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/666d8943cf0decf5aaf6439f35e4ccba0658178d/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c5d27fde0a08fee8fed13fe0724307d3562c2afc/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/5179cb0de4a54622413fa69b26dd59e9336e7dbd/
      xtensa |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/1ccd21cf2ae58ecac75a4cba393b7be4d2e43e5d/
     powerpc |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/d0b71f1118bbe007ea96fc4aa61e0751e066c8b0/
        mips |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/e1f612bb6bd09fa49d80561d26a58553f05761ec/
        bfin |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/65f9acb6a4a291ff48a098c9f4d40276f56aeaa7/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/fdaf04201939626592c4dbe1c314e767304c937c/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/b474728cb1a7eb55bfd3b884cf3f22b7983db22d/
      x86_64 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/130c50aa7c34fec840bf16df574b151b6673669f/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/7a044d5c8bf7526fcf4f0ec80a2b9b18d1f632a1/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/49c8ffa603fcf98a3bbfdbf21d78ddf88ee58d0d/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/8e196d05dd65cdd782c8d41d937a7d9d2ef7dc1a/
      mipsel |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/299bb18e2e46ae56d1fd4b1822a049e186b1c592/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/e15ea5de0623580e7dee27725b8f1b1e9684be2d/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0aa5bcd023e312465507c17c983332d4496d59a2/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/48e5f47318dd2b06ba75f04083bb71c3623fb6da/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/cde2e509217213edeb3e69b66b7a02a0da8eb85c/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/a66b8033ee07cc008f30c939494ec99e55038928/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7abc70dca91140c56dad6215d1dbe04c22dfab23/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/fec98a56a1d81f7a4473bd486678d8b6d8a0f1e4/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/39d436714cd84001d90b2d3a67ae704799577cbb/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/35508966f660ec56a6ffd7c5401398e043230498/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9fcd72edf6ecfb117bcbb78c9719c10828e44be7/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b506bec6e14c1e5f12900c513c1c1dfa24a14bb9/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9e267286679c2374d3ca89d654706a8546a5704c/
    mips64el |                   tor-0.2.5.12 | NOK | http://autobuild.buildroot.net/results/f9792a0b013f6b79774ecc978d859f56bd941586/
        sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/71c2791edc2cd70d97810c91f0fb8a0cc085cd54/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/343e2981b60d9d09a4fcd8e2109540f0dc11b402/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/6ef6f13a6654f57977f0236bbbf74218e0c23383/


-- 
http://autobuild.buildroot.net
