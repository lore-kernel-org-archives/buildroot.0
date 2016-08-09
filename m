From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Aug 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-08
Message-ID: <20160809063032.89898101A55@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-08
===============================

        success : 247
       failures : 77 
       timeouts : 1  
          TOTAL : 325

Classification of failures by reason
====================================

                    mpv-0.18.1 | 3 
                   dante-1.4.1 | 3 
openblas-f04af36ad0e85b64f1... | 3 
                  connman-1.33 | 3 
              lirc-tools-0.9.4 | 2 
                  cairo-1.14.6 | 2 
                pinentry-0.9.4 | 2 
                 gadgetfs-test | 2 
               netplug-1.2.9.2 | 2 
           linux-zigbee-v0.3.1 | 2 
              squeezelite-v1.8 | 2 
                  snmppp-3.3.5 | 2 
                 rpcbind-0.2.3 | 2 
                    lftp-4.7.3 | 2 
                 jack2-v1.9.10 | 2 
                     tftpd-5.2 | 1 
                  thrift-0.9.2 | 1 
                 clapack-3.2.1 | 1 
                  aespipe-2.4c | 1 
                  lshw-B.02.18 | 1 
                wayland-1.11.0 | 1 
               libepoxy-v1.3.1 | 1 
                     php-7.0.9 | 1 
                   systemd-231 | 1 
                  trinity-v1.6 | 1 
make[1]: *** Waiting for un... | 1 
               gst1-imx-0.12.2 | 1 
                     mtd-1.5.2 | 1 
                 weston-1.11.0 | 1 
host-gcc-final-arc-2016.09-... | 1 
                  babeld-1.7.1 | 1 
               tinycbor-v0.3.1 | 1 
                acpitool-0.5.1 | 1 
                     vlc-2.2.4 | 1 
               libsigsegv-2.10 | 1 
               host-efl-1.17.2 | 1 
                 tcpdump-4.8.0 | 1 
                flickcurl-1.26 | 1 
                 lvm2-2.02.162 | 1 
                  ffmpeg-2.8.7 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
               openipmi-2.0.21 | 1 
             libxmlrpc-1.25.30 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
             libsidplay2-2.1.1 | 1 
android-tools-4.2.2+git2013... | 1 
              libarchive-3.2.1 | 1 
                   fwup-v0.8.0 | 1 
                   mpd-0.19.17 | 1 
                    owfs-3.1p1 | 1 
             ntfs-3g-2016.2.22 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                alsa-lib-1.1.2 | 1 
               qt5base-5.6.1-1 | 1 
            supertuxkart-0.9.2 | 1 
