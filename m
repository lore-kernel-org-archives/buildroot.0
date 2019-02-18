From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-17
Message-ID: <20190218070048.D838922270@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
   2018.11.x |  30 |   1 |   0 |  31 |
      master | 220 |  38 |   4 | 262 |
        next |  63 |  26 |   0 |  89 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           uboot-tools-2018.01 | 1 


Detail of failures
------------------

         arm |            uboot-tools-2018.01 | NOK | http://autobuild.buildroot.net/results/bb415f0095116035ae3c86f32fc6711b02dc8445 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

          shairport-sync-3.2.1 | 1 


Detail of failures
------------------

         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/05c2057bcc801e6c97201188bc2068680365b849 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 4 
                 qt5base-5.6.3 | 4 
               runc-v1.0.0-rc6 | 3 
                ipmiutil-3.1.2 | 2 
              lua-curl-0.3.9-1 | 2 
                mongodb-r4.0.6 | 2 
                       netsurf | 2 
            safeclib-v03032018 | 2 
                  boost-1.69.0 | 1 
                  brotli-1.0.7 | 1 
               fftw-quad-3.3.8 | 1 
                   flann-1.9.1 | 1 
                    git-2.16.5 | 1 
                   glm-0.9.8.4 | 1 
             gst1-plugins-base | 1 
                host-libsodium | 1 
                   i2pd-2.22.0 | 1 
                        kismet | 1 
             libfreefare-0.4.0 | 1 
                  libssh-0.8.6 | 1 
                   luvi-v2.7.6 | 1 
               madplay-0.15.2b | 1 
                   netsurf-3.8 | 1 
                           php | 1 
                     php-7.3.2 | 1 
              swupdate-2018.11 | 1 
              syslog-ng-3.19.1 | 1 
                   tor-0.3.5.7 | 1 
                 xenomai-3.0.6 | 1 


Detail of failures
------------------

      xtensa |                   boost-1.69.0 | NOK | http://autobuild.buildroot.net/results/cdc5738f867ac72b664ab5f6465ebc9c0df048b4 |     
microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/97a3aa0a1b8ad15ea658df262411444c8d3a4ddb |     
      x86_64 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/bbefc1533570b123dfc5213f99ba7c8c6bd8177f | ORPH
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/9f8afc22b5d5fde34a3c1b9c8d170f9e0bb7f5e1 |     
       sparc |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/3093897d14a854a7252b25b2fa1f8fdcbb26c9b7 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/827798833cf33d0db27d891429aeb20c9c517c30 | ORPH
    mips64el |              gst1-plugins-base | NOK | http://autobuild.buildroot.net/results/b295a5557db4b7c7448a6944c1da4d319bacf72e |     
        i686 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/e3e007ca940cf3b747f4303008186d7763d467a7 |     
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/44dabbe9e91b2bf74f64475990c74aa1df91234b |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/1d868798c5b80d7b41123f988449ef548dd95490 |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/bf7fef86a299e68e659753c45aaef0a9d3d4c35a |     
microblazeel |                         kismet | TIM | http://autobuild.buildroot.net/results/f4ce53660ff059bddb33a4fdbfd9d53e0c07ec41 |     
       sparc |              libfreefare-0.4.0 | NOK | http://autobuild.buildroot.net/results/9bf69f238a63ea28690f7c0dbb8c30feb0afc5ad |     
      xtensa |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/0b2c8dba4886bcd04544a7650ba367bb77194473 |     
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/6af3aa2f18e2d549242bc74047ae091f8dcb3ba6 |     
    mips64el |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/0c217720562d3aaa8ac12b75599a392af04ec124 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/dfab80f79cbfd000462cabef9d7a26e59897231f |     
         arm |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/230449d5753cb99cfbc0babe604216bc45e39018 | ORPH
     aarch64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/88cb7a3f44da11035e7f38ab18aaba9589617b5e |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/4567253aaf00984a656f207537197f09659c96f6 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/7dfd0136fd2c2877924d5da28e4453f3b5818c94 |     
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/b25ffb0a89d4389a2e5800b1de34724f3c402c87 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c21f95489cd5fcbf9b7c9f2b434a36557c36cd69 |     
     aarch64 |                            php | NOK | http://autobuild.buildroot.net/results/2b7ca716052f38715a0756d536d7b550828bb63b |     
         sh4 |                      php-7.3.2 | NOK | http://autobuild.buildroot.net/results/56f10496c91993209ba6457896bbd7de1348246f | ORPH
     riscv64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/5f86e4e96ed8cc56b7dd1811b0bf1d8944143611 |     
     riscv32 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/fec289aca3453b10fc92155a96ed6fa7d9178bd5 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/599b67c9038955989b47bf22f23ea1386b900202 |     
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/22108daf382be3964b8f15abdcc4d8bc187356f3 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/df2b0f7fa21d3ad19c12af79fa2ed672994166e3 |     
 powerpc64le |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/1f1bdf7f1f8c3581234b1061ae594c22fe0f5996 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ede76013772bf61cd62c7f29dc758df6bdc89499 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/35b621f9b7ff0d496c1351f7e42ca4e1f82ec2d6 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d1e72619297ad9e6e00f66e69924bc835f6186b5 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/cd18a1beb34514a7a81085112f7543b7da6bc336 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/abf84d8fcee0b1d663a080d17d572cb0a077163d |     
      x86_64 |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/f4fe6bf54d213ca75bc1f16df61f8f92e648288e |     
        i586 |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/d0e0b344d47f32c8870a5f0cd04e0ef4455605c2 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/604aeb2d8b78f0effa21ac161aec202389204b83 |     
         arm |               syslog-ng-3.19.1 | NOK | http://autobuild.buildroot.net/results/fce91b98fb199a26ad5f5f726c9bdec4f9d64486 |     
