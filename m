From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-05
Message-ID: <20140406063010.119BC100CBA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-05
===============================

        success : 41 
       failures : 46 
       timeouts : 2  
          TOTAL : 89 

Classification of failures by reason
====================================

             ipsec-tools-0.8.2 | 8 
            lttng-libust-2.4.0 | 6 
libuci-262fede3e8c8c08c1eb0... | 5 
              host-scons-2.3.0 | 3 
jack2-37976441044d69b91d61d... | 2 
  host-python-setuptools-2.1.2 | 2 
                  libevdev-0.5 | 2 
             util-linux-2.24.1 | 2 
        ltp-testsuite-20140115 | 2 
                   eudev-1.5.3 | 2 
                    gpm-1.20.7 | 2 
            host-omniorb-4.1.6 | 1 
                  python-2.7.6 | 1 
                 mesa3d-10.0.4 | 1 
                   libavutil/p | 1 
zmqpp-36413487f05b165dfc82a... | 1 
             host-thrift-0.9.1 | 1 
                  dhcpcd-6.1.0 | 1 
    libavutil/parseutils.c:110 | 1 
czmq-b5730c5f8290a611fd3b92... | 1 
               audiofile-0.3.6 | 1 
                    crda-1.1.3 | 1 
                    php-5.5.11 | 1 

Detail of failures
===================

      i686 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/a0b31d8dc98bb2d4ad7acdfde2eaa8861d02c8f3/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/7ccb5dcb4d2a5ac7b8f882923e2702b2941d2928/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/c702b73eccda082ef76b1a2d407af8c6848da009/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/c32ad4bac5f651502e551f7733f702afaa0e742a/
   powerpc |                    eudev-1.5.3 | NOK | http://autobuild.buildroot.net/results/a975d7b81f051ee1ab56087853d80ecf454c2e81/
    x86_64 |                    eudev-1.5.3 | NOK | http://autobuild.buildroot.net/results/d20f4d959789a2a3167f8bca0a8ac6b0bda2dd9b/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/bbf806c8eae1a9601671c7db6969745fe83ec83a/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/a8f6d9abd11a9320b2c9e30164a60fec9572880c/
       arm |             host-omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/484c33fe398fbc42248c5693a87cf2fe1eac9005/
   powerpc |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/6e74a343b4e8e113fd34d45c9279419e233afe8a/
      i686 |   host-python-setuptools-2.1.2 | NOK | http://autobuild.buildroot.net/results/a6512d4c32decc4b5444c7b4ba004002146c4f11/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/9f80153cf97ac23c3caa9095b06e71cb26d94e82/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/48024ec8aaaf596a5814edb51e35e94fdb803950/
  mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/b4a813f0e702d2d97d38659d7ce67084e67c6837/
       arm |              host-thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7590122fd85b644ae0886a127005188d1f882bef/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9c03888aaa970b902e8c0c2d45c81c44e8a0e525/
      i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/6ab5fc630ce6f2cfae93c07334cdd645d7ac3f6e/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/300141b20e0b712d49da2ecb26a06a258d138e4e/
microblazeel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/238296556663d52015beb43df97106f6e164ce55/
  mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a6e66d341a9bad7b8a86dbe93bf0b96eaa1bfb66/
      mips |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0bf4198cfe9ec6fc3452934c996be71f17f46d8e/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a1c450bb908f526a330bad1a6a4320b42618f3fb/
       arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0ce8be803b024cb65e61135c80ce9b8f28b3bc5d/
microblazeel | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/b4e10d7055e412ad96dc66a90aa23689ad1259af/
       arm | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/a81721c90d5695c73b81f27e14f186c61d6d8f6d/
microblazeel |                    libavutil/p | TIM | http://autobuild.buildroot.net/results/9f39f7c729f23804a6a5da6962ab91f978d19830/
microblazeel |     libavutil/parseutils.c:110 | TIM | http://autobuild.buildroot.net/results/36ddc1c4a5adb48e7cacf0d143a07afc9ce15152/
   powerpc |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/dd04833b11a0ebb0193c861cb375b2112dd339d1/
     avr32 |                   libevdev-0.5 | NOK | http://autobuild.buildroot.net/results/cef96c3c7c1479bfb38fb5c7160ded94511f8894/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/b156539a113c265e4779eaaa0df7b61b9f6e63ec/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/02a8e0374b19432f4fd7abcd032c08ac202d4d70/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/fc593369ec684ec4760ccbec0105a62f417b2c3f/
   powerpc | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/e2fa4822390bd429277a81ffafff628f23103b86/
  mips64el | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/a140e9ea33202e8b870ec047a573f269e9a74b08/
   powerpc |         ltp-testsuite-20140115 | NOK | http://autobuild.buildroot.net/results/b5829966aed8a86af728aefd997c3e2e2fd3c4e6/
       arm |         ltp-testsuite-20140115 | NOK | http://autobuild.buildroot.net/results/5c1b7ad6d4149a91bbd2a58c426d05b378f3c7e2/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/635a4c235524bf1bdeb00b5cb561ad601e23b9fe/
   powerpc |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/07961e79bbf689e323a673d8d7dbc40be6247365/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/8d12fa43f0165feccc924d28e6268f9a1993cab7/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/96dcf9a8597b6133b377084aa63636711a24c63c/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/ffb87e2c411671080ee4bca3d22223726a2e05c4/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/0f9b993ad2439c71b64d92e12fc437c8143d25a7/
    mipsel |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/9d1655d2236d9783a4b4898668d9cf813847b228/
       arm |                     php-5.5.11 | NOK | http://autobuild.buildroot.net/results/0dadb182d7550f5a7bf86005aef3528165c5b1ec/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/bc55f75d633708c8321eb78089f4abb7907c5470/
    x86_64 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/389feb26b03a79a2a62e3090089503809fd3aee8/
      i686 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/6ec9ae9f7af2322edd16951243cf2f23819b825b/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/6abe9cf8ebe6a97c0adf20784967777bf6af92e6/


-- 
http://autobuild.buildroot.net
