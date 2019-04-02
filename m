From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 02 Apr 2019 06:00:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-01
Message-ID: <20190402060042.D8DC584778@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  28 |   2 |   0 |  30 |
      master | 213 | 184 |   2 | 399 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            host-vim-v8.1.0133 | 41
       gettext-tiny-legal-info | 26
         alljoyn-tcl-16.04.00a | 22
             alljoyn-16.04.00a | 19
                  rygel-0.36.2 | 17
                benejson-0.9.7 | 7 
package/gettext-tiny/gettex... | 6 
             dbus-python-1.2.8 | 4 
                  ffmpeg-4.1.2 | 4 
                host-go-1.12.1 | 4 
                   netsnmp-5.8 | 4 
                   netsurf-3.8 | 4 
                  rpm-4.14.2.1 | 3 
          wpebackend-fdo-1.0.1 | 3 
           bayer2rgb-neon-v0.4 | 2 
             netsniff-ng-0.6.5 | 2 
  vdr-plugin-vnsiserver-v1.5.2 | 2 
                   botan-2.8.0 | 1 
                     gdb-8.1.1 | 1 
                  gqrx-v2.11.4 | 1 
                host-libsodium | 1 
                  linuxptp-2.0 | 1 
                   mimic-1.1.0 | 1 
               mono-5.14.0.177 | 1 
                 openmpi-4.0.0 | 1 
                    postgresql | 1 
               pulseview-0.4.1 | 1 
                 python3-3.7.2 | 1 
                qt5base-5.12.2 | 1 
                 qt5base-5.6.3 | 1 
              qt5enginio-1.6.3 | 1 
          qt5multimedia-5.12.2 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/c3dbdc344a9bfb56b8c3c93c4d050b807f303d35 |     
microblazeel |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/de31be0f14a710e99b1745751d8c8b2274fbb9e1 |     
        mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/0449a56405b90f70c80683c241c49793f60c1806 |     
         arc |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/109da9e1acb0f97ef94ae795dacc8a9f285be6ba |     
       nios2 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/60f62eb8094fe9c85d30c01b9a54aa06b86d3edb |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/7214f5170a0b4238db8e280c7b55600140ece348 |     
        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/4da0bd2b50ecb67750876fe8e7e523a81ee1b760 |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/6b05fd3b65ef15eb6f552a7158b9644be185d42d |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/d4e05b1f79cc90ee43f716dc9e602a3f3c6f83e9 |     
     aarch64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/cc8bbbea125fbbf010820bfca694daeacd8c7147 |     
        m68k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/852185eba661411fe28eec6232bb88e32016a4b7 |     
         arc |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8d028c34184fb20510fb7a455301af916c04eda8 |     
        m68k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/702178994174fe3893c9becc69612821d5af0117 |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/7e5b009515c8c0e90b765a5be4b79666916b4487 |     
        mips |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/8afdcebb6a287c74fa20d64d1b25eeb44b40e5dd |     
      mipsel |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/5aa59f0b37aa0a5bed6f4b093b6cc88b01d56fc3 |     
      x86_64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/910eba774a4673f86a7565cb7937941b5bb29773 |     
   powerpc64 |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/3a689a3891c8df505e1ca5af3cce510c21219dae |     
        m68k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/26e9d235785bdd8faff503914ac68aa11e9a0810 |     
         arc |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/8852251dc5fcf033537b21aa3dfd3ff5535a1fdd |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/693c321287207fd266a88fee2bf3ec663b7278b4 |     
     sparc64 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/c86cf5e92e6373eea41b74cb192adb84e4bd78e7 |     
     aarch64 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/38e0cd22c34745421794e27c583d4f1602ba065c |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/c2435f53fd22a19c8d03d956f2ef01264a570428 |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/f84e8911785c331718ed58b17cc6baeb9a9163c6 |     
      mipsel |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/7922b77988b5ca82a3fde019a3de75e87022388b |     
      xtensa |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/cd1f40ab7d8954d29ea7a4768a5d887543a8798b |     
      mipsel |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/9ef4588f4f1f1ab2058450e46c460ade6498c119 |     
    mips64el |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/f5b75dd68fb701717505d0974192c8e917a79303 |     
        i586 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/03b390d554b3ce14a81411b24c9c028419f78cda |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/8bfe2be3a7ac11f43a67c5e43097c35c29b1f5f2 |     
microblazeel |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/8065a90d3a820a1d45f4ed6a4d8c2ac254135452 |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/2c73748cc5de33a400b55f07c3c3ab7113593e1a |     
        i686 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/bd948939bae56ab03124fb47ac23bfa408468372 |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/c21ba16b02d878d08722d37d32a069e8ab7aafb2 |     
        i586 |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/e4b8cf4cb9a40cffe8787a9683ae0fdc222c8694 |     
         arm |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/b36151a72ea6306364077a2154d70bdb5de342a4 |     
