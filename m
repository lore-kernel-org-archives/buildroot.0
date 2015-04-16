From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-15
Message-ID: <20150416063020.9D46C1016FF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-15
===============================

        success : 174
       failures : 47 
       timeouts : 3  
          TOTAL : 224

Classification of failures by reason
====================================

           libfreeimage-3.17.0 | 7 
                  dhcpcd-6.7.1 | 3 
                libtirpc-0.2.4 | 3 
         lua-periphery-1.0.4-1 | 2 
                ipmiutil-2.9.5 | 2 
                     vlc-2.2.0 | 2 
               qt5webkit-5.4.1 | 2 
                  boost-1.57.0 | 2 
freerdp-770c67d340d5f0a7b48... | 2 
                   ncftp-3.2.5 | 1 
                   libiio-v0.3 | 1 
             sofia-sip-1.12.11 | 1 
                  ffmpeg-2.6.2 | 1 
           python-django-1.7.3 | 1 
               libsigsegv-2.10 | 1 
               libecore-1.7.10 | 1 
                elfutils-0.161 | 1 
                 glibmm-2.36.1 | 1 
               expedite-1.7.10 | 1 
               dvdrw-tools-7.1 | 1 
       gst-plugins-bad-0.10.23 | 1 
checking for inttypes.h... ... | 1 
              lbreakout2-2.6.4 | 1 
                    qpdf-5.1.2 | 1 
                  fbterm-1.7.0 | 1 
                host-ola-0.9.4 | 1 
                xcb-proto-1.11 | 1 
                 leveldb-v1.18 | 1 
                   atftp-0.7.1 | 1 
                      qt-4.8.6 | 1 
                numactl-2.0.10 | 1 
               ipmitool-1.8.14 | 1 
                poppler-0.32.0 | 1 
               harfbuzz-0.9.40 | 1 

Detail of failures
===================

         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/b7f205ea2066788ea78a1a819f1b592e84e2455e/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/226c722ec5c95a891fce46de9435ed5092528b7a/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c1e6ec873e173dfd401ab42b0e1cd5a2837f89ad/
         arm | checking for inttypes.h... ... | TIM | http://autobuild.buildroot.net/results/11fad76e8f0a4f4ce93f7759292ad939cafacc14/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/1ea18b4ab6412ba0bc25649dbd2eee97b5106441/
     aarch64 |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/0e15f71d6992b68df57baa69b034b4001aca7a21/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/65932f8d7e1826a445384ee8a23b3081978acc46/
        sh4a |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/03be24979d3ec4b08ebc7841ce1e2bcb05d26f97/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/11524a58445a8ccf0477ac49d1f6505562a8ea12/
      x86_64 |                expedite-1.7.10 | NOK | http://autobuild.buildroot.net/results/5d6e37a5aa968264a3e5e2e12bab3e9b2c23e94a/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d59a755bc01593524e23816ddf00a1b2b5e90ed0/
        bfin |                   ffmpeg-2.6.2 | NOK | http://autobuild.buildroot.net/results/d13488a43f6e034623104a36c07114db99325b8d/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/d0d4aee21e0690ad191fbce0789443dd8120487f/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/607a8ec79f15fde5bf98d6db25b9a428cdae81eb/
      xtensa |                  glibmm-2.36.1 | NOK | http://autobuild.buildroot.net/results/6df1a6ebb0f4ec93fbf3a386943984322f2ac8c4/
    mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/57631560ee5b5feb00692b82e7593469ec03ef95/
     powerpc |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/21641e8092ccd6fa1c675d6602af42c94f6d1bbd/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/5cf46a9cfe4813345a158d5b99ab9cbcac20e346/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/537bd0b46073b5091c87e9f0c0fe4d958facc864/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/14d60a53b2b3b4726b24747264966698544a4be5/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/63b235af66bdae04780a610bdbaca0905161f184/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/b63cf07a8c540a1a60b9d36ad634a3ed10b038c6/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/0445bcd2d1a12ec9016bdcebd04941a2b1c518b8/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/a25098701fbd8fa3eea518c9e96a7c253e3a64d8/
        bfin |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/ddaa278828be1f50198189009b0708baf858d294/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/70c545cc8b70b6a943cc6267044ccf488993adae/
        i486 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c9be5cb61890b4d9cf956dbb8a61a355cfaeae45/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/23cb93b620371356071269d1d80ef6a1a8ca620e/
        i486 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/532b1d957df0bd2445b5a93e02c411b312d5674d/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f52dd2939984cd7a6926b8ad6d5be13dcf3afae8/
        i686 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/43adba32d8688cc07c90a1628a489812edda0aef/
         arc |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/4cf7435dceb3672d2d32be152a0a3a45c49a898b/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/e2c33cde8789c2ec3839d1f8bbbf24cb82985c61/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/036a18866bca2eb13a0f641df2fe464a3670bc87/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/61754fe3377b202abb00e5a98f5a2bc4cacaea26/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a0ae1c0f8029a527a4d8879aec7b140e7243e404/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4752d20144fce467036993efaf69a9fd239edf5b/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/a7209d29a6e4c8f4b13ae3b71a140c60d8b974a4/
     powerpc |                    ncftp-3.2.5 | TIM | http://autobuild.buildroot.net/results/3d7af213b71c6188b435229ad443f56d8f1a74ba/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/e4578313376db2d5be9b302a2e357b71586e22bc/
        bfin |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/7c9077e767b6a0afa125692e44fab0f7ab35b0b6/
        i686 |            python-django-1.7.3 | TIM | http://autobuild.buildroot.net/results/a1b29e1427121815b8d2ac28b8880ff525a2cfd8/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/38cb33ab7b2b35a365b4629cacca1f5b32d6ec82/
         sh4 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/54891a4d8400ce33ed38fec12e6f3eba1b5487a4/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/cfccfba35e10e8bf0c0869bd6b5b3ebd5e938ff4/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/a92d88831e91ca079c461bd2710910196e1781d6/
      mipsel |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/4ff5ab6c4c09f72e3afe95f8a4ea5ea10ac3e70d/
        mips |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/048a9918d8122c1aab1209e45ed1668c89eda926/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/8277df357e36e05078e4eb217a0fb7f5ea805794/
         arm |                 xcb-proto-1.11 | NOK | http://autobuild.buildroot.net/results/36313300716fe7d6a24e6f0ecc75e3f04a947b82/


-- 
http://autobuild.buildroot.net
