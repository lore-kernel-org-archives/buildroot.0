From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Jul 2018 08:00:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-23
Message-ID: <20180724060010.B564E2093C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  13 |   0 |   0 |  13 |
   2018.05.x |  14 |   2 |   0 |  16 |
      master | 123 |  37 |   0 | 160 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 
                  quagga-1.1.1 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7c704d22ce6e72f91833975915983d234b09f664 | ORPH
         arm |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/350e135f179a198cfecfca1be14345c6e94af1c9 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 8 
                  boost-1.67.0 | 7 
              libostree-2018.7 | 5 
                libmpeg2-0.5.1 | 3 
                  samba4-4.8.3 | 3 
linuxptp-303b08cbf55096aba5... | 2 
            perl-net-ssh2-0.69 | 2 
                busybox-1.29.1 | 1 
                cutelyst-2.5.1 | 1 
                host-m4-1.4.18 | 1 
          host-waylandpp-0.2.3 | 1 
                   libnss-3.38 | 1 
               mono-5.12.0.226 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/20b54d0d84b98af3fb64f3452be47005f441fe42 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c49c36abbacda358f21f6565d1b5851137417469 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/57c9d63c8e95cecc464b18d5f076329e4ab6ac12 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/07a75279cf75ed42233edaaffca709902ccda58b |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/462a886dec36071d1ebe21a486d9c8b55b7b28e2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/dde4c5e91302cb6bbc09be7816ea79683fd9d960 |     
      x86_64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4456efcfa802c3cdfee15414af80acec15e7e7d7 |     
    mips64el |                 busybox-1.29.1 | NOK | http://autobuild.buildroot.net/results/b2676ba950f27db1a6599d20becc1e6f8be58f70 |     
        i686 |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/7716878c3a26b93417188ad7eac91ace172815bb |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/e30c14a885477467c7c08cdeaee752c4a440c40c |     
       sparc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cde570ebd60409f4f1567c85934b7cbf2710b83c |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/83151324e1442b39c8246428e3f2dad49b52b3b6 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1df5b4c48ef59baa4db1a2a0816a9bc8353a4f18 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/98181b08896568b4ce81107d4589ac0838ecd45c |     
  aarch64_be |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fe3ba888d01a242a294bbb8bdb4acbf5e7a4140d |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d5839cdcc4fde49bec9decaa0cdeb1e7271b35c4 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b476e026d65b1e059a0e5175d873d7f4f0525c3c |     
         arm |                 host-m4-1.4.18 | NOK | http://autobuild.buildroot.net/results/f55cb75792a7abb80cfcd363a0a4192f17dd902b | ORPH
    mips64el |           host-waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/8c62bc30a5078e709625509dbbdcc49489a438e7 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/03960c0f132b4652e4b80a1e4eac41d2952f2249 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d4135ac514305debc1a4db8e23b75506ff713ab1 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/2cb164f3a611ef843fef0a4c864d8d79883da9f6 | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/0e2833be3c0a835ad606f772d1490c2102b4a332 |     
       nios2 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/5d03d4807f334f5bc0ea487d274b3be6dd8efe78 |     
        i686 |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/eaf57980cee5d718fdbed91736db446bb08755c1 |     
       sparc |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/d6d302c0c107340a3af972442c4b68f0e23b8bbb |     
        m68k |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/e4b1a820a9fa0fb0741bfd26e9c4826858021a4f |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/00a9ba2f3ba353595fae357e2ca618391b79823a |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/cf54d51e8df04e6f463d82cbaa076866724c3a38 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/89f73abcb2077d8ea127aa0fa957a2e8e0465daf |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/f3fd8d2ec027adfaf36d7b446a52133ec8ebac9f |     
microblazeel |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/86ee10831afcee3dddbc1de35fc4fa76a5fff9f6 |     
         arc |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/29c2e52c054e403e361678e7be9255e16686fdf0 |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/37af0dee9f10a1fe990840a83b94b765ac9c5cbe |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/7d643e1c28ff8816c24aacb4c287cacaff0a3fa6 |     
      xtensa |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/9e4ccdeaa7e1805737a5b86210307b3829313fc3 |     
      xtensa |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/1d0b4aaa85e671e01ed4bf68f785f3659d163017 |     


-- 
http://autobuild.buildroot.net
