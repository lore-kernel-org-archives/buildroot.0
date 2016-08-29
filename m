From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-28
Message-ID: <20160829063030.2B8B1101A61@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-28
================================

      successes : 192
       failures : 51 
       timeouts : 2  
          TOTAL : 245

Classification of failures by reason
====================================

                 libraw-0.17.1 | 15
                     vlc-2.2.4 | 3 
                   fwup-v0.8.2 | 2 
              libarchive-3.2.1 | 2 
                 mono-4.4.2.11 | 2 
                    mpfr-3.1.4 | 2 
               openswan-2.6.46 | 2 
               binutils-2.25.1 | 1 
                    gdb-7.10.1 | 1 
                   glog-v0.3.4 | 1 
                ipmiutil-2.9.9 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                libaio-0.3.110 | 1 
                  libcdio-0.93 | 1 
           libfreeimage-3.17.0 | 1 
               libglib2-2.48.1 | 1 
                    libiio-0.7 | 1 
             libxmlrpc-1.25.30 | 1 
make[6]: *** [all-local] Te... | 1 
                 mesa3d-12.0.1 | 1 
                    ola-0.10.0 | 1 
       opentyrian-9c9f0ec3532b | 1 
                     php-7.0.9 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
           python-psutil-4.3.0 | 1 
                      qt-4.8.7 | 1 
                   slang-2.3.0 | 1 
                socat-2.0.0-b9 | 1 
                  squid-3.5.20 | 1 
utils/CMakeFiles/testpat.di... | 1 
                 xorriso-1.4.2 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/31474c5de52f3069a8b0ee3dfe027a9092ce5bcd
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/708cca029e32aa0daf5218afb5d0b3bce7f3be29
      x86_64 |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/36b0c6b68209ddd1b0f2db8449392af36876411f
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/6db268e94b48eb06da6c8ec090b04b09bf1ee675
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/dba2a4fb8300d574bbd955741a840ee5dd50e3d5
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/b1f910858443dc89988e1fe1a8de8cc17a0804db
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/4f0131343d7510e87885d2cded16280a93f0842e
        m68k |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/045d355cb1fe5d9c54cafbb430a6b0d274e403b6
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e943ee5abc06b1812d7b34976e3a807859958935
      x86_64 |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ff36506416e211ea270602bcff18f81a9d6052ce
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/77ff4f0c47380c8704c62ac9f3fb74b8a6e4076b
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0811531872f69f9febbdc482dfbdd7fb5c35d1c8
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/475fec17da6c0f99b65192f04949be07fa4ddd77
         arm |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/69e43bc171e554cf10f2ad526cebf5e0e524538a
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/168b3d4de401e8e9c21d4a5d57e8d562dc1a630e
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/f6d9c2f58b432386ba116b2e9b6ec13ab61f70c9
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/311c36a05640e7687e5431fd7d4b5b057ebb9733
        bfin |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/63ca88298387659bc8b729a2ee72d4f2f09b2cb2
     powerpc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2a177c6dc63f26b21b3b287ee1dbfd52ee57a023
       nios2 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/3b89c7b9a0ecc5cb101d7ab1946d865975b4faee
     sparc64 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/5a555744e9d05cd1928176ea94197b5326d768f1
        m68k |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/a23cb675ef4a4951692bd71245cdb71ae675a5b9
        i586 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/71fd3c0d096202b40fc79c5ba27d491e5be41e0d
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/ea9515d6e8b8aacf7e1f7b70e129651d05d6ae54
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/8894c95b53b4a65468d10ae46acaef7b11e4be11
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/dd615a9df3a29431c375c3823e1bde2e505233a8
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/710b56a98b55d39dfa29e0ce5fd962fdded6ee5c
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/dc691f18aa54283bc9d5b644d2aa03b6ebbbc80d
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/61d6f9a30676039e731fd6cc8e6c5f988765b256
         arc |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/6c816a5ffaaf865ef065b5bfcc61a50ea0f0c346
microblazeel | make[6]: *** [all-local] Te... | TIM | http://autobuild.buildroot.net/results/4143e1b166df18f59aaa0b84fc9209b24be6aba6
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/b2d4f9463b9d9af060b896a194fc6cb4b1ba22e3
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/c423063427e25153e5aa37c685d6621011759271
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/db7b5ecb5a9267900ce5558da1e22b277e7df1c4
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/de8abde14eedbac8340c5cc8b8d5263320516b57
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/7060cb7a469ae5034002722080c068ac2c2a0115
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/c8b3b0aebb49ca12350536eebebc77b7a38f2bde
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b4a773b762e4986dcbbf87b67274f8fe665d4e3d
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e4b635b6e13713182a74322eed218c256416aa5e
         arm |        opentyrian-9c9f0ec3532b | NOK | http://autobuild.buildroot.net/results/f753b3404cbb7aa05714ade78a25a3d972ecefd7
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/29fb83f8bea96b0e4aa0ade8fdefdd6ac83bfb85
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/4f070ee3780e296425457200939595e6f5c9a326
         arm |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/2a458f1418b1f54d9c2ada8322555f3384fb5123
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f22354bc2da8d15437566649a0da1e53a42d94b1
      mipsel |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/55954a9de0dfcc1819eac86d8342db7a6709fda4
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/02977d3844ef62b1e9cbfbab244593632757c5e2
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/a2721a4677fe1629442b8792398c003794881610
microblazeel | utils/CMakeFiles/testpat.di... | TIM | http://autobuild.buildroot.net/results/06dae9119c8fc75e595a9fe69d631aa03aee34fa
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3745312ae00982813f3adad01158405394adaa0c
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f70b4764fafe139ed079f61fa086a67c1d3c8088
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/71126e09349a2e81617d978f26bd74ebe3f7794c
      mipsel |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/c1c1aff074402c839de382bca55735584e76e177
      x86_64 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/1614530fc19eaac35261de1290cc7e1484bd88f3

-- 
http://autobuild.buildroot.net