microblazeel |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/f15a43f08e271c9040cfb9eb81c6b520689308fe |     
         arc |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/4c4514bfb406fb6fe199ba82bc0eb5c182bc89de |     
 powerpc64le |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/c870857bcb1b5ce8f67f281380157677e9efd177 |     
         arc |          alljoyn-tcl-16.04.00a | NOK | http://autobuild.buildroot.net/results/d66f8711003c845ca827bf94cf0a7c25b6283bf0 |     
         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/1ec6d1b2d5ce9cb9602bc318c54003ced5916cce |     
         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/b2fa6434af060c8ce904abd3dc3725c3b67bb08e |     
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/0bcafcc61090ae39c63797b6cd008d33f734a4ec |     
      x86_64 |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/92b4a8582b333c5d6c0a8b5015bdafe5e28bd51f |     
      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/5b81480069f3adb2d722bba6dc60871cead6a4dc |     
      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/f4989e01f219451b62c27e3bb07561b03a0292c3 |     
     aarch64 |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/6cce7c622c78252678a34dabfd72039c0d0dd9c7 |     
     aarch64 |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/90fa96b9c778bb4894cd636a58ec9de267181a94 |     
  aarch64_be |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/9659ea5f78aca6e98019140ee26a1825fab4d9fe |     
       sparc |                    botan-2.8.0 | NOK | http://autobuild.buildroot.net/results/9db39b209a0f4be1e09b7e4ddb5e9a63da4fbbfa |     
     sparc64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/cef1b421fe7de95f0a2b9a493fbe28d5046716dc | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/99ee84e81ee9a84ee0db91a0f7d59baf6dbb3f57 | ORPH
    mips64el |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/d264fae033323acd5748874546161f6146fb5732 | ORPH
 powerpc64le |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b3dff115248b5752965c38af3de04846ecada30e | ORPH
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/88bbc2bc27a7a368dbb9f8696a05c56ba7843e28 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/54aa416c473a94ff2099ab9aa6ed06f62058590f |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/1f70bd5e70045506e82d47ef56732b999b1666ae |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/2c3cfeca51f369f7984f55d070394c6be65c76f7 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/93ba711f57ce52640fda1353125526791a651283 | ORPH
     powerpc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/ca76c45eae4be29c9cd8a172ac1e1e4684620ed1 |     
      xtensa |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/7615922786b801fce50ec8f546b5dc01124a41e1 |     
      xtensa |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/b47a150da695309ee4f68ba303e73b98acafa510 |     
        i586 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/0acb1a9cf4b20310aff998a9b1292970c8b0fec4 |     
     powerpc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/3a5cc3220c8fac8420e39b84843fd5de564c442c |     
     aarch64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/747d548200b637aef5e3bdac4d095f77bf3f9f12 |     
         arm |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/886f65fbdfa260e5547b6b4e44943481cd71bc7f |     
         arm |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/ac033e1162250a79ec3f2f5971f2caa14f28009b |     
         arc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/817a122c15a1de41427810ecabfbbda33b7f8335 |     
         arc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/283649cfdd90ec2a0942ffc92c52594a551c37ce |     
    mips64el |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/3a4e78b8dde48bf2befd32e79c705125e8db40b3 |     
         arm |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/6d278d53be5ed386341394b255ab18c3540d52f3 |     
        i586 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/6e528d5114cff81c50434936c7ed1424be1a029c |     
   powerpc64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/091829a7b79d83c6a134e487dad9f1fa5ff95d53 |     
    mips64el |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/bb6d25f6c26fc9ff5514c6dc317b9d88b08ea64e |     
    mips64el |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/cda3420a04ef4769fbdb2e722744cfb2a3a94fa7 |     
     sparc64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/4b94ba9f48a4ad2ee77e5ae0f2f6553e39feff0a |     
       sparc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/e44f2fc74f9c5ab4be83acd00c7bf59952b0f5b9 |     
       nios2 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/690abeaa260ae7e7ebe1ddbb8f86e88c2b4b1eb4 |     
      x86_64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/cf3b524d80bf4ca06d4f5cda9e4c2b660db206df |     
        m68k |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/c54317f25221cc6fa4950f980d5129948806f423 |     
     powerpc |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/3e70de82ac5cb1b74ba1e93e33827fde9e4c4edd |     
     riscv32 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/e484fb68b188471c654069a05636134ecc883707 |     
    mips64el |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/236fb59298c37070f71eaee22102e1b333f78971 |     
      x86_64 |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/9cae15532fe7003b108a06b912b4c69d8ca25cd3 |     
         arm |        gettext-tiny-legal-info | NOK | http://autobuild.buildroot.net/results/efaf57ff9947c53a75f773381c9f1120bdb9ad5f |     
 powerpc64le |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/01b7cad67b54e555bc763340df8c97a1b06dccbb |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/1a95eaca9ad38be63795394073c09fe011aaa051 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/c6f18c2966c5f8acdb7120bf954b8a0660ebd893 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/1889628b95655c3d87cd676a1fe273fdb77abe10 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/0b58c130768ea5e0d1303a7123156362446e804d |     
        m68k |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/d6cb12690f8d1483ac9632d367dafa7b4bbf0c60 |     
        or1k |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/d09dbd529fae98ae43730aec1cf2369456f7d681 | ORPH
    mips64el |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/def81b7a1f13a2924af58c8462b833ce7b1d19cc | ORPH
       sparc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/8589343e87783840cd257da6587a94dec1d3ec6f | ORPH
      xtensa |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/893f534e5840bbefd528a26c6fd23fc643a5b8a5 | ORPH
      mipsel |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/c49e53967a7521f07a4f91b19508fed3144c4ef4 | ORPH
 powerpc64le |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/7b02117172384c8c76de806dcc9d29857e4c0d06 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/89ea22a3b8fb43b395a0e92e1beed96ff47b7778 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/4837350d53481dda0a9b2a70c3d7223a24c132e6 | ORPH
    mips64el |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/49481994930e81e074f2e1d5536620c47ef7201b | ORPH
         sh4 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/402b7d9a636165fd78556fcf3de7bf25af012785 | ORPH
 powerpc64le |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/3b116b80a18ac5b78103e1117ea95625eb9e7f3c | ORPH
      mipsel |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/a264eb291a586851a1e1368e273c76de749951ff | ORPH
        i686 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/142dc9d5571eeb2893c4aea80c800d917030aa93 | ORPH
   powerpc64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/b205a472d2f5a398597b3a4f5fec44740b419d20 | ORPH
         arc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/faca278bf52d6b2e5e1fbf51284489ff8ac832ff | ORPH
     riscv64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/6c8f4d253cb1982ccbfda8cf9133ae16999ef43f | ORPH
     powerpc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/f3689bc7d41ba1f8ec225f938fa8bf9bd04b4d54 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/ca67b878c51caffbac0a7a3cc3b951398947a194 | ORPH
 powerpc64le |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/6947bc77ff9ca79d0bb9f52a9119934fd9348cbf | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/4ce308313d1dea6e3365307543bfc320f9c2a9e0 | ORPH
         arc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/2f514569c0d8d1a59856b9a718988d39981c4977 | ORPH
     powerpc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/99991d6df5baef67d50d9c721f582508a3a7b5bf | ORPH
 powerpc64le |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/6c30a660ac2ec622cf729720ad23cf01d241723b | ORPH
        m68k |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/80d469abd76f817dd2c807ee7a9d59d3dcc0871f | ORPH
 powerpc64le |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/b51926e413d805810b511398684ea6bcb8925696 | ORPH
       sparc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/8feaa882b03ffcbabcf12fbe78a1ec2124e78cdd | ORPH
        m68k |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/591e388ba0a783cb597643d42117fd06d03ecaa1 | ORPH
      mipsel |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/74df8b237c18262e63f6e7873ab6416cc5b6c2e7 | ORPH
     aarch64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/b75f979180b2b3e4bb4af0faeb498c7280cd390c | ORPH
         arc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/f8dce03baafdd4c6c793615324fcc2c1ec68823c | ORPH
      x86_64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/4a3a20a25a022a2b18425c38e583f3ea75e4fb93 | ORPH
     riscv32 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/91b35d3576af9d92faf5511f537a7ec21ee2adf3 | ORPH
         arm |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/1076999d9c99c2fb19389e1a5d7976213f1b681f | ORPH
