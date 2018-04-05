From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 08:00:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-04
Message-ID: <20180405060021.4167A20726@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  12 |   1 |   0 |  13 |
      master |  86 |  38 |   1 | 125 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.3 | 1 


Detail of failures
------------------

         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/f2a81496793e22adcd3d21dd74c4fad49cbb4517 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 11
                  host-go-1.10 | 4 
                     php-7.2.4 | 4 
              keepalived-1.4.1 | 3 
                  udftools-2.0 | 3 
          usb_modeswitch-2.5.2 | 3 
                  cc-tool-0.26 | 2 
             expect-2014-05-02 | 1 
                host-libsodium | 1 
                  libkrb5-1.16 | 1 
                 mesa3d-18.0.0 | 1 
                 mplayer-1.3.0 | 1 
              openblas-v0.2.20 | 1 
        python-yieldfrom-1.0.3 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e37274027fc2db47d0c4102b93d288b482d72317 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/239847bb57b259e9415f7a61de5471e772935d48 |     
         arc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/1ece1747f5d77c49db1ea022d53a229360cd7608 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/00bc7507bcf0792eada3311326380679acdfc6ad | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d0dcf0b393d0d5044932c0b45bdf0491bb4ea25b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2ba1eee95bdad910549ef64fc9a075d2136b4936 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b20b6d1c28fd48e9944f5f9a5a607fb8ad584e5d | ORPH
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/7be1dc32c9e0bb02d86c683846e8809e3bc74e45 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a536f5947b3b70fdaecad1af5542572c504ad046 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/0ffbf1e8d181c9463847a5b2be6f9baa18face24 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/227197e7540bc38bc5729a47a88ed6536139f757 |     
         arm |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/0e19af38d74aa74919a11ff1ebdb3b8c1a494b33 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d42d6d8666ccd11adfd421777de863f54cceaf32 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/ffeb7a488084ab341523d27d261de56615f66e19 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/fc7567aac50f3aedc7205f04f378100beab0430e |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d640a280530ba57da37c76a805c60c7a57920bad |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/afa0c3aac50cb6449f6aee6b7058f57d8cb8412f |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/54f9108d2415672a78b87c848f2e24e4dd3ce802 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/bd0663e0166c0afdbb812aa3308eed6522401d91 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f57d7c86b4aaa55580103d367253177a1c58eebd |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cd52ee3e55998e2bfa5ec34295746972e6119dbf |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f50014209e107fcd2a6004805ad3a605aa4f2269 |     
microblazeel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/35b369709154adee1266fbd44551599eb5584e54 |     
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/f6a6ea52da5acbe0ee4cf739008c1ffefc755862 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/206cf0898e7ab10027ae6dbf1847b60cf824abd1 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/a26aeb0603711d4402101f7c91ef95816006f6e5 |     
microblazeel |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/088929a2ae0a153bdd54124783659363a265984b | ORPH
         arm |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/da06305bea7bcab735f5dadfe08cfcc64233d6e3 | ORPH
microblazeel |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/a35f6a53d8581c34419107ca8b2d7df2bd53e810 | ORPH
       sparc |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/889d2c1f509c035cd506e36061939bfddc8f1500 | ORPH
      x86_64 |         python-yieldfrom-1.0.3 | NOK | http://autobuild.buildroot.net/results/0a99c561631aae262c504981eb2c6a4561570089 |     
        i586 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/bd02f3dadb710f03cd5026b9da1d7f32552c6c59 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/dcec1a2357c2e39f03e6f77c9af85a3386d7492d |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b46d3f77dbfa396ccd6dceada02e58d8d7ea4544 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9895e66cdb4ebf2ac935c71268ecca3d747bac90 |     
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/e7ccf6072923cc0c36abc67eab4b2afbc2ec1b02 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/672ab0ea048b31ff0414faeb4aba219714df337f | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/3db7177e6651628cd8042a7702760551ceeaa3b6 | ORPH
         arc |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/90544fb435b75149b9a0c2ddc1319ef254ef4ba4 | ORPH


-- 
http://autobuild.buildroot.net
