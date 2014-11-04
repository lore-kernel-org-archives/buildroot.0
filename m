From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Nov 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-03
Message-ID: <20141104073015.4ACB510134B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-03
===============================

        success : 223
       failures : 130
       timeouts : 1  
          TOTAL : 354

Classification of failures by reason
====================================

     adwaita-icon-theme-3.14.0 | 51
                 schifra-0.0.1 | 15
             lttng-tools-2.5.1 | 10
                  avahi-0.6.31 | 5 
           libmemcached-1.0.18 | 4 
                 clamav-0.98.4 | 3 
                 webkit-1.11.5 | 3 
                 rt-tests-0.83 | 3 
                    qemu-2.1.2 | 3 
              sqlcipher-v3.2.0 | 2 
                  zeromq-4.0.4 | 2 
                  libv4l-1.6.0 | 2 
                     radvd-2.8 | 2 
               mpdecimal-2.4.0 | 2 
               alsa-lib-1.0.28 | 2 
libwebsockets-v1.3-chrome37... | 2 
               libcap-ng-0.7.4 | 1 
                    fltk-1.3.2 | 1 
      dovecot-pigeonhole-0.4.6 | 1 
                    orc-0.4.22 | 1 
             subversion-1.7.18 | 1 
                 libssh2-1.4.3 | 1 
               iptables-1.4.21 | 1 
                libupnpp-0.8.5 | 1 
                  thrift-0.9.1 | 1 
                    lftp-4.5.5 | 1 
                 omniorb-4.1.6 | 1 
       opentyrian-2.1.20130907 | 1 
                  taglib-1.9.1 | 1 
                minidlna-1.1.4 | 1 
                jasper-1.900.1 | 1 
                xapp_xfs-1.1.4 | 1 
                    ruby-2.1.4 | 1 
ltrace-0896ce554f80afdcba81... | 1 
              host-erlang-17.3 | 1 
                   systemd-216 | 1 

Detail of failures
===================

        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/ebff05584331431ac474e7c1849e00d0758625c0/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/e21eb25c39a451552d3ab64d592cd76b440479d3/
         sh4 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/93157c54173c0aefb7adf0fdf7cd2a753714fcbb/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/803056390490fe81703cf09ad34458b9831d7e51/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/880980cb977be7346065f83e20a4f5fee6db83d8/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/95778d7423d3419ac22a9c212dcc7e58c5bb19b4/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/265e1979d5621f649c5dcd7ff591f17b332181b0/
     aarch64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/62262d010c122ba553a6eb81803dbeb3ad7b434c/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/3b10ea5872eb722110a57aa678ef2b08d68e7c9d/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/ea1d00aff43bd11309a49cdca461c7b9c9168586/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/b5ab20c26cc0683388735d08c519a68f12da2c2c/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/5252d2bac85916261c37b1d4c4c1886fb72c3376/
         arc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/fd8f24e32fa6a1b8e4e735104a7b19e52d199564/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/6953daa1703e2a799f308766257dd5eedd12fed1/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c1bde9165bd118af8658a5220b3afdec91fc997f/
      mipsel |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/30c960ac9145adc53752030dab8929b3e8ee06b8/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/d503114f3218a2213a46e34f7cde3ced3e496490/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2d050294bcbb94aaa273cf451c7031864fe0910a/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/9356fc22087b3f368692d6de421b06ba56ef7b04/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/e9d3f887edb46e6a82741d281768ffdbbe6aed77/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c2d707f12569b040fa817034e6a20347ae1bc6ba/
     aarch64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/2ce341fe8aac14eeefbf3af3048c064a11f4e5f3/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/e5e2fb99e0b91ebbec04894bffc3c8d7a7f0ca4c/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/52c72c26a991b0fc9f33f9151546a241f55791a0/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/d3e5dae4a48bf97f7a18beb166e5c3570f621788/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c2656f10361a8a154e841cce90873fd22e4b4afd/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/62910db22b3cd65040b0e9100ba51d7dad8e6fa7/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c030d0de7456a3cc64d1fae221ab927cffc403dc/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/a4efa1dd6f983459da89180550f1e89a6b2d995f/
      xtensa |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/1f2a884931618bcb2d7a860d747af5183f4d24ac/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/86cea9661b2f23c0bfaa059918ebf6a9e1cd4551/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/fe465e2cd300f95deb72e36bee415c10d71e0070/
        i486 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c4c6827ffc9362d44b03b29336905ee016e70a27/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/37f3adb807933b143b03af3df52c7acd008a29c6/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/665d17d00894f95abbe5e98e287c39baf50bf596/
        i686 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/a7bc95e2e5e92840f0f18db9dd76b5f32dfc6166/
        mips |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/941f6ac8f07cf50ccae51a6310149ec920551d5e/
         sh4 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/4f5d4b47338ae2f10a9ace5879cf0428d9100ae3/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/db3635926f9a0bee31e5be2991191f133155f1a7/
        bfin |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/9d28c05df47e3aec3c25a4fef19988cae9531bef/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/209c543afa347235334f351b4806fa382811667c/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/75410995567f65d1befd408bf5337e295d383778/
      x86_64 |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/587b6fdf2ec8c9af6a05b1ecd2e7855c34913737/
        sh4a |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f8cccc37bc00a273a0b8bed1b89886ba0d10f734/