microblazeel |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/bc0f17120e9c9ffd47dc80251b2190550937a49a | ORPH
     powerpc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/f0f96d1f2c3cdfa808aca8796c8487d336e90d44 | ORPH
         arc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/53dbf85b196c3bf8cd3412f6cedd6226d6287e17 | ORPH
      x86_64 |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/73a2f62e829ba921c71925df13bcb38d0eb5193c | ORPH
    mips64el |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/805cded40e79b4cf6091d3c9be36de440b3639db | ORPH
    mips64el |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/b2f7e5c04fa3279d287ae551a25f78317ace86be | ORPH
       sparc |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/a94da0f90b67782f87b326f830797b326f6ad374 | ORPH
      mipsel |             host-vim-v8.1.0133 | NOK | http://autobuild.buildroot.net/results/753f329414320825d00ef5078c6659c694ee5c5d | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/85ed3fb0b9b18faab7372bd17d3ee7190a91384d |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/c2883cdb2d53350d49124d168b2457680b191713 |     
         arm |                mono-5.14.0.177 | NOK | http://autobuild.buildroot.net/results/4c81d222e587762ba4088637a7f28c4bc88047dd |     
         arm |              netsniff-ng-0.6.5 | NOK | http://autobuild.buildroot.net/results/cc44ed737799c9ac73628c82b86bd526b1c43310 |     
         arm |              netsniff-ng-0.6.5 | NOK | http://autobuild.buildroot.net/results/72d0753532720604d51c05663af7fbfe37434339 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/68946ae148f71c96fa30b0674777483df2139622 | ORPH
        i586 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/619e1559f58a69c7248abddf150ab3982ac3b238 | ORPH
    mips64el |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e8c2a601a7d5e4655063e97a6a9a584e4a11a616 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/41e072e9ab89baba60c3738972eda4720f53e029 | ORPH
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/f8a3f6dbd7b7e94cc1d4ba68bd96a19254bb9643 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6788b7d5603d12ef661ab4b0d1d29c8dda022e70 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/a5fdf779dde9810f49b6bbc00c25ab43c2e4c3b9 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/5b49e1236632f06dcb5f94762bc51bfde39c6668 |     
microblazeel |                  openmpi-4.0.0 | NOK | http://autobuild.buildroot.net/results/95156223d4cce4cb07c1305b27b95b685fe572b0 | ORPH
      xtensa | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/9ddc9947671ed172e3bbb576ef3d85be46d48914 |     
      xtensa | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/8becccb86aae585d6c39e3797dbcaff615f404ec |     
     powerpc | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/3139bdf7d4699a7b4bafee3456d9394f62e06a00 |     
    mips64el | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/2ea5466bac8fd999981f0b092f61a3da9fcbcab9 |     
         arc | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/f196f3ae75e1a7c114dd5e9c6d8c970147f328bc |     
       nios2 | package/gettext-tiny/gettex... | NOK | http://autobuild.buildroot.net/results/10e2b82224c120fca1a49bdfb5da08da74133124 |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/0c331ac508a16babddad2477aa319058b543c1d9 |     
     aarch64 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/dc1539ecb5db61e2d452b82e3dc68da8695ff5ad |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/a627290a3a029e165b852bc24c73034b61093f71 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c47514a9403e6a716c793bea065918a75257b097 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/5308fa41d680c0c46c27318d72dd640807eb8315 |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/c9bbf0c44117e65be3f3a7736cd069389009b526 |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/5562f4f86c5ff9311ba787ee759e3577f307a6f7 |     
