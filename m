From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Feb 2018 08:00:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-02-19
Message-ID: <20180220070011.D8175207CF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-02-19
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 165 |  22 |   0 | 187 |
   2017.11.x |  14 |   0 |   0 |  14 |
        next |  49 |   7 |   0 |  56 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 4 
                  boost-1.66.0 | 3 
              host-erlang-20.0 | 2 
           host-mono-5.4.0.201 | 2 
               asterisk-14.7.5 | 1 
             bluez5_utils-5.48 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                  ffmpeg-3.4.2 | 1 
                    gdb-7.11.1 | 1 
                latencytop-0.5 | 1 
                libesmtp-1.0.6 | 1 
                 mplayer-1.3.0 | 1 
uclibc-ng-test-c6d62cbc6050... | 1 
              webkitgtk-2.18.6 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/16aa6bea9d812a11c12a72350f4ea70e82f1d88b |     
         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/eeeee52ab03c2cb25c651f55701d5d3416d79b59 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/0284fae0c650cb2b81116a0ef59cd012f44a8e68 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/38c8d8113e98400d129eb154e84db816b480fc6b |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/67facccc4cb9527d3d236734c291159d85ee2332 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e400c2ef5e409c39c349c7b9e589e77d5a96d36e |     
      x86_64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/2bf0c8879ea377f2e6932d301dd3147bc9618626 |     
         arm |                   ffmpeg-3.4.2 | NOK | http://autobuild.buildroot.net/results/773b4395f255018ce3cdc61ebe37067ead4a7869 |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/044227149df008e1f8330fc255841b63df1e4fc1 | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/2453b685e883da24dd0c43635c37d4ad2a4677c7 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/95b2a4bc8904e5bcb00b6496573ee9207a40af9f |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/aadb956ec378cf40f2645005c952566c71438d80 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/87f430ee6ecc997047414d40ee9ead2acafa24c5 |     
         arc |                 latencytop-0.5 | NOK | http://autobuild.buildroot.net/results/e2146526e8f8ffa9b1efda5dac61e32130593891 | ORPH
        i586 |                 libesmtp-1.0.6 | NOK | http://autobuild.buildroot.net/results/baf24358916a2626a39a9767187fbae22ea7b99f | ORPH
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e55f0c0ac6fbb4e6e839d6d2b145f52ef8f1b6eb |     
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/f77fb123c340296bf94e5f9fd4ada7a34f8e45af | ORPH
         arc |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/bcb926aeaac06fa500dc4b7a56ece389ce941412 | ORPH
        or1k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/dd7f8fff829b20a8890dc0e7ccf6ac512b474ca3 | ORPH
      xtensa |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/8e05fddfb7262cb5859af1f9c7ee76c00be7c002 | ORPH
        i586 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/3414a4395cbf8396d57ea04179018816746ec70e |     
    mips64el |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/6664d01d54231d6ec7899bddbd3e946453d3dd04 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     php-7.2.2 | 2 
                  boost-1.66.0 | 1 
               lightning-2.1.0 | 1 
                nftables-0.8.1 | 1 
                   systemd-237 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/72793d43352ca2d86fca202f3c4e7256ba1c7dbd |     
        i686 |                lightning-2.1.0 | NOK | http://autobuild.buildroot.net/results/5115979577c8dc4cd5574be667e3c741c4ded9aa |     
         arm |                 nftables-0.8.1 | NOK | http://autobuild.buildroot.net/results/dcff5c5185d8002d33edf98eac87ee10eb3e692d | ORPH
         arm |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/fbf7ebbb9502424727006f39e169ec1ee870186d | ORPH
        or1k |                      php-7.2.2 | NOK | http://autobuild.buildroot.net/results/dfc8da3901444398af233d2e8a55a7d4bfa923f8 | ORPH
     aarch64 |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/82166ea3ea26db795881bdb65830c5d3847557f0 |     
         arc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/1dc5759f98385927c078c6f4395f768aaa9b32d8 |     


-- 
http://autobuild.buildroot.net
