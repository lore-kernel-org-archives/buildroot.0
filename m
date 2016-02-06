From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Feb 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-05
Message-ID: <20160206073020.BD7FC10317B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-05
===============================

        success : 176
       failures : 109
       timeouts : 2  
          TOTAL : 287

Classification of failures by reason
====================================

              procps-ng-3.3.11 | 24
                  boost-1.60.0 | 13
                      icu-56.1 | 5 
                   fio-fio-2.6 | 4 
iputils-c8ff6feaf0442f8efd9... | 3 
                      qt-4.8.7 | 3 
             util-linux-2.27.1 | 3 
               libcap-ng-0.7.4 | 3 
              libraw1394-2.1.1 | 3 
                   qhull-7.2.0 | 3 
       openpgm-release-5-2-122 | 2 
                    ruby-2.3.0 | 2 
flann-04b4a56533faf8c8228d0... | 2 
               libgtk2-2.24.29 | 2 
canfestival-7740ac6fdedc23e... | 1 
               ipmitool-1.8.15 | 1 
                  mysql-5.1.73 | 1 
               nfs-utils-1.3.3 | 1 
freerdp-17834af7bb378f85a3b... | 1 
              macchanger-1.6.0 | 1 
               openipmi-2.0.21 | 1 
xdriver_xf86-video-openchro... | 1 
                pinentry-0.9.4 | 1 
