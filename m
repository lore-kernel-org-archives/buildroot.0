From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 08:30:23 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-13
Message-ID: <20160314073023.29F5C1012C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-13
===============================

        success : 228
       failures : 150
       timeouts : 1  
          TOTAL : 379

Classification of failures by reason
====================================

              host-libcap-2.24 | 64
           libimxvpuapi-0.10.1 | 9 
                     dt-v18.32 | 7 
                  multicat-2.1 | 4 
              gst1-libav-1.6.3 | 4 
  getent-buildroot-2016.05-git | 3 
           lksctp-tools-1.0.16 | 3 
               libgtk2-2.24.29 | 3 
                  connman-1.31 | 2 
               qt5webkit-5.5.1 | 2 
               valgrind-3.11.0 | 2 
               ipmitool-1.8.15 | 2 
                 opencv-2.4.10 | 2 
                  ffmpeg-2.8.6 | 2 
             stress-ng-0.04.16 | 1 
 make[1]: *** [all] Terminated | 1 
       gadgetfs-test-undefined | 1 
                   taskd-1.1.0 | 1 
                blktrace-1.1.0 | 1 
              memcached-1.4.25 | 1 
               iptraf-ng-1.1.4 | 1 
                  prboom-2.5.0 | 1 
                 setools-3.3.8 | 1 
                  trinity-v1.6 | 1 
             webkitgtk24-2.4.9 | 1 
              gnuradio-3.7.9.1 | 1 
               binutils-2.25.1 | 1 
                  boost-1.60.0 | 1 
                grantlee-0.5.1 | 1 
                     vlc-2.2.2 | 1 
         qt5imageformats-5.5.1 | 1 
    xserver_xorg-server-1.18.1 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                    mosh-1.2.5 | 1 
                   systemd-229 | 1 
               polarssl-1.2.19 | 1 
          libwebsockets-v1.7.3 | 1 
               tcpreplay-4.1.1 | 1 
        ltp-testsuite-20160126 | 1 
     openvmtools-stable-9.10.2 | 1 
       openpgm-release-5-2-122 | 1 
        host-gutenprint-5.2.11 | 1 
      host-gdb-arc-2015.12-gdb | 1 
flann-04b4a56533faf8c8228d0... | 1 
                    ruby-2.3.0 | 1 
      kismet-Kismet-2014-02-R1 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
           linux-zigbee-v0.3.1 | 1 
                libpjsip-2.4.5 | 1 
                   mplayer-1.2 | 1 
                     fbset-2.1 | 1 
                     gdb-7.9.1 | 1 
                 igmpproxy-0.1 | 1 
                   nginx-1.8.1 | 1 
                  psmisc-22.21 | 1 

Detail of failures
===================

      xtensa |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/86131342d0b1714b5b1eba1d5f1716c8f13093e2/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/08576152f4fb4e8e5582e514008b0b9a1c0f4c62/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d43bd0fab8de422ca06bcd2f694fc32c5bf4ca41/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/a069827aa64941caa46d3515b9da28054950313a/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/6a8064edfc6a50e380407d7899110af47759531c/
microblazeel |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/4f8ddebedd9133129bdb6681a26ddc46d32d1860/
        mips |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/6c340252386b1fdf31a527818216d95a012409bc/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/ffa9abc14bdb1ecd7fdefba8c059673d83a3973b/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/8c7f630f3c43b0d026b36683f5667e4052865444/
       nios2 |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/f9e1c627743bf76fd388a96592c9f3ea3a71d285/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/999e18dbfd693809b91deda2c2971cb42a4561b2/
       sparc |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/c0b71eaf9c4a44abe92dcf449f2cee50c2e22c53/
      x86_64 |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/0678ea842aac6f34f1788e0a6e74e3700c167ceb/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/e45ff8f561467aa93f56f531ab5922b26cc202d1/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/6fabd177923de27ebc27051edfa3c1b808f5cba4/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/f18978919e9f678c7b6a04e41f88951ca123c3fd/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/5df0f3f16b1c439bd2f0168e6df206c5dd1f78c1/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/634464da02e258d4b73b14f4870c6c92b846f74c/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/d4f72f011a7f118dcbddb76a2ef68560510fec36/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/39cc0b874e86dee9480a37d135ace690493f8f33/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/2533f7ee970898f4e44ef2f33dfa73da14451eef/
    mips64el |   getent-buildroot-2016.05-git | NOK | http://autobuild.buildroot.net/results/9fc01a959f8820b16d63621840c0cf9653335090/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/277147f0ebc095157492a49b682a044e665fcc40/
