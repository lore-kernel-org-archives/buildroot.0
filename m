From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 06:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-25
Message-ID: <20190526060057.57E18874D4@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  13 |   2 |   1 |  16 |
      master | 195 |  20 |   0 | 215 |
        next |  47 |  12 |   0 |  59 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 3 
             iputils-s20190515 | 3 
libubootenv-8a7d4030bcb106d... | 2 
      intel-mediadriver-18.4.0 | 1 
                   netsurf-3.8 | 1 
                    strace-5.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

      mipsel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/70c0902f843f2089fb6c6ea5ef33ad9f062c26cd | ORPH
       sparc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ebce18539336751d3a3c97280bdf219e9236efe9 | ORPH
        m68k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/247613adb2ac916f27d99a0dd6d131a2c6860be7 | ORPH
      x86_64 |       intel-mediadriver-18.4.0 | NOK | http://autobuild.buildroot.net/results/ab8b26a9d1cdc910437f33aaa7b2f14d3de7b771 |     
      xtensa |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e5e84b0e514197feafb1d4a565f2f48d9ccb313f |     
 powerpc64le |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/c4623483740f2e48e1d6459aae0e29664eea60dd |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/e769a642df16f7d220550d15d7d9b4da0bdb4032 |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/e2bb033c3bac9a810d575801ee048bec7d9f4449 |     
        m68k | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/415e25e1e5e943fdc9136105a0522203255282f9 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e10a720531f75dbb0388cd4798b8efc266c2b1c5 |     
        m68k |                     strace-5.0 | NOK | http://autobuild.buildroot.net/results/5740a83c269fd1529df7f95a35911b90645b3013 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/fabd589c855556f5626d1d676eb3df3b9c17efb7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           linux-headers-5.1.4 | 3 
                   netsurf-3.8 | 3 
                qt5base-5.12.2 | 3 
                suricata-4.1.3 | 3 
                   mimic-1.1.0 | 2 
              qt5enginio-1.6.3 | 2 
               wireshark-3.0.1 | 2 
                  linuxptp-2.0 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

microblazeel |            linux-headers-5.1.4 | NOK | http://autobuild.buildroot.net/results/b01f409d64f839d3b3ae832e7a8c9a3bdde514c1 | ORPH
     powerpc |            linux-headers-5.1.4 | NOK | http://autobuild.buildroot.net/results/22144a663c5a3b165246e024705678a8ed5e403e | ORPH
      xtensa |            linux-headers-5.1.4 | NOK | http://autobuild.buildroot.net/results/75c8b2998a9c9e17da4155be58a474e6fc7424bd | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/25c873620b990238c3cf94c3fdfbf6f5efed33cd |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/2bf2a024c7d9649ce80d60c43f499e7b83a3afdc |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/e0413f238b172edbc7f902449da296aaf8a1aee7 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/76f7ce88a8b99d500b4c0b503793dcd1153aaf01 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/78ed78910b7862c4ef39b231c58026c7f898acf3 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/498c09369fe137937d3f47c00b2558feea3f7eca |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/becc302993cc8def37bd41e275106358798e0145 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/737bc07b6aca5d2e7c2bc94dc05505c73b2b42a1 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/f3fc7c80add0398bd57324910c971299150e7c68 |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/bf372dfdb90557b1f0740771b959a3e16ad31da0 |     
     sparc64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/e5ec20c2dfaddf33ba901e9e71e6da454cb5b754 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/970ba61219344df92d410ce3705516c5406f334a |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/193f0bf6739d8a636bb9f5cc081da78cf0e5ffa8 |     
        i686 |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/1fa129eee6f31c939faef29e054487635414d580 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/dfe20e8f5ee59eaa7300b91ef97d4f9fb2dafae4 |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/a400299b25eb072615927d17c329899d0ed2aa7b | ORPH
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/45bd0b790cbaa65922b5c6173e135e03778e7c39 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                chocolate-doom | 1 
                      gzip-1.9 | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/edea376484f22cdbbb9953be8b41e05e890bcba7 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/fa95a21f672569c9f11910f7f18a1e4d2307ed65 | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d3e335407e785266ef2b494579410b0cefa24bc6 |     


-- 
http://autobuild.buildroot.net
