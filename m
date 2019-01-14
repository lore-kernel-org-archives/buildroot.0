From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 08:00:59 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-13
Message-ID: <20190114070059.9F75420A85@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   0 |   0 |  23 |
   2018.11.x |  26 |   2 |   0 |  28 |
      master | 241 |  50 |   0 | 291 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                openmpi-1.10.7 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

microblazeel |                 openmpi-1.10.7 | NOK | http://autobuild.buildroot.net/results/1b855387bfb68233b821f588ec4376bfd24ba634 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b26a1a9c603a46d05e16aaf04c97d7edb1b5ec86 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        glib-networking-2.56.1 | 14
                     php-7.3.0 | 7 
               skalibs-2.6.4.0 | 3 
             stress-ng-0.09.47 | 3 
               curlftpfs-0.9.2 | 2 
                  libssh-0.8.6 | 2 
   libtorrent-rasterbar-1.1.11 | 2 
              syslog-ng-3.19.1 | 2 
                wolfssl-3.15.5 | 2 
                  brotli-1.0.7 | 1 
                  daemon-0.6.4 | 1 
                 dmalloc-5.5.2 | 1 
                 gnu-efi-3.0.9 | 1 
             host-grpc-v1.16.1 | 1 
             keepalived-2.0.10 | 1 
         libcpprestsdk-v2.10.8 | 1 
                   netsurf-3.8 | 1 
                     pcre-8.42 | 1 
                qt5base-5.11.3 | 1 
               qt5webkit-5.9.1 | 1 
          shairport-sync-3.2.1 | 1 
                   strace-4.26 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/11e5bb066880e6c4571e796523bb0bc8dc47f797 |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/5e28ef60c866fe6124936a6e1a08f49696bbae0e |     
     riscv32 |                curlftpfs-0.9.2 | NOK | http://autobuild.buildroot.net/results/cb8a1f9bf605b173007483603d9a87c1ed2f68b5 |     
     riscv32 |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/7b167c736a2154598acc2c6202a1404600d507c7 |     
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/ed03ac2083dd004b87c76fbc93bfd3b2ca101147 | ORPH
     powerpc |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/97ca21878d36c0d56dc94c5e126b87529cc63f0f |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f4c9902e50668d3e1009d22f4e47784965d951db |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/ebeb6be1be1a5f46d30df62b0e17e52492722a68 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c7851b6d72c914b3f805650355973b2dae5c96fc |     
        m68k |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a0352ac5e02da778670da6053d49b7948765295a |     
        i686 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e0fbd62faf7df2edaf83672c7d998a9b263a9f00 |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/0ccaa03babc54b3595b4da71447813c6ec8f60a3 |     
      x86_64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/5c56d33733c98fae536998fcc669c069457ad0ce |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/dc94056643c6efc4e1b29371bcac0d387e511d15 |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/09ce2709d645a59a67c5f28cc53ef60ce8515193 |     
     riscv32 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/9e295ed2447a3561f55dbcfb662583ecbb5d10be |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/c649494027484fb71b4916ddb049bbefe45db2ce |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e60ad0625c7f05d109e4eabaee594e6741e5c5aa |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/a88f37e03982ef3f189fb3758c23237d60966907 |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/b265556b95857dd64af87de63efa5eeb1183e184 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5257de42cd3a41c839222cdc2ecfa18e9eb51ac5 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/6cd16bcfad199052670823788bd4287978c48d7b |     
     powerpc |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/a8c080e69a1ea4c359b20d456495519eb7cdedbc |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/85f1278a08f8b241c002dc9134138e1b6e6d7a46 |     
      x86_64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/6a068c658a398dc8cbc7ef00fc770e26398eed6c |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/bec6e6faae8f88bb6d95aeb0cb9ac84f61b8428a |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/244ec5a57f6911697e10483bef446f2f4917a002 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6a9abbafcc3e1c468631613aa79297361794e2ad |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/1483680bf5c5096fbf89ea8d8bde5775773bbfd5 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/98321e48e285671aac3436083d04057a4a026aab | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f7de666d397a05ea39eaf0ae9dd6f24767e2b56e | ORPH
        or1k |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/951e609c16de1427958b96fef95bcc1ed2e4dd12 | ORPH
     riscv64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/cecdc663a63f98a618935da9a450e4e4651db0fe | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/814536604a2f6e0dd3f4a0847f3bcb288b58a297 | ORPH
       nios2 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/339853411285a76e8e63eb3acd13f634efb6e583 | ORPH
      xtensa |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/848e5bdc3777b68f4e4fcca04e7f37f0c74280ce | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/93b1cbf4937c5241cf06d3caee8275893b3d4bd8 |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b413152d9da9e5d2d6935516b4e528a5e8559a28 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/686066c8dd04b532022ea10d07971f46a015272b |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/f5e80fc078da851d8e87ffa6869f1b3435c5589e |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/f281221efbf42344a83a605ea188fb15acf186f3 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/2a84db915ffe02d2f48641d93b9d43fd6916e1db |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/88667c935189eb5ea053c3bbdb78f784a7bb094a |     
      mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/d2b11a0a8103685d88c87f22f4973f7c1fc767af |     
       sparc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/e735918f1246a2846e4ad79db17e46fee6c9bc4d |     
    mips64el |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/4e75b9627a6143b571458bb6d3e27106eebe1827 |     
        m68k |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/0a6de11c030a4f39e402917809fc6d33fb463d1b |     
        m68k |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/893af58a546a666b029e75f6dbb9ccd3eef60229 |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/e65e5b13c1ed85859b7d0eb473fbe5fc7b5a86e1 |     
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/a58f6b1896f6306928b2b7eeff29a5fe3568518a |     


-- 
http://autobuild.buildroot.net
