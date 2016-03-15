From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2016 08:30:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-03-14
Message-ID: <20160315073022.B57511011CC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-03-14
===============================

        success : 228
       failures : 194
       timeouts : 0  
          TOTAL : 422

Classification of failures by reason
====================================

              host-libcap-2.24 | 109
tvheadend-3927788bb71ad0041... | 9 
           libimxvpuapi-0.10.1 | 8 
                  cairo-1.14.4 | 5 
                    owfs-3.1p1 | 4 
                  boost-1.60.0 | 3 
                  connman-1.31 | 3 
                  ffmpeg-2.8.6 | 3 
                    ruby-2.3.0 | 3 
               valgrind-3.11.0 | 2 
               linknx-0.0.1.32 | 2 
     host-shared-mime-info-1.6 | 2 
                     dt-v18.32 | 2 
          shared-mime-info-1.6 | 2 
        lttng-babeltrace-1.2.4 | 2 
gmrender-resurrect-aa3d02cf... | 2 
                  multicat-2.1 | 2 
              gst1-libav-1.6.3 | 2 
     openvmtools-stable-9.10.2 | 1 
                   mplayer-1.2 | 1 
                 opencv-2.4.10 | 1 
                      time-1.7 | 1 
           lksctp-tools-1.0.16 | 1 
                    mosh-1.2.5 | 1 
               libgtk2-2.24.29 | 1 
                blktrace-1.1.0 | 1 
      ca-certificates-20160104 | 1 
  toolchain-external-undefined | 1 
          libwebsockets-v1.7.3 | 1 
                    yajl-2.1.0 | 1 
              kodi-16.0-Jarvis | 1 
                  apitrace-7.0 | 1 
                 sredird-2.2.2 | 1 
                     mtr-v0.86 | 1 
                libpjsip-2.4.5 | 1 
               ipmitool-1.8.15 | 1 
        host-gutenprint-5.2.11 | 1 
                libgpgme-1.5.5 | 1 
             stress-ng-0.04.16 | 1 
                  gamin-0.1.10 | 1 
                 omniorb-4.2.1 | 1 
                xfsprogs-4.3.0 | 1 
             netbsd-queue-1.70 | 1 
                 rtptools-1.20 | 1 
               netplug-1.2.9.2 | 1 
                grantlee-0.5.1 | 1 
                    ustr-1.0.4 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/94a527408fa5db0385a6c282dc5fff758956ab41/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d6807b8ebfb9b235dd9cc25e63ba66c07eded121/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/7e6785c6660c8e3c54cbfeac01b740be5a52ce88/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/eb173ebfc9cd912e37a653bc24bb132ddff59c12/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f78afa07e5355729adc9186782e1cd3e877f4409/
         sh4 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/5061de1afa1100388b92192b4ae5bd5b8b3aa654/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/33974684704acead9c16ed272b1395cedbc19318/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/f0a931ad2676a58ead2d5534d6537d2b3f1b24b3/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/f97d3a2e2b9cd5bbbcd98e32d2de3d49faa5b72a/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/8a57a9dfb61ad5324fcdba77026d1e48ee9ecedb/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/467a014e334c80ab1a05bb3952b14c3e290991f6/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/0aeeb030a242a0064dd6b8f118b45a3d13d32a79/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/77ae8031d21d4a68a4d57a5fa5a4c213d792b4da/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/b7dacdfd2ee2586fffcd4c75f0aae69287535bce/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/d03571c03bfe32eaa146cc81fb58c127eaeeaddb/
         arm |                      dt-v18.32 | NOK | http://autobuild.buildroot.net/results/6641391638be29d8ab76da87f613bb92f18a4640/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/05cb2138d8091edb3c587f0c386cdf66d4cdee8d/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/d5b34646956a4c75db47bec603c3ba3e2be43d71/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/b601384d86faedd78668a4772595059e18d96e81/
      x86_64 |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/fd3ef0262c7bdae95474d692e785731943da1806/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/b887b852966a00b2eb1fb44649e4f0640c75e7c8/
      x86_64 | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/9cb2b557aa7a3e5b275012cfe8276bb2dd02d7f0/
       nios2 |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/80ed2fc0b0a16c5b53bc5fb5d6c97c78c16b4b38/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/1ee3b90319d0d3559448d97df2e394be6afa8c30/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/9d971aa4ddce5e63cf460e1aa233604f5aca4b07/
     sparc64 |         host-gutenprint-5.2.11 | NOK | http://autobuild.buildroot.net/results/930ff705bcc20d42ff16b9c6cb3b6ccc81de0c0e/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4ab090e4add0a05a684702d336be6bd89c864eba/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2143f51d7016db9b87f72cbca3e5118bbf42f6cb/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bfae7cd2e38f4b0311b0c6c4350a65217ab5873e/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4a0535ed969c3904541819a9539b5103ed0df95a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/14f6946ecdfbab34f089062f3a84d11ac6fce174/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c3e7b46c8210fa9b432e2b999cf689bf478bd6e4/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/941bf18cc0c3e8f6feace0f58f75e6a48a4bbe70/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/458760e191f0367aa916c39115bbdc22c49268cc/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a6169712ba39d63315e66cea8861b2240d3a48bf/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/77a1b9c1c88fdf2283696addfb70edc0e67391a4/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7cc5e8ffbbdcba82937283b69b4fc5867ce3804c/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d4389a6447f178b7da7326f7a9dc6ce17cd34e17/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/aac6c5f31abb77ef532dbbe830170b7b04913e5f/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/140f95c804df6df287997437782f07c34f3f635e/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e06402b0a65c1b316941e07f19283da0c9be79ce/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c6ceb2584a0b67ecf6ad61553d6cd9c0f053c1d8/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/88010497c2ef0360046e22a755db10d916979b00/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8f09cf5b1f7076d3cc01ceeff8cb6854dc10c6da/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/346f057960fee84491049532344f0e43a005aa77/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4f0694759b9734721fcc54f86076c9cf09fa2659/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6ca7769229cdb63652f2f2c2411996fe77c7f185/
       sparc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/86291976245e0858b2151a83f04ca783eb924d8c/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0252d8aa9f248348784d9d5417487e42016452b6/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3388c947808bce769394249813b683b77176e0d3/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7c28d4ee2eef7d9b0e5f822d1fa7807edc95731d/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a318df195a00f48ae4624467ba814c95a13e255b/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7aa86d417e077c7e7e3ffeafb40bc70a294d6a96/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/cb17a0269a078f5166475874609f3659e3dc3c81/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/69d7546fe9226a473a9cbb10806a44af0cb4cd44/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3764ab7b7e6b20833751fe30880f000d116a0cf3/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/de44833b599471e8a0383beb674d05fd884fd582/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/47aa5217a73afee582342726ca5f36d43176c7ac/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/412ef67a0edf1a5f9a360bbb92268954aadc5686/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ca300b1b95d9d9b9d146fcd5ce5fe3f52212e414/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bef66e9542df6be28d89f8b8f53b5a846c140507/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8fde52999f23fdacb2e178ffaa8a4f85404d275c/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e2bdd7f82015d58ffaeb363cf38f8c2685ec4f89/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7ec44e863ac6d21e70a4a64302d4b6d2c2771a27/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f41db1eaca9359c3c4f07b1203634001f2a15f5f/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/14f521db380dc1f84f76ad5829cc7d799ff3940a/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b24efa15b2aa9072227c395a239af8e302604b80/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b2fbceaf79efec4e9d0afc08b0e4e0a810f50242/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a5a0978b07696c305ffe84780910ed4937beb96b/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8b196ffb9a822161518f69e23246b4dc518fedb2/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/20fb8d4ce435ff529a3bd630eb1a69241f4cff15/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5f42024f151f40cb76aeac5f011e53724314c2e8/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3627964eee38d9f8c4546d421bb64a0bf2ae0bf8/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/91aa324ed2752450d9ff2120cfdbd1171002f537/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6c591471a98b32bcd3cd792223d508418f917a51/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0c49f35f22fdd620b29a413fedc579324445a32a/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/833a3b064568fc6bc4d281a6865d7fc298c2181f/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/71ba1f302c625e1ade02322329ee2e3d56893172/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/dbcf569e5f98366af6345ec1fd47e313e9098a29/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b638c39c8f61652280e405440442389fe2f24e31/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0f732d7a2f41388261221c6f3da848c363053d08/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/646078a33397eb8813d489580051044b025d2878/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/79c9a8a9e91543c76d2f2b387d978e7a245b9844/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8d532d268bab66d60427ea8d13e2c66af6f32311/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6304bcbd0a0ae19fccbddab7285f34b0667b5a62/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/8e0b9bc53be50e78dda0cc2143ef81b51d216cf4/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b58b016937915793ea0f69bb982882825683b24a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6fead3a66009d7aacff671e3f96aeb76352f9dc0/
         sh4 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c801635a6c63e27661175823110ee5bdca842bb8/
     sparc64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c71b2d846a7a1715cf4684d907a345310116b6b9/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/1369be4b903ac0c7a2d3e4c4d9bd6ef94245a00d/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6fa093481abbf97bafb32fca6b17822fac9fdd32/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/94ce78b3a045a2cab7ad9f9fd51eabea3e33cf9b/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3575dee5eaaaf9e9320b4d3226fe57ba5f99431c/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7465a94c2386f174d9de870c19632eb179df236f/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/56170d7f87456b80d600cd036b13601604ccf446/
