From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 07:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-16
Message-ID: <20190217070050.4194186816@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-16
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  38 |   1 |   0 |  39 |
   2018.11.x |  20 |   0 |   0 |  20 |
      master | 226 |  48 |   1 | 275 |
        next |  62 |  21 |   2 |  85 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   qemu-2.12.1 | 1 


Detail of failures
------------------

         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/d1ffcb0c5759ea482c2c1ab77d4d9835ea2b6dd8 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 7 
               runc-v1.0.0-rc6 | 6 
                 ibrdtnd-1.0.1 | 4 
                qt5base-5.11.3 | 4 
                   glm-0.9.8.4 | 3 
                   luvi-v2.7.6 | 3 
               madplay-0.15.2b | 3 
                      gzip-1.9 | 2 
                  libssh-0.8.6 | 2 
                mongodb-r4.0.6 | 2 
                   netsurf-3.8 | 2 
                   tor-0.3.5.7 | 2 
                   dvblast-3.4 | 1 
       gst-plugins-bad-0.10.23 | 1 
               log4cplus-2.0.2 | 1 
                   netsnmp-5.8 | 1 
               openldap-2.4.46 | 1 
   openvmtools-10.3.5-10430147 | 1 
                    postgresql | 1 
            safeclib-v03032018 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/184ecc6b7e020bf040f240cfc3a0cac92f0b71a7 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/3cf1fd3387bd4952470edcfcb93d44f58c9e7ff7 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/04fada5a12ebf601940531303f84183d0243efdf | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/d0851c580420fdd15e8b489da58db8f9e3b86596 | ORPH
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/17180c6bddc9f97eb2004268f17f3ae6ab9d014a | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/fc37826fdb6017bf6ee4b29048f0a85fcf6a6159 | ORPH
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/e1f61ccc6aa0e511f0e74d36fe1d9e1be0030bdd | ORPH
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/669f736cf16213825268999eb21ccc63e73b7870 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/de83c0a67a8b2b41eae53d00eeba27fe5ed2976f | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/6c1dac23339e48a4816ea0937ccaa5c1fa46d994 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/1d3b4b6cf043a3e185ce758b617a0a18c3d36cdb | ORPH
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/a56c515746874549714270c9a635f8a2ef303e67 |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/1152d0aa3ad7dc8f9abf2f074f0aa2b9ce41742e |     
       sparc |                log4cplus-2.0.2 | NOK | http://autobuild.buildroot.net/results/16e360cb91afff7655f459a3d1fb906ca48f8464 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/52a1ba24280e1e95a1bdeee263a0157f800fae81 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/bb8ca5c5fe7c813b222c78cfa210deff20e569a8 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/25e92282269518b250e3c8c5b97d5e63966b8e6e |     
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/feee341b3d0bd0263de68d3641154a09d56b256a | ORPH
        m68k |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/a97794ed6356d620c0eea85367ef1f9f0f9aa0ba | ORPH
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/fcfb6e02adbc1716408173cc0c8850952d07a763 | ORPH
     aarch64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/280066d13de33b51c791e96490b33e9b1c5ef961 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/2f3a725fb5f5513432454bbd0c4ba693b5f77b26 |     
      xtensa |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/89651de1d5dfa2e07d5091ed58344ee5d3486196 | ORPH
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a86a9415ef5ddf43816f6f40744175b4e9805918 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d5cd3367014e40cbdb70df47a9c9da4253609ebc |     
        i686 |                openldap-2.4.46 | NOK | http://autobuild.buildroot.net/results/c0377b1910a96e98feee80ea4f33511c98a9d65e |     
      x86_64 |    openvmtools-10.3.5-10430147 | NOK | http://autobuild.buildroot.net/results/175b96afa91527d3370145b401403d4af3a1c8ff |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/dd5e8c139bf5f5caba46069921216c4f70d0d7bb |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/1da3891a30af972a425f634fe8a82bc830d96938 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/d9bbe503a172a5bbb7d3e90c50006553ca66efac |     
     riscv64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/d98d22cd91ba31604a02f602e8d6cba1121f140f |     
     riscv32 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/10ed60140a29c6a2a2a91a1bb0240aba4410e5aa |     
     sparc64 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c6c64312e0d7b89266433a51df07ddff63d97c1b |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/389b5e8b3bc34365aa514373938b61e82c07d0f1 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7941b55cb8a452696ecbe583546597b961064363 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/684a5cdde7c0f75e3e1edf4555814a53e0c856d4 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/4cad1b2b3aea903e8ba0814d58ded2635df6c45c |     
