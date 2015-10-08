From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  8 Oct 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-07
Message-ID: <20151008063019.B0B2E10163C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-07
===============================

        success : 200
       failures : 64 
       timeouts : 0  
          TOTAL : 264

Classification of failures by reason
====================================

                busybox-1.23.2 | 7 
                   mplayer-1.2 | 5 
                 sudo-1.8.14p3 | 3 
                pulseaudio-7.0 | 3 
libbroadvoice-f65b0f50c8c76... | 2 
               alsa-lib-1.0.29 | 2 
                      qt-4.8.7 | 2 
              swupdate-2015.07 | 2 
                  mono-4.0.2.5 | 2 
                   bdwgc-7.4.2 | 2 
                 mesa3d-11.0.2 | 2 
            gst-ffmpeg-0.10.13 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
           libfreeimage-3.17.0 | 1 
                    ffmpeg-2.8 | 1 
     adwaita-icon-theme-3.14.0 | 1 
               libcap-ng-0.7.4 | 1 
                  apitrace-7.0 | 1 
                  aespipe-2.4c | 1 
             ebtables-2.0.10-4 | 1 
             host-mono-4.0.2.5 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                    parted-3.1 | 1 
                    ruby-2.2.3 | 1 
     openvmtools-stable-9.10.2 | 1 
                  boost-1.58.0 | 1 
           qt5multimedia-5.5.0 | 1 
                coreutils-8.24 | 1 
                libevdev-1.4.3 | 1 
                directfb-1.7.7 | 1 
                  fbterm-1.7.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   nginx-1.8.0 | 1 
                    faifa-v0.1 | 1 
                    gmp-6.0.0a | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                freetype-2.6.1 | 1 
                 dropwatch-1.4 | 1 
         qt5connectivity-5.5.0 | 1 
                 jsoncpp-1.6.5 | 1 
                    ustr-1.0.4 | 1 
                   ushare-1.1a | 1 
       kompexsqlite-v1.10.12-1 | 1 

Detail of failures
===================

      xtensa |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/13a662fdb8729ad8c28b1c929756b524eabc3d92/
      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/6ba1d647d4f870ae104f6db8b374fd3fbab148ad/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/e2c76cfecfe73fb3be6891bb3ce39a86059c8aa7/
      xtensa |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/5848fdcd4cb6f621f4146fec51942b2b88e3fcd5/
     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/10d78ebc2f1f322e0b84f7bf9ad56157beb866f0/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/2a5e4c59b55ecf6ed7ba57faf82cbaa03c451736/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/f1a0d5b338171606db8de69e65f08715b477cfd1/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b31e41a4ced3e0c062ed1fb213fc0c27726bdcea/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c7ce2edf211ddfa0670454a8677637ae02241117/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/230329dc0848365606024dce6397f68818578d14/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/af86e1a2086f3af9207ac9e863fa0e4edb4c7c28/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/52214e51ce5b6ce875acf1e84f28d3b769f3db34/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b52a0c617f30d9b6bd4abac33cd8707f048d3801/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/72469e314e0336e57d99c172e5ee6fc1b1db0caf/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/57985aa8d0109bcc0dca877baf9511b63c004fa9/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/08194a9bbd0022a7f947e55910f9690d27a23567/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/09be43a806a45a123efe9dbb74e6d1ec64721e2e/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/52a2e77348b946b1074b15e8dcfb3332c3b8bb40/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/110def662b0e918d27a64b6d0a996c4fbc8b51de/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/be5f90155edaf470cd7ef1daa37cdc4ed37146ef/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/9b4d5ee12dc3e48d87da9f90f8e852a2ee49bb37/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/ab2334700b44bac233994b76f2acf1795f0e8991/
     powerpc |                     ffmpeg-2.8 | NOK | http://autobuild.buildroot.net/results/d16856bdac02fd6ff73c815dcad876ec89ce4b69/
    mips64el |                 freetype-2.6.1 | NOK | http://autobuild.buildroot.net/results/a1c404373f1b1788026a6ab39f2f429bd2e4eb62/
      xtensa |                     gmp-6.0.0a | NOK | http://autobuild.buildroot.net/results/4649f9406020021bd80e7472ecd207441d0eb18c/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/5aadb3f74c52c39802d1fdd676238990275829b6/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/b9aa4eac73c6c6bbafc621e8767c1f8a8894fd05/
      mipsel |              host-mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/698250a974921cd80b364df58063ae38e9267bbc/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/5f47787860d6756cb2d9a33f237f483b16576d1f/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/6015cae66864314666637217f596535f975f24b4/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1a70446143920c1a88aa21881781729045dd0d5f/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/31670b3e3f754515f556c887f05feaf49a7da4a2/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/4e62e7d727daf7af7017b85e6490c12d02234e11/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/2b47ee774cb2f0034a87ae79f7aca7ebd122b035/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/5fd637abf8da039a6f2516b7d61bcb0487cc0748/
         arc |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/9b11b43c0ae90688f531d0202ab24e8e6d18df50/
     powerpc |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/f068a90d89a3ef820c9e43cc30dee2b9d6476d8e/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/6123224eb0c883594a6ed1f4c104af06a0a3f157/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/e85afca3743efd47cef491d1fc1f7d45bfd11216/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/70dc033eea2f977277c01ac0d1dd101a93cf6ee3/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/6c474e321633c1c5813058fb022a17f8e5827d1c/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/baaf78f81b304cefba845d14d86fd9ba6885d8dd/
         sh4 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ff666a71e99740554585ddaa7e5b4e3790418474/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/0188df7f6e51c9cbd263c59f8d077e9e72570034/
       sparc |                    nginx-1.8.0 | NOK | http://autobuild.buildroot.net/results/4211e52067ab2d99e2e2ab96dec64c31353277b5/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/6c05dcf1a573fb1be4b357b29f7c128b6a56331b/
      x86_64 |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/fa5b95e4510a891a7c5a5a59dea40767f2bfc1b4/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/69cc8f91a4dc9edfce8d7518dd781e557c65f973/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/46276245fce0e2313b0481f08e82b3ab81f9249f/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/ff17f435e25bea5d1b2b3b98452381ee038ba237/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/e57200fc30ac1cdba382770e8fe996b32dd77c17/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ffe04866f70bbec90baf8e9abe4263528a798a8a/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/dfb2b253c437d0109b9d06e7bfb5e0d17cd6d5f5/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/026c11aeb757da88f4393de227c128ed17fc9bd7/
      mipsel |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/df59e47f3e3c45cd6d60108940584836f04393e9/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/eddcb24aa02faceac70ec39d5e8b5574746b23ea/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/1cb7c9fc76ea9116c38bec29a44172b24e958bdd/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/0ebebcab3ebb6e7bed760921a17e4ca0fcd7574b/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/99a395779aa02b5ca5ad82c1a1d0f19c49de75bc/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/c8f10f85bd7de452da7e30a906c57ee2144df402/
      x86_64 |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/e9ad4e95cbbf75745ba6c4a60d584807f9a3c4dd/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/46803b1a6f55dffb0e08372af86e2e7c4ae864f1/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/1c25bd7edba37d97ca6e9345a52eba3b54c35f13/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/271478ab7222a72eb48ae72af71e9b5f768f24ce/


-- 
http://autobuild.buildroot.net
