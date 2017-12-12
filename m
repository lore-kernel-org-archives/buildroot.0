From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-11
Message-ID: <20171212070027.6D87F20949@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-11
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 202 |  22 |   4 | 228 |
   2017.08.x |  20 |   0 |   0 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mpd-0.20.12 | 7 
                 mesa3d-17.3.0 | 5 
 netcat-openbsd-debian_1.178-3 | 2 
                   pcre2-10.30 | 2 
                     gpsd-3.16 | 1 
host-netsurf-buildsystem-75... | 1 
make: *** wait: No child pr... | 1 
                    mpv-0.27.0 | 1 
qextserialport-ada321a9ee46... | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
                       unknown | 1 
                   xfs_rmap.lo | 1 


Detail of failures
------------------

         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/878730f10ffbf4813f837e981c647a614f4a374a | ORPH
         arm | host-netsurf-buildsystem-75... | TIM | http://autobuild.buildroot.net/results/cc56043851e0ebdf7a50ec741be34a97ab3bdf13 |     
      mipsel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/f16570833fb83cd515b520ae9bbe3c3d23df2ce8 |     
         arm |                  mesa3d-17.3.0 | NOK | http://autobuild.buildroot.net/results/6075ccd980fa337116dbf34903728cd30c6b551d |     
         arc |                  mesa3d-17.3.0 | NOK | http://autobuild.buildroot.net/results/8cc339536b2fa760116e033c220fabcb1d7adab0 |     
    mips64el |                  mesa3d-17.3.0 | NOK | http://autobuild.buildroot.net/results/848109624697ed478fa988f713f09324e50aeed2 |     
         sh4 |                  mesa3d-17.3.0 | NOK | http://autobuild.buildroot.net/results/66bdb16b324477cb16b7e766dd5e690124c5a569 |     
     powerpc |                  mesa3d-17.3.0 | NOK | http://autobuild.buildroot.net/results/be194c0fb51647641150e58c73ed5f262b70fef9 |     
         arm |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/949bf9d42c82de34f3328a31bb122c81243e5418 |     
         arm |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/b12ca93cb3ad52e601cc99f54a867e21a28fd1c9 |     
    mips64el |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/7af8e96fdf823bbc427caa562d6d0a130a4875f0 |     
    mips64el |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/3b217dfdceee33343cbe3b3a9fa5643c590942d7 |     
      x86_64 |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/ca5a0daa07d3ee69646fb54e9d0db7818cfc77c9 |     
         arm |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/5367fc7b7e9fed9a004be5d512acd6bdbe9172e1 |     
microblazeel |                    mpd-0.20.12 | NOK | http://autobuild.buildroot.net/results/43992c6617ff283aa5a7a1ad99e2866555347d12 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/1437b67ef8e9b2029b16c4956cfad549b86a0a10 | ORPH
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/2d416097dc8906ce4cc4a31cde66ec79d63fbfb2 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/01a0eae03dafa43e58699b15fc72b1b7a66f9007 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/c34d75df90165ec5038bdf2a5ea8807db245bc21 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/aefe5eec10e3d68652468d7d9292fc748bb4de90 | ORPH
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/e264910c20d2e5303058b1df9a100e45db6c058c |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3507b49510eadbd4154dcfdacda29e0815b39e5c | ORPH
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0d6fd4e47866bdc19cad5d8183d8d02696b22121 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/3dfd653b95cbf18277f8f2d75499b8e9dab19b8b |     
      xtensa |                        unknown | TIM | http://autobuild.buildroot.net/results/4406a1f2aab6c1b46833579cfb5a9b6a9da98156 |     
         arm |                    xfs_rmap.lo | TIM | http://autobuild.buildroot.net/results/b0a9287fad34941ae2a1c07f12d5284499f54c15 |     


-- 
http://autobuild.buildroot.net