kmsxx-a706f157b86e906968080... | 1 
                  stella-4.7.2 | 1 
               openswan-2.6.46 | 1 
                   ntp-4.2.8p8 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/0818dfa5d339424bdf7192634bed7e133c065f70/
         arc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/b8dc85b990472ec0e205cedc1aa0eee424b63e4f/
        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/b0af78629db06c3693c8bbf8ec3aedfea606b1f9/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/3b56943afccc03e5920e941325f3e60824bb95a2/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/a36fa8415507551dd4cf8503754655d2504fd330/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/19af091fc6b8c496b1ee5bcbe6c075eb369c230c/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/722a4fc268657620b805fdbeb0c62131df117d3d/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/ba10714bd28e1dc21d4df2be030e2cef37846d6b/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/71177f73c16f3fcb0500f6cc04690a85e32bf73c/
      x86_64 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/1dc914af4db2c894d521af2bc9f7d77e88f0c38d/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/72537d66f78a0bf354436766cdc39c644c6e74b6/
       nios2 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4bc5501b792a3e14754796d279f61b75cebe83a0/
         arc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/ed51aa9c5559607f7df58dbc16bffd696779c0ed/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/313370bf05efe7fd87c281a97ecb6e06531a87ed/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ef579863ac7a4fb94827bfb7aeefdc5625b16676/
        m68k |                 flickcurl-1.26 | NOK | http://autobuild.buildroot.net/results/c18eeb955a69b5a621eef5574df397f8de60d187/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/42f74ea254d5b3c1a2bca89913e805323bdf020b/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/2a935b7bcede2a12afdb836b7bc91a513825f39c/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/fe0c97ee07354f831199f8d58e06e7bddccaba29/
         arm |                gst1-imx-0.12.2 | NOK | http://autobuild.buildroot.net/results/b460a770c8f4e992d29dde8fe37fc23a949937f2/
         arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/89bf12f8333d47af0cb5775c859e26f300af56cc/
         arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/55592cb7c04687f3b73fae865bc5d745f1688f31/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/c3f724afbf79434864be7901dadaf6d848edefea/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3f5f885d5ccf84d634d9d483ff35a7757996cec4/
         arm |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b8570a3e597384fd48e50b000ee760ad12945fa9/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/461415e9b8de7ae4d8fcc2d11c6384be665b1f4e/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1f005c46b927fbeeffb11d843c2c3f18308bb5b9/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/fa48dfa0034dd75588132f342bfd44a87d440c93/
    mips64el |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/77a9365c1f6cc205ed11d614b331a6a809aef55d/
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/01b7088a06e7310c8773e78e8be4f6e88da67357/
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/afbb24414340307617e88f26d1e82be672baf317/
         arm |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/4f57a7a37da0ce6d14a368272d982b4874a54927/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b1e40b3ec64cd98b535d83e89e5780c46680e095/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/832a9feb9561eae1239689a36c57bd0065f98e0d/
        i586 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5d56f998b5c5ab9e06cf048e6ec95b8671989cef/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/15033e9cdb1ecb23c0228c306236aca64c01303c/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8db62509f77906b3bad5b2d58c2c02f95edf104/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/8545b910fe16e9fec038d2609a2071346b6cdb79/
      x86_64 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/576eccb104ff23e60bfa9d15ce5bf8cab064a64f/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/c32851d3497b296904793c7d9af20cc8eb655a27/
         arc | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/1f049e02d1f2f9e1b6ce85ed8bcf6c59976e8c17/
      mipsel |                    mpd-0.19.17 | NOK | http://autobuild.buildroot.net/results/3605750023267e4cd35d98451bd283f9e70a6106/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/f607eed9a48c4ca00db43f9d2652e615b4bd7c93/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/8e9c05b03e59b9b4d0b7b587e6ddc864acca28b1/
       sparc |                     mpv-0.18.1 | NOK | http://autobuild.buildroot.net/results/422c5eb3fac8c68e45c7087af8e0b06d25898f2e/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/edfd56d95e1338ff0ec20ad92d740f4fd77aaecc/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/ad1ee46fa0250e005eb9b1b30427e1db81f04264/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/7912ec10153e158e1671dbcd8b530aff9c31cbde/
      x86_64 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/a4387751d8b17ef0ef86ae04bdd4f4e13c13978d/
        bfin |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/3df650e7a513f46cc948f350863414f43b5e3a89/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bb51df385961d9f489e7a4f582cee8662e715897/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/88362649ac5cd71918092a511a10f460535abb3e/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/3047169caf157796854b9095d8ec1b9abd104260/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/fc4084f8d1ff3fe98066c7cc051c2127bbe77ec5/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6b73c1d1bfd4b2f9db8c4b92747bcc2cd6f30a9e/
        bfin |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b3529e5661c55c53074d85cb6bde28cb51b913ca/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/885f418cc26c6832a8a9abf703aecbeea8fbe550/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/f73a28583d56a29a419f4f861135dd7548e88e3b/
      x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3dd54c594ee0521a10a057094e342500b4657cea/
     sparc64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/bc4ceb53fff7b3f78e544c8fbeb7b549b7881dba/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/2285b15f0c89ecf7c37876987a24d30a96cc2c67/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/176adc06dff2393ec32630bb2bb354fbff06eab1/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a1888998291b08bd32f8c968572620748921017a/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/3c755158e94865312b42384f2a152f30b4a28c7d/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/2a27e11ac01d4a9de01fb684b1f28c07c7fe6830/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/095642dd43a708bb3283ab6150c016344df3f84d/
         arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/5deb954dbaa436c335ebe873e53ac03685e83e1e/
     sparc64 |             supertuxkart-0.9.2 | NOK | http://autobuild.buildroot.net/results/7ae73f52589693a082a85967d77fc03a86f172bd/
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/3bba46b91e6c2a2c5a8c7e0739ccf0b3d8efadff/
        m68k |                  tcpdump-4.8.0 | NOK | http://autobuild.buildroot.net/results/5001ae7dc469bb5aa496c437b0abef1be16790dd/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/3117e3f39cd0b72a9a5d177091e9bbbd3e631363/
        m68k |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/d1bf2e6b371582b055bd8c54231b7aa279623890/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/a7832452be23f53883890c64c0374fc132660b89/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/643f7dd974b2f132e940ea0716a38bcb5a46f024/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0e1707dda4474437160df5d8c290362ba7287be5/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7a2b71d0bb4684a400ca47235ed51e17ce9c12ba/
        i586 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/10d49fc0b87f3543bef9dd0125e6c28681332662/
       nios2 |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/


-- 
http://autobuild.buildroot.net