microblazeel |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/631baca6aa725d7142c646cb2da992f5b24cab57/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/1f826353dd958f58b74e133961b00bd46467dd20/
    mips64el |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/84c78d8f6082255b8c76f0f964309c7695854964/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/f705f5b13755ebce447930650a36a984804bb101/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/d51c1645a16bd788b1cac1f8e5b76ef26d1ee3db/
     powerpc |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/aeaf8c251bed34702ae49658f1de44c1f990d796/
         arm |      adwaita-icon-theme-3.14.0 | NOK | http://autobuild.buildroot.net/results/c0c6333792b153868fb65ff22d841cec4c4b2fb0/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a4178d1cc419a29b02d05b1eb9a80645b5109488/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/6b827272dc13a958df398c08fa5c2f8f25c381ae/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/daca5d030b8ecc6d11901e2936fe2151d0930852/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/05e7fb9a888169ba7c4cb28abdb4febb5215354c/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f0b4f8c46eb1de6cf5ed081dacd248c66c591aa3/
        i486 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/6e46e9e19266acf3c0fa1e06d542b0ea688fcb41/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/743f30b1816b17a0a1397b7fd8b5a8571c4dde03/
        i686 |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/4fcf957f4ea31047804041566e8d687a38984de4/
         arc |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/37fc8a5a3b1b19605cfbe82144979e01dfe941c8/
         arm |                  clamav-0.98.4 | NOK | http://autobuild.buildroot.net/results/b5303d6a3290e5a688850bab846b55dfe7d764c9/
      x86_64 |       dovecot-pigeonhole-0.4.6 | NOK | http://autobuild.buildroot.net/results/f323e21fb3b2cd67c2994402039f915ca546a592/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/f55f4033e0273c86844fbbd7feab14ef7e1e864f/
     powerpc |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/a2a7da7484e33216394a27c4115ce131f5c3903c/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/b8fbc6bd2557b6dfa306258734f92d71de02cf3f/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/545168d9caf3bdb3dd3eb3bae58ba9db8a33384a/
         arm |                     lftp-4.5.5 | NOK | http://autobuild.buildroot.net/results/4270a10be58dc05ffb8cfcae7d86f23bdc46d606/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/103ad984176b656506d294f0c62452779d8c0d04/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/511c0e52469b016fb25dc6f233e0e470867494bc/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/620c9e4934213124026dc74f24c9d46008e245cf/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ee4c670210323c0179fb4985772f0908f3d2ab46/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/80fba80e0fc05fc8e77fb8f8162c46734290a41e/
       nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/2053916e93ee33b98a12bd5700c51f91550d93a8/
       nios2 |                 libupnpp-0.8.5 | NOK | http://autobuild.buildroot.net/results/2852ad984a214e037f191792952134a3587f7ac1/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/888ab247d22142fdd7c8ae095c271493a9752f11/
      x86_64 |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/8034930a0365a43a078cbd6fa80e9c814f9e3f49/
     powerpc | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/9bb8defedb8024de83eb3a609ab584efb5d0d2b0/
     powerpc | libwebsockets-v1.3-chrome37... | NOK | http://autobuild.buildroot.net/results/d0190a6e5c6b5aa78cfefc29e4e8a4e4b135450b/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/f4bcd79152c1b26a1d31242226910d570f11cbcf/
        i686 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/db4011b3444c71942b1a269dd16b18652fd22d97/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/9d7ef12c76339100a85819e62167a19a8ed0f7cc/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/ccd1c4c77957fe73f365aac9a615c5237b07a131/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/61963854deb4fcd2424d734a2b89c75d2d1e4e92/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/9d873a535acebdd6575b013b64dfcc5f7f4d8097/
        i686 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/545371f5a39c85aba0d15a41cdc46e1cf6c1ba9f/
      x86_64 |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/220ef41676096bafd2e38f4fbb892eb0a7d654d8/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/f5058125bd1dc28b3b0596624a54d7903776e5a3/
     powerpc |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/4f636647ceb9f12329bcb0bfc924ebcc60579935/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/4c0f8583986d72fbc879d21bef65246bc9b4a732/
      x86_64 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/c388b71ae154c062a863a35eca70a8c2ce121524/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/fa3fe90bdb6e7efb27271010a206c7b7397e6b04/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/7d19d5deaa8ce1f05eda7bad19d7965506ff3c12/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/9079366cd92e122b3b9bcf12f9f59489ffc09e56/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/c333ce5ca90763cec0300c079321d6c2c83ae3ee/
        bfin |                     orc-0.4.22 | NOK | http://autobuild.buildroot.net/results/4456e49a6c33a80570b4f59ec9799a8d4a314af1/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f53d4d47a6b65c40c1b122dfad61d9164e533bf0/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/04ec455e352319a46dc06def1762c65ad28a12a1/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f1932657912674af444602ac59211b6caf6841ca/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/f12c0d3d40b4bed844977b1058f361b315883d6e/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/632bc721a22411ce2e6303e89575ba29a15d9664/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/0ac122872a95078bdd64163b6823aa66e6c350df/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/507cf49e31adf1f91c40443dd0fede283f73cafe/
      mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/88939dbcf0a27dd97d7e297ea3c7f07f458a31e9/
    mips64el |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/fece68a4cec43bce19f55a1a3e5eee1764e108ec/
       nios2 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c22db629f6142525b5d0e5ac8830a95a2284f676/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/eb2a23b65c9382223cde222b9f09d192a4170b38/
         sh4 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/fc0aa4d7b229fb880f2196293a0d8f5665a09f49/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/ceb77a76fda8ae3405a09b5bf49fe98df42a193f/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5cde427a68fcb7435a8e8431739bb0fca118934b/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/5bc9fa1c8762e7e5ea82b65e8661a09a43ac0420/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0819f22d7d40af189cab61bc1a5ac08252bf4e60/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/ac99e76417e0430644bf7180d07e43731852544f/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0f690d47ff22c7fdd24ca4e434a213dc960e1cdf/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/f4251d543537f02c266531b5b7ca5d506a11f6f9/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/65bc35f3e842455243616c3e2b16b07ee434771a/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4d212951f16cde74657cd07ac060a3aa1fee62a4/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/0b32c5841f7480fbf91d6cc60201b0f450f9ae94/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4df97ff58612231edb6a2f49651cef7b25670c9e/
        mips |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/4571289e5d1921ebb9297403d3c173ef371b1451/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/c1016873449c7fa5b4b4cb4157260a6741322561/
        bfin |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/87d968087a241ff51b43a7f9d4a9ee2d17e544a6/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/652c3afe844e912061fbc5991e6fecad98ff6e6f/
        mips |                    systemd-216 | NOK | http://autobuild.buildroot.net/results/4eb8482d2706cb692849b25e2672848099e6f27d/
    mips64el |                   taglib-1.9.1 | TIM | http://autobuild.buildroot.net/results/e2db46ad767c07ae51d4cd68baadde8f841c2ac0/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/5638bb96bc8b47caa164059036eda88464312186/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/f38056551aa749bfb4f0b2d5bd83a44c9e044080/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/1f269a42af175137e035b77e112e92781ad9ecf6/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/ca2343166aece758d2708986a02a879940ba6116/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/d5703135a66a4a286484588150ae739434c8ea3d/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/b3e2ccf1e4c1b42baa38d2e6e9576442fc83cfa3/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/3d6003c9027330b7922a89c3e8787a8c5ce5f219/


-- 
http://autobuild.buildroot.net
