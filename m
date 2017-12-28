From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Dec 2017 08:00:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-27
Message-ID: <20171228070016.DE34B2073B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-27
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 178 |  62 |   0 | 240 |
   2017.08.x |  19 |   0 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 libv4l-1.12.6 | 32
              syslog-ng-3.10.1 | 10
                    brltty-5.5 | 7 
             libostree-2017.15 | 5 
                    php-7.1.12 | 2 
                  ffmpeg-3.4.1 | 1 
                     gpsd-3.16 | 1 
              lynx-2.8.9dev.16 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                     pound-2.7 | 1 
                qt5scxml-5.9.3 | 1 


Detail of failures
------------------

    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/ebfd7e23756c31e9096055cdfef205ab239a77bc |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/872cf667895ff13a3f3597d9f369da7f735b3745 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/acc1e28a850cc7b98e5709f7862043ef9b3d51d2 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/7c6a4628de634438bdab37809ca0d2a4a8697eaf |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e6be4a7da4b9eed305e9949f1aeff9582662515c |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/396e429a4f5c97513e01b99213bc9df16b90b518 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/872ac91b1e51941ef40469340dcb16aa6e2ce75a |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/385cd9624b8227ce7265ce2ee60a84963db05b67 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/b2ef0e5bca011ea59b1194687eb34e94d52c04e8 | ORPH
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/ebd987dcfa9ad79e1c1a888ca0323677ac2a707c |     
      mipsel |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bd53c2558feaaf2ce082abd3d6c602d69e9f55c4 |     
        m68k |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/ab43b00902a02419cdb9aac370de7da0bf356b6d |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/2293893d8b44432a4a380c259859077e29ec9892 |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bce02df51a4af585c0900a6e3dfb6516acbb6ba8 |     
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/784465f4079cb8dada324793080daa9f64047299 | ORPH
     aarch64 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/490ae17854b47407a83602d9ee90b0fdfabd901f | ORPH
      mipsel |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/196bffd3d8b5488973db84eb0343eb376940b80d | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/c996fd385a0ead2f88fd01fe6d5a68a02da9331c | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/bf78a0638c8357f88fedc161f2656c45f11a9ae0 | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/794656193bef4b6dd47fd604eabecac4e738efc9 | ORPH
     aarch64 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/e628cb001e689baeb11d0e12d9a118660d28d5a0 | ORPH
      mipsel |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/d05de27e58ecc559e6f07c084891bdc4166ced77 | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/88ddf0ddca8e11fb37bb422a27a50e6383c20b19 | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/ff49d7f121f81087304d9df815afbf8db45a8400 | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/92bd49d881ed11b2540e434af57ae7347ac186d2 | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/2a9d6fb76f5a67a1af15bd557132077ca5c8fa68 | ORPH
      xtensa |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/44d0ec95729e6395c1129eebbf2bdd1a9d2cd7d0 | ORPH
microblazeel |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/63babd09b8a64fd4da80d99c4c2aed25e5532aec | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/46100c008c894e3f998227b2a9c9a79bfcbbda7c | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/400c15e7b01e223a37a4c989d5878b465423901d | ORPH
      xtensa |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/5f4efa425955161dfddc2cbe5c8c429c1fbcc4c9 | ORPH
      xtensa |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/f6da245c3a1e5e5f06e055024551780d8aa598fb | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/107fed5621e0446376893cdbb1514b37ee0cc8e2 | ORPH
        m68k |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/b259078d21c94bf764a8cf7039294fe3e913115f | ORPH
        i686 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/d2f00f6b8b69b85041a5ec9c3248c71915c83a06 | ORPH
      mipsel |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/6e28a990400f264b2a43a611d84f07aa3284fab3 | ORPH
     powerpc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/15c965736116bf8e9954c2fb165524744257713b | ORPH
         arm |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/186cea687e9176681bfce03f71a88775585e2f8d | ORPH
      x86_64 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/b98251dc0dcbf8ec57c0d5ce1d379c0c67d2380c | ORPH
     sparc64 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/383e1e0c689a94393cb4c00ba024a552e109707a | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/709c01f0427b1e44fcb3a91ff827d399a429d7d6 | ORPH
       nios2 |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/51eb025a1c92848f94616e043f42d2cd8a401e72 | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/ee8b7d7608ea01dc6adce659cf1a3dcba4f3268d | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/a040cfbd025678d0d8c8bcaa28e6d71c1e806bc2 | ORPH
        mips |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/e3965ba23ec1a08ccce4213e0a1c8df6f75d6d95 | ORPH
         arc |                  libv4l-1.12.6 | NOK | http://autobuild.buildroot.net/results/7942ead4ff5a822815951e9472dfcea00fbbd39a | ORPH
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/4e0567f57a3d2ee08c57fbf704083e9f27be0146 |     
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/108e831906eeedc990a07aeef0cc7550f2c23b8f |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/db72ea187b364314efa71d5b0253e907f89ae824 | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/20366b27bc252e4b9a6fbe9157da2d6ee9c7d7db | ORPH
        m68k |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/8f625d30f7185c04a4a8dd6f3947fc1a83dc1563 |     
   powerpc64 |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/9e650f6147f7858be74782806f4b8d2aac4c689a |     
        i586 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/da84b8a4c8f3bd258b19e902485b79da7d725bb9 |     
     powerpc |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/4c2124a97e6bf469fe30f736f00b6587367fc214 |     
       nios2 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/cf81e8b9df6657369820f72e12daaeb18c21b5ab |     
         arm |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/da438932d57f45156b7c3e33496ca358978d4905 |     
         sh4 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/ff5e46f5c7e5be45eff5e7a19bda2035d45431ae |     
 powerpc64le |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/82e859aa0dd5e4745b820324913b7ba1ee147dc7 |     
        i586 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/a2d1c444420d0e4338674bfbf6c53b36d56f6154 |     
    mips64el |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/f750a1f5e94122e0bf46670f3ce6a10e1c26fed1 |     
        i586 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/ff76f2a3ea22e1b9113105d7a64146b69cd20eda |     
   powerpc64 |               syslog-ng-3.10.1 | NOK | http://autobuild.buildroot.net/results/6612d80d12227c833f7c5712ee5d9a3ff0d8f994 |     


-- 
http://autobuild.buildroot.net
