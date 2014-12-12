From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-11
Message-ID: <20141212073018.46608101964@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-11
===============================

        success : 269
       failures : 132
       timeouts : 3  
          TOTAL : 404

Classification of failures by reason
====================================

           libusb-compat-0.1.5 | 21
                 libusb-1.0.19 | 19
                  guile-2.0.11 | 15
                    liblo-0.26 | 9 
                libexif-0.6.21 | 8 
                blktrace-1.1.0 | 5 
             libxmlrpc-1.25.26 | 5 
                  sispmctl-3.1 | 5 
                collectd-5.4.1 | 4 
              libsvgtiny-12121 | 3 
                  zeromq-4.0.5 | 3 
            host-libusb-1.0.19 | 3 
               libsigsegv-2.10 | 2 
             bluez5_utils-5.25 | 2 
                     rpm-5.2.0 | 2 
          libcdaudio-0.99.12p2 | 2 
                pinentry-0.9.0 | 2 
             armadillo-4.000.4 | 2 
                      qt-4.8.6 | 2 
                 webkit-1.11.5 | 2 
checking whether the sys_qu... | 1 
                libupnpp-0.8.6 | 1 
               alsa-lib-1.0.28 | 1 
              host-mono-3.10.0 | 1 
         conntrack-tools-1.4.2 | 1 
            gst-ffmpeg-0.10.13 | 1 
                gptfdisk-0.8.6 | 1 
                    ruby-2.1.5 | 1 
      kismet-Kismet-2014-02-R1 | 1 
               boa-0.94.14rc21 | 1 
                  python-2.7.8 | 1 
                  thrift-0.9.2 | 1 
            modplugtools-0.5.3 | 1 
                  perl-gd-2.53 | 1 
              xmlstarlet-1.5.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                 bind-9.9.6-P1 | 1 
               w_scan-20141122 | 1 
                lmbench-3.0-a9 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/f999069a146368c0a58044c4f12c2a50cba554be/
     powerpc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/f4c3b5694e157812f08ba279c9beccc0029fe87a/
      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/4a92341045ff86d7260b8bd2cb91e4cdfb3c448a/
         arm |                  bind-9.9.6-P1 | NOK | http://autobuild.buildroot.net/results/b7ee1c3c7d3e8cb4c7caff7134bfba74047cc6d2/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b1ac7ba05ba59022e396893339b24723100a10dc/
        mips |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c88de5b3c8dbf5afefb7e34d3ec5fc3a693f8543/
        mips |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/c95bc36777fa5123850c1fbff301148301628156/
         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/32db4fb437d3406f41a0c7b20d5a58a9a6d1cc27/
        mips |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7252893c2761d37eaad8ebf11e83cc4aa6a1f9ba/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/edcc004973dda1784206f00bf22f75efb81d5823/
      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/8caf75cd348431e45315340fa3613bf03dc595ea/
    mips64el |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/b71084d67d33e80cde9478dcf5a89511479cb95e/
         arm | checking whether the sys_qu... | TIM | http://autobuild.buildroot.net/results/7c6d5c5fa3a410bb48572de6827a1e8938d783a4/
         arc |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/6955bf5aca23a3e6b46b395aa54a8e60a8436ec9/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/62ccbf45eeaea57d22802ee41efeaaf1d739b929/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/5832cc828bec3d75481cf7162e79a4134908f355/
