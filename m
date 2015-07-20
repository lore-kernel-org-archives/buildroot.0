From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-19
Message-ID: <20150720063017.2400B101C74@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-19
===============================

        success : 230
       failures : 125
       timeouts : 6  
          TOTAL : 361

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 19
                libtirpc-0.3.1 | 7 
          c-icap-modules-0.3.2 | 7 
               libglib2-2.44.1 | 6 
       host-erlang-rebar-2.5.1 | 5 
                busybox-1.23.2 | 5 
             libselinux-2.1.13 | 4 
                   audit-2.4.1 | 4 
                  mono-4.0.2.5 | 4 
                  snmppp-3.3.5 | 4 
                  zeromq-4.0.5 | 3 
             expect-2014-05-02 | 3 
                  mysql-5.1.73 | 3 
           libfreeimage-3.17.0 | 3 
           host-heimdal-1.6rc2 | 3 
libsigrok-fe473123ba836445d... | 3 
                 lrzsz-0.12.20 | 2 
                  boost-1.58.0 | 2 
             qpid-proton-0.9.1 | 2 
                 libpfm4-4.3.0 | 2 
                  opencv-3.0.0 | 2 
                  ffmpeg-2.6.3 | 2 
                bellagio-0.9.3 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                  cairo-1.14.2 | 1 
                 setools-3.3.8 | 1 
               alsa-lib-1.0.29 | 1 
                  midori-0.4.6 | 1 
                 mesa3d-10.6.2 | 1 
              strongswan-5.3.2 | 1 
               mongrel2-v1.9.1 | 1 
                    dash-0.5.8 | 1 
               arptables-0.0.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
                 empty-0.6.19b | 1 
                 clapack-3.2.1 | 1 
                  bcusdk-0.0.5 | 1 
                  bonnie-1.03e | 1 
                 igmpproxy-0.1 | 1 
                  cppcms-1.0.4 | 1 
               qt5webkit-5.4.1 | 1 
                 netperf-2.6.0 | 1 
                  acpid-2.0.22 | 1 
               libcap-ng-0.7.4 | 1 
