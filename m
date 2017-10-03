From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Oct 2017 08:30:55 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-02
Message-ID: <20171003063055.CB591208D4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-02
================================

      successes : 243
       failures : 86 
       timeouts : 0  
          TOTAL : 329

Classification of failures by reason
====================================

                       unknown | 39
                host-mtd-2.0.1 | 5 
      host-uboot-tools-2017.07 | 5 
             dbus-python-1.2.4 | 4 
              lbase64-20120820 | 4 
                openjpeg-2.2.0 | 4 
                    flex-2.6.4 | 3 
host-squashfs-3de1687d7432e... | 3 
host-vboot-utils-bbdd62f9b0... | 3 
                   cmake-3.8.2 | 2 
                     nmap-7.60 | 2 
                   perl-5.26.1 | 2 
                    sdl2-2.0.6 | 2 
                  boost-1.64.0 | 1 
                   jamvm-2.0.0 | 1 
             lttng-tools-2.9.5 | 1 
                openobex-1.7.2 | 1 
                   pcre2-10.30 | 1 
                      qt-4.8.7 | 1 
                   tor-0.3.1.7 | 1 
               wireshark-2.2.7 | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/7c6c0465e1e4817dfcef8f4a74d62170f283ecd0 |     
        i586 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/f33ebd07581329d613e2ea43708d6e2836fb3c99 |     
    mips64el |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/039a3a4a9829708beb122ecb5547c07add91125d |     
microblazeel |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/4888c168bf4a6da8da27596c229671835a4e9011 | ORPH
        or1k |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/1ca3d1ff92ce632d35d0e79642f6faee3f4b3600 | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/370f779cc95591fec285f819375be64d32bbd82a | ORPH
       nios2 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/6f54f6a1b9dffe90997bdb499fa0a5809a2c72a1 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/3726d5d993b4d308f3d0999dbd35f401de5b1896 | ORPH
        m68k |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/139fac75dd3f58fb60b98a635bb2368880dd7235 | ORPH
        bfin |                     flex-2.6.4 | NOK | http://autobuild.buildroot.net/results/0c9b446273a5da7f15f0e51405e68c6b30781056 | ORPH
         arm |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/d080d7befd7a36242fa5559e5943bf6bc2eb52ff | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/0b57f0f06e071fcf0a9196a7119a769eeb619713 | ORPH
       nios2 |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/193ca2d51ee1122cc6585a78dc72b1a733d0cbce | ORPH
