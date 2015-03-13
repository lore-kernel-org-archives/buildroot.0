From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-12
Message-ID: <20150313073020.7B3C41015ED@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-12
===============================

        success : 242
       failures : 86 
       timeouts : 3  
          TOTAL : 331

Classification of failures by reason
====================================

               tcpreplay-4.1.0 | 35
                  uclibc-1.0.0 | 14
      host-gdb-arc-2014.12-gdb | 5 
                     vlc-2.1.6 | 3 
freerdp-b21ff842ef3de583751... | 3 
                host-ola-0.9.4 | 3 
                      qt-4.8.6 | 2 
                  snmppp-3.3.4 | 2 
           libmemcached-1.0.18 | 2 
               qt5webkit-5.4.1 | 2 
         lua-periphery-1.0.4-1 | 2 
               batctl-2014.4.0 | 2 
                host-gdb-7.7.1 | 1 
                  newt-0.52.18 | 1 
        libevent-2.0.22-stable | 1 
             host-thrift-0.9.2 | 1 
               alsa-lib-1.0.29 | 1 
                   strace-4.10 | 1 
               wvstreams-4.6.1 | 1 
                   czmq-v3.0.0 | 1 
          sane-backends-1.0.22 | 1 
               harfbuzz-0.9.22 | 1 
                     gdb-7.7.1 | 1 
softether-16b713b98da8dba29... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                    sox-14.4.2 | 1 

Detail of failures
===================

        i486 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/1cea1d045a2083de94d74121952638509a496df6/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/b1139b271a8cfb5416fcc3ecabfd5bec246080b1/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/18868fc7419ecc5ae48344248d8f4d2d60b09fa3/
         arc |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/3b595d1c5d47e971bcddc0d65c5b194b72ce0f2e/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/d6e6cfaeaa5578634a141edbdea2292def10d492/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/f903ec805e9df7f772e36a4e645d888fedf6acc6/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/803863db0107df08721292f98b4ac190da3dcd8b/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/3d5cb8bea0964f0d46733e47d04a053021e63643/
       nios2 |                harfbuzz-0.9.22 | NOK | http://autobuild.buildroot.net/results/09f29ccaa2090ac3f9db86d346174c73291bbb76/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/842314fac6eb168a8498ba3a982ea15af8a36126/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/9f39ec9b90be1545e5a1d83de5a174e336f3ecb5/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/28032bc714d09c2f0031caf3565fa0db3bc455a7/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/eaa6f17ab9167466410c163441e2bf35c0cff701/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/2043888410baaf9d22338b48b4caab4a4363f777/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/1b039074eb6e8aae836dd7c23d4161cefbb52710/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/2d059378a55ccaaebfe235ea8fd9b20881b4d3db/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/d5c5089056c33f961d7099516cfabb0572d0b6e7/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/fe1f52bb3315570ac3dd79a990e92087925da250/
    mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ae92d6239fb9ce89aaab4dd950724ff1b6cfecd6/
         arm |         libevent-2.0.22-stable | NOK | http://autobuild.buildroot.net/results/1252e1965cdc90fe1d41f62e47bf3f99a2a8a82f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/70dd1ba9b6ed6faedeb8be76f0dd6dde67dde597/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/75806412f2d6338388991b02043908cd9806b00f/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/bc75e3cfd528873f5300e04c348b7614473f54ff/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/d0347606d650e1ca81fd4b919b36f8146444f8cf/
      mipsel |                   newt-0.52.18 | NOK | http://autobuild.buildroot.net/results/ec38d0f1d1faa2a87321bab10f87772eb819adc9/
      x86_64 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/eb6ead3fa1ac167e0e8ac6bc6bda1ded5047228c/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/0ed4d38303ff08a06ce50256ace1141641737d59/
         arm |                qt5webkit-5.4.1 | TIM | http://autobuild.buildroot.net/results/34859d73cedd2aca4f2528b6841d1a5b07365bd1/
      x86_64 |                qt5webkit-5.4.1 | TIM | http://autobuild.buildroot.net/results/52e0801ac7bcc264ac58cbf88d777e6c0b53c4e6/
     powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/63a2853649fb8ba328d823083449c8f4d10a758c/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/79d82b6f8e5863c72736badf9bb94d167ea15d60/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/25b64d4d00aa459df647b6a4a3da7d51311a3a59/
         arm | softether-16b713b98da8dba29... | NOK | http://autobuild.buildroot.net/results/45b54b59935c3994c526593836ad433b82148f12/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/fcdd66f6f4aca872f832000300b946d8a93e8d70/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/1ec8189990603356e679a01d46dc9c50e7599655/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/f75e8753cc3ff0d1ac0eaa6c2c98c8c24c5b315e/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/84dd0f84fad7c9d95ccbb0793ef5c41227aebefe/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/8a6c7acbbf93548adcf5d777b3c5859dc985511a/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/824f7f22239d4be3e4d6abb0230225841d71f838/
        sh4a |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/2cc199b088ab246f10dd4c8778d2008b8c71b06d/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/38d1d59a6d81caff55ae72e5e86fe4fc72ae456f/
    mips64el |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a081963d7cadc314f408ea90a54add3cc4ccfd25/
         sh4 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/686ac95e6faf7dc40b51c8e9572d3f1cd7db7b9b/
        mips |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/42faa94c3131e744db36e330fd9968e5c09a3996/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/813486ceb684b5efae571363a5943e8531a0f735/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/128eb291db9f04e154a0eb9977489438499b8d3d/
      mipsel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/ae0ebb7807da42f583736cd0caea62fe5df530c8/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/fc519e9294fe36802aba01243b25d53b1a9655cb/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a174637aca8876a35f71b5f882e103cb666bf97b/
