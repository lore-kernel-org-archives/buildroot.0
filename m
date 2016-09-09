From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Sep 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-08
Message-ID: <20160909063029.AD4F810253E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-08
================================

      successes : 240
       failures : 71 
       timeouts : 5  
          TOTAL : 316

Classification of failures by reason
====================================

               host-qemu-2.7.0 | 5 
             util-linux-2.28.2 | 5 
                 leveldb-v1.19 | 3 
                  libcdio-0.93 | 3 
                 mono-4.4.2.11 | 3 
                   pugixml-1.7 | 3 
                    qemu-2.7.0 | 3 
                     xen-4.7.0 | 3 
                 jack2-v1.9.10 | 2 
make[1]: *** Waiting for un... | 2 
                    mpv-0.20.0 | 2 
python-libconfig-b271c3d9da... | 2 
           python-psutil-4.3.0 | 2 
                blktrace-1.1.0 | 1 
                    cups-2.1.4 | 1 
              e2fsprogs-1.43.3 | 1 
                    efl-1.18.0 | 1 
filemq-e59951489045825d6fc5... | 1 
                  fio-fio-2.13 | 1 
                   fwup-v0.8.2 | 1 
                     gpsd-3.16 | 1 
                 host-icu-57.1 | 1 
                   jamvm-2.0.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
libcoap-c909bf802034b7762a2... | 1 
                  libffi-3.2.1 | 1 
          libwebsockets-v2.0.2 | 1 
                  ltris-1.0.19 | 1 
                 lvm2-2.02.165 | 1 