microblazeel |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/400bbb1bb28d4ee4455cd85d6ea071a905988b6d | ORPH
         arc |                 host-mtd-2.0.1 | NOK | http://autobuild.buildroot.net/results/4f664e4ff7c50d090878902c24770fc16b329632 | ORPH
         arm | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/7669b108e2d339f0f2ee6e2f2bab2b7163b3d0ba |     
       sparc | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/c7aff2514c3381df747a99e219741224943d2b40 |     
      mipsel | host-squashfs-3de1687d7432e... | NOK | http://autobuild.buildroot.net/results/9cb9d877bd02b0b8c839220af384e46de5ee9aeb |     
    mips64el |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e604bfc25989a8cb9a2b1e5d46e541091725a59f | ORPH
      mipsel |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/528589d5184f12ecd56d507879796ce00042742e | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/bde019aa364dd5666903a0286e4a419d68596d04 | ORPH
 powerpc64le |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/103ee589b9ee514217f8a09537fbce19b9c43dbf | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/3fd187bd83d7d84770e6a243761927e5a6f36802 | ORPH
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fbe7892539cc1bf18f89d18c6609a5aa747647d0 |     
         arc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/70a97284b0041a3bd34013e4bf9a34bc7ae688c3 |     
       nios2 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/458101f34b891f04cb81444af5bfd84ca32685a7 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/5a3ebea32e4e379edb80dc682bac7f361ebd352e | ORPH
        or1k |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/dbd8bc1a844d6d4c4bc31ca8a0f995091ae43eb0 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/4a7be64ae6d7b210b0c3dbe34f806a61d6a92f18 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/a43d704f9870eca1fd43afd9f594d73b2e157422 |     
      x86_64 |               lbase64-20120820 | NOK | http://autobuild.buildroot.net/results/88fd41ae18b4268ee0ab4076ccc4178bb344d5e0 |     
        i586 |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/e90edef3ff455832ce0cf157d76ab1712152e84a |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/72c898adc8acb11f66ff11672477a1478b3226e5 |     
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/f17ace423229df8cdb93aa0393c0ccf43b8fc65a |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/96cf9d8dc57867bdbbd60434bf4563be82eee224 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/285312cf255076aa75dbe6b4e28cfb2cbe798687 |     
microblazeel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/814686b806adc9375124b0490294fb770c8e3e59 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4c4d1fc70ecb6dc8c94d8d91567061112605a0f3 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/82510f0ce3a4a8431be4dd0bc236ceebaa1cd7dc |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/bf406bb3ad1c3e9931c24faf460483d40d38b5bc | ORPH
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/6fe4780e72c2f7c529a68aadc8372d45db446922 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/052c8b89b4bc6c402bacc9ac23700d18fd075e44 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2c96abc3809a2b2774705c3d4152a5ad87ed60db | ORPH
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/61e99b3673302c2bfc2869743a62e8c480dba9db |     
         arm |                     sdl2-2.0.6 | NOK | http://autobuild.buildroot.net/results/0262737885b2f99bd00bd46abdb617858b272339 |     
         arm |                    tor-0.3.1.7 | NOK | http://autobuild.buildroot.net/results/5c0c0f3e6ebb4c8c879c2c13bec88681e09106aa |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bc2ca0242ac924d5467cbbf4f48260ad05246151 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/df420aa56e29bf1c0f727ccc224708d4d536a5eb |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3cf2a6a1235a3f3208fca6a9e55dac8f76fcd648 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/913c4075bb4e1d6f5d1a4c040e0ef45114f32263 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/e15747901cd99f62a0ac6d08ca06e2c0eaf1c0fc |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/3f1a4cdc48c1f17402bcd6960a8fceb98c147980 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/0dcd57184e4a6c31e4d2d2120e180d66dfb4fad5 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/4e125b21cf7c9c0c32c3925a2c67fa824dc46544 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/79f4891530a01890d3c031e8e809c0a8dea5b579 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/34d05cd5e7e4a6c91242315292dbdc5617ad3bb0 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/b9da6e7dfe2c1ecc59a2e2bebcde08b5acb84f65 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bfab5009c1456231c861df661050ba5211ea209e |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/af2d4ed75cd9e56a04c53d4f6297ebabc46a3672 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/8f691ae530f8b4f22052f674b3e0d247846d5b3d |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/7cbcdc6de4319b1e4a0f797bcb89a32aaef3180f |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7025c36d39f15d5f06b867c09ab40272f7e985cb |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/33610b0c3990b43126dfbf946832b2285afcf58b |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/fa0da0ef4eaa70685d3f3e5900d72ea647c71111 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/1fedf778d4d9c605b864b20da2a49255c8b7b78c |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/08fa1abfb6b2927b17a568da0bf959038a621ae1 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c3e77c7734089b9f67fb2944e31fce85f0cc2f09 |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/b262928f16c48b162e16893c5da959100a191806 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/73fe25e89c1379168564fdb15f8dab74582f3741 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/09190513e7fd782f8ec418caf67e2ab053e38e4c |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/c2690a9f890e87113025d3d1fca3711b7663c502 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/c2ceaa0731d2f2484b7dd5d91f6d66873c4de6e8 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/4ff144fd16f0bee75cf57c05b73af9903e4bc305 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/6d773b946961317ae35d4bf991e18b1f6bef3b46 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/e4011f63eaddd694b5451e2a1fbe7ec07f6d2458 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/875e3ebb57117d361053d029ec2479b53e382ec5 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/edc14d93f301076991329d4a9c93f5fb184e51e3 |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/6c26548e8cf7f89bab85b6263e5ea905092c4486 |     
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/caf8c7ede6533ab1bc17a637f91b8a1825678674 |     
        or1k |                        unknown | NOK | http://autobuild.buildroot.net/results/606a5c3293c334218b8f22cb87ec51cd901b0b64 |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/23b242546f808c718df09ff5326ac09254ebe39f |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/d7c5d8f09ea782f9ef3edb30d48c792ca0b6e444 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/38dd823363ace5f4f23d4959d44b3ed65bd2d0d1 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/1c7f525a22087018911862e50c6ca78ecdd9a80e |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/ca8768894f4c50601d95e39833befa9eaaf91b75 |     
      mipsel |                wireshark-2.2.7 | NOK | http://autobuild.buildroot.net/results/c8eee4ec14d678cd19ca978142594bc6e68fc2f6 |     

-- 
http://autobuild.buildroot.net