microblazeel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/1bbcdbe001cbaa40017ba3d2a55cf43e252cf77d/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/4db381d9d857a98adeee0a8d7beee9a6a48e450e/
      mipsel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/c404360f8701c3eca204dce9194e2ed9fbfac577/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/4b97a3946e538bf6069a2201dedbb24f623d4d65/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/168b19f0aa94a1811c90f2a0bc08aee0f277b2b5/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/7eee8a485e918bf4f745163f748f85169c018f02/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/f6d13ae6c613752b497189c4106de2dc869d32cf/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/9a338e2f8c5ef4dd41d747e9d719d4128985a046/
microblazeel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/f377b6f04c70dd6f4f309c4784ba789d153d38d4/
         sh4 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/afa92132bf0f948645f6adbd041b6377699e93e3/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/3e6d30bae41aaf802ae546469705df3fe4451bf8/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/72bdcd29b3898adf19209f2ce130242142225d67/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/cef5d2258992dca101bcbacdcf53b9fa66afd893/
         arc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/ac0e5fc58c6682111d7e66b05c42e6573c9458e4/
     powerpc |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/2bf0ffd54cefc40e0576884d4244d3f49f165e87/
        mips |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/4782096149ba667d86cb57f24a9ba3329841f65e/
         arm |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/7029a3588120a6290c4ee72d2cd5b6ffd5588d27/
      mipsel |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/a493c38f518773c325bce2511ec8d2c1d889cd79/
      x86_64 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/66f73c1da4e686441e94397a7c22413c878528d0/
        i486 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/2c858c463e0a2bd49f3b040e7df3be33d3404ca3/
         sh4 |                tcpreplay-4.1.0 | NOK | http://autobuild.buildroot.net/results/0f4d91b00e4668275def0888dea4c525810db389/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/3d2ec0c00483f00fd3952e2b654e8d33114a61f2/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/1bedfc3bc5c8faeb70c4bdc5745cc95d32ef4541/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/51c65c78b6ab166f8c233271a5f0ced53e35d3f2/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d486258dc61f8cad37edec4d79e7351897c9703b/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/a4d07910570251ef4d6857cfe0a9cb66150ce792/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/265b96cf6ef1cc7d6c44f915981278d0e43981ae/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e34e80be4ea99d011f36a5f409de7a90f93bd6ed/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/80da86616131c7a1d71d90235af02842e520358e/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/70d299eabe981d9526091bc129640982989fa850/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/f06519768b823fb10b1663fa67dff78956763d9f/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/3c809998daa52a78dcd0fe4b8d1505df8ff475bc/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2739a678e4abad8c77f4df80c4a12392b7cc64e9/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/09c9f63bc034f54896db9c0c2c0cbb72b5159f6f/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/56593564846e91e665a39e069ef7e77afe577b6a/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/5fac5838d75c28cdd781316e278ea40b20f045e2/
      x86_64 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/06150742c8b7901c6c7e642add72ae4f985496cf/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/b7ce035a877dd93b7ef3c50416b73aa41d06318b/
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/4e0ab461ea7ed7a288303741eec89156abd49864/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/56b02ba56a6fbd4a37659d3b5b2089a4a8e91d01/


-- 
http://autobuild.buildroot.net