make[2]: *** Waiting for un... | 1 
make[2]: *** [libavfilter/a... | 1 
                 mesa3d-12.0.2 | 1 
              mosquitto-1.4.10 | 1 
                 mplayer-1.3.0 | 1 
                  nginx-1.10.1 | 1 
                     nut-2.7.2 | 1 
                    ola-0.10.0 | 1 
                  openjpeg-2.1 | 1 
                oprofile-1.1.0 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    quota-4.01 | 1 
                 rpcbind-0.2.3 | 1 
                socat-2.0.0-b9 | 1 
                  squid-3.5.20 | 1 
               syslog-ng-3.7.2 | 1 
                   taskd-1.1.0 | 1 
                   ushare-1.1a | 1 
utils/CMakeFiles/testpat.di... | 1 
                     wget-1.18 | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/b9304786ab728adec505afd09c25cba5c8dfe981
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/68284e95a1e73a4cf1c81a72497311299479d7fb
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/0ee28e0126354be5c7c5979b59a14827cd3b3edd
         arm |                     efl-1.18.0 | NOK | http://autobuild.buildroot.net/results/7d3b5297c80114e37e91c9b44222b207bc8d100c
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/79d111692e1241b6ab3628945d6104d38a58f130
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/33caeca3dee24650b2f5f4f7891bdd270460fab2
      xtensa |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/9f548e89aed4e8f558ae77f057d934fae6bd0c38
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/78f275d0b54a8c757c3504834e31305901638270
      x86_64 |                  host-icu-57.1 | NOK | http://autobuild.buildroot.net/results/f059a96a4c78dbd71756295b9d94ddba4654098e
         arm |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/089cbb2b40716c00c6127dfab1e91b8763b87c0b
        m68k |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b2909d422bfd12a0c300a5a5da66f63ddd97777a
      mipsel |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/8d6255b7d9c4e08148ac5f3c8fb67e412146ab46
         sh4 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/1bd90ec7c1e7b1611507124a84d1fcf92c410981
         arm |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/2718f0fa90efc3a44d0ba7b03466a36674771f87
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/a990eeca0c54bc66654320838c6634d491c8c8c3
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/73fae6215b5683cdf070cf992905cdd9cf215ba0
        i686 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/9940f2e53eb50d04764e800f633f96dacbcff614
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/ab7cfbe090f38c13e7ca37601985c80e86a83729
         arm |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/00c8c5a1d6001eaebfe2a9f848dd292c91bf6a79
         arm |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/6f1792ac62eee321f8952939878d312258e0c645
    mips64el |                  leveldb-v1.19 | NOK | http://autobuild.buildroot.net/results/c6afb19a4fe25066b307b87556394ab1cc992f3f
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/cc7fecd17b787407e537f7cb063c24eeefc4f608
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/b91d0ce173f50a620541a0638b5e4dd745157620
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/3a4610a8c6e0cecae7a983eb51427f7fa93cb257
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/92157d503c0032ad1602ad25eb4e48111871a0fd
         arm | libcoap-c909bf802034b7762a2... | NOK | http://autobuild.buildroot.net/results/761c75c76720baf50163beb7e7cd0f10ec43c448
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b79a73e941465e75e5512b309ae967645ed990e5
     powerpc |           libwebsockets-v2.0.2 | NOK | http://autobuild.buildroot.net/results/a826626f7417827d605dfe4a543dc8706d963246
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/31a2da6a503a0e4595853e8c2330a6a1b1b5b676
         arm |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/2e93b8267009ad2828fc8a0a49dd5e92229ae3fc
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/6998b1cafe344d2a1c07ff0830067917ed165c1e
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/83e504d5827a0a4e10213724875427a3a5eaf8a2
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/08be1d3004cb90959ebaae2b85c6c9cdd821e6a6
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/1ac5c0bdbc2c139907a0e55bbaee18323993514a
         arc |                  mesa3d-12.0.2 | NOK | http://autobuild.buildroot.net/results/ba9bfac4c93867149afb0d9ab8d530cf457eec73
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/c8ad91e29ca514e46f44b36191836c5a112b46ee
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/455b80324c51d4c885b89ac9ab8af3be632a5afb
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/397b7be8bf23cc078c58143670dd27912c7eacfc
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/4bb51556c8a9db1e36db025221557fbde987e44d
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/740b7b402ec8cb509e48a59e78ddc002fce0c24e
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/3f5bae41fd99ae87be4feffa4f328b0113266b18
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/04b6ebbeddc101ffdf93be7467f2c7651c27b84d
      x86_64 |                   nginx-1.10.1 | NOK | http://autobuild.buildroot.net/results/4584ba3af8fe41e5c398861e985649e0423744ef
     sparc64 |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/58d9782f65fedd1ef527a130ff7a5553edab1dd3
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/7574b38c0319b3f359728d41d841307b82ec11d2
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/c3c85fb5c4acfb8a6d29143520371df16f324dfe
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/785c84c68a734f0fb5861a634bbbd5f1d9c0da42
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/8e17e4f41e4e5320431205fdf69c4fbd36cdce70
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/8036b80ea8b849b41432813aad6c9bdf53c04c14
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/c5d1cc79f3e64912f32d80dd3dce57113ccc5fab
        bfin |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/a6906b64ae85ae432d681acb46389b316bb6c578
         arc |                    pugixml-1.7 | NOK | http://autobuild.buildroot.net/results/52157aa2b5d75b5338f3bde7ae5beb3d300283d3
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/553e514a8628cd8b2eb9b3d826d39c1ff1312cb7
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/02074fb93e62d31e38e5272ebdb282a7f0d16423
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/0950b3632bc108248bcca1f3d88f5761112d2542
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/a283e0f76715a22b820053c338b86bb64ba5478a
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/049fed0f222c0ffc30d63efe9a3a835392695164
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/5dc5c073db267defeab9899d4662cc5e329024e8
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/015d13df466cae6ed6ff2b15527b4089773dd111
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/31ddf9e8393c7d3e40992f4d6541253944ac8441
        m68k |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/9feefb3dfa125d1cc149fa3607f17b5b6328a81e
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/694a18599c4f7557b8078e1597310a1004295bd3
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/eca12f01150aa3450b359a3b006d011bf7a39689
     powerpc |                syslog-ng-3.7.2 | NOK | http://autobuild.buildroot.net/results/b2be0d953bced53a502ef4799349063bfad2e44b
      mipsel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/9472f17dcc199302452fd0c5b669c32d64de5d09
      x86_64 |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/f580d21194fe2cfcff88f12be3303e554894fcfe
     sparc64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/4c0d2d0a2b997623f913c59456ceb81b4a91c6a4
        i586 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/64d747f2431afc5d3a2ab4520933c3b4140822de
    mips64el |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e63c0db7d9ba6428067ea5ac65723dcd27a700a6
        i686 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/69489a698dc1ad0f3f138ded85c0eb223ec0d7f0
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/ca7cd5af4a491546335465439e8786fd34f2a66e
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/28c4d3dab54f5b87769ddb278a228ccc011aa17e
         arm |                      wget-1.18 | NOK | http://autobuild.buildroot.net/results/035a4534c32833c060010565730791eaa0a44248
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/49ce6dcfec5d0e2b98010c7c51b1400708a05981
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/01a5bdaa08ebc1fb36909bf2f02af05c62bbec70
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/961720cbb506e530ad4a9282a5d11669db145516

-- 
http://autobuild.buildroot.net
