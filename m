From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 07:26:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-25
Message-ID: <20200326072634.61F6587789@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 12  |  6  |  0  | 18  |
  2019.11.x  |  9  |  3  |  0  | 12  |
  2020.02.x  | 18  |  3  |  0  | 21  |
    master   | 119 | 63  |  0  | 182 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libtirpc-1.2.5 | 7 
                  connman-1.38 | 6 
               libglib2-2.64.1 | 6 
                  ffmpeg-4.2.2 | 4 
psplash-fd33a9b3d68c89fa22f... | 4 
              host-grpc-1.25.0 | 3 
                 haproxy-2.1.2 | 2 
                   libnss-3.51 | 2 
                oprofile-1.3.0 | 2 
         python-markdown-3.2.1 | 2 
                qt5base-5.12.7 | 2 
                 rocksdb-6.6.4 | 2 
                       unknown | 2 
                     vlc-3.0.8 | 2 
                  zeromq-4.3.2 | 2 
                   cvs-1.12.13 | 1 
                   gupnp-1.0.4 | 1 
           host-nodejs-12.16.1 | 1 
              libeXosip2-5.1.1 | 1 
                  libkrb5-1.17 | 1 
               libtheora-1.1.1 | 1 
           mediastreamer-4.3.1 | 1 
              moarvm-2020.02.1 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.19.1 | 1 
                 opencv3-4.2.0 | 1 
                  pango-1.44.6 | 1 
                pipewire-0.2.7 | 1 
               qt5webkit-5.9.1 | 1 
                    strace-5.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/a309448476a36b9de8b30244fa43c4ff71481f5f |     
   x86_64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/937d88af89e67fbd8bb7e364ed8f7b8f31b20b7e |     
  mips64el   |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/def6fb1af63ce1231d36bf6d019745b31cce38eb |     
    sh4      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/884c11147f1a9a5e62589a0b1f20e7725c943d36 |     
  riscv64    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/07bda8f3ed02089d4716792ce740070dd1ae845e |     
  riscv32    |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/a9df47353813c99eca10c67793e5c512e2744333 |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/948da9c3b8fc9f3311150915f8ba0fe88fb03aec | ORPH
  sparc64    |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/5749eb236ff7c222f1331d844feb47fed3dd2bf0 |     
  mips64el   |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/d571511f4b8c44fc2cba8324f88d57b64b0f3adf |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ecd61342b93dbe492fcac88f150a19cf672ee4bb |     
    arm      |          ffmpeg-4.2.2          | NOK | http://autobuild.buildroot.net/results/ec3ca574fa609103549432540dd1a96f637e7324 |     
  sparc64    |          gupnp-1.0.4           | NOK | http://autobuild.buildroot.net/results/457ecc20e1932e13e82ff6bdcaf4adaf97cb7d1d |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/22f56e72ede53e17a46f36f958e21702d362ccd0 |     
    m68k     |         haproxy-2.1.2          | NOK | http://autobuild.buildroot.net/results/f11ca11a335cfdb8d6abb63e9617c3f48d42678f |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/37111822e6d2a1fccbfd19945d1e9279ab4d06a8 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d79ec334eaf421d00020e114d97d127a82ad4e21 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/24d1460d9a7ea1ac1770c55dd0b6d405f139be9a |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/16e7155f297a6dfa15f333e7fe8c53dbeeb43da9 |     
    arm      |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/ec262058cc0a4bf92c381857eaf3b44412942bba |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/6a6db914f954a198210dec646da0ab6aa44ba7f8 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/5289f74b2f55bfbf3cfe7cd6e3dd3622b466fd05 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/a61a077b1daec6d0d9f8522a81c414e8cee10a8f |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/c6cef868c6b7eef9b99bdeb48bc7c059a4029500 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/ca46a0c5b5761c891c70d750c69f128f85083926 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/23423c2ee1856eb1177b818f5b4faefdeff5757e |     
    or1k     |          libkrb5-1.17          | NOK | http://autobuild.buildroot.net/results/5cb1986fd9f3add9b1f2e794b6251909b456ffbd |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/464044fda2850123339de6c8071374e380636ee0 |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/87eabd181ea31e0436f9a861f44008bd2756f0b7 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/b6fd783eb9c0a898cf435d986cfc8ebb8d13ed35 | ORPH
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cd1674f1b1c59f94bfe8960a27d14051a1cccb57 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/113c00599f502fbecbae625e9bfb8eb3f0699cd9 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/2e01044475fd71dabc633012951261ecb23a74ee |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/8b767c5f5eadf3a14ebb870aa151aefd2a3676d2 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/e1b0f5b8969d523ea4d8e958c55ce38309e972d5 |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/02ac2836b5e652d7fcc1bf1cf718bb57de9f0451 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/3dc2aa2b8ca5ee12b621e97f84645bf0db4564f6 |     
  riscv64    |      mediastreamer-4.3.1       | NOK | http://autobuild.buildroot.net/results/a27c6fcadc7a96e0129a7ee75270594e992d271d | ORPH
    arm      |        moarvm-2020.02.1        | NOK | http://autobuild.buildroot.net/results/59d6b651498f3523d4a990eddc03c7d5043425ff |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a4935d1f277e11d9b55702ea2b0e60192634bc19 | ORPH
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/4a393e24aa941843ca30ea67ab548f5d1eb1e702 |     
   sparc     |         opencv3-4.2.0          | NOK | http://autobuild.buildroot.net/results/3b13768910e6263a67b3bfc13f0526fb1ce3a8b2 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/cf8744dc2c185fbd1a8049fca4a6e9cf3c5dddd7 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/fd81a10b511945053487c44e484f8c7014cf41fe |     
   x86_64    |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/96cc40acbda7ef20de3c819b41f7f91289dae10f | ORPH
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/6be27630266bdc8e66ae5421356d5e77d1b80792 |     
  mips64el   | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/98a168b2dbb2a77a9e8868294c6e0eb591f88127 |     
  riscv32    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/4cae533ee237849ada2d215b8fc47db39f7a40f8 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/9e3d64629ceadd4089fdd78d09934bbc94e8fe2b |     
  powerpc    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/fe94359811b16e82241d9f3c6e262a6857fc5af5 |     
    arm      |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/800881eca5697778516f80ee9669abe55ec87b32 |     
  mips64el   |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/1f9f1d62e5f0915b00c64fb0671d18bc1d68eaf8 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/472ca81ca247f66db709f0db2df4c0bf8b28a8c4 |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/1e7f3b24e8c526f9c3f1991f20870633cce40e21 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/c8653e8c9ac927edd6b5ba09969652da88847070 |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/bdc62b743c1b6ded5b1bc99b45cb559c89ab753e |     
    m68k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/0ca20ab65bd4de0c86ebe1226501275e357bbf1e |     
    arm      |           strace-5.4           | NOK | http://autobuild.buildroot.net/results/dd7ec26396412375941eaf43daf755d61a68458b |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/c73bb20066e9e479e6e39feafa9144ef820e12a8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/4bb72119872f12c75136b5466ef22f401ca92dd7 |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5901ef92f99a496dc4816ff4a5d2e7d5ab185fee |     
    arm      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/f5bcea9171c8ee3e7e7302c101a29c5a7d3e9e9c |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/0508c3708ea1948c7be30a6de36be99b4c1b794a |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/7d58932ee5a67d4edd5052fb2ccdb28e707bde65 |     


