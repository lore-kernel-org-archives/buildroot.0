From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-20
Message-ID: <20131221073007.A5A6E1010F3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-20
===============================

        success : 75 
       failures : 43 
       timeouts : 0  
          TOTAL : 118

Classification of failures by reason
====================================

           python-pycrypto-2.6 | 6 
                 cairo-1.12.10 | 5 
tvheadend-c7d0335eb10d02b78... | 4 
make: *** [python-pycrypto-... | 3 
                    ola-0.8.32 | 3 
            python-crc16-0.1.1 | 3 
              python-pyasn-1.2 | 2 
               alsa-lib-1.0.26 | 2 
                      icu-51.2 | 2 
          enlightenment-0.17.3 | 1 
                aiccu-20070115 | 1 
                 pixman-0.30.0 | 1 
                     monit-5.6 | 1 
            host-python3-3.3.0 | 1 
                     m4-1.4.17 | 1 
                 netsnmp-5.7.2 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
             alsa-utils-1.0.26 | 1 
                     nut-2.6.5 | 1 
                  imlib2-1.4.5 | 1 
                directfb-1.6.3 | 1 
               harfbuzz-0.9.22 | 1 

Detail of failures
===================

     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/13d81b522c9878e8a38db597ad544d70257525c3/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/e88324dfb6c1ee73db1f9e15856ecc07bc5de39a/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/eaeafe54d088a9a491a37d2ccaa8bbb825a50563/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/1ba8f9300cd20344dd918fe5c38a00517d592cd2/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ec550547f6465b52ba552ca757c9bbeac17cd1c6/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f7012c1e09d75dd103b61da364272f6385d2dc7b/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/f533d025b9f99e1cbeed4650c3960e18aa978dfa/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/b7f71cd412e5a7f801e81140a02c7da04694151f/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/817c97ea48aaf2f088beed24b4e7d1f5a34db72e/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ec8d834523e6e1fb0754ae205b71f8291f8d5071/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/77a41566387e910ba7520a66b7afc3f369b25ded/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/616115669c5c461a4d33fb8e72c5c27dab6940fa/
       arm |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/8cf02d6c45d7b510f133ad648160d8d2925ac0e0/
   powerpc |             host-python3-3.3.0 | NOK | http://autobuild.buildroot.net/results/c676b714e2b201033fae9696a12582739b92ad4d/
   powerpc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/eaa92050eb9712a53f6770c29aae74e51a752436/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/54cc9db811c350ba7ce70b139cc56b2708f4db10/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/d3d51918d347c8a4d8ae5274f37bbab8d0994d90/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/c3afdc9d8875d4ff28f0c77d1f4a275c0cb7a294/
    mipsel | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/81eb1621736b9868e11278caa4b0576f6ef73e41/
      i686 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/6eab6b9a2c427d4dfb107f14eccd6e9fe7fc0d03/
    x86_64 | make: *** [python-pycrypto-... | NOK | http://autobuild.buildroot.net/results/00f16cd335b4ba16d266db0fe69c256a75da88da/
      bfin |                      monit-5.6 | NOK | http://autobuild.buildroot.net/results/04cec6c9eb314ebe18f0986e45d1eb5c9ead222d/
    xtensa |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/83a605d2b1471a8edbe4e0cc90ee90348a22c9d2/
       arm |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/0da08c341134c67deead997df1610bc0736f0626/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/fbe3f1f14531f14f328d7248eb7a5c74ebec7954/
      sh4a |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/2974a652cc77f7dd332998bb5c5185d6a3a73921/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/4e33ab1dab7ee78a644dd7bd8d25c570d3412d6c/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/af6a646e560b9a743d909966a1243b1ee8dcb15f/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/db1f037840b34b8772bee8a763fab57e11db961c/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/09af8b4eda7eef7b9a401899e1f0a857bb7f76c4/
       arm |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/012606de281285829c1d089360101cb346970ffd/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/0d0cacc426008b505d6fa5c32bab6a783f42c5c8/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/e6fa6681719b36a77d5a0f5e39858ca8953d4c41/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/aafd8f756c3bb18920c8904fcb7cdd059c4abf07/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/bf0dde85320c93cfe216f252f28bc3ba971533a0/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/499b155fa24316484fe0fa2a6051b7e3d30fcdeb/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/b311b81b827eba4fb03ae6bdd02d1648250c1e21/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/77acafceabd26cd936e34003371a699adfdea7b5/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/5bf5e31c485a4ee8c0b0a5721205f0fed9b5ae5d/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/f6d70eb4df9ab835154f363f0de87f7d032303d8/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/ceed6eeaccc05f28a47d7ab4562251cea0b089f9/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/8b5f86b6cfce7a62cc6d5284ee7809b173d21804/
   powerpc | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/8f16b95cf644a791072c17611b5c063bcf51770f/


-- 
http://autobuild.buildroot.net
