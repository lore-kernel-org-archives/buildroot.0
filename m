From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 03 May 2019 06:00:26 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-05-02
Message-ID: <20190503060032.099C888289@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-05-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  42 |   1 |   0 |  43 |
      master | 241 |  46 |   2 | 289 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 10
                   netsurf-3.8 | 5 
      gst1-plugins-good-1.14.4 | 4 
              qt5enginio-1.6.3 | 4 
          wpebackend-fdo-1.0.1 | 3 
                  libssh-0.8.7 | 2 
                qt5base-5.12.2 | 2 
          qt5multimedia-5.12.2 | 2 
                     vlc-3.0.6 | 2 
                chocolate-doom | 1 
                cracklib-2.9.7 | 1 
           host-cryptopp-8.1.0 | 1 
                host-libsodium | 1 
             keepalived-2.0.15 | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                 mesa3d-19.0.3 | 1 
                  monkey-1.6.9 | 1 
                mono-5.20.1.27 | 1 
rtc-tools-33ef4aa1c92b0c92a... | 1 
              spandsp-20180108 | 1 
                suricata-4.1.3 | 1 
  vdr-plugin-vnsiserver-v1.8.0 | 1 
               wireshark-3.0.1 | 1 


Detail of failures
------------------

microblazeel |                 chocolate-doom | TIM | http://autobuild.buildroot.net/results/8e62614d018af1c4e5e15d1eec37e2821075055c |     
         sh4 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/87926aad8188db73ef6cecbf87c485e81f7e37f3 |     
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/697f85dbb161afaf0c4590e27cf43472009a43f5 | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/aa1b58d349d6fb184dc631dc25d57c52f5ceec42 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6f8c74d8a2340672ee0768ad24db8cac66fbff76 | ORPH
 powerpc64le |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/fd4b1e2f60bad72c8248ffabc3b09f6f1f7164db | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/92d073ca0700e215e360b510ce4730d52792f180 | ORPH
     aarch64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7b17aeca5eed8682b770c4c4c075d2205f36fa50 | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/42d7f0683534bdb57e24e0360b62665f270684ef | ORPH
         sh4 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/dcc45583c809e44e62ddf938ee059cbbd9bcd35f | ORPH
      xtensa |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2cd4ff531614d7ad9d93170385fd66380d567033 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/e617ef59ca488ae139ecd421711f270eedd47093 | ORPH
        or1k |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/166eefb3037b7a1999bc7444aacf33b8c44eba28 |     
      mipsel |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/5839fe1f6717b70f33d3dcc2d248b09a9772d83e |     
         arc |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/9fe4358e1cdf948932d2489ff0f4c7690b7af94c |     
     powerpc |       gst1-plugins-good-1.14.4 | NOK | http://autobuild.buildroot.net/results/f4567c9aaa0d006c634fe0a5eb0206d53a3dc2f8 |     
         arm |            host-cryptopp-8.1.0 | NOK | http://autobuild.buildroot.net/results/660b67bbfdb79374a537e51e6c75e7ac719df933 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/f19b8c9f177b680818423a2ba8cad2122f45ff17 |     
         arc |              keepalived-2.0.15 | NOK | http://autobuild.buildroot.net/results/e1a350cef3b16a8bccbf92712f1a24f8df19783c |     
       sparc |         kf5-kcoreaddons-5.47.0 | NOK | http://autobuild.buildroot.net/results/d17c2fb420e395b995b2c2eef387f0c66e89c96c |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/aa5b9c6a87c7cec0017e84c9e250ce08dd2265b3 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/2ea083d59c161463dbcfc4e5e6ae2c33daed7fd3 |     
         sh4 |                  mesa3d-19.0.3 | NOK | http://autobuild.buildroot.net/results/8f1c80070746b3b172d3386ec6e2645e25a2451b |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/36246d69441891e8c61dcb2b86fa0bc0ca23c925 |     
         arm |                 mono-5.20.1.27 | NOK | http://autobuild.buildroot.net/results/5002110aa796d1d29c4ca438fc43086374a7b233 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/dfd17d8bc5582cc7b136cbb1877b57a53e07f0a8 |     
        i586 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a8d202891c2041fc9052b0f60b49d3f58d17c8dd |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0337790700b7c1c377602b4d0e851a3be9883556 |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/13fff50c6dd80892d946d9be30bdd976acef63bd |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/4c031f17cc9a582897bbda4280ad9b84e2ff030e |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/22e8c34a99bf90dfd17c90448813e5dadad31499 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/e0ac6f8ce944193c6eaa42e64786042c3229bba1 |     
        mips |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/1d527dbe0f12613f1f301605cf79f1d0a1b2f3a0 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/9b9b7f60ae239dbd9cbd6809cc9728847900dfac |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/3eeefee05a82c32033f9d3dfa741a81bce2f58e4 |     
     riscv64 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a073249b0ed5319ea968576a6ef3858e4a3b2e27 |     
     riscv32 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/4b7a49a5f524b4a5621832800056c221e38bfb9a |     
     riscv32 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/21e174db0f99fd06f4b80516fcb4b6051c691901 |     
     nds32le | rtc-tools-33ef4aa1c92b0c92a... | NOK | http://autobuild.buildroot.net/results/96c3be922a96c50fbd8e68059f9ced8a2a75f9ab |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/26df9f2a2250926a1b0bd0340a50e69ede3ad8b0 |     
         arm |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/c3c43d5f220ed9e0587a0c8275252605f3a1afc3 |     
      mipsel |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/f79a423cdd2527e21861c65bc8320152263cea9b |     
    mips64el |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/766b776a3244f505ab6bf1cab12d11dd16afa282 |     
         arm |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/68f2f11a3a74818b233f6d28833b25cee9c7f9ca |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/cfbb48b3804eadbd7e1c0ccced6e26875053c6d0 | ORPH
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/859102e20be07c21725f28b9dbd9a95c5e0e66fe |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/d3795d287391a8d8d0e1f30f726833926091c8f4 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/b25309481ed34252dc8e4fe89ee6667ad29e1783 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  grpc-v1.16.1 | 1 


Detail of failures
------------------

      x86_64 |                   grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/30456a479ff80b1325d7e9e55a31a01f7295fa9d |     


-- 
http://autobuild.buildroot.net
