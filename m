From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Apr 2016 08:30:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-02
Message-ID: <20160403063023.0D8DF102BD1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-02
===============================

        success : 203
       failures : 86 
       timeouts : 2  
          TOTAL : 291

Classification of failures by reason
====================================

tvheadend-cd9f07fb865e57001... | 6 
                  connman-1.31 | 5 
                blktrace-1.1.0 | 4 
           lksctp-tools-1.0.16 | 4 
                   mplayer-1.2 | 3 
                 jack2-v1.9.10 | 3 
                    mosh-1.2.5 | 3 
                   erlang-18.3 | 2 
hidapi-d17db57b9d4354752e0a... | 2 
                  squid-3.5.15 | 2 
                  ffmpeg-2.8.6 | 2 
       gadgetfs-test-undefined | 2 
                    yajl-2.1.0 | 2 
                 mono-4.2.2.30 | 2 
      ca-certificates-20160104 | 2 
               ipmitool-1.8.16 | 2 
        host-gutenprint-5.2.11 | 2 
                 libgee-0.18.0 | 2 
             ipsec-tools-0.8.2 | 2 
               iptraf-ng-1.1.4 | 1 
                 opencv3-3.1.0 | 1 
    erlang-p1-stringprep-1.0.0 | 1 
              strongswan-5.3.5 | 1 
                 qt5base-5.6.0 | 1 
    xserver_xorg-server-1.18.2 | 1 
                 rtptools-1.20 | 1 
             stress-ng-0.04.16 | 1 
                    ruby-2.3.0 | 1 
                 mesa3d-11.1.2 | 1 
       openpgm-release-5-2-122 | 1 
sconeserver-c4b8e14f6e9e06c... | 1 
     python-setproctitle-1.1.9 | 1 
