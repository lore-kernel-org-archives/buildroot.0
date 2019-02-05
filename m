From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 05 Feb 2019 07:00:35 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-04
Message-ID: <20190205070041.9703630C42@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.11.x |  27 |   1 |   0 |  28 |
      master | 179 |  37 |   3 | 219 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

neardal-33b54a55032b047fd88... | 1 


Detail of failures
------------------

         arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/34dd5a79e0fabbc967d5a8dae8f37277f3c9fe49 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                beecrypt-4.2.1 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/617ff00c1e61491a5a4b57a1038a85432ff49a61 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   netsurf-3.8 | 10
host-android-tools-4.2.2+gi... | 5 
                  ffmpeg-3.4.5 | 3 
   libtorrent-rasterbar-1.1.11 | 2 
                moarvm-2017.05 | 2 
               skalibs-2.6.4.0 | 2 
zbar-b3b4e32b55f570372fc3af... | 2 
android-tools-4.2.2+git2013... | 1 
                clamav-0.101.1 | 1 
                         clang | 1 
                collectd-5.7.1 | 1 
                 gnu-efi-3.0.9 | 1 
                host-libsodium | 1 
                  libssh-0.8.6 | 1 
                mongodb-r3.3.4 | 1 
        opentracing-cpp-v1.5.1 | 1 
                     pcre-8.42 | 1 
                    postgresql | 1 
                     pound-2.8 | 1 
                 tn5250-0.17.4 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

      x86_64 | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/73ffabbae5f58f09662054324e93a1b335d6440a |     
     powerpc |                 clamav-0.101.1 | NOK | http://autobuild.buildroot.net/results/161d045a8122f235c82da6fba17100031d89b4af |     
        i586 |                          clang | TIM | http://autobuild.buildroot.net/results/338caf36394934593306fd6d64c5057f8c3cfec0 |     
     riscv32 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/e3606956b2646a7c405d99b35f8b5ba450caabdd | ORPH
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/2b3d67e62b8b13da3f37495d39cae767d94eab30 |     
     aarch64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/0703db07e3be3ac9e9e8da613a6f342c6880b3ff |     
      x86_64 |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/c14dbaf2af7ddc2d53d03976307066f5171288b8 |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/b75517846ed7b5e900dabe1d0f287fb41ac34847 |     
      x86_64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/66f05eb9a56aa8526a1420334d68c7eda094e90e |     
         arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/6a569a229fd2ce3df286478764e3044aa7f4fc6f |     
         arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/a5613572bc4cbb5b3f7a2b85c4104b9b93974f3d |     
         arc | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/72e15c095c7dbf7bd8d54699809207c44e306ac8 |     
   powerpc64 | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/ea49c6da894d531d908b807452f29a9e29f46912 |     
         arc |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4a7639c51f3c80a78b1d4050ed06f480687ec076 |     
    mips64el |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/24a5a49f252e54055b937911df6d1717b2fa988b |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/2d1488fab7db2de654db111cab66e2e37cb889ba |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/422a110aeae80e291dbe80fd5b706d7095dfa133 |     
         arm |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/4268212d80e99cebb22bf74537743a883636ac5c |     
     aarch64 |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/cabd90bf680cab70e9fe68298f2371e5cd6b3481 |     
   powerpc64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/68bc25124202134e0baab7fde3959b6edccb497d |     
         sh4 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/07c186dc62070946401d1cabd1c656731f54b955 |     
     powerpc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c37c47c50dac4377cc3775e9eed3fbee17a27035 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d5e3fd87ba352b065b5de18f44f346d15215ed95 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/e9cda5dd037104c8ecb529c83b52f555a5b56f2d |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ef287ea3a060e866b6c0054e8fe7ca9cceef52b2 |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/2fb1e81d1bce96b1dd8eec9f82408d0f95184b04 |     
      x86_64 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/55f911f9bfd4b05437b6b9fed334e88c705d9223 |     
        i586 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cf031159733f1a1e8871949b7600d70500feb7dd |     
         arc |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/610d91cd12ba1f7a2495e6450f2789d60a19e4de |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/61d9503173be42967b9c66dfe42b662b7aefc2b0 |     
         arm |         opentracing-cpp-v1.5.1 | NOK | http://autobuild.buildroot.net/results/a7dc6d033a87b37f391fe006f6bea4e4ecd3b327 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/d2038b8dcab1afe96c2689d365c36da322adb94f | ORPH
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/60d7013632249f326fd36942a701c6317defec61 |     
      x86_64 |                      pound-2.8 | NOK | http://autobuild.buildroot.net/results/1263eb336f8feabe5a77de0ae377f8d412bf4654 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/385fa0e7a6ec9aa8d1be8067c920354472151309 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/5aa9cb29c459f511dc9c4fcf218dc9a842505aa3 |     
         arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/c426a3a0807ec5157d8ca3bc992f48f8d52f1397 | ORPH
         arm |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/4ce5f0ee20e01771b995d352ae6ed11cddd3d37c | ORPH
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/58d3b8f6060b32ea9f468a243d879e3eae6a7ddc |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/b8297903cd2133fb2ddca4bfc214a4dc5ae13df6 |     


-- 
http://autobuild.buildroot.net