janus-gateway-c632c1e9da5ff... | 1 
make: *** [core-dependencie... | 1 
                    qemu-2.3.0 | 1 
               libpthsem-2.0.8 | 1 
                minidlna-1.1.4 | 1 
                elfutils-0.161 | 1 
                      atf-0.21 | 1 
           libvncserver-0.9.10 | 1 
                 qt5base-5.4.1 | 1 
                libgsasl-1.8.0 | 1 
             armadillo-5.100.2 | 1 
               libsigsegv-2.10 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   systemd-221 | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/33ef25e4707a5b81083204e0f064570c11d88af6/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/77766d3b102ccb12da9242027a994e199b6b9b34/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/a1edda4f84feb5f04749c6bce17357878d39c0a8/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/837d82b73b49ad1ac7cd37334a973d6074ae3a8e/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/cdf0729496153598e3a2f2903f69ce2879745c03/
     powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/05827b98610d7cc0ebed72c717c89039bc12f2a3/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/cea7e0979682e2f5ddfef6ac0cd0b92048aee363/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/65cd26b5312d56b11fa672c0594915c2c7454df8/
     powerpc |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/b52cb4cfde4629e309aa4771229f5ddc423434ca/
         arc |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/8e78a8a3f2c9d216543eddadfdae7da4ef4b24a7/
         arc |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/
         arc |                   bonnie-1.03e | NOK | http://autobuild.buildroot.net/results/8291d199d76f39c513029a1d63c44370c5e30bb9/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/c1cbe5948392be846da0f1e159b9e254d2111181/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/403f84d8f7e9153e1d2ca5f439737c9612ce5a7d/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a795ef4b3f9041d10cfedf17ebe136a4de82b1fc/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3d53cbbe3c24e408353b81dc2e26236b689f2236/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/8df14bde19a41b78aa6422a1649a570914f747ee/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/08ce250c797aea972d86614d77cd24f60891e0f0/
         arm |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/30dd11b576b590de513031fce5e034353f2f5544/
         arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/51ddc2e6b18de56653ee562c9a611299f469bfdb/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/05d9edd946203348fe3a56d817652e8853fb9001/
        i686 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/20aa7023a36350fb21b6447b71de18efa73e077d/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/c0096738abdfeeaf1dc8cde1e924fc32e2e95aaf/
     powerpc |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/30dbd35b14dbfc29a4c56f3f5d9bf87206b2c4a1/
         arm |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/fb3957f5cdd8161a153febf280344a6a6dd23b1c/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/600ee282e9c15c54cbde8ab0534760a3f2554bdd/
         arc |                   cairo-1.14.2 | NOK | http://autobuild.buildroot.net/results/e516b72cde1a299510588977131ca21708ea2fce/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/208c81f23d0a5287d99c76b6083f9c1e8e4584a8/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/3f1e2d2921d6ddd1bce3a08856b0c01ac76b2ba7/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/ab0c3cbb44699ac26800cab15e9a34c43674da8a/
     powerpc |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/9dc79102c256752a5f93a808e51a28b7324625fa/
      x86_64 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/9bd7a8f767e38a6b85d92592741c5647f7e6bb6c/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/39bf0705ee1aea55028d778b119529cc387d25bc/
        mips |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c0eaa37441a33d26e0233a5e9eca5dfb1493cfa5/
        mips |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/84625b421aefaed17e89e22b2acf55de70351e5b/
     aarch64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/6c8bc2e6a1449a664f7e1f2b5568760ece3f61d8/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/801d73ec1fb3e4d422244dd4923a986634c3d4f2/
      mipsel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/64ff136b1179ff52a22727ae52077a5ae3765f1b/
         arc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/cb614f3344a7e15034409898e95de9578581b71f/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d4eec1089db40c12b00ecf3e7fe242499f9ae19a/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/b293fd88e14006b4cb2ee1845abaf05642497d6d/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5a46e82f4ccde9c531c41ec9ae2f22e93c400112/
microblazeel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5e6010e314bee19ca1eb31600b9a5f45b15c4aff/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/366dc3cd958850f60efb3e322f0d45a97c565812/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/88b09efacd3fb275d4eae0df22dd94003d055c08/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/1afa1502af33802140cff9e403b6f5476102aeec/
       nios2 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/cba62401fdaa5396e381e221507a33d0c3ac2902/
microblazeel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4ef02da93a9ae1b4536315fb9c24a3ba274b4d4e/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d55eaee4aaceaa18108d7677b4299cc8b75e1b75/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/622536dfd78e885f3dcb0cd178d1bd7dffab113b/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/efabece1d3d06002a13c1f8fc309cdf2d5eb0600/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/1a73f557109f54c3f1225c5e355fe7a48c812940/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/5e5c983749cea82d4526d11abe66b53202194809/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/b1c58897820d887df6fa757f20fdc860043a9736/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/823aa4250255559cc107ae85f32d910f80672c72/
       nios2 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/67b9c193507c994387e528ca6a5218e1f1cd1f83/
         sh4 |                   ffmpeg-2.6.3 | NOK | http://autobuild.buildroot.net/results/ef3d11ba5bd927105e6d3b55fd3433329e1e5b3d/
         arc | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/3c9885e01a75530641012466d00a59dad2378375/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/edd97a24064e080bacff344f6a9809443cd79676/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/59cc00e620a3f68f9b5860086008b81f6e11d044/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/ed8aa7b53e2df5d36d7097ca435654e714ca629c/
     aarch64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/e159eacbe513593d9b9accd9c270f4cef3472000/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/7e3ad06e125471c54ecf3ed9e828573f2e4bf172/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/b8af1afb158e6da2200f4084fa989bd49ec84903/
     aarch64 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/374cf4da1904287223a4b91c844410c646452fbf/
    mips64el |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/daaf11b727816c6939b5be3107e57fd0710521a7/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/5137e3391617192736d2a5d244c0dae433b4a220/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/e53e7c3a528b99edf066cff110bf2c34b6c0547b/
         arm | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/8a0f34da29fdfb2807aaa7280759e324a3874851/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/e07565fb59221a91a6a1733bcf569ab896b06b0b/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e1b1c5b2e0de51154fcc70b77b3962010854a09e/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f45ee10679f8675a357c1dd91c5f5881ca693b47/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/359684a9d7c6881cd88106dd96bc94d0b6355cdf/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/4f7ac394ef817ecb3167e02d2bd6cc62d8c1e40e/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/9f80103fcee733fc93ef5e6ce171f6943202dc87/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/d970b991c791c955a5ca64e317d1ba09bc189300/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/a878a9c72f8cd6cb8459005e61667c71132747d0/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/9ef0052515eb9d0271e6e202f2e35740dede8a05/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/c9b81523627420e8160bbdf05870953aa3042312/
      x86_64 |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/39f0c504ad96088c517456a917587a1c7a911147/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/ae414963bdd62dd48d5e8fd93526d55e1e8f046d/
         arm |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/357c06027be9ebe8cee127c7ff5ed7d7bb70c32b/
      x86_64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/6353a7eab60a1b5ee6b4f0c167f35e1078ac51ce/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/0381417382c355e476356997736e8c248e39b6a5/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/84a0d2e2136346c91a6845acc62ad65f23954d27/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b184b5e3f4d45a7fb7331208048f22e165c47432/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/fb333a453b869cd87730e5b55289cc28d9688af1/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/87aa750864c145dcd043596539130d1b1a242484/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/7469590dd7e7ddcd53faa4bbb37908c5488aba7a/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/86dfa813a95755be7b6de278723d1432566432a1/
         sh4 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2234d19968fa30c2fb44fb56a9d2119b0c1c9c23/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/f93f0be26b5a25b953ea7f909037c1f45a83f686/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/c537a76d17012821ed5a6f4170f759efd4d269b0/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/e3c5be7dca753f7494e8680894f516a8cdc89843/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/2bb2e314f23b5ba48bb6e0c4fc7e52032fa5d76b/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/394073e0d85b56e6e470ff7a4be3f0f9fb592150/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/80321de8d4c6c0a00439b07289a5818962128b43/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/51115754531fbb78b0e5f5bb6accf0500cc6bf63/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/d3acbfd70b29e133d1789547773947c96190070e/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/afcd71b977ab02402f5972a40738a791c265c572/
      xtensa |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/6e457349e15f0b768eef9c622524a69f58e593a1/
        i686 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/1acb366a7bc3d8a07dd4c4ecc95960c0af75aa43/
        i686 |                  mesa3d-10.6.2 | NOK | http://autobuild.buildroot.net/results/11f09260428a766d1f274843a9aebe220fd0e988/
        i686 |                   midori-0.4.6 | NOK | http://autobuild.buildroot.net/results/a7266a2ab8e89f903eda87d0517ea0e868eb83da/
      xtensa |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/fa11cb360190b02d08e74997b0abc73079760dfa/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/bcf518235f85054556b5120dc68eedebbb06b931/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8fefdfee16fc8cb0db430ad5000188fea732dcf4/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e73d4737a4a8fe453917fda433f4b9faf0c0e8ef/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/7cc6b8acc4b9dfcb42ab85525a7f3074f133edd8/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/28a72b2095c6a46b97c3b60ce146ccd82079ef74/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f97d4386fae4d7939f417f0059412d0d55553e71/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/ad9ec2e45e4c451a77de483cba62bc6b7420a38d/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/369da0a57f9de4e642ce782ee860e427c7f91415/
         arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/4088895bb9f99b6ae3d92666f10abcf7d7e47c3f/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/bd311e752f7ef79cc576e02fc2f89b8a6a763c6d/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/f80a9fc8453e881c4b37c41a83a3898574222e40/
      x86_64 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/a04bd74f515c1d1fe499222650e9d92c7786caf3/
         arm |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/75d5285473e9bfb742d9c30a89cb61c6b640e2be/
      x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/8d75fe5461ea54fa0e87cc73a580274b54c991fb/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/fe360c95ea7920ced448903626886fbe5e6956b3/
      x86_64 |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/39223353ab8d1f1eb02b4dbd91206f6d6994f669/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/b29545e0d737c6f119d60c4640b66c13f2db1db9/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/3cf277a579a40ef50a7da0b83fc7f0b31251dbfa/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/7d0d8be335fdafd0e745a40b4478ac8cd9f116f9/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/f53d54593dd835bedcb646209251b0b177d034be/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/c123b3b4001f961ce5efe870d52da0079fef7670/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/862bcd33c8ca4134525cda182894214762367268/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/327d3ac8f0763c75c024bdb239304fc14ecd5400/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/f406a42b017316d52d5adf3f9ac1a47d5c4e3b51/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/ed5c5b50df91f1025dc615e9cb2b11a1efdbf3fb/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/cad220d090afbf75bc08a7d57bcaff44631c000b/


-- 
http://autobuild.buildroot.net
