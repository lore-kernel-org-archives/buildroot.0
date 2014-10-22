From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-21
Message-ID: <20141022063015.D58A1101C0B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-21
===============================

        success : 183
       failures : 225
       timeouts : 2  
          TOTAL : 410

Classification of failures by reason
====================================

                beecrypt-4.2.1 | 57
            ecryptfs-utils-104 | 25
                  avahi-0.6.31 | 21
    host-shared-mime-info-0.90 | 17
                pulseaudio-5.0 | 13
        glib-networking-2.36.2 | 12
   sound-theme-freedesktop-0.7 | 10
                  polkit-0.103 | 9 
                libsoup-2.43.1 | 9 
                libsecret-0.15 | 7 
           libmemcached-1.0.18 | 3 
                    ipset-6.23 | 3 
       xkeyboard-config-2.10.1 | 3 
                 gnuplot-4.6.6 | 2 
               iptables-1.4.21 | 2 
               alsa-lib-1.0.28 | 2 
                  cppcms-1.0.4 | 1 
                 libraw-0.13.4 | 1 
                busybox-1.22.1 | 1 
           modem-manager-1.4.0 | 1 
                 omniorb-4.1.6 | 1 
                libgtk3-3.12.2 | 1 
                 pixman-0.32.6 | 1 
                host-gdb-7.7.1 | 1 
               libcap-ng-0.7.4 | 1 
               aircrack-ng-1.1 | 1 
                    qemu-2.1.2 | 1 
               qt5webkit-5.3.2 | 1 
                   systemd-216 | 1 
make: *** wait: No child pr... | 1 
                    fltk-1.3.2 | 1 
             e2fsprogs-1.42.12 | 1 
                gptfdisk-0.8.6 | 1 
                   duma-2.5.15 | 1 
                   lame-3.99.5 | 1 
zlog-ca6162be1608839e99c638... | 1 
               libiscsi-1.12.0 | 1 
libshairplay-64d59e3087f829... | 1 
                   nginx-1.6.2 | 1 
             subversion-1.7.18 | 1 
         conntrack-tools-1.4.2 | 1 
              wireshark-1.12.1 | 1 
      network-manager-0.9.10.0 | 1 
                      gd-2.1.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               uclibc-0.9.33.2 | 1 
       liblog4c-localtime-v1.0 | 1 
                  libv4l-1.6.0 | 1 

Detail of failures
===================

      xtensa |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/6c38195ed591562dd786af11d30f0546172dc59c/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/fda8772a1249c3b806f5501b60f96e6b4e8b6583/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/8ebf1b6f699ee99189e31868a677e1b00ecad9ba/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/eebe365238dea5c56de4a5e343453a6bdd546297/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/32e0e01b365de831cd5c2cceefc94fc3cfdcf32c/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5649aa2bbd68dead9f29a2a7a7e7eab41e96e098/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5a6ead83410f1a1a2aa57b07b4c574b7899c97bb/
     aarch64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/63cb72aa976e033e8fef409e7f3f54ec47b8bc91/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d98ebb1e96d0f3526c40466a85c49d2c1cfb2e4c/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9d766d04102e371181bdeaef7d14491871815483/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a77725c712fcd0d49d928e58902d6fd0f4956a83/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/5a41f03be3d56263b22d186e94f41cf2f9136bd1/
      mipsel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/17caa881f9a3de4e3299eabf09551470313f2175/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/b9a8ad2118e8d9a0eed658d4036d482638989ba3/
microblazeel |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/2383273e5de44e36385ee09d376bd62d5aa40497/
         sh4 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6120d236adc0a3ca88232d727612d2713ec10b2e/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/dc16b28693db612a5be833232a20ab0e6bed0fdc/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/872acd5256c9e45f096623eb481ecc31cf44bd37/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/4c8746a1f8a5442a8b66562eca3cb5acb48c6473/
        i686 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/8011110bdf210d45d5349638631d210b9dabaf96/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/a833f07b75f22bd1450d563540a4a944e6161749/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e5481269e3f2baa32fa308605bec0ab27181e0aa/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/75b9a6efb9febfc8dc65e21313041113b2bd56ac/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/ca04f8a4dcc34889b01c5fd982dffdb9993c24f2/
     aarch64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/543b7a9ec11ebd96fea2d5d884de5f6da66758e7/
microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/774d6622d44635b2c6a5f14ffdee0fe5851c5fd4/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/072d4a981b2b18605854d147c63e1b20fed8ce35/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/da6c27ddd026088a0bd6a12d687acf365a307e3c/
        sh4a |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/14a1dd9eb48d29715d4ea53882c4be10e06d846a/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d2ba27daeb2ffeecb9f0a07ba8ffff904b74c21d/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/93131de845591b5f2b635219bedc426a0e663010/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c70259b4de32aee973fcf025f000edd8ad961264/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8a0d78c416399b5093b95f6eb94827a54fe20edc/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0a2cdf11c4580a78ad4700701644b335000a29c1/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/245ee4fefef94307b9e3a0caf010c8b4795d4595/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d9025da39935bca2935bfe19021d64a0dd9254ef/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9e960830728ab445c63bb8179f7613d3241dc05f/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/19f9f9ba62c4d63cf46a5a727b6e37459fae5634/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a94fb27ad04668b67710e14c759d85522ed3a61f/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/073a77bb8b24b05d9dfe1edb6213126b4c9577ee/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1c47156ac51cd1f8692c913afed2d58c21d4c70b/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c0a42f7acdb764372099a259a1c138d7edcf900c/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/e067e1a1412acac0c53e3eaed99c72406b797c93/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/908fe1022b3a46a44922ce237904ec2aeb10a6d1/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9e387e8df8091a75f75359a72d71af73154438b8/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/35416b6345e03ff7c295e2c37e66c689e44b6764/
microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/1281081744fa88f465acc9138d2eeb47eee837a4/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2f5569bde52e2cb029d1a32966e9eacdf826334c/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4e670db709f5d7f2da0f84300ed842107c44eda6/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/82ff252f32382b5b477dd166c2b27db48ce6c238/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/316c92addcae782ad81333a6ad0094886de8b527/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a5187a32c9f31d46022c15ea8d838aaa60581ef0/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b27ceb0e61d0a4cc3f80aa76198beb5f7b0f9cd4/
        i486 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d40e3c42a5ef3c24d0e13efed9e83f0db7accfe0/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9cc2578b35c61bd0a198a10e16d4608a7eca95fa/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/3c2c52f325e7d443fc431ac80a61b4cfd7e801eb/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7bc056ad6763ef54fd720fa28562dda6ff397d88/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d8b428eb59cae07ffb03e898a0026fa2d48b0748/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5c48c382b30603c46bfeb858a69ede37d472c7b0/
        sh4a |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/6dc3ec0c8ee8dd9f325655228d8dba6992b61c4a/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/baea1e593fb786e655ad6011c8596d7ffa0f65b5/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/90b2a0ad51df9b208bd421a235137a430a83aceb/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/88a770eb79e9eb838ae4f4c0a7bff89224b19682/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/637e6c0c5cc5d9ae25d3cd260f80a3f6b25b4d77/
         sh4 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/a89786a13fa43973874ef30fdaed6155066d698c/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/d882423ab7b4b47274babf56e357726cf763215e/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cb087206152026e9f90a21fd038a0cf6038854b8/
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/ad77b67d3065ba8633f43a53f3b34c5bc47ebc64/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/95c309e5cdaa9d6d3b4292bdbe16394853f3fcf3/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/33268b205386feaf0d937a11b4c7f16459ece98d/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b83f8fe1e951d045e662d8d656462ae8d6df2031/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/08a78e3546a74fe490a9699a815c72a29eeb8236/
     powerpc |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8948d0fb7d163a60b92ba82d33d6d739353cad32/
      mipsel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4a270f1c1d660bc21d267a62b3843e00a9e15094/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/33ad87c2a6424427b711a9487f815a75f80b791e/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/17ddeb6ef7ebc601551dcd9cf1e262de8d252c17/
        i686 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/aaf823486a5356289559681f0ef0f05eb6ea267f/
      xtensa |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/b52bcc1cd58a7e6771450153eb214c7004f26808/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5809dbd626c5d2a445f674624e61e51d8ae3d9cc/
        bfin |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/2cb67997eace7a541b536bfb2675084803528b29/
      x86_64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0f65120915b9d46f181685e28c07b1287d237902/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/44bbaf59e756942c354c2371ef221dbd4fa8fc00/
         arc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/37395a0de2ea7adeddebe725298b15d6947dded1/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/39fc6f167f50aa2755ea2d64c7226a9e65d385dd/
     powerpc |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/9472d78b890639d3204e1942491f1eae62fb8a36/
     powerpc |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/4cc22332b02f005f5dbd5a6669293498a849c076/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/06e8fa0d526acebe1252e0ef36accc54e08abe7d/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/5fd2de0350e8d8afbf565168efd250d48778303e/
     aarch64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/a08981aa5ce3af3cee42b4008ad1bceccbfad905/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/00c8b1c615653c1f2972bbba2bc1464aa56cc3b9/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/d957dc246ad4430b3208286e7e81e78ce8261e5e/
        sh4a |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/00cbc21b8a25c54ce6bdf0bc5c92f0abbffea823/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/ae035645d5667bd037f83904c95a9db56f2e397c/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/9b237bf6110acfb7045f8f01dc5ce3d482dd77fe/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/79f39ec9118e1106e1cf615d10b61e3d0bcaf4b5/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/41c03fc014b3467d170ac446afdeb82e0131602b/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/07e48671f664c580865d0532ccdce725d7e30666/
    mips64el |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3bfdbbcf962a7777a2ff868a231608b388ba496b/
        i686 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/c8d16aead21cc1d7439a20af09473c46be8d3cbc/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7c268a6d76d247b8b3f51ac52b08633f4151ce54/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/ca70674ac79bd5500c75e399fc56975f89ba42f8/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/81dcfaf5136fb2a7bb2da6022e09536779934519/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/983d4a79b3ef40f99932aa323076b757e92a2714/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/699591f0b2ede5902c591f7eb971abbd3f4a9f4b/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/da6831d45333bb268118d49644f711a949cebe62/
        mips |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/6f1d19066611c7992d82011566ba69d534e5b26f/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/7205834b0db70387f9b37708a5a0bc29b73bc4a6/
      mipsel |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/17e71cad5c3db005f4042818651f7c8ff8970838/
      x86_64 |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/eea8dba439570d3998f7c1aa616020079aeee3f1/
         arm |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/3376fae5fcc77160466cfcd3114edaa527d75686/
     powerpc |             ecryptfs-utils-104 | NOK | http://autobuild.buildroot.net/results/83562d8bd88d09ec706e810644eee724af7d73af/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/8d65b6d9fd586bed52fd2667a9015007e467e9af/
        bfin |                       gd-2.1.0 | NOK | http://autobuild.buildroot.net/results/348de83c913c4604f0125cea14f3d7a195278253/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/37ffd2e72414db78fa9e6930874707adc738a5ef/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/1d107ce6f09163bb8a85be968f53b80b976b8d23/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/93b966b96d4233be37764f08672c792665e141d8/
      xtensa |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/97e9f7de94a0f535d5ae5338f65af85fdb171041/
        mips |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/27b4fe9211fde2a29bbad03a57c662a5f2dbd58f/
      x86_64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/a961832fa76f11cfcbc3097050c34154017f7f3b/
         arm |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/a3d20a44c351048f62f5ff7488235320ef918a68/
     aarch64 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/2a7e37e8473551be01126a3a9eb89ac8e0dd0fe0/
     powerpc |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/2bfae927811395ebca74ce38fc3f45d48c6be7c0/
        i686 |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/d2df961259d2153da19a92986fa40a90a84129dc/
      mipsel |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/8ffaeb6d982f1901c904259290297cb04d44d421/
        sh4a |         glib-networking-2.36.2 | NOK | http://autobuild.buildroot.net/results/d0bd9b8ad06b59f623f31044c5587bbf436c152c/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/8d8cb2f2d5946f5342b96bb0ec4a3c9ffce88024/
         arm |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/0255a7499ef698bb5b3e8ae98284febbe8d98b24/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/8a0e53e4908f79f71410af21aef12ad0dd6ad03b/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/02b985e6eb155478c5cc231a343041c04f02b9dd/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/6900f1802ed39bfd87fe970fb58375373d67cc6d/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/be298f423632618e221ae3dd2e5968ef1ff77584/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/56d87eb07871ffe80ca8b321fb717792851a3cc2/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/ea70887213988455b7ac09825422aa4510416474/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/aaf354d9517f3c35ec0dfc73ffcd91df200a5b8b/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/f2fd6e013144b9edf3652a3f4cb7b57fe94aef09/
      xtensa |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/60c4a2e0bf2aa5aa9a7957df693c2179c6dbc9f9/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/cba016d110ffac9409565798bc736534471a84e8/
      xtensa |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/a654feab99ad780aa9e2cf4e77bb9586f3ca8a50/
        mips |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/8d45b081a163656cfae568bd0bf309ebf594f542/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/c3e89d402494f5f1cc35204b312d4eb945bca002/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/e83ed8d486f0ff87ffde9dec616d15c599802d3e/
         arm |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/845132d73a4d6258d967391f5dfadbe27bd506e9/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/0ddff9bee27c55beaa800b008f0d8c9f70e5b3f4/
         sh4 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/408348f57ab477482851980e2404eac409ceb022/
        i686 |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/be796c3b0afa911087f683003151896533068ad1/
     powerpc |     host-shared-mime-info-0.90 | NOK | http://autobuild.buildroot.net/results/b64d0ccc149356ad00c0c6fcca41f17b60937074/
      x86_64 |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/fa2838d6d1f4de16dc6575267f276e716a42caeb/
     powerpc |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/7429aae6db6cee7fba584af04519c5b56e02f939/
         arm |                     ipset-6.23 | NOK | http://autobuild.buildroot.net/results/a8ba67fe7be42bc838806a0e55e433f6f46a66a1/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/cfc5144fccd5ef8639fdf367fab8cc1a2786380c/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/1daf74416a6a14bbe107f525c4d43dfc642da312/
