From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 May 2017 08:28:48 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-05
Message-ID: <20170506062848.3CE3120C7A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-05
================================

      successes : 198
       failures : 47 
       timeouts : 0  
          TOTAL : 245

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 8 
     lua-resty-http-legal-info | 5 
                    mpv-0.25.0 | 4 
                    radvd-2.12 | 4 
                  libcdio-0.94 | 3 
                    mpir-3.0.0 | 3 
                  arp-scan-1.9 | 2 
                  nodejs-7.9.0 | 2 
                protobuf-3.2.0 | 2 
toolchain-external-codesour... | 2 
             bluez_utils-4.101 | 1 
                busybox-1.26.2 | 1 
                libepoxy-1.4.1 | 1 
             lttng-tools-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
                openocd-0.10.0 | 1 
                poppler-0.54.0 | 1 
                 qt5base-5.8.0 | 1 
                  quagga-1.1.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
uclibc-ng-test-c9b9876cefc1... | 1 
                wpan-tools-0.7 | 1 


Detail of failures
===================

         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/4f3381b2369633973f7145332512d052fd04ad18 |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/376fcb4bd9b60a5b4ab845511ba26fcdedf1cd0a |     
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2005ec0835a6db3cd4568a054882ea291d3e5830 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/30c33dac104866a46ad5b576d9df940648018b03 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/78e28f0a7fb3b3bb1187d3a7072724d34932f528 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7faa686f5811df90b683ae5dd285a06e97bb4fa5 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f870f75a8d1cfaf32ae5d0557b70b5bf12166ecd | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/7195a8a634e9911e38528920c3d3ddee73082539 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/86b6bd3171bcb3d64c075ec4487028c4ed370e65 | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/b2264650fb69b2486e824c8695e9ae8e84cb5293 | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/73a642c04ae3feefe47340eabbce13e018ffde4b | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/9d739f22fae243690e9e91ec2fe3e3a3b21b12f8 | ORPH
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/3fbeefdd4089e469b0547cfd96f78febc3ad5747 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/61ac670d473c7bebafa1d47e5e2a55b29e36da56 |     
         arc |                   libcdio-0.94 | NOK | http://autobuild.buildroot.net/results/1133179cf387ef25192611ecb57a6ea692fc18bd |     
      x86_64 |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/40b67bbc3fc512aac91724f6b0694b39485a6e18 |     
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/1f7068fd2aeed1603ea26b417742de8591d768d8 |     
    mips64el |      lua-resty-http-legal-info | NOK | http://autobuild.buildroot.net/results/af2fa1d78e159b026e093603f1b3dba6670787f6 |     
        bfin |      lua-resty-http-legal-info | NOK | http://autobuild.buildroot.net/results/c6b60ba4a96cb435b5f7b08d8768d68da389390f |     
         arm |      lua-resty-http-legal-info | NOK | http://autobuild.buildroot.net/results/d33a322b4d2618b55849b5637082100702a91eea |     
      mipsel |      lua-resty-http-legal-info | NOK | http://autobuild.buildroot.net/results/c790816e478df4cf9bbc0239a3b28e3eddb87db6 |     
        i586 |      lua-resty-http-legal-info | NOK | http://autobuild.buildroot.net/results/532c698408ab70c9d4c594c3013af517c51d7caa |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/ad7135b587824d4be9def68c77dc283e6c0ae4dc |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/aad1509a24cafddac797d7555da5d0f3e215d256 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/4a6bd72c2a31154d65a0f9331e890d99c72768c7 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b33cc4c9bf5de7f7837fd5c612e96cbfb06a61d7 |     
      xtensa |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/65bcff2988971e5b117f8c5032b7deb0364a5e11 |     
        m68k |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/3fbdf264614228a64a7408b8d8dee8087c7d5e02 |     
         arc |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/8ae177eac0be6992361bf370baf0817c3ec0a00e |     
    mips64el |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/0e4efbf21d17d2942f917d24b5b3de3f1009a82c |     
         arm |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/fcfa38e98c22c8809452f7d0ee86dfe2e9d2482f |     
         arm |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/946996fa78c7814d1e0ea0ef1239c6eb0c7aa8dd |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/967c2c432c1a1530702b8d22149ddf57af0d365b | ORPH
microblazeel |                 poppler-0.54.0 | NOK | http://autobuild.buildroot.net/results/ee92ae3f384934be4ac374b4f7ecb4f1e01e67a1 |     
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d6389bdfe4383a885a22f1a41bfc0298b87d47ba | ORPH
       sparc |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/d5b10ce97701fff14d797e115e95d1a34304667c | ORPH
     sparc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/d1f36b433da8417c66b5bbe65fb71459d0786cb9 |     
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/e7dbac5addf0f873cef9354eec175a56c1cbcb31 | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9e0b418823474daae03a0d370eebb50c76072bc4 |     
         arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/625ce7b3a591f67c7dd698e8b121bdaa82ef74d4 | ORPH
         arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/61d17f4872562caffa9f5262ad37e31b97f58f5f | ORPH
     powerpc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/04dfa5b604e68d714d12fea867e9ddf146424914 | ORPH
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/8933087d8de49f9dcaf7ce7d841f682316b072d7 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8795c71f894471619595f838e9f46e3a88429030 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/57c860d878476db2f418ce0151c5b8bf36130889 | ORPH
         arm | uclibc-ng-test-c9b9876cefc1... | NOK | http://autobuild.buildroot.net/results/4fc87a4669c92e5e915c67181a9fe4950ba4fccd |     
         arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/7091ad71e743efb5fd530357b0f59c5c2b0e6d8f |     

-- 
http://autobuild.buildroot.net
