From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Dec 2017 08:00:30 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-06
Message-ID: <20171207070030.2885920C3A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-06
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 205 |  20 |   1 | 226 |
   2017.08.x |  20 |   0 |   0 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              host-erlang-20.0 | 4 
kvm-unit-tests-kvm-unit-tes... | 2 
                  physfs-3.0.1 | 2 
                busybox-1.27.2 | 1 
                      fastd-18 | 1 
           host-mono-5.4.0.201 | 1 
                 libdrm-2.4.88 | 1 
        ltp-testsuite-20170929 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
                 mesa3d-17.2.6 | 1 
                    mpv-0.27.0 | 1 
                    php-7.1.12 | 1 
                 qt5base-5.9.3 | 1 
               tinycbor-v0.4.2 | 1 
                     xen-4.9.0 | 1 
        xlib_libXxf86dga-1.1.4 | 1 


Detail of failures
------------------

         arm |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/72c30feb3bc3deb5a8d6d465652d789454353b75 |     
      x86_64 |                       fastd-18 | NOK | http://autobuild.buildroot.net/results/33cb32120e8e8553f6f7118107bd1f911fd981f6 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/a7e846b92ed304828d6db07d1a502b5e9268ad58 |     
     aarch64 |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/67eda9d82753b48c20981b4250f8ad2af2c070e0 |     
      mipsel |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/62e8f5040b2b31edfdb472384366d12444a8a826 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/8a56cb837e3d96bba72c7875253b367d32d17df0 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/9578185b07103ea6cb1ca48e652377a5f53989fd |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3a601bd5c511908bcc0e55bc4b6673aa242aa273 |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/3bdeac06fa334dfaedfb9051506c6cbf10e5e44b |     
         arc |         ltp-testsuite-20170929 | NOK | http://autobuild.buildroot.net/results/6c0506423c76b61018da26c2549570e3d9eb5763 |     
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/9d0b6242242e0eef64853db58bca444d170f3752 |     
     powerpc |                  mesa3d-17.2.6 | NOK | http://autobuild.buildroot.net/results/a766474ec62f39158b3780e0b5a8115c3bc70bce |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/199dc7d793ab18bc821bd458db73145098f14d8a | ORPH
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/c386524442cc37dbf192389fac61e2eed720f6e8 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/3a640850f19d8ac643d3540242e19ed57d6122e8 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/35c42c6110787c37701fcdd3b6cf131db7f143d5 |     
         arm |                  qt5base-5.9.3 | NOK | http://autobuild.buildroot.net/results/583ae5851507aae959d0de2d2fb0a1a06ba9fd75 |     
         arc |                tinycbor-v0.4.2 | NOK | http://autobuild.buildroot.net/results/12c6d901321e946c4b4a65026592f5cfea2b04b9 |     
         arm |                      xen-4.9.0 | NOK | http://autobuild.buildroot.net/results/2c9ab142a0907ca35bbf5e615bfeb43e20c5da0f |     
    mips64el |         xlib_libXxf86dga-1.1.4 | TIM | http://autobuild.buildroot.net/results/2a8c036b64732e0b7c9f1c9d94c31520e126d8d1 |     


-- 
http://autobuild.buildroot.net
