From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-14
Message-ID: <20160615063025.E4468101D5C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-14
===============================

        success : 202
       failures : 102
       timeouts : 1  
          TOTAL : 305

Classification of failures by reason
====================================

                   efivar-0.23 | 13
              host-libxcb-1.12 | 8 
                flannel-v0.5.5 | 7 
                  boost-1.61.0 | 6 
     python-pathvalidate-0.4.1 | 6 
              e2fsprogs-1.43.1 | 5 
                    owfs-3.1p1 | 4 
               linux-pam-1.2.1 | 4 
             bluez_utils-4.101 | 4 
                 mplayer-1.3.0 | 3 
                 jack2-v1.9.10 | 3 
                 log4cpp-1.1.1 | 2 
          libmicrohttpd-0.9.50 | 2 
                   libxcb-1.12 | 2 
                     php-7.0.7 | 2 
                openmpi-1.10.2 | 2 
      kismet-Kismet-2014-02-R1 | 2 
               linknx-0.0.1.32 | 2 
                    mpv-0.17.0 | 2 
               libcap-ng-0.7.7 | 2 
       directfb-examples-1.7.0 | 1 
                      qt-4.8.7 | 1 
                 omniorb-4.2.1 | 1 
          janus-gateway-v0.1.0 | 1 
              gnuradio-3.7.9.1 | 1 
                wayland-1.11.0 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                    norm-1.5r6 | 1 
                     tftpd-5.2 | 1 
                libaio-0.3.110 | 1 
                   fwup-v0.7.0 | 1 
      host-gdb-arc-2016.03-gdb | 1 
                mongrel2-1.9.2 | 1 
                directfb-1.7.7 | 1 
                  libvpx-1.4.0 | 1 
                    lftp-4.7.2 | 1 
                beecrypt-4.2.1 | 1 
