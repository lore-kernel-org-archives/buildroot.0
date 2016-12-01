From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Dec 2016 08:30:32 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-30
Message-ID: <20161201073032.C5ED621D0A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-30
================================

      successes : 215
       failures : 31 
       timeouts : 1  
          TOTAL : 247

Classification of failures by reason
====================================

qt5webkit-b35917bcb44d7f200... | 3 
               trousers-0.3.13 | 2 
             berkeleydb-5.3.28 | 1 
                bind-9.11.0-P1 | 1 
                  boost-1.61.0 | 1 
          chocolate-doom-2.2.1 | 1 
                collectd-5.5.2 | 1 
                    cups-2.1.4 | 1 
         docker-engine-v1.12.2 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
               libdvbcsa-1.1.0 | 1 
                 libnss-3.27.1 | 1 
make[3]: *** [src/CMakeFile... | 1 
                minidlna-1.1.5 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.20.0 | 1 
                  nodejs-6.7.0 | 1 
                 opencv-2.4.13 | 1 
                 openssh-7.3p1 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                    qemu-2.7.0 | 1 
             qt5location-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
          sane-backends-1.0.25 | 1 
                  stella-4.7.2 | 1 
                     vlc-2.2.4 | 1 
               wireshark-2.2.2 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/41805163c673192d702eb5819ed1f17f93e8adc8
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/4e09237061b7d429049c4f24997edde699c6afe8
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/9f18f70780cee84abeb6fe5e313ff59100ef40e4
 powerpc64le |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/07a2d4644faeed2977f8e456a45226e64ffbe551
      x86_64 |                 collectd-5.5.2 | NOK | http://autobuild.buildroot.net/results/f257bb09dfca8eb2a473d7e99c9aecc8135949e1
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/091e2ccab0d45b7691be40b9fcbaf5171a4cbcf4
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/aeef29d57bd9f5a91341ce670816928f4d2f7e87
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/24bc0e83c2ecf14f7f8a3d97e38207aa65b7c2c0
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/f760efe95a90b94b48cd4105878fa3e1d24e8c09
 powerpc64le |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/39aed17b28acceaf70b7c6beb31978a7c7cc1377
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/2d7bdb1f371cf5afe33d1e56f8e73d9c056af8dd
         arm | make[3]: *** [src/CMakeFile... | TIM | http://autobuild.buildroot.net/results/d1838c824f91104943d3c8b1936f8a2d015f7c55
 powerpc64le |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/fae8cf862e91d34d80e6aebe85503617cfaf5937
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7d3ab15475ecec79c01b7ceebf20aed5ff037fe8
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5c345c10a911085cfe98b124170df0ed25a36849
      x86_64 |                   nodejs-6.7.0 | NOK | http://autobuild.buildroot.net/results/8dc7046b59e062d345a5eca83044ba7f7d7ffd45
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/76a9d4f48178db6d36ca5f5d728ad855960a4796
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/3008a32b07b3fdb228341c6c938079fab040ca1b
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/01fe75ffcecd38e81de5021e7c554dfd3afc5aee
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/e6d84d1e1e7908c8f03a6636a6b7777ad4a0de9a
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/bdb5ba12cf1fa4d9b3c5e1cdcae873e168ba6fca
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/a547e24d2f0d8ff7e8b19a443aa46b42b8cab707
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/404dbe2b01a095d5db338c038a30feaf0b85bc65
      mipsel | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/95c79d1c30b47c35aa29c8531eb0745922f01680
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/ff41883c061a6f9867d5e739b462f6247f1201a3
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/39c794deccf562af86329b68151f01a86276c114
   powerpc64 |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/e5370b73a3acc1ccc2af8fef6ce4d8c0e1f5c6d2
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/2a035dcf10255c017af318cdba4161484dbc279d
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/d9da3f2a3fc451a6101883f102bfc5a9a8c41eca
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/0d4df6fa532c4e7cc9d1cc6ca0b78c5838ab710d
      x86_64 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/109e29572b1cbd1a20cd865538da645e499094d0
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/567e9cc702fbc14bf44749ce79971e97ff2347ed

-- 
http://autobuild.buildroot.net
