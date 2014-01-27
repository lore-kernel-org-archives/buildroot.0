From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-26
Message-ID: <20140127073009.0F610101784@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-26
===============================

        success : 53 
       failures : 86 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

               tcpreplay-4.0.0 | 22
                   gtest-1.7.0 | 14
              pcsc-lite-1.8.10 | 4 
          sane-backends-1.0.22 | 4 
                    mpd-0.18.7 | 4 
                     vlc-2.1.2 | 4 
                 libhid-0.2.16 | 3 
rtmpdump-e0056c51cc1710c9a4... | 3 
                     gdb-7.5.1 | 2 
                  iozone-3_414 | 2 
          enlightenment-0.17.3 | 2 
                   open2300-12 | 2 
                 pixman-0.30.0 | 2 
                libnftnl-1.0.0 | 2 
                 qt5base-5.2.0 | 1 
                  ltrace-0.7.3 | 1 
                  weston-1.3.0 | 1 
                 dropwatch-1.4 | 1 
         openpowerlink-V1.08.4 | 1 
                    sdl-1.2.15 | 1 
                 netsnmp-5.7.2 | 1 
                  nettle-2.7.1 | 1 
                aiccu-20070115 | 1 
                      icu-51.2 | 1 
                  libeet-1.7.7 | 1 
               alsa-lib-1.0.26 | 1 
                  thrift-0.9.1 | 1 
                 libevas-1.7.7 | 1 
knock-7ce33cd553800f48f16b3... | 1 
czmq-b5730c5f8290a611fd3b92... | 1 

Detail of failures
===================

     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/751b295730fd8257c27f17bf49377a162575c996/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/2809ede1c007f0ac3b4e5ab55cc0468e1741591c/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/690104ba81e096cae8ae4afe3979b352217ea63d/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a02ee74b8980a61ed7d6c59cd4779dd5bf77ed19/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/8b1cb409c30f533b3da2a490bd95f995f1a11e60/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/285c94d9f5cb42c37f774bcbfbe3ece181279413/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/1c65229c86aab7edbaf77f521535bbc68f9c620b/
microblaze |                      gdb-7.5.1 | NOK | http://autobuild.buildroot.net/results/eb96b2f22720ad75ad54a095399a4ca1b3e95ac0/
  mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/368be502a6580e42404a67e310f106e025a2390e/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/92520f09c47ca3918031ee082b889b6a717e8495/
    mipsel |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/bbdddaf796c301a20723da1b002a4539e725db0c/
    xtensa |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/ca99e11e9a35c217057d1d9642061ff9b3ce65a7/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/134c77f97964ba35491db7019bfdab202b69003d/
  mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/4b1ef47b3ae061cd6967f48ccf4b1f1685b0bf9f/
  mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/f0d1cbfee9acbdc5ad0d69cfe7358173f21918b1/
  mips64el |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/302c794b84c238eab21b807afee416cf1217a41e/
      i686 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/4a3c0ce713a4c674328a05b05d177fda3ea99931/
    xtensa |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/a16d5f3b555a9de5588cc83e6cbf9c245e172eba/
    x86_64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/53fa90e6df17ae332b2a2506a4d2ae009a618731/
       arm |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/478da030fb8c3a21a8870747f9404531764eb03e/
   powerpc |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/581dcc94b4aa5230e5f6ae68e94b0173e781f113/
   aarch64 |                    gtest-1.7.0 | NOK | http://autobuild.buildroot.net/results/6621b6b3f6be5d99c1fe4fe7bbe55e55bcaa3923/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/54bc4b8f53f16ba3f7d26a79fa27694e540f67f3/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/700653c4e6d566f4422bf4b48ed242d728e67cd9/
       arm |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/acae352c44c3c18f747e9c5a8e6879d8e29dfe25/
   powerpc | knock-7ce33cd553800f48f16b3... | NOK | http://autobuild.buildroot.net/results/7515498d9fd92c7249b5dabe3ddc176bebfd19d1/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/eb07b656f520855869bbc6c5ea2c16fa8fe785b3/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/e3ad730d2b94c439680e5d67041229ce35156da9/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/2714641cf70b283eac3be1f288ce1d4513fc1a57/
  mips64el |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/faea109c662c501efc379515eddc3e959ce5a4c5/
       arm |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/36a8dc95418814f485b09cac610f9ef11ad2e232/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/893f01cbbe973cc2a635c7527809eb98d75897fa/
   powerpc |                 libnftnl-1.0.0 | NOK | http://autobuild.buildroot.net/results/104d4f14db25ea02f603e862c2354ba2c3107198/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/4062a0c6293718b5d4d2cf1d39a0f7c2924f7f15/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/350a1d38ddf1bb8e68dadf9265425afb5203d2db/
      i686 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/c06b2b362f4fc6afa9928869082ab78739ccb846/
    x86_64 |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/71ea9562de5d04647c25f10a4f6d8e5c375a08c1/
   powerpc |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/33996faece5375f4baeb4672edfc46e5c1b91690/
      i686 |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/b601f3ef7c62e9b6aefda89640bec665c98af9dc/
      i686 |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/3c0ba8a65a045fc89ec66e70986e7e5939e4162e/
    mipsel |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/35c71f4f0131107ad2cfdd4a2740adfc4b0b0733/
  mips64el |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/05fa2cfbff43bd402230b1db2453716a4de9df69/
    x86_64 |          openpowerlink-V1.08.4 | NOK | http://autobuild.buildroot.net/results/6dec062a0498b56fd9564d1344f9e58f2e8a9255/
   aarch64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/072a59c8be24a7b2de02e1b7b5f16be16129e153/
   powerpc |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/d86e3d07eeed3b755d4f1b07c7fc9ba6c9640f58/
    x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/8fbd78d44303a289d651fd43e5be5b571ee0dc24/
       sh4 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/58803aa9e3af2eba6caf236e8d87e22eb665584c/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/0b0371d1d0c60909296ee7eacf6e91f80827f0d5/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/3a15524d03e59161f26d6d67aefa97b487acb223/
       arm |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/a56e0c1d906d128eb56bb0b92124628af97610e7/
    mipsel | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/1902a6613e5fc9656842fbcbd5731ac871d7ef59/
   powerpc | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/58f88bead5ee9d382bf22ab8b04f5d1456c32ba6/
   powerpc | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/dea1e7bd0ceaf0aa402aa3d2d741b4314c2e61b0/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/1934dc604787bcd3f0a15ea5de2ff02c10a60a51/
       arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/4a2c6f4993a67b0724c415eba01725f0a507c55a/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/d3cf9d0e5b647dc8ab2396f5a88f3f4d34933256/
     avr32 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/2bd228db7c238e8a801028477b26cee2651f2552/
    mipsel |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/03bac11bd2469e8b27eb64ad6b0148fd42a1508d/
