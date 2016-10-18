From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 08:30:36 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-17
Message-ID: <20161018063036.5A093101A29@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-17
================================

      successes : 137
       failures : 68 
       timeouts : 3  
          TOTAL : 208

Classification of failures by reason
====================================

             util-linux-2.28.2 | 8 
          motion-release-3.4.1 | 7 
              lirc-tools-0.9.4 | 6 
                    pppd-2.4.7 | 5 
               libbluray-0.9.3 | 3 
              python-pyqt5-5.7 | 3 
                   bind-9.11.0 | 2 
                  bustle-0.4.3 | 2 
filemq-e59951489045825d6fc5... | 2 
          libmicrohttpd-0.9.50 | 2 
                    mpv-0.20.0 | 2 
net-tools-3f170bff115303e92... | 2 
                p11-kit-0.23.2 | 2 
                     vlc-2.2.4 | 2 
                coreutils-8.25 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
       host-erlang-rebar-2.6.4 | 1 
                iproute2-4.5.0 | 1 
                   jamvm-2.0.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-0b04ed061003... | 1 
                  lcdapi-v0.10 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                    libiio-0.7 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/a... | 1 
                 mesa3d-12.0.3 | 1 
              mosquitto-1.4.10 | 1 
                 openssh-7.3p1 | 1 
                privoxy-3.0.26 | 1 
                    putty-0.67 | 1 
                      qt-4.8.7 | 1 
                 qt5base-5.6.2 | 1 
          shared-mime-info-1.7 | 1 
               wireshark-2.2.1 | 1 
                   ympd-v1.2.3 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arm |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/e0bd7df5c19c7c65ce0009b7c2b4d4104a5c3109
         arm |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/e993940067f7ae841132765f91bfee7248ab125f
         arc |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/ac15afe5d5da4e6530bce6f4e4d5c774e1c66f64
      mipsel |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/58d07e99308758134503f5830b22d6b5233f647a
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/da2660856b374f26cebcbefbfc93786e8d088ef0
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/5dd40d38a0b7aebca74a0b52117a3a55a33e4d10
      x86_64 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/914e2c3124a66abe832b110da33c8570965d6355
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/f1c63d23017eed15e4ad9f7e22e68afcc71ef06f
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/0cf2f0ce5ec386e40ae0c6d7ad7a89206c0b300e
     powerpc |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/7b0c0e788bbdaa81ef2ceaae1c5d009d7d7e7a9b
      x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/844fbabce23bde09be8a7bbd9055504fcb43c122
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/fc820e0b558537f771588b0e1291a8332427ff8d
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/457282cb42ee811f7aaef210e8b4da6e4139b07a
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e51d7d721f2f8614eee155b8e55e0f7f35fcf0bb
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/71b90100f5494b9c1abc5fdf1c69041c79dd6cfa
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/19199671183c34dca6bee2c1cf1050db75d0a186
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/2e35d473b024fdad329f49e6fe840ded289b6407
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/16971c6c1d81f53b77026947256fcbc39da58fce
         arm |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/9dedd39147a11043a7d0e32fe8ea050d8f4ab2e7
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/75ac84a50950a6491471df75d9033fcc52aa3c02
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c990c2bd444f21f5c6f65d54eef791fad0621a48
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/39248d694cac2174de216ccb3b9b000de226fca2
    mips64el |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/3c7cbb53fa8f2eccb24aa3619e08581a6143c935
     powerpc |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/bca403b1ed54c28b5d9468e5f96b906628bcf4f8
    mips64el |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/84fb6a2deaaed9ea91b6fd7d6df02727a727d20c
         sh4 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/5a4c4be9a121d718f2475157a58f886a26d6ac0d
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c3985d221858deee9a6511e88c5e7d28cd08f4bb
      x86_64 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/3b800e4e063688bc3c703a652a1c1918b3d38227
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/3891ac57293486c3c5e7db70519fc3a54bbf9889
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/0d530dbbc12784db15592f909f096f29413d1702
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/77edc7f794ba921b8294a496671804333d4492fe
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/ad3296d69855cfca55b809bd63a7988b2c933d95
      xtensa |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/3beeb33a829c3cc0aa945a4c7011ccfaeabc9936
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/f938fafc3b91b3d4ee2918c3f88cb54c3c2bcb2c
        i686 |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/d3d6a9286ce1074ae21fae52c4cf18ae55097645
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/3ffac937646961d37e5bcc14540387a947be6918
    mips64el |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/f668cc2cbd1b1c62e61f69d8ff06e6a4ef1c4aa0
        i686 |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/7252bf93be8baf60000812ef9d0f202b536d87cd
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/cd17b2e305e4c2fd166dabecba0e13da90930326
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/08509801eba1e122956e15ebc0c5c92a6adbe4e9
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/a3d95783da96a39c1cbdd5080e25d793018f1860
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/df5b7c56672501e8b6ce46f036eb06703af57074
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/2437b1dc378eb81f6a5a7dbe6e2a80cf6fc32504
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/9d5bf3f348dd849402abad3253f4e90e51d4a3ff
        m68k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/ea8e6d0ab69cc59c2ce9888e19dd95e8fe8dac99
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/21cfc3c6add3f036a67a07bf7afe5cb196e98ff3
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/35d964705b62c4df9798b16de1dadf1dd423a5b0
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/9519a9f8cbd01ae1c28f6b80131a3944418123fb
         sh4 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/4b8abb4df4cd010b7c5959bd168e645bde2f9584
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/38aa7715aace5007b7b874753fd1dc202cb999eb
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/c7a902360f3b677857bdce591d414e80458c61e6
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/e5bdd24de14036ce5785fe3eb073569c4f62df8b
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/739b98f7888ef12767067d011409db46aca5b405
         sh4 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/06d933986a39bd59c21956b02eb934f498044d0e
     sparc64 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/e40545897b13bfa75356a94a075aad035166cb07
     aarch64 |                       qt-4.8.7 | TIM | http://autobuild.buildroot.net/results/52e655cb9d7e068894a9c5d79289fcd6a15df197
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/4d2fb164d9fd7533de557d95fc1f834b39210e8a
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/fdf26abbed0014606a7788ce5d60828a0e871186
         sh4 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c941569082c1c76796197d9eecce851daae42cc6
        i686 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/16dffb1b86a1477e61d96b68859d8bbd50609a32
     aarch64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/035487f6e604c3ad6266270b0f93cbc1120dda27
       nios2 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/a58dd45c54c5a498a47639e97ae3abb2290c8c74
        mips |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/8bdeef370812c6ca677b31d8ae3650c229e50198
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/6a0cd145061859c306a8851f303d5e8f49a2d9d9
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c70dd0975fbd2d7fc3a063cd042f508c40b13f80
       nios2 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b82a66428c18b5a2a320f131af58a7ffb76eb28d
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/8f2e4bee1d8a2b10335ecc2f082a11257bd91020
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/9457c806e7ad8dccbc12cb41fc3ea51e758e150c
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/0a4ccf752ed1e81e2416d33a78984b47087f68bd
      xtensa |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/a7e38a7d2c7d9c9c17ce78d90774c68433acacb2
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/be095ee11953523d2287328b1e2d1a418244f701

-- 
http://autobuild.buildroot.net
