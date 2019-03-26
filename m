From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-25
Message-ID: <20190326070049.2EB23863D5@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-25
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
   2018.11.x |  29 |   2 |   0 |  31 |
   2019.02.x |  25 |   5 |   0 |  30 |
      master | 207 |  82 |   4 | 293 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    php-7.2.16 | 1 


Detail of failures
------------------

      xtensa |                     php-7.2.16 | NOK | http://autobuild.buildroot.net/results/5bd82cc6d92da017d765888ef3a5337faaf5a8d9 |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                   systemd-240 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

        mips |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/627704a7617e88c48924605b0011336814988f2a |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/d195c6fb46725f561ad35080746152a85d12355b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    uftp-4.9.9 | 19
            optee-client-3.4.0 | 9 
      host-uboot-tools-2019.01 | 8 
              fetchmail-6.3.26 | 6 
                busybox-1.30.1 | 5 
                    putty-0.71 | 5 
                       netsurf | 4 
                   netsurf-3.8 | 4 
           uboot-tools-2019.01 | 3 
          wpebackend-fdo-1.0.1 | 3 
                cutelyst-2.7.0 | 2 
                   mimic-1.1.0 | 2 
               pulseview-0.4.1 | 2 
      qt5webkit-examples-5.9.1 | 2 
               wireshark-2.6.7 | 2 
                  brotli-1.0.7 | 1 
                    git-2.16.5 | 1 
                  gqrx-v2.11.4 | 1 
                grantlee-5.1.0 | 1 
                      gzip-1.9 | 1 
          openjdk-jdk-11.0.2+9 | 1 
                   qjson-0.9.0 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
              spandsp-20180108 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/b24361cdedacb2ec0c632ba42a96d0edb3acb956 |     
       nios2 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/6fb0c4d9552f6a958c1d71c3eb666b17faa195b5 |     
 powerpc64le |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/8ecd464a0d03ecdb196b8a48c2a420269ffe0635 |     
     riscv64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/b120e05b227aafc068c35b83ad43e80eb5c653e7 |     
     sparc64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/c4d08a81ca88b27ec31ad4bfebc617cffecdd1e9 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/c8800ab40bbe82382ce032a1f529d84cf37cc5ba |     
     riscv32 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/b5ac32cb2a2ef4238815a5e5ad1d02a9223120bc |     
     aarch64 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/6901849fa9f27e20ee0c370487e44976c23094f3 |     
    mips64el |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/ede3c144e3c104908e7328d8c6e5d12c85aaef0a |     
