From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-08
Message-ID: <20141109073016.80004100BA3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-08
===============================

        success : 199
       failures : 46 
       timeouts : 3  
          TOTAL : 248

Classification of failures by reason
====================================

                 schifra-0.0.1 | 11
                    urg-0.8.18 | 4 
                   libcap-2.24 | 4 
           libmemcached-1.0.18 | 3 
                 clamav-0.98.4 | 3 
make: *** wait: No child pr... | 2 
                libcurl-7.39.0 | 1 
make: *** Waiting for unfin... | 1 
      dovecot-pigeonhole-0.4.6 | 1 
           host-gettext-0.19.3 | 1 
                    qemu-2.1.2 | 1 
                     radvd-2.8 | 1 
                      qt-4.8.6 | 1 
                 rsyslog-7.6.7 | 1 
  toolchain-external-undefined | 1 
                directfb-1.6.3 | 1 
               arptables-0.0.4 | 1 
                  libv4l-1.6.0 | 1 
                collectd-5.4.1 | 1 
              libeXosip2-3.6.0 | 1 
          shairport-sync-2.1.8 | 1 
                  perl-gd-2.53 | 1 
                    parted-3.1 | 1 
     x264-20140930-2245-stable | 1 
             armadillo-4.000.4 | 1 
               iptables-1.4.21 | 1 
make: *** [target-finalize]... | 1 
               alsa-lib-1.0.28 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/58e9caf416f1bb256b3a6a7ea6e915ee24614f8b/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/3c3c66014a08bed96d12de80daff6adfffcaa8eb/
     powerpc |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/b9642befef82e479cc50839e07114cb87314d156/
      x86_64 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/ec7ff9ac56992d6c9d2090497af734ece2dd125e/
      xtensa |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/e6b5c2c4f0187383467d3bb211ba0a46a2cb9e88/
         sh4 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/f0dc227a2642dc8815280e2b975740265ac22fc6/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/43ce8005dbe13580cea365109df0d785f50c0a84/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/1c6790de66d46a637aa66371b70721efd3ae5bd5/
         arm |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/4f8812e04f3c76ce84f1dc082855b4f3977f2d65/
         arm |            host-gettext-0.19.3 | NOK | http://autobuild.buildroot.net/results/97b69574512ce5e72bd1fee9d620ffb8d700b4d9/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/66fee7cf79db9ef125543425fcbb995f8fabe70b/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ca1f5688f3cb66893c8351351b4e55cf33949969/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/9551004f3a990362f877d7a4606c7481d64d1afc/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/079b759b488bb072afc036055a560866b7d93333/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2b43a01194d3489455e66b11ca140983bfb30b96/
        bfin |                 libcurl-7.39.0 | NOK | http://autobuild.buildroot.net/results/91bdef115f3219b5b20ec4a5b7df998e9ebaa1f8/
         arm |               libeXosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/67fdee0c38086a1cd4759088415b605ac098f71b/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f08c8e5514e054397428677f08fadac5386189dc/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ff8d7fd62a117cdbb964d4b4a8ee71d2abacb8d9/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/5f8cb7f78cddf740c395f24bbd0f364da6ec573e/
        sh4a |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/9af37fbf344b63b60e59ccac21e010cdf0ea219e/
      x86_64 | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/8b557058c7f69378756c7cd81cd632b0f3d871c7/
     powerpc | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/3a270c244951219230f05ae5c2c977faff3308be/
     aarch64 | make: *** Waiting for unfin... | NOK | http://autobuild.buildroot.net/results/bd31ebb465266b17368ba0332f6174fbfd559bbe/
     powerpc | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/1965e6ae361d24a4f7548729caba73193b8e4e67/
         arm |                     parted-3.1 | TIM | http://autobuild.buildroot.net/results/a796310aaca6c48482d50d91fa610aad64aea880/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/913ad894206cfef7d4f42dc7fd3631069ce45ac8/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/89ebf1f14dbf9f3fca4bc9b492f603421708dd73/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/36c1472ab35818e5554ff2f5a249df1141e63552/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/60ee9d0133b27b86a4709237e5ffcbdf8513c25e/
        sh4a |                  rsyslog-7.6.7 | TIM | http://autobuild.buildroot.net/results/836f9ea333b543e1ca081919ad6c48cf851413f1/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/576f92e7bc4e8a36a30e186e00dcccaf242de7c3/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/19e8cfac0d69ea557f3dacb9bf397fc29280014b/
      mipsel |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/43f1cf8a129737476ddd8f7d359ef899b752b2d4/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c5418357a002d6b9718777af206ba3b3e24f4da9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/d4fe11898bc33f1c0c208d68ac6ccb418a642304/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/470558494df2299b4cde7faa61406a0feb6b7d61/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0e13abf9a8eb62c1fc899925ec0e3610544e1f99/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/853a9b64befa466c316ed936bfdc99d3304a43e4/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/bc3d935d7ebd31a54051e0de847d8592a27b04af/
      xtensa |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/319bc128a2219e0a1e49be2de26a8a1384ff3cb3/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c621b88e8c2b4c8d4c59fea5c2e1c099052c4207/
         sh4 |           shairport-sync-2.1.8 | NOK | http://autobuild.buildroot.net/results/384cda48cf05414654203c09d70ed7221af388db/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f991f5e14fb1ecabcc51b7e28fc609047f3c185d/
        i686 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/638efa5f695bd66245a8b9e91556df75b47c5199/
         arc |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/3a1147dfe2336936b5f2ceef88d0747ae8023ff7/
      x86_64 |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/0aeb076b0edfc42851c19b77fad291e2df2808b9/
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/5069016a61843f851befba4c26b63f4aca454f3d/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/694032b21c386c9eb50ba76aa32428bcd5cf9214/


-- 
http://autobuild.buildroot.net
