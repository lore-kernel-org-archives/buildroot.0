From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Feb 2018 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-25
Message-ID: <20180226070010.28C8620727@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-25
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 147 |  32 |   0 | 179 |
   2017.11.x |  25 |   1 |   0 |  26 |
        next |  40 |  19 |   0 |  59 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 7 
                  boost-1.66.0 | 6 
             bluez5_utils-5.48 | 4 
                 hiawatha-10.6 | 2 
              host-erlang-20.0 | 2 
                    sdl2-2.0.7 | 2 
               binutils-2.29.1 | 1 
          host-rust-bin-1.23.0 | 1 
                 mesa3d-17.3.5 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.27.0 | 1 
                      qt-4.8.7 | 1 
                   systemd-237 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 


Detail of failures
------------------

     powerpc |                binutils-2.29.1 | NOK | http://autobuild.buildroot.net/results/22839bca79e16fc0d76ebc0f3e5ec4a6d23e99f6 | ORPH
        mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/f84ea17ee70bef3583a8e320fbfd63653d03b661 |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/b5b5a7fc4d191bd7bcdc6a753a6ec5969bdd98d1 |     
     aarch64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/5828c2face461d4f3e1e5a1ce198a13bc1e2b07f |     
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/2f8a661ff15ea797d1c03b7bc82cfd47159c9ef2 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/edd0809b0920fb99384f731b748c29eef3f26bd4 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/51f5ff6fdea5e466b231eb304f2906781417867a |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d082bf84191974c664805fc28288dc88c3dcf28a |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2514e27740f9f12a7a2766c7f8f08c0d3a2b6885 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/61c963cd3f1a9480b03731424995f9a972c9d090 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6e8ebe92e028236fc0b4e341e045dfead38d7f23 |     
         arc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/49d3157248f9e73ea5bdee63569ccd7a5e0eb07f |     
         arc |                  hiawatha-10.6 | NOK | http://autobuild.buildroot.net/results/701a22aa4f594be09926ba5f5c599988ad832e16 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/45edf95c0c44c9d553879e0cbb771098d7c63aa1 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/a36d00407a371d70b4551a9717ebd6ff852c8bca |     
         arm |           host-rust-bin-1.23.0 | NOK | http://autobuild.buildroot.net/results/03396b02b7932f08c0a89eb482a65e80c3cd021b |     
     aarch64 |                  mesa3d-17.3.5 | NOK | http://autobuild.buildroot.net/results/a4d7c2720dbe7f6dd7111c507711dc23cc25b6cc |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ec4e7e975c2e8f978a771a1702933d0612e95a9c |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/2ce2d9be9e0699114e3bc3c0434ba05f64741f89 |     
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/4a3cc5780c229a9d5d86543e68cd0819c8cabbd1 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bcf5e27a1e9f9eea2d1688445146df3c50a8919e | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/c363c6fdaecb5d9a9ebb6b8a0930c93df48ce42a | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/3d933b4e9f7de29776e64229e87b7d57c5381212 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/d7a6ced35e42945795ac2adcdf581c4b368bd6a4 | ORPH
     powerpc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/73108d7ff2ba10ec522c5a551bba54db357f95a8 | ORPH
microblazeel |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/e0c434001b5a2a30299af491a6be65f289e157f1 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b0ff91d12a569ae9f6a78b1c62c75fb64e207be3 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/1fe27c28772ae3ba0ba6d33fa23f597db2707d1c |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/46b7c072a64c34ceb6e4be191bddc2bbfd26b3a6 |     
         arm |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/c2985c0471cfb8e396991bce125222d15474d0d0 |     
       sparc |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/d3538deb2e993e53d34286403b9ded3138eb4eb9 |     
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/e57e3bd425f43471283f10824d54b62b9116e260 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

            host-libxml2-2.9.5 | 1 


Detail of failures
------------------

      xtensa |             host-libxml2-2.9.5 | NOK | http://autobuild.buildroot.net/results/7326eb0a682628b99736c326400601513d4c7a51 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 2 
                    htop-2.1.0 | 2 
         libcpprestsdk-v2.10.1 | 2 
                    liblo-0.29 | 2 
               asterisk-14.7.5 | 1 
                  boost-1.66.0 | 1 
                  host-go-1.10 | 1 
              keepalived-1.4.1 | 1 
               lightning-2.1.0 | 1 
                    make-4.2.1 | 1 
                     php-7.2.2 | 1 
                    sdl2-2.0.7 | 1 
                   trinity-1.8 | 1 
tvheadend-e06ffd87beff16103... | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/1dd75446a298b486127dd4469f6d3783afe0767b |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/10b5c5b13971214d0439b715f1a46c78a5249309 |     
        i586 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/b3276b2cbd1e1c260f8df4c3945f51ddc09d492f |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/119d2993d0146c07463585757add95e83ecb2fe9 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/41d50743ee6154b7c18519dd4c8aff4493b850d2 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/65c5a8395e6c788ec85fab7630b38e0e57312303 | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/3946f07c9bbd340d16767ea6d5506ec89972d4e9 | ORPH
         arm |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/e1bba3ce0b3b8bedb42ec0ac740b404a806d41b1 |     
        i586 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/f24a85d7e2dae302f7fcc1dced6625bd5a5f5384 |     
      xtensa |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/9507c5631c6717cf89eee2f6573ea95fbd5398db |     
       sparc |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/98bfc9dd2800557bc3de507352646452ed26bc44 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/d6e63eab14914a086858dce7a0a918f57160e303 | ORPH
         arm |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/6d887941564585c7e87279c65dc91267bb63ec11 |     
         arm |                     make-4.2.1 | NOK | http://autobuild.buildroot.net/results/6d15295f1436641865c4e67f9a8017e3b8c7ca17 | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/fb1e49d0294157a52f50c57e04bdaa054cb07288 | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/ecda641e9b0751660e2918cadeab021e7feae60e |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/326a7e828a7ef0e19fcbbd4937970e22cd1fce03 |     
microblazeel | tvheadend-e06ffd87beff16103... | NOK | http://autobuild.buildroot.net/results/5008618185dcd70ab164f709d0299f828c2bf5f8 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/419af93b874f1418e64e6a9058439350ac655ed3 |     


-- 
http://autobuild.buildroot.net
