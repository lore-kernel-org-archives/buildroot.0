From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jan 2015 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-10
Message-ID: <20150111073016.8BD8B100CD9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-10
===============================

        success : 217
       failures : 47 
       timeouts : 8  
          TOTAL : 272

Classification of failures by reason
====================================

                  squid-3.4.10 | 12
              host-erlang-17.4 | 5 
               lightning-2.0.5 | 4 
           libmemcached-1.0.18 | 3 
          sane-backends-1.0.22 | 3 
             libselinux-2.1.13 | 3 
                      qt-4.8.6 | 2 
            gst-ffmpeg-0.10.13 | 2 
             sofia-sip-1.12.11 | 1 
               libcap-ng-0.7.4 | 1 
                  newt-0.52.17 | 1 
                openntpd-5.7p1 | 1 
              xmlstarlet-1.5.0 | 1 
                protobuf-2.5.0 | 1 
                 webkit-1.11.5 | 1 
               metacity-2.25.1 | 1 
                     rpm-5.2.0 | 1 
                 samba4-4.1.14 | 1 
            host-heimdal-1.5.3 | 1 
     x264-20140930-2245-stable | 1 
        host-xlib_libX11-1.6.2 | 1 
libwebsock-3c1615eeadb0b582... | 1 
               host-qemu-2.1.2 | 1 
             fxload-2008_10_13 | 1 
              host-mono-3.10.0 | 1 
              jpeg-turbo-1.4.0 | 1 
                    fltk-1.3.2 | 1 
                    sox-14.4.1 | 1 
                  weston-1.6.0 | 1 

Detail of failures
===================

      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/322379d7e6f42b3d9d8c08a2b51416eb1d258880/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/912b96fe3bc9a0f9bde6a9d53a8ae105a86b329e/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/e801e16c3e448f334d8940c411e1d34e95368c27/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/1e4880f216f41adae073b9dc48d22e621413a7e4/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/1e06359a5ccab947ee84cd53eef44cd8ad360fc7/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b7fcdd55bbb2c359696493f87fbde9b350530376/
        i486 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/481ef2b12ebd3e41284216f564b71162cc32c8b1/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/27858a86bae0bd88945943d55c8c2985c84ab220/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6073e0c201cbbab60d5aa4be230d77342eb734f8/
     powerpc |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/f96e07a01decae39e0b8cd9af0c4554946479c83/
     powerpc |               host-mono-3.10.0 | TIM | http://autobuild.buildroot.net/results/5e4c727db9250df2ac7c2724bbd4722716a5c1dd/
     powerpc |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/731ba7435a0404438a52d76f31413287bee37230/
         arc |         host-xlib_libX11-1.6.2 | TIM | http://autobuild.buildroot.net/results/1e70b4b02dc83f9bdf64f824c3282515c5201660/
      x86_64 |               jpeg-turbo-1.4.0 | NOK | http://autobuild.buildroot.net/results/1c1e5bc112c10c3ba00240b531fb875d4287ac19/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/39252f5a63518f6e0135ccadfd6c7e837e213d09/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/8a02ae24ba18ad073a5e54d82b636687cc8fcab9/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/da5d35e09ef61ce71cfb4abc09b7eff77e2e5972/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/c322c71cc6bdc3ee58e26b9224575c6438f93a85/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/eaecbc6362ff4874ea2169f8562542ca74ba6f3c/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/b7feea822d555f75df4445392a090853ffb9863f/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/5a0cb8cb149876f9e6cffa98555b69a1e88147e2/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/3ebd2e3112df55aee42de4866de292d58a0160d4/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/341436e12aa08681493e1a88994ceb611b85a6f2/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/42b8542adab70f28d75f50a713723a070193c7b4/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/9665a7eca5b0b3bc790dc40b60532ce4222a37c6/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/6280d2f4ad79881121bc402e7d7e405ab824087c/
         arm |                metacity-2.25.1 | TIM | http://autobuild.buildroot.net/results/c6e07f578139fa4fc5f017cfd9821f28e8fbb845/
         arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/f40e0a8601a5a493c4cd3fc3339e158323d20ab7/
      xtensa |                 openntpd-5.7p1 | NOK | http://autobuild.buildroot.net/results/a4dd30679b9ab1dc66fc331ecf3acffe40c52a3a/
         arm |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/bbec3abb4b848d8173b1da8ee4e3ed43d2a04769/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/3a54e37f19d8084166de3154a15ff9c23833c950/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/a7a38a261ec18adb4a940b8a27b33739bd09e751/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/4a2948738ba1b0eed6b7ffa8d4a085b4b9952028/
      x86_64 |                  samba4-4.1.14 | NOK | http://autobuild.buildroot.net/results/aa3d192a010a4afb7e701c48e955f7ca1c5bf160/
        i486 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/5b1a5fc0fc62f2c2bc61ebcfc6b9eba2483327dd/
microblazeel |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/ddc2b263515093c9dfa19ba0660235d95ab07323/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/deb3d45416633b9217d3cc09664273687c809464/
        bfin |              sofia-sip-1.12.11 | NOK | http://autobuild.buildroot.net/results/0f2d3a5d67fa5d02657466a70c52b8624ddf57d1/
    mips64el |                     sox-14.4.1 | TIM | http://autobuild.buildroot.net/results/c4d91f08dfc4c82b36ead4a3ca6342789af8f2ad/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/434dc96ca5d1a4fc390c3f26c63686c2af16c1c4/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/aa8836ce732748f837982b140ec98f50e800e270/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/f439cf4e66d0128cce697533b6c3bbd54a440bb0/
      mipsel |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/7c5aa1162b2b8aae9cc76b17979508a1db81d0fc/
      xtensa |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/f202df28c6c0fa4a904fbb0dc270f3407b317321/
      mipsel |                   squid-3.4.10 | TIM | http://autobuild.buildroot.net/results/47d8a4181b3bdb75ed6251bd9f00c832a76f5902/
     powerpc |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/79d3bfb8aef087f6489979719bb4e65b04fad246/
        i686 |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/bf8bc0d147cf185fc4534a5cda776533aec4b687/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/615fc6e6b98b3810880a69a74fdbabc74d789213/
         arm |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/e8a5e3b60e1cdb1bde8016db2484fe8c5f79c74c/
    mips64el |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/c9b182e86f107548b95bedb5be1071545ff823ca/
        sh4a |                   squid-3.4.10 | NOK | http://autobuild.buildroot.net/results/8188108474f4af044ac7b11d73c66ea87b8e5291/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/11f06631babe67cda6dc5105e807be473a62c538/
     powerpc |                   weston-1.6.0 | NOK | http://autobuild.buildroot.net/results/d46e064885136eb0f8d819e341ee307bd5cdc650/
         arm |      x264-20140930-2245-stable | TIM | http://autobuild.buildroot.net/results/d6ca4ac163570eb00205828954af6de3916ab807/
        bfin |               xmlstarlet-1.5.0 | NOK | http://autobuild.buildroot.net/results/117efe0b13ff1990620dc5c2bce5f55ece68f413/


-- 
http://autobuild.buildroot.net
