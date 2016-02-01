From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  1 Feb 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-31
Message-ID: <20160201073022.2C18E102645@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-31
===============================

        success : 201
       failures : 103
       timeouts : 2  
          TOTAL : 306

Classification of failures by reason
====================================

                fio-legal-info | 8 
                  boost-1.60.0 | 8 
                   fio-fio-2.6 | 6 
              procps-ng-3.3.11 | 6 
               valgrind-3.11.0 | 5 
                      icu-56.1 | 5 
                  lshw-B.02.17 | 3 
              gst1-libav-1.6.3 | 3 
               libcap-ng-0.7.4 | 3 
                       unknown | 3 
               host-efl-1.15.3 | 2 
                 opencv-2.4.10 | 2 
                   hostapd-2.5 | 2 
                 rtptools-1.20 | 2 
          sane-backends-1.0.25 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
                      qt-4.8.7 | 2 
             bluez5_utils-5.37 | 2 
               trousers-0.3.13 | 2 
                 libraw-0.17.1 | 2 
             host-nodejs-5.3.0 | 1 
                    mosh-1.2.5 | 1 
       openpgm-release-5-2-122 | 1 
            xlib_libXpm-3.5.11 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 mesa3d-11.1.1 | 1 
                   systemd-228 | 1 
             irda-utils-0.9.18 | 1 
              pure-ftpd-1.0.42 | 1 
                pinentry-0.9.4 | 1 
                 libdrm-2.4.66 | 1 
                    sox-14.4.2 | 1 
  xdriver_xf86-video-ati-7.6.1 | 1 
sconeserver-3b886c3dda6eda3... | 1 
                  connman-1.31 | 1 
               linknx-0.0.1.32 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    faifa-v0.1 | 1 
          libpam-tacplus-1.3.9 | 1 
                    cups-2.1.2 | 1 
                grantlee-0.5.1 | 1 
               nfs-utils-1.3.3 | 1 
