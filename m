From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 06:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-27
Message-ID: <20190728060040.E179C88937@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   0 |   0 |  13 |
   2019.05.x |   8 |   1 |   0 |   9 |
      master |  85 |  36 |   0 | 121 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

      intel-mediadriver-18.4.0 | 1 


Detail of failures
------------------

      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/5b6bc0be7c62ab40193457668b78881df8780f8c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.9 | 10
                    mpv-0.27.2 | 5 
              iputils-20190709 | 3 
                       unknown | 3 
                  flashrom-1.1 | 2 
        glib-networking-2.61.1 | 2 
                     gzip-1.10 | 2 
               host-efl-1.22.2 | 2 
                 libv4l-1.16.5 | 2 
           can-utils-2018.02.0 | 1 
               libupnpp-0.17.1 | 1 
                 python3-3.7.4 | 1 
                suricata-4.1.3 | 1 
                   vlc-3.0.7.1 | 1 


Detail of failures
------------------

     powerpc |            can-utils-2018.02.0 | NOK | http://autobuild.buildroot.net/results/49b7aed0d297ab0af0d6910be89fb789749099ad |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/0414e40274c9ae32e971a28847aab56f51a91853 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/d8ed0e8d7719c23969dd12d568ebe1c6951e641b |     
      mipsel |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/3c979a1e1ee4fa3c0b88abf85602a89275e030d2 |     
         arm |         glib-networking-2.61.1 | NOK | http://autobuild.buildroot.net/results/f7c42a9afbc076694b39dbfc93dc66d23d3644dd |     
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/ee1c0e0f9450f1b21fcacf8bb61ad9dbb58b3141 | ORPH
         arm |                      gzip-1.10 | NOK | http://autobuild.buildroot.net/results/16a6daf36a710a61c44fac5b1d341777d6c27ebd | ORPH
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/1368a328ba62db98568d4e9955956f14993a08b7 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/3d0dc879f21ffafd86a1d3e04337c533b95c008f |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/1ab81371dc4fd53001ef98ad32e25f040b353fba |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/165d93ba4f1c1698b4c2b8aed46a30b7171766f4 |     
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/2b13e85e365ecc6400c219b5ae5d1dc4d1c17cf4 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/8ddddc65f727a419835a021eee8d190304f1d10a |     
microblazeel |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/d725e8259d084409cb191dd7c5a0c315b830f8c4 |     
         arm |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/9a5ea349b3fa9e2ec6815b5127810daf5015651f |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/060de6f99af3710eb6d2001fafca3f0ca1f4d1f1 |     
     aarch64 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/d866fafbca677eabe99e02303bbd983ffe30f001 |     
         sh4 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/3b0387393120ff1584417c1accc60e97bbf83aee |     
         arm |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/4c589280956a216655469e1d417640e6605b27d4 |     
         arc |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/79641ac7d0637496a4c355852fd107c1491916a2 |     
     aarch64 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/7d9c7664d6a922b503b2553c02d571951e3ea003 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/dba04a6a40e510d0deb03445dd8d3cac301b1fe9 |     
microblazeel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/cb0301519f2a47ebca9e0d9293496de281c6ba1f |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/062344a5e400f336fea4b319dc981639f9280122 |     
         arm |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/53d1a17ef1536ef1e771bcee42d326252801d6a7 |     
     powerpc |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/adead660148cec04910b7a616cc85adfdd63ae95 |     
        or1k |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/cf9d365d0ab40d90bb8805e5be16444e885379f2 |     
    mips64el |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/14bfca7eba8d83d2a8f3ccdacf172a9735ef8a8a |     
      mipsel |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/5b3e7e6f82b457d13514a45e35df1f460549032f |     
        i586 |                    netsurf-3.9 | NOK | http://autobuild.buildroot.net/results/f847aa286ea2fc35086d8515fc665dbe5dcfa299 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/1737db8ce966b38d52aa7247dabf95f1d7db91e6 |     
         arc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/428495f74251d176bfba338ef763d2ba978b792e |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/abf2dcf21ee1bc6e06e5bb99553d07a0eefc8865 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/b566b84f028ac0065c867ab145b743b7cd24233f |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/0f92d7fedb129d396b5f75b2ca2e5d6201e870cb |     
       sparc |                    vlc-3.0.7.1 | NOK | http://autobuild.buildroot.net/results/c9be4ef68c9c5d018e4084c52215ce69f0c72538 |     


-- 
http://autobuild.buildroot.net
