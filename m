From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:02:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-09
Message-ID: <20180210150250.AF177203A6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-09
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 152 |  37 |   2 | 191 |
   2017.11.x |  18 |   1 |   0 |  19 |
        next |  52 |  16 |   1 |  69 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 11
           cups-filters-1.17.9 | 4 
              keepalived-1.3.5 | 4 
                nftables-0.8.1 | 4 
                  boost-1.66.0 | 3 
             bluez5_utils-5.48 | 2 
           host-mono-5.4.0.201 | 2 
                    sdl2-2.0.7 | 2 
tvheadend-e06ffd87beff16103... | 2 
         libcpprestsdk-v2.10.1 | 1 
         libspatialindex-1.8.5 | 1 
make[11]: *** [../../class/... | 1 
                 mplayer-1.3.0 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

 powerpc64le |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/a209573f2e7e2e9fbfcf48d5ccbd6e502c0dd98c |     
        i686 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c195a5d6ee355d0cc99bb049a0d578a6142aca76 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5bb2ca879238f2ff7a653545bc21d9200a51656d |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/262c99e35e7039c54b2b383bf2eb75f291ecc42b |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d293a5122d28bd21f77f1d1da8239b135883a997 |     
         arc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/129616fc5df33df76f28bd4215c2fccfc0d71669 |     
    mips64el |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/9119d44e83de8f6c830cc3015c6eb47304c61150 |     
      xtensa |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/34c82d013560a155e22ef9f978b26111b91ed346 |     
     powerpc |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/5a6873473c63515f893347c25c02dcb88eb894b4 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/9275eea4e9daa619cb8fdcdcb6ae8fb2a9888cc8 |     
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/095bbb17e0f66ac3c5e2daa315fd294e1e6c4cbd |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/000293275076c59e298d235e93ce9a92b66360e7 |     
         arm |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/c76b9f41814b6011e78489bfee9047c3b1aa954a |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/28b754a15b0841ceb8c8e6cb7375eccc38aab223 |     
      xtensa |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/f89cfe80735618340c854782258af16f564bc73d |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/d69aa11bd3fd84ff88b02f0e8b296832fc36ce30 |     
      xtensa |          libspatialindex-1.8.5 | NOK | http://autobuild.buildroot.net/results/bdcfd6628dc7d41f9cf01af28cf80917bc7856a9 |     
         arm | make[11]: *** [../../class/... | TIM | http://autobuild.buildroot.net/results/a8ef75d31304f7be5ce36bec33dea9e47c477726 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/527edb1e79fea02d4a3eb6aaa35818ffa8ac732a |     
     powerpc |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/5de06c1a2eb80b6fc2e749d457e6b5ed09e16cc2 | ORPH
     powerpc |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/b0ab6c8c765977cfdc9791d768d3ec2cf129d25d | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/812c9e41217e39974bf43bd5b4a1a554016ccb80 | ORPH
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/27b0c4c44bc0cc92c67468fa20bd169b4d61cf55 | ORPH
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/a7b7b9605ed8af26c06e016c5f17de9f1cd05832 | ORPH
      x86_64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bb45d3591e5b278da637be06499b1111d6e55f7c | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8dd0f20007dba2ae9f12194e5243abe411347934 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/7998c48bd6f34fa142fe969fa7f5c3930bfc9bad | ORPH
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/934daf66d4ef3480453268b8989619dd62348c55 | ORPH
       sparc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/ec7c77ce3689d5ab3cc351bf0877de9e42d7a3ff | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c6320dbfacdf9d427eee9a6316da8da9e126dcd2 | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bb621eaf89e0b3df8308deb68b4656988f65a107 | ORPH
    mips64el |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/1a2c6f1a987145878ae5f074893b6b5b7b4bcd41 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c0b8fac9b0f937d3a1134180d6c2b4cd59ba7683 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/93a652edd5935670746510b91e5846077a56a022 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/1bdda2b3ca624d5cbdb753656f5d4a220cb8c87f |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/6a685f25fce77207783287f14d341416456ef1f4 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/efac38114a2c132b5232542c6c108de9fcc9e843 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/14b9d24a07923bb24e19618699014f9b935b12f9 |     
     powerpc | tvheadend-e06ffd87beff16103... | TIM | http://autobuild.buildroot.net/results/7b0bb6aed435662e9210214534881f4f6717fefc |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/80291f6c97ec43c18efb27cab19e1ffe8530d56f | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    liblo-0.29 | 2 
                     php-7.2.2 | 2 
                  autofs-5.1.4 | 1 
                  boost-1.66.0 | 1 
           cups-filters-1.17.9 | 1 
                  dash-0.5.9.1 | 1 
                   exim-4.89.1 | 1 
               host-efl-1.20.6 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
json-for-modern-cpp-legal-info | 1 
              keepalived-1.3.5 | 1 
               lightning-2.1.0 | 1 
 make[2]: *** [all] Terminated | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

      x86_64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/a63353e8a8569593068e160c123f57f621d272db |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6b140d140533fc62ac6b86532c5a3ec67480720a |     
microblazeel |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/11480f244376b22c74577c239e9bd711fc5c394d |     
         arm |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/d3ada0ab4d58379f4bec55f28c9f6be3e7a9c974 | ORPH
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/004605f2bbe60c1655116ee6145af8c7bc50bbd0 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/a80c511d946c925046b035e76be623b4a2fb9bd1 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/0e6a355f882a203bbc1ba5dc46f79a727e4e9a62 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/d2a424d7f8a6879a91bee90b3add4cf690d3067e | ORPH
      xtensa | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/c28b903aa3d37164b003f7eb4a5a72c705ccd24a |     
         arc |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/16f341788460286bd0d81f02a1954509fcdf10f3 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/71a6d7e02a50f6cb53c70c38e82e2a2ae8af13ea | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/57bdb8c69f92dc1e66a108a998ac26665845486c | ORPH
      x86_64 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/bd4004c6c802c03e2d3a23e2710a21556353c170 |     
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/940208fc651eb9f7a48d32c4009a3dba8b6dfc89 |     
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/9e9175420a4393d89efacd1a24407d33559de50b | ORPH
     aarch64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/42430291660865eaad98b9ba59c9b713fdceb641 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cfc6b93225c2fadd6079f00ac6de3186643d567f | ORPH


-- 
http://autobuild.buildroot.net
