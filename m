From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-22
Message-ID: <20150423063016.21621101D7F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-22
===============================

        success : 136
       failures : 70 
       timeouts : 6  
          TOTAL : 212

Classification of failures by reason
====================================

                  dhcpcd-6.8.1 | 9 
                libtirpc-0.2.4 | 8 
                     vlc-2.2.0 | 5 
libubox-5a0bbefc8fa44044625... | 5 
            python-pyqt-4.11.3 | 4 
                libevas-1.7.10 | 3 
                host-gdb-7.8.2 | 3 
                 leveldb-v1.18 | 2 
                elfutils-0.161 | 2 
               mongrel2-v1.9.1 | 2 
                    qpdf-5.1.2 | 2 
checking if /usr/bin/gcc -s... | 1 
                ipmiutil-2.9.5 | 1 
              postgresql-9.4.1 | 1 
                  python-2.7.9 | 1 
                    webp-0.4.3 | 1 
       gst-plugins-bad-0.10.23 | 1 
                libupnpp-0.8.6 | 1 
             lttng-tools-2.6.0 | 1 
                iproute2-4.0.0 | 1 
                  bcusdk-0.0.5 | 1 
  toolchain-external-undefined | 1 
                 rsyslog-8.9.0 | 1 
                host-ola-0.9.4 | 1 
                 clapack-3.2.1 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
                dovecot-2.2.16 | 1 
                 webkit-1.11.5 | 1 
               celt051-0.5.1.3 | 1 
            host-heimdal-1.5.3 | 1 
                   mono-3.12.0 | 1 
                 tn5250-0.17.4 | 1 
make: *** [target-finalize]... | 1 
         lua-periphery-1.0.4-1 | 1 
                     php-5.6.8 | 1 
           aircrack-ng-1.2-rc1 | 1 
                libedje-1.7.10 | 1 
                 civetweb-v1.5 | 1 
                  snmppp-3.3.4 | 1 
                numactl-2.0.10 | 1 
               libecore-1.7.10 | 1 
                       unknown | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/c972eaeb0cc73c3e26a1a7cc77db79a0b72c8861/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/04d93c0581c2e12b48fb1e0c5b767d3b2703fdd0/
         arm |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/57400b327ac6447d2ab7da241f97bfcc96742bca/
        mips | checking if /usr/bin/gcc -s... | TIM | http://autobuild.buildroot.net/results/e008da4ec114fe25c87018e921cf0df802cb5bb7/
         arm |                  civetweb-v1.5 | NOK | http://autobuild.buildroot.net/results/97b014b2a611ba2528dda86bb05d6ffbec51c21d/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/a630f27c5e4e50185396866935cc33789840cece/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/07c17b038d12728f4cf8c5ff755653f01f163f5a/
