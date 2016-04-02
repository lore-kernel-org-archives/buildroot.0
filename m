From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-01
Message-ID: <20160402063023.724E81029BF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-01
===============================

        success : 193
       failures : 80 
       timeouts : 2  
          TOTAL : 275

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 11
                  connman-1.31 | 9 
                    mosh-1.2.5 | 4 
             lirc-tools-0.9.3a | 3 
               ipmitool-1.8.16 | 3 
                      qt-4.8.7 | 3 
               valgrind-3.11.0 | 3 
                  ffmpeg-2.8.6 | 3 
                  boost-1.60.0 | 3 
                    yajl-2.1.0 | 2 
       gadgetfs-test-undefined | 2 
glmark2-499aa81a68fb4c8aac1... | 2 
                  cairo-1.14.6 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                 libdrm-2.4.67 | 1 
                  trinity-v1.6 | 1 
              gnuradio-3.7.9.1 | 1 
                    libiio-0.5 | 1 
                wayland-1.10.0 | 1 
                   taskd-1.1.0 | 1 
                    vpnc-0.5.3 | 1 
 make[2]: *** [all] Terminated | 1 
                pinentry-0.9.4 | 1 
               opencv-2.4.12.3 | 1 
                    cups-2.1.2 | 1 
                   mplayer-1.2 | 1 
                blktrace-1.1.0 | 1 
              rabbitmq-c-0.7.1 | 1 
                    norm-1.5r6 | 1 
                   perl-5.22.1 | 1 
                    owfs-3.1p1 | 1 
        host-gutenprint-5.2.11 | 1 
                    ruby-2.3.0 | 1 
                     mtr-v0.86 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                grantlee-0.5.1 | 1 
iputils-3a86a2542c6fe29413c... | 1 
       poco-poco-1.6.1-release | 1 
               cannelloni-v0.5 | 1 
                collectd-5.5.1 | 1 
                 mono-4.2.2.30 | 1 
                  ltris-1.0.19 | 1 
           lksctp-tools-1.0.16 | 1 
                 jack2-v1.9.10 | 1 
flann-04b4a56533faf8c8228d0... | 1 
make[1]: *** wait: No child... | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5bd166a07da5d1345db3515e73d2c3b16c09dc5f/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/3b3d483ee957ad01d78037d308bf9ed2c0b97e7e/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/67ed860f2508f0c35f47cbff0fa87d2bbcb35bb5/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/04533599646d0d937b5a517552743457c9f4c568/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/5fea0c115fc0e5421d5a325f654e12aac12db7e4/
        i686 |                cannelloni-v0.5 | NOK | http://autobuild.buildroot.net/results/47eec97949cff9b915f2c3f8a37885a225a2c1f2/
