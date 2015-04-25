From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-24
Message-ID: <20150425063016.4E927101603@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-24
===============================

        success : 162
       failures : 68 
       timeouts : 4  
          TOTAL : 234

Classification of failures by reason
====================================

                  dhcpcd-6.8.1 | 8 
            python-pyqt-4.11.3 | 6 
libubox-5a0bbefc8fa44044625... | 5 
  toolchain-external-undefined | 4 
                 rsyslog-8.9.0 | 4 
                     vlc-2.2.1 | 4 
freerdp-770c67d340d5f0a7b48... | 3 
                     gdb-7.8.2 | 3 
                      qt-4.8.6 | 2 
                  hwloc-1.10.1 | 2 
               libecore-1.7.10 | 2 
           libfreeimage-3.17.0 | 2 
                 lcdproc-0.5.7 | 1 
              postgresql-9.4.1 | 1 
               arptables-0.0.4 | 1 
                 qt5base-5.4.1 | 1 
                     php-5.6.8 | 1 
           aircrack-ng-1.2-rc1 | 1 
                   perl-5.20.2 | 1 
                   mono-3.12.0 | 1 
         network-manager-1.0.0 | 1 
                ipmiutil-2.9.5 | 1 
                host-ola-0.9.4 | 1 
               qt5webkit-5.4.1 | 1 
               mosquitto-1.4.1 | 1 
               gptfdisk-0.8.10 | 1 
                  zeromq-4.0.5 | 1 
                   zmqpp-3.2.0 | 1 
                    qpdf-5.1.2 | 1 
               openldap-2.4.40 | 1 
                    webp-0.4.3 | 1 
                 webkit-1.11.5 | 1 
                 clapack-3.2.1 | 1 
                 leveldb-v1.18 | 1 
               valgrind-3.10.1 | 1 
      host-gdb-arc-2014.12-gdb | 1 
       gst-plugins-bad-0.10.23 | 1 
                  boost-1.57.0 | 1 
                 cdrkit-1.1.11 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/3f57547781455e3038474b0cd8483c249671e8d4/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/fae1d54b907fe51cbf027f243f69f567e77ba241/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/539b14fd419f686ae9bc2351f043b75d192c4b03/
     powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/883696ee0308f1b8a97fb10728ad8bafd58a6267/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/425f8a632b7a73eee65166fc846e9bce003b6a91/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b916e6a608944da8f67a0c42e5c6bc73645be405/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/19a582877ddf7072428a87fb528db01c615355c8/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/d68873741415655b46038576ebff042c1f6b0bc9/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/806009ab82d4f4dfbeceec891c0296595ca1c36f/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/1cbc3985d6db389fcfb8f5cf5b9712a1a3081348/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/f844d3aa84fc65dc8c29968d4ecd50c2c4d2af92/
         arm |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/dd0ac4d3dfa1dba2d6e3ffc5494f2aa5ec2b50f9/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/a79d01044576f0663ac0597f72fd8e5dbc4b8e82/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/ea62b67ebb705f3d377cf9dceabf7bac08877dcf/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/814a68dbdb1a2a2a7cb34bd8d049ba9695323ded/
         arc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/04bd8ba354e0d380de377fcb265d9ab2b771bae0/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/1eb8f4c5c7d78dca1374949fa0be86baca4a9e7d/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/de8e76dd1f5e0494bbcb2d437250e0bfaa5520ee/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/8f5ebdfce05dcd8715a06f2083bd311979c1cbad/
         sh4 |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/8a059a8fd24660314e9bbc551c552917fb48fba3/
         arm |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/580cba615566cb15b1accd353efbef273bcbcf03/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/e344bb75ecf17d9604166531b21ce8e7f81b449b/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/b785187962ccff48c6deccf65d5cbed354bb0004/
    mips64el |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/d979624843d2d2020cf43770350a8b9a63dcd04f/
    mips64el |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/789697c30f83cfb80fc0ae6e84b7a5df37906815/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/1f3f159c0dd171c662f3aa6b48a7afd3bb93ccd0/
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/747ba8da3f65c576f2cbf36d0f0ffe49af14a0cf/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/95206e3ea3500fae1eefe34b69958764111686bd/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/9a76e585a7c4f90a0363b62fb59dfc10e27dead8/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/20658d21ce677c8b961e284829ebe9dab5743c45/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c1b3880f0d94d0d03d362f6a37628933fa36ab0d/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/2c1a1468e9e119646797440ebbd31fc2239620a4/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/342f73e91c623fa1562718711914bd8544616304/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/6a75f2e0e54cf8c47e8d985e659fd334a3f39bff/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/7fae9e511ac3e89f55dbf41da802b1ec2b7394a4/
         arm | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/682e1501a4ccc5718622e7a2368031d37956645b/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/1b82fd529a9ad686dd52d74c001f4917d4d8225b/
         arm |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/05b5df3ac06fbc33c38d0c62ceeee1483fbf8bf7/
       nios2 |                mosquitto-1.4.1 | NOK | http://autobuild.buildroot.net/results/cb249e8e6b0cb6e5eb6731c87c76745a58864412/
         arm |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/718fc0eb28fc056ac83352547fe92313b33c3d59/
         arm |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/14828d57a38d76d8e5153812c6ed99f4fe78d0bc/
        mips |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/94c925976c71142e4dbae7549b9feadfbd3117b7/
        bfin |                      php-5.6.8 | NOK | http://autobuild.buildroot.net/results/996e806950bf4e415acb5e8dc7080bcadfe7b8c4/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/e118eb30e9a91c039ce823eb36f1adcc110306c6/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/6a28855c11b321ce8ceaf0acdd5395738af931fd/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/91a3641d1e4126475bbca0d3c779582832f6db91/
        sh4a |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/b10fa70c199fc2de405068fea1eac80c29577747/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/b5334ac80afb58a19bd40b7c0b18378d75bc8fc7/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/01fa1319e467c3c2410fd462dc40c18b82dc8246/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2e6cae93ab860175c405e440bc7e24334b5b14e8/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/af857caef0c622aa9cfb1859b344880971ff263c/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/16a1dc2cb66ba202e646f5387a10a2433d1b9c64/
     powerpc |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f60cffdbcdec482bdac8433891a26acd262f8b38/
        sh4a |                  qt5base-5.4.1 | TIM | http://autobuild.buildroot.net/results/7f30ade0b9f0a6253b04a23f522c9eda593de75b/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/d98c67b8cfa4014b59a66c20c13bdb7f2fd3c627/
        i686 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/e898a1e7c310003c87ee15921719f438df15298e/
      x86_64 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/3fe553f671aaf789779674e4b5004c3781203657/
         arm |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/ef75f2fce330c7acbebfcf91910911f97dbc6da4/
         sh4 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/798fcf7f1a1a08fbdcf88bd4c133c62420e1e6eb/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c5921487e9109e95df7c3f8922b04d70632326c0/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f8a79e865a80f6ef5527358f75562e90459bb5c1/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7d6d172961ceb9ab5aef09ea17ea385b8bb2b57f/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f8b862c010bdc3707e7d94ff1ab5764fe9189617/
      mipsel |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/4524184b407bb6f9b55f8f85c8e0b475ff105420/
      x86_64 |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/724fce8ce51c2c0578192b1369a1cfcea3d72638/
     powerpc |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/b149dcd9bfcf9e69cf7fa16636c3089a6673769a/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/1f6a4a9084a9d07bdd8d6c6dafeedb38d27c0b8f/
    mips64el |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/d45c4abcd22d99edaff8943b0073a94dcd972ab5/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/be7592eee4aa85d4c3e84ab2dc0a65b2c20036ca/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/e31e782d927215dde87b2f3174d70b8eb70085fd/
     powerpc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8bbc530ad22757fdbd454949749f92318e7c5e8b/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/90e4d47bb6abccec3fe39a56e30aae3c45c02bc6/


-- 
http://autobuild.buildroot.net
