From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-24
Message-ID: <20180325060012.82E3C2083D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   2 |   0 |  29 |
      master | 312 |  79 |   1 | 392 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 
                     php-7.2.3 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6eb4c70dae933db59940552e0289d1d5ae620fdb |     
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9c4174e52ec6fb373679df53d200267e280867b2 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              tpm2-tools-3.0.3 | 11
                  host-go-1.10 | 9 
                tpm2-tss-1.4.0 | 7 
             bluez5_utils-5.49 | 6 
                  udftools-2.0 | 6 
                    liblo-0.29 | 5 
                  brotli-1.0.3 | 4 
              keepalived-1.4.1 | 4 
             libmpdclient-2.14 | 4 
                 mplayer-1.3.0 | 4 
                   systemd-237 | 3 
              tpm2-abrmd-1.3.0 | 3 
                     php-7.2.3 | 2 
               asterisk-14.7.6 | 1 
                  boost-1.66.0 | 1 
                busybox-1.28.1 | 1 
                    dhcp-4.3.6 | 1 
                    gdb-7.11.1 | 1 
                    gst-ffmpeg | 1 
                   jamvm-2.0.0 | 1 
                   mpd-0.20.18 | 1 
                      qt-4.8.7 | 1 
            safeclib-v03032018 | 1 
               xfsprogs-4.15.1 | 1 
    xserver_xorg-server-1.19.6 | 1 


Detail of failures
------------------

         arm |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/52ee88f027fd051256d47fb8e4bede8f1f8b25c6 |     
      x86_64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/70a8c2bcc2d9d4b858cfaaf71fe262cd93464323 |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/c5d2c501a7681dd05cb715acc846749905a0884b |     
     sparc64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/c78a068e0d4da31dc35ecbb1f66ec0808f49c1f9 |     
    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/5b7c7c6f0cc25e05834d07bb6fb7561a169f8c9c |     
      xtensa |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/e7336b960619b1ff6b51707e470482ce99e31760 |     
        or1k |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/ecf1fa06eb24ec4a71aa883e771060fae5367b9d |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ec910a37fb8e03cd4d2c5a5081c86d4eeacd8fba |     
