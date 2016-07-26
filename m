From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-25
Message-ID: <20160726063029.B5A4B1036EF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-25
===============================

        success : 208
       failures : 69 
       timeouts : 2  
          TOTAL : 279

Classification of failures by reason
====================================

               host-gdb-7.10.1 | 3 
                   cmake-3.5.2 | 3 
             transmission-2.92 | 3 
      host-uboot-tools-2016.07 | 2 
                cifs-utils-6.5 | 2 
           uboot-tools-2016.07 | 2 
                  libsepol-2.5 | 2 
           libmemcached-1.0.18 | 2 
             bluez_utils-4.101 | 2 
openblas-f04af36ad0e85b64f1... | 2 
                oprofile-1.1.0 | 2 
              squeezelite-v1.8 | 1 
sconeserver-bbb384404575f8a... | 1 
                   assimp-v3.2 | 1 
               binutils-2.25.1 | 1 
                 openssh-7.2p2 | 1 
                   dante-1.4.1 | 1 
             ntfs-3g-2016.2.22 | 1 
             shellinabox-v2.19 | 1 
                 php-zmq-1.1.3 | 1 
                blktrace-1.1.0 | 1 
               netplug-1.2.9.2 | 1 
                  squid-3.5.20 | 1 
                    owfs-3.1p1 | 1 
             python-six-1.10.0 | 1 
                 opencv-2.4.13 | 1 
    xserver_xorg-server-1.18.4 | 1 
       poco-poco-1.7.2-release | 1 
                  snmppp-3.3.5 | 1 
                  nginx-1.10.1 | 1 
                   systemd-230 | 1 
                     dtc-1.4.1 | 1 
            lttng-libust-2.7.1 | 1 
               libsigsegv-2.10 | 1 
                  samba4-4.4.5 | 1 
                     php-7.0.8 | 1 
                  rt-tests-1.0 | 1 
          chocolate-doom-2.2.1 | 1 
               libcap-ng-0.7.7 | 1 
                ipmiutil-2.9.7 | 1 
                  cairo-1.14.6 | 1 
                  boost-1.61.0 | 1 
                   fio-fio-2.7 | 1 
                   bdwgc-7.4.2 | 1 
                  gamin-0.1.10 | 1 
               lighttpd-1.4.40 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                  multicat-2.1 | 1 
                     php-7.0.9 | 1 
