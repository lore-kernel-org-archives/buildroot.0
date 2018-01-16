From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-15
Message-ID: <20180116070012.904072089C@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-15
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 229 |  77 |   2 | 308 |
   2017.11.x |  28 |   2 |   0 |  30 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              e2fsprogs-1.43.8 | 23
linux-firmware-65b1c68c63f9... | 19
               domoticz-3.8153 | 7 
             bluez5_utils-5.48 | 6 
                  boost-1.66.0 | 5 
             libostree-2017.15 | 3 
            nilfs-utils-v2.2.7 | 2 
              swupdate-2017.11 | 2 
           cups-filters-1.17.9 | 1 
                     daq-2.0.6 | 1 
                   gconf-3.2.6 | 1 
                     gpsd-3.16 | 1 
libg7221-dbfc29d4806ecdace5... | 1 
                 mesa3d-17.3.2 | 1 
                    php-7.1.13 | 1 
                  physfs-3.0.1 | 1 
                     qwt-6.1.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                       unknown | 1 
              wireshark-2.2.11 | 1 


Detail of failures
------------------

        mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/dc8c65d0fb2e3d02773212352fe537bd48e4592c |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f00b616f90ebf2704113c35a86c73370c4d30ea2 |     
      mipsel |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/4fd54c597775160112bf46e58f20a17d93656c46 |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/913871fe052d5b705dbbeb6b28203bcbfb75dc53 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ba0c5b8181fb1e94fa4292ed17b546edc7f0603c |     
        i586 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/30079c964d15658aa1734ff5906722692b801348 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/eee865b34238bbaf2c3fa5f14b6402844f84407b |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7c6bee5b25a35cf0dd261162edab053be8650e5a |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f44ae7ea3ca5a38a501f597554a93d65b7ebc2a5 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/29b3cec20d2e822d58ab6dfbc6a4462c14bf7f41 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8cfaf165aee65ad2ec2cfb840c53ea9813d7fb0a |     
