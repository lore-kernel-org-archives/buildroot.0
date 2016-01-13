From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-12
Message-ID: <20160113073021.B4F9610272A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-12
===============================

        success : 237
       failures : 124
       timeouts : 0  
          TOTAL : 361

Classification of failures by reason
====================================

                  libffi-3.2.1 | 18
                   assimp-v3.2 | 12
                  boost-1.60.0 | 11
                      qt-4.8.7 | 7 
host-vboot-utils-bbdd62f9b0... | 6 
                    ruby-2.3.0 | 5 
                   libnss-3.21 | 4 
zbar-854a5d97059e395807091a... | 3 
                python-nfc-212 | 3 
                 mesa3d-11.1.0 | 3 
canfestival-7740ac6fdedc23e... | 3 
           uboot-tools-2015.10 | 3 
                bind-9.10.3-P2 | 3 
                   mplayer-1.2 | 3 
             bluez5_utils-5.37 | 2 
            netsniff-ng-v0.6.0 | 2 
                 libdrm-2.4.65 | 2 
             lttng-tools-2.7.0 | 2 
                   erlang-17.5 | 2 
             netbsd-queue-1.70 | 1 
                    iperf3-3.1 | 1 
                rt-tests-v0.89 | 1 
               nfs-utils-1.3.3 | 1 
                 setools-3.3.8 | 1 
                mono-4.2.1.102 | 1 
              luabitop-1.0.2-1 | 1 
       openpgm-release-5-2-122 | 1 
freerdp-17834af7bb378f85a3b... | 1 
                     fastd-v17 | 1 
                   slang-2.3.0 | 1 
libubox-e88d816d6e462180f03... | 1 
               trousers-0.3.13 | 1 
                     fbset-2.1 | 1 
            gst-ffmpeg-0.10.13 | 1 
             host-nodejs-5.3.0 | 1 
                iptables-1.6.0 | 1 
             util-linux-2.27.1 | 1 
                harfbuzz-1.1.2 | 1 
                   open2300-12 | 1 
             stress-ng-0.04.16 | 1 
          chocolate-doom-2.2.1 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                moarvm-2015.10 | 1 
              alsa-utils-1.1.0 | 1 
                  prboom-2.5.0 | 1 
               libcap-ng-0.7.4 | 1 
                  ffmpeg-2.8.4 | 1 
            kodi-15.2-Isengard | 1 
           qt5multimedia-5.5.0 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/1a6aecc9a9ce333110ce1fbcafb6ca5e53d2d987/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/907eb243aef1c4c4f5b0c7748e8c749ab5ae2f57/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/1b7d0bfb261adc90859094e3cdcf00888b070af4/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/b141b9e136322baa21d55c4b4f12ceb6bf8d0de2/
        mips |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/efc1977004aa5b3ede9eb39a844e5aac90ae5705/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/075b36e49e52061a4ae5ee09d977b42746a35267/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/5922822d0c1c13b225c618e3c9caee147658afb6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ee53fd397d2d12a34e06bc4ceafe2a662f77e725/
     sparc64 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/05584a2891372e7a1e2f0cf25ef244dddd952ae1/
      xtensa |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/39bc06c12de9c84d066ef7ad0131d72b9b15c682/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/2f65a39564ecc4c4b2705ede57c9eca48fc33a2a/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/430f3ce6e2a5e1590a2282d0ca7204bd3e1f92d6/
     powerpc |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/02a95f739d89ab89572bec1ce221b83dcc1d0b95/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/8fb815eea794626097944dce8b803c808ccbde95/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/bf978b3b2c0a1f45f8f2c380e39a9cd91e8545f7/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/1d9fd68d0f426925e812740979c93ae0aba65834/
      xtensa |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/46daba85df1882e97f22d01c75952bb35de38d83/
     powerpc |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/d1510f97aea0892c666c54b953e6d0a1b8cc7a30/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6c72c189cd029fb6c81798f5443fab331358bb90/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/ba4ad11c2e5b05914d85208ec1b20e37248e52eb/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b709fc201c9df8f76163e2a620da32362abe5288/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/408d86de9c4cddf05ae160a760f3bd86388fe21e/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f5a090c7340499453669312cd287bc157718f151/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/11d12c61188c362fbc134f26a0be5a379731587e/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/99bdbc5622dfd0ac369611ec07dd2a8a8fe41ce8/
        i686 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a77bf95da13b829aaa21e3fc9f6603b562c020b1/
      mipsel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/afeaeb19c58fe28a71dbd11c62ea6cc2d2098071/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/fb2beba9abe5bbf3b3606a0eced5bc1b76ac3e92/
      x86_64 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d2b270787fc20e45c839d5670af55e47723aef2a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/26ba77706dc8e5c5ec9278e672ec20d04e8ba666/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/fbd6c3ad8b17feffb7438d56451b5148f9b6bb6a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d74bfb1c54de3a137b6230456d8f9d91c677f00a/
         arm |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/acfbb03cd6926a9b105898f8a1d71eb45c41d556/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d88a8380c632db581a9d38672067339ebc11a717/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2cb6c3d22016f4c646a897a8c0235f90a343cdf4/
       sparc |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/f8496a07a7c7fc93368676ea8f8a3c2174186f7e/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/69e7920446bee5b52ede4be0ef2b604fdf9a9ff1/
    mips64el |                   ffmpeg-2.8.4 | NOK | http://autobuild.buildroot.net/results/360b7da7cedfce632c24042b273f9c91f9ffb515/
       sparc | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/84e0d3ca3d7f02c33bac1f95c2a6fafabbd24ac0/
