From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 May 2018 08:00:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-11
Message-ID: <20180512060024.94AAF20750@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
      master | 222 |  39 |   0 | 261 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
              traceroute-2.1.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6a665f1ceb2f0550f7e1d3211e9650159d1e67b3 |     
      x86_64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/6148c8d4186355671a2ea4d509e5788b75c5257c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               log4cplus-2.0.0 | 9 
                 host-rauc-0.4 | 8 
                     znc-1.7.0 | 5 
                  host-go-1.10 | 3 
                   jamvm-2.0.0 | 2 
              traceroute-2.1.0 | 2 
              wireshark-2.2.14 | 2 
               asterisk-14.7.6 | 1 
           bash-completion-2.8 | 1 
                libkcapi-1.1.0 | 1 
                qt5base-5.10.1 | 1 
triggerhappy-b8228880661293... | 1 
                   woff2-1.0.2 | 1 
                      x265-2.7 | 1 
               xfsprogs-4.15.1 | 1 


Detail of failures
------------------

       nios2 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/21026b555eee53c3a65bc48856ac9196df22c718 |     
         arm |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/d384ddcf7e4ff8eb015bbd6ba0c180795bdad764 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/fab0b74c8dc79d7ce2f595e963b7be1e027a5326 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/03d33868b0ee521c404c1386e087b177cd844ab4 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/603440a3ee4167fd6ee26c6ba821d710eee16549 |     
         sh4 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/6914d39c6cabd53f7e433ea70b7e9bd33900e490 |     
microblazeel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7b28072300a9d2940838973189593a447bb35d7b |     
      xtensa |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/4a4c0a4817a49799fc2c943ba602ea2feece163a |     
        i686 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/d62707de8efd071c4db0ec5572987bab4755e0f1 |     
     powerpc |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/8bc9b896663606c30c0f0db8c7cd0d120e0185c7 |     
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/e312dc0110420eba1d0dddd6fca27b313a8e471e |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/a78c5993d79de5c856cb5387b3cebe9f410b8fea |     
        or1k |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/0f20a6401788ee11b89b4a0ff2cc0f9c0b1f6b2d |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/6768a924becf1e062c6bef31ef03db71eae73093 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/162d0e41dc9bc6d6f6594ccee0cb4217067fc71f | ORPH
       sparc |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/8521ebe27556192995584048ac1cc6c9603da4ec |     
       sparc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/2f1ae615d41ef54d388b61bdc3706ae4d80fabfe |     
        m68k |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/db4064d6866e2f96a33ae439be117d0402bc31c1 |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/cfe557537deb0a40caad97caaeba38611304084a |     
       sparc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/175f42fb916aaf9e92d36e23e97075037f911ef2 |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/4e3b874eaead2523c4a02a8e7a6b212364edae5d |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/e71e35fc169a860188f0e48d6661368dea211946 |     
        m68k |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/035cc60c0fd44a5a44de64bfadfe3788ef3c6576 |     
       sparc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/4256ca1cdd017b3f959b573393c934a4ef76bb97 |     
         arm |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/a2537da71db73fb1a2a3e6eef78fc236b7660243 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2016ea8ec8401f7d2b8d58a625c7cc8915d15a2f |     
      x86_64 |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/438a80b27cf1886ad1d0112593d796c4ef94c40e |     
         arm |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/7ac23a3959aec22297695899c0f76dbbc4e114d3 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/b23029bbacd6b70c9cd8f98e63f6aadefe944b37 |     
    mips64el |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/0b7748641368671264c5831c2b48462e08f8ce62 | ORPH
         arc |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/6e3ce426f8b3c78878c889691c4493bd05ba92b7 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/6aeccebcc51c1544f325b6a4f8115437c635429e |     
         arm |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/67171a1974ac5ff90b2e9abb94919c39b61650ed |     
        m68k |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/77961cbaf5896b1b4c90d6d325f02c0cb142561a | ORPH
        or1k |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/8bedc360c247839667cc00bb1f2781b420b07c0c |     
      xtensa |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/0dcdaf88e093cd9886ad1627ed809685ad62837d |     
    mips64el |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/2422766d26dec915b8c8111c9495f73486a61257 |     
       sparc |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/70905e6ae6eaac0ce7545fcdf5f574052f2b9e41 |     
       sparc |                      znc-1.7.0 | NOK | http://autobuild.buildroot.net/results/c952d49092f5f87c3c3b85c01c1ef6edbd3e1100 |     


-- 
http://autobuild.buildroot.net
