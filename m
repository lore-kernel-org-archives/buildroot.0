From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 08:00:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-11
Message-ID: <20180212070015.5800E2037A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-11
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 188 |  52 |   0 | 240 |
   2017.11.x |  16 |   0 |   0 |  16 |
        next |  54 |  22 |   0 |  76 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         postgresql-legal-info | 17
                     php-7.2.2 | 15
                  boost-1.66.0 | 6 
              host-erlang-20.0 | 2 
             bluez5_utils-5.48 | 1 
                  dash-0.5.9.1 | 1 
               domoticz-3.8153 | 1 
                  ffmpeg-3.4.1 | 1 
             freerdp-2.0.0-rc0 | 1 
           host-mono-5.4.0.201 | 1 
                libcoap-v4.1.2 | 1 
                    mpv-0.27.0 | 1 
package/postgresql/postgres... | 1 
                pinentry-1.0.0 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2604a9fd7f9e3487a6e8e3115c2725169c3fa265 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/cb5cc106ffe3c1c2ddfa593251efba3277908050 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/badf3ebc06c60052d47cc964160616815f83b56d |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9a9e1285bfd341241375bf7c049dd8acf94dc311 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9ee9b759da145eef7e99bce3dc83fff4a09448f9 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/89f60e7507943170cf35a5659200d33702d510fe |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/a22302df61807dea2e6eed4c3e527e12261adff0 |     
      x86_64 |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/87d23f6e728b63b2c06639bbc6189b471b7e2fb4 | ORPH
        m68k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/7dd19e0e58c78daef53cac9933f2944f199d158c |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/2f3e99a056b0ad0e8f8918c650394648b8bba235 |     
        or1k |              freerdp-2.0.0-rc0 | NOK | http://autobuild.buildroot.net/results/040f35a2022a7a0c61e36ff16b27d85d2fc99e04 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/3c389f813e3b39f6854f37e50068bfd5deb0f438 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/2d74a963af17a39689acc28846d924d47a095c90 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/caf4a5c329272e7196af7d136e1fd4ede17957d6 |     
        i686 |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/4bb54b04e9e46583a6a2b325f8e879181fa45f93 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/2c977268760242ac7d54487926975cb4c4fb568f |     
       nios2 | package/postgresql/postgres... | NOK | http://autobuild.buildroot.net/results/ea8af8ecd3fd74b398ddafe82118d3d64601cd8a |     
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3d9007f743cbc9ed15de233188910ba300996183 | ORPH
        m68k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/9df75da4a2f1edb258a30452f56a8d5dd020ac9b | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/0f85ecdcb79b10c156070ec02b76dc6e1dbde16f | ORPH
        i586 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/65f7039ef1b2f4ded131ca519cde4bd1f9f929c7 | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b118430ef1378c10290fe6db396463d7505060e2 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/5fdee2dcdbae9d677d35daf26fbb12069ca1f45d | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d30723dda20c4885711e2db23a683f00fb0a8605 | ORPH
     aarch64 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/310ca8c22768ed48b12793106958901729f35521 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b321eed362bfb4437eeb9b37525b43b83968131f | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/46b4d9e3dea87d45df00afd84cb0fc14ff60859e | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/09ed7334dedde2445eea7797da40d233f1019c9a | ORPH
       nios2 |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d76043b9fccf5843575e21e82614df19017b490e | ORPH
    mips64el |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f1365400254f8329aad29a08817f20b8dcf23301 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/98a1f893b95787e7473cb52f5a550c83c7d95ee2 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e833a4135e521d4094d17b091a8c8e21952ce2d9 | ORPH
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/3fde9302ede019cd4da3255fd9f3a4397502c419 |     
microblazeel |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6c46fca3b8c67344354be27ee83867312635bac4 |     
        mips |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/05ed35d523d88e865fd8afeb30ecdab4f86c36ce |     
        m68k |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6cf97f39160edacb488d2edeac2ac0687f4e79d2 |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/78f0aea1c31e2c1e496c22f8cce31aaa9006bc85 |     
   powerpc64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/d4d44db3af288631f85b9be776a0096476fb074b |     
      x86_64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/48566afd6ebeaf6072c31e9d2e8269ae9d646e18 |     
         arc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/f982fb4cc2e90e37c77e433f67f6535c16d3389a |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6ce4fa1f93046de68ad6b37e8970fcdbc12f42d4 |     
     aarch64 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6ed5a0b3357d2b6e0ffee95150ab0b5f58fe3684 |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/ab22125e057176c1e636f8c646adbb58cacbd22a |     
       nios2 |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/1715432400cb7da4a84c5cf6e7d653f3480ce1ad |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/bbbb99506ffec1e8eaa76180a1502d6b57ecab10 |     
      xtensa |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/c502c23a0f47a70722e10052320b97389417d62b |     
     powerpc |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/df5150f40868da2137f9854a75d11d82441b0c4e |     
    mips64el |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/051124175eff0992374ce1db8df78c936055b571 |     
        or1k |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/6a381bcfee3945797fbc0fc02c76073a827f1bed |     
        m68k |          postgresql-legal-info | NOK | http://autobuild.buildroot.net/results/1eb02fbb6a79de98f1239fe1c9a188708166f52a |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/97fecbe8b2ca6c6e1df671bbc4e460d203b6595a | ORPH
         arm |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/016159e6be061dfcab32a612e8ba728dba0b33f1 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

