From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Oct 2014 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-06
Message-ID: <20141007063015.6BC661014F0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-06
===============================

        success : 174
       failures : 71 
       timeouts : 1  
          TOTAL : 246

Classification of failures by reason
====================================

    host-protobuf-c-v1.0.0-rc1 | 13
                ser2net-2.10.0 | 6 
                   atftp-0.7.1 | 5 
                   dejavu-2.34 | 4 
                  fan-ctrl-1.3 | 3 
               valgrind-3.10.0 | 3 
         python-protobuf-2.6.0 | 3 
                  python-2.7.8 | 3 
                   ulogd-2.0.4 | 2 
        gst1-plugins-bad-1.4.3 | 2 
libshairplay-64d59e3087f829... | 1 
               mpdecimal-2.4.0 | 1 
       directfb-examples-1.6.0 | 1 
                elfutils-0.155 | 1 
                  zeromq-4.0.4 | 1 
               libiscsi-1.12.0 | 1 
                  connman-1.25 | 1 
                 opencv-2.4.10 | 1 
                protobuf-2.6.0 | 1 
           libmemcached-1.0.18 | 1 
                      bash-4.3 | 1 
rpi-userland-ffcc4bd7c4875b... | 1 
                 pixman-0.32.6 | 1 
               alsa-lib-1.0.28 | 1 
                 libplist-1.11 | 1 
              host-erlang-17.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
                    fltk-1.3.2 | 1 
                   slang-2.3.0 | 1 
ympd-a98d760dddff4b0dd595d9... | 1 
                 webkit-1.11.5 | 1 
           heirloom-mailx-12.5 | 1 
                coreutils-8.22 | 1 
                 omniorb-4.1.6 | 1 
                host-gdb-7.7.1 | 1 
freerdp-440916eae2e07463912... | 1 
             e2fsprogs-1.42.12 | 1 
                   nginx-1.6.2 | 1 

Detail of failures
===================

        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6503cfdc6e54334ce70766ffb6b4fd71b392b428/
      xtensa |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/1bbde70a42653f2b4c14592f136159b8e69a1fae/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/78397e85614f43d1d1b3692967f48556d5d04d2d/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/8abdd9e1f6ac9902ade0f138def3822d70367732/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/1da1c6e46dc2f4428c2efbc87ba1fdd23fd66285/
    mips64el |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/93963514fc42d481808b1a046f3e1376286bdae2/
      mipsel |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/914c1835de778602d1f80a4eb505819dec7c1374/
      xtensa |                   connman-1.25 | NOK | http://autobuild.buildroot.net/results/b794262d64cbc133a3d3ff4aa40499d37283ac97/
      mipsel |                 coreutils-8.22 | NOK | http://autobuild.buildroot.net/results/25de685410ddca119a7dbe9b3ce18a43ee815f99/
        i686 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/ea77a9de045afc2f76b03973fb3b431031018d8c/
