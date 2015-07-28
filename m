From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-27
Message-ID: <20150728063018.ECCE8101BC0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-27
===============================

        success : 124
       failures : 68 
       timeouts : 2  
          TOTAL : 194

Classification of failures by reason
====================================

libsigrok-fe473123ba836445d... | 7 
             expect-2014-05-02 | 6 
                    quota-4.01 | 5 
             libselinux-2.1.13 | 4 
               libiscsi-1.15.0 | 3 
                 qt5base-5.5.0 | 3 
                      atf-0.21 | 2 
                  acpid-2.0.22 | 2 
                  opencv-3.0.0 | 2 
       host-erlang-rebar-2.5.1 | 2 
                  mysql-5.1.73 | 2 
               libglib2-2.44.1 | 2 
                libmbim-1.12.2 | 1 
                cegui06-0.6.2b | 1 
                    ustr-1.0.4 | 1 
             fxload-2008_10_13 | 1 
                 cdrkit-1.1.11 | 1 
                   bdwgc-7.4.2 | 1 
                 libepoxy-v1.2 | 1 
                    php-5.6.11 | 1 
                  dhcpdump-1.8 | 1 
          usb_modeswitch-2.2.5 | 1 
                   tinc-1.0.24 | 1 
           aircrack-ng-1.2-rc1 | 1 
                 clapack-3.2.1 | 1 
                busybox-1.23.2 | 1 
            libnfnetlink-1.0.1 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                directfb-1.6.3 | 1 
             util-linux-2.26.2 | 1 
               audiofile-0.3.6 | 1 
                  ltris-1.0.19 | 1 
                  cc-tool-0.26 | 1 
            libmodplug-0.8.8.5 | 1 
                    bwm-ng-0.6 | 1 
                  snmppp-3.3.5 | 1 
                 lrzsz-0.12.20 | 1 
             ctorrent-dnh3.3.2 | 1 
                 setools-3.3.8 | 1 
                  c-icap-0.3.5 | 1 
                  zeromq-4.0.5 | 1 