make[3]: *** [all-recursive... | 1 
                harfbuzz-1.1.3 | 1 
                  samba4-4.3.4 | 1 
                    neard-0.14 | 1 
              ptpd2-ptpd-2.3.1 | 1 
        ltp-testsuite-20150903 | 1 
                 dropwatch-1.4 | 1 
code/CMakeFiles/assimp.dir/... | 1 
libubox-e88d816d6e462180f03... | 1 
             stress-ng-0.04.16 | 1 
     host-google-breakpad-1373 | 1 
                libsoup-2.52.2 | 1 
                   mp4v2-2.0.0 | 1 

Detail of failures
===================

         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/2530abe9cfb780d78d06ad1f5d62f66bc95424eb/
       sparc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/bbcbef36cb3a013241c8ba9d18ca8d5fef548975/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a06ade9df5833333a1d010df40ce5728166a7797/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d3e57ae2c030fd288ae81848d4d977415249c66d/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/45781aca2aa25b3dd353dae3b040e1a944fdafc5/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/58f86e7256cfac0523b4a74590fcab8c1ad99033/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/157f1cd2f26b7ad0409221cb10e8383439a64a3b/
         arc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f7a87bc33b794a7129780df53cf8f5820ca550d6/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2c948908f8498a55bbec588742e04474e63768a5/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/39e6fb0fb8eb56c0565d5365d2d29e55f9f6fa50/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/a8fb17c58a8b30b13212fbccc6a1dfe6db651059/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a82b751d178df6ecaca265d0c119e63d2bac18c2/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/e5ac15e24fead96ffe62a0fba8d038e35c172634/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/c90f7688b3b2e07f3232db163dc747c954604442/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/c981a076af9449979c915af9f476ba866484a903/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/09731c883e0f57eefa85be5116f79c3be804c68a/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/bdabfac4f7987d0ca2b183dc849d6387e97d0f14/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/cecfd5dc8fdcf735158b5d2bb2a47cf874987ff4/
         arc |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/f95ffbf606ba0d9ad070b6caf4b4e62294370c49/
microblazeel |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/eed013aaece9d7c663f437bedeb79b3aa3039271/
      xtensa |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/2885a5a73fd1261dd73bf61eaa47bd5076b10238/
    mips64el |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/444e462b7a9e9c7b295350d6e4dd6d9bffadc105/
     powerpc |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/2705d314468cb6f472d9f809301e4addb0879dba/
        i686 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/9a16735c316c474e1ae19cf1cc6522045861abe4/
    mips64el |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/174c0e33f9e6c7bc4db1305a325035089487e78f/
         arm |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/c170fbdc10d8bfc1fb3075fe85c8053eac52eb45/
         arm |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/37695533e7f655c2f3c7b0e20a2c01474cada311/
      x86_64 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/79e7b338eb2974c03b9b6d296e4a710327555261/
      x86_64 |                 fio-legal-info | NOK | http://autobuild.buildroot.net/results/972afcccae0ea373a7024d90095787695a5ea700/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/f2990b47e7d6654ccc272a1d543a4b3522eb7015/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/4bd651c078892b86a00f69e239b37de8690c423e/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/d0e67aa7450af9ddc2144afe9541112b46d1095e/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/6a238d941b72b05465c161ed821ee582c03541b1/
       sparc |                 harfbuzz-1.1.3 | NOK | http://autobuild.buildroot.net/results/48f8cf5a46539dc96e3cf369fe36ee5706e49e9f/
microblazeel |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/269499afc0cbc56d590145d7b57f80fb49eda98f/
     aarch64 |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/b4231d75aedd6c5bcd875ae8c8390a388ebcd2b6/
      mipsel |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/9a8bf3a6f2b591149c2fd1152518132384bfda5d/
         arm |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/b53ca2ce1e41772b533bcdb8e3649a4d089ec2af/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/7e61fb828fb20bdcde2e8674c2b9af002d73477a/
         arm |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/9ee2367f57735ee25d26073452628a4cb0dd16d8/
     powerpc |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/443c19cbcd46e79ab681d3eb8ec990e6304cc8de/
        i686 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/5f9b23cc06d92243cb4f6f04ffd269e0855469db/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/94bfd242bd44747dcc6abd5032cbf7aaef6b2bb3/
         arm |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/5685b0e02c1efbe255fa465499518fcaaeba4e80/
      x86_64 |                       icu-56.1 | NOK | http://autobuild.buildroot.net/results/c15687cb490f77142063778b555ac2b03713870f/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/bc418568f0f1822cd3fdd9c04d8f43055a05bd3a/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/4621d15585e697ecce3ea5c493fc9321672b3b08/
         arm |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/3d978ef0457eb1ba186870fb9df5c7a686ef4dd6/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/b00d7c48e8de92963a6424c178d3af3247e97716/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/2168cccba78486c948000f554fc982bade8c33e2/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/160c6ea8bb573de768fe60b0c7e56aba10b14ff1/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/b2e53f59677514828d7485dd73abefcbc03f1931/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/5e6aeca46ed07bdc72849b2c463f89bc9768bb79/
    mips64el |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/c3699c8cf27f3288ddffd7f06c4cd8b505a143cf/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/56626ee3e2466be7366d1808326c77e14d73c7d5/
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b3e720cbf21d047849fccde27ceb6fd69a947929/
    mips64el |                 libsoup-2.52.2 | NOK | http://autobuild.buildroot.net/results/43f98f64f5f88fa3692df86eb2366b62a7d7de2d/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/93e93858430966224fdf0f2666daf55542c2da16/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/3f96601544adfe8a1c58d70b3631297769388173/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/383f2d6bbd7a393f651ebd9eba8bc4eebd8b7889/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/8e24c7e9a0b7b7b94b8e05e2e6fb7b681c0285f0/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/673fc602770a596c43a46e4ba32ade38145bc553/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4b39f2c5ff93106b47a1d8271e689a3f708b2ae5/
microblazeel | make[3]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/ccf3aaa201854f9e4c9d6f73943448f8921560ae/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/f12e7cbe42559e03031dae0aaa3f0c5e46f3fffb/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/397281b493f18808b00341f3041b7d5083f1a1b2/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/2636cd9fd86f661c177be7bd79412f3c9ccc8c29/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/97b00de64fd357ed4748f19b175cc41d31128057/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/808671a3b58e69d3ab4ca03d5ac789508175d453/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/0d53473640a0dd57012604e271e24620ed742d94/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/476e160e29e9d3ad417f1f727771f28616c3dec5/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b33330d6ca9c2ae37690ff2acadf7ee741abf2a3/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/fef3ad1c31dba5cadf8f4e2fc7c1b2a6c860ca2e/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d960ac10c79e42e4c69f816ed2d4dccb03f1005e/
      xtensa |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/bd7138d6f1fd568d4d3bb2d0d9b85b3a41594f74/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/c765226287a247ac5c778a6b1a8234bf9aec19e4/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/22303372f56be204045666d06168dcd94115e065/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/96c71d4e3c422f512a0676cdcf11f62f7cba84d4/
    mips64el |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/1ddbaf93b9a101c19cb83a9b43128972e121c621/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/ab7ed83d60823c1b023c7b76fcbe9c20d537ed4c/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/753b9a5e664d4c981879a9f129a8f3cc41888269/
        i686 |               pure-ftpd-1.0.42 | NOK | http://autobuild.buildroot.net/results/1b0a5c8eb425f70ec8f917c8c592b3a858d9bb47/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/55612745133b35257adf31554a92d36181067f09/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/20a5d1eca7c967651392a6e25663cfbc7e19447a/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/800a50c258716ff5e05e3bcbc1c8ad40b961d304/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/b4a2f7e43e8a295bd670c4fd033beaf00f2b4bdf/
       sparc |                   samba4-4.3.4 | NOK | http://autobuild.buildroot.net/results/45a3bdc1f77ed00418c085b2810a2bf2bf75ec25/
    mips64el |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/d600779113f01f8c69c035f26048283ace7b3aec/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/712b15305b822b13a566c336a2f1fb4d6855a341/
     powerpc | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/3a98a0cc796f633f4596209321bda3cc80799238/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/2a5f245b8a764b7fba155b5abcd9d31b1fa53489/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/f1e6dedb4f1eae5dfa0bffe685519cea55df1d12/
       sparc |                    systemd-228 | NOK | http://autobuild.buildroot.net/results/4c8ec7610833aff3df4190977a9eb08c31eca145/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/a199c4cefbdeb0161b365fa68659339bff89572c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7f4101c4e14e6cfba590f0e02444a9becd704e18/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/c1c14aab7f244381997cd6532b409aa5b8d3e820/
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/e711b72a39bb1956fd20791db624f7912bacb47d/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/84d97bbcc0ea4f8eaa50dd25bf9ee8fdee4b937f/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/33c6e0a0774baa884c4635ce92a079878b91a883/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/c37e8f3c93265f4390c0d0b4a1bfe3b62f4f739a/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/b31cd563407dfcd7eb457bac809d8a505892cffc/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/0c1e7b6047b82bb73ed7bc34ac36440cdd77cb8d/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/82b1f6e4d7b6c624d36ab6deebd029b27b66b6bc/
         arm |   xdriver_xf86-video-ati-7.6.1 | NOK | http://autobuild.buildroot.net/results/55e73f3ff5656b611a8fd8024f894663f6eb913e/
         arm |             xlib_libXpm-3.5.11 | NOK | http://autobuild.buildroot.net/results/3951c06748a3a0ac2c5dd3ca9a376bfb48aade0d/


-- 
http://autobuild.buildroot.net
