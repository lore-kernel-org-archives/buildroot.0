From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 05 May 2019 06:00:42 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-04
Message-ID: <20190505060048.5CD2C874CF@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  26 |   2 |   0 |  28 |
      master | 237 |  66 |   3 | 306 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 8 
                cracklib-2.9.7 | 6 
                     vlc-3.0.6 | 6 
                suricata-4.1.3 | 5 
      gst1-plugins-good-1.14.4 | 4 
              qt5enginio-1.6.3 | 4 
  vdr-plugin-vnsiserver-v1.8.0 | 4 
                   bullet-2.88 | 3 
           host-cryptopp-8.1.0 | 3 
                   netsurf-3.8 | 3 
          wpebackend-fdo-1.0.1 | 2 
                   dvblast-3.4 | 1 
                     gdb-8.1.1 | 1 
                  grpc-v1.18.0 | 1 
   host-xapp_mkfontscale-1.1.3 | 1 
               libsigsegv-2.12 | 1 
                  linuxptp-2.0 | 1 
                 mesa3d-19.0.3 | 1 
                   mpd-0.20.23 | 1 
                       netsurf | 1 
                          opus | 1 
                    postgresql | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
                 qt5base-5.6.3 | 1 
             qt5wayland-5.12.2 | 1 
               qt5webkit-5.9.1 | 1 
                  rpm-4.14.2.1 | 1 
              spandsp-20180108 | 1 
              webkitgtk-2.22.7 | 1 
                  weston-6.0.0 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/e2f91fa7af0cb61478cfc3e097f581df7a69260e |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/9366b663ed072b5f7d98971ba3deeef51faa0a48 |     
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/0bb53d9ed49816be644cd0065fd57ed41705c3e6 |     
     powerpc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/e69a8724b8ac9f89f2e1b95edbf814d0c053404b |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/6d927085cd8ff26d34cbe57178506d514027474d |     
      mipsel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/311fff09a16a7e851a90c956123c0ff518b28976 |     
       sparc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/460f364b17cfcfc295dba269c3dd60befcaeadcb |     
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/ccb14b2f73d749baef5650cb4ea11f7798481788 |     
         arm |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/8f14be22e6a6d5e71ccecf55c657fed1c2dc059d |     