Detail of defconfig failures
----------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
              freescale_imx8qmmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712526  |      
             freescale_imx8qxpmek |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712527  |      
                  minnowboard_max |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712574  |      
        minnowboard_max-graphical |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712573  |      
                   pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712635  |      
                    pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712636  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712651  |      
                qemu_m68k_mcf5208 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712660  |      
              qemu_mips32r2_malta |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712670  |      
                        qemu_or1k |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712691  |      
                 qemu_ppc_g3beige |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712698  |      
                 qemu_xtensa_lx60 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712727  |      
           qemu_xtensa_lx60_nommu |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712729  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712746  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712767  |      
                 snps_archs38_vdk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712796  |      
                  stm32f429_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712814  |      
                  stm32f469_disco |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712817  |      
                  stm32mp157a_dk1 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712820  |      
                           ts5500 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712831  |      


Detail of runtime-test failures
-------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
        TestDockerCompose |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712907  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712896  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712897  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712898  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712900  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712901  | ORPH 
...ystemSystemdRwNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712903  | ORPH 
                  TestLxc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712957  | ORPH 
      TestPerlCryptSSLeay |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483712971  | ORPH 
    TestPythonPy2Autobahn |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483713000  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483713019  | ORPH 
      TestPythonPy3Django |  https://gitlab.com/buildroot.org/buildroot/-/jobs/483713023  | ORPH 




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 2 
                   glm-0.9.8.4 | 1 
             host-grpc-v1.16.1 | 1 
              python-pyqt5-5.7 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/2365424cc90795f19d1869df6656f1badad0803f | ORPH
    or1k     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/06efa7f122bba95d2e98847d8f642ec34d413229 |     
  riscv32    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/135c337f596063c9b264b25fb9c2c6c71bf1db00 |     
  powerpc    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/3ebcbbb8063c5516cdec0fd5693dd81b8d7c9235 |     
  aarch64    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/68f7e1a53e6d436ab8c9ba867cde0f7976ee0427 |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/939a62991d3172f35235928ac22a628891dae54b |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

      gst-plugins-base-0.10.36 | 1 
host-google-breakpad-7515ab... | 1 
                oprofile-1.3.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |    gst-plugins-base-0.10.36    | NOK | http://autobuild.buildroot.net/results/a5fe26363f56cc8e6fed1484973c11c11472809b |     
   x86_64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/7853cbcabd4cbd99134041c9a9c1f39f49ddac8e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/9995b7a18fcc38a02dd1dd3af462a14528a2174d |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                     vlc-3.0.8 | 2 
               libupnpp-0.17.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/feb63c0ccdb29182b3e4c886daa165f32297a835 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/81dace43bf85e17ec717b631c7bb5d931324bdf0 |     
   x86_64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/bf675797a8b8024989e69b03b1c44f7ae85e9c21 |     



-- 
http://autobuild.buildroot.net
