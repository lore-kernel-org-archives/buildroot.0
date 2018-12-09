From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  9 Dec 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-08
Message-ID: <20181209070018.C6C5D207F0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.08.x |  21 |   0 |   0 |  21 |
      master | 165 |  38 |   2 | 205 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libftdi1-1.4 | 1 


Detail of failures
------------------

         arm |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/95105af2f6d615c4d1721f145f720e54b9d1e0c5 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             stress-ng-0.09.47 | 7 
             host-grpc-v1.16.1 | 5 
                  grpc-v1.16.1 | 4 
                  linuxptp-2.0 | 3 
                   eudev-3.2.7 | 2 
                  libssh-0.8.4 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
                qt5base-5.11.2 | 2 
               qt5webkit-5.9.1 | 2 
                   strace-4.25 | 2 
    azure-iot-sdk-c-2018-03-16 | 1 
                 dmalloc-5.5.2 | 1 
     intel-microcode-20180807a | 1 
                libmpd-11.8.17 | 1 
  libpam-tacplus-v1.5.0-beta.2 | 1 
odhcp6c-7533a6243dc3ac5a747... | 1 
                          opus | 1 
                    postgresql | 1 
                supertux-0.5.1 | 1 


Detail of failures
------------------

         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/92a44c2ca667abf0476090eeb2d80a78163aff34 |     
  aarch64_be |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/f9d6f7f870ab80c3637018e8b6d80ca6fc595441 | ORPH
    mips64el |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/d8d5381c45ed3336130ad3ed1051088ec3f09ccd |     
    mips64el |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/d9c5ec07bfbde1fab62991bb509c2f90af1cb3f4 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/71c6a99b57ace32fa8cb3e477efcd95570b35613 |     
        m68k |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d32fc7b2890adbd22609495e005a9ee8de6026d2 |     
      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d1bdddd526ce121d193bfadebd89d0da1828bccb |     
       sparc |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/4ab240400e48a8c73d60397b0d8f64321c5e9949 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/bab2678b42cbb5ccf7912524b3342e4f044bada3 |     
      xtensa |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5ab95f65bde5d2eb0dcb181973cd69f4b27f8f68 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/7f8cf9bd475cbcde845bef5ebb69fe128094cc72 |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/956189dc3bc2337415878410ed86d06d2889667b |     
        i686 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3ed5f62d445531b246fa12d7444f4c2d77d98808 |     
        i686 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/c94f39daf77d61fa6c857479d295454a518aba54 |     
      x86_64 |                 libmpd-11.8.17 | NOK | http://autobuild.buildroot.net/results/a174818fa768b029d19b033139f9c5e0aaaed149 | ORPH
     aarch64 |   libpam-tacplus-v1.5.0-beta.2 | NOK | http://autobuild.buildroot.net/results/da6d150e470046c03c5f7463de045604e15e4a30 |     
       nios2 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/22422145e7fc9a8ab4e766b174a916e599845f1c |     
      mipsel |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/6dd47ca4ec04756445c51c54d9dd9649a982ca00 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/df54acf69f475da188eecff58354e127d153f54a |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/7d6e2eff7a28fc6415a9d4cb1504e86bb65ddc61 |     
         arm |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/69510f44e7516be633795dcf9442d14254355bb0 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8d6ca69335a64b139f7369bf9f27ece4c8624ea5 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/5b6f91932dabfb379ca08f17a27ba530ef01d2a8 |     
     aarch64 | odhcp6c-7533a6243dc3ac5a747... | NOK | http://autobuild.buildroot.net/results/c145a46d33b6f465d4c0060a1dca593dfd5d26cb |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/d85e9298697645ff83a2a52a5499d99083783977 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/7e6d06bac0c03b20749907bc78b211443590b1df |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/88de42eedb1359f3784557387008c6e889805bcc |     
  aarch64_be |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/d5618196fd165aadcfff3ecb0600422fdc19969d |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/0bd1bcdbc999a258283afb5826a305fec00bde7d |     
     aarch64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/01f717d26d857a862bbfd7d745ee546cb09d20fb |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/ea3fa5040e353758a12e2fc5db82a78ff1e8dea2 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/a0b1789077455844a9654b2e634ef1172bf9f324 |     
       sparc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/d45be12155dc6ef0f53b56b8f1aaf18af44ee041 |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/baea81cf9904146467c5b87c1bab62b6bbf7d20c |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/22c753980d91b37b1a13f9449e49c18de5664ad3 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f0bb0183f2f45e3588b58d1b913da06f0258c24c |     
      xtensa |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/b7608d2ef1d580a368a640b6ff70b7a30ab366bf |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/53956798499071475cad914b5a30beb171f5c315 |     
         sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/ed2aab8700f5d51e4ed35dd6d696bca1036ccbf4 |     
         arm |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/e2d782b4154ec254799bc644695873efb35dbce5 |     


-- 
http://autobuild.buildroot.net