make[1]: *** [print-babel.o... | 1 
                    ustr-1.0.4 | 1 
              lirc-tools-0.9.4 | 1 
           linux-zigbee-v0.3.1 | 1 
           argp-standalone-1.3 | 1 
                 ibrdtnd-1.0.1 | 1 
               libdvdnav-5.0.3 | 1 
                    hans-0.4.4 | 1 

Detail of failures
===================

        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/60e49654d876b2d1525d74f767665f0c6690629b/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9a8ab72f63803f958996a62e44d789f00c00893e/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/8728d130d8aaf26d370a3f0d644b88e49f2f8e1e/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/b5f21e4b142d8edf87512ff97bb8a0b8ca6cf74e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/92a722e691eaf51290bc9fe616d8f5ff86298d12/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/59bd8219cc606a50af25f40e782bca9f2b81a272/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7219166f1b7ef9d379bf2b6038f61768348a734e/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/3497f25647123492a1806a7356b308705eeb9977/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/83983f1a63a1b19d897ed3292d43659135d3a6e7/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/ee317bec210ef5e3c5e932a0841a6b815e76fa1e/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/b1d8400b0f90223c885c6a85605b938a347cd480/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/7bf52f865719ef8bbc80b00fe4e8f3564264435e/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/1323d9a8164b954bd9ffe643a6ba0f1d45758353/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/2894d201b498f99415da4c320b48097c8043d58d/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/f639aeab849441154f68108d3dc1524522ab40ba/
    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/a1f3b082bea126b1ba25ba35646df49fb9a2867c/
      mipsel |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/99b02a064ceeb54e0e14036ff4f96b004f3fcc2b/
         arm |                    fio-fio-2.7 | NOK | http://autobuild.buildroot.net/results/5143c707bd6f4ea185704a8fd480d9dd30075305/
microblazeel |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/bc170693c180d49427cf6d7f2896bf249ee52943/
      xtensa |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/4df36dd64b4a24cb8e0eed698620d4fe54be0af4/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/519b1084d4c8ccd55346bf167188944232d592c3/
         arm |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ea9f7e4b5d7fd8ccc6acbea1d428dbce29c72aa4/
    mips64el |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/2c4232751c26c398685b3d887bc3a6e698ce5220/
         arm |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/a9d41892d7304bf369db7359afc1d1ea9aafe28c/
    mips64el |       host-uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/0e0f6e303ffc002720782a57fb76d5eac1519042/
        m68k |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/cfbc0e813b0cc5631bf829657ae46eb274cea4be/
        i586 |                 ipmiutil-2.9.7 | NOK | http://autobuild.buildroot.net/results/a3ff7d53b2fdbc56a81dbce71512acf8d72a9d0d/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3b60a13d6c33982e7d3a7d47a48f99b576cb2974/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/011eb09446bd1dd69b9232d9f8a2315787e66598/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c984e5d5f32b8a17db7e7ffc0af33ed6e8102aa6/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d6607b36afe7963b0e6c1f97c3f4fa9d9ebd3eff/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5f9369745a69d1f657fb39526218ac9e8e3ca23c/
        bfin |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/5489ce985adc5f0d693cf78477f4c31d9ffc2a4f/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/5659a709af0820d3f8053d6ff57051154ec383fa/
      x86_64 |                lighttpd-1.4.40 | NOK | http://autobuild.buildroot.net/results/0fc898beabc32c27830385d45ef5bd464dcd3797/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/c05385a349b0ebe007f5c0488daf0a5d235ef9c1/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/e24ecedd92db8d5de50dd15c5fccf341715a63ed/
        i586 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/60c15d24d970421f270c1e536018dabbfbcee391/
         arm | make[1]: *** [print-babel.o... | TIM | http://autobuild.buildroot.net/results/2e86fead2a1803926a630b746732881fd32fa2d1/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/0d5f9911cb5cf35850777bdbc338827eab6ac327/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/a4ef21195784a2f983f696aaa1f7cef13bcc8bb0/
      x86_64 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/d46634fa6fe0c43fb3f12bdd0889600f7a8ca893/
        i586 |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/22b4a406a751e93c0c8f41c15a4cf36bb40195fa/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/70873478e3dc661cc4b03f5aae3b91427929a106/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f19b0504d76f79a67c01d4129a5900355a34bce0/
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/c931bdffd6a4aa63f6cc704d3041839dead3814d/
        i586 |                  openssh-7.2p2 | NOK | http://autobuild.buildroot.net/results/c10afe928576eb0339bd075bc31f0a85423c8e48/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/274fd3984ffbf343c583c2b5682ac436ce60396a/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/7a632684afb8a87c2bc97799cfbdfc28566f16c1/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/019eb50890a6b9698b9c402ef34b03508cb77598/
        i686 |                      php-7.0.8 | NOK | http://autobuild.buildroot.net/results/acbf72f16b8205e1c829cfaba84ec2f1c358f1cc/
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/50b236471b51eb0016dc3221ec834951188adbb4/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/0a68f107be2e1cb9114c288bd3270ffaa4a04053/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/e7213ee158f89859857b0a750eb1b22fc60d4025/
      mipsel |              python-six-1.10.0 | TIM | http://autobuild.buildroot.net/results/79904e7ef7357938b19823326b4375ea6878bb1b/
        i686 | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/ea4dd00ee585f9f9ea1927b8b5fd9035e6733420/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/fc8b7a58a2cd7a8945135505df837fa143da4aab/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/afbad73fe54222b88f263ec070f48ef2d77cc5b5/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/25a377a86713b989f699d22e5cd061086293eb59/
         arm |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/f7fc5e5673b2dccf0bfb9e7ef2f7d633f505745f/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/533b0100ce26218be4894acc13ea75355830da2d/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/83048b82652ea41146deac1fa17ba14ca9d8bca4/
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/2933aa251f50dc6b44de1a593eb1b33da3d13376/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/7f3841f6a95d80270651ece0cc3b78294c547b44/
     powerpc |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/374032413dee9a436847324c4085bc3855bf4b3b/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/e0f63cd523c8058ff0949fdd015ff162dfaa835c/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/1104ecef546de8aee8bc300e9ab9ed8a726d73aa/
     sparc64 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/3b4d9da8b883bfddec4bad698457f180922f1aac/
        i686 |            uboot-tools-2016.07 | NOK | http://autobuild.buildroot.net/results/a35d906137a5e91de9aba511173ed2a9ce4350ba/
        i686 |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2d4233f772af0ddc4e272e0d5fa95debc394efca/
      x86_64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/3b2b10314cde2ecacb7fd3949990a4cac2117f4c/


-- 
http://autobuild.buildroot.net
