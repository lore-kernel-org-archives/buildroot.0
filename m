From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Sep 2013 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-19
Message-ID: <20130920063008.7C55952C101@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-19
===============================

        success : 70 
       failures : 63 
       timeouts : 0  
          TOTAL : 133

Classification of failures by reason
====================================

    trace-cmd-trace-cmd-v2.2.1 | 9 
                 qt5base-5.0.2 | 4 
make: *** [/home/test/test/... | 4 
make: *** [/home/test/test/... | 4 
                    orc-0.4.18 | 4 
           python-pyzmq-13.1.0 | 3 
                 dropwatch-1.4 | 3 
      host-gcc-initial-4.8-arc | 3 
               alsa-lib-1.0.26 | 3 
                       bc-1.06 | 2 
make: *** [/home/test/test/... | 2 
                    ola-0.8.31 | 2 
                      qt-4.8.5 | 1 
             gstreamer-0.10.36 | 1 
               w_scan-20130331 | 1 
        host-util-linux-2.23.2 | 1 
                  iozone-3_414 | 1 
                  boost-1.53.0 | 1 
               qt5script-5.0.2 | 1 
                      icu-51.2 | 1 
               qt5webkit-5.0.2 | 1 
                 webkit-1.11.5 | 1 
make: *** [/home/test/test/... | 1 
                 omniorb-4.1.6 | 1 
               libglib2-2.36.3 | 1 
                directfb-1.6.3 | 1 
                     popt-1.16 | 1 
                 mplayer-1.1.1 | 1 
                 libssh2-1.4.3 | 1 
                aiccu-20070115 | 1 
                libtirpc-0.2.2 | 1 
                   ncftp-3.2.5 | 1 

Detail of failures
===================

  mips64el |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/193127bbfe0c6070194e62fbedc783d50d232a2c/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6e6b2ddee308626098dcad9208e0425536cc9f76/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/09b2279ece11f56a3ce4722e8639af5d932a10b6/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/aee6ed7dddd69de8520a0ebe7d97f9c758ebbf93/
       arm |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/49d78f0528c6ecc2adfcfa17f4b09ec225c594be/
   powerpc |                        bc-1.06 | NOK | http://autobuild.buildroot.net/results/3d50274fd7fdb4f1576d068ceda8b759a08b2fc9/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/77c53ddf804b8c54a710d039b8b1beb77325214e/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/33c95f8c36ca8db40648ef9f70c7aa531d520e92/
     avr32 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/7c7b7df5695df94557e7461dcba085573645fd07/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/4ebde0913a7f96e8ee78df528d47a68b8743af76/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/604d68540885922aa63fd23613b5472495e71db6/
    xtensa |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/ea9c30dcf5847b12ce33b8cd5ab3b9fa1f658694/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/ff903ce970ea652cc1aa57a5eb57e923dc4c5405/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/d3b2e4e32d531c08c19d39b248898fe462b81d8f/
       arc |       host-gcc-initial-4.8-arc | NOK | http://autobuild.buildroot.net/results/76a2ab46ef7183f14eec944db4a598325e00b503/
    x86_64 |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/0e2ff8e61a67a40e143a5d714a29c89afa140de8/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/58b34c7729166b4ae8b585d98ed6b905530d97b8/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ce1fecd6445b10c9e43ec43f3b91eb5c8f67b34b/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6fc465d1663d276bc6bac6b9edbd0b0d63071f80/
   powerpc |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/b68848cd8e77f7c0f7ba93efb6754d7a274cd227/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/8a09a7d89073b6c74a7551864c5487de69a9af86/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/14eeec85eb97fa4dc27425eb13198b1ffd6cf450/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/2b452476b75cdda4bfce57b1d93fefd71301d41b/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/3610be3ef00226a6fd4fd1235e7b247288c7e57f/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e5c4f5e25c72430e5160308b4db7210e7877666e/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/063915a55e49096a39a53f8839953f5efaec261e/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b4710a36679b516c07b37e73a815857764cab449/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/73de8ca9a30642ccef8bb0181bb028d6ea9c49d1/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/c22ca77ba84ba8423883f5e34a28d2c6c3a1ad51/
       arm | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/e91c4868fa911c7498985c72f2eb7566385764e1/
    x86_64 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/19acd48195857bffd99a703dbe05846a883f792a/
      i686 | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/5f5cc4f4a0d30da582934affba2724aeeb91d7d5/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a8f5a018f297307976bd0a1a0217c44786d864ca/
      i686 |                    ncftp-3.2.5 | NOK | http://autobuild.buildroot.net/results/33d0fde74a5c35da7ed9c38039b581b7da8c7d27/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/7d8437cda1c9f8cc3a93f28bdec2616ddebbebef/
   aarch64 |                     ola-0.8.31 | NOK | http://autobuild.buildroot.net/results/9cba27b7e35e3639c55a95b3291111577b5834bc/
       arm |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/61a0d3b22943623778265dad3bec9007924ab2fe/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/7cb544393816d62284cca9dd3381703d782841d1/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/8fc1e8cbd6cc3e3066056b5983d09ecd8ae659b2/
       arm |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/8517f4e75b0a69353b8bcd55e24dbd88376006f1/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/1cdba71798ed90e69a8a5e845fe547ba25b4913a/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/b5e158eb64b68dfaba92e8ac45156546c58f1bd3/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/b557fcb270c2984184715834c904c79d8c4a0868/
   powerpc |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/6f624771016012f075d9082fc039dcd447bfd645/
       arm |            python-pyzmq-13.1.0 | NOK | http://autobuild.buildroot.net/results/458d1fe1682afeb1638061e70e7005dec02c7bca/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c53eda251e8fc11d11d6fdb27a48328bd1acb465/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/520dd41b93f2f82932b2308c971b5365a8c9f8da/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/436dc8c03e2f728e375013b2a9edbdd45722e7ce/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/1f72b1bc6b8aa95ba3cf3081617608ee6ab2096f/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c332567f06b49b230c475b2b8a6c19b10278c17f/
  mips64el |                qt5script-5.0.2 | NOK | http://autobuild.buildroot.net/results/8a8142676066b40fe7a03946c2fce4024aed6c56/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/642f902c105592c759392a38a3c8f7aee2756965/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/deb376c626bca6a5a35b1125db9e5692cd901478/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1e98d95aaacd2a976b00063820c471646003fd6e/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5ba39e047e26ff7dc9ec9cbd8b9185a3dd7cd511/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/e529d92b956050ac96332a20a906a03889992ff0/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0f9c5875d8e937896446f866cb3faa3da8f2723f/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5a50f8a3b82c76192917d075050ee2334ae09119/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/ab80d73398f295025887c7ad17eb1c9328277896/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/510ea5d0889a6363e20f7fa14792e73d96923625/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5c69dc5b52b9b8bc3e77946bb05ec4e205fd6f16/
       arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/5e33f7ce11a40a78fd5be8e0089814acf6d3aa3f/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/31b9169ed9bd00fcf0bff8de12e0c7f382ca2dac/


-- 
http://autobuild.buildroot.net
