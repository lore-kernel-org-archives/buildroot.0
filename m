From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 08:30:28 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-11
Message-ID: <20161212073028.E1BDD20DB0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-11
================================

      successes : 183
       failures : 106
       timeouts : 1  
          TOTAL : 290

Classification of failures by reason
====================================

                dovecot-2.2.27 | 25
              mimic-legal-info | 16
             btrfs-progs-4.8.5 | 10
e2tools-3158ef18a903ca4a98b... | 8 
           policycoreutils-2.5 | 7 
         jpeg-turbo-legal-info | 6 
             freeswitch-1.6.13 | 5 
                  samba4-4.4.7 | 5 
                 mplayer-1.3.0 | 4 
                  cjson-v1.1.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
               tcpreplay-4.1.1 | 2 
             berkeleydb-5.3.28 | 1 
libasplib-f7219142e790a329b... | 1 
                 libnss-3.27.1 | 1 
            lttng-libust-2.9.0 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
make: *** [target-finalize]... | 1 
                    mpv-0.22.0 | 1 
               qt5webkit-5.6.2 | 1 
                    quota-4.01 | 1 
                   slang-2.3.0 | 1 
                  squid-3.5.22 | 1 
                      tar-1.29 | 1 
                     vlc-2.2.4 | 1 
               wireshark-2.2.2 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/48a93b11646ef3df09bfeca03585a9b4d2af4e14
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/1aea283aae6b1b9c3b8c64f13414dee6522c7582
      mipsel |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/657e43024531dd5788af1e7ed03895325887eaf0
         arc |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/72175e3e73ad88f4bdd506db5b4fe252757da96c
     aarch64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/8b53640461eac64981ccc037baf4b0b05e5e5e12
         arm |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/763633457e71f12f43b823253a3e9f15091a5b2e
     powerpc |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/a4fb754d9d667323250926bc5692b278d41f899c
      x86_64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/cfb804f3d3bfa41ea60d0007fac97fb94821ac7c
    mips64el |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/331790159e389980ba2c5ba59c0aa550c635146d
       sparc |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/7ae654c941ffa6c01f5007fbfa2b24e858af878d
      x86_64 |              btrfs-progs-4.8.5 | NOK | http://autobuild.buildroot.net/results/7d262eb891562e55fd9122fa2bfcd2b44555c3a6
     powerpc |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/72777b94c729e8bc153c07115b714879ffe7fd89
     powerpc |                   cjson-v1.1.0 | NOK | http://autobuild.buildroot.net/results/c2ad0b0b5c55ede6d37f07be78e89a8d8006f4d6
      x86_64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/49e276034ac7aebda44bd61e0ff1f40ac9e139a8
         arc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/ae50269a7a135153976289424b873f36d4de830e
        i686 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/29cb2cff12d662389487abd6bc37d40e2ecf26c6
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/38fcefbc74390b9d44632f0b85d662938db43cec
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/014241ae23608b71938d51aa9392749fd6d5538a
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/141491d3a602ebb1e533d815d8bad4f5bc2d4815
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/2c0d351c8349d5c3ea0681f72f895d8e6643d6a2
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/c296e78f8f51c5d37ac16cf74749deaff60030f7
      mipsel |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/a8fbdef83ca0674621945009d1bda1bfd28fc312
       nios2 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/236290cf824aac118f8d4bf0666a75d9f2f2374d
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/87c4d6599f2ca82124c09f55a8f298f25769bdce
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/8daca12c50ce715ea0df9cf11b493df0db1322e9
        i686 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/e7d84e95f9e5eb75c7dc6971973cfb2226c357c0
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/c04b9492494e67de66c85217a7740b51623d962a
       sparc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/6c0751229620420428ba9ffefd2c846695a31275
       nios2 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/2f6574218a4135a22a7daec00b16737a8e266381
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/7c826fc853db2836cc5fcbf85b874f7c2b4b9ddd
         arc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/40254a27afce7c6434720a59d95b9b95f6662690
      xtensa |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/789f550a3f76d6db21fb4293de4f90aa2a331cb3
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/a4ac82e05796231ae55ecfe03feca6bbb38660ee
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/51a80f726553f4b83d3629cd51d1cb8dbd7c286d
     aarch64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/975535a765ce7ff21cc05d56653ec27dcb2c4c98
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/4690ccaf71982979c93de038b9c11aef79fd26d9
      xtensa |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/0dd0c075ad36d3a0d359f270740fa903bab0c3a5
      mipsel |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/4ba22e069bfd64e32b8161c8ac152b0c83c6cada
       sparc | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/15c586879285dc60a6a0507ec078b811858720e4
    mips64el | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/c743d5b6795d2d48a2e0948dc824116b3f9c31a8
         arc | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/25a6795c7337c35d77d0d9ba6de1031631631f66
      xtensa | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/fc32c219403d5c4397a4da880b5ec8b5cc3b9518
         arm | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/73a964253c89b56bdb1290d2cc8fab8500a132c5
 powerpc64le | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/b0c9d5d01b00706ce9acda95ec83f1e485544f21
     aarch64 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/68b137cdc3bc6f3c4f0bcb34481b953a36356204
     aarch64 | e2tools-3158ef18a903ca4a98b... | NOK | http://autobuild.buildroot.net/results/0f6808e44fd43c4e13fc38cda7bfd3ac71189d36
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/99a43308fc6f269080322389b7206cefef85f653
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/411ea575590926957e94b12c03eae222b3c83641
      xtensa |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/6e910544dd6308e8f1d41523264bd5f27877ece9
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/e3eecedbd6a4be92cfaddd060d00ae119690dc32
         arm |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/ae592cb15ddfb9f62770c6a70f6caf74fb62ac25
        i686 |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/064aba124a9b2204a21048f3b9c6e1a35b90000b
         arm |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/ccf67dc54285d830a33bbe3c07abe08a572a77e7
        i686 |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/8239fa96df68075a2771325050c294bf7d999855
      x86_64 |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/7696bc39cdd63f54bc566185f9a8c2f6af1ff702
      x86_64 |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/e97edb7dc573912fd140ac681952634584e9ab32
        i686 |          jpeg-turbo-legal-info | NOK | http://autobuild.buildroot.net/results/135190065b85ea67ae1e3842c5474d6351193c0b
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/6bc9edc9252561becb7726986adc69fb92df4e71
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/5710caba135c2bfb2f0dab6bd58dfb8924c32975
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/52bbc4a8613d36a2070c635344455b5d52e9f876
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/ea033ce1cbc316be37e345363d8c4d6fb61bf723
      x86_64 | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/cdc68e56a541f2052ae178920ddd0f5a218eca09
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/79b965567b5a4fe861a7705156243db4ddb7a3ea
       nios2 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/b414190b12750f50764ce422301794a7c9280d4b
     powerpc |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/7353609e4b30f6b2c3c37876299edaddba9421db
     powerpc |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/846b42d484e8d3e261eb3699a485d589f6bbab62
   powerpc64 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/5b5c1885759fd6aeda1bd6f2df30da4d554104d6
        i586 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/95ad29cc9e21fc9122d741658041fc3f88985d99
     aarch64 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/335253f087eaf01495091a571e561be5cea4c3b3
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/7fec679a515fd3dface09aa3ab3a282f31fec518
        i686 |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/d883c7c33767ed1277794ec03d53b86566b1540b
     powerpc |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/a1802c4a19779eb32e06403a797dbd30a72c50be
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/9d7cec14fb84f1581dd9cbb78afc14d22a824a48
      xtensa |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/1b6a33c401ac79f864ce74817d093683d3bde41f
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/f8f9dcbfbae8ff6051ac46f301d527cd4823c5b6
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/87524df4ec2da8358ce7294648bd8ce3476c27cb
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/57183f0a4da4554ae9235db3f3e0f88b2eba033e
         arm |               mimic-legal-info | NOK | http://autobuild.buildroot.net/results/bc1272bcf0deb5746f316dbc3a64198f01158b3f
      mipsel |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/bfd48e3f2057d32816ffaeabde54c873f4cfd4ac
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0374f903b6ba3018688a43a9d52de738596ab2aa
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3321d6848133318e4bb68791b6d9b16ced0c6597
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/339581dc1dc9d17dca3738d68865d640cffc09db
   powerpc64 |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/5615c7f36ba74d1cdce4f25762811bc4d85f8675
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/850de0a2c24652faa4ef9b81a71400bd120fefb1
      x86_64 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/1f84f1b587b93e3d9760897c776312bd268f6afd
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/ddffa3b314b84c5c61050585ccc8131a67fb39c0
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/89f6f8655d0f34b0fff43bbe760d72e0dd6b6ad0
         arm |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/21905e7e0afde367a52bf6bc27176eb42d307a41
        i686 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/508caed8f3207029b4cc0a0a38f503eef0fa9df8
      x86_64 |            policycoreutils-2.5 | NOK | http://autobuild.buildroot.net/results/21c2d78134d55c6bf3638b3869fc3f24064bdebb
        i686 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/22ad6b5e1f81c728ade87f8319a6d443a50a1aa7
     powerpc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/bcfb0a05a24363184b8fe3bb7035858a8bd63062
       sparc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f3214d2e1d88afa487ac93ef0d0bcef87c35a85f
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9759e50c0e1e60158f4692007c193eedc6494b42
    mips64el |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/cf386f5bb8155c30f0da76663b019e1910c039e4
         arc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/97ee527aeb54db1efab01adfc4f1e81fd8f949f5
         arm |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/72803eb8f7e4af5d8d298b5085fb3cacbade60bf
     powerpc |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/58574923ca9b05b5a097cab50f406e30c2a8ff99
      x86_64 |                   samba4-4.4.7 | NOK | http://autobuild.buildroot.net/results/3f988e6b30abb007bbd449b16fab52758d0208ea
        i686 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/cf047db62a48e5682693bd1b25d21a8d2af187bf
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/94a0582146c9cb476949995749763d7dbef63cec
         arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/d64d13745c980d322d3b80c3b324d03eb7f17262
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/38cf8bff5c1d56b1a4ab9f310096b671a919156e
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/75f4e3cedd14211b81f3052359d089b32021f574
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/ef97edf39d273040737d08bd89be4187936e1581
      x86_64 |                wireshark-2.2.2 | NOK | http://autobuild.buildroot.net/results/b7fc0f6c3bdea4a2fb205cef9e86fdcea96837e0
   powerpc64 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/f3eac4c13a213d70053af60a1fab54b93734e0c4

-- 
http://autobuild.buildroot.net