microblazeel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/5ccb04e43d92db354c07b4fa21ae8f715166bfcd/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3b9587199493ab0405d58bb0a58031cb3e65e21e/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/0c3f1df92481852622445478d2239371fc818f41/
      mipsel |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/7a9caf1f4080c2c4b04ee3b13c1240f475a22ea7/
         arm |        liblog4c-localtime-v1.0 | NOK | http://autobuild.buildroot.net/results/8776c0c5d32fa8dbc2c0e72e3f979e7c5d599680/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d42f35f65ea186ce68b349449d37db849463beec/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/37e632a256095ef0bffc07273bcd77388a3c98c0/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/a21d96113a1014ae0fe01a83442c04b7ad6c4bb2/
      x86_64 |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/dd91d2e88ac8a3f0c097f18ad737de96c4153ebf/
         arm |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/790905b27264ffce1eea68d395e2762c0890eb90/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/f59acc26a14ff67f1e92c936297687eed811fbd6/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/24ed6b04a35bf57a823eaeef6e55f55511422a3b/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/9956aa27ed692e84690f21a768315d1db2cd4142/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/a925c5be5a9a6fb55d6d7891380b66abeaf8ef82/
     powerpc |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/205fc5907abf2684467b8d908e15817da20c6db6/
     aarch64 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/e223c046917aa8f3e7cb89889e52552600466146/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/05065bcf0aab92ba49e915675844ba4e15ea195d/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/2257412b78181ba7e88958e6f34f278eccbc94c3/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/39341924cb80826583211cc2988bd905ede2cc56/
        mips |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/71664c86c48f40ccf5c1a2b930fb8e7d8cae6d38/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/70ff4a4753403bb823590d0ac63c59381eba9aa4/
      xtensa |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/432ce2af1b5c1f18f0a6297dfc8fce8d023c693c/
    mips64el |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/a85a1471f0e1c12667b8879bcd944a6eff42bce2/
microblazeel |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/50a09d40c89ed44b863e95ee25435edee5c14e1f/
     powerpc |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/4a4105493126e0ecafe652092074e372a2eeea3b/
         arm |                 libsoup-2.43.1 | NOK | http://autobuild.buildroot.net/results/14e9474d810222ddf7ec7b58834f8ba8971fd81d/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/448c1c5c43320c0d350afea0d4ec72427e74ffe9/
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/db48d0d8ea992f3338d63aec70f71368e4f7af32/
        sh4a |            modem-manager-1.4.0 | NOK | http://autobuild.buildroot.net/results/c2e720000530355cf9ac225cf5d03ebf638b8c81/
     aarch64 |       network-manager-0.9.10.0 | NOK | http://autobuild.buildroot.net/results/67452c253c04df12f9fc835d3febbdd9bc876c16/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/49e79221fe937f35f3dfc369ef8c2c27e2254d44/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/6ebb9a55e751611878778c5776fbb614b6ebbc3d/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/7721016c0c9f61d0debb3041b7340bb34a929c86/
      mipsel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/07fe003973433e26d861393fd99fd1b96d6ee1cf/
