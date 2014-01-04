From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-03
Message-ID: <20140104073009.5A5B5100F01@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-03
===============================

        success : 85 
       failures : 46 
       timeouts : 1  
          TOTAL : 132

Classification of failures by reason
====================================

             transmission-2.82 | 10
                    ola-0.8.32 | 4 
                 cairo-1.12.10 | 3 
libwebsockets-v1.22-chrome2... | 3 
                aiccu-20070115 | 3 
                  libpng-1.6.8 | 2 
make: *** [zmqpp-legal-info... | 2 
                 mplayer-1.1.1 | 2 
                       unknown | 1 
                 libevas-1.7.7 | 1 
               audiofile-0.3.6 | 1 
                  nettle-2.7.1 | 1 
                 fio-fio-2.1.4 | 1 
  toolchain-external-undefined | 1 
                 pixman-0.30.0 | 1 
host-gcc-final-b93bb009e021... | 1 
                  iozone-3_414 | 1 
                 libpfm4-4.3.0 | 1 
                 qt5base-5.2.0 | 1 
          enlightenment-0.17.3 | 1 
                    strace-4.8 | 1 
libnfc-fda8d60ce062409bb32c... | 1 
                     php-5.5.7 | 1 
                  ltrace-0.7.3 | 1 
              cryptsetup-1.6.3 | 1 
                  dhcpcd-6.1.0 | 1 

Detail of failures
===================

   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/182be4651bb1debfa72588e124aafba9eda33468/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/829240ec48f27183fed0f03f943fb8712b4da7e2/
    x86_64 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e6a0fc23e1c13fca2c8ab10803f25cbf1182adec/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/17fd33f1c5d5736c9d484452d78825c1f0dedc5c/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/8cd95a1e2849bd1632aec8e7fd3df672cca8c30a/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c55336cd1d853a2628ffc0c0246843d2e0831667/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/40ecb6bbc4ccb29255a4fa040a0edd23b8f66cc4/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/94d62cb9837cb2baf476bcd2ffd1c2d5004cd954/
      bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/2d5ebdb4cc8ba5eb7f6f25b2efdd2c61fa1c6c38/
    xtensa |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/92f4641215bd90ae9757e5d000e6f8fd8f1c7d53/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/82c0483f7d18bb310d331897e5a886aee0fe3474/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/c73f3597e19911c95224521e7fad011e3fe427b7/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/04e68c06fb2c4681021a814eb66268f38375c2eb/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/f21f7de8248c6a75a7229975305a1355ab66f609/
   powerpc | libnfc-fda8d60ce062409bb32c... | NOK | http://autobuild.buildroot.net/results/67f3d275fcbe6255e6e0f98ab617c423ecdd96af/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/371aad131267928af64f24c5bf84eaa88fe7f8d9/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/2228888cb58a7ff5189347cf9773da6257708173/
      bfin |                   libpng-1.6.8 | NOK | http://autobuild.buildroot.net/results/044703a09a03b29ff100625b956a8e2a62a28324/
    mipsel | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/67a505f486d7eff3f986973a77ad4f5e58a4b7e2/
    x86_64 | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/a31d68aef9ec766ee3fe53ea601b286f21ff0682/
       arm | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/990e6ce707d34d6dd4b02216212009883338a100/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/4c366cfe42feb272a841ec5cdcff6a784d66494c/
      i686 | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/ce76c74bfc4c2366ed744a6cca6be31fd92a0f81/
       arm | make: *** [zmqpp-legal-info... | NOK | http://autobuild.buildroot.net/results/e8f6c8252ba947537e7d8759fd9cafc3ef1c3966/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/0a7044681aa7a88d7b1a3496aeb5ae43ad160eb3/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a39df30e5ddd22d0cdca9af35e4bcada9aaf365e/
       arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/8a66c08b28bc65a96a9cd827623cf7f104fef6e4/
  mips64el |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/46a5e7193f04f4a7467f2e243588fe55cc534e43/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/ce0d0bcd6748966fc8487035aa92d48c75f82dc3/
       sh4 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/9f5813be8959027eb67eb2c68181cf13a65cc6c7/
    x86_64 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/224303fcd5fe5f9034244949e6a314f09e2a86eb/
       sh4 |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/6614f8e1257b9726faa483b060b199eb692ffe88/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/878f0665c1b3e0c8895912c3a5a3078f937a9c75/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/7b353fc4650deb9aeaf21cd0e0e24ad86d01193e/
       arm |                     strace-4.8 | NOK | http://autobuild.buildroot.net/results/c5d05a9b1b1e580981d7d59f84ac9bdb549b467e/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c015e46dab6c0e0a57906208b044ccbd5c7be3a6/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/35a87b8f860a36a3ecafad7ccf4644b409278277/
     nios2 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/3da24401768d0f050e9af5d843384619d4acdcf5/
     nios2 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/19896d0474c1c79209b59e8bc46713a4ffa00470/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/53bcdcdd5d91d790d819504021605c92d0fb0809/
     nios2 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/31c9396b57788c1cf5d1c65ba6fc4cd25509febb/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/2480a8ac09a2ce8da5ee8942c0e3db5de003772f/
      mips |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/f6a16c2c4e858ce96d8e9bb3ac754db4bd3039bc/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/b0ef33d41c3eef615bf9535cbb29eee58dd613cf/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/600eb59b2c199f512358e686995b8d466467acc7/
   aarch64 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/f0332e85807094a7390cd91a3a1755aa6feffe6a/
   powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/a0dc5e979d6b23831833cd89952b55f5b8d7f532/


-- 
http://autobuild.buildroot.net
