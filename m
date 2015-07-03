From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Jul 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-02
Message-ID: <20150703063015.E8F65100D37@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-02
===============================

        success : 115
       failures : 32 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

                iproute2-4.1.0 | 3 
                pulseaudio-5.0 | 3 
               upmpdcli-0.11.0 | 3 
               libsigsegv-2.10 | 2 
                 libdrm-2.4.62 | 2 
                collectd-5.5.0 | 2 
                      atf-0.21 | 1 
               openswan-2.6.43 | 1 
             exfat-utils-1.1.1 | 1 
                  zeromq-4.0.5 | 1 
                libtirpc-0.3.1 | 1 
                 libssh2-1.5.0 | 1 
                   sudo-1.8.13 | 1 
              gst1-libav-1.4.5 | 1 
               curlftpfs-0.9.2 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                 libpfm4-4.3.0 | 1 
          enlightenment-0.17.6 | 1 
                minidlna-1.1.4 | 1 
             libxmlrpc-1.25.30 | 1 
                  opencv-3.0.0 | 1 
                  weston-1.8.0 | 1 
              pure-ftpd-1.0.41 | 1 

Detail of failures
===================

        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/206442ea18ce4b257035f4fc1c0d1b8b86dcf06f/
         arm |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/9529bb5a8e34115f9282e2fc15a0d9c0e919694d/
microblazeel |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/3903b291656dc1faa95f8bd940463d8cba9e6095/
         arm |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/ae4baae00869ad6a77e95ebae1f268e7c2c0a8c8/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/c2fbd18936a1292fb424e1982d4bb80d344036a7/
         arm |              exfat-utils-1.1.1 | NOK | http://autobuild.buildroot.net/results/63e1c17c793b02da39b752f8eb11e4dea90afb9d/
        i686 | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/ee6330624aa691371ed3bab9c4544f0edacebf7c/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/771a3d028769701068f75cb8411d17df20c80105/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/db4abcb0ef5e2e8d7b8b25ae7b69ad06ed8c7ae7/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/678d2dcd9f09a0198c7a6b7cd11321e080f26966/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/f8932f0c6100a45b59f3dd2ab2cbba54c98fe3be/
     powerpc |                  libdrm-2.4.62 | NOK | http://autobuild.buildroot.net/results/84e5ae2ff602c34a3e8be7ef95e9fe7dfffe72dc/
     powerpc |                  libdrm-2.4.62 | NOK | http://autobuild.buildroot.net/results/cb777917685ba9397730d614006c4f94870788c7/
     powerpc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/800b82b29dde7904f54f6d226ca5208aefbc1ad6/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/00ac432a4ac7822af4d2e2fd272f4e41b4b2ea60/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/8a52962d57f51274f8334a56e157936ca7c56d43/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/189455161f623a7924ffddb125e8f6cdbe5f8ee1/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/5c119d2073f21a9002d1a107a585f78a203e55ab/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/78b43129d89eec309858cdc58dce3b7f2543aecb/
        i686 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/8bb354b2277ef9fa8946abe398fe1ee952820be5/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/75a77e37324e6ecdddfb93d85d785defd466b838/
         arm |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/681964da5a5651e3c302621c286c50fd94d996c2/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/809fddc62703a2a852a0dd19d75fd18892f29c24/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f8787ca7b49a9d21eedab1e4dd4f0a9e233e4ce2/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/09a46979a66a35c7b126cd7e2432bd1a20929abc/
         arc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/1684bd4844f8ab1e2f1875676a44bf2a079cf790/
         arm |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/c1350d11c481ba1c60b458543159613e32bc0d7e/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/9af45f46bdaff508936bf25f0aff9fd2aeafe621/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/9a45ddcdc6ca49c38c0268ac0b8cbe1680f97b17/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/237bac37adad6fd054c5465300e6181e39189943/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/1b1e7ef7717d836e29265bca3b865e780a371a41/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/b71d7d46029b2ec3490f4e8b80fc13f3ebe3e35a/


-- 
http://autobuild.buildroot.net