json-for-modern-cpp-legal-info | 3 
                  boost-1.66.0 | 2 
             host-gauche-0.9.5 | 2 
                    liblo-0.29 | 2 
               lightning-2.1.0 | 2 
                     php-7.2.2 | 2 
              host-erlang-20.0 | 1 
              keepalived-1.3.5 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 mesa3d-17.3.3 | 1 
                nftables-0.8.1 | 1 
package/json-for-modern-cpp... | 1 
                    sdl2-2.0.7 | 1 
tvheadend-e06ffd87beff16103... | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6014f02e8832a27e7e81be1ecaa542068a592808 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f5fffcb70059e41e0ef646090f605b3914c89cf1 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/7ca8527ebeea8dbd61a8cb0dd3e4191c73472e90 |     
      x86_64 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/c1a40c31330b0301966794573ab32db1c162774d |     
    mips64el |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/4e3a8dc6fdc8255013a372e9516a2f2d6f5dfc7e |     
         arm | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/3832f3b97a75d1333b4b1d342b6d474101b97139 |     
         arc | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/166b4dd30eb0169b96d02bf9968e9b1724014d76 |     
        bfin | json-for-modern-cpp-legal-info | NOK | http://autobuild.buildroot.net/results/12d3dbedc37464327e94e10356bc50acb805121d |     
microblazeel |               keepalived-1.3.5 | NOK | http://autobuild.buildroot.net/results/bcb4867fdad8a003b6506b86fe7ebb0738b4a8a6 |     
         arc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/dabbd8f6bcdac59aa8c69d059012182077b916f0 |     
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/89621c24bdebb06eb2febae55f2f8a28d36bce76 | ORPH
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/5be56d8a68197c254d7ea31f6d1cdff33c1211ae | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/57d68148fb82b40148aaa70e63e546de2014db6c |     
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/bae2c97047105f1d02b24d766f3515ec765d5a8e |     
     powerpc |                  mesa3d-17.3.3 | NOK | http://autobuild.buildroot.net/results/fe0502ce17c538df4e636eaa50f30ce13adfc503 |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/6789602a29c0c58ec5488bc873e475f27b4c3c68 | ORPH
 powerpc64le | package/json-for-modern-cpp... | NOK | http://autobuild.buildroot.net/results/bb33291d4d2aebabc4dc20a0113b6de27ce7ea14 |     
      mipsel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/b172ea802bbe8fa1d441ad187dce7291eff667b1 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/0b615db84cfaee7848b071c21bf7898864d9c6a1 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/7759a76a5c42ae1e02f16eb69aeb8ab604b925e4 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/ed775eefe0ad77d79e0fee80eebe5b05cce7f1ff |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/36eb4a269a0873afa3ec326e47b1ffc3b38ea538 |     


-- 
http://autobuild.buildroot.net
