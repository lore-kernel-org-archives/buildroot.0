From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Feb 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-16
Message-ID: <20160217073021.A098A102685@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-16
===============================

        success : 234
       failures : 73 
       timeouts : 1  
          TOTAL : 308

Classification of failures by reason
====================================

                numactl-2.0.11 | 12
iputils-c8ff6feaf0442f8efd9... | 4 
                  trinity-v1.6 | 3 
                 libdrm-2.4.66 | 3 
               pax-utils-1.1.4 | 3 
hidapi-d17db57b9d4354752e0a... | 2 
               nfs-utils-1.3.3 | 2 
               trousers-0.3.13 | 2 
                  boost-1.60.0 | 2 
                    ruby-2.3.0 | 2 
                  prboom-2.5.0 | 2 
             ipsec-tools-0.8.2 | 2 
                   erlang-17.5 | 1 
                  connman-1.31 | 1 
                  weston-1.8.0 | 1 
        ltp-testsuite-20150903 | 1 
               libcap-ng-0.7.4 | 1 
          shairport-sync-2.8.0 | 1 
                 mesa3d-11.1.1 | 1 
                    vpnc-0.5.3 | 1 
               wireshark-2.0.1 | 1 
               host-efl-1.15.3 | 1 
     host-google-breakpad-1373 | 1 
                   fio-fio-2.6 | 1 
                      qt-4.8.7 | 1 
              macchanger-1.6.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    sox-14.4.2 | 1 
code/CMakeFiles/assimp.dir/... | 1 
                 qt5base-5.5.1 | 1 
                sqlite-3100200 | 1 
          chocolate-doom-2.2.1 | 1 
                   tor-0.2.7.6 | 1 
                    cups-2.1.2 | 1 
                   qhull-7.2.0 | 1 
     openvmtools-stable-9.10.2 | 1 
       poco-poco-1.6.1-release | 1 
               tcpreplay-4.1.1 | 1 
                nodejs-0.10.41 | 1 
        lttng-babeltrace-1.2.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                    ofono-1.17 | 1 
                     vlc-2.2.1 | 1 
                  lshw-B.02.17 | 1 
             bluez5_utils-5.37 | 1 
                 rtptools-1.20 | 1 
                 libraw-0.17.1 | 1 

