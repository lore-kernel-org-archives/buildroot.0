From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 May 2017 08:28:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-30
Message-ID: <20170501062807.78D76207F9@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-30
================================

      successes : 203
       failures : 71 
       timeouts : 0  
          TOTAL : 274

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 25
                busybox-1.26.2 | 3 
                  libcdio-0.94 | 3 
                 libqmi-1.18.0 | 3 
                    mpv-0.25.0 | 3 
                 x11vnc-0.9.14 | 3 
               acpica-20170303 | 2 
                libepoxy-1.4.1 | 2 
          libsquish-legal-info | 2 
                 xenomai-3.0.4 | 2 
           aircrack-ng-1.2-rc4 | 1 
                  arp-scan-1.9 | 1 
             bluez_utils-4.101 | 1 
                      bmon-4.0 | 1 
                  cppcms-1.0.5 | 1 
                 efibootmgr-14 | 1 
expedite-0529ce56b6fb01e965... | 1 
             lttng-tools-2.9.4 | 1 
                    mpir-3.0.0 | 1 
                 mplayer-1.3.0 | 1 
                  ntp-4.2.8p10 | 1 
           oracle-mysql-5.1.73 | 1 
                protobuf-3.2.0 | 1 
         python-netaddr-0.7.19 | 1 
                    qemu-2.8.0 | 1 
                      qt-4.8.7 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
rpi-userland-f0642e3b58d8a1... | 1 
                  samba4-4.5.8 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2017.03 | 1 
x264-97eaef2ab82a46d13ea5e0... | 1 


Detail of failures
===================

         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/853cac2ba5204ffed8bc367dd5a2f5f480b9282e |     
         arm |                acpica-20170303 | NOK | http://autobuild.buildroot.net/results/41cc8232e2b0b08191713552fd94f62c415c7b02 |     
