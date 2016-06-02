From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Jun 2016 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-01
Message-ID: <20160602063020.63CAE102A7B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-01
===============================

        success : 165
       failures : 46 
       timeouts : 0  
          TOTAL : 211

Classification of failures by reason
====================================

                e2fsprogs-1.43 | 6 
                    libiio-0.6 | 3 
                      make-4.2 | 3 
                  connman-1.32 | 3 
             libiio-legal-info | 2 
          chocolate-doom-2.2.1 | 2 
                    quota-4.01 | 2 
                wayland-1.10.0 | 2 
                    ficl-4.1.0 | 2 
                    cups-2.1.2 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
          binutils-arc-2016.03 | 1 
     host-binutils-arc-2016.03 | 1 
                   perl-5.22.2 | 1 
                 mesa3d-11.2.2 | 1 
               linknx-0.0.1.32 | 1 
             stress-ng-0.06.02 | 1 
                blktrace-1.1.0 | 1 
vpnc-70f1211f6f26e87e374d66... | 1 
                   erlang-18.3 | 1 
                 igmpproxy-0.1 | 1 
                wayland-1.11.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 lvm2-2.02.153 | 1 
            lttng-libust-2.7.1 | 1 
                pinentry-0.9.4 | 1 
                pciutils-3.5.1 | 1 
              kodi-16.1-Jarvis | 1 
                  hwloc-1.10.1 | 1 

Detail of failures
===================

         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/f6b5e8814927d9f4983d48bd82f674d98f66489d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/ca33ff6559788c16de17cb2e69cb76ef872087e0/
         sh4 |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/d71e09d1f6e1322c0c051bd614af0703b9a23d85/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/bf3c2e7bc2e862572692839ce1e3a5c9e9904529/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/58b9db701d17ef221cf220cafea2f7b5f59bd736/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/d4b570d7b572cd5639d002dcd17fcba5b50c9c79/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/387e6315889f52357983ba25749423e4ba44d119/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/e1ef5cc2ea8818c981e3c1a61fb512dd220710db/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/9cd3385d53889ccff78df0cd46f8779b09502123/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/4c24b14ed4d3db40c92d7f5084901054978f14fd/
     aarch64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/3bf38987bb6e7e5157dd6f29f67818fd2fee1f0a/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/5b55c0562f7b54567185d643d367757ba8c0dc64/
      mipsel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/73087d2805cc51b28005989eb2af1ca39224e5f8/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/8903e01890c4193fbb69bff364535d7261f27675/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/fc3621a3c79c9e8d50baa496e16e30783fa1ffbf/
      mipsel |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/501925e971badcdf7a7951d53c28c03e6afa6e42/
     aarch64 |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/b9efed3fbfe56ff8ef4b26ef6e3b0e791db1f0a9/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/cab936213b03020f5d7cbb6ce6c3a1633e738631/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/75b884d23c3c6b6e2d5e1223af143630065b6002/
        i686 |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/71ea95f1c813fcab0d4c14fc0a422629a2306237/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/b34e6b6e9e40e477b5fb463924d6a673630d4d71/
        i686 |               kodi-16.1-Jarvis | NOK | http://autobuild.buildroot.net/results/7c60d159618a0bd4a0de97d8e269657d844ccbda/
     sparc64 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/90f305f3aba5a4cdf2f694357f7bc82714fa7399/
    mips64el |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/d98d18d03449d59679bf6bdef9a5403fa8e5bc8c/
     powerpc |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/bde710e9d1ff6d7dfee32566051bf794e5010a03/
         arm |              libiio-legal-info | NOK | http://autobuild.buildroot.net/results/02e4ef475426b1ea87b4abb1315b2ef6df20a139/
    mips64el |              libiio-legal-info | NOK | http://autobuild.buildroot.net/results/7789da71553bb633cbea6db83faeee061155b9f8/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6480f95524825163dd6f7c177ad01efff5d1b0c7/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/7e56d80fcd2306c614e6b765198498760b15f50a/
         arm |                  lvm2-2.02.153 | NOK | http://autobuild.buildroot.net/results/efd70eccec7b0378353d0c782ee86b0eee9c7bd4/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/133cdeaa0644405568c3e8fc003d73c4570fbc82/
     powerpc |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/e162f46458f4948c75550d47710bee92f1602273/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/7ca74c9ea36321e1940ee2707af5745b7d4498d2/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/e130788eb3d83103eace8f218226b7347372c223/
       nios2 |                 pciutils-3.5.1 | NOK | http://autobuild.buildroot.net/results/3d708deea8a89b07be38fdce42240339925ea0d6/
        i686 |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/48e32cc5db0fec3aa5d9221c3e103e94b6899093/
        mips |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/bd6f223e431c18c8c0ec56a444299703c65fcfb8/
      mipsel | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/ec1ba69bdbbde44a9a462127ecc05447d4cfb141/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/033d14ba408f2ae95689b4ff75a20b467f44f189/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/500d6f2ab0ad3766f9441aa9753649b80ed4ede4/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b61526ef624902be65f7f0129da4a859d3c3b297/
        i686 |              stress-ng-0.06.02 | NOK | http://autobuild.buildroot.net/results/1e20533d740f70020cc7e02e4c58945839e52a14/
         arm | vpnc-70f1211f6f26e87e374d66... | NOK | http://autobuild.buildroot.net/results/49b53794af1c7bfaaf46da1fa62beae8b6264303/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/8ed0fdb6c4a57156baabab12035b24dd72004cd2/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/4c9de0561790688ff29c893ae1c9806ade373d09/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/38f799b49894a6a37cf5bc7855d181159e39ab36/


-- 
http://autobuild.buildroot.net
