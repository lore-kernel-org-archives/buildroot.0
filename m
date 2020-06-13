From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Jun 2020 06:25:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-12
Message-ID: <20200613062607.AA40720448@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-12
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 18  |  4  |  0  | 22  |
  2020.05.x  | 23  |  5  |  0  | 28  |
    master   | 135 | 118 |  0  | 253 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               linux-pam-1.4.0 | 65
              host-grpc-1.25.0 | 10
                       unknown | 5 
                    mraa-2.1.0 | 4 
                qt5base-5.15.0 | 4 
          libhttpserver-0.18.0 | 3 
             freeswitch-1.10.3 | 2 
          gstreamer1-mm-1.10.0 | 2 
           host-nodejs-12.18.0 | 2 
                   libnss-3.52 | 2 
                  ndisc6-1.0.4 | 2 
                wayland-1.18.0 | 2 
                  assimp-5.0.1 | 1 
                 gnutls-3.6.13 | 1 
       gst1-plugins-bad-1.16.2 | 1 
                host-gdb-8.2.1 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
               log4cplus-2.0.5 | 1 
                    mpv-0.29.1 | 1 
                 opencv3-3.4.9 | 1 
               pulseview-0.4.1 | 1 
                     qwt-6.1.4 | 1 
                 ripgrep-0.8.1 | 1 
                suricata-4.1.8 | 1 
                thermald-1.9.1 | 1 
                      tio-1.32 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/77d320ea19e91b160a8e526ac862bb3240d494f4 |     
  aarch64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/1cffdf62b876c36e18848bb83ff6f856e4f099d3 |     
   x86_64    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/95d01129ec5a5bfc6c6ad152267a8f50d369ab9e |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/5eaf24b6d15a818205610771630444b53f267c11 |     
    arm      |    gst1-plugins-bad-1.16.2     | NOK | http://autobuild.buildroot.net/results/55166043ae14654d9470b59b97255af1cba44147 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ecb4292f409e862cb72ea6ef1fc1cbfeaf3c5839 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/9cabffa8aed79ee44cadceb99e27d0c041f96f41 |     
    arm      |         host-gdb-8.2.1         | NOK | http://autobuild.buildroot.net/results/cf3cce34a5457d57af7a1f256dcb0ff9b903fae9 | ORPH
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/f36c687a8f18c7bd31ebd34a47d2736d71eaa77e |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bcb03ae43e55a7381c25edb9a46136aa18711816 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4e649ef7ed3b28a851528857646c50404537501c |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9d819f829b5b5253b34f50c2fc4021c1d86f5583 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/364c8fef452e3b50efd8f33bee9bf3b60603bbff |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0fb30da696fe6111312d350f41e0db8acf41a8aa |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/514b0bc1946577fbeedf9f8f582714efd2b9a00c |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5468fc331c6ca29d6d22a288bfe7228c7b7be34b |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5b6278ddcc5ea4675bea0cb804899aefdf819a0f |     
    i686     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/62d68bb5465065467db9c5e302192f0c00f2a1ed |     
    arm      |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/0bc5f021a63faf0ced68758ab6e5bc4943ca6272 |     
   mipsel    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/e569152f4a3f1c5c0c2f045e7d9371ce4694e49d |     
  aarch64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/14b5782d777a439c2ad58dcfa5e344638b71f2a7 | ORPH
   x86_64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/08b7cf760e18908b54d15bcc1d46546742bbdf0b |     
    arm      |      libhttpserver-0.18.0      | NOK | http://autobuild.buildroot.net/results/d515c22154c103624210a31756a3b92b84c3f915 |     
    arm      |      libhttpserver-0.18.0      | NOK | http://autobuild.buildroot.net/results/18a29056e0191d9f23e1f9c6f72b13c07d03b300 |     
    arm      |      libhttpserver-0.18.0      | NOK | http://autobuild.buildroot.net/results/145652ff26b96f69d8296201053c6eff4cabd084 |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/56c3e4c7a46447dead584f9bc4f19a2dbc4bd9aa |     
 powerpc64   |          libnss-3.52           | NOK | http://autobuild.buildroot.net/results/b64718aa75dbaf6cf8801238e5ef796b0bd43f21 |     
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7f449ddbbf77ca0ad084236862fc8bfbcf6590e1 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/abd74de39208a6682a74499b7e057c3d25dfe461 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0d4aac80d63d5b4953ea76124659fc8d362a0ac1 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/efada163b2ad6402617c5935de33077f6dc2788c | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d8a98072408acb084289a4f7b4875b20df999b42 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a9c0469ea0c1fb073fc46e30e3ed6ace3e8b69db | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/507fd94d9f65ac24077682b77c691efc0e6a515b | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/090c6512f492650a53149e10bca00edfba304279 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/bbe7cb477cdac521f5471b8ffe7d3c07626e16e0 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0be44870e321ac3730e464c391d7afe71f4b76e2 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4e1e2909c0e9134749bb10d6af09ff51600a3849 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0ccf2d67be2842c822ef9853f600da201cb60882 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f4e55ef3e96c3e467bccb012b9cc61a6fda13c92 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e03b9637e770a72ed38db760fe8b86325eaeb66c | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/de67e3dbbbb514229982896f99b45793f61427be | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ad11ab255e5f12743aa92f475dd47e0977e14178 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4051b5fe3180dbfa6bee6c23b973bbc375345c37 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/685fb3c26c83404dfcc3a68c5461cc39470134ab | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/dc4f93d8b21f7794c33c796071c56ab83699d0ec | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/cf92c07ae6063000b42109d955d6e14861683c19 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/1341d7021d813277a8a4cc0b434cb613d95cba73 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/25767604c4888fdfded51b6c4b724bf6150ba612 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f305e2346bf0b7ca9cc759467ff97c088dcc869c | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/93d67fbe89e030f58f3ce1e96269c3323b7899d5 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/5877d28e69560c4eca81c2bc19cce1fa82e3663b | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/be7e6102b869548390253a77312b5a48a5fd2fbd | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3bf839f3151ce759bbe1add8ba4ad19158c6c583 | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/622dc45f54f08c44056060e3ca320c3da1c598e2 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/227d50151dfed7a744754e0835fee651c16076e2 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ff3196767d371390bbf982c8f0c9751e2c93e03f | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ba5a56a6812f1fdf23ca4ab87764adb071a03a1d | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/87dfad3c5f064ae253ce919d114b76f9f78239ba | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/402c9bada905e63831c513d57f4583cd85943ce0 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/8430a4f370a042df996ec9b24d47ecf7ffb98140 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f2b49e8c740d518f79cbea94e43c143f54306c29 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/56c1fa829f51743595c2cdeb8476311e7e6c9af6 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/91576a88dc0806f44894bcb5bb9b160140a62e76 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0777bcac64ae95f9135f0ff2a05aa7d1432c1f15 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/67b18d484051f4eb05fec53fb95a7a26d6499e8e | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d42ed913600f3874d8afa416f73599041623ac00 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/778d4d08a13d1c8345344a43459c1f8f92baf31b | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/96dfbea1cb229a9fca2a33bfc2ad0d257bcbd26a | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ced01627e34184f16b5bbfdc33d5fb087a4c5f63 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/75560fc82e3d1a22044d6903b7e8e9cf2595fb7b | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/98f11c10992240e35c3dad25e2e11f6385c30235 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4f4bc5a9862917d19334daf1b2e3877228ee3657 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a42c3918732d647a41efecf781b7916c1f6645d1 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f6070638dc57f61b180161c188199ef1b3a85cfc | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/54f6c8e08fee59dd060163f0a7973cf91d13dbb3 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/90ee697b8c4edc692fa87a161d1912a6e48765fc | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/6066869c79406d3b20831e29c8825b0ba830350e | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/383c2b51b97efed38e7e887465aacfb18e40ae3a | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/5db2f21744bce980a0e0b5dd08a24f0a8075630c | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3e9ba770b42ae04efa8a93265fbbc03857f8749e | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/5b8cc0b63e516173595e8ecb3fffa299b0020bb8 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ca9d3e672fdf00fe96ae69590632655565db0af3 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d86d832c411afbcf9dbea157d9729f52951a67b7 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2cd2eefe572bb02bb113c46af38aa8cef4e06920 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e709841270191cb2928d665948d0d18b5f8d189e | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/109747cff72d6cb4aa2c921141b3b26f7fec07a4 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/1e6b798f1948e62170b9d8277b1ad6c89b3960c0 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/639f44763067c59d0cdb8b76565bfd09e364520c | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/79107b3bd35a2f5872f51bd3907d89dc73c84df0 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d89e3c286ffd6bd0eef8e327859ecc43f10ef547 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/fc791cb96705d624476dd89cf97ff189583e1291 | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/e3d47e58d4a616f1ad519f8f39b6044aa774eeae |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0f5f352f9feebe542beb56d548036a1062099126 |     
    i686     |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/45c37dd851b10068cc4c72ae76410c9edf14d8d9 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/31086422e03611c16ab59c4418e3669b580bc0c0 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/75ba0840da6eb4907847ef05adeec2df109c9937 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/eff54a4d73e6f73d516038f354a2ac1be64af8bc |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/049987080b0d5295b324746712395830f90380c5 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/2cd71b724a19f1fa6f0fd7ee3dcdc3f9bedcb9de | ORPH
    mips     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/fa08731cf7a4e5b5e59751edf2417ab485b61b7a |     
   nios2     |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/9061485d5a44fd0339ae254f0ea3d886719156d8 |     
  mips64el   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/5437321f1261b3572746e5ce371029543bfce41f |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0a2353175e2f4f855145f149f03956fd8ccd19c0 |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/bc2c1e58db3133e2c0d36fa91a65e781291d1522 |     
 powerpc64   |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/e996f56c1577fa32c641dd7132853be04ea53884 |     
    mips     |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/3b69d420b187a31eae4d25d91eb9b743c2b26cae | ORPH
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/63457d01902bd7a9b6f08360bacd6d88d8ccabfa |     
    m68k     |         suricata-4.1.8         | NOK | http://autobuild.buildroot.net/results/0df350c293cb3829995bd649cc0371e112edb1dc |     
   x86_64    |         thermald-1.9.1         | NOK | http://autobuild.buildroot.net/results/6688146e0df290e2a08515024e87a48f44202bcb |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/599927c803916aa70c51b26dbcf48c8a1c6344b4 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/f594277fc00393de982ff4da0f2b0e484a381828 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/e17979bda3751a2b847eaffd3531c90fb0d8db76 |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/a1a0ef922abf4f10e1641310bba9ba1ce2f30c97 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/4794574df1dcf60dc3291e3f8bb885a61af12ac9 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/eacd68f9c1138e67e9bf1ac6c55b1fe73f1dc222 |     
microblazeel |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/95a1bdb3bd95bd838d900e0c7f812873bf3251f3 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/9c5df8d3fb72960ce2506b59d87c2ade87c1b84d |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-19.3.4 | 2 
                  cairo-1.16.0 | 1 
               libupnpp-0.17.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/945acc7d3a60313c4eef3d66bd721496c6e9fb69 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/d6a8d64b3e872452a1dd08de112cde91ed29eb7a |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/fcb9e1648e82b6938eec2c1560fe83ae979f5802 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/74ea10ca35f4842904f305182cc39dc15fe42a01 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                coreutils-8.32 | 1 
              host-grpc-1.25.0 | 1 
                  ndisc6-1.0.4 | 1 
                qt5base-5.14.2 | 1 
                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/02bf81cb063ff0b5196729c4e9a05e48b6db02be | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/ae4ab3dd6c56ba44bda1e9655486d8054e7808cb |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/209beb478d990f48f9dadeafdc03b318069b34dc | ORPH
  aarch64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/7edf607ca554b6603a87d05b36363aba0b578b36 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/d1ee4a87f64dc460160cefd177d1aa2d53f8dda6 |     



-- 
http://autobuild.buildroot.net