microblazeel |            aircrack-ng-1.2-rc4 | NOK | http://autobuild.buildroot.net/results/9b1cba480102746389e80b58c0e327b68a235a29 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/5a0f857f7e56a7003ac4d196f374fb8abcfff9fc |     
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6401c6c632cc482906223460b2c16f35d23edc44 |     
         arm |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/c9562b1f175c837ac7f0d7ce6509f69df9a45e89 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6b3851f0280ffd638214a286b8e580577a87728a | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/1256e2bab6ed90858b75bf11ba6f5e4916804d46 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/df57ae648406c0c18ea4cf41877b09aa6a752cee | ORPH
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/6ba42e1f0495ab1807fe445cb0e972bab723e289 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/181853cb74129c3ab26410dc73dd5adc9266f78a |     
        i686 | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/e4a75f8935a10a352606a69656a830a89782905f |     
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/84cc77f96de28336a3c0bce1a41f89df8198fff0 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6c3bbf78b29db959bf6f644b7fb6baa48c74beaf | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/64e25b7ba45ece9fbd4254eac57db2d240133d1d | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/53908fe11b5b6497205e17c151f02e94fab10999 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b5dec8c9dcde2de6d1b16e5854b234890098ff43 | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/02db0883259ce78b535932f10d813e1e0c89bd55 | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3a85504666d5c838263b25db39304b96b77cd24d | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7b8dec6bd0aa6094fdf60a5954ac9e7e21f42fbc | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5097b2cf8162c9da4fc78ba1774d382eac66ed3f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5f660763199b629d082adc6a8e7df3145886420e | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d01248bd219699cfb7c2656eb074f94689e34ef5 | ORPH
        bfin |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a13face37cd75d27b0ea46bb3d46f266dde085c3 | ORPH
         sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d87e54d947fa34e4a4a254426d93f994e15b9b62 | ORPH
        bfin |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d7de28f7e1494000b981aacf3cd81081ab87544a | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ed21038e8c38e362b5d0854ab2c16c5114124c7d | ORPH
         arc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/eca7cf6967e6ef4c15f17892086eafec5b77c08a | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/890c624d3a61d61cd10e9475472152be7f1b45e4 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/14c733d983472fef886c8d8becc29b421a3c3f11 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7ca25170edae67c0021084ee8c13f506bbff43ea | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/31600ee9cef28c71b903bcc34a8f4ce0d4f3a897 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8f8a9b30f902dc7611b8cc50201f52a53597023b | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/ed71493e45eb56f8fdb84e1bf386f0f45677303f | ORPH
        m68k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b16dcf77fc2919e28beb045de6bce5aa3d195fce | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0193120a803863f44cf7f600c007a4f752e8c92c | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2bf8f79a5a376f1fed900b660b620f9327bfaf93 | ORPH
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/abeff7796ea26f20951f2857e5356e7e50a0cd19 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/5af4413e36188808b8a5e9bb1e30fc0eecf3541d |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/a3e9f62fb713e204d526345f1473ddf70a6e9a25 |     
     powerpc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/9eb7be14658f236cc051a523880a0a9581197d19 |     
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/6332d3d937bcaf076cfdd21e1effd8e6dfff52e1 |     
        i586 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/05105cbbc7fdb3e59b1bc96fa53c5e4b9a899d44 | ORPH
        i586 |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/c268fe7b1ba1b45995ef99cd8cc757bc58d81140 | ORPH
         arm |                  libqmi-1.18.0 | NOK | http://autobuild.buildroot.net/results/eef5c72069d78a3baa583bf3720752a7808b6c86 | ORPH
         arc |           libsquish-legal-info | NOK | http://autobuild.buildroot.net/results/bc01c4912c64361d7c89c46514431f45a532b819 |     
    mips64el |           libsquish-legal-info | NOK | http://autobuild.buildroot.net/results/c7e29e5bcbcb4db740d54a0ccc90fabe8a1442a3 |     
      x86_64 |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/4099249cf4141bcbd726c402e4a0d1ca5f2483e9 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c45dd59f10693b0d9a86dac4733c6c3dde4554f1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e66b9d30c2e4e26929811d13a04fac291bcf9e2e |     
        or1k |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/05c2c664429ce2689081c4169cd9cd1b91261e8f |     
     aarch64 |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8d69a392838302ff7ac7a0fd13951ab8a0debe47 |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/1180dd49ecbe2eb7fdcab9331f86ad4205a851d1 |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/d893f639c57d296fcac81e0318cbedba4558e5dd | ORPH
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/cfa46b06eeca7a39de299c38b4aeb4faf3ad802f | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/15da44c37d07071768550e62b7802f212a973f78 | ORPH
         arm |          python-netaddr-0.7.19 | NOK | http://autobuild.buildroot.net/results/e9b0013abe7e866fd224593f90ec30bdc809151f |     
         arm |                     qemu-2.8.0 | NOK | http://autobuild.buildroot.net/results/4ec526a8d5024b4d9b4a131b3fe1dec85fbf44d2 |     
        or1k |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/58d3cfc71873439b9582c93d050d35a6bce088c0 | ORPH
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/f94469b09f58083cfe3c326b4223e68b90dfa096 | ORPH
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/7d82f909f84025c1238d2787d3fb341588fd67f4 |     
     aarch64 | rpi-userland-f0642e3b58d8a1... | NOK | http://autobuild.buildroot.net/results/ba633a8f34f2960d25d0fe309e3005911fccd5c6 |     
         arc |                   samba4-4.5.8 | NOK | http://autobuild.buildroot.net/results/4838e60be0a7eb610a69fea5dd94a15b46471bf6 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4fa05e38efc2da98735befb6d2a9275a208d39ed | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/92b6e049ad952c20498f697aff4f50274b38997c | ORPH
         arm |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/e62decaf38b44306ab5e0c66bc3033c9de91a6cd |     
       nios2 |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/8087b08a5ebbcf537b2d168690f92f970231f47a |     
    mips64el |                  x11vnc-0.9.14 | NOK | http://autobuild.buildroot.net/results/a7794e189006dfe0afcfafc3d64a2f44349e98d4 |     
         arm | x264-97eaef2ab82a46d13ea5e0... | NOK | http://autobuild.buildroot.net/results/5e51bd16910f69ff10e6de1ff01e4d486da45dfe |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/8eb4643faed523ffccd421f20c2955adfde634a6 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c195a97da944ce979f6a811b143a5caf7ce5a603 |     

-- 
http://autobuild.buildroot.net
