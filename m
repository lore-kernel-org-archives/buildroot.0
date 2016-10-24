From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-23
Message-ID: <20161024063031.A7235102564@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-23
================================

      successes : 242
       failures : 97 
       timeouts : 4  
          TOTAL : 343

Classification of failures by reason
====================================

              python-pyqt5-5.7 | 9 
                    mpv-0.20.0 | 6 
net-tools-3f170bff115303e92... | 5 
                p11-kit-0.23.2 | 5 
                     xen-4.7.0 | 5 
               libbluray-0.9.3 | 4 
                   assimp-v3.2 | 3 
czmq-5205ec201e97c3a652c17e... | 3 
kvmtool-372f583d359a5bdcbbe... | 3 
          libmicrohttpd-0.9.50 | 3 
             util-linux-2.28.2 | 3 
             berkeleydb-5.3.28 | 2 
                   erlang-18.3 | 2 
                 jack2-v1.9.10 | 2 
                    lftp-4.7.3 | 2 
                  libffi-3.2.1 | 2 
                 lvm2-2.02.166 | 2 
make[2]: *** Waiting for un... | 2 
                    mpfr-3.1.5 | 2 
                  olsr-0.9.0.2 | 2 
                   redis-3.0.7 | 2 
                xfsprogs-4.7.0 | 2 
                    efl-1.18.2 | 1 
                     gpsd-3.16 | 1 
            gst-ffmpeg-0.10.13 | 1 
                  guile-2.0.13 | 1 
                ipmiutil-2.9.9 | 1 
libasplib-f7219142e790a329b... | 1 
               libbdplus-0.1.2 | 1 
                libcurl-7.50.3 | 1 
               libepoxy-v1.3.1 | 1 
                 libnss-3.27.1 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/s... | 1 
                 mesa3d-12.0.3 | 1 
          motion-release-3.4.1 | 1 
                  multicat-2.1 | 1 
                  openjpeg-2.1 | 1 
                    php-7.0.12 | 1 
                 php-zmq-1.1.3 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
                rsyslog-8.22.0 | 1 
          sane-backends-1.0.25 | 1 
                  stunnel-5.36 | 1 
             tinymembench-v0.3 | 1 
               trousers-0.3.13 | 1 