microblazeel |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/75f7a656658d22bebd380115bca11fb1d1424737/
      xtensa |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/599540d66a5a69bda7f7c9319eddd79a5369568f/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/4f8fb305488b2bda868a3cfd3839d6a181549d37/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/6cd6124e27fa62cc2c1bf1f8dbfaa119207333a9/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b30adcdd0c0534c354f70ff0d131d924c2332adf/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3605047b90bdb107ae12ad774437106e1abe0581/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7c61fc7d0db1e9eb091ba9a01f77f57b70e0fc5a/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/025949ff5d453d497499ca26ad6bd7512637b2a5/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/550c4fe29ac03b74246254883477acc2cfd58234/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2204ce7a365d1769687b5a6db7ad10174004a4eb/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/877bf93682acb02db52e5013d124cf60e032317e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cae7d70cb915f45b995c98d247f521fa5531140f/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/628437ab54fd605b094d6e87f554519c748b293e/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b4a0a310abc08712661b340a39de1d9520851086/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a44555a4808ac861bc75886c68dd8d827b04c607/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0056a60131bc0de919004bc65a55d529661af77c/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e8a41cd7b4ed747f291e54d7b91bab7b13c1ad31/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5b725188772d6f1f92d18a20729d6229b85f29a9/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1ec8639f3246cb03d4b3e7c4a89e4ca97f0c9694/
         arm |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/d64b88410b5dedd337d51503717ba1d6b0f64107/
     aarch64 |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/44fc198e44d6ad2d579f1a202379212e03d61e3f/
        i486 |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/8f45ae8bc22868cdbd3e35cf3d5cd380103c77bf/
      x86_64 |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/8c5e91a56e62afec9c5d49ab253c515d0dbeb76b/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/9a291b18eac1825f1565762b051e0655b65a75fe/
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/2965c509138f9490e3784b9066880a222b9f15b0/
        sh4a |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/fdc9c95823eadc88edee447b307a5f9d7c17fb42/
     powerpc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/50bb9df1de22d7f10ac786452824b962fd0b2fae/
        i686 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/284fbf42578686fe9d4b599b38b6d9ca731a5c50/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/96420d610d97d59e550e9680d8dd4180c62f8141/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/b4c2058cfda99bc0d9e3b5666eaafb74ae924379/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/b97274cee3144cbec6f152a8f52bb888f1b87391/
        i686 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/13bfb4889afba3866d38e60228e853efad807fab/
      mipsel |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/94601c6ade2838dc74ddcdeb41a8493d1383e4f3/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/b9c88005f4e1141f3c4a403ea11b42dfdddb7ef0/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/cfb9ec05872ccc100babbbdcef19b4ec35476f2a/
microblazeel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/e4173459e6a3f64f26d6c3e4662294a1328fab1f/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/110a4a414c2cc1f009d827eab2a98f9b4185d879/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/12a0bd3905360e1bbace73fd0da194cd8e2698d4/
        i486 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/6166020bb4633c8f51f8adba1480eda2ad1e76ca/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/a8c73569d610ddf7fed6afc575895e8e44f0adff/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/8cbc38a2d9a8e65d95b96e7ca5e67489925ac972/
         sh4 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/fbee31f18b23249d003140556aaea9cc0ea6a318/