Detail of failures
===================

      x86_64 |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/466a04936747fbaa4cdabc8258d3af03a45591f6/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/c415db285b9630321bac615ddf92c5b9163ba9ae/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/0791ce453b6d6569b7a8d899b64a2678273c5c53/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/e950c9276f925b5b9aba5cc7185115325a092244/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/1ea76eab2220506b985b66cadae7c2e6a5fa497f/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/012e00782e32b3e1ab6e9d3bbedf93d8e3c7ab2f/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/b76ac3edfc48cec55684a06aececde98349ec0d9/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/eb9197e43b591f2012d301bbe667aa53d921f6c1/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/eba25f0a02fc3c233339b6e1ef129477ac4a53d1/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/33dba28d239c6ec0218398bc020e0a46f11bb434/
        i686 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/97555ce6cde102f06159c46b75156db9434695c0/
     powerpc |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/25200b39b8c1fbfb638ddfc8637e1728e49f69c3/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/a4026393fa424cc74e38d2d597ad05ab8caa16e2/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/717bc7351744336405876124238da1e1fbe4283b/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a0457ea5ce80015c22d0b9f6c515a82ca819b10a/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a0507f38e4815c8606d2f95b1deb949335594e5c/
      xtensa | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/613b5b8e8c493b3638ba2a790218674098b3abad/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/464f44f138fbf5b376ef3804ba5caa1711f00863/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/31fa14262fbe221b1c3ae6b35357a0d285d4964d/
     powerpc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/6192bbd8d81af0dc50264ccf50feaacbdc496bca/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4f32c1e9083f10f3ef2b495c95450d0adc66344b/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/15e478b0ad82e7a2f72107e9785ae7b5982ac855/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/0df0ba26cc4b02f2effe165a48438587bb47a353/
       sparc |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/96e44a420f1e3c911517bd851cfcad3f02bc43b6/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/82a2f85c0f73cc196202966c01b91e4e8c3618be/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/31976cb31ed2219cbec274778dd77f9a0cfdda00/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4694f90b2734bf8059536dbf7a0d15d76d6f615c/
    mips64el |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/4c052593c99fa3df7fe193ba5001595279928e66/
         arm |               macchanger-1.6.0 | NOK | http://autobuild.buildroot.net/results/e66234a7e2891fe677879b5774287ad516dc7ef1/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/d6c8b716f292fb506875f1db468f16cd5115cd0c/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/2c41a7cb579559199acc0bd6aec477a50f2c2cc0/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/dec1cde8638b78981e962bf5cb64cfdf4305c086/
         arm |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/1a33aea4f22a36cab4ce4fb861b8ee4906e5264b/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/ea9289c3d99fdf27dc686619f6c29d688a631e49/
    mips64el |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/3c41d02085dbacec5f024413f75712f6a4f7ac44/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/1b5accb84d526eb2e352121b89d7748107b6ed6a/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/fef88dc3d84d638c4771fbfac7bfd08046173611/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/680da4b1b7d0a53077a909983598fcde494c1467/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/a30c2f1ec93cd95abcbcaaeafcaae3559d55615c/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/e102d71e273ea057d8f53ede3c853e01f769ca0c/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/b51d149330a11f814287e03b13fe65bacad44907/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/43e4772dcf63bcb8f6994a0664676970b1c51625/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/e95fc134c50cc5e01008968493be43cc0335d54b/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/10c06a46d6a0ba4a81c279dc15e1979c0fc202cc/
      x86_64 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/c13cdc66d9af1b4be961ab5c27420ab8ce7a3ea5/
       sparc |                     ofono-1.17 | NOK | http://autobuild.buildroot.net/results/7ec4142d0f41234309a226a21a7da7acbece90e9/
        i686 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/4242926345e2a3a4c19af08d1f6a347c97b559bb/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d532e2a2b008bb34b807fc2392bf5e7d4d441e99/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/041a13dd3695ee10cc3ac3c054f5ae3913e08e75/
        bfin |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/77b9ca9334ca7ecb3e29e7f8fe52abc1c36b24f3/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/ae966baa932d039a9ebdee136605fb6ec688fa49/
         arm |        poco-poco-1.6.1-release | NOK | http://autobuild.buildroot.net/results/693ef640a95702b20eb4e811936510e0a58cdfdd/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/c9a42ce8b17dd22f77d1dbebc11872ac66509bdb/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/eb18423f359e1a442a2492b3675d2e667e16ffbb/
        bfin |                    qhull-7.2.0 | NOK | http://autobuild.buildroot.net/results/edb8475c7671b8e55ca3b551d407aa2c974482a3/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1f40d0df3b7ea87300d32f0a75922a8d25122e16/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/b087732877a21bd797d0b469e00a096c6753cc66/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/7e2b8f987f0b0007eaaa6c6ace44d23906acd62d/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7fb90a0b6cc73633bcaccdca0f3b88599763eeaa/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/7623020fef32313bd5d581642cd65ba4333ff696/
         arm |           shairport-sync-2.8.0 | NOK | http://autobuild.buildroot.net/results/3cb79d566e197771d88e317789d05e9f467f4717/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/9be459b0f437501121d615689a426f69e2aa3fa5/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/8917056982ede44d30747061e8b5dde6cdbe6b52/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/d77e61dedff8d6281ea6ae31e5a0cb43fcb17cb4/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/142f2a26a830658cda5cf2a27205252930800829/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/06ea9d3b4911ff71b43ac1c2b84de46d8a6b6a49/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/a385c40085419fb9dc5628e7c3b5ab206d28c486/
     powerpc |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/abe719d86b9c5aba297bbf03acd18db07c652bfe/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/65cb8555abe3602104c0751b00180dd035a50ab0/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/12dcbd74f0d2e9a0c9538ca332d3f32dc70104eb/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/be2c2817b1471fb945b4df67bab73d8d6662f1d1/
         sh4 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/feb9659e63e2a7422a8e04e12ac0df1d5e897bdb/
        i686 |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/880bb326a0e9853f2a84ef21813ed7ae62483b26/
         arm |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/c5efbe7bcabadeeed4e3055bf1f9f0149057eaeb/


-- 
http://autobuild.buildroot.net
