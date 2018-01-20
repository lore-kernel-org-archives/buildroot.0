From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Jan 2018 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-19
Message-ID: <20180120070037.0079C209A4@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-19
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 228 |  28 |   3 | 259 |
   2017.11.x |  29 |   1 |   0 |  30 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 4 
         libcpprestsdk-v2.10.1 | 4 
open-lldp-036e314bd93602f73... | 4 
             bluez5_utils-5.48 | 2 
              host-erlang-20.0 | 2 
               asterisk-14.7.5 | 1 
                  cc-tool-0.26 | 1 
                     daq-2.0.6 | 1 
                  ffmpeg-3.4.1 | 1 
                   gconf-3.2.6 | 1 
                   jamvm-2.0.0 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                 libpqxx-6.0.0 | 1 
                  libsvg-0.1.4 | 1 
            python-pyqt-4.11.3 | 1 
             qt5location-5.6.3 | 1 
                    sdl2-2.0.7 | 1 
                  sshpass-1.06 | 1 
              wireshark-2.2.11 | 1 
                 wsapi-1.6.1-1 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/b14f45447e7a48789140ac97587f6aca45e78248 |     
microblazeel |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/8dc17f707f0d383976389a5d1518e4c428183c5f |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e465e68273bb57bbac2bf07effe47b0659c33fb5 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/2541820ed46e4a1cf887590cbd85cb8a53fa11e4 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/9a2d3d89c4f5433623f9100fbc9666b124727b47 |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/3361a6e701a4660d77aa9b5e739284f9f837edf4 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/98608c1d2c12ce9d7cf8775376a983b48bac0441 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/c889d69b69ba6b35967aca333d0fc605a680b333 |     
     powerpc |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/43da4ae3b7fc26e6712d369d4d030954d0d85149 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/eff2155bbf0b86b9d5a47708da88a2ab8c186d82 |     
      xtensa |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/57b110ab3ae6b10295c8fce4e09cbfcc4223a2a0 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/123aca2c223e68e990b1a3abf24518e8f1eef113 |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/2c60497397d9d55726768ae57025e5aa9628a769 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/307c9865df1263f24eefc4a7e790905b254aa788 | ORPH
        bfin | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/ed43a55cf85adf96fbb6ed3071a977f5beb162c6 |     
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/04a1824cfd2baae68a82566f1308db71b2526d7e |     
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/6003a5006de5ece16fd7c93bf979204a1790db49 |     
        or1k |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/c54a09d1440b24a35dd9756370e4fcd3ce1dab89 |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/81fef610e4d02cd6620f2f577ae6324a0d68ec0c |     
     powerpc |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/fae9ccc37c31c6d1852d0dc11d43f9c6ecbf1fe4 |     
         arm |                   libsvg-0.1.4 | TIM | http://autobuild.buildroot.net/results/741a23874144e794ff1187280c938bf805da0ea1 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/c3f3531a4f5537f1b7bad38615d578569dfb6dcb |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/3b650352260ecd2ef6b381279aa11686fcad5f64 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/516456c8e21759e1ecee4ef9f9689a8f720ecd90 |     
      x86_64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/456cf9b046fa97dfad1700cfaa5a237a57c171fc |     
         arm |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/1bca5b34e5c68cfddb13b957e5c3fc7674656cd1 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/653ee100c0e86c69236cda7e7d56d99eda12ccfa |     
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/e8dbe243d0491a42af2c2feaab0f563c6823202f |     
         arm |                   sshpass-1.06 | TIM | http://autobuild.buildroot.net/results/81d24ff8c4ef3b9216dc920fe1b09d115ccc09b2 |     
       nios2 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/2e4807e2d348c06c3081d499a54ed63863dd119e | ORPH
      xtensa |                  wsapi-1.6.1-1 | TIM | http://autobuild.buildroot.net/results/12124b4502014f0a3fe7e1a2400c5b63a17ad7c4 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

            ecryptfs-utils-111 | 1 


Detail of failures
------------------

         arm |             ecryptfs-utils-111 | NOK | http://autobuild.buildroot.net/results/6dcf83db9cbfb6586b6e939fab0472ad631b87a9 |     


-- 
http://autobuild.buildroot.net