microblazeel |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/8237c963261dd19351ec1c339eaecda414dc8aeb/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/7d12d8c07411dbfda3828612c488650e7cb00873/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/eebb770309aebae7b3392060403772a51c920b5c/
        mips |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/cbd11e7477a7146230a56e9d6ba5bdeaca1d6147/
        mips |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/6cd1ce737d602ffdc60f3528b9e24c66b69481e5/
        mips |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/fc0c37883fc8763ea470222f42e62a2fe3502b9e/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/fc4b57af3cb81603a76529bd7b075996c5ca3971/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/b18b4506ff583b38971bc06807d1cde60d7db383/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/6412e4db4b106d8809c33bab0b5c97641df1fb15/
        i686 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/de8704b557a1a6049c26446a55758089b7338f37/
      xtensa |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f1cb7806ae3ecd4fe9c588b8bd1cd59916950746/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/440016a3f1cd449bea0767fd214a48329a39dd62/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/96ef6cd464820b7865792d45df87d81f0899fa09/
      xtensa |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/20eff6b289df2983b9f9ca54ea27f63ce0cbda95/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/873fcc4c050220f8e6b91e99e326f0008043970c/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/90519992d28d5c1c783ef2e8372ec3310b4a0880/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/9cd92225102656cabd736743ef477ce6d7b4a583/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e699911048a5bd097e497506be8aad2c0a4798d0/
      xtensa |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/3fae5454bb2ab5544d24a0eb56a338f300903a9b/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/32a22c447269e9f6bfe794e05a5369895ba1dff3/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/2eb5c4fb76dc591bca0d86c3f46b4d6b6318975c/
        i486 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/36f222583e3bdf7c1082e77414a6e1b2a9241d1a/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e8ad4aa20c7d3f575afb1cab841ed0d83bdb10fe/
        i686 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/9b1500df4e3d819b16beac79db8a01e56ea458c9/
     aarch64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/2170c8451a073b299b04abb09f1586ea5785b428/
        i686 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/dd245d1ec409bd2c83132b01fbb7d9981c07110e/
        bfin |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/8ed2ee31db86c4f819e78c0359ef6f56b736802b/
        i486 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/290bf3323541dc7f9d3e626985cf961dbb6638be/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/608049071631a444144af9d54ef26401d1695d6f/
        i686 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/c751c634fbce25a481a33fdd0ea8a9912fddc41f/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/73f143b4eb188c8e62b6c423d3ead2614b9ea728/
        i486 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/5a9fc457d83d0e2bdde76c198cf6635f62b82f0d/
    mips64el |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/3888a37a84b050b623233220431c3f3be54069c0/
        bfin |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/a63c045bb2f0f3e51f175d12a645d00a341ae294/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/0866e84d04357f5ae530822ce1809d3917854951/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/c2a3fbf76f9b7e76013bda89d106e04e1b10c5cf/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/8ad87b94a66baf7ad3b9d9839f653a9e1b222a4b/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/2f5e3b44e77d1550cc2cfc2d640247674927037e/
      x86_64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/a84509f653d3b8bcecd86acb408c9a71e3cc8b6a/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/f78396acf744ae0c69e53ee80fcf0ac79765f56b/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/7828f3da279278c78843e0dab5e8bf1712cbcc4a/
      mipsel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/3f40f3f93a63b5fa60c6c40d056b91fc71d5e5d2/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/d29060780687d70c0b63f47a2493037c759f9b7e/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/5f0d1d480315107a78553025e351a4f072d1fa69/
      x86_64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/c8ce8de3fd865489a18d7ad5389c1fa69fd76048/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/cef49ffce2d49afb0d01c21cd4f7def7fbc4ac36/
     aarch64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/36b0b7209c88237b317a4cc1e7dc29cdcc53e5ed/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/cf5f24c71b697c26b1b2328eb349c1c2ec6557df/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d0f8f9ffc8d30bbbc16840c390cf4e5e148aac8b/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a0cd101057a258b2477e08957e7cdb96615802e0/
         sh4 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/579722f95c2bc05e9298893444c703452840d3cc/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/dbfb74dd463f54e009024de6247dfa03fd2b0c33/
         arm |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/4097b1c2585db2de517a8741174c02177aabee00/
         arm |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/dfda09169ca157020ad538a6c7c471496c682a3e/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7f8cc5c01de7cc903ccd33dfae600774efd6912e/
      xtensa |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/8f56960379a7bd58a4407a1d344dc4e90e139b4e/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/73f160e905016b2555898f6a7bae100025c712be/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/e6e2f5e49060b45b561d41cbab35973e10bd5f40/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/d7b7fcc243ad15e56df235683e09636f2e0362cc/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/aa10bcadec5fe2e014c192e9ab3956e67c567b22/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/61729bd84100b6efa2b03baa3a2e27c0d2e05787/
      xtensa |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/3a9dea86639b900e9eed16c4f9aff0ad02042305/
      x86_64 |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/535eb04f28a9f603713b4fa203736abaaa473616/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/2af25bb0ef73e7e6f0d256f8cd34b2539a061fe4/
        sh4a |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/33481cf3cd0bb73df3c1e18907202760215f333c/
        mips |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/6c7ec457dd15634918d5e4000f8ae4cccdfee50e/
        i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/c050380b25d43717bf7b2dbe3e1be618ab0ed21a/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/8d4c1e565ca13858c5ac8525ad2ad7d8a179b951/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/21c54dc713ed8d6adbb343daf7040a8ad85d6f76/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/1fddbd32a56999888ca08bf60cadf35567eb628b/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/d5777af10b951d7be9bcad47d6c0dc6d5c240396/
        sh4a |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/a13d6cdeed0491d1a2e2a3b83f8393415d0450e1/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/c2a394d88c81f31608a6dbe2b8aed1b504bafbf7/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/9fe2e045f7863ef30749a1c36b509a29c20958b8/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/30e444406dc266c96025853ca87b043aec69ffa5/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/da856972193ca6fe228eeff1ab9096b62d4461db/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d3d42a17325425d7777bbd0281ccebfe29626e0d/


-- 
http://autobuild.buildroot.net
