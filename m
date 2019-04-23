From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 23 Apr 2019 06:00:37 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-22
Message-ID: <20190423060046.54DC9227C4@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  27 |   2 |   1 |  30 |
      master | 248 |  64 |   2 | 314 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               linknx-0.0.1.37 | 24
                    dhcp-4.4.1 | 14
                cracklib-2.9.7 | 4 
                   netsurf-3.8 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
                        glibmm | 2 
libcamera-d5ca33f6c7b0cd1ca... | 2 
        libcpprestsdk-v2.10.12 | 2 
              qt5enginio-1.6.3 | 2 
                  samba4-4.9.6 | 2 
                  brotli-1.0.7 | 1 
                  davfs2-1.5.4 | 1 
                    efl-1.22.0 | 1 
           host-cryptopp-8.1.0 | 1 
                    ncmpc-0.34 | 1 
                     nut-2.7.4 | 1 
             openjdk-jdk-12+33 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/026a3fd62ce47605e8fc005d506f0842db737c11 |     
        or1k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/bd6b9c8c0c565e840355eec5488882399c421f56 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/f97e71c3cf0e81e06206c0c783833b363d720719 |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ec2c6b144e6c892749d91584aefebea8538416a9 |     
        m68k |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/5f1439a6544af316028141adbcdec663344de0cf |     
         sh4 |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/65158087ae2b59f4b3ce77afb3a382cef971854e |     
   powerpc64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2a916698aa59541f08383ff0faebdc58ebc715cb | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/f066821e404ad4ab66c29793cafbc69a07a67600 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ccc45b5a2ec55c2ee90e07bce421cf3da9a95cc8 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/febc15c9fe2802e08c9722ce21d500f4abab5828 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/5a33057ceaf3f53e6ba9deab3f214a4c8a644352 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/8c00059960d7688687b44ddc8efa0286fa745fbe | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e415b5856375c40d98513c4632fa22c10fa5e22d | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/12cc639d2aa7ea2e7e65bc6a0acaf16bf21136b2 | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/37dfe17c9e6693e07a5860c700e236680e28c3db | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4b602af47095eb8be37bcb7e6f677af1208180b9 | ORPH
     powerpc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1740dc70de998e4aa1012260e82aa22efa880862 | ORPH
     riscv32 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/4e3558f3f4005d2c4e96ac2389a98b27e758fdd3 | ORPH
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/41449d2e0f122c56f53796bd8ccd91a8f8745dab | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bba42f89dd50233f9602dd186ab5d3bc0ad57f64 | ORPH
         arm |                     efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/6e5feb4c2668797323f4408bd2f8974e97f197d9 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/de2dd3311c08e8fa12ca92430de73d8f757553e5 |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/646b7f75841a24d64738560c5ded63f0a28e1422 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/97f35ba81d9d2efaa771dfafcb07f984499846bb |     
        i686 | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/80484849540786b913e353077cc4ff7c6443a4ca |     
        i686 | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/7151bc90c7d24e327fbbc0fb2686f89137c0dde6 |     
     aarch64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/c2c83b29c4c3e15e750973a8ffe560174a7907fb |     
     aarch64 |         libcpprestsdk-v2.10.12 | NOK | http://autobuild.buildroot.net/results/536ea95a6f295e047505e36076102569b7a480ab |     
         arm |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/e21d43c556c0c87c91e16d1d967428a1b474074c | ORPH
      x86_64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/dab1dc6f2e4a29d287267e0fb8a93a07e8539107 | ORPH
    mips64el |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/ed9f7526629ad65b1011dd26c708fc16ca3f2be1 | ORPH
      xtensa |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/80aa746504382a0d8bddfabc7f199a0c369123c5 | ORPH
  aarch64_be |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/c0f6ff32d513d9c65bb59d1365d0f7886c582a64 | ORPH
        or1k |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/06ee7d5d9ca564a0964694bf35c4dd6137b0492a | ORPH
      x86_64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/ce05fd6fc9a6ff2ec5155375c52d38bee7f29159 | ORPH
     powerpc |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/28e0822d71ecd32bcd5df575604609d1b3171f0b | ORPH
        mips |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/bdf9aa8a3d1b6ad8291c31806ac8df433a0e94b8 | ORPH
        i686 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/54e0e42f904bc9d6871b7a485c2f3ebcfd0bfe29 | ORPH
  aarch64_be |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/411e062ea717e8a57756e38ac394317e2d26cd7c | ORPH
        i686 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/a2f7e62e97422fee18b7fac0ca6a5673d2335ffb | ORPH
     sparc64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/46931e3718ce8ef19782bbdd5ff2539254f8709c | ORPH
      x86_64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/bfc3b9a6de4a178034072df3cb0b3b64c18749fb | ORPH
     powerpc |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/daa94db990afe6234acef3d4416c5f2e55c5e7ff | ORPH
     aarch64 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/7dc90b4cd968e5a793c3a508e39541933890de33 | ORPH
         arc |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/642b90e2665ff008d4552c418bc2c742155684b6 | ORPH
 powerpc64le |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/63e2b0e1aa72665fa07b93a0335cf1ce29369c1f | ORPH
       nios2 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/1b152ca2828f33aebcba87ae6b4813e8856a4f64 | ORPH
         arc |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/3566a54a1b217ed3da38c06e63e906bb227c5acc | ORPH
        i586 |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/d8046b3f01ec82c16bc9ee47830446830fb077fa | ORPH
      xtensa |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/290ce27c6703962da0ad9214798f99045f8ab8c7 | ORPH
         arm |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/3ff8ef64b00fe2ab6d1cdf7933a3b42d3f1c1f94 | ORPH
         arm |                linknx-0.0.1.37 | NOK | http://autobuild.buildroot.net/results/cb8e7209ff3957c108772bee428324651789760e | ORPH
         arc |                     ncmpc-0.34 | NOK | http://autobuild.buildroot.net/results/1b40e07dd55bf137ce6c6a42671ef04ea40ca478 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4f3cb20cb9c235347326a280e09f03e42a460066 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/267cc9330cea39eb0e12adc7c0df588ce4397339 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1b90cc3b448d0fed00ac217c28002bf5c3335473 |     
        m68k |                      nut-2.7.4 | NOK | http://autobuild.buildroot.net/results/f7e6afce4b3335573f3cc62d282368b288e9a65a |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/0aa849210cf7a7b9f0c4b7834f8cd226652a5c5a |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/de6d3886fe64e904848fdcf00487fdababa9e7bc |     
     sparc64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/578062e68991f5a0b80e60bd2cfa34e1c9536956 |     
         sh4 |                   samba4-4.9.6 | NOK | http://autobuild.buildroot.net/results/288c831c709b362984bd80ae9fb7acf4b5b85898 |     
        i686 |                   samba4-4.9.6 | NOK | http://autobuild.buildroot.net/results/4db6965d94b257cfce62a149283d981433f585bf |     
        mips |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/cbb53f641b84d9e59960cdd6362bb828fcc8366d |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/822e24eedf58f423b89c685796a90f5f2e2f1a0f |     
     aarch64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/7e8001b29e0e572072c4e1c8ff24211a7caef5e9 |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/e945f7a2f10f508c800b701deb4e4fa8cb1d89ec | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   netsnmp-5.8 | 1 
                       netsurf | 1 
                   netsurf-3.8 | 1 


Detail of failures
------------------

         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/a8dc920e3e0354067e6ffe2417b7a4a3cd8bd41a | ORPH
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/81ab88fa91a8a230c6d9fe3daa3929df00d2446f |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/49f8567dfd1323cad50d9bdc0d3a3c61bae4b411 |     


-- 
http://autobuild.buildroot.net