microblazeel |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/a28efed433e8d2c06bb4dfca84abc630a8284e79 |     
         arc |                  xenomai-3.0.6 | NOK | http://autobuild.buildroot.net/results/cf0e5f3bd383246e2df36370c5c4c044db1c9ccf |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

      host-uboot-tools-2019.01 | 5 
                     efivar-35 | 4 
                 qt5base-5.6.3 | 4 
               runc-v1.0.0-rc6 | 4 
                    ncmpc-0.33 | 2 
                     gdb-8.1.1 | 1 
                     host-mono | 1 
                 ibrdtnd-1.0.1 | 1 
              lua-curl-0.3.9-1 | 1 
               lynx-2.8.9rel.1 | 1 
                        samba4 | 1 
                 xenomai-3.0.6 | 1 


Detail of failures
------------------

    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/f9f00e819b6ff0a376ae8ed0f59e6a5f779f8014 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/88e2dd41f1526ea73dfde6be0744ffb62ff030d9 |     
         arm |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/842a60547ceb46a23e4e2d793e731b62ae0b312d |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/78299da163b1b58222df6b0721891ee942eeba1e |     
      x86_64 |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/d46eae4fb2bdebab97eb09c7117c22de4785e673 | ORPH
         arm |                      host-mono | NOK | http://autobuild.buildroot.net/results/e1e4dc014a7bb68067787402f85556dd2caade1a |     
     sparc64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/46734310e0923a8adaa9fd6c11a3da3e8ee55392 |     
        mips |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/bf81a08912d876f6f203ed3d71bba6289fc4b1e4 |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ed35fc71335e7432d2ebc0ee90ecea3ce5d4ddf5 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0a7a26715755e9f428be1cce443f54216186f090 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/6ef56601e0d13b3de2a63b3805dd4c7d04374818 |     
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/70e29eb761b95ab4923adf3a2790e9d125d8edd2 | ORPH
         arm |               lua-curl-0.3.9-1 | NOK | http://autobuild.buildroot.net/results/036e44f2ad1d124c9f2840afcf46595feed37ea4 |     
       sparc |                lynx-2.8.9rel.1 | NOK | http://autobuild.buildroot.net/results/a269e15b918cdce2bdaae40ae67fb75228fb7e98 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/7d450de22ca06f853bb12a69c13ffcf177fcfecb |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/528742de492512a176bc70e0aa2387b52de3aed7 |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/70105f04fa3b0dcb0f5039050bd8e01124ec484e |     
     powerpc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6bf0491c90170bb62e36e457c85475f3e8a5de84 |     
      mipsel |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fc47465cf78b5bf81aba393e43753910778e3651 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/845bfa526551d526235ba379845e3e8bf2a936b6 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/bcdb56c8012e6b3ad31edbb2d445d0e3fd4fc6a4 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/3664d008c68213a5d2f2a41b05c8d90fbac7c5af |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/2d9fc1961a8ed9dd2db6e0ee2a4437491e7ac866 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/d24a6cf155458a1e7191bf09377ac0cdab536d35 |     
        or1k |                         samba4 | NOK | http://autobuild.buildroot.net/results/3004f60fb1eb6b8399b0d05542257d25fbe02784 |     
         arc |                  xenomai-3.0.6 | NOK | http://autobuild.buildroot.net/results/8c644e2a00199ec618525803c4cb4ee6f281631b |     


-- 
http://autobuild.buildroot.net
