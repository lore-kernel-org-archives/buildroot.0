From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-31
Message-ID: <20150401063020.8090D100CFB@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-31
===============================

        success : 186
       failures : 70 
       timeouts : 4  
          TOTAL : 260

Classification of failures by reason
====================================

                  boost-1.57.0 | 7 
             libseccomp-v2.2.0 | 7 
freerdp-b21ff842ef3de583751... | 5 
                      qt-4.8.6 | 4 
                     mc-4.8.14 | 3 
                     vlc-2.1.6 | 3 
                 jsoncpp-1.6.0 | 3 
pulseview-19be0af16af83ca10... | 2 
                libtirpc-0.2.4 | 2 
               qt5webkit-5.4.1 | 2 
      libva-intel-driver-1.5.1 | 2 
                  powertop-2.7 | 2 
                     gdb-7.8.2 | 2 
                     eudev-3.0 | 2 
             sofia-sip-1.12.11 | 2 
                 webkit-1.11.5 | 1 
                 qt5base-5.4.1 | 1 
                collectd-5.4.2 | 1 
           libmemcached-1.0.18 | 1 
                elfutils-0.161 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                libevas-1.7.10 | 1 
                   czmq-v3.0.0 | 1 
                    qemu-2.1.2 | 1 
              host-mono-3.12.0 | 1 
                 clapack-3.2.1 | 1 
                    php-5.5.23 | 1 
                    wine-1.6.2 | 1 
      host-gdb-arc-2014.12-gdb | 1 
               gptfdisk-0.8.10 | 1 
                    fftw-3.3.4 | 1 
             bluez_utils-4.101 | 1 