microblazeel |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3b90243609b743287e93f6127babd54b86bfd69e | ORPH
     riscv64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6d61f782c241a2c28dde481e72011ba103984f1d | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bb13487ce5825dd9b502abf0501663b16e40bbf7 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/458ff8bf1f0f6aa464078b04784b6945de9772b5 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fee15d26efd7a99660186bf340fe2bd60cef3c95 | ORPH
  aarch64_be |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7b7aa0f08081c30971ff96c50a2978f93d36412e | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ace7730b53b4d9add6d2937fca29d69d59ab3e8f | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7665c6fd806375133f023e1adaf92ae5bf462608 | ORPH
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/4a020ed87b8339b8bfd56008f98f35c21b69278b |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/0ba11c49ebf6d3a0d6f7167bda762f95a09d0ca6 | ORPH
      x86_64 |                   grpc-v1.18.0 | NOK | http://autobuild.buildroot.net/results/54c594e0c6f5b5424fed1570e84f26cc5cd04772 |     
   powerpc64 |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/0648f0d935c891501ff783d604dc4ce8f0c58327 |     
    mips64el |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/6049dc05c947ef6c6fe10933294ef26199d0fbb6 |     
      mipsel |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/a4143c72a99784f61cf78ff896026250c4dfec49 |     
         arm |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/74b05f972a51c2930364ff1a3033487100ac2e69 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/3a571bfcb4c971ba1dce8641486daca9f929fdd3 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/8ccc4dfc3b4433b105be19d1a6fb7f289f108429 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/8edabd0d7e41805346e7ad8a7b6b0ec903bd0217 |     
   powerpc64 |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/a4ddd5a4a7f976ef09bf05b98a6128c567e1f574 |     
     nds32le |                libsigsegv-2.12 | NOK | http://autobuild.buildroot.net/results/8777ab1aee4358233e3fbbe435b67975c1d3c175 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/067aaeeb99cc05aa489c8e7123ef8b459ec35cd6 |     
         sh4 |                  mesa3d-19.0.3 | NOK | http://autobuild.buildroot.net/results/1a6e5cc70ac7f029493222415be094ec46c7e381 |     
         sh4 |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/dd1f7d3d8e781ff991f88b319e939a7a72fb2b4f |     
     aarch64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/5e0e233c57622e309aab364ca282edc581ea0ddd |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a12be254b4e75fd095a81335478ffad39766ad84 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/db54d31e7500932f6db73a8d097e48682157b5a6 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/59ca80367f51b838965650b5f9b72883a66ca216 |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/f05104b6b0f5088eb9127c0d17fde6379efb992d |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/9205ee46246b0549a592dedbe15086773fb16f41 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/124cf606fda9c893a9a8f6bcc4eb6bbd287687ba |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5d9237a36574a05c60fae421e89c9d8dce755947 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/14104e6c7277ca0fefd3bbc4027453397fca2c8e |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/6cc80f47d2a9f80114c2b0ccf234d05c74da837b |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/329281ff879c142bc2fe65571ed2fe46f6a3e88a |     
     sparc64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/4972d0b1c0b6db769082ac8325ee138e8cd2b50f |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a6dd8299d37ae7cb1c03203972bce570d6542951 |     
     aarch64 |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/7d1f09bd3b0b3b68840e046694b13890104d6324 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/ace726db1873a5d48639afcf5f34e2520b157c5d |     
     powerpc |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/d54815a7f233bcd888e83aef507fa60428443502 |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/8c1070fb1986fb7f4d8e023d3c85bc2a6605da0f |     
        or1k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/743fcbbfb3e35534372e3f57b8f0fa0e750c5019 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/82f3f27d43688f8a9dd5f99d27ab200b5e0dfac0 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/b5fdf31db6897a9612a0badc7c4bd3e54f031308 |     
       sparc |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/8e3d35d972b30e36bed233faeefb23c935e2af74 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/ca26ebeff56dfd9ad4581d458856ac8722146bec |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/7725a444ed13c245ba148458373faa848d267c88 |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/b0459beb3d196fd6b7a3c85fca8e76273d568e9c |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ef3f2f0336952b83b316c6e810f8abc3e331dc35 |     
   powerpc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/90a7ea2ce09b338d06ef720c04fc7b4502e6dccb |     
     powerpc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/acfd5030ed6ffd287da8bb7333b962504f3f2fca |     
         arm |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/4d51b9fc20101f45fb4d8b8668ed6fecc9633703 |     
     riscv64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/44b400fb66d21d7a9d3912e7d93927d3a31666e6 |     
    mips64el |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/47e981ced6b8f1aa8a7f2a32e4b2fd3b0f2da2d4 |     
  aarch64_be |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/e50313f58399c33522431f167f20bdba16335769 |     
      x86_64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/b97ea04cdb03a272c63ff3a00463f087e898539b |     
      mipsel |               webkitgtk-2.22.7 | NOK | http://autobuild.buildroot.net/results/9aacf48df056f7499d708d0e76616c186c688a41 |     
         arm |                   weston-6.0.0 | NOK | http://autobuild.buildroot.net/results/9d36f812d6b2b5ac481c420ca574cb8ff948287d |     
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/17f93ba5caf9cc49363a4a78357f71aeb414bf0e | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/f89d87126b5c502db6782fb2c391c6f682e0445d |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/a31a22fd4dbf13bdc84691c201d46d6eba0c1fb6 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                   mpd-0.20.23 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/15698fa48414c83fa12d6e17792101774cd1cdd0 | ORPH
         arm |                    mpd-0.20.23 | NOK | http://autobuild.buildroot.net/results/a2f3254bdc3109b37fc36dedc7dadcaae3f59fbe |     


-- 
http://autobuild.buildroot.net