microblazeel |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/58edd4b822cadc58d06f2256b6964bee5593a2a7 |     
     riscv64 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/c27b9c82e68ade29b45dc84ecce5fe6653fbb7da |     
       nios2 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/615ec67b0a8ec3d057b59b691f54f398848dfe5f |     
  aarch64_be |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/e77f7ebc32128d70413d7ba82ae04514d8df46bb |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/a05e84b11ada803d0b15d6ae2f7ad6563893014a |     
       sparc |                     git-2.16.5 | NOK | http://autobuild.buildroot.net/results/bd90e27c1565c6b9785f9133a28dee1a12e2e2be |     
      mipsel |                   gqrx-v2.11.4 | NOK | http://autobuild.buildroot.net/results/410c7491cd60cff65c2b13a48d2569d91fcd0565 |     
     aarch64 |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/49c19ae5c0f8db11ad462001f329bca6ea4a891f |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c2f77d5a792ccbf0439951389d0961d91eb67ea7 | ORPH
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/89896be929408dd58ef99c61dd3f14d1f08b8d5c |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8dc342093b1605d1639d829e5df1e4a17631c134 |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2382411126c3f85f0592a4b4d0796c9b2e12adee |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/f39c69d5e27d0b702abfde8a5190142b9aea13d2 |     
     riscv32 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/75e6372783a495f966326344defb07b220fbd0c8 |     
        m68k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/298c2fe03407a39189d7cfa77d6cbeb9eadb0e2e |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ddfb68a81a017afcf8c1669ef6a8c30df1cc2d1c |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/61ed8048b86afbdf7da7b4c00d8fa083529a663a |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/dfdb56fe37b7d6bb48a4c9cb28aa669e741e9767 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc7948c9f1a633b11812e732ee40ad002a1a5a58 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/8b5b9cc8648029c324d61796c66a8530628d47ac |     
     aarch64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/693e99cd7908b6f9f724546686a17b5974d39c71 |     
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/d8c305bac7984e619e86bff478384f7425bbc433 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/a591b6cb3332e09e4770697c2fe95d1d4fbe1813 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/0cbeca0aaa57513145720621b0c0b3ec6177b0a6 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7900bb9afb5095e968eb5c74fe5423dde0949c5a |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c9bb934eb5c7e658c39d693f85aac0ab2231c313 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/94dd35b882185b4bac5f2faea657a6f4841d773c |     
      mipsel |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/92370e1db93378ae0e1798f1f13f93ff51b6c93d |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b1b8e5dbe396556dc2a167a4ae47c379824d749c |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/594412babe21b3bdffe0c79fca9b9be9a7f9685e |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4bb7a2d3e3b48bf96a7e8ba9081234669948eb8c |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b296d84489d7d06d557dd39700d9df9e3c846f68 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3ba7f5a738b64923914facc857455ba6e9c4e1dd |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/328cf40c924847003a00817cbdbae3a16b21feca |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/781a7f63c34c166fee4ddb0407a91f3c10ecb9ff |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/30377ed78f340b7f73a6b30511c47796704f47a8 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1e4fbb588d664f9532d46e7fe0f45289979b7156 |     
    mips64el |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/4e2e161785f2fced88e13057eb2906818ae88261 |     
     aarch64 |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/941b0cc2f3d73ccf7b46c9b04bfe6e1cbc20dbc9 |     
      xtensa |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/632f93046f9cceffd9b604911542426c10967e0f |     
      x86_64 |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/3984c6cdd3398645c8ad98bbe23af9090cf4bfcf |     
     powerpc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/801e2b2909363b5dcd9735362bb921e017569edc |     
        i686 |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/a7d374f83c7839442003f64551fd4304085816b2 |     
      mipsel |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/a7743bd88e7b6e0649b18867f07a52a6046009bd |     
         sh4 |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/740defe2d7b407b2ccc171f3b5574aed19620fc6 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/7ff84d58bf63f5efffebaf7e258cdd712ca5f271 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/fff9b5dfafba5e7ff28d7cf5d907d6bae6aad73a |     
     aarch64 |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/7fef9ab73660b872fcf2e9dd740ba18a3283ccc8 |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/e203ce7b49b99a0b761a05edbbe724276effc40a |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/e76382fac82593fe74f11cf9d2835d111e31e0ed |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5e1a2282dce60020740291e007c493e963cd5dc1 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0d83d5b35c0ccdfbf81022d464fe90a481fde9c5 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/673c095cf80e1da47ce4eed3e49896c04ed41ba9 |     
      x86_64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/3157c1ddfa6951d8a1c167baafda702cb8830070 |     
      x86_64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/aec3560d5c5137883983fa966209a8d21dfd1b2a |     
       sparc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/ae84656eaf7b2fb9e2e76b24a9681c6dce5c46c4 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/937d9b698d1e38d2f13336cd16fde1b83b1784bc |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/dba129044959217157bd499d7a42b44d331f0de5 |     
      mipsel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/64c94053fe3d0d03d7ea23c8d0eb05ce45d48806 |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/281486893ab2fd568fccb45a2bfa125821c5645d |     
 powerpc64le |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8afc93a936357782360e14c94ab335a010bd832c |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/b5bd95b15b77714f188c4591940e2b71d7a012c6 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/67570bc77e84569fad3f50e75ba9db3437205a02 |     
     aarch64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/bf88c011eb5022da4b85eba33560460ad0814908 |     
      mipsel |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8562f55df0500e319f3342e5853ef1604896179b |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/fe2a2a0255c5c209a0bb7913afe35214e3f5f154 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/76c13ae98b5e80eb91d4a2687cf6e548ed9b67e7 |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/a367f340aee870b5d32aa35e6832e8855b3e4d2f |     
       nios2 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/36b7e6fe36e777cd1e195503e76ed13fc635a1ad |     
     riscv32 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4f0f964408cd27eebb282048e199fbf012e302ca |     
       nios2 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/2da6986fbd9fef2114e5650b56dcd5559c1c13a3 |     
      xtensa |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/62a8adf6a6055c695d94a91ea52ee7c6eaa60b5b |     
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/fac3fb4529177311b7c5dbb48b05119fd98017cb | ORPH
         arm |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/8422a35f88153a10faced9ef9c9dff8577b2ef6d | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/d9a48b40c3eed70c55448b54be32a42d75a25a06 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/863d600fc3254437cb629436e0d043a3b259ca00 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/64431a4cd6f66f0f845cf536c905ef8acd121c8c |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
               pulseview-0.4.1 | 1 
                 python3-3.7.2 | 1 
                 qt5base-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/daa524ac94ad3e6a8c4c8a5cfc18a347331fef70 | ORPH
     powerpc |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/978a7825de2a730cd24732699ad5b0500f4fc3d8 |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/1eb67a4eb0888462d8e9e0b002bbec9db525e406 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/18c80b27f6f11753966fbd4f7e896ff1e44da823 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/09eca53fd577ed15c67d162367d27327c13eeb98 |     


-- 
http://autobuild.buildroot.net