make[2]: *** [code/CMakeFil... | 1 
        ltp-testsuite-20150903 | 1 
                 opencv-2.4.10 | 1 
                 setools-3.3.8 | 1 
                minidlna-1.1.5 | 1 
                   mplayer-1.2 | 1 
               valgrind-3.11.0 | 1 
              gst1-libav-1.6.3 | 1 
                   erlang-17.5 | 1 
                  stunnel-5.29 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
                  gamin-0.1.10 | 1 
                sqlite-3100200 | 1 
                nodejs-0.10.41 | 1 
tstools-08f6be304040e7b8476... | 1 
xdriver_xf86-video-r128-6.1... | 1 
                  psmisc-22.21 | 1 
               libupnpp-0.13.1 | 1 
               trousers-0.3.13 | 1 
                mono-4.2.1.102 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
        lttng-babeltrace-1.2.4 | 1 
                    mosh-1.2.5 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
             host-nodejs-5.3.0 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                 opencv3-3.0.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
make[6]: *** [libavfilter/a... | 1 
                 mesa3d-11.1.1 | 1 

Detail of failures
===================

         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/449705fcb0329aad5874fde07aae446e576e5210/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/29ce3bef6395fd91379fcc0999bfe7eb44ded72c/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/baf0d21fb1ab22edb10a3806bbae138785dd2323/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/072dd89696008acb871cb8eabee402ece5479528/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2fbc4a523d78af783b05e9d582b2d89321e95efa/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/8af2c9c2b1c940bd94039f57b60c483520311596/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b8e45ca7448be0216d6d43ad65ebe6086f0dc3aa/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2f7622b60273d97150eceb0342e8c04a3787226b/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/80e9bc2e1723a02add48f694222e40c11472a134/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1a5a5e41d8c2287004be1c4f87181f64a5fcbab4/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/93f4e80e677ccc5b4b6009ed42a159b834b0adda/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/15b0a97a6d490132c73eaad0c2bb7f58574c2a69/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4e16707b4fbcf01c4bda292c3f37492d0702d5b6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d539b9f253ead53ecfbc1cf71768e42768be9f05/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/586d43080f1b7ec9638ae4574652ce76cc126d0b/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/2cf81b0632f61df87c52353088776add1424e89b/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/ad724d344d05e7ad268c06f88cefca0440bc0806/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/9b3c039e459e7e5eefd579c37a756b5eae757fa3/
         arm |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/427d4a5a006030abe08b27211aa045e17eb3b417/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/55082abc3073f5d3b84d0563562bda1acbcbc554/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/4f29586d1dfbe96c0bc535fc02b72841acc6d12e/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/e46fb9e3531d0fa6c2a2c0b5df7ba841a3f4e6de/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/3ce84ed4985ddcf2e8309ef3c248908a373400d5/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/0fdd9ed9e78ae0ba0f1ff23c003c72dd45ed1ebf/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/20e08715df5835f3d55b8d061184b9bf3be99892/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ef91d4ce3b03a77b104e49d9f64ce0599a4c2bbc/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/c98a76382a0688842f03bcda3f0f608a23ab1a16/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/01ef01fa9b321026a735631ad239a5cc7a04f273/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/b4d6aaa8e42febe3e27caa8b2817f10ea797d5f8/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/e975a9950e932f8dd55ae1f404f5708a0c8834a5/
        sh4a |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/6cc69b4263e858e316bce4e358e192f10084f4dd/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/3194b504e5737d3f89140261492425f3342f6dcf/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/fcc40fa39889e62dad67e6e510f11b9e26aea8e4/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/b2c2dae987c7186c9a04cbc620417b2bd453c9b4/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/ed055be9253c54df5b671138bd1e9cd82b0c020c/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/1fd9cc0010847080b4927e7cc1355ecb199ed7d9/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2b7d804bd53ef9b54d2124ce1e9549c0556914d6/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/92ee27e880a161e8c8deb9a3635a9f036c38eb0b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4ae7dce18940880920b01c4640085e4888ed4793/
     powerpc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/b692641530012553c6ad79541c135c37516813d5/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/7ec0e7df70f13ab0b182e08ded3e43833fc3e46d/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/a88ebdcdd98be37ab348b331935c3194bb7da201/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/bb94c987d9549774f726f84128b0ec3b718300fa/
        bfin |               libraw1394-2.1.1 | NOK | http://autobuild.buildroot.net/results/db59581c02f3ff04fcc1c69e3477eeef1592a321/
         arm |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/8bf59dd01c87c9a6361ce93b7155f5f324d98e14/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4d057005bdf28162a555279be93c194ebdeafce4/
      xtensa |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/bd0a304af0587938fdbc7d71823902b903d2a89b/
      x86_64 |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/7e7b2af01b84892ed6433060f781a76fa27d2b5d/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/509fc131325c34b34d123e8ca07e55358569db54/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/b4e8e028c59290f45b022cb1faed965c0134aa6b/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/025da0e0ee8c4637b375d9af0c70d3f918e65978/
         arm |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/5f0d5ddd393abd5b1abe82f5131f001cfd766378/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/39703188ea62a26e325056a629eb019d430a1433/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/b22f72ce62db9999f0b9f2df7712c420f068b0d0/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a9edbbfaaee5bb0ca353ba3ef44d4ce1cc534015/
       nios2 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/74618933ad2203772c477ef428d6958fe19e3fac/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/9acbfe0d4465adcd3e4915317e9f7f1bae0e597e/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/661f85742725374d1c78ada3b6ffc80ea9847198/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1cd85f5c545e55fe1b4de48fc5c4d389fbf29583/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/14dad75e9124fac7541f881391695e801eb67ae0/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/3db7944bddbe50f6c6437f6d15076f13fef29ada/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/39ac1d2968b32e8bb719937e799c4ac4160c7d4d/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/a5244488906d6fe35bb0d2addd9d286fbfb4e5f2/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/fb2d0109fbd1b7bafbcb4d63fd3a3e06ed7cae2a/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7bed6df30474dd3f69311c734cfcde180edeeefd/
         sh4 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b225cf4ff3dfd35df52acb4e5bccb535c857ac9c/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/6ed82487304339747afba309d58c57186c514299/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/04cc1574467f52c5fc4219fa2a5ab3a15dcffe61/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/0064dea96b5628f43e5f3b53fd1e753858ff107d/
        i686 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/5c2c4b8b639998ac11061a8ab56d7d6258b02e6e/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/91f3b60727fb4b8abd6c20927572019089c96ef4/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/30c22cd4cf733da877b838865cd5215d3255a6c5/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/fe4fa3f8b3c30d1a1c2a8966bd872445eb129a2d/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/377b969db60187627686233ebebce2c13db0f8a1/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9a2c7184c53438d4f9f1d7ee39a56d134f39ae1f/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/6089ea9fafa74c6425a39b2b0efcb1c3604d113a/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b172e9f576f79eff44e5a8a17889541a9f66318b/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/9cc7c8147fefe29cd36a064ceb19605e54221207/
     powerpc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/f6bdd68b020f22060a9bdce8a8f47b2275956304/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/8f3c333782832a5fbc9034d9b043e05cf45fed9f/
         arc |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/66759d8c4fa96c79a4ab9844b4c25c11db734898/
     aarch64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1d8f50271bf1557e3f1474ea50db7dd7a1a3202f/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/2244cf46651d4246d5a59d68568e481efe9c899f/
       nios2 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c84dfa2997d51cb15d3599acf8f34a7be0bd9e76/
      x86_64 |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/a9e317c008bed31b900e99d955fc17a127f1a86b/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/75fc57fbc83e584418055f245d8a39e24a9a0c2f/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/d12ef3cddf92e9035ac0a24ff9dbe21db1343e50/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/74d005e9b9ec2ad6636d19d1bea2ded26beba473/
microblazeel |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/046638cd602288a08a3534a1dcde1ec5fc957f3a/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/41b930a06ab1be9b17ceaf3abbe7289eb9e1e7d1/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/6068dce64b3a2de00d475c6aa2c8989ea8ea25c8/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/aa2db84deb8e57199ce7d6167fec4e8654b3f9e5/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/89cced6ec536b35cb3eb9fb6cde69237143dd572/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/37282cc58e52b7722b131707c38c4daa7ec5f14f/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b8a685cff12d099ea321d1c63ffddf105e7fce63/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/879dc18e349de7c298ca92452cda692de4943714/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/eec3ad4cb8bbfb09debcee58a6bf54f8cea6c3a8/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/ae569c7c36b92713b46a23a89a6614b62a337a50/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/b94fa95d2b431a4ba0b3efa964599e19191455c2/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/e4a1373bc913870676f487429f2ea69ea0b4e007/
    mips64el |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/19881d4f1ac0dda3d101e257a41c3ac797fd5b12/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/984855e3ab6f04b5fb2607bab6d8acbb795ea20f/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/0d2627204f91889d28c405c34c20f0cd90bd0120/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/9a10eddbbf7e0f5185eaefcb66c2dd94a297bb9d/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/0a5d325bdba9dbe8912672df71657d2a039e600d/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/0598b2dfa1be84efcb56776c7951195482145f19/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/1378fa284d3f231bf3c514219b3f39f498d11f59/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0577510a428739b2c44b53a9d4468a302c622770/
     powerpc |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/98ee8d0d19b2fdfb22cda35a3571f80c20e7a002/
         arm | xdriver_xf86-video-openchro... | NOK | http://autobuild.buildroot.net/results/6faf59d76bed83b6f7ae55d64c57415e82a0c8a7/
         arm | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/1ada5fe37fc0d04d2b3ed9a01827d1974c32cf6c/


-- 
http://autobuild.buildroot.net