microblazeel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/413d8ba9f3a178d3c3c16bb16d33851614e78b0a/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7cedccd02ca9f24c195ad70368569370cf43c7ad/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6c6843a2c5129c40363291b176e393ecbfe51d92/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ced6918517197069e7cd278d7b19b769bfcfadc1/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3f8e6bcf07d171f155cd57bdbed133684b316208/
     aarch64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c93d8233d65e50be9e91465f1fe847156550acb4/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c49485ad21e3516693d3e04e278237ebd83899a4/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/64e1db4410b4503d0fa7267a90ad06b4a17a5a4c/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6f872de0971aac0d6c985928ab52b51427559af1/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/6a7cf621bd5696ff4606770d687eab509d8007a9/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/e0a638748c59869fb084645b6326585fb82ee4dd/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/b97be67e886e06f47aad5a609fe0a3ed8803d159/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/c8dc82622306f3b04af08ac5c0ae8ebe32109a86/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/304e4c16f34d469a1bec03982250d943746bbf7b/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/5eda032894bb3f28c780e27ff17bed86ceb58774/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/292ce7e831cd1fb419a5fb9c657a23d675273995/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/807939ad8502c4c80a2ba7264c585da158a314dc/
         arc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/2bc1f6f595c401e3c5e24272c719be5d55d3401e/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/0fcb8bbd7b4f95c0872c2e3d5b98b1290ddf6027/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/86846a61689562113b00d4f474f65566c377a6e4/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/85f74aba0492991fcb52d4da3e0d046d1ead9b6b/
      mipsel |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/bfb1dbdd5461e9861c69b75fd2453fd61c025ea0/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/af4b9de79fe9ad32c7edb6249fb0b730a283e4ac/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/592ae202996d762224996ab0fde6c5cca06ef3fe/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/7d69242247313a939f6d3954f49ccc95003214c7/
       nios2 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/285b0bde1ec48f480c557de6dab8f4c9778930ef/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/27cf0f4e9f99e2aed28f6d2579e3f8536f999dfe/
     powerpc |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/f0b8bfc29655eeaf8f07a29bcf08d8348eb8decc/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ba347174e2d32f4c9f97294d84d68edc703efa04/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/ce239f9fe0ec81051e0593dc6c948cab96c160ed/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4665d40b2624d1c4ddda70f9de6c9f0ed75ccc14/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/fb7281e1d80b7e94dc720c142d3aee9dc94a9e76/
        i686 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/53c987acdb417f664711015bc43c4ff38d455715/
        sh4a |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/a62b7bc0681f8562b257b4bedcaee456f8ca00f2/
      xtensa |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d2eb10bb2ffc1c8accf1bd27fa240e2a87382273/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d52c9ae5572d45f4d11dcaeea91f78c370701848/
      x86_64 |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4661df6571e660afe25e21213e78db6b387f45ec/
    mips64el |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/57c0bcfb8861a75563dffe4252dfbbcedad18d21/
         arm |               host-libcap-2.24 | NOK | http://autobuild.buildroot.net/results/eee8c8fd11a34e0d003971d9474961bb85ee2611/
        i686 |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/1ff40d80c8a5732e4b504c20bf04f1b062da82c2/
      mipsel |      host-shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/6c1fd50913ef8a3a5cc108f428f2c195c768324d/
      x86_64 |                ipmitool-1.8.15 | NOK | http://autobuild.buildroot.net/results/d60355f89806fe65252288e80b7997294bbbe1dd/
      x86_64 |               kodi-16.0-Jarvis | NOK | http://autobuild.buildroot.net/results/bd545f6bda7ebe7a22eba92ca2966e2fa2ed4199/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/1bb05e837c6ae721cb5c88d7e67fd0469fe96bfd/
    mips64el |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/59ae4e59aeaa2999ab307a64b30367db4d359312/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/8afa6f0080182958795de55dba0a51375448deda/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/dc9ebaf3d3793c9302dda77b9031b43368d4a844/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/537f5c98c4be965d9f4012c7eb89ab93839638f3/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/876f91f1d5eb5fba39078d78b77f7a9efa88071f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/bfb6a35da23d56dba32f0bb2e7832f5cff504b26/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/d97c8a6a7ab15ccffcbbf8319b4e638b515f072f/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/06561c6ffb8accfb0414ac5360bdd73a30c5c429/
         arm |            libimxvpuapi-0.10.1 | NOK | http://autobuild.buildroot.net/results/5bde44d40d419f43dfaa442c5480ebfa69aec9bf/
         arm |                 libpjsip-2.4.5 | NOK | http://autobuild.buildroot.net/results/2c5e55257925f0e620d131df4af9074a57dc6347/
         arm |           libwebsockets-v1.7.3 | NOK | http://autobuild.buildroot.net/results/0e1accedf6e0540a0a138e005ca69cd00749dc87/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/09fecd85c76ea5f57babb967527a7bf7c67757f2/
         sh4 |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/2dfcbd30079d13997de37e2d1c4643653e200be6/
         arm |            lksctp-tools-1.0.16 | NOK | http://autobuild.buildroot.net/results/570041b93ba81631f666bf9843767837fdc6babf/
         arc |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/aecb2997743e6e5a6cc67bc266cd01d0aa967477/
         arm |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/c39f15fbdb8bcec574dcceadea3acc9e9ff1890d/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e0a130e8a43b92b10584435b8e0088f8e77a2691/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/2453f8ef5573f466474829004192e04cc18069ca/
      x86_64 |                      mtr-v0.86 | NOK | http://autobuild.buildroot.net/results/36a82a9697f8dff93574d360fdd20120e22bd5af/
        bfin |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4468a9076863e02d04a3384a321bbd26f58d6bde/
         arm |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/fa98afec377a1e8fce64af5897d1f7af45804069/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/b02e238fea81ea4786d10ea386746b94f189448d/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/c933908008d4f36ae341cfd6fb84664060b68f97/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/a4bb2bcfc3fe239dd7fc189785ffdb12872d3bad/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/e26f0232ced11ed221df731c0c05f3cfff0bf95b/
      x86_64 |      openvmtools-stable-9.10.2 | NOK | http://autobuild.buildroot.net/results/2e5100ccf1ed336c26b83930e7149941c97fc4d2/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/27ebe4e62fe2ada575d85c36bed18f24f279c27d/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/e1fb8c3091e15e468dee67f39e7679b8d0e75cfc/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/052d83ce477321e2578ff4d584f6a71867e39367/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/f949a63eaa3744b517b5ae2bd64647c40ac3cf3a/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/03da7a4034dcf09d1cf6e439a73f020be5f85ba8/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/4e3ad41fe1e62cbeabab03bde3833250b97a1aa5/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/fbcbc5c73cc86c296089786805bd022bce401329/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/a14e9d933071b44053f3b6fc7aa1c0aa863109a0/
         arm |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/03fcc8aff675eb035e123eb2b01e4ed122c66cbc/
        sh4a |           shared-mime-info-1.6 | NOK | http://autobuild.buildroot.net/results/302822520556d946f6aef60d6e4ba621d11c3efc/
         arm |                  sredird-2.2.2 | NOK | http://autobuild.buildroot.net/results/f7e3c05f9b0e321bcbb43a097c3169a214de9c5c/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/0bd6657f27b9b58f3da45ef2a1775189e325e257/
         arm |                       time-1.7 | NOK | http://autobuild.buildroot.net/results/e64ff76ba7db4d073940a4a88eab79f945beb3bd/
      mipsel |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/f06afefb8f269cc5c67280c74696de02f2c263d6/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/bc3ba5d78260d08c901c1cee0e704fcc29f355ce/
      xtensa | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/d3bed6de2a953ba89463892f77947fd3e37bf133/
      xtensa | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/ffa2e87df7d0151ce68bd761e68ae24011c44bcd/
       nios2 | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/f660a3f6c3d18f721796e02ca1782ff05e7b7e8c/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/1e702ae97ee7474ccad149edaea247c11ac9f903/
      xtensa | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/00bc2c06251a513d41bbb92659f55068875070f3/
        sh4a | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/6321fecde32b449beb6f988fefc17070195cb8b5/
     powerpc | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/80730ef8cb3d5ae9134918615e217b2daa416e57/
      xtensa | tvheadend-3927788bb71ad0041... | NOK | http://autobuild.buildroot.net/results/b7ec71ce578ce13aba0ce480d0ae539160b494a9/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/6b4c80960ea526764b568fbb22c82f96a2ab24f0/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/3aeb5904de4e201094d470af1e3a6ddfbfd49695/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/167b7167e67c1c86f039228bc5c7020d206acb40/
      x86_64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/ef4652cd8c47ddb96a741a3a70ce307549adf0be/
        bfin |                     yajl-2.1.0 | NOK | http://autobuild.buildroot.net/results/06eebd97f9fe257d3802b3a72db0a744a25842d6/


-- 
http://autobuild.buildroot.net
