From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 06:00:48 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-30
Message-ID: <20190531060058.2BE5A883F6@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-30
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   1 |   1 |  23 |
      master | 217 |  22 |   0 | 239 |
        next |  40 |  22 |   1 |  63 |

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 7 
                      iwd-0.13 | 4 
                      ell-0.20 | 2 
                iproute2-5.1.0 | 2 
                   netsurf-3.8 | 2 
                cracklib-2.9.7 | 1 
             host-cargo-0.26.0 | 1 
             iputils-s20190515 | 1 
                       netsurf | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 


Detail of failures
------------------

        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ea3dd3b8545b6a71b5ddec5cec689af131c9d8b0 |     
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3785cdece27d1a3c631d6d34a924285a8546818c | ORPH
       nios2 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/41cf5fa54a809d6a2269fde479e96017cf55d3b8 | ORPH
        m68k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f85114dd7b455f4f8a8023a3ab61cc995e226f9b | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/c0e8543f5809a05ccc31abf71dc10102ea836321 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/54af1e3a38b69cb914043469fcc69fd777795481 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/143242ca9ee10d71483808540bf7366a67ac443a | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/69fce315604301a124f63e44415d1f7dacfb7005 | ORPH
        m68k |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/eac049f90bad3d3efc01e7280d9d34eb8cc73cdb |     
         arm |                       ell-0.20 | NOK | http://autobuild.buildroot.net/results/444c9deb728fb041e560d940145f96cc4f455080 |     
    mips64el |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/c16ab1fa269f86d3f69eb40916d4a9ad99821ef3 |     
         arm |                 iproute2-5.1.0 | NOK | http://autobuild.buildroot.net/results/d38d3a84c61f37747c652382646839a69de16463 |     
         arm |                 iproute2-5.1.0 | NOK | http://autobuild.buildroot.net/results/39e47a612089d001187aab949a9e2e360172116d |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/b11e8a7b011f944de570b7ca89bcdaaf7b516ba4 |     
         arm |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/9fd8d1745e7f218c1825c6b11ff27a1a9385f55f |     
      x86_64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/79211774017b11fc45cf5c3eff6f091a20ae7f05 |     
       nios2 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/b4ad13ba4c8726a7a85e0c8a92ee687c5997645e |     
     aarch64 |                       iwd-0.13 | NOK | http://autobuild.buildroot.net/results/2bd1fb482ee5d963fa335d1fddd90ee6cf96a0d6 |     
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/4ce1f2aa9a495e14152934997b88ffeacb7425ec |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c19d41fae00fdab3423cbe4067a806b338f0d70b |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7dc4426f6364204bacf45ea30356bb88f7ae8748 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/c7ebf28e6b0fbd11b63935125cb73abc7f8d8edf |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d37d30422ce809b902342ccb7bda50d72f243620 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 6 
                qt5base-5.12.2 | 3 
                  grpc-v1.18.0 | 1 
                      gzip-1.9 | 1 
             host-cargo-0.26.0 | 1 
                   i2pd-2.24.0 | 1 
          matchbox-panel-0.9.3 | 1 
                 mesa3d-19.0.3 | 1 
                mono-5.20.1.27 | 1 
                     ngircd-25 | 1 
              python-pyqt5-5.7 | 1 
               qt5webkit-5.9.1 | 1 
                suricata-4.1.3 | 1 
              webkitgtk-2.24.2 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/20d6f2489a4e291a53bd514da66105eb607e1014 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/6bab7c71234b25b42e17edf6f19cd8790e62e074 | ORPH
         arm |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/c81b9009ce7b29a30102b15823a788ffab9fe8d7 |     
       sparc |                    i2pd-2.24.0 | NOK | http://autobuild.buildroot.net/results/9dd1c34917d4c67bdf4b1aaff3e9c087c8149f6f |     
        m68k |           matchbox-panel-0.9.3 | NOK | http://autobuild.buildroot.net/results/3e72c2c2baae3a70fb5145b1b09a1f3716e4bce2 |     
         sh4 |                  mesa3d-19.0.3 | NOK | http://autobuild.buildroot.net/results/9492e9c92923be95195b7bed49b9a6f8330eff0d |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/36b101388cf6dd021bd90edc1c88eb7f2f3edc60 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4b6aff1f968046f3f98e29c808df794050ed5ccb |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2a3b9bd8e5d394965a08d9ff332ee2cea0ca6b52 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/32a8257d178c2524970bee31ea51dbacdea24506 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/758272c9d2a613e67d3aba7440cafbbbc6286ef4 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a4cc003a9719f8f8e2778cddf485c9b944f23421 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ba7f30833fef54162a82f4b336a72d6599594526 |     
       sparc |                      ngircd-25 | NOK | http://autobuild.buildroot.net/results/23aa5b56320a9ce34cac6237b44ce582d750515b | ORPH
        i586 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ae75a28342d02e5302870cdd04d7426b90e058c2 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c5e803162c9d5db4d213069ee05fe5b7d64ebd47 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/a12c38a72fdad0d226ca510fab36c21bc4be5a20 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d1fcae6cec79b2c8ea265d32f4ba6863c683abb4 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/b3160a55a49d8c3472d6aade5be79c06af14ef96 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/2ff3ce2f852d4c24a96cddef3f5d5f7591ef0311 |     
     aarch64 |               webkitgtk-2.24.2 | NOK | http://autobuild.buildroot.net/results/e29ec80e4eb09d50206af25a7edb8406100e4a2b |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/edf5dc46fca280d2248f0595e01ab60913fb4510 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                          opus | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/5184775914b455fa4ac9459cbb284ddd29fdf200 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/857363bfa37917d5b927e5c09dbb3cb659ba0b07 |     


-- 
http://autobuild.buildroot.net
