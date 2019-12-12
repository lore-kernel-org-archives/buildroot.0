From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 07:17:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-11
Message-ID: <20191212071744.E6A1D85218@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 18  |  5  |  0  | 23  |
  2019.08.x  | 26  |  5  |  1  | 32  |
    master   | 138 | 84  |  0  | 222 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 19
                  apitrace-9.0 | 7 
                   libnss-3.48 | 7 
       alsamixergui-0.9.0rc2-1 | 3 
               protobuf-3.10.1 | 3 
                 uclibc-1.0.32 | 3 
google-breakpad-7515ab13768... | 2 
            host-mfgtools-0.02 | 2 
         host-ti-cgt-pru-2.2.1 | 2 
               ibrcommon-1.0.1 | 2 
mmc-utils-d40ec535b9d4e4c97... | 2 
     python-subprocess32-3.5.4 | 2 
                snort-2.9.14.1 | 2 
              alsa-utils-1.2.1 | 1 
                apr-util-1.6.1 | 1 
                  bind-9.11.13 | 1 
                bitcoin-0.16.3 | 1 
              fstrcmp-0.7.D001 | 1 
                  gmpc-11.8.16 | 1 
                     gzip-1.10 | 1 
                host-go-1.13.5 | 1 
              host-grpc-1.25.0 | 1 
              jpeg-turbo-2.0.3 | 1 
libuio-ca28ff0f69d89a789a47... | 1 
           libwebsockets-3.2.0 | 1 
                ljsyscall-0.12 | 1 
                     lxc-3.2.1 | 1 
make: *** wait: No child pr... | 1 
        matchbox-desktop-0.9.1 | 1 
                 mesa3d-19.2.7 | 1 
          modem-manager-1.12.0 | 1 
                oprofile-1.3.0 | 1 
                  polkit-0.116 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.5 | 1 
            qt5location-5.12.5 | 1 
              spandsp-20180108 | 1 
                    strace-5.3 | 1 
toolchain-external-codesour... | 1 
           uboot-tools-2019.10 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |        alsa-utils-1.2.1        | NOK | http://autobuild.buildroot.net/results/63966ac4401ccd4aba63ea8c2a4f782f97c8357e |     
microblazeel |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/b0c1f6efd68dcf30317add79f8b8d229aa9501cd | ORPH
    arc      |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/14effbe95ae197b449e25a37162795268c4fc1c5 | ORPH
  riscv32    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/d948bcc488804576216c046219f9611291703862 | ORPH
    sh4      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/66735fa475176a39dd09f191fec316138df159b9 |     
    i686     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/4dbac2414fe286b2c2006f3e358cb18791081bff |     
  powerpc    |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/f87b681c37b736b2b3b62612a4fc10e1568c330a |     
    m68k     |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/1c4e1c598670fc0e2459f7d6f44292385e676ec4 |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/121e8a3fb986458da20f26c2fbbe6c6b70c0300a |     
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/d365fbb5f00e2d485a8279f02e9005b5b3fb29e5 |     
 aarch64_be  |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/9ff2a3bf5552ad0dcfdece8cbcf11928d6c367ae |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c17c75d492013c97102ed4b2864ee4f8711f6b74 |     
  riscv32    |          bind-9.11.13          | NOK | http://autobuild.buildroot.net/results/d029b1a627d7bf7be97b491a897f50d70aaa3ae2 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/6f15302495ed490fc2bedfaf16b2476942843300 |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/5a3d46c657ee61cf7697edc7b51e5586e9ddcf74 |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/32130dee69855b47473d4198375e2cfeafe6954d | ORPH
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/ad6d4651f37ca79de3e09bbe179770fe580e41d2 |     
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/9126468d8525985f8518524ec6c78475cca8200f |     
    arm      |           gzip-1.10            | NOK | http://autobuild.buildroot.net/results/75812426cf07ad7161654f0492c99701de0224d7 | ORPH
  mips64el   |         host-go-1.13.5         | NOK | http://autobuild.buildroot.net/results/63f9a90a523a64ff0d055031302ab9ced0d799a9 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/27c752fdb68c1b20492cb3935021f8f0c9c6ab22 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/b05898bedcbccfdd71b2fba5a88df10634756bf6 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ff14294a7bd33ddaeabfb4869d49b75930968b31 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/c62b37d7b4933a0f8df60c83a2ef7ebdfff23a97 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/b52e1abcfbf33917401ff7291c665983cd3758d2 |     
   nios2     |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/9c95219679ee4714f854d0393f7b817e7f04a76d | ORPH
    sh4      |        ibrcommon-1.0.1         | NOK | http://autobuild.buildroot.net/results/c665806a76bba6c84afb48e7cbcc6590437e91f2 | ORPH
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/d1c84476202456fe552286de9394836bc1668857 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e20f652dbefaaa2e7e8aa5efb6cdbb636290d854 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/981326e1c82d978a414aa939ea70fc63dee434fe |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/795637088bb52be3d1caf6e86ba384d61e446827 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e56adaad72b3598478d813f039250fce52617f72 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7f789fe8d489b7cd42b9ddc31e682ea249e23f28 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a572505a50f00670f230906b99d306b94a890625 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/367830e922cac2846f13f7eeacf5b4aad29dbd9a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/ef6650971ba78d2b4e49a4f28dfc02078d74205a |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/4d5ebd1efa29d5ed26e3d4eebe033eb4669dd0b4 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/cc8322cc2bbf9b1c93b340c43a8feef55796973b |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e85d3c20193cdc0b6c9525e230dfc369e15b0f06 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/04442955b6cde0e43bd555dc55f94d78f75f8073 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/e5631f1c8b18146a52cbfd60018972a83c40be88 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5db8848fb20bd5c95d388b20f8887ead4ee67f5f |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a06c2b6b0522890bb59f212879474ce6ccd65fa7 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/5e3bc2bc4b7fedeee1c0e15a845eeb487ac0a550 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/44b1a08508c6275d98619dc230ac2d85cefa2461 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/edf0dca63fb96f35e4586ca32d5fe0c8f7becd0e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/9d4c6262adee61bb9d99d4eca493fb7f15d613c0 |     
 aarch64_be  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/fc68ddc3e479306f50e2d377133ba3bc3706eb06 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/cb35724c1f6a3cc43b856684745339468a650aac |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/cb8288eaa6a53c1614cbfac8131ca31e1c23c096 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/21124a7727c99a897759b2ca6c485996543307ea |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/bfa2f85705bd857ca6f064ab451af3f4f8d3bf91 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/a948fea07dad6675ea44e3379b7c1871605d1c99 |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/6548246d2c6a7365c0f581e77e1236179970011a |     
    arm      | libuio-ca28ff0f69d89a789a47... | NOK | http://autobuild.buildroot.net/results/5a4fbd951ac193a5ebbb499b60db16652589612c |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/41ff3e9835ab1085e61b4f6f467ad690f17d5495 |     
  aarch64    |         ljsyscall-0.12         | NOK | http://autobuild.buildroot.net/results/3a0bd14349b3cab3e09d0b8b24ddab66dfab91ff |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/09fe001aced5d7f99c60d35c4d5eab1fd2897a8b |     
 aarch64_be  | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/c6db62294db47ddfe651e1201e61440f1817231c |     
  aarch64    |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/548cbb7885af38910218a2d802f2948f80efa2b3 |     
    arm      |         mesa3d-19.2.7          | NOK | http://autobuild.buildroot.net/results/816b8e0a8bc77201d9a0fe9076d711b8dea2e1fe |     
    arm      | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/8e432930c0643442deacd34782224d0350bae6c7 |     
   mipsel    | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/ccd21f2cd0f8be2de50ee14f524233c745433e64 |     
   x86_64    |      modem-manager-1.12.0      | NOK | http://autobuild.buildroot.net/results/5ac390b2a813cadb4cb180d61bb05f6fe4407155 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/a10541f4dcb93c241ac234c3f656c0982d8e0f82 |     
  mips64el   |          polkit-0.116          | NOK | http://autobuild.buildroot.net/results/f66c320aa49fe4296d8d7b2a63ddebc09496494e |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/2610224e3254f574ad8ba2283909246077bbcb0f |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/3dc93dbc0130e5399593826bcea818364ed6e77e |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/b75cbeee343120e013459bbe8ed7c516d9a63bf4 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/c5b28975abe058c58274d389397c8b52f7899ef4 |     
   x86_64    |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/f1cbbf530d449e72cbdd6f19c2eaee0033d11db9 |     
  mips64el   |   python-subprocess32-3.5.4    | NOK | http://autobuild.buildroot.net/results/e3b54f7a55c80aa7324faaf102f865eae8a893f3 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/615970c08e6b6690fb491688ff3d2113c075caff |     
microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/bfdda9c9aad8d230609ee6f14a56a84d0326baef |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/5522e1b406da60c626265a25326976c16b056d36 |     
microblazeel |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/6cee12fa0c2d8422af0d6c4d17f4bdae84c3f49c |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/6c5b2bb9387a0c310953b7ac9a4f5a4d3b0203d2 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/11477c18cf38683fc1ae9aafc2ac2e208ddf8c5b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8379c7cdc2f47c776cf2629fe1a1233bb63a6b28 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/cf4f04634cded46f4da776c41a0a42ecfb6cf920 |     
    arm      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/51e48ed4c394fd83ae747fcc92bf677c1df73266 |     
  powerpc    |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/53a512a881cb14e57ce3ddb52b54c15cde7843a4 |     
    arc      |         uclibc-1.0.32          | NOK | http://autobuild.buildroot.net/results/d1b45b78b94387a7b15be7caec64847bd04af0f1 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/64db3b24c81d153e8fa22f83937eef878dd7b69e |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
           host-mfgtools-v0.02 | 1 
            safeclib-v03032018 | 1 
                 uclibc-1.0.31 | 1 
                    wine-3.0.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/fe6533769f7fcac3fd7f5520b3b4946bfb62ae46 |     
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/a76a1dcf597203ba63612840066f8dd02d5d0cd5 |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/d1e2c94312b7af5c722c090110df490a076591c0 |     
    arm      |         uclibc-1.0.31          | NOK | http://autobuild.buildroot.net/results/a28f90fa0768dfed4c201ddf47741eb4de4f5af0 |     
    i586     |           wine-3.0.4           | NOK | http://autobuild.buildroot.net/results/e51cf714dbf5108fbb3f314eb10ac9314a05df77 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                snort-2.9.14.1 | 2 
                    ffmpeg-4.2 | 1 
                      icu-64-2 | 1 
               libsigsegv-2.12 | 1 
                     webkitgtk | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/905a17b0d91dd4a02da0b8aa8c424f9478fb8ce7 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/2773e4ca66ef6dfac88919af379c70a3861dd033 | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/f59ad479b532bacd2cefffdb86bed6a631a4a875 |     
    or1k     |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/da79e74f8cedcc3a70f442468ae2e43af28599ad |     
    arc      |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/50e1b16ccf80b12e5b5249a30d8b0d959e7c0948 |     
  aarch64    |           webkitgtk            | TIM | http://autobuild.buildroot.net/results/beb32807fda30f6f92d3a2f6e9b72b819a71654c |     



-- 
http://autobuild.buildroot.net
