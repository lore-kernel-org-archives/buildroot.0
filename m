From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 Mar 2018 08:00:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-06
Message-ID: <20180307070018.8C8F220956@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-06
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 157 |  45 |   0 | 202 |
   2017.11.x |  21 |   1 |   0 |  22 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

zyre-1d949e4bf79b694ea883c3... | 7 
                   musl-1.1.19 | 6 
                  udftools-2.0 | 6 
                iptables-1.6.2 | 5 
              keepalived-1.4.1 | 4 
                  host-go-1.10 | 3 
                    htop-2.1.0 | 3 
                    liblo-0.29 | 3 
           cups-filters-1.17.9 | 2 
             bluez5_utils-5.48 | 1 
          host-waylandpp-0.2.2 | 1 
                 mesa3d-17.3.6 | 1 
                  ntp-4.2.8p10 | 1 
                  ntp-4.2.8p11 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/29007ed439752300d4b2f865b31ec96d3e79565f |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/687fa770f7dfe4dfd0fb6ce5a634cd381bb51019 |     
         arm |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/4d248dc65ece37e724ca4d5e4bf947ec4f0b6764 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d70342b3ee34e3341448795851ba25ec2cd5df22 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3db459154964f716ab90e4941da08805774753d9 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/30a0356f62e32ec0ee3780f1276c57e7a186043c | ORPH
      x86_64 |           host-waylandpp-0.2.2 | NOK | http://autobuild.buildroot.net/results/98c6c8844b80edaf11488c45e54b44165c504cf7 |     
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/9a9be166b975c886f536b19b1e506e6e4cd90689 | ORPH
     sparc64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/5ff45a6f02aa287491b4d131cb11f1a6fa294a7b | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a215353fa8b99772ab49b028e422dfa7f8fd5e43 | ORPH
microblazeel |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/3da77068175576781a2f40c73194ec2f16783d6a | ORPH
       sparc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/9ada8df2b56df1a8ce5320a623b1498264af4407 | ORPH
       sparc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/55583e20bcdf602132c074e08d1a49507d5a48ad | ORPH
       sparc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/1a7ab509440c9acacf606f238b8989d9b4287d52 | ORPH
         arc |                 iptables-1.6.2 | NOK | http://autobuild.buildroot.net/results/e670548c4b250e8a102a4929cafa85634fc79a3d | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/361d8ac2c3cd4e2638532a527292a1a1e021fdf8 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b10f5840948c71050a719148d101e779f1717f2a |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/d26df77a16c99699866b18593bc97557c7119a49 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b423056fcb174cd1a00deb2861031882e1548a58 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/875538ad007410f2ffe2d7804b8fbdc7f23b0e5e | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/10a112cb2bb34f8231c33dfe119ed5a157e51095 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4dbcd2f7cff29fce317aa7f30d17296b118e6140 | ORPH
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/6b6983be25964957b53b447cf7e5fa6e61722b3d |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/5c7efcfd178c0e8c73e7100d897ae3fea01ef304 |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/1bbed8a6582f038137b7629c707d5049b1163562 |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/c66ee5784bac7f63dfeb208d84df665792ceb498 |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/b6cb62167274ba708191cf09d7fdbd0ddef2f9ce |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/9a1d0b43e2add7a02192f3af726bd033435402bf |     
         arm |                    musl-1.1.19 | NOK | http://autobuild.buildroot.net/results/3ea23854c501d12aa69012df9d38d33cd10ac83c |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/d2ac7bc9804cde2eed5a6e967054c1dcf415fb02 | ORPH
     powerpc |                   ntp-4.2.8p11 | NOK | http://autobuild.buildroot.net/results/d0e3fde837d6388c22e23ee87a673ab306cdfe3f | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/36544196a7908a5e9420ef0945d5cff3a54f1b54 | ORPH
         arc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9eda592f130cb95d1aff542e9dcc8a2d02d94c39 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/5d97c7e362900844f0c32ad8a1b1c3c4101c219b |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/c48a8381b16c4cbe9589c35beeb319ba91886aef |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b08824bae68c5fae897a049f093dcac7df97a693 |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4d447d5910a1fd6269fc44972bbdaa53e4cbac11 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4757d2bbeba8ae7463659beb5a582514f52851ca |     
      x86_64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/81d2b39810fd8098f3c3c222ce064e13709096b3 |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/880c9b21b8e45c50432c0a189054596093fd3d69 |     
         arc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/01e24cb62f751142648aa70b906711c36e433c57 |     
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/ad9ad96907bc20edac83ebf1ac7b7aa3fab5b109 |     
         arc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/82172c0289c411fc6d999ca00045549708986152 |     
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/aa08f15ea78a99dcff1acf4728f3c4652a5c3955 |     
         arc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/6d153875808ba16856f6d518211f6755e4e3b569 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                      qt-4.8.7 | 1 


Detail of failures
------------------

     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/706bc5fd72772aa870902188d1f2fab03c3aa57c | ORPH


-- 
http://autobuild.buildroot.net
