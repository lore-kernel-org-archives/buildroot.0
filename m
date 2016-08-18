From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 08:30:27 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-17
Message-ID: <20160818063027.302C6102F5A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-17
===============================

        success : 218
       failures : 50 
       timeouts : 2  
          TOTAL : 270

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 5 
                   lldpd-0.9.4 | 2 
                   cmake-3.5.2 | 2 
      kismet-Kismet-2014-02-R1 | 2 
                  connman-1.33 | 2 
                 jack2-v1.9.10 | 2 
              libarchive-3.2.1 | 2 
               tinycbor-v0.3.1 | 2 
                 lvm2-2.02.162 | 1 
                     gpsd-3.16 | 1 
                ipmiutil-2.9.9 | 1 
                elfutils-0.166 | 1 
                    libiio-0.7 | 1 
                    ruby-2.3.1 | 1 
                openmpi-1.10.2 | 1 
                     php-7.0.9 | 1 
openblas-f04af36ad0e85b64f1... | 1 
               linknx-0.0.1.32 | 1 
                  babeld-1.7.1 | 1 
               linux-pam-1.2.1 | 1 
tstools-08f6be304040e7b8476... | 1 
                    fftw-3.3.4 | 1 
                  cairo-1.14.6 | 1 
                pinentry-0.9.4 | 1 
                 rpcbind-0.2.3 | 1 
                  libcdio-0.93 | 1 
             ntfs-3g-2016.2.22 | 1 
                 clapack-3.2.1 | 1 
libamcodec-6f9b99182f94be14... | 1 
                 hplip-3.15.11 | 1 
                  openjpeg-2.1 | 1 
                    norm-1.5r6 | 1 
                    cups-2.1.4 | 1 
utils/CMakeFiles/testpat.di... | 1 
                libgtk3-3.20.6 | 1 
               polarssl-1.2.19 | 1 
                 mplayer-1.3.0 | 1 
              lirc-tools-0.9.4 | 1 
                coreutils-8.25 | 1 
                alsa-lib-1.1.2 | 1 
               logrotate-3.9.2 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c52a4fe717f96c3798bcbcb855d0ab5fe6ed9e8b/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/7d80c66ab5d4975de7256e73592845b9f8b3a731/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/863711e4d74e0233deaddc3c4b4a78b92e927317/
         arc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/8b7767c01cf1b578d5fc14dc74cfaf9a038f7228/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/18dd4bb5bdf54603b1611a21c024c56cb3fc073a/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/1e82d1bad4cf93d1bc3ccb864b37f579a79c10dd/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/e653b8d12e710abf08a6de9f6ad5e2c1e4ee7a64/
         arm |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/21ed3959079ba1986ff8eff15a03b5b48d8815a6/
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/5730d7ccd6cf19bc395bdcbcb663516afa3e4d92/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/85f0f7c4ba0f014a2ac735bd961cf11a4986412e/
         arm |                 elfutils-0.166 | TIM | http://autobuild.buildroot.net/results/00290ac3454707b13df363caa9e951832146c932/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/cb1ec52e6f322372f4476992a4622345917c5617/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/831f3e32be7ab0c0978bb81cf1e40185d7bb5298/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8c09ca6b57375b114ebf88ef7f3b3f04e57ca1f8/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/6a5da21a39a04662ed9a69263795691fae1e9922/
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/f00a6c59723ee0758140fcb668144ff5db5f681a/
        m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/69cb95852853c3c2b3d03af706a4bf35b9f1558b/
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3acaba128acd78a5647528e6fb3eece1846a1061/
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/afc01af153b42d13845e2f2828f642e8ccea7e06/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/4659090e34e8f25614d24a1b61ac63ef1e89cdda/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/ff0c59f682ca9b29b1ee89d0986f96d878cc45fb/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/88c45733b20c711fd0f5d0a917f41679ca2046b2/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9eaff1dc4795c22be0e39faaacb78a0d4cbfcc18/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/97c78f4ad2a899e262484f51e614ac14d7fe8dea/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/21f10a5fe15b58c47a45bb5d0add04b20baba143/
      xtensa |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/89896f71b213a2123dc9ac02828e3eaf712ea3e7/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/63da813fa7b0bc1523334289bf271cc34a8a2b4b/
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/1bc47ee8622c25a67908ba525335e45dc8163c67/
         sh4 |                 libgtk3-3.20.6 | NOK | http://autobuild.buildroot.net/results/c253bf993584c3e3222245f8ec47ef35504f8807/
        i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/a6b713ff0ae626a90a6ac4535e2523aeb971fd23/
         arc |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/32e375e3f254ac19bed54a9e9fd6c1e9048e2043/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8c9a5fe52f762b4ff4444cf41efdf0d3cf203986/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/28e7bfcffa67fdc5e0773fde689651b007d50bd0/
    mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/381bd0a21914b0a4569d134d93e3998045d51602/
     aarch64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/da4de0e02bc3d9852482c1b868c38c400f9fa1c1/
         arc |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/6dc2eb22104076920d77425b1e608ef9b9e01c94/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/505cdde704c4c4e200a47cfa357e5f4f75c3fcb0/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a431261be66173839794b698957beb769adf7c74/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/f84b79a5ee4cc9501571b4e6039fa5f0fd2ffe8b/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/eb6dabccf729f96a4e06a98526eb4c716fa6bcd2/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/5ff94a9b2109f341d03209c34b628f62c3b307ee/
         sh4 |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b8d520757b087654eaeda5620141bdc37a611a4f/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/be6cb8e2437d345b709cf76357a4420e9beadb5c/
        m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/f35571d40f450bb8951787187751d630b138c1b3/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9dbada9e4438586d413606505362f11f7e9d3e3f/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d6bf05ba55a93fc05eb83324f9a4970779782b37/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/ef8921f61b0ef96bb2f58e273740c593d4e117ee/
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/c2100544e09d4c1825e2ee1f2002ed95dadfe337/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/4550b8a41a671c6d6c440cf09f14503eda5840b3/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/73a701a04d2579a0195123be43f3539d4f8b6a68/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/11c802bcfab70a0a2593079657529c763fd82aa1/
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/4fc95b20a9f2a5c4545d347ebddc6b973e88d8be/


-- 
http://autobuild.buildroot.net
