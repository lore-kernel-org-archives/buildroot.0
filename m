From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Feb 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-11
Message-ID: <20150212073017.92439100FA9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-11
===============================

        success : 314
       failures : 29 
       timeouts : 3  
          TOTAL : 346

Classification of failures by reason
====================================

                 python3-3.4.2 | 3 
               dvdauthor-0.7.1 | 3 
               libmodbus-3.0.5 | 3 
                 qt5base-5.4.0 | 2 
            btrfs-progs-3.18.2 | 2 
            libsemanage-2.1.10 | 2 
                    neard-0.14 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 sudo-1.8.10p3 | 1 
                  ffmpeg-2.5.3 | 1 
       opentyrian-2.1.20130907 | 1 
                protobuf-2.5.0 | 1 
            mesa3d-demos-8.2.0 | 1 
               host-qemu-2.1.2 | 1 
                libupnpp-0.8.6 | 1 
              strongswan-5.2.2 | 1 
                    strace-4.9 | 1 
libwebsock-3c1615eeadb0b582... | 1 
            gst-ffmpeg-0.10.13 | 1 
                   perl-5.20.1 | 1 
             fxload-2008_10_13 | 1 
                      qt-4.8.6 | 1 
     host-google-breakpad-1373 | 1 

Detail of failures
===================

     powerpc |             btrfs-progs-3.18.2 | NOK | http://autobuild.buildroot.net/results/82a7b48e686008a6e2912c871106cb22648362b9/
      x86_64 |             btrfs-progs-3.18.2 | NOK | http://autobuild.buildroot.net/results/0edc623a039906bcbb9cbb823a534fd28b3709b0/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/1fef63d3de1ae0fe3dca6fc91cf6ee01e0697e0a/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/927041dba9a60ff474bdba95789706ca501f6e64/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/bb8969fb86da7846ca2fa6c87c094fa4f4778f43/
       nios2 |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/216fbc33c4838b1414cb25f823fd1db5c92e33c6/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/8590d35c881811c63c2db28b5dc66b75a64e2d4b/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/9708f808f3b4f461acce39f4bfad9c487f0710e1/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/18805083304420bd87327494f2062c32518bfe89/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/e24b29dbc60c6f5ba577976259cc1b9009f421d3/
        i686 |                libmodbus-3.0.5 | NOK | http://autobuild.buildroot.net/results/1735b0ccf72a2d3d100f481bb1b14cf72cb17f7a/
    mips64el |                libmodbus-3.0.5 | NOK | http://autobuild.buildroot.net/results/a44c194a0b77d3ade011fc2167719b5e9a6097d3/
        mips |                libmodbus-3.0.5 | NOK | http://autobuild.buildroot.net/results/c7471c8d7c93dc371f20f5ad49f0bc9e552291ae/
        bfin |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/ca9b26430afbafa1624ac32c10d94275e0cdddf5/
        bfin |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/b37904ceb0ab7857d3ae7d5511f9ebcfb1a319e8/
         arm |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/a89bf040c484106eeee6059f8b6caf6762b13935/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/df1027793e4add7d218e3330ca9bb766a31334fd/
         arm |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/76e3c7e6a783753690a33dad0c8d5c1278f9a075/
        i686 |                     neard-0.14 | TIM | http://autobuild.buildroot.net/results/37177e3ccb29d626fe0e38bdcba92219379f60da/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3f97da3a4765e4e343d65187986eb2f6255fd54e/
         arm |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/f6bf63a8a73794b9ab28eb84c8ec4e1614cb8834/
         arm |                 protobuf-2.5.0 | TIM | http://autobuild.buildroot.net/results/46723f19b8506f1e329f59cb8d9d47c1d85c6aae/
      x86_64 |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/9dad6398f626d73ac96b127c3449ace8d5cb0d57/
    mips64el |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/40e90874cc434ce1dda287a5f20aec40d59700ae/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/9e6de1e95d8cb13047addc4f9592c5e3d562210d/
       nios2 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/09e3818c4067b1d4d75d7a1496704570542dcc16/
         arm |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/fe7663b0e775424f67692dd0b0a47cb05a7c9d82/
     powerpc |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/138410f3b8a78cba85c8b5f311e6a710dc44259f/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/cee20002d4c9d0833da2d5c18109f6b61ead4f54/
microblazeel |               strongswan-5.2.2 | NOK | http://autobuild.buildroot.net/results/162aa1263613dc2bf27102cf6b3fa76ffdd080e6/
         arm |                  sudo-1.8.10p3 | NOK | http://autobuild.buildroot.net/results/32ad58042dc8d6b78730279a26e402381b3ef9fd/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/4a77f10775e34aa35b2019ff0b0502d259a882ec/


-- 
http://autobuild.buildroot.net
