From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-27
Message-ID: <20160728063031.5E308102BD4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-27
===============================

        success : 190
       failures : 96 
       timeouts : 1  
          TOTAL : 287

Classification of failures by reason
====================================

 host-python-setuptools-18.7.1 | 7 
               target-finalize | 7 
             bluez_utils-4.101 | 5 
                  nginx-1.10.1 | 4 
               libdvdnav-5.0.3 | 4 
openblas-f04af36ad0e85b64f1... | 3 
libamcodec-6f9b99182f94be14... | 3 
                     php-7.0.8 | 3 
           libmemcached-1.0.18 | 3 
                 lvm2-2.02.161 | 2 
             transmission-2.92 | 2 
                  snmppp-3.3.5 | 2 
                 lvm2-2.02.159 | 2 
               host-gdb-7.10.1 | 2 
                  connman-1.33 | 2 
                openssl-1.0.2h | 1 
                ipmiutil-2.9.9 | 1 
           libvncserver-0.9.10 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                 xorriso-1.4.2 | 1 
                   dante-1.4.1 | 1 
              lirc-tools-0.9.4 | 1 
                  ffmpeg-2.8.7 | 1 
                    lftp-4.7.2 | 1 
                    quota-4.01 | 1 
                  iodine-0.7.0 | 1 
                  boost-1.61.0 | 1 
                cifs-utils-6.5 | 1 
                    norm-1.5r6 | 1 
inotify-tools-1df9af4d6cd0f... | 1 
               wireshark-2.0.4 | 1 
                   fwup-v0.8.0 | 1 
                  squid-3.5.20 | 1 
                    mosh-1.2.5 | 1 
                   strace-4.12 | 1 
                    mpv-0.18.1 | 1 
         systemd-bootchart-230 | 1 
                 clapack-3.2.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                   ncurses-5.9 | 1 
                  libsepol-2.5 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                   cppdb-0.3.1 | 1 
                       mcookie | 1 
                 rpcbind-0.2.3 | 1 
                  babeld-1.7.1 | 1 
           argp-standalone-1.3 | 1 
               lighttpd-1.4.40 | 1 
                  cairo-1.14.6 | 1 
      host-uboot-tools-2016.07 | 1 
                  multicat-2.1 | 1 
                    owfs-3.1p1 | 1 
           igd2-for-linux-v1.1 | 1 
                acpitool-0.5.1 | 1 
               libcap-ng-0.7.7 | 1 
                 jack2-v1.9.10 | 1 
tvheadend-8e637f9f903f6d820... | 1 
                openmpi-1.10.2 | 1 
                     vlc-2.2.4 | 1 
           uboot-tools-2016.07 | 1 
               netplug-1.2.9.2 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/30f4f08d34814cf02ce82fb235d1e50e09b1787f/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/f9f908ab73917598834e73b4f6907e6797b6726f/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/09277747369ca9ad783e6c42bea02858e4959f0d/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/87d833d82be1d789a61d6dc5006a74066a1bc810/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c8bead4699d62c518fe1ab7d9804dc93d107bab2/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f5ea35f40a6c42136257649d20bafcfd6ee9ef5a/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6d1d4b67a09b657c4399dc3a3a427bb16ee52ab7/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2568a6c9faf4b1e959e66981eab33ee652ca96b3/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/65a5c54c9d22523bc25148a81c529a22ad65c3b7/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/ab11daa51eff06c239a4bf0e0c8efb759debb6f2/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/aed7bc8f7e784503aa48c3ef50d83e557caafd16/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/2809cbcfc38efa732f1567411b5cac6bf2c6868d/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/6c567c2a75966051055e33c384a327fbdd432465/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/36c326cb80704a24f44265197812233c02630ae1/
        bfin |                    cppdb-0.3.1 | NOK | http://autobuild.buildroot.net/results/fc13effd491b48fe6ac7ff7b8fbdd14c2d95a261/
microblazeel |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ef465e4bb72289e325c4a8ad85883b1de0f0933a/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/81a5650f5c5fec19dbcf66d6e3edb9df0c9bfa75/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/a388700362928db32ee86feaef20fac22fb451da/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b1dfcc5b14f3daa886b15a2df8ed6fbe49e98844/
      mipsel |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/9122ed7311355651568c9fba61c98ebc237f20f2/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3256137c626f4efbce0c3745f9a4c33c4a4e999e/
     sparc64 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/90eab350f3b51ece688e6c18277d381d3aa545b0/
