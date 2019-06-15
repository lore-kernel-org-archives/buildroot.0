From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Jun 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-14
Message-ID: <20190615060108.2AAD92000C@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-14
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   2 |   0 |  22 |
   2019.05.x |  24 |   2 |   0 |  26 |
      master | 163 |  38 |   1 | 202 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 1 
                 qt5base-5.6.3 | 1 


Detail of failures
------------------

  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/3f788cd6b3986503d967416037f1399cafa8d965 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/bd7a9349f840d3471e5158b3f41ce94bcca62c1d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          modem-manager-1.10.0 | 13
               libglib2-2.60.3 | 11
             iputils-s20190515 | 2 
                qt5base-5.12.2 | 2 
                   cups-2.2.10 | 1 
               host-efl-1.22.2 | 1 
                host-libsodium | 1 
           host-nodejs-10.15.3 | 1 
          libcdaudio-0.99.12p2 | 1 
               libgtk3-3.22.30 | 1 
               libsigsegv-2.12 | 1 
        network-manager-1.18.0 | 1 
             openjdk-jdk-12+33 | 1 
                 python3-3.7.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

     riscv64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/e5c6930211a7093567e665038247f983a209ff90 |     
     powerpc |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/d1735907e5c0557ec86ae6ff28783de90e74e2c2 |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/501ebc02adf5f43ac55509c11b8c511afd2f955b |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/71f91fc7408ebad68fd3cc3145355fda6cbcc87e |     
        mips |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/606b285a348317bb6573fe2ffefbfc3e51a5f9ae |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/c21750d343eea9f0e2b23028938258307f5af422 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/1a6043e00bbbd58c0f8a8229a756d1b2b0ec73b1 | ORPH
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4667e30e5884d40a9be36cd520c58a9921c1e914 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/78298c524cb6253f1bbcd86f811f4826a4f80abb |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/056529e36d4782bca02f38074a1816dfebc1a452 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b45fba59cfa6c5e7fcf01ba8a9eecd19dfcfb132 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f05a76f162584abcbc8562fbc6ed4c1b02e9f4ad |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/67b2b7b7b20854718758849bf718aaf6fe536e0c |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6a0e5041954aeffd71fbd6d135cbbf6e81de656a |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d55704c45ca75326df5cc676c4f7e35665a95879 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/08eb03a8ceede6d671979190782a2c2ee2e7793a |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3ebd4cfec410bc96aacbcd42918dda36e2f78adb |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/91f56786fc59d5b6e68c604d68620122caabf5db |     
     riscv64 |                libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/bae5446928a8c12c1b7dc7a4ffc461e581fdb822 |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/d79d913e625676a97c41fc0bf7f6be8f0e6fb3d5 |     
         sh4 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/d14de68a4ed7f564388b7a5c16029f6b8844ff6f |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/fc959d8db6156156b9b61d2a78b16c535c84444c |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/b55737a35e35863b359eff802d02a0cf31ccf9a7 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/21e78bc2e1cf776063704e9560739059f9f96983 |     
      xtensa |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/163add91db517fc2a474258df868fb0717facb12 |     
   powerpc64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/6d6bd3766e904b9a0bc6a3a5f3a6a647b0c5cac3 |     
     riscv64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/7fc7752a8f142bdb86e1a83983754382a2b773e6 |     
     aarch64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/b83a280480438700e4608475aa6f2f7087d0da33 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/085b6bcfcd888be16386f202e207f149f9a5c58f |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e0d1e1f854981b19f590d53a7a623020d8479d72 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/c097b91f7c460418df4eb43d3bd426da8e7dd0c7 |     
   powerpc64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/9c2ecd4d0f608373276313fea94a33f85baeef36 |     
     aarch64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e51182917b3941bc016bd4862f7d9c55cb79d91f |     
       nios2 |         network-manager-1.18.0 | NOK | http://autobuild.buildroot.net/results/032db18d548eedeea76d67ad5548a9fa08d0fe8e | ORPH
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/988c198a4939adec09db4bd37245bdb38e69a5be |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/c1335ce9398bd40a8e288cb311aa8c75314ca3fc |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/66ab2c393baa89b866f4dfb4817ca85384c112b7 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/ad8a6c645288a1124f0f6a7941ae6482d7931356 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/e59294ef3f59f2edf16700aa244733425cf91b23 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.3 | 1 
                  weston-5.0.0 | 1 


Detail of failures
------------------

      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/cc9daae90c64466842c42a3a33d849a5133528a0 |     
        mips |                   weston-5.0.0 | NOK | http://autobuild.buildroot.net/results/5fb140acadf26b7f38d3f5c07a4f8dd4dc9acb9e |     


-- 
http://autobuild.buildroot.net
