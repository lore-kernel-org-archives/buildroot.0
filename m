From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-21
Message-ID: <20131222073008.DCF1D101285@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-21
===============================

        success : 71 
       failures : 43 
       timeouts : 1  
          TOTAL : 115

Classification of failures by reason
====================================

              python-pyasn-1.2 | 7 
                    ola-0.8.32 | 6 
             util-linux-2.23.2 | 5 
                      icu-51.2 | 3 
                  ltrace-0.7.3 | 3 
                   squid-3.4.1 | 2 
                 mplayer-1.1.1 | 2 
                 netsnmp-5.7.2 | 1 
                 cairo-1.12.10 | 1 
                       unknown | 1 
                aiccu-20070115 | 1 
                 ffmpeg-0.8.15 | 1 
                 webkit-1.11.5 | 1 
                 rt-tests-0.83 | 1 
                coreutils-8.21 | 1 
                 msgpack-0.5.4 | 1 
           python-pyzmq-13.1.0 | 1 
                  libv4l-0.8.9 | 1 
make: *** [python-pycrypto-... | 1 
            qt5jsbackend-5.2.0 | 1 
                  imlib2-1.4.5 | 1 
             bluez_utils-4.101 | 1 
                   lftp-4.4.10 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/5a2c3fd259fb05684d381509414739a129e0a297/
    mipsel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7688e272dbfd51fb2676081eafc1d9cde8d6c779/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/d1d7009c338f054e58a1231478825ed5d08ba66a/
    xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/61455388cf43b27b732942d3045ebf8451810c6f/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/834d0ba428671148cf8dc02f853077a43f2bdeaf/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/82fa8107d21f262ffe8765947499004a8140be09/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/95e15e9657d3bf5fe27c84b4e6aee3a0d69ce36a/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/583d761198a1a40a54be30160b082bdac50bfb12/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/4847ac05470b1d55d653ff7cf850bc2ece44baa7/
       arc |                    lftp-4.4.10 | NOK | http://autobuild.buildroot.net/results/9399649a510643738f2be0363e93f2aea23faa98/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/c7001f5fffcd4a2f1e4b7a9c91ed9a5fc44caab3/
microblaze |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/ee7241f0708d0c9d986da7c45fa626f007bb79ef/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/bf521f6eb9a47b1751e736c838ff8f6d1abfb0e7/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/a632320d07ad58976c35d8530a3461bf485c7d0d/
  mips64el | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/86183f3d46044b1ed165e92c9e323dacfa9ea416/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/107d34ac492f76261e2803b233ab238c85c56621/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/716648936ca630473bb46ad479ed663934fe89a8/
       arc |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/be54201fb6481ac9275f958e397b1fea52207ab7/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/6b1b7efb3eb083c64d76a9ca73cb4893ff0ec1a5/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/b7b7c782f45e22e25167e477035377d94782f57b/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/f1dd11bc6ec1a1edf7df390d19c799fafac92ec4/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/f859c428a1fa298ae3f1aa220d397244bf39be2b/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/b9fd8a90a6d2c7fa58843cfaf1be1042baa5c4ec/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/56837fdc9b3d63549257b5478ea39cdde82c396e/
   aarch64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/aaeb7ade125828913f8e134781f82cb5b6003f65/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/59b3ed3eb53b97fc9af058201bbc817f9a2beb62/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/403e9350b2d50260e0b4f22166f853d4d39dbe66/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/315ae3bd67d89357cb9d964118d4ab68249e3417/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/35960208832155bbac6895c2daa72195c5ec1af2/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/a8f491de88ec3f666d538b7043f76e5c384a53d1/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/47e1ad9b89516d842f3d4077efbb4e3f1c0c1d3e/
   powerpc |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/816ba4c17571f1956b466eec888aab51919b30ad/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/9dd0e449f60c1a86c768234a21ea5a9181515231/
       arm |             qt5jsbackend-5.2.0 | NOK | http://autobuild.buildroot.net/results/3861aa91e03154c7d20f4157f0c3a1fa14838af1/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/48a4ff721b24218b39c946fbcc59bb4a92266b50/
   aarch64 |                    squid-3.4.1 | NOK | http://autobuild.buildroot.net/results/974e6feda81204c5e874790ac30a58787f74ae02/
       arm |                    squid-3.4.1 | NOK | http://autobuild.buildroot.net/results/453f3993396674f7b1c69c47a2c00c61e71f8be9/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/53ef63e68cf0d224d790770425cc4e32c63fc1cb/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9298faf4e7c697a338698e40b43a5c86008d1747/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/6cbf107316c213baef6ec6b816f96852309afbcb/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/73a7eaae086dea9916769f73f69572726f670251/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/df5a4929e5039722d9c1fe1265bbd4f7593c4264/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/875d4787a120a93dbaef955c866621362cd3ad0c/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/cad1b53c73add8bb133714afbae96660d27db1b6/


-- 
http://autobuild.buildroot.net
