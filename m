From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Mar 2018 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-14
Message-ID: <20180315070006.C77FF2084D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
      master | 195 |  43 |   0 | 238 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             bluez5_utils-5.48 | 1 


Detail of failures
------------------

      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/6db989b58eb0fdddb82c4f4fb28a88b4ae79c176 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               xfsprogs-4.15.1 | 9 
                    htop-2.1.0 | 6 
              keepalived-1.4.1 | 5 
                  udftools-2.0 | 5 
             bluez5_utils-5.48 | 4 
                  flashrom-1.0 | 2 
                   jamvm-2.0.0 | 2 
                    liblo-0.29 | 1 
             libmpdclient-2.14 | 1 
              lynx-2.8.9dev.16 | 1 
                 mplayer-1.3.0 | 1 
                     php-7.2.3 | 1 
                   qemu-2.10.2 | 1 
                      qt-4.8.7 | 1 
            safeclib-v03032018 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/8aa7acf4da418495e0b4fb88a975aed1f61c69b1 |     
      x86_64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/b0b1e20f4b1f7aa12704836a346ad2858c2e7e0d |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/19620c81ed8b26673361b2c0aba531c25403c26f |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/3c1d66cb71c0d3b30d0f730d70b53b589372b54f |     
        i586 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/5a616c23ed348c83a7960050d7556baf7bcb242a |     
      x86_64 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/6b8b76449f265fb1997dfb87956ee85034494076 |     
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/39a9ef2fe524d9ef9e543a5633ed10970250d52c | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e60b96aada1cd013be201d8e859a800ca5bebc0b | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f1e6f2c399d2a3b1a17c566d7175dc44d3939c29 | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/427947663f4941023e44fb588e9003d68ec3fb6c | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/10daf73da785a41a22a8219d7b5c6a5b5f5691fe | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/c4277cc539cf376768479b16d8e5018689875b1c | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/f09670fa41c9f60df7dfecc383ee589ec344aa59 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/df8c3a71e29b0aca04a2a2874c3aca32c34f3bca | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/c5227fea0515855bccdb6e9c9f0450f051bd4d68 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b9c410ce5434f36cf3bd2bf9bed5d5a1ce44b430 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/47065ebf4b8061099cf12514e3afb1286abfdf0e |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a3a83f9a47372219cf8d904ac890d2b4095268c2 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b91860e7096dce8c08b3e5a8156bce5436a0de7a |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b61ea9ba59786bfc25f768cf9ca997544bf11c6a | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2420a7e03d32fd912a4ca1c63b3249773086f436 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/f2b62c5b4ccd08de2319ca432cf6e62332aa2e96 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d306fbec306b59310d7b82be99b4024432054afa |     
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/4cbf284a7bdce1998460a888ea6824a3f0268317 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/c198276d34ba533cd3870179e707ec5eabf047b6 |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/db7d2549883bde6acf73293f60385ffed681708c | ORPH
         arm |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/e597843f2bb528da01d1e617929c818613b56cec |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/1a8e9986718cf0f7560a0ac1967546ed0efb8cfa |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9e4ad0d9d2e1674d11b142080251817b5cc6e2f9 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/36c8cbe3620c562744cbfc6a64038d9461dd8d68 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b52ac88c47aacdb02fa554fb891805352c62c94b |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/1d287c0c9c0373536dead9a628623471177653f7 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/dac8155a1bf67f4e455595b78fe9e41abac7f63d |     
   powerpc64 |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/9a915b67bcb86c8d1996f457535d5f039c7c8d11 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/80f952458b7e27543f49cab4c3411552f8504019 | ORPH
        i586 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2238475d2c21c65960a56f86a08fe35d1021080f | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9537f25457a5ad92eca38350fde4ef53430df7b1 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9869cdaf79e6e89906cbcf00611dbe83350dc9bf | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d03ecece071d5184aa5f6839fe2db7e4c66420fc | ORPH
      mipsel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c973d9a0a0e818cd83e5a9148412b4a24c3c0856 | ORPH
      x86_64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2d9920fb7f5bd1755cd9142ee528e2a704fe02c8 | ORPH
     sparc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/366aa833cda16b21db62b261ca5c66364953f993 | ORPH
      xtensa |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9fb98499d85d9f6a662c567adbd9948744b13f16 | ORPH


-- 
http://autobuild.buildroot.net
