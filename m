From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-06
Message-ID: <20131007063006.13C1552C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-06
===============================

        success : 64 
       failures : 47 
       timeouts : 0  
          TOTAL : 111

Classification of failures by reason
====================================

        host-util-linux-2.23.2 | 22
    trace-cmd-trace-cmd-v2.2.1 | 3 
                    php-5.3.27 | 3 
                 rt-tests-0.83 | 2 
               ruby-1.9.3-p448 | 2 
media-ctl-ac40b79f002a2315f... | 1 
                socat-2.0.0-b6 | 1 
                      qt-4.8.5 | 1 
                 cdrkit-1.1.11 | 1 
               audiofile-0.3.6 | 1 
                  sysklogd-1.5 | 1 
                 libnspr-4.9.6 | 1 
                    crda-1.1.3 | 1 
        ltp-testsuite-20130109 | 1 
        gst1-plugins-bad-1.2.0 | 1 
               libglib2-2.36.3 | 1 
                     zsh-5.0.2 | 1 
                 fdk-aac-0.1.1 | 1 
                      pv-1.4.6 | 1 
                  prboom-2.5.0 | 1 

Detail of failures
===================

       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/7a3ccf3500195a4afd9d294dddd35a84fc8f73db/
   powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/cfe83c56f8003b29f56f141aed021e9817166a69/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/9f3f4e4925f068261512ea4c63669e349d9823df/
    mipsel |                  fdk-aac-0.1.1 | NOK | http://autobuild.buildroot.net/results/0c2b1f886bca378c35453cf078d7314a7ddca180/
    x86_64 |         gst1-plugins-bad-1.2.0 | NOK | http://autobuild.buildroot.net/results/7552397d54ba80b3a26c8b7e676ff5feb4913f64/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0cae6664d19d6a8bc24424b934260edfe07218ff/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8cce3c511d673fb7e5e7c3fd51c04139c92c6d7b/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f565c02de3588ded8dacdf4d1f553174f7b6b072/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ba13465879783d00eb82add5259a62bd0bd0cad3/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/c3bac0e0c38b4065e171d8a535fd9fb1ea51b20c/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bd4671ae5b37747d54c16182eca020cf36018b77/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/4c279e715dc10fd7101b74f73ec83056d254b2b7/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f91026aee7d7b2dd5665118ee8763bf1efa5fda4/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/9bdb9fbc932cf5d9cecc9da11da4c1bde17396fd/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/ea1964e8e8e8506f67de67976789b6c2d87ae4b6/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/096af0e6141fe5554abddca71082b3781bdb64cb/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/1506de47d40a3dbaa8a97f04fa8c59e12d8629bc/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8046ef549ebe7dc48eed753b30d5166c9c4a1a1c/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d77184893e42c6dc114d6ba16f086eef7dce5222/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f0145659b22ec33ebce0ed068b5d550f7feed8a4/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/f4a1b1c0f6e96765d565794ed9cbfbbf6fe1d728/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/7fc82dc1e5b6dddc1ae190314f4a991534932507/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/23a31cdbae55c3bbaaa2b04c840903e7eee2aff2/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/85baceee392f8f4be0105cdc87bb0734dce2a2d7/
       arm |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/19ed6cf37b0836ce3bb982a221ae6d8563a2767b/
      i686 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/8fb45f87cbcbba079f5e1a8879dd620edc134faf/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/19156878714bece752cca729bc30ffeba6b00110/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e570445aafab51ce497da9e0d864157f50ff75d7/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/58e5bc913edbe3799257acf3d530ada49cf6d98e/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/b3acafcae15704c3b2598df6bcb69c4b07608003/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/54afc80d4b58a4064a49226bcd4a28f32e3cf814/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/da035fa4d35cdf76b02369fb7145618bd268dde1/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/dd89dc3ff2ada01d417789584bbcbff1ecb0582f/
       arm |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/aebd27c31c9b8dbb754e30862a323ad7f40505fc/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/b3d88400e8ecb8d005422eafa72c2999324863f1/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/9aca276a220ad1460e5b32bd042dd4c93649baf3/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/70fc513f0cf4e9c6fed82a3a2de822e7ceb1b330/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/9a19eaf3652cbd35af65ac5a0fb1e3d022dc1758/
    xtensa |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/fc7eb8ab5c04aefbb9e813628bc0d95be16d1527/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/3975e39e89dd24fadc5abe386324962535483a4f/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/7d353486e22eb8a0084802e9fac9bb6c013c4168/
       arm |                 socat-2.0.0-b6 | NOK | http://autobuild.buildroot.net/results/1fa40d9cffd45f5256e10c7b75924e454defbd2a/
   powerpc |                   sysklogd-1.5 | NOK | http://autobuild.buildroot.net/results/d93c17239c86c90a997c9cd18a6604e381e9d4c1/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/71cdec5e4e8d29295c97a874b8a9f6568f0b13ee/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/3d8c63410a6f04d54d8f18788f543814283df76f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/86d1bd99ca62fc34ce80d86c07fef674462b523e/
       arm |                      zsh-5.0.2 | NOK | http://autobuild.buildroot.net/results/1e3f77522f8aa040d91be771e1fea72766626b76/


-- 
http://autobuild.buildroot.net
