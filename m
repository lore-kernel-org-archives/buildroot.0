From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 08:29:03 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-21
Message-ID: <20170222072903.1B37420B91@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-21
================================

      successes : 239
       failures : 20 
       timeouts : 2  
          TOTAL : 261

Classification of failures by reason
====================================

             berkeleydb-5.3.28 | 2 
                 sngrep-v1.4.2 | 2 
                  cppcms-1.0.5 | 1 
             expect-2014-05-02 | 1 
                    gdb-7.11.1 | 1 
                  hwloc-1.10.1 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
                  libsvg-0.1.4 | 1 
            lttng-libust-2.9.0 | 1 
 make[1]: *** [all] Terminated | 1 
                    mpd-0.20.4 | 1 
                    mpv-0.23.0 | 1 
                  nodejs-6.9.4 | 1 
            perl-net-http-6.12 | 1 
                 qt5base-5.8.0 | 1 
               qt5webkit-5.8.0 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                     vlc-2.2.4 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f894e906ee1360da1fba7ca09c9d8837ea420011
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/40423aa6c8f6fe66c771cca3e09b21e15525eb5f
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/aa97fa15486e99959b56b16e62974c961d475662
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/502bc0e2f3962984eb4404ece1ab24f630d0476f
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/a4f7a789cc6d7a47494b326a7dec1217377c4dc4
microblazeel |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/5ae17a9efaee645dcabb7116c7b7f1fa5b51e01e
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/9d0e96ea9a86e0923bf26987e162f9f9499521b6
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/98385f0b3864eb52505331e58d96f2f05d6e38da
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/30624d08a26c083920bdae122a4319ce55ec731c
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/113fa95a054df183014b43ec36b329f9c59bd356
        i586 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/2e6c987f13c3673715b853d8ea0314a99cc03d8a
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/4916f49a345048eae636bc9642e59ababb640b3b
         arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/8ac768d049f13cf0ab62db611c100648504db614
     aarch64 |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/74145f6e1a8669647826d9ac74adf0e37690e783
         arm |             perl-net-http-6.12 | TIM | http://autobuild.buildroot.net/results/b17ab58bb6287d86fef0e985f1127d349d5808d4
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/779fd562c28f3a47f9caea7d0e0cb1dcda7fe489
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/f407ca9245e2445619420a9dfd595856729a2b2b
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/5f7a9bda07e286538da25ed5704835f7312f7fb2
      xtensa |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/7b5db21a6c568e6c6c8fe2b5d5a2f5ca24df510c
         arc | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/37ca35854a36fab1690f6ae789e338a1e55307f6
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/ebae0ed90b88db5a3b34a46f2ca1ff97e01fe83c
        or1k |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/3fe0d96cf13af12b0051a95f7865d4e38f4a78af

-- 
http://autobuild.buildroot.net