microblazeel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/67573c9392b515f3524b0a7a9042506ce6b61df0/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/847bad2b09aaa76a34d63b366074d17d4317e346/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/24a813a85d3529e77c9e9758018a3672a0f7e72e/
      mipsel |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/84407ec58c26d4c1421b8acf1c05818aded7acf0/
     powerpc |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/5e7d31d6d70360b7de04853aef7e4155bc80b79c/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/f10946ca6cba8a5dcd7e616ea2cb25c66fc861bf/
      x86_64 |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/0484737bcaf2b488402d049276d50ae59aad0047/
         arm |                   polkit-0.103 | NOK | http://autobuild.buildroot.net/results/6bf4ec6abe726b2a424e16da1df42e450d6587eb/
       nios2 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/88e5fca6acafc18d2525762ef92c69a28c5b3d6a/
      x86_64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/ae8a99531109eec0ca64f591da53a38e899e8cc9/
     aarch64 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/87f857b068ac0f08453cd308410c57962f11e115/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/56650c656a3888d262777a4a7b4cace1998d64ea/
      mipsel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/003342d77ae05fb83de336e3320b8502a6f4cc57/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/81c07b43585bb5ad8e023259c683761aa1394b7e/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/22750144531441c244679e998cece36ad14a8096/
        i686 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/2e18593d5faa9fe249400cd4d009f216e54dc355/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/11e652cc2f114446a9180ded59ba7146a4a09fb5/
      mipsel |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/f81631f364b5657f03bb8c62388ae6e9305b06ec/
       nios2 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/a602712932fcb34047d62ab6ed62cffabac57865/
     powerpc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/a29f4cfbfa85d3d545bd60149a465ef9e69f7c7b/
         arm |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/557f4d8b1722b57febd7fda26ea3e36e2a2a3a8c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f1e97a602c0aa46e7e1677ab912d4f433dd5b969/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/cbda27de868069f34e144094fba0f6048137255a/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/104ac4e792e6116ee710576a6b32cea269c36217/
    mips64el |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/3cad82c377b6832d380867d08a3d1ab4865e6c05/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/79a596896022f9a0aed69e42700f973100303239/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/63559ad15176f7ca6d63a005ec7c2e501b9ee9ab/
    mips64el |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/e46875f757136ed0d4a842328826dfb223e48359/
     aarch64 |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/f228fc04560c70582c5d67559c0e22ec230c10f5/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/87a970539b6f9ace1c08e53c340192168cd4e817/
     powerpc |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/b033a6891a3f05f66b01c6e27804d98919958e18/
         arm |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/151ebbee99b6e5e8840d11753a679e60be0c71b5/
        bfin |    sound-theme-freedesktop-0.7 | NOK | http://autobuild.buildroot.net/results/25fb4d98ab029f1eb4a49430684534716599aab8/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/d6e82852a1bc0503b7e30aba1c4dcaf6d5c08353/
     powerpc |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/135771ca071800d90056679e301fbf3e7fdbde60/
         arm |                uclibc-0.9.33.2 | NOK | http://autobuild.buildroot.net/results/36c48e60299b362899b97d163b7cc3860df51500/
         arm |               wireshark-1.12.1 | TIM | http://autobuild.buildroot.net/results/1b3bece86e5d119c2c62f62fe7548f79a9b61016/
         arm |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/16e3e3a5f64f17780890f9aba4c0b0885aa18b6d/
        mips |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/10b26369c01cba6ee848f44c760b514d49e0fea2/
      x86_64 |        xkeyboard-config-2.10.1 | NOK | http://autobuild.buildroot.net/results/25e06b1b04405662badf8ad08174ff1b1a0e0126/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/93ca33a56c87651b4742133b452f35cee444a4b8/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/bfc7902525d2e5254963748b8d79ad1a85121d46/


-- 
http://autobuild.buildroot.net
