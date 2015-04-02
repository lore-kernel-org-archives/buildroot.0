From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  2 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-01
Message-ID: <20150402063022.70E68100844@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-01
===============================

        success : 215
       failures : 80 
       timeouts : 4  
          TOTAL : 299

Classification of failures by reason
====================================

                  boost-1.57.0 | 11
                     vlc-2.1.6 | 7 
                collectd-5.4.2 | 5 
                host-gdb-7.8.2 | 3 
freerdp-b21ff842ef3de583751... | 3 
                libtirpc-0.2.4 | 3 
               libecore-1.7.10 | 3 
                  powertop-2.7 | 3 
      libva-intel-driver-1.5.1 | 3 
                   strace-4.10 | 2 
                 jsoncpp-1.6.0 | 2 
         lua-periphery-1.0.4-1 | 2 
                     mc-4.8.14 | 2 
                elfutils-0.161 | 2 
                  fbterm-1.7.0 | 2 
softether-64fd19e6f849247e3... | 2 
               mongrel2-v1.9.1 | 1 
                   ncurses-5.9 | 1 
            host-heimdal-1.5.3 | 1 
         network-manager-1.0.0 | 1 
              quagga-0.99.24.1 | 1 
                     eudev-3.0 | 1 
                host-ola-0.9.4 | 1 
                  bcusdk-0.0.5 | 1 
                     gdb-7.8.2 | 1 
                 libxml2-2.9.2 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                     at-3.1.13 | 1 
                  snmppp-3.3.4 | 1 
           libmemcached-1.0.18 | 1 
                 libssh2-1.5.0 | 1 
     xproto_recordproto-1.14.2 | 1 
pulseview-19be0af16af83ca10... | 1 
               host-ruby-2.2.1 | 1 
               host-qemu-2.1.2 | 1 
              libarchive-3.1.2 | 1 
                libupnpp-0.8.6 | 1 
                   perl-5.20.2 | 1 
                xapp_xfs-1.1.4 | 1 
             bluez_utils-4.101 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                    gpm-1.20.7 | 1 
          sane-backends-1.0.22 | 1 
              postgresql-9.4.1 | 1 
                 clapack-3.2.1 | 1 

Detail of failures
===================

         arm |                      at-3.1.13 | NOK | http://autobuild.buildroot.net/results/628b0efa191756905690eef0f6c336f7f398720e/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/f391ea6d4f08ee46f4b6a913ba798cffb3bf6d66/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/59f4bac2612c9013245b1734bd4b2eca56d73949/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4fd72c23b63c91446b4748050919d0ae7fbba114/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c571e5192ce025958d20fc6fd0faf20085b1844b/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c2c609b77b89d03fca7e29eb1388a210c725ea78/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cebb50dc706da2c927c81bdc7cc3dbfe5918f738/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1bad6ebe517ad471eef10fe492d3afac6be044b1/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/1cd1f6f513caf09daaf125e707b502cb57e75174/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c579976230530875eb3bda3d1b8e921552ed3744/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/65dbfb1a00835114d1bf12e202872fa00f6cebb3/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/2025758794545dd1f7077428326b6f7fe8d44609/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/648ef72de2add0352bc48b2b77f6c46d1489c893/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9d243109fc016087507d816ce4f95f15c6759e5d/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/751859f6a11243b562ec300877c30f994940bf8d/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/533ff94302b3f145b7eca7ce31e7225f3c025d8f/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/4dae5125b420bea55746b0ac8569097c51ef8760/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/25298c594084693b0ecb6de33f95b0142f507dd4/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/962b08d5adebb250c0a835e8237ef06987ebfc34/
     powerpc |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/b976049113a917c4e81d02a63671075b43f08de2/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/4c041cdae1998023861fc104b28ae4421f61a938/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/5752a2e433dbd4ad6c660d5161594151ddf2bb1c/
     powerpc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/065fdef50b1dd57b95ad2b5eda9904a1d0787cdc/
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/98eecb877e0fceb807da5f7521561c0a63f34027/
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/9e21e75592553c0abc867a4ae8282f4c866b6082/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/f8af68507102bf06337b5042069b9d1f592bd0a1/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/71c6633f2fb02fcfdd1868c0c3cf8b0b39598019/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/0372fd9db00b366fff6f9ac6fb584ce86223c748/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/91bf8cb20976e2a2f01272e9c4d035402e55147f/
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/b2e48faf40e5d76154ab5e1c671c1d6dfc3d1d42/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/4cb097d0360520ee81c617698c3aff044eb23a13/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/d81d2436036ac10687111a0f30de94c1b3e4cddd/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9da3961e09908b5ba27a0309bef43ecce68a5db8/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/0bbbef44af1ab13de0bb41c03f8f612f4a6f9624/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/221b0b7b6397361730f4e41a41415875c973539a/
     powerpc |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/a91e72a1a4400c6c6b1c3ea10c7fb2a2290b3ec8/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/2b21e6254ccfdf21d33f9f29241a441075057b34/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f40f10cad6b5d5a16d76b365910d5bdbe019da17/
        mips |                host-ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/5ba3cbc9036acdf0672e3f5ed5ec83bd7200b702/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/acdaa4e5cfbabdce78709e46b19cc84cd7e0e52c/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/448745830f58496e6dcdf48e2ad57650b4744909/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e67fbf31b23565a6e6197f12ed8d8a1bbd1924b7/
        i686 |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/eba262d77dc687bc5b7c2b0fab91f148eca88a18/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/ab674d751fab9e37eb18fcbb3de17bfd93f756c6/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/783d36dce099934bdbad8b9a2217a318acad58a5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/599c21457822e1aa354dab541f46dc377403db3e/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/557aaacf11d93b3fc3a08fb7d58719bc9bdd6d60/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5ee5ac59d0bc2171209b315dc9e8722bdf4a72cc/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e348694b071dec51f34ae19a8c2e82f95de5d8b5/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a2d1c261a16c799f92400a7fb91f6f821591aad2/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/3cbd1b6e95854c422c7102ef9854c2023241620e/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/b40078529d1ef929ca8ffa9c55c100cc801e1b59/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/cdbb796310dd7994db5e462b5be9bceb2034e14d/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/4eb023882ede270812e759fef27c63a0a3a18577/
         arm |                  libxml2-2.9.2 | NOK | http://autobuild.buildroot.net/results/8d68678fce6ab6713e282658ca641a2204942fd2/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4e33a2466e236053b218e664ad3d08e7682eb845/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/8334c063706764f109e4fd37df17ec120c7cd95d/
    mips64el |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/b7a2b69c53e91e0173b7f0c241d7e06b4382c52a/