microblazeel |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/2138bf2bd9c42028034edbe0164c86e804825556/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/dbdb9a18eeb909e14353528d3c09bf7b413b19b1/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/b6a1ffe9d46217568b5be58c4174e957e40251fd/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/917f0b834c8fcbd430a32376a3b32390a15a9fbd/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/322af1b8a390a38a30ff4f1de5b09077848a8732/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/ce51d8f18c322a827ba9b4f6e1c2536aa1ff1187/
         arc |       host-gdb-arc-2015.12-gdb | NOK | http://autobuild.buildroot.net/results/7df85ee12204309edddccf703df75d312c7381ee/
         arm |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/6a53fd823f08c2c0341983d74d66e2f9c15279ca/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3d98c0c2b754ecdbfccf713947d5ac76a9db9704/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e36d9c9f26b6cdbb965d3f8c4f6d476e119f80f2/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4c94b2c57b1f0a2e7b967fb20ef4fd20a82f0c5e/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7b068cebc909d389083308894a9ec0204321f7e8/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b6a9f7743eb7bf499a0cf1d0bb133f0083742b0e/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c3e95c97945eb50aeaf870b12c1f8e3b7aca113f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/80a7882b7d7e57c87e15c4a34c123c96cc0a7c31/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/941906b6757c59d0858205d7da6bdd5e246f4c45/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2aa388dc4f2f5b363e315d4845d3e7d8ce88aaf9/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/382caa79ebff02be7397de18b5647d51fe4b2571/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b1bb08eac720e9e6f28c4dd15bdd60d0ec2baa3d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c00f29a5bca24a748c0e7eb53349fd2a5b7a8953/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/758db6c87094052526e9a08733fc793418e76ebc/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5a8ce77dd4bb686ae293f733d78ee078de581d55/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/337d33f01d2c6cf85703ec6aed6ea00d673a8f6d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d573a2e9ebcf3c7f79abf45ed8ab17e84433e73d/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cc8338e948f9d131303ad06a9efeb9e8ace58ab5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a50262665376d7213df4c3d269d4914ac911ddcc/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/770296603b9e8d305a37021b54f66b4b338a1d39/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/78d1c4ea1594c5f947e90ae2e5eb6b019e57e38a/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4c030d0808508b6994802ffaf1b30532824725b1/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/360acea553acdd8631fa7d7460d02500345a9ebc/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/36b5ece5667c9ce0370f5d5a4b41700ddd49e14b/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ccf86d07d49de56e18ffbbfd6c73d9e163a23d0a/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9ff509c75433ce6d49fca5a1e3de18e472033009/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2490fc0419e09b8a7e902dcca7a71e3df21655b1/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e3bd77061fc47c1aff06418dba111386a026632b/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c011a57cb2984c588cd1d40a38df133cf825fedd/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fbd26c076f6861c3fcea1f827ed27e51c1231190/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d6f471b88fddf41a252ee741a9af1f218c59bda6/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7d9d406583e1a0e21547d43f37547bda1dbb65cf/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f24c1cf05337d6f37edd3ff395e1ff3a649ca33e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/91cb04bb4089fcfca765207a966b115ef25ba86e/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/44e0b214072695697cf1ba96a327e5c935e09b7e/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/495eb51a3ff130571c62772b0d3bb0433ed19698/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7b5e76f5b84b7c0b7c533ed2ea458828b31c944b/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/af248a4869d84e8de5d012ac8dbf655de593d02a/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ea4642b1e62ddba5337f7dbd0cef576b5a77e3b7/
        mips |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0d394885612b92e0ae38d3089a13046823bd567d/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ce99aa3a87b0b8c0b25a43b96c7d21aa5f20a095/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/894c3408604481e5a4814c8b44301be3ad29b957/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e07684940bb2d169df57d0964637ccf7d233523e/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ccc35b092eb3847f8a7683f3ec3e43386cea6aa2/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e918e6bb4c1399f44d6ead91b588c5ceabe0fea7/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/efe48dfd9e65cf090cf4f8c95a644bb8908f393d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b7ab90bc49c8161d047f793b3226bfb13ce086f6/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b6693e4812cf6a704c0533e03ffdb13679be11cc/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fcb678166208fb3011f162721a0fb129824e5562/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/daa5e6fac6d75ac1d391376032a317bc584d51f8/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1a4c6736f5c654235bc0294d3b819a8421680a6f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/58bf31279d3b0efd31ddded3bd4317c7309b4e0f/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a589327701b9d941a1a3ffbf8ae3ad27a0db4cc5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/029895af08807601fc4394203d12667910aa8f53/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b5a121178825649de849a6cf1111d87579cef80f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1e15b0e8d9a1b172ef28e423fff9c1ce27fd0dff/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a5dac43ed488a07288171e582ef98f9d796c4870/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d4c00ae4fa56b5cc390db0e2ce8a50d89a2ffad9/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/af7e251f8c04d4a6ad0f248e6c19ca6bae4e9685/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/82c0c62507a7ae22b6708fca0ea5b49c623559c5/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e4f29f3615c38dc3252fc35227adbb6f7083a65d/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/58960bc5e2432a9272186861c3607a2cdff76172/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/faf8c737be5b538add6c3ec7a413cfba6ea36ec1/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1c39e2a490da0df9483dced6b2a9b82dd239b50a/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c722b4f36f798c6df4f400f069cef89c92f11de1/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/400befb27b6324a13d952ea28a33d6b9cb63a81e/
         arm |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/bb561084fbd1fba213048931d7a19ca060b564ae/
     powerpc |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/c518a53be2fe1a44bb802c094c278ec6abd7fb25/
      x86_64 |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/2545d70b352a2632fbcbf9a1f434efb67573e671/
        i686 | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/cebdc12ac011cc59e7a7f82cb6b25fbd29e8f0d6/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/d74415af61855e11e3cf9cfbe4e696b44a264f08/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/3a37e56f011ad81632e05ba5258e25f675d85c26/
     powerpc |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/442bec3cac289a7c43182c3ed20986ece272b5ef/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/3e39823a14e6040be565b0992700af6c2ec6aac7/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/478e49d5381ed13df6c55c27ceb577e5404bb950/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d0669039708ce5bb9d16fab22e505030843771f8/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/96b8e53cb8ea59f73880a6f268933b53ee010308/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5eed3e8ce8e4554fa39cd36242eee9cb4f828467/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/ec542cd821b5c5310587041c0e02f6afc4d8fc21/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d208c4cf0285cb358b75739f175d4c4015f59138/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/2e62c25aa53f2734436ebc9ba53752af3eda6997/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/c8d3666cd2248ee295201f12e3d564e019006b62/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/47d91d8cdd926d3c8506de18ebf608dd58b14249/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/e5c85272b5561549dfc478264ee6507bb9ad8c9f/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/e2008a23781cdfcfee50ac54bca7201c2e227c72/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/ca77b16c4baf3b5715df8beca4ad30b28f31ade7/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/8f45d185ed6a5114c382d1b7cd1ca936086b4cec/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/930f0313e85a4b7421ff7362ea5e92db24c70c97/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/2eaedc295fe8baa1afb23a257980fdcc63a3e725/
     powerpc |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/6c9c75923e41406d680c1f628d4095fce3c1060e/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/22b175c0ff355e994c7475ef67c40f121bf4eb6a/
         arm |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/13caa9f3822a4a5232ebec877ef88c926aaa2e39/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/6bfa06de6d4f1ccea35b72e7621a621932a625b9/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1f8a15f820807056e212b4cc2e5078673bc08c00/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/6dc06d889fbc5e712a6d24224f0dfac4b1467068/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/6d3a05785f86e73538141f8d4209a0ba8dfaca06/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/569121dd797753689ec7b1f703b9459052b45286/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/7fbfa3a6f855273e37ac7aba2bb676f3655f477b/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/89dfe50cb1d6e8d6b4eec450bb395e11994d356e/
      x86_64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/23ab81f2db5d8505582cb91b73143ed3f4e65e26/
         arm |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/396ba37551c02234754d99ed7d2c0c90229e03b6/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/ac3409ba906fcba2c7f3edbbfc9a59ce399d298a/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/4f342208a43e21a2c67aebad737c7477f0115390/
        i686 |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/9a6516b073ea12156b2583ecc8d3dfdf8663cf2f/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9299c516dbf0ec284fa0549e5189bfe2b93e130d/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/29b7ce8cfec776553c46679b072a8a93f4bfa17e/
     aarch64 |          qt5imageformats-5.5.1 | NOK | http://autobuild.buildroot.net/results/0219f1505a5cdcfac51f95989e890cba9b14cdba/
         arm |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/72bdab7579f03412a8cff699b5491d8bdda420f7/
      mipsel |                qt5webkit-5.5.1 | NOK | http://autobuild.buildroot.net/results/5f55de72f1b164c7a22fb67c342ad4f0805e17a8/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/492ee3f6805a212346543e7fe017ac1877ee6654/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/ea27365f79dd22061d019f0e9cae6cd017ab14e4/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/e831e3b83035bd3447f48e5d3ce7fb4699ad04a2/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/7173f6ab84da0cd60477baf70d4001231fe29437/
microblazeel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/bf6ab1433eb364d8031dba156f41e05ca9b228d2/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/b918b63327119bdb21e9f80d63faf9a8ecb49f40/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/cfe9e1f100236b890b78fb684ff8f9960954beb6/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3aea896f2f183bb5b667db4c967c4ee53284ea8c/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5f576c7f8d56058a19ed0e7ff4b1ec620bcafb65/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/6cdced29be4f70ba2be7c1072faa38c8ec736868/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/e1e4ae2b71c26558b8fc95e8d1ab675a8d6a3608/
         arm |     xserver_xorg-server-1.18.1 | NOK | http://autobuild.buildroot.net/results/86251f2d4f17ecc980dab4ec8b94d128e4031a4e/


-- 
http://autobuild.buildroot.net
