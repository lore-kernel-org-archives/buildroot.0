From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 06:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-19
Message-ID: <20190420060056.E33CE2341A@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  14 |   1 |   1 |  16 |
      master |  87 |  45 |   0 | 132 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 10
   libtorrent-rasterbar-1.1.11 | 10
               postgresql-11.2 | 4 
               host-efl-1.22.0 | 3 
                libkrb5-1.16.2 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 3 
               domoticz-4.9700 | 2 
        libcpprestsdk-v2.10.10 | 2 
                cracklib-2.9.7 | 1 
                  davfs2-1.5.4 | 1 
                    efl-1.22.0 | 1 
              ghostscript-9.27 | 1 
libcamera-d5ca33f6c7b0cd1ca... | 1 
                   netsurf-3.8 | 1 
              qt5enginio-1.6.3 | 1 
    xserver_xorg-server-1.20.4 | 1 


Detail of failures
------------------

         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/a16b8ce12f01ad37a2174422e39465b80108ff19 |     
        m68k |                   davfs2-1.5.4 | NOK | http://autobuild.buildroot.net/results/ac2c39a7300fbdd069ac5504148ccb2b065fbf8e |     
         arc |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/a771899e3b051d29df7d2478c13c4b75cc619b5d |     
         arm |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/968b11e115aa2fa3c09943de169112c09e50edbf |     
         arm |                     efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/8efd10eb85f8a698d1e0dc26c375b0c76a767a09 |     
microblazeel |               ghostscript-9.27 | NOK | http://autobuild.buildroot.net/results/7f3c4ba004a85f2636146d8da6725fc24498dfc5 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/52cbc96b877e6d37e90d1900854cf12aba8525a7 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/68718113543996ad429e94dc0a4eab55d625586d |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6f0a0075d686682d6d680b7d5553c96d640e846c |     
       sparc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/ee3c9c135654ccf0c23194e193e69692791b331a |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5c2e58bc9b6ec139f829f1f2a5fc3b5a9a500792 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/bb007f94a6f7f1430668410ce4f52867d3eb2d33 |     
       nios2 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5f1b8261130a7ef5ea5ff1198a1cd3612d636718 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/39764f51252748d0d3751f882b83b1d42c5a5f4c |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/71666a9c7e3e2f69e0d919351b2f0b2484412cd6 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d14e69bd348499d399a4a8d110823ff56bbbe7ad |     
         arm |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/efcb6c0400aa048f166d80d426ea39cdb932b7ab |     
         arm |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/bac6058505b7e386e68842047c5dab78bf2e293f |     
      x86_64 |                host-efl-1.22.0 | NOK | http://autobuild.buildroot.net/results/a04ec914b8a8e21d0006e2cb00610fc46e478ba3 |     
        i686 | libcamera-d5ca33f6c7b0cd1ca... | NOK | http://autobuild.buildroot.net/results/4682034e3a07d5c9bb8014e883476dffbf6d9f32 |     
     aarch64 |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/230be41170ecb86773f9fe21c29a350c6e6cc8b6 |     
      x86_64 |         libcpprestsdk-v2.10.10 | NOK | http://autobuild.buildroot.net/results/43075223f7ccba7824adb2e74f105ecf316a1bd2 |     
        m68k |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/57b2be265c58041186841774a70505fe96f081d4 |     
      xtensa |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/c4f41d7915b2a7ec4407e6b679e3901310e5ef45 |     
        or1k |                 libkrb5-1.16.2 | NOK | http://autobuild.buildroot.net/results/b35dd775015772b0f322f77470debe09d24173ff |     
         arc |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c7e662fbae28a7329f91b01140e031250fc056e1 |     
        m68k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/4c5f89c88b9f8a9d57e189c28b74451f81cfe55f |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/95665c96d1f259a7a8928da05ec9241175b6005c |     
      x86_64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/9432f9411904e25396e50bb1acc6540c7f2b1590 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/7fd9e6fe983bc05c4d301573ea9e0e90d06df811 |     
     sparc64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/8b1130438870db129f552d10c6da4effb6c7340a |     
        mips |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e410a682b9b1cc021db6120becb0511724350769 |     
    mips64el |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/c209fc45490fba10abc82169571e1a792153e790 |     
         arm |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/1ac23a88e8e944ab97a018f2ee1f8fbcd6976ace |     
     sparc64 |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/e096f5fd747eedabb16681d287e94e20381ef756 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/777bade565a150d56237d805e9e8b6714c8d77aa |     
         arc |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/4b2f108b638df4dc56c244dd644c64fe27a58068 |     
        i586 |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/d73377b71584c2f395a7b5fa01657bf6d615a183 |     
        or1k |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/8b7f868509c0c18b82ff045339a3fbca93b6f9b4 |     
     powerpc |                postgresql-11.2 | NOK | http://autobuild.buildroot.net/results/8dfdeb82b7ee65ff4706933a1785fea2165ca907 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/8094639fe54c7cf90c33ac6349595302d2c3ce2d |     
         arm |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/39978b03a51c465cfa4a41c3d6881c95cb87db06 |     
        mips |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/d8856f9641975298dc9d68236fcfedfd33c2b24b |     
 powerpc64le |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/ea0a70c701f3ec961df28e78299b7a535c19bbf8 |     
     aarch64 |     xserver_xorg-server-1.20.4 | NOK | http://autobuild.buildroot.net/results/397f8098c57fc6c88aa12dc8d35ebb1b933d52ef |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                       netsurf | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/4242583d250535ca2b95c1967be3b11145203923 | ORPH
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/7de516f4c787a6e8edb9c0adddc20b981f982a0a |     


-- 
http://autobuild.buildroot.net