microblazeel |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/21d12149db7717a94f72f353326576a374dd374c/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/30c5fdaa53337bd044634a43b312da5e21cd555c/
     powerpc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/5b46461b6c91e12ea1f7d66cd356c4ee0e73b3e5/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/ec078b5d8a1e1895d03259f44ea0680705f4f57c/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/1ae224a61af791bba3123ec4afdc1fed592fd6f2/
         arc |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/df22074fca0b54e607055d9174d83245388df798/
     aarch64 |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/4dfbd8399aee3d13c238ffff6ac884d62ada715e/
      xtensa |                   dhcpcd-6.8.1 | NOK | http://autobuild.buildroot.net/results/b9fbdc281cb4a33ad65a02952ee6eed6d2d384ec/
        i686 |                 dovecot-2.2.16 | NOK | http://autobuild.buildroot.net/results/53fd9003a4cf7d128f4d64d43209fe26d859a829/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/0d1a94b9da206ab4c20d27e53a211f7688d85950/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/cb9cee98cd3b18be8dd9e1b1a7867f24e2066160/
      xtensa | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/24901b2dfc92b516f74054ea7bb71e1ccfc3f12f/
      x86_64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/5f14701e4f9923d9af94c9e4e2907f51b8ddcb0b/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/960c54b6e291a338b029d7c459118aaf54a335fe/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/4f1118489fdd21449af42a7885a0a54cefc9b213/
      xtensa |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/f78325988016c118c6e3603b6cf0a29de579ffa2/
         arm |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/000e7a7095d4fd1eac46a19e4d541a65ea498fb6/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/0b2c427196c73b22fcaa538e9e56534c92ab66d2/
        i486 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/1fa39278fc0dd30d1fbcc3565ec49b8ace2d8a82/
         arc |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/e2785a35bc6bc63d5da77e406e589889e7d39055/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/4a4152913d688d73d7695569eff8120fe80c56fd/
        bfin |                  leveldb-v1.18 | NOK | http://autobuild.buildroot.net/results/b089eb657b21bf1522892818da4a6542243149aa/
         arc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/18573af8a84a1831c294e378b042a1117073cde9/
      xtensa |                 libedje-1.7.10 | NOK | http://autobuild.buildroot.net/results/adc6a79515913f9da19de47c0076afdeeeb085a5/
     powerpc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/9e2d89589f27638b589a53437795a11f98c3fb3a/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/dfe5bf9f7817564662c59fee47b3f39d3e87ced3/
      xtensa |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/5baf7c1a59d7991401ec0387f626716af952e27b/
        bfin |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/af86cfea6a5a0671afb12e36d467e3f33f2a0a2f/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/81c9650f897a4ad67eebddbeb27647161971a91a/
      x86_64 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9f0d1b7283f8d640b2caa469efaf29e3b6d6ddf7/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d20e1fa2cf323e73e0942f16b344fc12fcb12f65/
         sh4 |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/91086b9b7a777d3b51217f615c2fb6d4421ffb6e/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/4b1fc6c9c044c733a048bd886a44c11c603b5d1a/
      mipsel |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/3f3e14e99df8e5857fd2c4e7dec85878e231e9bf/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/5f1f2389af79f780575d588ed85abbc9e9a82ad8/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/522b5078660bd92727053fa20810226197245816/
     powerpc | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/c79a042f6d318618449eef5367c2fa7dd008701d/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/4954d1a108dc3e13fa66e9085c2dbe6811f37201/
        bfin | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/56aa637b3fc7badb51ba1a89e320daf6fda446a3/
      xtensa | libubox-5a0bbefc8fa44044625... | NOK | http://autobuild.buildroot.net/results/879bd44979fc701dcaea06f8bb44b26d30fe55c8/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/26db965b51a0e1e64998058392011397bcedca16/
     powerpc |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/9492558c29515d3e58cd26783818379cc696b499/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/0061abb3426699caad0a6deb6eb3798299ed107e/
         arm | make: *** [target-finalize]... | NOK | http://autobuild.buildroot.net/results/70b636078541ee0e5cd10dd514bb4a15173249fb/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/1fed43891877bbfcf9c1e0aa39da71cccded6df6/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/061d2111d2fd07605e4608eee5d626d64b99701d/
     powerpc |                    mono-3.12.0 | TIM | http://autobuild.buildroot.net/results/9eb5a692168a572ab6d74e93764d93531abb70be/
    mips64el |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/fe73f62bdcbf9cad872783a48c3071d3af8285b2/
        i686 |                      php-5.6.8 | TIM | http://autobuild.buildroot.net/results/07bb8206a259d527d730df53b9611693dd968082/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/3939c79715b6235d70b249c65c0bd96396f9c64f/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/564cb86789e98801a37b888739b35dcb87ab8854/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/17c21c67131e32af8062bfe3fdf5fb38d4228e2f/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/ffd316cd6ffc4ca88482e9e7c75aaba398e2142b/
        i686 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/4840f41f872d7cdd2e5258b0499cabd676a5df09/
      x86_64 |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/a493f15dfee157eaad673fe98b22c8e416145b5f/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/fc45fd1bd249f58a3d8907bfd410f5dfbb452751/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/35de3d7fafab1926b81229bdbace861155d05c5c/
      x86_64 |                  rsyslog-8.9.0 | NOK | http://autobuild.buildroot.net/results/084b988dee9c266976dc87d140922f569c800570/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/6bb3e635983fa7d188bfe40724131a19a94f3e95/
        i486 |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/bf8e20594b1484fddb7dabba31b61ee1ba3426df/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cd670d09a417d3b9cce4bc585aabca6ee347214b/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/82bbd18b9155966952debf05a066a9d188e5dc98/
    mips64el |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/fafa18efe029f467a132ed9b45c0f7d27fa97b95/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/0bee8646c2dd7dd2c201ee2986f3e802277314a5/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/4693f5f3d362e74a55c8145dbe777606f5865ad5/
     powerpc |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/bd4be97c7909517109195efb073553df869d1a7d/
         arm |                      vlc-2.2.0 | NOK | http://autobuild.buildroot.net/results/64a1a6d39b72b9dec4231b9f28ca14b38989d7df/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/b815ed7b20aa082ea5b8c18a0a3561ee4a6c88ef/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/26ed07fe917e1af21b5c5c3e4f6c2b39d78a8aff/


-- 
http://autobuild.buildroot.net
