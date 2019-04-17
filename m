From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 06:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-16
Message-ID: <20190417060039.CCB8586D39@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   1 |   0 |  17 |
      master | 195 |  42 |   2 | 239 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                cracklib-2.9.7 | 6 
               madplay-0.15.2b | 5 
               postgresql-11.2 | 5 
                   netsurf-3.8 | 4 
                  davfs2-1.5.4 | 2 
                    efl-1.22.0 | 2 
                host-libsodium | 2 
minicom-19ab49422f3431102c3... | 2 
                   dvblast-3.4 | 1 
                    git-2.16.5 | 1 
                gnuchess-6.2.5 | 1 
                  grpc-v1.18.0 | 1 
                libkrb5-1.16.2 | 1 
                 lrzsz-0.12.20 | 1 
                   mimic-1.1.0 | 1 
             openjdk-jdk-12+33 | 1 
                   pcre2-10.32 | 1 
                qt5base-5.12.2 | 1 
          refpolicy-2.20190201 | 1 
              spandsp-20180108 | 1 
                   sudo-1.8.23 | 1 
              syslog-ng-3.19.1 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

        i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/7665399275b807fc29bd82a8a899ea95f5c011b2 |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/04f9d8baa71a679f27d7dc2f3d451373ab8f4322 |     
        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/cd1bc3482e95c6a2c5874c06fa4e3d6a1ae92032 |     
      xtensa |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/bd5deacccb15bd2389dbcf553388c58159c4b9aa |     
        i586 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/7adbd6a85e7b6cfd0a320baf034131d3b987bc9b |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/93b7512e1718e13e353845432cd96dfeddafc564 |     
    mips64el |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/7e67b61b3051e5c8968a93effcdf10d45200b077 |     
    mips64el |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/ac1462c506ef931ff6895fdc3d79fa394edd9de5 |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/6039946b308647ab41b8ec37e48dfae5219bdacd |     
         arm |                     efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/c91b308a389e6113527167700aa7933d06c9ebbc |     
         arm |                     efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/c1da4a16ca1d20f19a7cca66d5c7b55b43732501 |     
        or1k |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/8872ecd1eb54804c09f22f1f0e87ca8a0d155da9 |     
         arm |                 gnuchess-6.2.5 | NOK | http://autobuild.buildroot.net/results/76a19739bb6d49bf96c850c879060dff3cfda5f1 | ORPH
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/9fcee3320fe45244215eb49dc94322001c0fa47d |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/9298d1e7075efeb9f84c6d7e63908efa0762b29a |     
      x86_64 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/02e68235016d0c1cb9df64a454fe40742aa05e28 |     
      x86_64 |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/bfcbbb403677c187b972b1b78ffd14377305dde2 |     
     powerpc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/64974165a24b3e427c8bbcf73290bf155b302770 | ORPH
         arc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/050017f6510aab5e3d32ae05e446c94131fc812d | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/6ddce63329ccee066fd64b780b04b2268d3fbddb | ORPH
     powerpc |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/bd6acdd5eb51830f1e99d58f5b021e57f18d8d7e | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/8078f6d58dca5b60fa9f15c6f14438996b3f83d5 | ORPH
    mips64el |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/718e8d9f54aaa7b735476fe71143c9ee498cc1c3 | ORPH
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/118766098cd9b70edee99cd6c6e8dcaaf20f219e |     
     powerpc | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/72f0351e35c06e7f5bbcc988a5f911925f0affb3 |     
      x86_64 | minicom-19ab49422f3431102c3... | NOK | http://autobuild.buildroot.net/results/2e00951a01e860ceadba329b1f4c03246589de2e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/16ea3e98bc00938c88bfe62424e128a260a1849d |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/af91abefe75bca18cf491ec7e6c27df0f8eedc51 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d27d4cf32a4c6159efb32f152e5cd66df67f127d |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8a16604cc317c5484ba302e595b67321d0399d75 |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/b565efce5cf5bab382088d94faf150b356b2c429 |     
         arm |                    pcre2-10.32 | NOK | http://autobuild.buildroot.net/results/547be5264effaf27c7f85ece88c5f5f792abd910 | ORPH
        or1k |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/facf2652c5df365a27e43bc9ff5eb1a78cacf5c8 |     
      x86_64 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/b5d480cf40abdd83c63bfde77dd1f8196824bc70 |     
      x86_64 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/e9b89f875ce79207736f4adadfa91a59d442b03a |     
         arm |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/8a44cd503c2ffb1923d2279b26f9436d06167146 |     
      x86_64 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/7240c83bd6b50c6c80d7b2c49b62085117fd70b5 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/2808318d343bcdebbdf029a1eb8b6424b77563f0 |     
         arm |           refpolicy-2.20190201 | NOK | http://autobuild.buildroot.net/results/1f878405593dd05bb00fe0b06ca1c64ffbe6c572 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/c38e2ca73736da942c293ee8f8578c3cc4581f70 |     
         arm |                    sudo-1.8.23 | NOK | http://autobuild.buildroot.net/results/1faca8bd19795a9ce65268c68634d351c8ddc241 | ORPH
        m68k |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/e4b17e8ed887f76bbc4f300735f07fe22d040be3 |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/16b1c693d5ab098727d4a3fcd8bf9486ac32ed4f |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/7c01a8bf72044e9b4d6952d329739890479a6b0b |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  rpm-4.14.2.1 | 1 


Detail of failures
------------------

microblazeel |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/4d45984938a90491be7cc52a580bfd0bb50b5120 |     


-- 
http://autobuild.buildroot.net