microblazeel |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/6ad87f510d3303921536f7b5ac42501a7aa0a69c/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/87e78761ed671a4f9c2694a16fa32f7930d1a7a2/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/25b05e017ef254e1ba37420db0ea054a4bf0c897/
       nios2 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/fe740ea97588167a29af1fbe5d1a50afe768f3bb/
         arm |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/9e286e5261e6db09d88e4b4619992f0d7eb22356/
        i686 |  host-python-setuptools-18.7.1 | NOK | http://autobuild.buildroot.net/results/5064565545d7424023073eeecfc1dfab07a4915e/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/70049837b975ca6ae329dfbc044529fb4a31ec9b/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/5789e9964c5ec867c153458db5902d9ba1e588e2/
         arm | inotify-tools-1df9af4d6cd0f... | NOK | http://autobuild.buildroot.net/results/b9f5dd847cd7134f6864c90e67b490e9a5d585de/
        bfin |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/c15d20f4a8542f6db82fc57ea00a6f9532948ba8/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/d23910079e6f8744ae04686c371ed5360d92e990/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d306adf7593cfc09da6da36ee382ef917a8938fa/
    mips64el |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/27f4b9d869822f4258882f764249d4c660c4d237/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/b596261007e3ae081599c276ac6a5bebc1455e77/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/823e6769c0b96c6462bf3d312da2119a90e6ac7d/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/ad4c2078aef317a0dff9c2bcfeed99bfbe8b125f/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/65603285c054e7593e040824b28887110ada9ad2/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/cffb47de8db29a973f52898610ccea6c85a8c906/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/38ae4038feb250dd9c3060096ac5b55dc9f40367/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/79cc275df7636516530367bcb6b0506d71a6e492/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/82e1e51271ab8a778831bcebc3e3fc364ea7772f/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/26069f37a7738be0077daa3ad661f4b81b4a07e5/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/1fe60374c3096f92d601006702010659f602499c/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/1e0983e506caf3ecddbb3aacd16b68b4772a1eb9/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/a8988c136c402b51a93b566f1b3f37057e28b7c9/
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/2bf86a54e6c8bd1cb753bb874f4a4d9e21ea38d7/
        sh4a |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/640cde2b1c77d8088546ed34f6cf8814f5da1ecb/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/80d558f1194101a6552d68b541ac95f27f67e7b2/
      x86_64 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/a002f83cbc6ec27e2778e164c46c4f5f7b1e8409/
microblazeel |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/c0cb4f66666f3cfe22e269067a5b17ed8b9399c0/
microblazeel |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/c3e3671831f3e5024d9dc1d1d7987cf3c068461d/
      x86_64 |                  lvm2-2.02.161 | NOK | http://autobuild.buildroot.net/results/0763582aaf759ef4ff20ef943b59de52688c0f8d/
         arm |                        mcookie | TIM | http://autobuild.buildroot.net/results/5de50ad273c904b76cfc4effa99f29b8f1052dc7/
         arc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/53be0d6f23fc7d183c2a67d483042ce7ac5139a2/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/3d1c0315d07248c6ee3585769db75eed3ed92cbe/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/9e79b9d2cdec8f7d2e6fe6ca018422758998f28e/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/3879e1f1f7afec802a3b7dad60b2156e55987b82/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/f0585beec49fac038ef798cbea6b5e8a5c9e74b7/
      xtensa |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/82649e9ad150d999e880d8c97bba4e8cc284eb79/
       sparc |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/1da3b1b7cca18d5741d58005ad5611387fdc4b18/
         arm |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/802ba9982089cf8979471dc02e0429bf8e61e7cc/
    mips64el |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/a41d8e1440e771559417be523a9ef9a6213ba790/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/b9197eff2a92f1c34374057ba162f54719eba41a/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3d5ed4085133e73671365aa3ca5620edf0294c87/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/63acf45e496188be57a31f048617ab452b47a882/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/c5454adea229b9be1144d9ad68bedc533d3f6205/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/bb32d6b640e3eaf244702bb2d78546e32f00c5f7/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/e39af38c7f0a5ef80bbe4b0292e56dea92bfb431/
         sh4 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/cc63bbd74ad4a3703d4699cf0d1a94ae85fc6cac/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/833ec4e1c2765e222c36df0996e252ee508ae769/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/2311a5b1e83867f027bc4f3dd56858f0c129f8e7/
        bfin |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/8828c4ffaf94cf66b2cc22dd28514a6fd65b6457/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/7d102273098fc29dfa8cf13d052d5c6d9b19aee3/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/a3d0d20c70904ea91f7cb901a923587412c25f47/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/237bd276799c44c23944b1b1eded5578ca883146/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/42d8e81b2218a75b738cf966edc35dec15d27de2/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/16ae2b3d266d33d258e0a8dbb962572a7fb1c5b7/
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/96fa09fa026fbbe72f8cc7eed54dac97a4853dc9/
     powerpc |                    strace-4.12 | NOK | http://autobuild.buildroot.net/results/cf8cffe3bce3e527c08bbc7f7c9f44ac6638e892/
      mipsel |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/d244459915ff6741f737b27935e4f0cf20c16f49/
        mips |                target-finalize | NOK | http://autobuild.buildroot.net/results/cd3ec763b789505c492790350f3d2c05a5157f6a/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/b28fa20dd2b1cf48e3b9e4cd4dbece7af3bca304/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/e170bf7483eee9e94e049ccbd47b98de5d05c5ec/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/d6d9f5c35570625e77d12f4f980b2b43eab637fd/
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/599164c83f2d0185f9490cfb8a42b1e1b01310d0/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ce36071d55db84ddb58b50ddb67fc78ad6ad9c1f/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/a7926285811ca23bd28558709df9550910e212bd/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/e4227e2d5fda280693b42ee6a026322cd58959f2/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/68747aa8f7fd8e1b4ef44167de13a1f57b7c855f/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8a9ce8fabfc26548cd47cfb76d595bf6a62ad8e6/
     sparc64 | tvheadend-8e637f9f903f6d820... | NOK | http://autobuild.buildroot.net/results/c4b6202fffff7fb9d52e40bb326fb98717a3ef21/
        bfin |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/6311ff376b17148aaf2e9ec1d61425b28b5cd52b/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6222afeaba632335b809038a56d25bf3b9b752e0/
      mipsel |                wireshark-2.0.4 | NOK | http://autobuild.buildroot.net/results/37c59eb174d9163635d6aca3a797ffd668dc87fb/
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/70adc6949a8c8518725f09dfd9be1ac005a1d693/


-- 
http://autobuild.buildroot.net
