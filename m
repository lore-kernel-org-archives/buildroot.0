From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-11
Message-ID: <20140112073009.34B81101069@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-11
===============================

        success : 76 
       failures : 61 
       timeouts : 2  
          TOTAL : 139

Classification of failures by reason
====================================

              libnfc-llcp-1103 | 15
                python-nfc-212 | 7 
                aiccu-20070115 | 4 
                  ltris-1.0.19 | 4 
                 sysprof-1.1.8 | 3 
                 pixman-0.30.0 | 3 
                  libpng-1.6.8 | 2 
                     php-5.5.7 | 2 
        ltp-testsuite-20130904 | 2 
                       unknown | 2 
                      icu-51.2 | 1 
                  thrift-0.9.1 | 1 
               alsa-lib-1.0.26 | 1 
                    systemd-44 | 1 
            libvncserver-0.9.9 | 1 
                directfb-1.6.3 | 1 
      libnetfilter_queue-1.0.2 | 1 
                     gdb-7.5.1 | 1 
                 ffmpeg-0.8.15 | 1 
                 mplayer-1.1.1 | 1 
               audiofile-0.3.6 | 1 
                elfutils-0.155 | 1 
                 qt5base-5.2.0 | 1 
                 rt-tests-0.83 | 1 
  toolchain-external-undefined | 1 
                    sdl-1.2.15 | 1 
                     nut-2.6.5 | 1 
               wvstreams-4.6.1 | 1 
               qt5webkit-5.2.0 | 1 

Detail of failures
===================

      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/c8d48368a78d26be9cd0a155b5cbc551d77a8fb8/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/d7465347f0ce562ea9956d493a85ccb5d94c08ce/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/9bfdc7a0effa98ffff98b354ae51c828c89a797a/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/83fe78bfc14af9e77811afb7eb24efac45d82778/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e780a4319df8ee9822d5f4fd8832112e0eb5cdb1/
       arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/17b6e2cd775ed4f1823c7bdc767ab258abcc2465/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ef1af6a340543ed2f1f11f0d8c8cedf186797645/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/c9cf4921db8963434cd2acc5f8939e5697e6d05f/
       arc |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/0f318005adfe797b264fb8f30a77df133e856754/
     nios2 |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/f527d94e4e3fc5fa818fba81015eb3db6f3de4e2/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/7cd1710e95bc569c456a1f944a085fb40eb69a1d/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/357eee6530a19207861ed194db134b2fe6c73b66/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/cff1638af81cb4142aa37b44365813cdf3beb45c/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/4afdea9da8df8f20c47b68146bde888a98fddf32/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/d8aacfea707d76131b48f48d8117e1b8aebdfd44/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/6a28c5bc0065fdc9eb14c3943c18b16ff3913f81/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/8d4fb9b4a3fac77bf89a45ad44c5ac8f161b071f/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/6db798155c49f876b48f326725245b54860d5e7f/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/de6173db2f06122e4a89a83b2bf42f56c12c3e9b/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/3b8c5bff3df86b9a13d23dbb215d822457eb14b1/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/3d9ba0298e6a1970bbb2504617c386a5223f9db4/
      i686 |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/aadd0013b222161adb0082ee61c9be51e9e957ed/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/57e5b4eb54d6985609e142cacfd063bae1b1ed2b/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/15f0fb7ee9fd6fdaeb8786bb1da667d19603a2ce/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/b2cff1a776ae8269400cd95fa9f65e7622a6dc6c/
       arm |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/dc941c934ba166de4d910198cb62cee4a0c71821/
   powerpc |               libnfc-llcp-1103 | NOK | http://autobuild.buildroot.net/results/d39ada7b39570f58a9a50e46a01133643a42573a/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/37d8b5647eec86371c4cca6c493361abb4a43b99/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/0e6e50c67075c3a957e051a4306670368ee530b8/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/061715052ec56fa2f1e446ff7ea70feac9d92174/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/e584f854fddd66a8e71bc336ed740472cb629c4b/
       arm |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/69b0aa3d191af03a2f460ef602354084d9e9cd45/
    x86_64 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/96584bc03181523b20418fdfa3aeca56596dba41/
       arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/1440931f700f1d484ff7fef2e384f0e6db164b8c/
       arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/a1cc88b72305767b08c1610a147912b8b6389160/
    x86_64 |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/4456b648d76f368d74cf92ec2c2826aee19d89dc/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/e007f6ab371891a3cf6f4acff7280c99d5ad7a30/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/83e27ea4fb570759d9185eaf8897660f3876dfac/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/e89f5b4492a0c89366a284a0ba586c33c1b9d187/
   powerpc |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/84ab3dac5e77ba285b550075d3d87d7845114647/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/865da948772d3242a79107ea0f570b9fd9e2f485/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/b0afa190911c946c4d9b7aff050180998fd7b907/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/5faa90621188304888de89d38ac5ce84c4ab94d7/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/5e46a25155b7b633f65b7f9d0db7f0b13f94b023/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/73222d51ebbfb23dd5c07d4279868db0072d0a7d/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/113b052910e503b0bfbb3ec7cdb8e2772168e4fc/
       arm |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/77003f09849af733fd9c34ff8fe8f89f5f446cf1/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/114d3646ead953743f8c7daec9962cfd5af9ba15/
       sh4 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/9d9c6105f4def1a9c65524611d5e3b7283aa5b1b/
      i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/bcd48d142ab090dd957250637d9de117c462cd92/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/f311284f4f2374a747daa1355c4e8c36a8cb76ef/
    x86_64 |                qt5webkit-5.2.0 | NOK | http://autobuild.buildroot.net/results/774aaae92e82e0c462859358592f5caec016f065/
    xtensa |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/da6eae13506fb2ed789a01b57cbfc429d0725635/
  mips64el |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/2e564cea5a69a62a4d2ecec0f8b6c114d4918b2a/
    x86_64 |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/b503759edb471d842b49af501e2dca2e5ca6d302/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/909e194797c4910a8ba03d1a23dc2a702eb99824/
   powerpc |                  sysprof-1.1.8 | NOK | http://autobuild.buildroot.net/results/523d868d55395e4b32464762f08227a0803f1155/
      i686 |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/b8fa6270f91857250e01118f781a43bd9635a43a/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/00ac8ace3dde10df0477b496cf6184d655010d76/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/3fcb6ea0e8f84df4c860c0db64176b5b7b07b2b9/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/5133c93e9cd59d00be191436da4bf83faf8208fa/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/42fe26261efc2b1716413887633d285aff17b866/
    xtensa |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/f31cfc986b38aaf46386ffacb18017bb3d0efc26/


-- 
http://autobuild.buildroot.net
