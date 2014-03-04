From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Mar 2014 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-03
Message-ID: <20140304073011.31AA31014D5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-03
===============================

        success : 93 
       failures : 42 
       timeouts : 0  
          TOTAL : 135

Classification of failures by reason
====================================

                  samba4-4.1.5 | 10
         host-python3-3.4.0rc1 | 3 
                  dnsmasq-2.68 | 2 
czmq-b5730c5f8290a611fd3b92... | 2 
                    crda-1.1.3 | 2 
                 lvm2-2.02.103 | 2 
              host-scons-2.3.0 | 2 
                directfb-1.6.3 | 1 
                poppler-0.24.4 | 1 
                libnftnl-1.0.0 | 1 
                libiscsi-1.6.0 | 1 
                     php-5.5.9 | 1 
                  mysql-5.1.73 | 1 
                elfutils-0.155 | 1 
                  ffmpeg-1.2.5 | 1 
                   cups-1.3.11 | 1 
                 qt5base-5.2.1 | 1 
                    gpm-1.20.7 | 1 
                     vlc-2.1.2 | 1 
                   systemd-207 | 1 
                  python-2.7.6 | 1 
                      bash-4.3 | 1 
              wireshark-1.10.5 | 1 
           imagemagick-6.8.8-4 | 1 
                minidlna-1.1.1 | 1 
                     wget-1.15 | 1 

Detail of failures
===================

   powerpc |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/6defc3e1ff598c900a4401576160824f4009b6ce/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/1b257102579dde721a0fa62393d2809e6e62d64b/
       sh4 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/0c811dc89506b48e38ae40b0f9eb26b72b909643/
    mipsel |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/f3d4f67ce7ee1d54f5bd4c87dfddb7417db614e5/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/346b837e46631c9023f27ae7fe053247bab3e4c0/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/37e8ab4c931bbb6f5e38922246d3365b3fc5c674/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/bbaf7f3663392219cf209824ca86b852c7601f8b/
    mipsel |                   dnsmasq-2.68 | NOK | http://autobuild.buildroot.net/results/161446dde7e8e774773eb2b34fd555f5ac22dd02/
      bfin |                   dnsmasq-2.68 | NOK | http://autobuild.buildroot.net/results/c2c2be299fb55cdb2f391a9573aa25227c3a3d32/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/80a0b849522da7409b3ddea16e707a7fc238f604/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/f9f36bcc1d66bcd7e7ac4e27e8121fd76bad7c15/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/80bfa83f863adff9e221d4b8c510db5c0f3c0465/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/0c42d05822cc1855711e7a414927d47b37d7e0ec/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/583244374512e45dbed0a1f127a35f51e16bf5c0/
      i686 |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/7c8c88701245f4a5b0c6d1094ab62ff6954fdc29/
    xtensa |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2597bf0b76196b80d56c578f8eceac8bc7ca5ae5/
   powerpc |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/f24569caa5a4f6df25db5fdace3081d4bb349c62/
      i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/9a87306863db3c5f87339716e7c0c357f3e8169d/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/0c6829cf628349c1f35aeb304daae0cad89c5795/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/1e2cac84f0faa9b8915a628260ef41765d86e174/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/d5e07e6b4ea08c1993a3d74778a82204a53d5c7c/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/2f88108c2d57ca1fbc79eaf5b7ae8d410144d549/
       arm |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/ac38d152428ae72772024f1222ace0f37203b122/
     avr32 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/bf04abc9f8172ce8077c87019803acdbd2efb77a/
       sh4 |                      php-5.5.9 | NOK | http://autobuild.buildroot.net/results/c7b5cb3cbcf2aaa4b761b18da07f1a7726e33b87/
       arm |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/8d5be85e089df03abfd5d3858f7fdfc5a2b0ad1e/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/7fbd3bad1261d0e540d5a3330a360a508ff2e931/
       sh4 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/ebcac481363821ce8b31353562223382673bc542/
       arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/5ca917bfe4e0a6cfc914e81f501745be6368784b/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/25202c06d3254cf353ff845978a7ab53853bf227/
       arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/2449bded0a4dc23b8c28be3d1125ae4c2f3a633b/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/07d794530ef165ed93d2eb00b285cb0653200840/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/919ce7a819eaf1619c9ccd2d93ffe57fe4c3bcf4/
       arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/c9ed7cbb57469c2cb83215173b1eabdd8e9b004d/
       arm |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/c470275b9f2d5ca2ddeca3ea074f55a60ea62c4c/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/99df38d95aa98735f76f0e737f081524c04dd342/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/dcb20b084466a9e82a497dc1be282f5b4dba31f1/
   powerpc |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/b137c237ff6df81dd10f7895278d1f2f5d2326de/
     nios2 |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/c9aa7f97600c4dee9a96c93146df1c0ed889d249/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/032a0e97776bf2370268885de95692b857a6e351/
      sh4a |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/39a4aa475dcb5c7b8cf42682081fec8f07042983/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/e4bcce8145bdb56d68b3abdb7c572b7d9f1e8868/


-- 
http://autobuild.buildroot.net