x264-3b70645597bea052d23980... | 1 
zlog-6ddb9bbf3ff0123e701bf6... | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4f00ad448b1868927bfb23f4b24d6f8a90c61766
         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/e755ef087c4e20de732c9e660ae5f71beb50e78f
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/215a59c64d6d30c0246565d39f771e147a97ecb7
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/e815eeb7821bc23c41a8fec28bb42159a816b8f2
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/24a6bae192569fd8d20eee9349d4ce235bbc653e
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/cfd9344d6ac8fd72974a93125d3b0155e6586311
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/55ff6000d36ad2b376d2bd13b92b098ba7393e5f
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/7f4cf75a15068559279ebd79cefd92c3491c0f4f
         arm |                     efl-1.18.2 | NOK | http://autobuild.buildroot.net/results/e365159af4ee279d8031cc414876b59a8e43f7b3
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/ef182dd70375baf60782ff54e01841b09baeb42b
      x86_64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/7a5afaeb893c2672f114d8c25c77060d259cdbea
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/6dcbdbc0824926dbf6b865c0879ba8d57ea8fc9d
        m68k |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/798641af79187c4d8ba4b8fb05ee0c29924955d9
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/a805e358127fe59b9201dfcc4e22efeadf0351ee
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/1e1aee724460c9141ff703deb32dcfd2b458bad8
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/58eac650f299fad8690295af619fa724fa57e587
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1943ce8078395bc06b230cbcc05880118be49701
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/0201dfc9dc0e2819094624ace756d7f670fdb831
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/60d9c6507f2095d54b87ed75d6c4d4421a765aab
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/88bed7795f2b0254ad93dbb55d457441e9acdf9d
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/95c15161a83a83d8c6aba130374f7bfab5c8e726
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/9995b6926cac4af124b1ab1854dca0811e369b7d
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/4b2279bf76b7013c59ea6a49ecce83fc5daec5ba
        m68k |                libbdplus-0.1.2 | NOK | http://autobuild.buildroot.net/results/f4d96d91c5d586dd1818db38dcb1a098c794288c
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/202c8644d4fc7683ffb671d5b57a80e3b8e2ffed
        m68k |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/6ab43d3b3d71745ed52712d2a391de272f81fe9b
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/9137070d4bde3daa1b077855647e123faa29054a
        bfin |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/f3baf3edcbb51958862d4e01e0ff0dfd10f99363
        bfin |                 libcurl-7.50.3 | NOK | http://autobuild.buildroot.net/results/f18f995ed2a0d30e318d4c6a1cbcb7693679f537
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/cef01ff0196dd5d7f0b6e4702e0a61e312f72d4b
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ca15170764f201f5f76e009861ea1603a29e187e
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/092c0c3f66695b191328d5c6794827ea2127c09e
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/42552d10549a78b1dad8c4e4402751f4448e65cb
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/b1f5fda16925bac8d0c360c022136d23c8758924
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/348016a513e23d632b13267030e33de1cf8d6aba
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/85c3bb77e53ded46406510f9250a026f14998617
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/830076525c04b950bb1fa823d744b8dbcf0a7ef9
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/ab44b486f409f72613d060223d37ed4cb61cff5d
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/110c2a063eafa137d2c3c38d5e2f696d00a512bc
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/c8cabc6187bee8bcbe67cc43806d11027fa4b061
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/49ef5689f378caa5aa95f0e2c1f5f4966cea306b
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/296fcc8db02571a6b37b9702a008d6cea573b922
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/fa53a037bf43306e2d989d241dcbd8a36631a913
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/d9f27621cf6936bb43d29b4e1e00e6e98845317e
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/73d76be28ef99b3bb5e85c8a1dc7f14e5d24cf68
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/fba49b6d965db0ef650d6552a5d9a24eda7b4f38
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/3ff94a16134e6b34f506dac88ad5bb45310e9323
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/3e83f463ad25aa048370633a0eb30cb0d5be4426
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f695afabadb3a3e46f18c7e182aab0bac23983a3
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/54f84d6dfdf65bbced6d3fc33d6794ef927eebc6
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/1660af3d26fcf06609ff1277bb024148c5ed5db2
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/884f9d4473cd7c2cfdf3a9a55658e956cbc3747d
      xtensa |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/150d5329ff3ef546ae3c76e7ee8ced85d6873ded
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/db3006001a4ffa37b4b93224c24ba8c9631beeb7
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/ae44b8d860338b7c5445e354c30e3db1ea95eb39
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/406d1e9a49ad61a974d16b7540bff4bab7f8f4d0
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/14e143b7d5267f8fbfabaaf7856632c34d4193cf
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/1961bca5c1e1b88139c880ef92ea6ad84a326c1a
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/742a02a10868c44f5a58c563c5f1934fd5713e8d
         arm |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/bb0abc5f16fa603f239043aa824f186d172c4a96
        m68k |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/fa411574cdb8f5725fe3aaeef7cc3461ab6157ae
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/5673065440e12bbf2f02b82a574df9dfe1550186
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/4dbbf9e3914c0cd5c98ff3cb497b0f03dc90312f
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/dd9858ee9e1f9337b7cd974da80c8ccb9c384fde
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/f487f8a0dde7ebbd684ea6d961018bad29f254f3
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/f1d88c7f1d9ea0f0fc0afcdf5b4abb36e33d3925
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/c0dd887fd82ef2613d17ab2b8754a2914e154685
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/cf7f6668b7b631ebff5114f8ce4021bfe48960de
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/e8098ac1ef282ec37aa9c4a4170c29e3aa43b066
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/35aeeb1ee295d31f5ed970e1b30d100b5a65f93a
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3b2ed20eecdb286f593c07bd4a98487a4aabbc32
     powerpc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f4db25a9c49e6ecd6b919990370a51256078e849
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/5c5551b2c2dfae07fb4bfd90d8b89696654ae137
         sh4 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/6c3aec3df40e9d6aae37c832a1160a1ae857f61b
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/05234c2462de088e94666bbddd16632e52866542
      x86_64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ef91bb1e7764fbc2b09b36b4b30f31416c48eebc
      xtensa |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/18be7fe1a106db8c3409d737598f64617e5c743e
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/93d292009cca10a116eda57b378daa7a4ca8c851
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/6510666a93d826c700a77741530f19ce6ff8aab7
         arc |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ec2f15421b29d50f3a6cff62ead23ffe51fd0c9a
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/73aaa3ab0fca6bc40b4dba4bed9773473f42aef7
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/914748800069e76fc22d54faf7450a8e48e4f200
        m68k |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/33f04175d5f7e7ff9abda08291b5de4dc17f4521
microblazeel |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/eb5ba6461311217abe4a9190f99ad53298b049d3
         arm |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/6d480bb1e1466809d8ff119f6b35bb91df00785c
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/c4f41188dd9d39d4387fdf73249faf58a0b8d6ab
        i686 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/5dcc48b9f3badfdff82662121d2482ea22dd09e9
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/2daf09ebc47d4cb575fb943a55d8322e71a801a1
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c75908789d0d683972475e5e465a553a56cd76f8
    mips64el |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/63374203f32d2e9407531b53cd5d8f2665944fbe
      mipsel |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/6279cd6f45f54ed5857a2fc08a21d9e257b6bc4b
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/5604c56c0c92483d28e51eb4e70a9741c3c4effe
         arm | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/f1da8e8d22e75d144a9d178ec7bb44f308a8b06d
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6a58c014fc2d875f881b3c8a70a24bcafe6617b4
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/dfffff28e808a589d6fc6b99c52bd17dd1a04b62
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6e4cbca979898e640bbb8cb1446eeab670dae42f
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/b268b6a1f6d8583e50dd028b9712886f7ebd1408
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/bb6b1239a6c0cfd48522fc26054bc9550c9f8e4b
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/b188131c61ca005671bc3cc9733c0c28d68c3fda
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/33c2354e29fa0814682a055e61b64a1df959171f
        bfin | zlog-6ddb9bbf3ff0123e701bf6... | NOK | http://autobuild.buildroot.net/results/f018bc9c9f69fa3d51935e5c1a89cfe8e21dd991

-- 
http://autobuild.buildroot.net
