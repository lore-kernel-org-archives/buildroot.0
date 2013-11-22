From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-21
Message-ID: <20131122073003.1B835101305@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-21
===============================

        success : 77 
       failures : 28 
       timeouts : 0  
          TOTAL : 105

Classification of failures by reason
====================================

               libglib2-2.36.3 | 3 
  toolchain-external-undefined | 2 
                     rpm-5.2.0 | 1 
                libroxml-2.2.3 | 1 
                 omniorb-4.1.6 | 1 
                  iozone-3_414 | 1 
               w_scan-20130331 | 1 
                   attr-2.4.47 | 1 
             tinymembench-v0.2 | 1 
                      qt-4.8.5 | 1 
          qt5declarative-5.1.1 | 1 
               libcap-ng-0.7.3 | 1 
                sdl_ttf-2.0.11 | 1 
            libvncserver-0.9.9 | 1 
                      icu-51.2 | 1 
               bootutils-1.0.0 | 1 
                     apr-1.4.8 | 1 
                 schifra-0.0.1 | 1 
               alsa-lib-1.0.26 | 1 
                       kmod-15 | 1 
                 lvm2-2.02.103 | 1 
                sqlite-3080002 | 1 
                    ola-0.8.32 | 1 
                   mdadm-3.2.6 | 1 
                openssl-1.0.1e | 1 

Detail of failures
===================

    mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/417dac44eb077079f16a039881a45fa1b1782497/
    mipsel |                      apr-1.4.8 | NOK | http://autobuild.buildroot.net/results/20926ed11e7d86cd6c54700eb609b3fa1740b8a7/
    mipsel |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/03e5b85c71e5b624e42245f04d305042ec9136fa/
    mipsel |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/a51b3723f176a98abff809313a5f863e2539e103/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/fc643356587aaed0c3e7c2205dad0c40f02eede1/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/04896be35649215d8141cb737185c0c10ad11d12/
    xtensa |                        kmod-15 | NOK | http://autobuild.buildroot.net/results/622d25321d76f505de6aef4e33d0e421ba701de5/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/73c7c211a51c312bbe4eb6a540f3ad9c92c79ebe/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2cd1b11c43655cfd3bcbe8f6e127ea5e4a607e9d/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/bcbc99ec7987fe10d4e752eb96840a7ec1be2744/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d5c743294314584473cdd6098ebcfae42971803c/
     avr32 |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/e22d94fca3eabb4e54d82af04319f17ad8e10c20/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/c3082693fe0da0c54d4bbf950dd6d74e1395c1d9/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/b0b386969459dda9c294f1ccb4927ca225fa6bdd/
      bfin |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/52cc56df2aa278d92141918de74833d7e4fd3d47/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/5967dfd4bd7c2b68e2911a98b9b84c8fe7adf0aa/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/dfc083bff04eba68456edd359424293842b6f42d/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/2299063bb4e84833ee3edccec960d551b5fcdfe5/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/fd7e7e53290f235b540ed5f3c784e2584fdb41e0/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/82bb89d5b29dc6bd40f840bc04845b6c87157985/
  mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/bcff4b81bfbb1191f97317b0945c74d948c9774b/
       arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/1ec3664f28492bf3da53dcbe8ceeb165bce8df6d/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/f4ad0468f17520a645f029878876a972421a87b4/
       arc |                 sqlite-3080002 | NOK | http://autobuild.buildroot.net/results/4f09bbb3cf646e7e45c86d43a50b440245e136e2/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/bab68bcf8714f215ac0b0c2546fa06608377fbb0/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/8fb291915b3ce5dc955f5e7e60eea2a4a6202143/
       arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cc4c41b99005c82e546a9e2916df97180be32b2b/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/7ac90c6087640585a9afb0e31ad9e690eded89f5/


-- 
http://autobuild.buildroot.net
