From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-16
Message-ID: <20140717063013.14C41100FF3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-16
===============================

        success : 89 
       failures : 73 
       timeouts : 0  
          TOTAL : 162

Classification of failures by reason
====================================

                    parted-3.1 | 18
               host-parted-3.1 | 11
        gst1-plugins-bad-1.2.4 | 8 
            host-python3-3.4.1 | 7 
                       unknown | 5 
               libglib2-2.40.0 | 4 
                coreutils-8.22 | 4 
               alsa-lib-1.0.28 | 3 
          google-breakpad-1320 | 2 
                 libssh2-1.4.3 | 1 
                      qt-4.8.6 | 1 
               libcuefile-r475 | 1 
                 cdrkit-1.1.11 | 1 
      network-manager-0.9.10.0 | 1 
                elfutils-0.155 | 1 
                     popt-1.16 | 1 
               openswan-2.6.41 | 1 
                  ffmpeg-1.2.7 | 1 
                 webkit-1.11.5 | 1 
                quagga-0.99.23 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/e33c8a3a7dabac8ae6fd5198c2c76cababbfe106/
    x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6a86194ec49b12b11fc2f466e5455a081817e9e2/
   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/57c8a49e322b8a31a9c883e1d29b6a7a3a785524/
      i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/81f451e465426b55e5299ab62f33088d39b3b6ee/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/5d884863ad284177a0234d15d9fcd2b8ceed72c7/
       arm |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/aaa467adfc545745d71e77f025fe0d59a1bf0e63/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/67d799e17ab59b9749b16bc6b5f2f835e39704b3/
   powerpc |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/f3e0100486fb2e56b8b7f9eed126084070bed600/
       arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/9a8f36f829061347adffeb14ec95cc1b71eb50e3/
       arm |                   ffmpeg-1.2.7 | NOK | http://autobuild.buildroot.net/results/6efd68e26f57a238d7688bd20be327af59001940/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/e2245644eb98509252889d04c918556c6f39034c/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/c913f2a9f0d814901aed813d0648d7ad969728b2/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/cbab1eeb1239c4a5478c85cfc68e687a5c432a6b/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/4486e0be4f80ac86e88f0368b4f8983a2f17e29f/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/18888e06058dff0249d7c5e10a2c4f46e059878a/
       arm |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/b2c5deeace1b6963a28dce8044d9e8a8aa70c1a8/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/ea6797f9595c34734229c78b4e25bf624925144b/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/19593d2f1b906db830e73020a3ce78860c8c87f0/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/5b0f072d3f5f6541fee14a81fcbb1058ac3a916f/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/5781774ae1b7ba85efee4bc933235304169b9196/
microblazeel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/8e1ce420e858fb6e682e1e45001461735f62b4ae/
    mipsel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/b02cc584f5158825913259de9f883686acdc5b14/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/ba5b2f0415f2ea637cfa7778a51b36fecac85dc2/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/47c12bec7805b07aec048c72a712355f9436ed7c/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/0bf08be9aac7daa1a5f361e6263282d0669e875f/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/4c9f2c02514c8aea107223f73ec74139b033e345/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/d771dba08e2a807eeeaa16f876101d3bdb0fe106/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/c00d35b77f22675194922f472c89922e98c0ad53/
   powerpc |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/e5d0dea5de770884a05510377b6365e311a0e673/
    x86_64 |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/b2f78adf0c1c5688b0b6a6b61c356da9641a289b/
    mipsel |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/cef3cfc76f81273be32480f2f3c5966d3569c402/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/99acf094d214a083300146f9857c867f9784c11a/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/32fc33068c9715e4eeca7921fe9ad92d9ca74b8b/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/d99809b6cfbc9f62568ca27cdedc132a24b2af5a/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/2f8a215b9769bb8ba0e39de03ac2f0aa6dcbf3b0/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/ca8456640516406607dbd8029380fa25e4c2d5a0/
    mipsel |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/b9f38b91d1ff484be0a06633a4ff38d993d27269/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/9f1882ff7962f20e9dd4e9198d8a6ac894d90405/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/f64647118c49cc3f70f0a3db6bec19519d200378/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/3c93aa54c50433beb5fbf6a2c2a5e4cb592fe8b9/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/c7e6a7e651123eca713b303edb620ef2d6872c76/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/57399541790bfe3ec24ee1c65c807497a81fd936/
    xtensa |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/e95947ce70376a94777b6071346e391f18181aff/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/f02ba1e6b533bddd1279f89df1ef53a736b766af/
   powerpc |       network-manager-0.9.10.0 | NOK | http://autobuild.buildroot.net/results/093656db99067eb7bff725e292f8fc880a1d748e/
   powerpc |                openswan-2.6.41 | NOK | http://autobuild.buildroot.net/results/21ea5f9a9ff6ad8f53d0b12a8a60f0fe936801a4/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/04f9c7e47e1d9a0183690a731336a2188f295916/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/b7a9533a55430994b72292fbeb0a79a6e33b2a8c/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/2a5d64b0fcb269a519f2b777006f56273c346c54/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/ba518955dbada3861415a4ea5ef44610e09ed0d6/
   aarch64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/1e1bf949920ac56ae863607f15cec10cf683f5e3/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/3df2f3cd16499be93997dcea721acb2e06d0976f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/22e09e5faa84e33a2103dff344d188743691ceab/
    mipsel |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/a3d12c50d819ae8b35fd2df7748881e0a38d20e6/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/458f96ff4d9531c8c13a688e4a2a8e1c24537113/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/7a07e30d9a4bef99adec8a8956e3a30a1783d6bb/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/2955f6cf9e4fd2a0c03b6d643daa95ae5e7aebbd/
    mipsel |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/465f57c9f60153a7926c20847ded969adc01cd58/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/a5ee9c351c24c2e6f3cfcfc4b762f318f7fa7cdd/
       arc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/cc992beaf4d8c13834f92e31a686306212e20025/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/f7cb23a72a606ecfd5df8ed4e4e04f5dabf4ae72/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/85752c0bff6569c07b968b8753253f0045c81d6f/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/b2932e13ba47b0075861f72ae3af00a09b1af045/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/786a96d8e6783a309da936242711a29edf8b5fc7/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/b9314a8e1e5eee9e016ec18e098761caf61c3055/
    x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/ccc1b1049a11659c1c870572c1fa10eda342c310/
      bfin |                 quagga-0.99.23 | NOK | http://autobuild.buildroot.net/results/1c5fdfe3a0248b65efdea0594d8367ff907015d4/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/6e00fed09014fa6301452ddeae543d255cd48b89/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/d84fe4c4596e5305b42c440c9d99af17a46e569a/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/631cd398f1b64c79331e10d5a8e73ddbf3401f88/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/0db54c555f6c7e635ebf99f86b3f91dc31e441f0/
   powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/c1e3258d27095ff5f393fc4d239b1a6229de5a84/
    mipsel |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/921e1423bb47d1fae11d0e30027e376707dfa24a/


-- 
http://autobuild.buildroot.net