microblazeel |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/7bad38d8d9d1f5f5d37eb3eb5306197091a4d7f7 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/cc14bd20b1610eab6d6ee464b081e2e3ac0d7a45 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/f741d01937eb0812a0ca3fef7fd18288f43083f1 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/89c6f8790b85234b1d71d4117e6cc9c65dbf1ef7 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/3eb6ad28e1e5bf572564df3ad057d91597209296 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/e13918028b07a08405ac99003976e4a26857ee7a |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/cf9742b84325c60590622af9b4ba99bbba48a260 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/bd09cb8b016741cb794f898cd35044373f23aa37 |     
      x86_64 |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/693b0b749d03e7f84ff82351aa26ea52aae60055 |     
      x86_64 |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/898323451eee7198c02f5a3073664d97e79c9a82 |     
microblazeel |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/66b88fe0177d19a4c183c3992b5bdc63246163bc |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/60f0aead3608ed9d6c2d5fb22c03959f82f89513 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 6 
                 qt5base-5.6.3 | 4 
      host-uboot-tools-2019.01 | 3 
                 ibrdtnd-1.0.1 | 2 
                       netsurf | 2 
       gst-plugins-bad-0.10.23 | 1 
               host-qemu-3.1.0 | 1 
                mongodb-r4.0.6 | 1 
                    ncmpc-0.33 | 1 
             stress-ng-0.09.47 | 1 
                 xenomai-3.0.6 | 1 


Detail of failures
------------------

         arc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/9f58b48717b6caa6546c387772a382dc37a0cfbd | ORPH
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/8a4d4b648ce029f4ed86a6f5d20704a17d739a27 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f901ca2615a9641b03812f456b43e3e5b0943371 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/16533f8bff42b345f5d734b62c53a095715d46ca |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6f71facbadd598bdbcf76cd9f05685444e18aeab |     
        or1k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/5664850dc7e2d4bd45ae04e765b46238a1a8a1ec | ORPH
         arc |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/2134c8b970aaa6ba8635b9aeaf222da5a9d0bbd1 | ORPH
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/b8aa5512837e8055981fbc4fe2f8b677746dcd1f |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/f1c5bebd6e35f0cdd9ff8e6b0a23a4370355ed6a |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/35195f655bfee6c6e5f55f1784f3ea7a1aa69725 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/1fc1439d132a45e7622dd8d27adcdf6a9ce0884d |     
       nios2 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fefd74cd855f4bc72dafee316ef5fac60b1efab3 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0843c8515f20205e1a7cbfa0ef0ae842c6f06930 |     
microblazeel |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/614c6fefa53585be0350dd5fff701f50415a56ba |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c8753f2abc2d65e61e3d0e01424eff9e1d07fc95 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/78d8918b9a5ba5b099cf6f4f5c8d0d96b62a5609 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/90f653156190bbd947a7ea42c9783990c3bde073 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ba3b3f9a948ef2e0cbf58520759169742f497682 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c37f7d8a17703a7150b1ee0c89094082e2a3f3a7 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/ec108a68db72f79cec0fff80afc9d1287e500569 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/4f2c8baa16180a04e1cae60530e14e50d224b75e |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/660e19319e843e0b767b5f09ab8f88f57ca302fd |     
         arc |                  xenomai-3.0.6 | NOK | http://autobuild.buildroot.net/results/3a53f54476828ee878602da9adddf1e1e70f7a69 |     


-- 
http://autobuild.buildroot.net
