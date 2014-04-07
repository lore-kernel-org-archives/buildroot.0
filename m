From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Apr 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-06
Message-ID: <20140407063008.806A9100D3A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-06
===============================

        success : 44 
       failures : 36 
       timeouts : 1  
          TOTAL : 81 

Classification of failures by reason
====================================

            lttng-libust-2.4.0 | 6 
  host-python-setuptools-2.1.2 | 3 
    xserver_xorg-server-1.15.0 | 2 
             lttng-tools-2.4.0 | 2 
  toolchain-external-undefined | 2 
               harfbuzz-0.9.22 | 2 
                gptfdisk-0.8.6 | 1 
                  opencv-2.4.2 | 1 
                 cairo-1.12.10 | 1 
              gst1-libav-1.2.3 | 1 
                 qt5base-5.2.1 | 1 
                     vlc-2.1.2 | 1 
               alsa-lib-1.0.26 | 1 
/home/test/test/2/output/ho... | 1 
             util-linux-2.24.1 | 1 
                      qt-4.8.5 | 1 
                 mesa3d-10.0.4 | 1 
                aiccu-20070115 | 1 
          openpgm-5.1.118~dfsg | 1 
                  libevdev-0.5 | 1 
make: *** [core-dependencie... | 1 
libstrophe-d408eaf2bbfe5ff5... | 1 
             ipsec-tools-0.8.2 | 1 
jack2-37976441044d69b91d61d... | 1 
                  mysql-5.1.73 | 1 
                   eudev-1.5.3 | 1 

Detail of failures
===================

    xtensa | /home/test/test/2/output/ho... | TIM | http://autobuild.buildroot.net/results/5ea1b4a5411f64221d2177275e32d75ab918cc7c/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/99a99d0608f28768e9f7f0337d1abb9192db0a24/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/f9b50629fe291aae2ec5e51c34f4e24993e2e046/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/24263bb6262974f1899a500b64d9428e88cf0af0/
      mips |                    eudev-1.5.3 | NOK | http://autobuild.buildroot.net/results/990e5cb1f26266ae11acbdcf6358dde651616ce2/
      bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/10df3f9fc4344b5b39892b19100884ee787d3426/
    x86_64 |               gst1-libav-1.2.3 | NOK | http://autobuild.buildroot.net/results/c4007bc1d8273f9949036ea6c7a0777a407b6742/
   powerpc |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/701a1a260a58a81f45b3b9eae7eb47b400e05b37/
      bfin |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/d06de727331afe8666e26485afa0890ee449075d/
      i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/75b45ec1baa929398d6da07c77bd5404ab7047d9/
       arm |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/ccd3c061666a731f678a3931ce4716c95e01bb66/
    x86_64 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/90965be1dcfead5110c229c50527961e7b9df2a9/
      bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/25ebea4d789624088b1408ee51773107ba90769f/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/9eb7169b79646c9f5f30a60ca55ff66c2b60dd80/
       arm |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/131fe2dd40476d6e3006a1cbae63c601180e5dbf/
      i686 | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/a1a4737e50475737a73a3d3beb151001756ecba6/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/afae80c081f5eeff6c40f0095f58a03ceba5725e/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/3004ca6c7654630f461045bd6a82faa6d1261ef4/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/5042bc9bdce8044cbbb6e2cef276fb444d0356e3/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/c57df95ccdcaa9536c165dc9e55a13ac3d603e02/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/4340fd0eba581e47a301e49db2d9a889c79ccd9d/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/e9b10a054febe8d0d8b95f3e7319ad4741f3a2b6/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/1638e88159a912cb12ce8301804ce03dc2e8cc9a/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/1715330444c1f93f65d70606cd752613d961e1bd/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/540e1ef5cb629b65f79a1dd43d87e6aa16e31dfa/
   powerpc |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/d3d1df4f72bac5093bc56dec5c22da9e8f93ae35/
       arm |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/920795b25deb0f3e323bebc51f4a471db122d671/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/b63c5d01e0776ff138d8ed4b8f78bc429937b20c/
       arm |           openpgm-5.1.118~dfsg | NOK | http://autobuild.buildroot.net/results/a78f5ae5cc55feca67c476138274720381f45969/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/557b29d84eb8e692864eaffaf0524f10b503d4ab/
       arm |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/51450b6d00c43825b9bacf1bdee386fbb27e0821/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/980374d9b4dca7e46c6ba3aecb1c8e7f46119008/
     avr32 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0ec39a1e3c4c3baa5aaad7ec037436b1f407e08a/
       arm |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/003067aed27b8a03876b5fdf8193321ac2888dee/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/911b518a56a12c936d58ef49fe3cb98969382cd7/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/3e8670ab1454118baf1e4a5ca632d45963ba3781/
      i686 |     xserver_xorg-server-1.15.0 | NOK | http://autobuild.buildroot.net/results/5edb9855f31c2e0752759cc7080fd0ec92839990/


-- 
http://autobuild.buildroot.net
