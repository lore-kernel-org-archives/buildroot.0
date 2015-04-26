From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-25
Message-ID: <20150426063015.9F439100F75@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-25
===============================

        success : 172
       failures : 60 
       timeouts : 5  
          TOTAL : 237

Classification of failures by reason
====================================

  toolchain-external-undefined | 9 
                  dhcpcd-6.8.1 | 5 
          input-tools-20051019 | 5 
libubox-5a0bbefc8fa44044625... | 4 
                libtirpc-0.2.4 | 3 
                host-gdb-7.8.2 | 3 
freerdp-770c67d340d5f0a7b48... | 3 
            python-pyqt-4.11.3 | 3 
           libfreeimage-3.17.0 | 3 
                host-ola-0.9.4 | 2 
         lua-periphery-1.0.4-1 | 2 
                ipmiutil-2.9.5 | 2 
               host-qemu-2.2.1 | 2 
                 netsnmp-5.7.3 | 1 
              postgresql-9.4.1 | 1 
            libunistring-0.9.5 | 1 
                libevas-1.7.10 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                  bcusdk-0.0.5 | 1 
              libefreet-1.7.10 | 1 
                 clapack-3.2.1 | 1 
           uboot-tools-2015.04 | 1 
                elfutils-0.161 | 1 
                     vlc-2.2.1 | 1 
                       unknown | 1 
                 rsyslog-8.9.0 | 1 
                 tcpdump-4.7.3 | 1 
          sane-backends-1.0.22 | 1 
                  weston-1.7.0 | 1 
               alsa-lib-1.0.29 | 1 
               arptables-0.0.4 | 1 
               libecore-1.7.10 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/653a2b10f0448a9353916737613157d1c852830e/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/0cf770456a88a7127efef831a9ff5acf5c2e5e36/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/dddb87d79f584a8f4e8c6e170199903551ca59b4/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/2f6cdd7f5c111c93e4d9730935bfa94a486cb827/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/7d19dc34c5cd32d9039efa48fa111286b30fddd4/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b7bea1ccfd36a175e64b96b21e116e68455e4eab/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/a42af6ec3049622816474490924d60c7dbb1a06e/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/8c1f2bcdc15a382a68a9c967cac67e21b8c6eed2/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/cc9121e81a7fd9cb61ea0b2d5245dc7111cc31db/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/6aa9bd7a44962da76ca1db3a0f5684d84d854727/
      xtensa | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/3bf4161f77d2abf4f8b36c0299799d45114a167f/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/558ccb0e475bfb434685c580d86f6c634238a084/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/0947b067cf1c2160efce54b5a52cb7a5f00a568d/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/9de024e3308576debe1c0323e2995d6e8e07570e/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/08d199417a628d50fd615ac61c46d9362dc1b72b/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/7ba3a4bcfbe827cec1aaa5a499f0a27254673d13/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/2f2b82206b0fdcf3d817a62a862aca7296aecc50/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/cc34eb70db02f303896c3e5f7c72009d3ff51407/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/6ce699f8ead2163068febce90dcb5ffa514bc4f2/
        sh4a |                host-qemu-2.2.1 | NOK | http://autobuild.buildroot.net/results/229cdddcd71eae60233e97c810c5b1c3f4079959/
        sh4a |                host-qemu-2.2.1 | NOK | http://autobuild.buildroot.net/results/5cd07c80c9f776ef7293c60fa8c2cc4aa6b86a4b/
    mips64el |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/bb786fbbf44319c056e63d1a6964426b8bb69b05/
      x86_64 |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/1f3c5c060cd98a3f4cf9688fc8a83cc1c23ece29/
      x86_64 |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/69364d1b06c85a9511d57d4e44a903c18789a5dd/
        sh4a |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/89c9ebeebf5d287d03f76a43aba418794a7ad91c/
        sh4a |           input-tools-20051019 | NOK | http://autobuild.buildroot.net/results/669550e61861911505c004f88dcb5000bdc8f887/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/9cc752902038a685bb5ba8ef6a0d847bdac227fd/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/ba8f5a1bc24986b1d4651c01b346aaa4f0294490/
      x86_64 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/7436712857c387ca9fdb473e9411bf8d6eb621d1/
        i686 |               libefreet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b0f0343c36cf74f529615b3d22407bd2e8d97f85/
      mipsel |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/9137afc2339fe1af06252dbe05dacef3ff9dd027/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/abc32f3fcd3498ae5b65055dc936a314d29f8f1a/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/98be0122929db070ef866b7fce57f46db502788a/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ea24488018692099541409810ec4a0e05c2e485a/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/75bdac3b1f994becc36f0c5a9258d59c1e8790e1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/607134429ffae8fddebad54a0b7d8bae6aa9dcd1/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/21077df27edcd83816cb52373e45cb6fdba9245f/
         sh4 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/f1adc6eff5fb30a3e092ec0a841ce4ef85cae342/
      mipsel | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/bd322fb0b8d6617bc9ad19ac8747aa8224b83521/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/4bea9df9dc3e25da8d252a55d9657b2ce962d017/
        i686 | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/f2ffe5fa37855563e43b33485c51a307cc0157b8/
         arm |             libunistring-0.9.5 | TIM | http://autobuild.buildroot.net/results/7ab538885fdd270d05e5ec7da407d6aa7342c1c1/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/b62b7b3a927ddf168f2546dac086a5dd7921ea64/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/032ddc9b576ea1c9ba4bb765a09807ca1f472f67/
         arm |                  netsnmp-5.7.3 | TIM | http://autobuild.buildroot.net/results/8faada03e31753f6f6668e7238ddd7223af51b3c/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/adbc83986799618458c8766678fe397f4500ef6c/
      xtensa |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/f4334319a8e911357cc16b2061fc5ac048f86864/
      xtensa |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/2ff045a5f17ab3e0d481a1d5ebb7a95706408f2d/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/1db4d224f9d47195a3198f64c77088873543f512/
         arc |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/4b3a873907e0eb4ad31433eb915cbf2247fc2099/
      mipsel |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b73cf03c5ef641f4985799dab49af727843b1410/
         arm |                  tcpdump-4.7.3 | TIM | http://autobuild.buildroot.net/results/1323d4b11a5bf89a58d586fefad9a3db08888429/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5202419bbf32294dca9e149d7af6ebd47baa5083/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/57fba544a8ef0794099204891de593d2d3abcd8e/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/851e7f7931409d1b1a43614ea24a774614bc0cf2/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0d11cf896ebfa75927a77335ec1325a40d154e57/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/225b55b04f46896c513cc5f6d28085ed9fa62ea2/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ce1b50dbadc9a4978dd81f269cdcbf15e15f53b1/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/bca0bfb659f0afa65a4c52e66247c8a59de2e653/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/d3d52c882bc641348a173649296c82618a1c7be8/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/6637d3ce04b6032930f60e542abad2a3a9574d12/
        sh4a |            uboot-tools-2015.04 | TIM | http://autobuild.buildroot.net/results/daeb6859b8f6d17c8de20db8242e308b204f52e2/
      mipsel |                        unknown | TIM | http://autobuild.buildroot.net/results/105fdc14c5a2555366bbcfbcd9b0f4fc7089d87b/
         arm |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/4ddb8f4688b046fed894193bb178434759857740/
        sh4a |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/2bed7a13d261c3c240e28abf4b01f247f9520562/


-- 
http://autobuild.buildroot.net