microblazeel |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/8ca522a4a6bc83e1382684cdb291395eb848f3f2/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/e95cb2193e6b503ee9ef3d6cfc2e892e59e3b9c0/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/29af222114070bd1eda954c7b612b9d4b11eaefa/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/3993a3d299507fc74033792761885f58219de9cf/
         sh4 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/854aca4069134c0fcdc18aad847f69a0411036ac/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/57a34e47d4cc201a04ed0d5cd25274f6924f416b/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/ca466d138a45de0eba484bfb5d532ab8ea218ee1/
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4ebae00d2a41c70f0b32af233fc1ffc76e02da88/
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/2bc1b683bb8a993707f3184734390facf8dfca56/
    mips64el | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fb888950d091acef062831d7ed8aa25c39b4d6ad/
         arm |                     iperf3-3.1 | NOK | http://autobuild.buildroot.net/results/bb426ce3d74ce367ed2f90abe15a571395f9764b/
         arm |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/aaaa1fc92b6a885d223681f40c5df7a962ee1fce/
      x86_64 |             kodi-15.2-Isengard | NOK | http://autobuild.buildroot.net/results/e501720b7a40bcacc70f578875e7abe60a6388c7/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/64e9fda07e4c954bcc63ea443225f88d85cc72c9/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/93b51d23e1e64765adc251281a3e42336338e1d9/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/c2c4e156a3ec1a985a920c9ead62265ccda8ac1f/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/4702ab28aff201f6491ae2845aaa0e5e8b7e12b3/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6957bba54b5961a1ebb720c1a9b42036399163e6/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5a0576397555ef1e951a3a0f00b195e78f87d61a/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/d36432d0045eaab5c9e0249eb55269b0d8251a52/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/aba8832dd2c5f65cea125a6860421539f084ea43/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c1558c3e34de01a5bb342d6509879014e33c7761/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f19176b698593d352256c0914692d843b1414cc4/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/2acde96e998f565a193420109806e788aebc9464/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/04b9c35448c4effb46b9b5cc3771bd07f5d12a32/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b9358f51ab64dbd36f0411134ff5d1284984f635/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/5442fd109e2d7f3563bc9105c75c7c35ba9c4886/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/c66b780ba35b775297dd5186ae7b5c3e605f5bff/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a29065e727526aa4308c2d94a44a6387ebee3965/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e17d619fd7e489fb9efc0aa1cb309bbc90a1e6c9/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a458aedcd75cfe2074fd7072df6cb3320dcc47bc/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/e3ce04a7d21b16468f4e81aa657e0c77ea85eff9/
    mips64el |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/803b2f8072bfa9cbf0f995e9f83eef96d5077cfe/
        mips |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/6ff5432cafbd7dbcc614c28a2e42b7b33f791726/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/11a2659c49eca64d9bad566a2e531145c4037612/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/5b8b1abff20110e1eb93d7b51ea9e997cb7528dd/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/45b149f3d353a7f619f76e88f3c014a5fef6c730/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/0405c9f53d38ecf53be4465667ff5abe66ed53ba/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/05a103b15e590748956eefb60cf10143ac5c9cb7/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/c89ed1c76f864d0047e9ee879242690087c30c3d/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/c0876d1d43a470fba72631272e78a7cafa05355f/
       nios2 |               luabitop-1.0.2-1 | NOK | http://autobuild.buildroot.net/results/6306c929e9ee05cbb33e4eb6b590166c6554ec21/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/e41844f535c14b220b87fdfa0d8c672333ddd0be/
       sparc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/8bb59ad31df1fe3a31b0c2d16e05d0b160abce10/
         arc |                  mesa3d-11.1.0 | NOK | http://autobuild.buildroot.net/results/db197342f6aac13a0a88b3bfb8d80f9628e30e4d/
     sparc64 |                 moarvm-2015.10 | NOK | http://autobuild.buildroot.net/results/dcc6d3d6223804d30489103b5b0d191dc2622e6b/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/1601234b6147bce45f876edf25fc89f602b7f241/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f261ed1b26e5bb50f82291f9e5c95faccae274d/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8ad5dcc51fff8a5197f88a31146137c70a86932c/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7a57b01221a4f5be29170ba4302570c80ba74106/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/2f37796b4b55670d724d0694bf8fbc149ac1f53d/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/c4f53be2fb596ad5ad18968a575a46b770255b16/
     powerpc |             netsniff-ng-v0.6.0 | NOK | http://autobuild.buildroot.net/results/609b0c494ca0efc43f56a9ec6388841d9da61050/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/1553a1ac33633258376ea9409a29612013f2df29/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/547919988c3affe02ea98f1ec990f77706a9fde6/
         arm |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/b52a97cad71caa8ac70da63e848424b39badc488/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/7f2fb28e540b23fae397907c0d5606de9b0e2bb7/
        i686 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/4f63127c275afa3bd7cb9437246ce252bf5a5229/
      xtensa |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/86f547d6d013571f539058980bbc8d178fc98c75/
      x86_64 |                 python-nfc-212 | NOK | http://autobuild.buildroot.net/results/36f8f04507644e2339b498e5aabab70c2e4370a5/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4800035b6b22953f00a0d8323f161b15caa076a6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b185a163838403c4b1776463835fe6acd82481dd/
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d0bf55784d58e6453681f8ff8fd06adfb9ae6b44/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1af7b0105c37ab4e46f40f520298b9eb9aacbae8/
    mips64el |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e4f235b574ff68bedcfcdffac05d9366b556bbbc/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3f319c33fb851f6c453a08693a4ffb9fb35646e2/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/734da1e5faa20cc8a1c16fd3930a15a79483ab46/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/caaacdcbe9104ef9165677468b36b159d5e9d2dc/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/0888c6b63638d973f22ca7eb0293d70eb33dbba6/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/5406c736f9b59c058399d762cb842b4fb55d4f0e/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/337ee8fdcf21d78de2142891e338e37c9420b669/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/ac8180eb2ff5549a70e6bb2e46fae1c4caf0e362/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/998fbf453d8878a803a0ebd5e72f521481510eee/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/02ffd4276230eb27a7acf022e9df7c9244ebf4e8/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3f355945ef38b6a84b692bc1226c2532f9c845b4/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/cdc063895a31fc882193da1480523f590986011d/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/8e323baa8de9fc28a8b83f3845fc2a8f0ba233f4/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/6627718dd6797951f0898c3681b4ed28009cce9c/
      xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/0b70e812f6559b7eeb03bf96384e53dcb6dc2ccc/
      xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/b8e5351fb953396d92f95b662d0df5dcfdf7a27a/
      xtensa |            uboot-tools-2015.10 | NOK | http://autobuild.buildroot.net/results/af9fa029dbd7f7e134fb6408b339189c4da8f11b/
     powerpc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/8940c309e7f486b236f2992928ab322cb2c531dc/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/a5e7bce06fa4574c3135a511a75c3e56619032e9/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/fe5a85f120e1a25b70893fb9baecb2085d2fec90/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/3dadf14864286eb41ea1fa8c181af8225b5fd41e/


-- 
http://autobuild.buildroot.net