make[3]: *** [modules/contr... | 1 
                cifs-utils-6.5 | 1 
filemq-e59951489045825d6fc5... | 1 
                 lvm2-2.02.155 | 1 
                 mesa3d-11.2.2 | 1 

Detail of failures
===================

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/8bfd9cb0c4b3c9701127d0942595fcd3dc3342bf/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c6ee2c6506bdc14eb9c2a9b1efd1a7972d10f643/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7419793335f1e5d262a6a5e21c47724ded7e86e7/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/111f6d4db57d1151a3304d7d4f12ef46e64b6bc0/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/f9bdee6a2685f6c0c8d8511e9bf52152b37689e1/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/648ec86123684b8bd5e7f1260cfb409ea8d31592/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/7424db33904af807241706e4c335949c5fcd54e1/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f7ec8c89690c227b3312fb3822ce4d94353737be/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/0a9e1efd8929776490e71cdae053f6966a6b8d76/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f1a8124f14ed99b0fd9c52cef35be00d1c4d549e/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4d2563da404816c63491d7083fa020278caf6719/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/9ddc4021ee43dfef7237d8fe20ed021f3aa18071/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/5ad95d57d5de47458b998cbd2907eef41ef1ba89/
     powerpc |        directfb-examples-1.7.0 | NOK | http://autobuild.buildroot.net/results/c9999e5555cc6ec83fce22efc20875c8f5385968/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ad07519465b7cfe6b1f15095e839bf51ba5793c2/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6dc398b2eb6256b9111f03ebdb30ff3b9d8edf75/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/1824a0e13be8e784237fa8a5963beca623f2d314/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/a8802fe8f0a926981a6fc484f57dd553ad5cadff/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/fef0ad0fcadabd4f678a32bc47a63102700bb5c9/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/7e5092b8c0e8a7411cdd34146997ed7d5ad0704e/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8a5378cedfe5fddb35efbceca1fe7887c6162973/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/dc74346881763da8e402d58d11d35cf18e9fff06/
        mips |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/38beb435e5c0a0fff80faea286f4e785e36e27f8/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/c8bd970a72240b2cc74e00c540ca621da0839246/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/fe468a7f0dae97ef295e6927977d96072f98676b/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/9c4ba340becc2292e73969783dbd09d6611d2372/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/6ff2d19eed4371e1394af78637c5c409cad161f9/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/154e1079fc4869d5212dc19c2798ec3fcd82ca7f/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/adaf0c113a339aefc5548b516c438a3b342dd2d9/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/374e62318d20b60423195a2bc558e2514221e90f/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8af7360c8d52997a78a8ba57a06bc58c9b54b386/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e58a7f11c605bf08e7e9b6266dfc309cd3dbc6f7/
        m68k | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/a5ec7f238129373906ee8bb8ab49e4a0dc167a92/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/2cfbf1ab0a5ebfc6852d5f55c9b9c4fc091ba4ec/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/cee9312171ed647d6aa1c3331e2e234f9c199065/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ffe3e9c75856914e2c2defe6bd6a8b13b1a28f42/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/84bb72484dc16a24a78a06d8d36f146884d9ff78/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/c4196ee3bf392f1ca1242c54bf4d28f20f87649d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/f95942a26df7b3f61d7e6a75271212c64a3f6e09/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e90181d742c7c13e3323744bae2df4b565708172/
    mips64el |                    fwup-v0.7.0 | NOK | http://autobuild.buildroot.net/results/0c5e3342949911501728176ea3c3690700f4db84/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/111b30b670606d142c0cbf2fda436c15c972def6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/0b537bf53f8e27e1f31139d44bc2837a0d3c2db5/
         arc |       host-gdb-arc-2016.03-gdb | NOK | http://autobuild.buildroot.net/results/2d6ea3e425eae198cf4e03f34307fcffe7bfacc2/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/daab7794cdbc22f8b08678b821ebe12e14f18445/
       nios2 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/931d3faf5e82e4cdf481c14f8950d7498c9a479a/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/2dc96540121a2fe451bb816d11f0ffcd0ac27824/
     sparc64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/c067127e3417c9ceaa849204a0870e249b3c5199/
         sh4 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/ac540bc370a431ef43623646a9c76a2822be983a/
     powerpc |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5527c48a8e57363d4389d04f6595093833a480b4/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/cc75ffde4912e67538d41e4b79c06e38d36ac558/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b495da4364ad073f46a8b82c16271c0736c0d530/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4e42f49530229677246e21a86213aaa86fef15bd/
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/78ae76523bffd031c39970bdfd6e2f62bdd47c09/
      mipsel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3988ad0df64d64b6b7aab88d71a4f7bc0a57d218/
       sparc |           janus-gateway-v0.1.0 | NOK | http://autobuild.buildroot.net/results/fa7494249aa2a74f8c043a6f8b3e00f5d5a8a0d6/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/b25613ea21a81533f22cc60a3ef88d23c8056340/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/bee1e8aab5bebb35f4ae090743801349e64ccd9a/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/623e0debe0d7fbce053ac360a53a1533311325a7/
         arm |                 libaio-0.3.110 | NOK | http://autobuild.buildroot.net/results/b0577738391b49ac7a4027a662ff829e2b704f39/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/eb0ca3ad53b0bcebe09a51ae7805018dd1e61a77/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/993a658bae0bbfa4af233ee2b923b2314d6aac86/
        bfin |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/278f534e3c483a83a36908c7213bbe16ed8a9425/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/14c02b40b77cbb16cc822d004175f7561bbfc780/
         arm |                   libvpx-1.4.0 | NOK | http://autobuild.buildroot.net/results/0258568d469e5854dfb176c3e21689085df1097f/
      x86_64 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/3c6a402be2a6130cd390a634274411221a70f16b/
       nios2 |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/18b6ad7610c80a4bc6298289dae20e7c59fe7550/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/6d3841fd47279d91c34032d2e4d06e441d2a8eb4/
      x86_64 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/73695a7f32fbaf3d8b52cd2a203f978f73d09e63/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/63bb2f34e3882c3c563e280ffdb0a353b32ca37b/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/03f77d0eafe4af056a546a933800fdadd5590ad7/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/31842dbcb7b0010be5da9b6522beb10b3bb0308b/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/475e093e3f00b8e8deea829d8f55afe9f2ee2a2f/
     powerpc |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/ea257496f51665b0a6b03f31e50744761c5d43da/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/402587fe3ba9d537195ba470cf6f19f25ac246bf/
      x86_64 |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/76063094694353c5650c42b1aed1bd1ff408eef1/
microblazeel | make[3]: *** [modules/contr... | TIM | http://autobuild.buildroot.net/results/095f9b17b8b57b9ac63adfcb7c36df6a722071a0/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/9f960f37e98440d5a29c43316b9eeb94868b827b/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/b5224dcf2a9696d77081d9cbed0f7516efe6b940/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/79dffc90dccef909275d919ce5c80ccfef17987b/
        m68k |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/9b002434a325cc7f1c5b659b66ee7e59704d156d/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fa0560560800f16c15208e82d0ec2cc1b121a989/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e4d2698f0a0cac49d59552bffb53f9db3abb5d2b/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/8e612878aee30b7048d0519eaad2b5f357a0baa9/
      x86_64 |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/bd0605d76d34adcc12e7e582b6d346947dbd4f1c/
      x86_64 |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/2f49c917a8f20f35e8eafc865379e419c7f52fd4/
microblazeel |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/aa4258cd97347b1b4bcf059fc3d5780357c4b57c/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/20b6a7d81794b83c9ceeee9592276d6b79d1a9c6/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/b92e0e57cefc7c9f04718a4c25a3d263f88a4d38/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/12b742088edc0e1ec81c75ca2c8224e2748ac80e/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/73a15e14cfbdef8d45a8a091dd51d7c0bd142606/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/eb196cef6137803d0ec59c9f84a44125fed3ef60/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/a686b5c5446a52ded16177e0c0ef49ef1412877c/
         arm |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/c8b84b1c3b026ea92e88d380228d8111f1c676bf/
     sparc64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/b90588c1e4498c589f61249686b0e7d79632a689/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/5c02941a2fca9067d25bcc1ace6a0e1e00be2446/
     aarch64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/a1c5b9beac810bc7a8b5e80031080f9933297833/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/5cf33b58365d4b9a6478578daffa53fbe44aff49/
       nios2 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/2401ac86ba0b6b6908f62b2e5ff2910b5c53b537/
      x86_64 |      python-pathvalidate-0.4.1 | NOK | http://autobuild.buildroot.net/results/13212c67d905e8176dc547d792208fc8ed928055/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/630ed3eaec37bb5f95f3fb95378e4b8d13b26462/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/69848a64d5ec044b296191636c9e8d8e7030a886/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/70e58ecf3f256e00af8940c952b5ff4b5260de62/


-- 
http://autobuild.buildroot.net