microblaze |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/93e991aed80999a6096a6120f4e73fdc120ae149/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f901a4f02b3bc7d986c8fa3bb08f5bd561d67274/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/1f5898d8c622f8ddeecbb3411f2697162de60989/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/230e5ac3cafe4b8cb1477ccef364397a8ba2f516/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/d168c06b3529bbd41e7dd10f22ae02ebe11a8ce9/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/039586ac3b537cbdf420a0ab76bf4111cfc5b9aa/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/b8abe0fed77f7b577e7c2f0239bfee95df120833/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e2230192f8454dd86c129dc04063d84c1dc69344/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/82847a9b1142c9b22848ffab94b0cde32cf18896/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/a6a908f77391e69cc3bc77878651c9686d9d8c36/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f5d312b1ff3f31788f41b83b67f7e9b8b75ceda6/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2cb41691d2902d04e378264cb464dcedb9b77ce4/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/0344267c34cbc2ac5c67dd35fcf2b696681cea8b/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/2238815f3970e0f77ee61d7cd9704583f3a89a41/
    x86_64 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/154663ff42c0ff5f72ef43e16293c22820596e6f/
       sh4 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/f95d188a004ad39a32e709acad8277635da890a5/
  mips64el |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/e7a532fbd2f299b4e03ba0c8d06c410e4a134645/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/ecf55d70a3a7e37dd8225cc65c396cc5d8c1dcac/
   powerpc |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/92ca53e6c5d715b55dbad38dd66f6d3d372abcd6/
     avr32 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/65f30bdd367fb19cf62faf7d4ea07690d5ec7747/
       arm |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/3647f228b82d2ebb348b3b94ff60e1fcfb10cdce/
      i686 |                tcpreplay-4.0.0 | NOK | http://autobuild.buildroot.net/results/8316c1713c0a8da1a5026d46119e4d5912e1d79a/
     avr32 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/236f80d1184f5a815a126549d35f12ee09a4e448/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/6b99ae99c0498b7053f4b089bbd92a65c528066f/
microblaze |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/4508e79deb2ecdbabe3c6e4e340e49e839700f0e/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/54dc8963c0a51bd7ae4a6703d67250f7055092d3/
      sh4a |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/fa13df62c0c6c2674da7b2bc962938bcc3594673/
      i686 |                   weston-1.3.0 | NOK | http://autobuild.buildroot.net/results/7820da0fcdb52993aded7ba1802f89e5a794245c/


-- 
http://autobuild.buildroot.net
