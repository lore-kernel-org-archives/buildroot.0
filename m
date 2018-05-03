From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  3 May 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-02
Message-ID: <20180503060016.3C37E207B3@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
      master | 137 |  55 |   0 | 192 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

        wireguard-0.0.20180420 | 1 


Detail of failures
------------------

     powerpc |         wireguard-0.0.20180420 | NOK | http://autobuild.buildroot.net/results/b21be50fa6114786267e9057a388361f91dd1ea4 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           execline-legal-info | 17
                     lxc-3.0.0 | 9 
canfestival-7740ac6fdedc23e... | 5 
                cifs-utils-6.7 | 4 
      gst1-plugins-ugly-1.12.4 | 3 
           libfreeimage-3.17.0 | 3 
     python-subprocess32-3.2.7 | 3 
                 host-rauc-0.4 | 2 
                 libcue-v2.2.0 | 2 
                qt5base-5.10.1 | 2 
                  host-go-1.10 | 1 
               libupnpp-0.16.1 | 1 
                 mesa3d-18.0.2 | 1 
                   msmtp-1.6.6 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ff9d39b95546dcf5c886dd64aa27ae6c4b44b707 |     
     powerpc | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/634b3d5ee1b8c4c3725d3adfa3666abfb42472cb |     
        i686 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/08cb78f1fe80587863fd9faf424ed7b06d68f048 |     
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/13196dd779bc9e3b172c74851546dd4c4752aa02 |     
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d0a3c13456d4254acaabb4a115e5c352907c67fe |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/5ac931d206164d8661c884f36819f2bf1dd7622c |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/3bad9caecfb9f90f271bc89c5c4905729500b6cf |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/8ce2a7fa0e390fe2e991dee5ffef4f81b70bc935 |     
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/2ab4f449fc62b75aa799fc0f6a4f931dcdc126e4 |     
     powerpc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/e6ddc7442229731bf6fc9ea66f7aab236580b348 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/501652c3cc930fbedf32fd64ada04cc45d29d9cc |     
        i686 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/6a13dc487982bc63e3ac84bc7e6e6ad5208b17b5 |     
     aarch64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/82a45ac87270b7c8d8d9e97df865a7a76689b49a |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/250da80ec8d61884193d904a323dc86140c3f37f |     
     aarch64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/8c30ac6b046d1ace00d1eb58531c8ed77fa5c1b2 |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/2aac2c739603c6d1ae6f905fee892b0e971878e1 |     
     aarch64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/c7d1e8cc983caa8a447de4a7dc71330cf7bea2bd |     
microblazeel |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/000f0cf40c9b98a5ca2748d7b82df07be26e07c9 |     
    mips64el |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/8838ca7c3821b6f6db27c8591afb479a54fb2cd2 |     
     powerpc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/f17de2b3a71573e5d9fc1f230e060cc9eefd1ad5 |     
      xtensa |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/6590a43de045bb1e7053db62e4e4c865c10716df |     
      xtensa |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/a9389484c510f07b2014e94e82a86070b04d26ca |     
    mips64el |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/10c1065bc1ad9e9c9e112d43a6728c9f1859c171 |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/1fcb9e883fe0da24298b3586a565e1ebc3694560 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/0d2900b6db85b983fb104ede50a27f0cf1ac780d |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/dd7b4b48cb6b585228d76697bb89c0f9f583b4fc |     
      xtensa |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/ee97fa0986395b30114000359fdd5fe7a0ea0d73 |     
        m68k |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/d43bf414c8bfbd0620c1f1eee81fc11dac594b1d |     
     powerpc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/cdb66ae7883b2136f48f80882dfe6bdaf6261784 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7723887c89afe2e80a71b9f3257124b81a58a59d | ORPH
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/000b1e901237c89155bf619cac37564910bd21b5 |     
    mips64el |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/17eaff164708e1d151630fdf1345dcf9073b842d |     
        m68k |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/c442d081b0e4b91b71c4610940d887d8e82973ea |     
        m68k |                  libcue-v2.2.0 | NOK | http://autobuild.buildroot.net/results/154143f751d043153a2aca74ba628b0a7856ea7b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/94f124e38706c6cb81a7bb2c4d188c737d7a2d42 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/99e11870c75e52da19c77a6bf550fae13e6345ae |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ff95a559255c7d213990999ac1fba35aaa7964d3 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/57fb3fef7356009387d51d206ca51ede54351b87 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d1a48065cfa5ef6687d871c4b4162ff84c3316da |     
        m68k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/e6976c6eb58c48f7780a7e0380ec558c9bd1f9be |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a0b663e3e4b8a05fec69af62967a3e5f22488ede |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/859b5668cb9cc73be58641dc6966deb177224fe0 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/131cdd786ead881bd08ccf70e054212306364e01 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/575e98fa5c49b64f76333a2683530f390c63efb1 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1d96048c310c9f67c133db54953e93417e1e0db4 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ec051d14467cf8bae2d49109d551a5406800b6bf |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/88a6059da10d7b726bd9783608372268e461338b |     
     powerpc |                  mesa3d-18.0.2 | NOK | http://autobuild.buildroot.net/results/f86956d6a42de7c01ec131435e97acc37c041df7 |     
microblazeel |                    msmtp-1.6.6 | NOK | http://autobuild.buildroot.net/results/1bc7cb9a2dd1af746c78f3150528206b7256e40f |     
    mips64el |      python-subprocess32-3.2.7 | NOK | http://autobuild.buildroot.net/results/e5f9e96d02512359348886a9db3aa4cea9db2081 |     
    mips64el |      python-subprocess32-3.2.7 | NOK | http://autobuild.buildroot.net/results/af1c0dbfcc27fa93992de57f986657d65163800e |     
    mips64el |      python-subprocess32-3.2.7 | NOK | http://autobuild.buildroot.net/results/8ba4c75d724b45c4fe10b4b6c90602b68a811fac |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/f1e0394160dba77ca3b64a44fbb81f046836c22c |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/c437817fb90dc42b7ac8306b3238718b80254240 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/54a6090d7f02f7645ede21db7f959aa8e83a4bc2 |     


-- 
http://autobuild.buildroot.net
