From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 08:30:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-07-18
Message-ID: <20170719063048.D506721E94@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-07-18
================================

      successes : 203
       failures : 31 
       timeouts : 0  
          TOTAL : 234

Classification of failures by reason
====================================

                  nginx-1.12.1 | 3 
                    4th-3.62.4 | 2 
                     gpsd-3.16 | 2 
                   httping-2.5 | 2 
                acpitool-0.5.1 | 1 
                  aespipe-2.4d | 1 
                   attr-2.4.47 | 1 
                   aubio-0.4.5 | 1 
                  babeld-1.7.1 | 1 
                busybox-1.26.2 | 1 
                  bwm-ng-0.6.1 | 1 
                  cppcms-1.0.5 | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
           libmemcached-1.0.18 | 1 
                   libnl-3.3.0 | 1 
         libspatialindex-1.8.5 | 1 
             lttng-tools-2.9.5 | 1 
make[1]: *** wait: No child... | 1 
          mediastreamer-2.14.0 | 1 
                    mpv-0.25.0 | 1 
     python-cryptography-1.7.2 | 1 
               qt5webkit-5.6.2 | 1 
                    ruby-2.4.1 | 1 
                  snmppp-3.3.9 | 1 
squashfs-3de1687d7432ea9b30... | 1 
                      x265-2.4 | 1 


Detail of failures
===================

    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/6083a12b94ef59086463e4a02cf72a0909d6437b |     
    mips64el |                     4th-3.62.4 | NOK | http://autobuild.buildroot.net/results/808d00b5d74f8b1f532110add50e0cda7c440e85 |     
    mips64el |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/37cf2315d64af4c8f5bbe583902d99fbf4b841fe |     
    mips64el |                   aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/d7a105823179d460ddea41d8a1db625ddef48702 | ORPH
    mips64el |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/6c581dae8247af9bcb68bbefbd053dbf9f1d888b |     
    mips64el |                    aubio-0.4.5 | NOK | http://autobuild.buildroot.net/results/2abd9b09678cc9dea14ad0005b45e00afd65c418 |     
    mips64el |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/8d637d9d7023151c0abe14fde67fd8e93da14d38 |     
       sparc |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/b9a28a700ba5df32424eb7ce11b3f080211479c8 | ORPH
         arm |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/023bf50afa0acf0367ca6b1f502b767342005ab6 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/a72bc25c1103471b68b210f1eae89ce7846ec7e3 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/fbcffdd5a2f627eaf1db236ea9b4a5e614de862f |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/70288148d3ce1d4b84298ca4071c43a64315aff1 |     
        bfin |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/754bf79f10890663c72001fb788fb00ee8087e06 |     
        bfin |                    httping-2.5 | NOK | http://autobuild.buildroot.net/results/73e624775617d1b95da7d4ef666612af5bceef61 |     
      x86_64 | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/a252aa7f4f28504aae12ae7797369516db24b251 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ef0419173615ca21d3662c037ee7fe64edfac286 |     
    mips64el |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/a98eb0555d7b5793024f0868604683a2aef4b21e |     
microblazeel |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/3ca96d04583a676f24f8071ece29771948e4676c |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/82c901a008e2b8887cfa1e69985aa8d7991df52b |     
    mips64el | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/8a935abb8ccba97b3cd4121d01d989ed96c8a570 |     
        m68k |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/e32fcc21b48314dc033aab2592c521df14c562b3 | ORPH
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/491b4b86a8a60516c4cdb4cff3dab7e469f02f9b |     
      xtensa |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/e25f8ba8d8743e47a77707cf582e58477e1860e6 |     
         arm |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/c4aa6e22033be934bd311cd9761f646d44618dc0 |     
     aarch64 |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/75e935d248b46df11c32c95526423a2287ac8c62 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/40f554e5d7eaa781926a1f839dcb523b2896122b |     
        i686 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/634375088d9bffc0331a9a5659796bb44bc08fe9 |     
      x86_64 |                     ruby-2.4.1 | NOK | http://autobuild.buildroot.net/results/1420efb399d437f00e656d9fbaa3929eb7b35a80 | ORPH
    mips64el |                   snmppp-3.3.9 | NOK | http://autobuild.buildroot.net/results/cd3224debc5a47774bf559e8c74e440f95d6a988 |     
         arm | squashfs-3de1687d7432ea9b30... | NOK | http://autobuild.buildroot.net/results/09f350b62e2486404b78222dce211400bb233000 |     
 powerpc64le |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/f755406d8c0a119bead7b24d85b43d6762c06cbe |     

-- 
http://autobuild.buildroot.net
