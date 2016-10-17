From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 08:30:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-16
Message-ID: <20161017063033.11712102EE9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-16
================================

      successes : 84 
       failures : 59 
       timeouts : 4  
          TOTAL : 147

Classification of failures by reason
====================================

               linux-pam-1.2.1 | 9 
                    pppd-2.4.7 | 6 
filemq-e59951489045825d6fc5... | 3 
          motion-release-3.4.1 | 3 
              python-pyqt5-5.7 | 3 
kvm-unit-tests-0b04ed061003... | 2 
libcec-2c675dac48387c48c7f4... | 2 
make[1]: *** wait: No child... | 2 
                p11-kit-0.23.2 | 2 
          shared-mime-info-1.7 | 2 
             berkeleydb-5.3.28 | 1 
                   bind-9.11.0 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
       host-erlang-rebar-2.6.4 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
libasplib-f7219142e790a329b... | 1 
               libbluray-0.9.3 | 1 
          libmicrohttpd-0.9.50 | 1 
                  libsoc-0.8.2 | 1 
              lirc-tools-0.9.4 | 1 
                 lvm2-2.02.166 | 1 
make[1]: *** [libavfilter/a... | 1 
make[3]: *** [utils/CMakeFi... | 1 
                    mpfr-3.1.5 | 1 
                    mpv-0.20.0 | 1 
net-tools-3f170bff115303e92... | 1 
                     nmap-7.30 | 1 
                  openjpeg-2.1 | 1 
                 openssh-7.3p1 | 1 
                 php-zmq-1.1.3 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
               qt5base-5.6.1-1 | 1 
                    quota-4.01 | 1 
               tcpreplay-4.1.1 | 1 
             transmission-2.92 | 1 
                  tremor-19427 | 1 
             util-linux-2.28.2 | 1 
                     vlc-2.2.4 | 1 
                     xen-4.7.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/5b07978f44fdd89d6e97ca950281fb74c414d883
    mips64el |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/26e2dfc5364dc34cee97cf3fcf0947dc6025daa1
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b788b91663c2392902543f97792f2c6252ec74f0
      mipsel | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a450ff5c6008ccf290a028e6eab7ff26369243e7
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a23d92b09dadc12b3753c951900e28fc19bd14cd
        m68k | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/5f0558235756419eff15b8e909b5d630712f5141
     powerpc |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/9d7a73d67fe960ee0e9d6404ffefb94268a3e858
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1e4670180442c7802d6d8998521a9089e359a275
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/2b74bebda2a379f3c5ac86264ac9a98214d3288e
         arm | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/a0487f1a01d6c28e2f0a24826d3055991743ec1d
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/7998ba1944072f6b3b955a5735092e35ef2b188d
        bfin |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/e2a8897608ec65fdb3c75f62d2846ebe24519ea6
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/875481aa3960d99f688ace20a18648dfd952507d
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/d530b6a74247e9a2ece95c41f108d6e0798c2a3e
        m68k |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/57eb68432a049251b2a4a450ff4b7c2ec4e3c713
         sh4 |                   libsoc-0.8.2 | NOK | http://autobuild.buildroot.net/results/fae05b59da623cd593502e8076003567eb852a8d
        i686 |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/394e22be0ef986463e97b3040dad8f978262732c
    mips64el |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/62d19cc368637e10d9ecb0b8a942a99e32941240
        m68k |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/6eafccaa6aefdae7544789c49699c48dd0409623
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/db555013ab21dfb3d8e9b161e676af9a39f68252
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/3990b4b8774cc54673d1f87ac94d0e62e3c2cb23
      x86_64 |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/f00073f4e13c7e48efacfa11e68af42f4d6eba51
    mips64el |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/97089f61e9c8811b29c9e7f655984b33725dbfdd
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/9a7ec6b1938c03589fbff4bc54e151f058baca1c
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7d0b61da93551ab49ae70210d5886324398b2ab0
     powerpc |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/5bfdfec0d2c248c6e3570319d9b76aaacc41c7ae
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/b02dadd3bdfeaf70c049a7d5c0d1db57ced5a199
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/060fc4b540db748d0483bd9fa1cd58130a68eef3
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/22c19140ae297afdc86504d0d712ebd3d8843acf
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/d0eb14bc2bf11a6f2619197ae71c12bd5c613036
microblazeel | make[3]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/0c26f0cbcfa8cd980d43980b3dd454fb4c2fb170
      mipsel |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/4592eb83efa393f77f5ee014f93a271f2313bee6
        i686 |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/7497730da2affffe0e5b9b790081de10c269f416
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/1f76a163ad33d213cb104274f771ae074a7bf874
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/3ec0218f267a9b9e1536cf7646e40e68dc83a038
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6fc41d8bce3f225633df8296229ff2fd981796f0
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/319720e43b55960a18c55b7294084027171e150e
       sparc |                      nmap-7.30 | NOK | http://autobuild.buildroot.net/results/ae57b94c09b7e1c8092d4f01fbef7a9dc3b1ce5d
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/1ec6f65fe7962549526cbf437b0615fbeab774de
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/08cbae4e0671bbc5abdfc99fff51c03cee9829d6
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/5136464666ca9c3396f9d83705bc005f5742dc64
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/834e8e52047e5966bc93e319e7104b6f3946c885
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/273db585705923af45c8b863b7c1fd1a0a0ee91a
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/9d851953b8db6226352c358563c0b49f6bdf3b7c
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/3f1aa534a42e09854f3b658e725793253aa9bf0b
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/54f1c5a06c209cde9a17784e73fb73e4a4d74723
microblazeel |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/9e25777e88a3365b17577cd68ae0df760688ca4d
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/851fb88c2d4c619d770b457a910628b334559e97
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/4dbad8393a5ffcedd168049f9df7b9449b7a7c98
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/5cef15ac50d821a3617ae06a400e7eb2be0d7fa2
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/319f6b392ec69f5bcb5c4849c188c8e897ba8337
     aarch64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e5a1809a3c0e014d542c888491cfc8e107ac5a81
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/6d88d1d0602e5cafb5ea604125b3531cd235c898
       nios2 |                qt5base-5.6.1-1 | TIM | http://autobuild.buildroot.net/results/0e7ebad2363373ad2beebb7f02e463736e02e13c
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/018255fb3ca904e89850a60eb9e615a62f7fb1c9
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/3e4200a4cbe3377e0c91a3df63dab2e4d555dfd3
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/f4abd6a85dd91298d8d276634878094ebb7a46fe
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/7384569c52ed9c54d394f9799964cb473b5af6bc
microblazeel |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/16471bb9a052369a79c70e512f0d48280cda5d70
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/2473b4f687bd74095d775a9e94494f239730009d
      x86_64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/be2e81b27a21355d7a453316d9df1cd4b0da2106
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/60e156d392be341e919161af093fecc20b97d3db
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/d2bc1c2aa582bd5099ceb509bb68c704de74dc39

-- 
http://autobuild.buildroot.net