microblazeel |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/2d31a3c43e222ca9e1765fb253bea785d19e5243 |     
        i686 |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/7411ac4ae5bef71b78c69b680de2b72f389ad2ee |     
         arm |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/dec57c19e9aa2e367e23de2232c1d22a2f226a32 |     
      xtensa |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/383f04330fad6746295d22099f0efae28dbd9230 |     
         arm |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/4252a57043949c7761b9ff082a3858090029aa48 |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/9c2eb22e536c7c67780e2d13506fb92d71ee80b6 |     
        mips |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/00042df1a8c1446aa144cbf5ddb900b66efed19b |     
         arc |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/9f59d25b07154421f78bdfc4b4f11a08db44a84e |     
        i686 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/5561766e2eac5b96e0bb62f785b06d7e86d080bb |     
        or1k |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/5cfebcb24cae57c5a78a30a9b6df7adfdf12ac5f | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/498f15ca9c975f79b6cbecaf4be8a608d93f3b5f | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/1f62b3f93946471e4e99df7bc2fb160c0e732339 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e6ac100635613d736264e9b4717d570fbb57f7f3 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/c4d1e29bdcf062a30cd7ab1bfa3533d994c73248 | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/2cea46fd9f9cfd6024d23100f8282fce2d78d8ee | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/7b3b8f18f77b2b042138be781e6cc40b4bf0a06a | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/21c480603aa63879b590024a750c12128abd292d | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/1e0b1f816fbb4009220718276b91b6624bcb24ce | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/9ffa9a390f064792cc719d772be0c6837a2cf4b3 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/4783492c7eda00254105075b884ba3d180895564 | ORPH
        m68k |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/fcc20fbc32d6444233057ada4d9c575b81529202 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/431f229d3456c491b58b71deeb6b87db071c684b | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/1bc6d5c2095629d17431b71d145dcaf03474d561 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/21acb1020d2df902aa391ee95ca3756a7b5f114c | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/6508b5e358b8d19bd58a20a7311f2a0c1bdce640 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/c3853380e65734e616e3f0be1c10487c28fe6d6d | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/342e656af0560e4e345f0420644cff231086d738 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e470cb654a1c7865780830581bb21e375a8a80f0 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/c7d4095a792694b9fda9325caca386b041f25972 | ORPH
     sparc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/a17af57680bc5d756aa7c1a2dc885ed8e5c0678a | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/0bc2cec25f50e285cea3d906122b0861f27e2c76 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/29a212f342872d5d6173cc037a085b3de6127663 | ORPH
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/c53098426c6e65192abd9c96232b425caa63887a |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/1bb9e1f85dd53806a0508a338b2b3a0261fe577b | ORPH
microblazeel | libg7221-dbfc29d4806ecdace5... | TIM | http://autobuild.buildroot.net/results/717b3b5ad8eb7b5e217de765b6de7a2002310fc3 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/74d27370c7623e89e401203a485193340e992e7c |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bb1aa691b18cfaff4dc7f48b66b1931cfa6cd7aa |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c0d7f873095e45da0ace5fddeaec2978bf438b33 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/f4895b0b259440ea470301841ea230e2d380e1f6 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/682b61febb3dae5fd46e68bb268c362ba3baee78 |     
      x86_64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/b4951697b472ca2a9c45fe1ad5892039c2c72315 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/63410327b76aff8e073f9c1cf5c8ea94b8584af5 |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/a330ad07662a8fc313a50aad835d938d016c64f1 |     
      xtensa | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/fb0a92980adce34fdfb6efd9ba04badeeda84840 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/c4472a4ad7ebacd11df7d98bdb2a0da44455f0a6 |     
 powerpc64le | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/0397d743c85baf81b6f71a4573588b004633305e |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/86f848fa2f4206469026640bb513f72e183e6b9e |     
    mips64el | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/67ce98d43a36be0d4d8b80a22d1b5bf96950c875 |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/46ab8e56f96298d486db8dd5d7b12f391cd722bb |     
     sparc64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/31069b0b628846d960769c6a0e585827408394c7 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/31505dd727cd10a4297162718a1dbcbb3bc47c9f |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/6e5a08869ec5d45494288d9056c603ce3ff88da5 |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/bc4ff5de62f89fa36029a9ce0345bfa55bd7e4e4 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/e316c57d17c7815eae7610ff97019c05b0ddf14e |     
        i586 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/ed134971ed62b261c409f1c84e431e98ac8e05de |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/1bb4dd4d9b77aca65a24e631c52070a46cee1fb6 |     
         arc | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/46dac16faf77afdde200c2b9fb0fc9de2855632b |     
     powerpc |                  mesa3d-17.3.2 | NOK | http://autobuild.buildroot.net/results/3d1caaa73b1ae512e8babb5682d6ac65851c794e |     
      xtensa |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/c24e8e119cc8f11f0cf457a05ce7d8d23950229e |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/4e3ad6ba63a37a682fd6a7065aae511fca7bc3e6 |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/84e81bf5686b1adba6d7392b2aaa6180f3eb215c | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/b0d7f41c43020e5e5e7ac37adec58c1b36324e66 |     
    mips64el |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/f6e4fc4aa60a129443972819922af027042c7a07 | ORPH
        i586 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/d2b0cfcfec583d203af1b26152f14ded3ebd3eee |     
      x86_64 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/1d0cbd1eb9b1b70bd9f4d1c4fae431baee9d105c |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/8a412b132131187eb4cb52a69513a9379fb63773 |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/c4f5624dec2112dd1110e110efb10901a0156f5f |     
       nios2 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/d45196c06e6e92ef2f71a9ae8f0b9c9226d2e2cd | ORPH

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  dash-0.5.9.1 | 1 
                 mesa3d-17.2.4 | 1 


Detail of failures
------------------

        i586 |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/fdddbdcf3743397cea6f58ed7df72d00cd278563 | ORPH
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/4ed3850e816a9c32ad43b2193acc917a973de9ed |     


-- 
http://autobuild.buildroot.net
