From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-17
Message-ID: <20160918063031.6AE1A102ABC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-17
================================

      successes : 223
       failures : 75 
       timeouts : 6  
          TOTAL : 304

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 16
             util-linux-2.28.2 | 9 
                    mpv-0.20.0 | 5 
                oprofile-1.1.0 | 3 
       host-erlang-rebar-2.6.4 | 2 
libcec-2c675dac48387c48c7f4... | 2 
                 lvm2-2.02.165 | 2 
                   ntp-4.2.8p8 | 2 
           python-psutil-4.3.0 | 2 
                socat-2.0.0-b9 | 2 
                     xen-4.7.0 | 2 
                blktrace-1.1.0 | 1 
                coreutils-8.25 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
           dmraid-1.0.0.rc16-3 | 1 
filemq-e59951489045825d6fc5... | 1 
                   glog-v0.3.4 | 1 
          google-breakpad-1373 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
                  libcdio-0.93 | 1 
                  libvpx-1.6.0 | 1 
                libxslt-1.1.29 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/s... | 1 
 make[2]: *** [all] Terminated | 1 
make[2]: *** [libavfilter/a... | 1 
                 mesa3d-12.0.2 | 1 
                 mono-4.4.2.11 | 1 
                    mpfr-3.1.4 | 1 
                     php-7.0.9 | 1 
                 php-zmq-1.1.3 | 1 
                privoxy-3.0.26 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
qextserialport-ada321a9ee46... | 1 
             rabbitmq-c-v0.8.0 | 1 
                rsyslog-8.19.0 | 1 
                  thrift-0.9.2 | 1 
               wireshark-2.2.0 | 1 
               wvstreams-4.6.1 | 1 
    xserver_xorg-server-1.18.4 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

         arm |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/af5bf21b4ba3d942a1dcfc192b0c4448afd216d8
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/6cdd27c9b63af8e16722751b685f3088fa3d59dc
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f95099d5e720f6732e2341b708d3119ba44d29df
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a46c502b9f1d6eefabefd7d3633d4a2315aba578
         arc |            dmraid-1.0.0.rc16-3 | NOK | http://autobuild.buildroot.net/results/f80ad8a07d9d58b46592c2c99b227197b0f808d3
      mipsel | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/64cca6c90b27edfeed546c92e606f3ac41dfec89
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/97d3db1bc7411393fb93e9e04736f89c9c8d65d6
         arm |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/f3212dcdfc4d1cdf8615cbe1b1a1c8dbadaf0e54
        i686 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/fb8645b74c094eed625c8a3772dc463b72207f80
     sparc64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/63b1e3b9544475b9c0c91a8f2f8ac7527b674dba
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d627593ad32f026402a2f7d8bba93c1bf890a508
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/0eeb45b93719d82d464f5991925751ca46f4855f
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/09294253f02cf437724a14effa397c9d295c98d5
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/e59e6592fc697cceda359e421387dd905ff04701
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/87204ead7c230d871537d07e1800adc4b497b9aa
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/bc6b7bc16eb8e82db2a41b215a46828c325bad45
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/7da61393e359017e17e8c14dbe102a95eb6f7a45
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/b30f0c46cec46fb1e1388c47d7c9e326db27ed17
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/b997bab75838cd385879e765cee40c5ca1e0caf7
      x86_64 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/12ed611d2ce3200107eacea00b354d4da083356c
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/6937ff92b094cb10b328123492b5bf7a60106521
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/a04bd6ed9b6d89053ed88873176b8b599e1f67c5
     aarch64 |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/24ac9bbff364b1e349ee4dc10593d392e6791d62
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/48017360a99f5b8c48532b12059608c1d4435cbd
         arc |                  mesa3d-12.0.2 | NOK | http://autobuild.buildroot.net/results/851509874294c176a23a5371222b2b97887facd1
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/5a513e99726c8f47c5055f7de003e5bf0d005416
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/3f6e103703aea52592d0988ad0ed08346f8292e2
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9110875280c11e5fe4b5a4a9aeb9189b85a79d65
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ce9a0f64e16a0d27bc9008213006fe39d1850279
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/ba4008ef6a5406f7945272544b243cd9aafae42f
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/3272aa8186eb950edf6d9f924fa83e0e27c267cc
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f1171deaf2ea32523fbf9d76bd2491fc0450cda0
         arm |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/e890820a0535574c95fa5afbfa839c2981fac50a
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/63da982be0a0269afef139f5b1e3848e17775788
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/efdec5e8666acf82865ef9e1cf156dd73b66b885
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/6d3ef336a6d63ca6b7a5d56c83f665fae18407e3
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/9871d1b3f85ff20eb5b57511a348f9ec73e603ac
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/f335e829bbbf1d1640e3ba7d3356103004beaab8
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/63a7f23da4f9c0d2f3b0717a34a6ca87105453cc
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/3b22c39b04104046a0dc2dadf001bc756c3c9a61
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/fb86b42bcaac8e912c8069ecaf1bce9acc1d12d3
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/b9ac1056a5c6814188b3089a21deb4df94fe7574
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/1bdd9e8af2678e61183c95aaf6003618e9f6d562
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/819105720c2f5acdce040c51966f1fa2215040dc
      x86_64 | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/6cb81e50540c94e630fcd52a81249d614391345a
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/99e6d6ba8f60baf335850439778898bf5f19129b
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/a231d320ba6e32addb10fc271de61a0fbb0deb22
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/11eb07d406af30898eb40305118070d5e3b607da
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/2de4faff7bb351a4a200877d5c1cabb6c54d743c
        i586 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/d060cbd6bad137e6a1149731eb6a96bd1a687d45
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/21baa6fbdef24bb7070b3db29045a0426ce917c1
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/67f6ab3bc8728cc3a1c35a7d1fe0387d90b1823d
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/12d4268d1af1087903b343b44cc6899c274c8a7f
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/f96246358124ef719fe5ac9ab2cbcf27fd802b95
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/36cf8860c9c03bf97868d843fc8be81445d18da0
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/df9c0db60918b4c9e36a1112bc2fb1a2f96ba3ed
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/6a0c2b1930b328c52b348a49b6353443e912bab5
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/d642faab9f2f0f44f1b2367d723f2fadcce545ae
     sparc64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/af23f13bcf448538cc601d581386c368e0465dab
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/88e7711d2089f693fcf7fabb33861cb527609e11
         sh4 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/60fe5abb211ea62f99632aaf2f1d6e27f2e32645
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/04ad5caef1680c06fc85120277899b2275feb853
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/275e576ee4533c6a1d5d2e8de0592c1fed086811
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1fc202f9e31fbcd85a9cb2688bc9a7c92a0c11c1
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/596a1ea2fa1ce6d5a86331c4b5cc4341b72e3bc6
      mipsel |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/1fd76f68b9e93701022e3f61aacec208a4551bbc
        m68k |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0533a7979cacd469a91dca4e83544f01463df9ef
      x86_64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/0c79588166e1900c18161e1d67a38e6ee2461112
        bfin |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/66fcd3dc6909bd00d6cb97e7b713e1e2e91c2697
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d31ea8d374fa4b14b8d8d55e537801c7fc1e5992
      xtensa |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/9d4d9b74fb021fcbbc2a63ccc8cbe170ded7ae24
      x86_64 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/6a7faf8adbffd9437c0117b9f0e89684c24dad23
        m68k |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e4f9e0549ddfca65d746cd7ac681cd463e86f6b7
        i586 |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/70e0a273e699c73c6b2ab2a19c8f7ebb1ddee6cd
         arm |              util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/5f6b19e5fbb138b81092004ab8da057b84817025
        mips |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/d29f578bc761ea3f3b5d81ba21c8664dd3d82412
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/20a2c65b9dfd3407463372d637766efa82be1750
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/0b492efff7a9d616aa8ab4d1980cae8a55c63190
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/12e3143f29ff1e5e08fc5d65ced35a8a3c6f8cd5
       sparc |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/ecc083ffc00e05e15390b630c57d398fbe2356e0
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/5d4222bdf8a593f3ba273f784798413ae9beed0c

-- 
http://autobuild.buildroot.net
