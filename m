From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Dec 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-22
Message-ID: <20171223070006.5AAB520748@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-22
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 202 |  35 |   8 | 245 |
   2017.08.x |  19 |   1 |   0 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-5.5 | 8 
             libostree-2017.15 | 7 
         host-cryptsetup-2.0.0 | 4 
kvm-unit-tests-kvm-unit-tes... | 3 
                      qt-4.8.7 | 2 
                qt5scxml-5.9.3 | 2 
                  boost-1.65.1 | 1 
            ecryptfs-utils-111 | 1 
             host-readline-7.0 | 1 
                      icu-60.1 | 1 
                 libcue-v1.4.0 | 1 
            luasocket-3.0rc1-1 | 1 
make[1]: *** Waiting for un... | 1 
make[5]: make[2]: *** [prof... | 1 
make[9]: *** [do-all] Termi... | 1 
                   mimic-1.1.0 | 1 
                 mplayer-1.3.0 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                     nut-2.7.4 | 1 
                   pcre2-10.30 | 1 
         python-pycrypto-2.6.1 | 1 
            python-pyqt-4.11.3 | 1 
                    tunctl-1.5 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/e9ef653cbadc8eb05a7745ecaa17627b17f40eab |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/95238be32498a5835bfc4fd30faf7e28012415f9 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/9ce4773df3bb4c4e2845ea90169dab9d12b56394 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/71b8ad4c8bbbeb08ba35993a6972aa956f0c8c6b |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/87516211051bbf6b0b1eda9e73622d3784064c2a |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/d95d66c17c39e79e3c5716840d3d27d0ca494254 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a73a9b6c1cc86272c82f02ee5ef7dcdce85166d0 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/706da15a8bcdd95cb3e027b2056c5b6193ca816c |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/dcb51cbd8a4c38fc8112ec070d0426aa437d3fd7 |     
        mips |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/edca86bacfeb9f16e73ddfc9eb274e82f3f0d6c0 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7d10690f5aded5b005cf568f617bab768f2e6fc1 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fd8b0e7813036bfccccf1c3b58608c2b73198423 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/99cbf2c2b47a6b7bf0e0a08966e6808250721b0c |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ea6a6bc0886854ae32c7eb518b483d890493c96b |     
     sparc64 |              host-readline-7.0 | TIM | http://autobuild.buildroot.net/results/7cfb86d74b817d306473f6c2c98f09bbec059c34 |     
         arc |                       icu-60.1 | NOK | http://autobuild.buildroot.net/results/51b391fc80aa6752aac5aa1d4abf466b3616dc47 | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bf3d9e2f9a79567e453664998a5102949e261598 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/2df9e3baa1bfa370f3795c49f3e1628be30a0a4a |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c81e58b9e180cb454ff8809d8faa458946743bcc |     
microblazeel |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/c84b24914070027729876c863e190e9913982631 | ORPH
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/2431d35ce1a993b3c55d3df9a0d0c522f15c398a |     
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bdb2c84083af5e3e6798fa2ed5fc5c460be031f4 |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/7a973b102cd7b98d1b6706b4b9810aac07f3e726 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a6ab6203be74f461c69270a8ade01eda056a932d |     
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/3e54017f8a42f632c07b33aab4053baebe2c52de |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a1698c63ca2c46a8765f3fc3d46b5e2e3b9e3e4b |     
       sparc |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bb97b77c4202fd8d9f77fa5f6f1d5ed8c6fb9558 |     
     powerpc |             luasocket-3.0rc1-1 | TIM | http://autobuild.buildroot.net/results/3641ee2b1146534b33e7f0c1fe106e04da9a1188 |     
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d0be143d48e0fdd0084f3a0d08711d826caf3f6f |     
         arm | make[5]: make[2]: *** [prof... | TIM | http://autobuild.buildroot.net/results/c7b1c8bc1e70fad8e8e41d1145231f3d47acf644 |     
         arm | make[9]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/d72c4d0d8fcf5c7ca01bcf8d7b24740c643fa69b |     
     aarch64 |                    mimic-1.1.0 | TIM | http://autobuild.buildroot.net/results/3607f4751a2169782b8865dd58ca8f8dbc4da6fe |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9a38901939adbc1264e315005988c4098ec88a51 |     
      x86_64 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/bf1824f5db6006e0803a3b3228632cf9c9b033de |     
        i586 |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/5a75d44c028e77b58f0fd9ab794952f2b477dd84 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/ce7af08ff4c3b99a497524c5daf0ae12e700c7c6 | ORPH
         arm |          python-pycrypto-2.6.1 | TIM | http://autobuild.buildroot.net/results/c8d643037a12c2b02ebb307210741077e0a6bda1 |     
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/f492d12772929e55143c5f4aaf1c6eb7752d10a2 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c1262ace790608f4f49491ce9a0d1e885edebe89 | ORPH
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dc73ec2acc75056e485a831a4c661f8baf408199 | ORPH
    mips64el |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/8aee37a32ea2e11c7aad831adba69c0b77c90337 |     
    mips64el |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/168ff88aeff216ecdd12d2969a13a4e71599a7e5 |     
     powerpc |                     tunctl-1.5 | TIM | http://autobuild.buildroot.net/results/9ecb621b112942a39570fd76e8506953610f4706 |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

        ltp-testsuite-20170516 | 1 


Detail of failures
------------------

         arc |         ltp-testsuite-20170516 | NOK | http://autobuild.buildroot.net/results/c9b5e55a1c086d21ea24a17df0d21c241aa27960 |     


-- 
http://autobuild.buildroot.net