microblazeel |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/d1badd51028ffc7d099eed1b75f1184bc64581c6/
         arm |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/8d3eef984d8865ddd8c68fda0ad42285e89b1fce/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/6c41f3f1a306a3cb5129a8775c50598dc50ec024/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/1617b42ff39097d91517f852c772b13ade7a9a74/
      xtensa |              e2fsprogs-1.42.12 | NOK | http://autobuild.buildroot.net/results/37273d31605da96ef913ea4ff1c01943645b4ef0/
        i686 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8e81d2f579897c6d6953041f716f944960594364/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/bbbce2f27e40ee42ccda889ba968fa72232eecdf/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/8ed3ca2b9c3657ce9b9374915171cafa057afb79/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/83ad692d3dbef986b9c9dd9ebcc3c1c1b6bde67b/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/4d4f3ddbc629f2d6edec9136e13d171377c1b7ed/
    mips64el | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/3d4e8f1603ba15d552b17685f51f2c2b383b4146/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e7b678bbf072007e95b5afb1a72c85acb3b963c9/
         arm |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/3bb7edd0e6fdd8ce6dec9e04c1018587055f7a03/
      x86_64 |         gst1-plugins-bad-1.4.3 | NOK | http://autobuild.buildroot.net/results/34127147f2a385cedf17257847f32552529e6ac9/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/9865736cd583232a7c7f996015f1b70fa95856b4/
         arm |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/7224fd93bcb36f129799bfb47f1e953d52f43f84/
        i686 |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/7dee9db7f1ec95b45f46b835ba3ff728b92a72a6/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/ad4b1870a68465092f82666857cb08f46b4adbb4/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/3b915fb7e6593f48f7aecb84fccc35d3f1e6e3b6/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/6b5ba07388fe907646a8f16833bdaf80adc852b6/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/fc89f0fd1eadc7b12bae5dda510180074b675ce2/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/7f920fab2aff0e13ea4a9906f0dbb19819803ebe/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/c7083bd061f512a0e4c723dbf567baa8a6132da0/
       nios2 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/c2f2b6d6ba1103a3cd2d47cb37128d26c259ff0a/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/d6b577372501c4cccb6be20735d276e7abb2d7eb/
      mipsel |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/b25dfba47b9334eb99a8b86567f77c496b55d39a/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/9d3c59ea45ad21436db4e516021fde96dc5c1cc4/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/ffc9fb5e1f0b5d3f0ef0643a34a9b095baa698c1/
        mips |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/c534f47fbc07c98d8b181e75e9d170c32c7c6d06/
      x86_64 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/97a9726edbfb5d759521c10691187763c10f4993/
         arc |                libiscsi-1.12.0 | NOK | http://autobuild.buildroot.net/results/23e730aeb39cf9f62501ea4d7005be67d8f7c4a9/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f893ea54fb491cba3e00173c4abad893d647b557/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/b5892a5cb4304916b049460f003990c76f1494a9/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/e5589190a36f2e461af8b01065113b51b39a0a3d/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/1a617eb5c8bba554bca69ed3524a71c2fdad4ef5/
     powerpc |                    nginx-1.6.2 | NOK | http://autobuild.buildroot.net/results/eef358d5f4d9110c4155ba7dd7af7f9b42e6c706/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/6c1859bd2fe2f543816168e5fa9f5d58d6890973/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/b30a96bd71ebca1ac283f0952e9d159bcd853198/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/927f6c712f2cc7fe73638c39e00094e8cd329c9e/
     powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/d459457d0046cf96b56c5fc0660eca326d90401d/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/1d5f6b44da6e54212ca822d7ac0a0f7eebd508ba/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/37bdbf62e452a662f289d2cbfc415c2bfc28f2aa/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/8fd900c71f11b627a0150b201008991e3fe322c2/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/941fe77216f818b38bdea2c5058f614a6e9d07b9/
        i686 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/1a501e58fae21376d87d5b35186d0c73eb69b0a8/
      xtensa |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/e64b0bd68fd972cc4a32f72de9ce84e58b7c7701/
         arm | rpi-userland-ffcc4bd7c4875b... | NOK | http://autobuild.buildroot.net/results/f709d45be676f5c584d1838c5b0bce8bf8539282/
      xtensa |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/5376a3f64c95f14449b956df006741ffeca1350b/
         sh4 |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/478c5ad2f5541adef4218ad485aab4d78cf29210/
      mipsel |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/d182d94562a549c79c0c9fb01777a7cb83d7ab4c/
      mipsel |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/b08cd1eebe6f55a937f5ef393e7329aad6830fe1/
        mips |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/72c138b2746c692906ac304e8f6d4ed99faa716c/
    mips64el |                 ser2net-2.10.0 | NOK | http://autobuild.buildroot.net/results/59dde7a45619b54158f2ad011cbbe05e266ba534/
        sh4a |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/30dd5423c90aac7e105d823aa4d25e3ab2d71f97/
     powerpc |                    ulogd-2.0.4 | NOK | http://autobuild.buildroot.net/results/5c2cbb1cb2ea65161c1b96dcc1b82ff7675c3e2f/
      xtensa |                    ulogd-2.0.4 | NOK | http://autobuild.buildroot.net/results/9b455f2f6fa51f40b5f8abdf23376c0ac4d73862/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/cc5c966535d633aca7f539750dce2014d88dd9c5/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/14ed2d91fc30eeade46dc18f9499bc3fa0adf572/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/9d38067cb9fce2e148b106fda0f9f9f04bf6c4dc/
        i686 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/e709b8fab2566e26e714d63aa7177f073efeb89b/
        bfin | ympd-a98d760dddff4b0dd595d9... | NOK | http://autobuild.buildroot.net/results/0f6aa851e754d6ea573a2bc0eaddcd3df156b55b/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/441176682dbf3c12bb9eb65bc7adee440b033de2/


-- 
http://autobuild.buildroot.net
