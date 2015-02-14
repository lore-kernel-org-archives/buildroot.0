From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-13
Message-ID: <20150214073013.E7748101008@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-13
===============================

        success : 339
       failures : 28 
       timeouts : 1  
          TOTAL : 368

Classification of failures by reason
====================================

libwebsock-3c1615eeadb0b582... | 3 
                libevas-1.7.10 | 3 
                    strace-4.9 | 3 
               dvdauthor-0.7.1 | 2 
                    php-5.5.21 | 2 
                 mplayer-1.1.1 | 1 
           libmemcached-1.0.18 | 1 
                   zyre-v1.0.0 | 1 
                  weston-1.6.0 | 1 
               qt5webkit-5.4.0 | 1 
               alsa-lib-1.0.28 | 1 
                 cdrkit-1.1.11 | 1 
                  thrift-0.9.2 | 1 
                 gnutls-3.3.12 | 1 
                    qemu-2.1.2 | 1 
              xmlstarlet-1.5.0 | 1 
                  python-2.7.9 | 1 
                gptfdisk-0.8.6 | 1 
                 libssh2-1.4.3 | 1 
                 qt5base-5.4.0 | 1 
              wireshark-1.12.3 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/7e3dc7d48d2c62867ea6f95615d583dee9b42e4b/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b1ec2e994c9b1f2629f37f54e04b228ad13ce3ca/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/6f30e976f307e2eca68abf7e379506e2754891ae/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/73aa1c7a2946f878c246e4cfec64859e04aaced1/
      x86_64 |                  gnutls-3.3.12 | NOK | http://autobuild.buildroot.net/results/d0d4618937af10ee675e84c86b13b0d48050fe47/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/809af19323fb5d40b88dc4b8ca9ab07082e18d81/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/ee9ab4b54d6c1d2c774362d518c6c0055ec6e898/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/d69a324434f370b490a53e6191d38a204ac28371/
         arm |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/79b004e42331c4b581f2d3ead7ebec0c316f29f8/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/188b0890761ec6ec618beda46e88396c3f0a7805/
      x86_64 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/93b43e114f21a22f0f8b7d7dd6774c089c426cd1/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/71362af474461e99b7c188a316aa644a0faaad2e/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/469eadc6a7aa81c13643b5c249a63cf11d8c3fc9/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/1739ec14ce49a57d06a73d9164f42061ce80f203/
      x86_64 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/24423eb5b72b56c5419d4ce9d95aedc17b4c8256/
     aarch64 |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/3d68fe01c0c167b2567e810d005f4e9b569ceffb/
        bfin |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/fadb76d19f40bd4c8921e607df5b8e319a4ece86/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/7bfd88269006e229cd120af6b3a8bf04261ad699/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/51c45ce58caf0eb6ea0e2f95efbc5eaf6fa0392a/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/ad2ba82677680082ae837b39dee5acd22967843f/
         arm |                qt5webkit-5.4.0 | NOK | http://autobuild.buildroot.net/results/ea2cd4691db18c549e5a51a143acb9073afc135a/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/dd30cae433f49980c7a80463969c38e40b6c0ce2/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/2b5826a87d0fe78003f089ef12fe8652e1cae78c/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/eda54770cfe7da2b636d452877f3e1ac13c08950/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/76f670d9654bca4b1f0e124c28997866fa174285/
     powerpc |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/18a06027475686e6d377efe3da48118f433045b1/
     powerpc |               wireshark-1.12.3 | NOK | http://autobuild.buildroot.net/results/d900fea263e1b161d83cd6e5f0326515d65b4b7a/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/2929ab7d0b2d19612988faea483b09a79851c03a/
     powerpc |                    zyre-v1.0.0 | TIM | http://autobuild.buildroot.net/results/aa4a6cc76e9195f9f76d776e118c4769b09bf453/


-- 
http://autobuild.buildroot.net
