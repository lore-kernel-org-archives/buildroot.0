From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-12
Message-ID: <20140313073010.C4064101B8C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-12
===============================

        success : 64 
       failures : 53 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

               netsnmp-5.7.2.1 | 15
                 httping-2.3.4 | 6 
                    crda-1.1.3 | 5 
              host-scons-2.3.0 | 3 
                  libcdio-0.90 | 2 
                     wget-1.15 | 2 
                   ptpd2-2.3.0 | 2 
                 mplayer-1.1.1 | 1 
                    gpm-1.20.7 | 1 
                  pango-1.28.4 | 1 
                  mysql-5.1.73 | 1 
                elfutils-0.155 | 1 
                 webkit-1.11.5 | 1 
                libesmtp-1.0.6 | 1 
       network-manager-0.9.8.2 | 1 
                directfb-1.6.3 | 1 
                 igmpproxy-0.1 | 1 
                   systemd-207 | 1 
                 cairo-1.12.10 | 1 
                 lvm2-2.02.103 | 1 
binutils-a934fe50786aa0dc0f... | 1 
                  zeromq-3.2.4 | 1 
                 host-gdb-6.6a | 1 
              gst1-libav-1.2.3 | 1 
             dosfstools-3.0.26 | 1 

Detail of failures
===================

       arc | binutils-a934fe50786aa0dc0f... | NOK | http://autobuild.buildroot.net/results/856dfe50b8c0c703f4fd11db792ada4031b6abe7/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/c90e12940307ed1b1384409805ff38e3eefbda53/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/ebca95bdf1b4ccbb002d75b6728c7fea8b547445/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/de6ea108a67a6e03f8bfbcdd53280d15d367c2d5/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/3387c55e8e16f0b16f0424cdf58a951499791152/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/5e6f48b74b771b18a31cbb7cd1f70c5b10f6fa14/
microblaze |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/ae07f10db418cf57b3494afcdfee4d34209bbff1/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c8cf9a374e5e4c0f6de508e0a04e0488ecd9ba4d/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/c54b40648a381aaa887df2889198c1c3885fcf7b/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/bb3ecb0297e26c685700a871f68c40343a042d78/
microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/bd65616d655b999ff49b59b2d08d9bb60f0e9f1e/
     avr32 |               gst1-libav-1.2.3 | NOK | http://autobuild.buildroot.net/results/77923b6b64875e3401b744c2669f84667293bc30/
      bfin |                  host-gdb-6.6a | NOK | http://autobuild.buildroot.net/results/1c33376bd793fd067ce8aaf001f558e1d0da2e76/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/096a91599e3290807cc225715df90a57e61f192b/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/b8cef79d8e0ed303258e3503b4449a8d17d189b1/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/29cb297d5909381012ae3d37fb80c1386b456506/
      i686 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/979e3afd4117eb5331e810183de0715384b3771d/
  mips64el |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/8a46e60c5efbcecba45aee8980d05711fcf3f879/
   powerpc |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/c58e9c64880d1d2d94b800396da2afb827f8d9e9/
      i686 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/9171a4036b0cdf1cc4085b616978fb2a5733c610/
      i686 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/9ce60c029ad6f696bdaf5e0f60236794ad94f712/
     nios2 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/fe47cbd65f9465821fb8758d9fb9114f3e062724/
      bfin |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/3dcb26947d7eee7ae4f17a082a144912c44f0526/
      bfin |                   libcdio-0.90 | NOK | http://autobuild.buildroot.net/results/92b6513a10bed9018d64e1347c99ff6db96990eb/
      bfin |                   libcdio-0.90 | NOK | http://autobuild.buildroot.net/results/d4c573a4cbf563311333b5f1567160fd2a7cf37d/
    mipsel |                 libesmtp-1.0.6 | NOK | http://autobuild.buildroot.net/results/5cf145d3f9c78bef1f66fe9b1831723de8b4969f/
       arm |                  lvm2-2.02.103 | NOK | http://autobuild.buildroot.net/results/d550ce5c19d9238396737600568fa65f50e52b61/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/230772ae5212b1abe201ea9836f47052fe46b1f2/
   powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/65531d4d9126b66218f7464f722234bfb44bb96f/
      mips |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/c445b790c46de16ba91321ea32917e25f781bf7b/
    mipsel |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/7579fc4af150a1c8ee4e1d6f214642eee7870100/
    x86_64 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/2825ac6c420b4194bb2a86b1c6352bfb6a35da9e/
   aarch64 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/b7203495490819dd57d86b7b5ef294d813a4f6f6/
      i686 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/3c3d9b63c7fc433fb43e14e68d66e242893b5ffe/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/150c42a49a9a3ee15cf29a9177f2f211c63c813b/
      i686 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/6c688a48356b2e31305bd5b3f05c6bc7452d0527/
      i686 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/adac6078064b3e14fa027c78cb3041e91d894005/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/a78fe270243ad5a317004db4040b612c33b7c5ff/
  mips64el |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/cbd1d1f77bb3d2133d5eca0f00ea2974d64c3748/
microblaze |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/811f9dc62c706487a7b4d865f386981e4f25c814/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/447c6ec94e830289fa123b6682188635355cae72/
      sh4a |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/6638a84048ba308a1714680686c9a4779c1bffeb/
  mips64el |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/6c53586fd0579e6abc453ac1279a4fd342aec2a3/
microblaze |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/67a03e3a5526ae6ed211242ebcc276cf8990788b/
      sh4a |        network-manager-0.9.8.2 | NOK | http://autobuild.buildroot.net/results/162fb30322aa797718df39e2527a0508dbdd71d6/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/543e0d7d31ebc9e4c0e86ba75a7ded6604ba38c6/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/0da973e7c7e88192b498535ed18338ba0dfe8c5d/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/eaa615830a6b4cf3da88e71315364ad3e380f681/
       arm |                    systemd-207 | NOK | http://autobuild.buildroot.net/results/8f88c3d4794a8a4accb1f596546b34737bbffe16/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/1ab357d56f014c3133437ce2061ed2dd4f6b1a28/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/52d41002769b457dc3833b488164f9d1ee0f38f5/
      mips |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/1ffda5ae1589606f681ea51bb9f2e1360e65f749/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/182980d0f3d1aecaafdfcd4f4753efa092267cd8/


-- 
http://autobuild.buildroot.net