microblazeel |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/805675236190f7f5f42d498f4a9f9bf0e1bab648/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/ad8dfb3de34fe4b8b540552788effc148a236583/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/934e138647cbf91bd5a5bc109f5215f0af8d3115/
         sh4 |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/b83a1110ee16cbcdaa71acc8d900a1fc8a8d3890/
         arm |                    perl-5.20.2 | TIM | http://autobuild.buildroot.net/results/ca04df36e4372e75196e044f4c5d3df65674ef01/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/0ddde04fc40e048ea799f6883e20b63856b84208/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bae39dd3908ad4bab0fca9e56e518aecd11bb158/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/ba67844e538f2ac85caab9f0296cbd1ef6c6aa8d/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/bd0b9397c13faeb87aee5a3e0d0549592062690c/
        i686 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/51b6440d98d24e977b5afa1ad6487285ac4c273f/
        mips |               quagga-0.99.24.1 | TIM | http://autobuild.buildroot.net/results/e1198ae348fe9c6924b6b292d11580af45ed56e5/
      x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b89f901676af77f5e65421c63d3c720b9cd8f02e/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/27b269569b4870456ba4eccb1bb9fc3123ebb3ad/
         arc | softether-64fd19e6f849247e3... | NOK | http://autobuild.buildroot.net/results/19992951da34a703a476dc62ea92e12927c8a02d/
         arc | softether-64fd19e6f849247e3... | NOK | http://autobuild.buildroot.net/results/fa77579aa6502ef1d84976d355637513f38c39c9/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/fc2727068319e496243b8e781e7923fbd0a9b66b/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/5c8e8d42229ca6c7a7575758c2b848a45d6a2014/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/63fb30a527f2557567b5f88ba9e38909c76d9486/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/049a857c5d6ee3cc50b1d1d449d7c489d714deb4/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/6350f7a2b275e60c4d8572d7304633b4e3f415ec/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/baf19933287f5c875b4f367b9bc251b4775f7ea8/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/a9cd35686a1871ed0483280511d4672d3c63b3f7/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/9f1e3b0cf0d461654e97bcd262b4348ee2db975c/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/6701d757b61ff5cb26eaaf8f78d78fcb715002b9/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/488b0d0cfe4ba587f8a0ce10c78dfd8ac1f6c044/
      x86_64 |      xproto_recordproto-1.14.2 | TIM | http://autobuild.buildroot.net/results/d9647da1ee964c54d91f620e9b97c036ecbd84d2/


-- 
http://autobuild.buildroot.net
