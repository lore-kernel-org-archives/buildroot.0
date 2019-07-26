From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 06:00:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-25
Message-ID: <20190726060121.B9EDA20032@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  15 |   0 |   0 |  15 |
   2019.05.x |  12 |   1 |   0 |  13 |
      master |  89 |  25 |   1 | 115 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             qt5wayland-5.12.2 | 1 


Detail of failures
------------------

     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/835605c4cfe075ea3b35432923ca5b7f9c8c0076 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 7 
              iputils-20190709 | 3 
                qt5base-5.12.4 | 3 
           can-utils-2018.02.0 | 2 
fs/tar/tar.mk:35: /data/bui... | 1 
                     gzip-1.10 | 1 
             host-cargo-0.26.0 | 1 
               host-efl-1.22.2 | 1 
                 libv4l-1.16.5 | 1 
                         mimic | 1 
                   mimic-1.1.0 | 1 
                 python3-3.7.4 | 1 
          qt5multimedia-5.12.4 | 1 
                       unknown | 1 
                   vlc-3.0.7.1 | 1 


Detail of failures
------------------

microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/4faa192fbfd3f5c9410554bd54237b9bd3f6a5e6 |     
microblazeel |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/015d793190fbf702cd78758a60d1e4211ae1d7d0 |     
       nios2 | fs/tar/tar.mk:35: /data/bui... | NOK | http://autobuild.buildroot.net/results/db4564844f5042eda90cf7f9fceb0213a98dc69d |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/2567f0cabeda310ace890a626e73926356c20829 | ORPH
        i686 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/cd65f2a4d5def797e47f8ae277f64e6b3cbf5ade |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/2dc65efc17b888951e3d3716360a50c92a450ba2 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/8f2f389b21cc8acb0ba5710e92d438383a3e35fb |     
       sparc |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/dc62fc1664faeb6de83d30814619574527130c49 |     
     powerpc |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/0a377241757840c927d6630876e83fbe52d4ae88 |     
        mips |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/512bce0cc574ea5d8187a27ab315b629a3737a40 |     
        or1k |                          mimic | TIM | http://autobuild.buildroot.net/results/b9218567c863ebd9d32dac235a0f29089b685276 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/483ed11cd6a43786ea89193722eff2b6acd83b64 |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/5492e3da1f6b60ab7b312d897bb3fe3a92c5a6ae |     
         sh4 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/02ea4e07e2b722b1bf36ff70c3a256e72b25ee7d |     
microblazeel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/ec086a5bc869d342b5eebeafcbdec2829667c319 |     
     riscv64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/245bb3458abe8ab7d55e428f36f564374b9f6ff2 |     
     sparc64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/b3b556bfb73f9fa69489223b0287fc29845e2cd9 |     
         sh4 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/8b2f9e62147fb36f6e181b1065fe243b7f000eb9 |     
       nios2 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/7c3c57fde568988637207e294f79b5e077eb1c70 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/cd2ad0106d2b30221cf680dca8e5e8b4f52a5811 |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/edd064b106e888501ee556185d7c816bcfc03b32 |     
      x86_64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/0cf3668949beb73d6ada7b08b5d2d423cadb08fa |     
     aarch64 |                 qt5base-5.12.4 | NOK | http://autobuild.buildroot.net/results/e6746b8a332a3a224d079f51a8615dd83af318a7 |     
     aarch64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/0f182109e8af11a14ab58e8341516c7bdac18ecf |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/195db7f0ffd210f69c3c1c32119c4db94351340f |     
    mips64el |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/5e855d95662ef12425579a43610fd6a38a28dbda |     


-- 
http://autobuild.buildroot.net
