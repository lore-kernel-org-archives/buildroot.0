From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Jan 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-18
Message-ID: <20180119070007.E3CD8208FF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-18
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 252 |  40 |   0 | 292 |
   2017.11.x |  25 |   1 |   0 |  26 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

open-lldp-036e314bd93602f73... | 6 
                  boost-1.66.0 | 5 
             bluez5_utils-5.48 | 4 
                  cc-tool-0.26 | 4 
         libcpprestsdk-v2.10.1 | 4 
                   gconf-3.2.6 | 2 
               host-efl-1.20.6 | 2 
              swupdate-2017.11 | 2 
           cups-filters-1.17.9 | 1 
               domoticz-3.8153 | 1 
                  ffmpeg-3.4.1 | 1 
                     gpsd-3.16 | 1 
              host-erlang-20.0 | 1 
                   jamvm-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                  physfs-3.0.1 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.11 | 1 
                wolfssl-3.13.0 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/ffcfe6f625f00f72a12a03b849931ad340fb00a2 |     
     powerpc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/a1a1aae730d2926f0cd524d03f7ba843acd16f7e |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/0215aa08b0f6591a4d57543c7f05939f293fea67 |     
    mips64el |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/c243df1513059dd5f654f73c12d4900d98d7068e |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d3f55485053c810fdbf4650ecc10f1dabb9c2a37 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8d78edfd19faab1c03c5a908b2d0f88e55dbdf15 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6900da07cf1b8d7dfe013331012426cbadb26b74 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/7c36ec88838696bda8481f6b8c6b959fe3f32a7d |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d0f98ec53494f60c1ab055ba2e4ee4eb5358252c |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9f5d374d995654c035336012154506eb60cb290d |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/90facbea142d0af9abc0e3e8eb5195c1b9d173c1 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2977c87299cd4afc0bd2b4acdec6744f3d196c12 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/d46e3e4f2e644ebd4b7cd21be236ea30c7461c31 |     
     aarch64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/725695ac43eb5638095d181bb70cccefee4759c0 |     
        or1k |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/4ca22b8ba1e1aeb59120210cd0b2ef8330cd5d81 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/f9da9c165faba0b3cfbe142c8bbc6e74500afe5a |     
         arc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/867d2ebb52b5f569a58bf2be71e7b64ece8cd686 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/048f94f8b415089f55e53fd477c71cecbcd7e1db |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/993ef80fa0447922115e49291a7447909d980dab | ORPH
      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/03404e362a4fcd2512f061c783b81ce263018b02 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/3c0d1fe61fef410fe3ea1bb229a69ec906a873cb |     
     powerpc |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/39a8b8e512e42354c57a9cc84aded42fce21fcd2 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/432d95f34cdf3e4d587df982faf46de46aceb764 | ORPH
        bfin |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/15be512d4cade5d92936db64d19c970a2905be99 |     
        i686 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/869da7cacfd453dcfdebebcbde77a739ca5904ee |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/53d65aa5f102a533e98d7e74477218e31bc20a7e |     
      x86_64 |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/bb2e37513bbf66f3628b829493fe38e48fad28ab |     
     aarch64 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/c047c6d39e55f42ad89e4c93a749088ce4a24003 |     
         arc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/4a3602e8fd23d53eeeb16dc0c2fd9c5e5b0076dc |     
     sparc64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/d4af106c16a950cfdf2ec2751f8a37e76fbbac13 |     
     aarch64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8a318f4c20b173981cbe950a12ee8d41ee4a79b8 |     
         arc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/9e8bc5c852c663017b5871be4aa06e3932d8fdb0 |     
         arc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/3ffd173dd05f9b3646cd14625a71fb7987428145 |     
       sparc | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8633a456f2c3ed1337cb6a77e2d5f8d3900b8060 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/62b5e9e77fe75b191df9e7dfc7aba43800c99204 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/6a7f6dde0f76254803184f81ae470a835eb71931 | ORPH
      x86_64 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/c9beaf372cd4dd194101d9ee5f0669777eaddec1 |     
        i586 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/0e9634efe5964557bd1127e3adcaa5b854d2b1dc |     
      x86_64 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/286f9c3f6d7dcb974a931378be696eff969dc438 | ORPH
    mips64el |                 wolfssl-3.13.0 | NOK | http://autobuild.buildroot.net/results/4b4dd36b0836c957eb3f5947e5187f747f0dbcb0 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.65.1 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/343c0bd653a411d43b41d292df4207784eb2bab6 |     


-- 
http://autobuild.buildroot.net