microblazeel |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/645b8e20fb250968d1e25419f844ef2f7f5c47f7 |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/68e05c634e62ba4b6f6eb8dc95eeb16faa58fd60 |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/66632155a3da87f6ed3705df5e59786c60b588b9 |     
         arm |                   brotli-1.0.3 | NOK | http://autobuild.buildroot.net/results/c01931daca0f68762aad172313019125ba930777 |     
         arm |                 busybox-1.28.1 | NOK | http://autobuild.buildroot.net/results/d0b1bf8b830d137231c8710996398b2656fb5862 |     
         arc |                     dhcp-4.3.6 | NOK | http://autobuild.buildroot.net/results/f818e6925c9046a65bb6accceb38db7056bb7526 | ORPH
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/895207bf9468fdc1ce007197afbc7c7b7f2195eb | ORPH
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/2b04ded1be688fd337fe2d94e0885eaca9e1e06f |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/199128bb09b8719387a7ae2e1a0fb5d462bb0a22 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/7027a4fd7310f9aad850d4ff2cbeff0f4951fe68 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/613e15fcdf91bc7e11dd74573c9479480f0a65d7 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/13a27f9f0a33535f9a451de0dec22848473ab96e | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/d3aae00e52875f2bfde80da510dc515eb87a7e6b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/cbf014d5df1e0d21d15b61452e611d40ae5eb07b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/51f574e654852c5abace90f69d8383c6ee7d0703 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3fd67f4c1ddb4d11cf7b2753fc7803ea432c2d0b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ffd332a39333eaf43eaafcc05858b44450532855 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/52642c90aea34fd849c49a07b07a2bfde5e74e70 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/ce89ec1e5681b17d11ed602e76501901737184a1 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/177c36995ed93b2cf358715ad66d021e64dca1d2 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/30006a7fa04ad6c2ffee4e7d7e391d8e97dfefab |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/a4ae0931971fc7e0b8547259e9a9a94c5445805b |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/699e15071c11e2371eb6a137be7cf13c454ecb76 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/5012c8b6e81d8edb64e019e048779daeb85c4230 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/2aec522b0242dd8f2d6eaa188b8b8e7b1c8a572c | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/20711baca62f1624483563675add81c55525f677 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1210b24400807e63bd3d157948b3343ac005ba7b | ORPH
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b3e1c7197c126cd317038386c2614e8512acdbf1 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/24dbac3005bd023f4e303446270096a0e47481fc |     
     aarch64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/8ed7e0670f0c1e1ff33da392ca592504a3df0901 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/dc71202bdb5edda5421f4d32bed0ebd0071462a2 |     
      x86_64 |                    mpd-0.20.18 | NOK | http://autobuild.buildroot.net/results/531933134180f93c31790152851b7fe822afa2aa |     
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/eb35067c141dc18f89981358bf4bc7bec824cee6 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/4ad984c1bcf370ec13d2a96f783f33429d7c85ce |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a1fd65a74a811a26a2d0c7e82b04d5bd3b5529b1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5948a2044e407b3cfef0240426a78b684534bb76 |     
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/e1ce0048575feaeb648e9d4ed7717cd7ac7a2b72 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/ae03aead76ba6677bde79117ec708ef21d4310ec | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f428d4be2e6da206b573e91d71dbdc1dc5f701d3 | ORPH
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/372821487babcade5f0c48520931ab6a021d843e |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/4cdcb094d6ff60b9a263b9453659eaff1fe72f09 |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/b9a630c248bd4f780f7d14aa32759a8d5ddc3429 |     
        mips |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/2a2ed964cac7b812d18ee024f0f423dc3ad414cd |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/99ae622a254db6665cc7a324d3c2acac071e8961 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/e61d35392d6f186149b1af7f89bd90c7e633f289 |     
        i586 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/716e97393cd57911b2757df07af60ed10e886e32 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/ff400ec0373f2f0ea050f4911e6c669373a6747d |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/1dd7d36e55737fe45cd1e0d3d2c68238e74dc13b |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/80c8fdd08e04173708d4074253171abef311defa |     
      x86_64 |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/63998b433d0148e87099c25e9afb8dcc49bb5c40 |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/193906295953d5fc6df79da48bb40ebc9dc721da |     
        mips |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/6684f102d706a8773aa37106b79c22f09ebf1122 |     
        mips |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/2dc62980477f554a3bae110d5300d9f426ebf231 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/26779e40890e5af020f43298f92bf271fe08511f |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/9a0a50f8db748ec80f1947fe10978d80f8a5bae2 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/72317fcd960dd94f583f7c0b86b95127d441fa46 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/efb079f46c6ff6605d3bb06e0b99669fec0b2ac7 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ff97ae3bb3a63a897da8601ce5afa93faf3c3b28 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/b00af7394fb0b9b277ba607e66253939f4493b7a |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/12482aa24d240a3cfa179549ab8945c4b398f77e |     
        i586 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/58e34aff686c521de34c174769900495e4365cc9 |     
        i586 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/43434aaeea0b1ae995a3d8135f4e0e1b0d93e723 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/d812e91bc961cb998a480461515bd0b12a2ecb04 |     
       nios2 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ef6beac94413956399a40dd18969c0578b11d3da |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/99cd3277923c9afe605a629f81a7393a3f2736a9 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4a70b532b95904cd9a2bf5aeb4bc43827e00c842 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/28f88a9cf444480a14ee5936fdfc87799d4b4879 |     
      xtensa |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/abe3a78f97105b569427f18948b233bf9bb99baa |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/de48a995c8ec80f70d8752dff5952571ccbc94e3 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/4a607fd8e9d47c8f4783f4d29bededde04339ec0 |     
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/3aad812582d94b76d204436d2879bfa732c34da6 | ORPH
      x86_64 |     xserver_xorg-server-1.19.6 | NOK | http://autobuild.buildroot.net/results/fbbfaa9f3eba6f68630787c558f41876e2c86a23 |     


-- 
http://autobuild.buildroot.net