make[3]: *** [code/CMakeFil... | 1 
                   systemd-229 | 1 
x264-a01e33913655f983df7a4d... | 1 
                socat-2.0.0-b9 | 1 
                    cups-2.1.2 | 1 
                    owfs-3.1p1 | 1 
               opencv-2.4.12.3 | 1 
            webkitgtk24-2.4.10 | 1 
                moarvm-2016.01 | 1 
                     rpm-5.2.0 | 1 
make[2]: *** [code/CMakeFil... | 1 
                    quota-4.01 | 1 
                 libdrm-2.4.67 | 1 
iputils-3a86a2542c6fe29413c... | 1 
                  psmisc-22.21 | 1 
                wayland-1.10.0 | 1 
glmark2-499aa81a68fb4c8aac1... | 1 
                  ltris-1.0.19 | 1 
                     libuecc-7 | 1 
                   taskd-1.1.0 | 1 
                libpjsip-2.4.5 | 1 
                  cairo-1.14.6 | 1 
                   nginx-1.8.1 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/e257e2a496c3dc58b4a291806da84aa96eb84034/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/49e512c8e0f798ec8a89875e24852e41006fe5ef/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/cb0b2436d1c27a230d33b36b74ee978098f33573/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/13da4600c36832647083e2648ed9374c350989ee/
        sh4a |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/9169d21e2d19f9d87794a758090d48e075ac4ada/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/cad5026d831096d23afb08714f52acc2d916b1a9/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/0bbdaff7223be0859519ab4f9a471e4b8ff5a3f1/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/771023b468f0ccfa9f4cc5d0e192137a5bf7061e/
microblazeel |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/053a1e7430b8e9e38bf75a1d4ff6b8224ca31361/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/fa96ca6390b511139ed7eb162e791f38858266aa/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/74c8c85390a866a96a3a14c004d17ff5c2da1c60/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/d72981433d2334da423faa5631ce4206d8557100/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/6fba7302d917906f31297bb25c26abf85dc76f5a/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/b52d31e6c197d57d3a3fd51d8ee3f50722d84157/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/2401f64affe94cf1d08cac7c3871805719de3b15/
         arm |     erlang-p1-stringprep-1.0.0 | NOK | http://autobuild.buildroot.net/results/0648af619f4e73136ec6be18a3a3d353608e8d3a/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/e2952fb9128d8b2006f4aeb7ddea4b4858a8af7f/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/ebdc99c7b95c30d5784de3f413c43da2e38c2bc7/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/4e2960f24766ad796030d0edc43fac9f220768d8/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/9f87466b466dc5bd55088ddf65d49c7d03a6f7c0/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/63a4ebf5dff033b66c4ca69da440e257564222bb/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/979d9038c908266cd6672482bc884a9da675091b/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/b2a56e22db36d18db0ce7aff5bc04069e18ad63e/
      mipsel |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/66fc777fb35c9ee7452d4c4ba06b0fc3aa12062a/
        sh4a |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/c7511857262691818386f29e02039b6260d6b1ff/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/afbf64c5cae296cea7807b3df80b38a83884fd49/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/1ba0097814dd3716eeefeed86ba0e435b9e45a2c/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/f77a19b6922283874774a079dafd1109327bc6c3/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/46dca2aa19c44dd117ca0d96e9b76704892baa38/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/ec76c521d2732f7de61527ee13d108eede08028f/
         arm | iputils-3a86a2542c6fe29413c... | NOK | http://autobuild.buildroot.net/results/90d551e0c1419ef2cd731694fbd4b6c1eb610431/
    mips64el |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/1d00c09cfe873d1fa083dad265dafdf0ca1d8a98/
       nios2 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/294b976117c46bea4ba19bded06264fd4e0f808a/
      x86_64 |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/576df82fab928cdc6d05b519961288181916b71a/
       sparc |                  libdrm-2.4.67 | NOK | http://autobuild.buildroot.net/results/e96be3a50571469d39d0a7eae25545ec548bfa1a/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/f6185c072c52082840944ca2934edb70efcbc55b/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/28ecaaf232eaaf3c7ea7dc3dab2b8a4d87aec4be/
      x86_64 |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/f721d5390bc61274c224bfe3a675ee194172ac91/
      x86_64 |                      libuecc-7 | NOK | http://autobuild.buildroot.net/results/038240c5528e0e3f94ec0a644202424494a88291/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/81168beccbc83b2a0572276e965445609b7b4183/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/ac65db7dcf88f2954406aa9d12e4e0ecdb9a01be/
      xtensa |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/cf234ce18625dd032298291ffc0ace3d1b7e0f28/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/82bd497edb1751000e8962fe94e38d8210dfad58/
      xtensa |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/a31daa063e397438e4db84e6a68aff649152211e/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/adb004834e2b7cb5631f1ca5638dbc95e156a8c2/
microblazeel | make[3]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/dfd1ebd08dae251ae1f832ae53ecbf7cae8ccc7c/
         arc |                  mesa3d-11.1.2 | NOK | http://autobuild.buildroot.net/results/c5352eb5e659e01987736228a213f69cc37c5971/
       sparc |                 moarvm-2016.01 | NOK | http://autobuild.buildroot.net/results/2432a33975e262a78282bba578728566fa64cb76/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/69dfa33885e197030dff24bed00d178cda0913dc/
       sparc |                  mono-4.2.2.30 | NOK | http://autobuild.buildroot.net/results/1a154a9e41da7b6794e7a1eaa4746e620d22f13f/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/bbe9543fa23d4d66db3448e3d6783a01cb895367/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/624a1fcae9633940714ae4e8ad9864e9611e93ec/
     powerpc |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/dc60afdf2b6035cd72567cf37b837db087c79bea/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8871e634b7ea515254e85d73ef0717eae4891974/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d9e873029664ea1c284ee17c78959498b2414f63/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/ddc937c41fb4b939dcfb66f597975c80e31f4463/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/5222ce6c9d6e37a2c16eff73e72058c840a0fac4/
     sparc64 |                opencv-2.4.12.3 | NOK | http://autobuild.buildroot.net/results/7a5dca757aca154c3db117140a228c8897cc0b77/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/b5d874eebfc2b45065671bbf1c818f3e3771ce00/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/038a7ddf63ee0543dadf9d926004388997cc4e66/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/e4c4e39c32b935cbc27cc3e6291aaa4d6fe91515/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/c4e52fec292b4d098f241a641b3c95a7ac462bcc/
      x86_64 |      python-setproctitle-1.1.9 | NOK | http://autobuild.buildroot.net/results/e0a74e3a9158e51a0d25c70ba7c8ab9b719b2e39/
       sparc |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/0c34b47840b2ac9bd7769c49a41365c44efddb57/
         arc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e058a84c0d744ec5141bdd3f5cf6b0262310160c/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a8e07a5af7c29373b1576d0f3ccd1fbf8cd52a79/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/789ebdc6a96fc62ca5c98bdd6b90de20872ea221/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/8ba29f1166e2076112d3ab3716a5c303da2200aa/
         arm | sconeserver-c4b8e14f6e9e06c... | NOK | http://autobuild.buildroot.net/results/c3b3342644f44501dd249f6f76408029f50be5db/
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/ec498a8ddf9df5cd6a681f3e9b2c126246e9e7fe/
    mips64el |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/58525138582a0030218a1b58c7b786452a8244a5/
         sh4 |                   squid-3.5.15 | NOK | http://autobuild.buildroot.net/results/bdd0a3d94df74e1f457d6eae0bcabc68ea4becd9/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/cd064aaf9fc47f55f03adee383a34030c591d0dc/
      xtensa |               strongswan-5.3.5 | NOK | http://autobuild.buildroot.net/results/e1693a714eb690988c1798b733d0ff143e50b3b9/
       sparc |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/94abf4907bfcbaed5815e34c84261c877ab390da/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/9b4a42bc7fb1595ed63e642a44c56ccdcf634f41/
         sh4 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/2489cc717fd5667229facba59d405ac7fe8bc497/
      x86_64 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/4f0091bd9d42be9e4a2e9f87e46d9537ae828b81/
        mips | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0d6f53c528a290c64d6b61c83b20b59fd33e4a0a/
      xtensa | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/0a029233933ea38eae5a23aae748658c0a573719/
    mips64el | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/e62dd4dbdb4c92bc657936566e73388e76343903/
        i686 | tvheadend-cd9f07fb865e57001... | NOK | http://autobuild.buildroot.net/results/4a041633f73f89f01b20517c729bd3583000fd6b/
        bfin |                 wayland-1.10.0 | NOK | http://autobuild.buildroot.net/results/7039742ee39754159098c6288ee2534942da50d0/
    mips64el |             webkitgtk24-2.4.10 | NOK | http://autobuild.buildroot.net/results/6d7e945a5238a8a1790fc22e11b40d7167a07de5/
        bfin | x264-a01e33913655f983df7a4d... | NOK | http://autobuild.buildroot.net/results/8efad074dfd4db1d8d4722935b6890e564687923/
       sparc |     xserver_xorg-server-1.18.2 | NOK | http://autobuild.buildroot.net/results/acfc085c4e65d3cc87ae907e663668b41d988b15/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/0f9b0ac430e73b56f1daf58c036de6458b10f17e/
      mipsel |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/8d12bd75eca1d712a7c7333f86bd9f522d6b4c5d/


-- 
http://autobuild.buildroot.net