microblazeel |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/3a307711f090e84f1b83eefbbb6d75502f38b606/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/83443f1d6303cd5aae87cdd7eecdc521cbe9a719/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/46a4d4facd5c366486bdf5058a9d6f8c9099717f/
         arc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/bcfa20b94b2da7b1849670bdddb34126f5f978fd/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1dd0119cbd94a65466bf920c8bdd06e19d067100/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/f6096ff39e5865e3fc824d3cd00c208ab730be67/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/3e7098ed6678b907aad9e08a5423e9982539f3f6/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/06b6cff3e7ae0949bc22c4026c280420d3295d3f/
     powerpc |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/1f2fe1c10071f26932e3ed94f676e856e42c0388/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/e8beb1955c6a3de883d30248dead2fc7bedaab6b/
      mipsel |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/8568e7fd40bf13d1ea53c7f98e5ef954d4240f83/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/89681cbd7d9cb7986b2f1b3269151129a8a78319/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/e447bc06782db9ac699ba4a9cda643f6d7053652/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/7c69f90532a3619ac290e1fdf1a3623aafaf2e82/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/d74962e50aab1e7371196769b0bd3740784b02ab/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/eda7d80ad114a3cc07c734f25da7b34287252ec5/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/37ea1b51791a51e919c6e362fb04dbbd1dc364b5/
      mipsel | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/e269f0a17a9b7cdad7f29ca01bad39f4840a13b9/
     sparc64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/7b72bf2cd78afbd53e9a6b95062bc7e4d78f1f63/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/031f4d191250fc5a05dc389e03b1de7c557f568d/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/c8a31f265454de86e6ebaf0e4eff1dbe59e1b489/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/7c46c920d3396f1e835ba9b83e016ee52fd0f06c/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/dc74d65bb1719bd7bc07d562fa44d1f749c85567/
     sparc64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/081b3be918ac1eaa8cfbc5919e00bc1ea267c1df/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/75fd6f1be0271bb15078c62f3effdbb67ac07427/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/b4d2c75de93e26f5746f404f8af9cbb1abafba4a/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/b4f01f40ca9786f197acb571c715d1a6831b77bc/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/a6ebcbfd0776885e5fad7608bac07a6c6c7636ba/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3326bfee9bacd8db4367e38849dd66b9b347a1d9/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/c623601e5a16674c73b760f2bf16ee9788032808/
      x86_64 |                     libiio-0.5 | NOK | http://autobuild.buildroot.net/results/767d3bb6b26c460325fffa8939f091df66f294da/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4b1e2a5644c2bd8f52f3d443ab5f9e4098afbc2e/
        i686 |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/4702b714a7629e619bd2b2a533dedd0f8b9c4730/
         arm |              lirc-tools-0.9.3a | NOK | http://autobuild.buildroot.net/results/093b7d7c261715c4881be40a2d90682b16085358/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/eee9f66cca6be255695fbd34932709536de7922e/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b5539c22ee35a36ae3fe4967040ea04b11889a4c/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/9b6613392323555bed945b46fd30f1d60b4c03e5/
        i686 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/27e18ccbd9d40f1d45788ab3657774f6004971bf/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/4438a122f465a23d882c67abeaa2546a68055b55/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/bf2b533d11b4cc6c69d74e429b9f791d86ded057/
    mips64el |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/accf822f3cf6e4e7990c5bed2dbf553215d09b1f/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e95c8cff40c87f167f82e37430ebd1f37c8c242e/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/72a2fbfeef87bc7ac4d53712b337a6510151ac0b/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d0225677ff4551021d931045e83e0850b52b446d/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/2a63ebbdc87a9ea1c71488b4737b562efecd9dbb/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/1f172f75bca45eb841d8f75c77e8e357f9e064be/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/eda5c6c43da40a342e0f545a348d2f865eb5ccf2/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/4753870c05caba91e0b1bef91ed053bd9013b179/
         sh4 |                    perl-5.22.1 | NOK | http://autobuild.buildroot.net/results/dee0700d35611bdfe58682404388b9c2a92ada74/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/da4c6e3b3223b8cad7143f9f329b0369a9b9eb28/
         arm |        poco-poco-1.6.1-release | NOK | http://autobuild.buildroot.net/results/cc392a6e294b9eed697b205329f8146a28e423e2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b9b5916cd20807a02baade282f968fbf1bdac83c/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1c9a887d8b62076be8cedf518e8fb9c15b5396a4/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/09d53e65af2150bf4ba8dd746df9398f9036b6a1/
        i686 |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/91e59383b00c43bb139fe651638d1f4c6d871045/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/cf9678f85a97383a5417da6c0bd24030dd94b7b1/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/675c1c38f9d9f2c188298873b1699b54bc0c80c1/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b5b28a244027d242551c12a61d090c3562923a2d/
      mipsel | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f0a6187c118694122a8d9bdad6bf74963832b50c/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/700836b2d179aaed3e5616b5f2a1d18ea5a6db07/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/041d3755a983c7de4578f79004eb85e5c7f4d381/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/857b6ba90721888469d264a2c24fb232067b0dcf/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/9b78d3ccaf7dc42ccd473aef9388b2023cd7a153/
     powerpc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/60c4ae91afb26b044235c0e5438e2030b02a9fd7/
     sparc64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/24f214ad71b6dc02d91f0cd3956c614fa7226ad8/
         arc | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/8760207d46eb9816dd463a6b5c5feed1b2900eec/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/f831b1af51aa7ba6d9cc7f9cebf363823a998f48/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/031b1e3b71da6d6cc222b621b6328b75a9d6436a/
         arm | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/833380d7c357b5faf2c11f4b97e63e4e78886239/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/19fad56555a58147a359bfd9b83a71516f4d6b86/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/ee4e7b83e892d1c71f460d2ff27911b469ef927f/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/85845fc75c8663e5f8782e4514353f954053716f/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/93a54d553a0beee641db9e8237c7f4ccab40c09c/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/8175c70f8019d708bc0d9c96cacb135fccf21c21/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/879d822788fce6c421d549a9efbc6e558f0acbd7/
         arm |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/985f2a61aa3b4e77b8b1404937641667d359bafe/


-- 
http://autobuild.buildroot.net