jack2-ab409a65df95bc261ff72... | 1 
               ipmitool-1.8.14 | 1 
                libgsasl-1.8.0 | 1 
                host-gdb-7.8.2 | 1 
                  snmppp-3.3.4 | 1 
               dvdrw-tools-7.1 | 1 
         lua-periphery-1.0.4-1 | 1 
            python-numpy-1.8.0 | 1 
           heirloom-mailx-12.5 | 1 

Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/46756b4a16442df2320406ed04db8e3f687dfa78/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/da62b1615b3aed605eac14b49b1adfec839896a5/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/2c0fe5588d2fabe6cb3d75e7adf25012fb18d69e/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8e6f075fd249d3f91cd2fdc7eafac79fe317a455/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/7021094140678042c38bd2667bbb4b372ebdb523/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/744ac67ee71ae8f31e4aa493bc80426a3b133884/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4d30bc64730b02170c7c07eeae56aa685fbdc542/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5ba5657f945532704e78bdc666c771b288876bdc/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/83ffb3e2a63facd9b9510231b238102841d1861b/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/82d67e4be0bb0a1230afdec5de3abc8ae6c7dbd9/
      xtensa |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/1f4e94d4f58799a80546c093e7e1dd88633b0a86/
        sh4a |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/083ce6e998154a77dbaa16b3bed08570b745e587/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/1cb10078807fd8fecee3e1c714bab1ee50cf599e/
     powerpc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/3161eb96da66936e2cb3ec6aa5547587c3d90338/
     powerpc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/2267a204e9eb46bcb621f5bd408deaca98709fc3/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/f9d6a51c3cfdc16f64c1a973507e72114f1e67dd/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/545c2224258c4581591572a29504ff48e4dfa69d/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/19d2a800231d4b0d5b8db23357268b2d66decd65/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/bd112661d9caa2bbd72854ccc10341d709e64430/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/da88ebd758b26b1e3fcef0bc23fa2a7d5504cf46/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/35c459f23a35c0d22fc03b2aa22bd1d499ef5b78/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/6efc01ad9d909e2586986454ae7bc6917bb2e53f/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/d2b4fd01c8db2efa64e2c056b53dbebad74c1129/
        bfin |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/677773214a748f9b65f311e40b0611cf4ce153c9/
      x86_64 |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/141378d631f91c8487b9c657be486801266cfcb3/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/55b634663087a2499d306c011e679edc85b373bb/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/7c71e703473cb264f98eaa631f0caf8eee27a07c/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/839e48b865a5cc6aac89ec128c06c2857df0092b/
         arm |               host-mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/a4cbe7c7d5f00daed17d7c1622c626abcb0f52bf/
         arc |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/9fcb968cefe30a48b74bd2403ca483ba1b368728/
         arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/7a137c65189bd2c21f04f281701ccc0ba559449d/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/aca2659808753bfa7ae49a1b64ed7b436b9da999/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/f39329a36d6fc263de3e1605a36ec758920a0e31/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/85379c589939d5813d67188e54c0523cbbf29918/
      mipsel |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/319bd981605e87ec0b571664830d2e97311d5b02/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/f350b73f56c34fbe5f9fdf056861902e1b913cf5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/311179ea09ede5f96457a5d34905b5468f6780c4/
      x86_64 |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/771f7b7e3fe9ae6e3f0e77bbb84eef3b3e555256/
    mips64el |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/cb6a2b753ec7acfc23fbfb34826270b74d06c50e/
        i686 |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/092143df2b91d50850067274da531c713f2ccb72/
    mips64el |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/4cd6aaccde9fb0f80e49133b477f330b601f4a63/
    mips64el |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/8149cf0c3ef3ef8d91b5891591a71691dc3d7427/
    mips64el |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/31406a341b70c3b5d13f0ec8b123daf24a0b0f9c/
    mips64el |              libseccomp-v2.2.0 | NOK | http://autobuild.buildroot.net/results/bd105e821de583e582199aae31fab13ef17e67a0/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/e4057d394d2679f5fc724e13383e024814a8e674/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/80b78b866ab6bb34a67cae72fe44d3f5dc54b04f/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/d154ca018da0c21762ed70acda4f224c50a1d808/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/92538fb07d5226bb8c3d3cc5e1429560b2e621f3/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4dd91bbe2a5efc9d9e4f25ab27339d3032702323/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/f11a20d6c06f82d204abe226bd62dddf2acb771b/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/1003b66fb1dc6084b581d7cdc4f0f724c1427c89/
         arm |                      mc-4.8.14 | NOK | http://autobuild.buildroot.net/results/a9ff987398651a76736468b715a51aef71b1d316/
         arm |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/be9cac27f56e32a229ced7a1d4fcd7f6d819c78b/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/79415273250b4d82e0737590a2e5d45b31e9bc81/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1b374eec084e3ed5740f82673eb2479bac5c524f/
        sh4a | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/bc46f25dd75ada46709e4d7c1fab7081f9fd6458/
     powerpc | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/18740a21afee75e53bf225fd31cf3bd48f8357f4/
      x86_64 |             python-numpy-1.8.0 | TIM | http://autobuild.buildroot.net/results/ab79785fe2040df5698dfbd97cf98e485238ce17/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/38d3c297b50113e32ea76b61df6b5572f755c2f5/
       nios2 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/7e2832b62ae9f0ececcad9530b3519a9c33a96bd/
      x86_64 |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/eb8be67f176c8cc04a0c16b14bd09026f150b318/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/4b137e4ad8cc5c2946d46c4389fa8a958ac1ce33/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/cdc88ea08bad1b33b44385e79d37b85b6068e563/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/23f7ee52ba8d0f48e79e28e3c0c1343ac01ede19/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/086c640e524b7255068cdb918c41b85cb177077f/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/3f5a4f0bbc6a1236b0b5580ed3cc1d52cfa26767/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/3efccd829a5585ca5d1f66cf19eb0e64361bf62a/
      mipsel |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/f43fee54fdee6bacb0aa287d7641b410ed26a7f1/
     powerpc |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/842ea9a36a1bc37e121cba288edba7b5d62a0461/
     powerpc |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/3d30fec27c72f050c6f90b588d76ef68b88e5e4f/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/79c3d2d8173d0917f19c452faeaf458a276d4aa9/
        mips |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/9f77dd368d24d696235077b9ef17d774fd7e5a7b/
      x86_64 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/37a142f63f9d09ef013c547655715efa9b75870f/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/c017e7e4569d4945af714d86fdaabefdcd4549e8/


-- 
http://autobuild.buildroot.net