microblazeel |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/4e731621c86ebca8710f8bf79d066e1cabb0a106 |     
        i586 |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/395fd44a930dfc2ad380bc735c26d9ce62344295 |     
     powerpc |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/514f07ca7cf978ab3c4ee7c26894cad1a07eb8c2 |     
        i586 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e143c5c66d06741fd3d7b2c70c7ce1159bcbbb47 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/ef8a034851e5380d6b90e9e3ac9a42b71eab77cc |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a7914852023ce1cb37b6a725e37199e790922ebf |     
      mipsel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/12ceadaad0e13d6a4fe04b9538bd91835a1aa220 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/c69e734ec29714f189a111377940e95dea7151a1 |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/0534529b540b61e7ec0cd1321d0bb29e4b9f2b5e |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/31c07c5f4724ecb21617f9f376a5f0a2b4914007 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/a703eb2d924f903ac55d66860ebd627621a98805 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/42de82e198dd3227b36143cf15161aed6f5b5809 |     
microblazeel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/681c03d6e64863800f2b397d93c0e3e6f762f015 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/69c3c704cdec628a352474c9aa5c07d22282ec00 |     
        i686 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/f2abffbcea7f9c3dcee1c821e0e1536411b709c9 |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/7d3023a7324641eea31945eb206ca177a9fbe97b |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/465e7fe33c27efdb9f64067732b821977d733a05 |     
microblazeel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/371066a30717d9a0c8d6bd78346a1bc0ad4a7026 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/655db8b9701ba61a29df7cefbc1c7d9738c2ea21 |     
       nios2 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/ede06a34f0543e40dc54a0d9d56885de0234179e |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/edd351465d01aee31b3727a7c4a9b4bf89df4b31 |     
    mips64el |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/1281b47982d92fb63aa8046a9506fcfa34831778 |     
         arc |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/2ef7e028e71ba78c0b3985b29aa816de01aa94d9 |     
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/43c7d70c344759b8efb897cc64255fd32eec0e8f |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/8aa8e9b90594be5e2a7da42816a338e87a2a840a |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/fa036e9c593ebac480309a20565b5033e60b7f92 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

               pulseview-0.4.1 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

     sparc64 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/780ff12f9142536cd5468a8922bdb38208620d91 |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/c27c62d117d5cca9c44e43bfdf918acf8dfda777 |     


-- 
http://autobuild.buildroot.net
