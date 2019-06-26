From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Jun 2019 06:00:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-25
Message-ID: <20190626060125.A0DD021514@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   0 |   0 |  20 |
   2019.05.x |  20 |   0 |   0 |  20 |
      master | 160 |  65 |   2 | 227 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 14
                       unknown | 9 
              libsodium-1.0.17 | 6 
                 hiawatha-10.9 | 4 
              iputils-20190515 | 4 
               libcap-ng-0.7.9 | 4 
                harfbuzz-2.5.2 | 3 
     host-imagemagick-7.0.8-42 | 3 
              domoticz-4.10717 | 2 
             host-cargo-0.26.0 | 2 
           host-harfbuzz-2.5.2 | 2 
                       libcddb | 2 
           libvncserver-0.9.12 | 2 
                    proj-5.0.1 | 2 
             xlib_libX11-1.6.8 | 2 
                   dvblast-3.4 | 1 
            host-mfgtools-0.02 | 1 
                qt5base-5.12.2 | 1 
             qt5wayland-5.12.2 | 1 
rtmpdump-c5f04a58fc2aeea629... | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

         arm |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/cb8d07425e8f189caac63543de0c8cffcde468a8 |     
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/33e2fa89b9a1b1710a0cf48bd75c751001a0e95b |     
         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/23269f918b7850a8d179a3c176264788ef9d0eea |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/474106beb92178366b0e3bef574b9114e8fc36ac | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/9fa0759883c28add4934492fc09642c1f5ec4330 | ORPH
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/88ee520dbd41c01f6018eb06805cd5a98101f062 | ORPH
       nios2 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/a01b268463744172177018cec86be69b3152ac3e |     
    mips64el |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/7ece9bf08e9882461f48d3c9eff60db9320e77ac |     
         arm |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/21b9ff2e6a9378b41b975d0b1a66854e2e69255c |     
        i586 |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/38507163dc67acbdb4cd995f2383af78ae44f9bb |     
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/16a908c738152d7ee1231862bd0b34c78f89a5cb |     
     riscv64 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/3dd080b98475f8cd75f9f35243502ada3cd304e2 |     
        i686 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/615ae7f0372f6be1ee5859df8557301bf2165b6b | ORPH
     riscv32 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/40dbc75df510039dc56a8d3a91fe439c6ad1409b | ORPH
    mips64el |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/8d32bd665f04cf36caa4a1fef7f5550957b3aac4 | ORPH
microblazeel |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/f7afbdb0b28725920de5f67126a468a5c199ad8b | ORPH
         arc |      host-imagemagick-7.0.8-42 | NOK | http://autobuild.buildroot.net/results/34ba4762b563a213831228a09ad4a7364d307656 | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/183c0ea4e784104fc4c9e6ad2aed5c4ea57d890b |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/8c3e16ba089fdb03c6bb99f421f1ac5400a1f906 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/eefa81f3c08a4ef741bee3ea3012132310937548 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/770d54d9b7f05c67841a84ad9dfcdae3d39422d0 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/10a08a32eb59fb8694f140f1025852d091149379 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/15cf3fe6d5c2db7d06c320c8e89724854c05ba1f |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/66e8f28ed171b5c8994e6ba8c4e6257d6bbe0191 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/dd6d1740857faf250cc188df8b735d55c8e59868 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/5a4b868ed3edcbcbac42ec55fb266ed0d1f2ba42 |     
     aarch64 |                        libcddb | TIM | http://autobuild.buildroot.net/results/4d8610e5b399c4711bcd17e165b9bad8c92cf595 |     
     aarch64 |                        libcddb | TIM | http://autobuild.buildroot.net/results/14063ede4b6bd924847050b1b5c2780b9a76091e |     
         sh4 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/1a4808fe18ff3bfcba2be6f076684529d22ce35e |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/488572073ad3893888d5107cb9d3653e24cd6abf |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/9425883d7cec4a3c0eb5c9df5d74c65b44463b8d |     
microblazeel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/262cdd79570b0474543b2dcfc7443d331a4ad42a |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/9e717e6bd07670bad5921069d4f2fce4ee61784d |     
microblazeel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ab2322de2126d122d61644c20733e413c94acc8f |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/771b126be8f2e96753a68b16777de4c2d13cfc2c |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/65e059e028c385a9df23de4c5a0ba35cf01e05f8 |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/02ed0992bb0144a205923f1f966e7a28402b97b8 |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/bf93e93c51795d6d8a8344de697469a2aa674825 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b4e30bf94cd11c62ee5b23fdf1b46a416dbca5e3 |     
        or1k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/bed9c4bb952ca212ae7eb05a5d5531d519a219c1 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/7a4beea80c1368abfd75dd09e03d4f84bd8b21ec |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/976d8091762ddb781ad255e0b9c0fcbb4e9de99d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/789016ff66bb4bcd2667a8c5241a680b98db5b2f |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/f01d705108d45ddb6c1a0099b7af39a6d56fbc81 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/6e413bc20597eb5e8109215ad2c65ad4f150b7d8 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/8013a34b197c382f43d42a54799dc363210a06e9 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/e3fa0797f9dabe7216ff7c99b6cfad689b54fd5d |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/1b43b07bf53a7172163ee226a8ce926b26f3f5d1 |     
         arm |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/3e594084bdefd19eacbb648473ed22591cbe1fcf | ORPH
     powerpc |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/0d556022b07e6020b48a8e87a48aa5e4f0f06bd9 | ORPH
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/ea218292eae8bd591f8dd3de445586df8b5f593a |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/bebfd64a35ae1ff8cb2efecbf5ab057f56de7c45 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/7cef9ad11281fe10f6759238c71d75f09d81e7b4 |     
         arm |              qt5wayland-5.12.2 | NOK | http://autobuild.buildroot.net/results/95ce0915677aa3bd5eafe06866395a5273c5d498 |     
       nios2 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/f3f1a3688dfcb1fd76abd6de450db14867ec6f78 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/d1026f43ba80d6e68c0669de217e3f7e94f1582d |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/7613a0e4c8437bf0f07c7fdb6aa15931f638537a |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/675c9c263d63a13e73efe95dcb43c57dce0d14ed |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/dd04dc1859cbc59d960468e7613f4fda3346767d |     
        mips |                        unknown | NOK | http://autobuild.buildroot.net/results/757971983a46598fbbf597086cf17aee02682acb |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/b2eb929b1f7b3cdd6945cd727effb916f5456b40 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/45bb68e53c2b543bab3fe1dfd9f099382be97b36 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/e28c70a5ed056d125f5d7373dd259d01e5d00307 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/ce45e7eb8843ddb3bb1fcc975ccadde4a2991a2b |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/d046d30e8eb28ba2f8989b4809b51ea587546e78 | ORPH
       nios2 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/5d2334b56a9c3e5f5376e79a63f4710a8924810e |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/facdd2fc4f3ce849c37c1177839187393ce3705f |     


-- 
http://autobuild.buildroot.net
