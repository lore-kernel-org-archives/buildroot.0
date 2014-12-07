From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Dec 2014 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-06
Message-ID: <20141207073012.AB3671013D9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-06
===============================

        success : 184
       failures : 26 
       timeouts : 2  
          TOTAL : 212

Classification of failures by reason
====================================

                  guile-2.0.11 | 6 
             armadillo-4.000.4 | 2 
                  perl-gd-2.53 | 2 
                  thrift-0.9.1 | 2 
               libsigsegv-2.10 | 1 
                    qemu-2.1.2 | 1 
                      qt-4.8.6 | 1 
                 opencv-2.4.10 | 1 
                  python-2.7.8 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                     vlc-2.1.5 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                 omniorb-4.2.0 | 1 
               iproute2-3.17.0 | 1 
              fconfig-20080329 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             python-webpy-0.37 | 1 
                    exiv2-0.24 | 1 
                poppler-0.24.4 | 1 
                  zeromq-4.0.5 | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/fd3019dee3f0464056a97ae309b7ba098e8c7c1f/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/2cd977cd903a6fcdeecfad95c18f340f296a5eb8/
        bfin |                     exiv2-0.24 | NOK | http://autobuild.buildroot.net/results/7ccc2a377b0ddf48dad189aedfde30608f0bca71/
        bfin |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/77899f882e04121ca5f2b96f0df9f24ead26d12b/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/4cd28de7d06a07c25d95bab144d8cd4c5bd4eda2/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e3c92c38c6b812d36ca12ffc8e7a0a4ccea34bc7/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6053382dc78e6ddd588ba87be43b768c878293d5/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/759181618b1539704573a6c75e0af80035c51524/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/18b6fd4f86d93dc9f4b4d5b255b0c88ac1516443/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b0bea1781b4640b5f749e89d8f8e0105d3beaf47/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/82d6fada49992a8ecaf87d357a21213d4b12a047/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/41948a4ebee18c63180a0da46a2ee759ac98c63d/
         arm |                iproute2-3.17.0 | NOK | http://autobuild.buildroot.net/results/570683d849c82a68b10639a990d2693601270066/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/935c9fff30b4cfa0ccf2d5a8aed7698fead3a470/
        i686 | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/febba3bb234c241d78cdf02dc8b8f8ea28735a07/
    mips64el |                  omniorb-4.2.0 | TIM | http://autobuild.buildroot.net/results/b5cf7318aafe9128f419e7025d6d76ccb01b9cbc/
    mips64el |                  opencv-2.4.10 | TIM | http://autobuild.buildroot.net/results/0d527fbb11d2d4cf01401f3dee2dd4eb0163c4ba/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/cb33a6a2e4faf1afced4c1f1b087be70134a055b/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/f944c55249b7c8396d533e4b5fedfff57c19e346/
        bfin |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/c0d24ada06f1bf739629c5e249ab7f0e432c5b26/
     powerpc |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/447a2a65c54cf09c479fede9e7d733ac54e033c3/
        mips |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/86b1c53a7cd842f65c8152522cfe4e64147118eb/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/5a93cfe78af78da4520db830632b7a59c375cc58/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c3a869f75134d78105ec4e39f52a937676b60349/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6f24874af94310658b2c02914eae4330445a5243/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f68a6e6a68b08d35ad336d6fa1bbd376c3096190/
        i686 |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/3e7e2a4ad632f21e6a07076673cab6fd8e5fc536/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/79ad6bde96ccccfb4267f20e8d7ea56ba02580db/


-- 
http://autobuild.buildroot.net