make: *** [qextserialport-l... | 1 

Detail of failures
===================

      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/7e60af535dd4177afdc4cb7b92e9abf27c3fba07/
      x86_64 |                   acpid-2.0.22 | NOK | http://autobuild.buildroot.net/results/90ca6a8d6947a320996376a453dfb1aa34b543ac/
      x86_64 |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/6394b7e939f6353f0553dca111f0d395f391c999/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/1acd3d2c2ff1afc2ddcddfa4aea11ad42e32f293/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/dcc6a4d892d13d6ee7755bc1449e34bdf21363bd/
         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6c818b2d3d33cdbe5378edbea4ff438666164c4a/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/317c4f3766690fbb43e42a02ebac1001ba822dee/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/a0c5582ff4071101dbf4b4b82b53c4179f274ec8/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/bf8cd49cb78dafd4809739bc8616ce20f13afe69/
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a4c057e0b1ab6a2ffd69b27f6f5a79f98eb040f6/
         sh4 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/7559993edf68cc697832d65ab3bd925724861e5e/
         arc |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/5b7238e4bf40e9fb114b6b9f937b8ec5a4aafe52/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/658ec1b4817b5f0d83a07992a5e49b98c3be0043/
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/2c9ef771d146ce5b9df82735fdeb62926c84bd9f/
      x86_64 |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/001774459724e57b5df6cccd85ec9584ef9cc31a/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/48298e5b487cffbdef53347165d8dcc4f6840bb0/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/3b4056010a8dddf67341f63414507b2e28b85824/
     aarch64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/42778c07e7afb0a59a763ee7c6abd1ef0a57f3c0/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/92c9b9adab15fc048da96ea478402b3719f85535/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/32c51bdfc8ca1bb5f67e45c04bc79975890c2d35/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/02b5aabb42d1d86b941670a366b55e14daff5332/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/4e976a4f739494003c788644f1858a9aeed47681/
      mipsel | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/89ffd2a03f295c810399680621440b08f7c7762f/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/c83fa909467e5cc668c42fe769b35844648417a1/
     powerpc |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/03ca879a65b1fc3449b8f30b1f1e354082fe4b7f/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/64ba4c9786719788e923262cde8b6bf004a79e8e/
     aarch64 |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/ceb0e5ae8222bc8c9638b13ceb7b444d8a83870b/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/b3cb6515496cf09d305a1077d01f87d75ece8a8d/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/9db61963bdcf8bdd6784e00af4945292cd2d816e/
    mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/138fa7fec380380f1340268017ef4d687b2653e6/
    mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/0a96f3654983ed2efc851522352dec43c1df0077/
    mips64el |                libiscsi-1.15.0 | NOK | http://autobuild.buildroot.net/results/c600ebf636b4c2214bce0ce13132ea62303d1559/
     aarch64 |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/62a32a2ad6693afd67df88807595e45b549f942c/
         arc |             libmodplug-0.8.8.5 | NOK | http://autobuild.buildroot.net/results/cf9e762a7d00b8a872b557186a56ba5816b89978/
      x86_64 |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/805a81bdafe604bc0b03dedb292d52ca268f8a90/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a3d7fd8c672f6e5165b4406f65f5e8dac94d953c/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5b78dbf815a396a5f1790494c015ad4275a8bb17/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7a0f3494d47b29b1fc51c511db60152c185abbc0/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b996a2e801ff7d23f3012cf3b21480f1922c0b62/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/3606b2d7d83f03ec9618730c0bad277558879f7b/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/5d7762fd586fe06cf8db050b778d66a4790eee58/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/91345c214ed156ef6ce3d84e0f9314a4064e5fb0/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/4635bd84592c0f20bf69e42b14b94424e4243fff/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/ac3852757f287cb8d858f642450ac1ea66a0ca3d/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/c7062902ce539bb6fb5d08d1215c65ed5bb911de/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/83c683bd7de6858d822aaa5823aa582dde9fccba/
     powerpc |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/ba6b014d1f4cd98fa0a1af51a3c4d978dbc17586/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/55f413667c2c7eb295a3879b575d7b140f51da5a/
        i686 | make: *** [qextserialport-l... | NOK | http://autobuild.buildroot.net/results/3e0f954df9196e89043f4aaad154dfdece08480a/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/475b0dd48edb095deb188c369c5864431c0bd7ea/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/aad30630e139f14dd97945bc3a0fbddcaef2bc21/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/af1eee92375cd59004603dacad732c80afe56898/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/54ad39189123f03fa2333ffb03539ea6b39d9e54/
        bfin |                     php-5.6.11 | NOK | http://autobuild.buildroot.net/results/a39d4911864bea5da760af9fabc682ba148383de/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/30acea45fb497942129ca57c143bab6174e14609/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f91de4a596817997b2f35c24b07aec43916c9e1b/
      mipsel |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f0891474fe2cd3e47b1489f147e31f698dbd013f/
     powerpc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d108d303a13f6acc941457acac3e70de9093b2ee/
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d96c6f29cd636ca1e6a58824032cacd068d6e2b6/
     aarch64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bf7f0bb9c3d94c87e90aa0bbfb438e1cfe1a808a/
    mips64el |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8308dc4443650ec1b2b47dafcf28516cb7f9a820/
        mips |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/9b58ba955e286dfadaa90b521c19aac6dbc0a2e2/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/a9f61063c86f58f4e1b23d8a40859182764e5bbb/
         arc |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/dfcbe1af751548b4d6966e0b4de6d0704eb9a737/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/15b0d93c63c442f194a666ab68e79b1b83f59e15/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/c1b80d94352258d9d0bca3d26c0aecd4e0f00707/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/8dbaa5e83c62cbad70d20d63d4059227ba578a9d/
         arc |              util-linux-2.26.2 | NOK | http://autobuild.buildroot.net/results/6deddedb2175363be89396daf690ba3e94b013d5/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e87ed0843800c8fa9948c55902b97bb162a87b14/


-- 
http://autobuild.buildroot.net
