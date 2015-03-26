From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-25
Message-ID: <20150326073019.3635E100BE2@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-25
===============================

        success : 189
       failures : 70 
       timeouts : 4  
          TOTAL : 263

Classification of failures by reason
====================================

                  powertop-2.7 | 19
freerdp-b21ff842ef3de583751... | 6 
pulseview-19be0af16af83ca10... | 4 
                      qt-4.8.6 | 3 
                  boost-1.57.0 | 3 
                  dhcpcd-6.7.1 | 3 
               libecore-1.7.10 | 2 
             bluez_utils-4.101 | 2 
                espeak-1.48.04 | 1 
janus-gateway-c632c1e9da5ff... | 1 
             odhcploc-20111021 | 1 
                   zmqpp-3.2.0 | 1 
              libarchive-3.1.2 | 1 
                host-gdb-7.7.1 | 1 
                aiccu-20070115 | 1 
                  bcusdk-0.0.5 | 1 
                collectd-5.4.2 | 1 
             host-thrift-0.9.2 | 1 
                  python-2.7.9 | 1 
                grantlee-0.5.1 | 1 
                 rsyslog-8.8.0 | 1 
                numactl-2.0.10 | 1 
               alsa-lib-1.0.29 | 1 
                host-ola-0.9.4 | 1 
                  libical-0.48 | 1 
                  snmppp-3.3.4 | 1 
                 jsoncpp-1.6.0 | 1 
                libtirpc-0.2.4 | 1 
                elfutils-0.161 | 1 
                    fftw-3.3.4 | 1 
                   strace-4.10 | 1 
                 python3-3.4.2 | 1 
                 qt5base-5.4.1 | 1 
Resolving www.ferzkopp.net.... | 1 
                   evtest-1.32 | 1 
               host-qemu-2.1.2 | 1 
                     exim-4.85 | 1 
     host-xproto_kbproto-1.0.6 | 1 
              postgresql-9.4.1 | 1 
               gptfdisk-0.8.10 | 1 

Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/5f0fcf30acaa918bb75cba6c279679ecc2a973f4/
     powerpc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/d41972669dab03753c117feb0a7c351d77b495bf/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/8ba595848d3b5664cda66d6fd9b8e6594262d712/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/01fcc2b08fec66bd9f5ccc63357d668136762960/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c0500658fa7e147a9fc9cbab854362ac280b8b72/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/c28b77db6fd655f788d72bebd372102a254bafe5/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/b04c10acd9871e4fd5b33d6e105e3c6365280904/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/278ecae681e41aa3cf9f67044ecccf2c4f90a88b/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/da050e6bef8e7b5352e0f068c09dc9cf9d978a7f/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/d5462489d6dbe06ac2fa1125d1b2c3b4509e9336/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/7b340e157e6ce56cce77b33b6d2c1e8ca2cfa961/
     powerpc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/c022751038b7cc39820941a323ca0a4f805d800d/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/d140465a5592f7d4ec188a36914f9d5aed41375d/
      x86_64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/d83fa1558dfe20f11e2e9414684917e2e149c5dd/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/77abfebc4579af648e1f5a59c7c62474d7872946/
         arc |                      exim-4.85 | NOK | http://autobuild.buildroot.net/results/402d64965ac7ac6e1d4e1990080394958802fe8c/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/5929335cf886bd25a8ceaad369b72e68498713b2/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/7942315801a1e16da3030bac17ab5cd1c643b4fc/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/5f210db08d9ca61a598366d2d764ebbf060de6cf/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/f43c5292b6c8d7a6d6ed63d17ea0283d6208d767/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/515b865aea5afb8ed1ded66f5d983d5e1207fba0/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/26e6ebf8f28196c80c572803e5ab8f6f11ca8f28/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/7462fb0c6d670c20fc83c8eb95b9cdc7a91425fc/
        i686 |                gptfdisk-0.8.10 | NOK | http://autobuild.buildroot.net/results/9fe16d73e22a28adc6954738222c4dcb8ce6708c/
     powerpc |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/3ed57ae246f4e1b19672c56aa6499b61de793021/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/4c6665ae9ba5b2add7c7f6f51cb1283097d3b43f/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/67dc87b2ab2c341731b0172e02b0c917d742e1a9/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9194dfca1cae53dcbed4df5dea40e1a8126558aa/
        sh4a |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/1dab108f13dc8efe3353a0b2fe6ac74ca404ce1b/
     powerpc |      host-xproto_kbproto-1.0.6 | TIM | http://autobuild.buildroot.net/results/5f65f3ac4980cfd5a42dabeceb7dae06bfdc62f1/
         arc | janus-gateway-c632c1e9da5ff... | NOK | http://autobuild.buildroot.net/results/f9144de4307cac1253bc93d0fdbebf4dbec0ac53/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/56f20c17c537403fe2dbe11b1caddd4a2ca4d285/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/020dee229875e71d4e40d07f696b3c7841c32ae0/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/874aeeda6f7b158c66de16ca648311d9afef67ac/
      mipsel |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/5f5be2a8bd2e1523e5dc66a59b7c7c969b1a03e1/
         arm |                   libical-0.48 | TIM | http://autobuild.buildroot.net/results/5abca9e1368c0eb97d561ddf74cb72bee459432b/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/936d5a3b98fe9d144a8614c746ec843fb8945d3b/
      mipsel |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/d723e1fcaf3a8e9c72ac0d4206ec0c315ac17e39/
         arc |              odhcploc-20111021 | NOK | http://autobuild.buildroot.net/results/06c63e1cd6cfd0b0647bf37e28b7477a9eb6c03d/
         arm |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/ae04794b965d0d02dd0f966e50cb9343892fcee5/
         sh4 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/b4d9370f6ddadc66e039f23ae08b162e9784f6fb/
         arc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/6c0fca8f2513963226d30c439a5ef2af01c946ae/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/efa7b381a8d5109252199c48515faa1c101fadcc/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1e31d412d8b3a38a375ad0be8f696bee993ec297/
      mipsel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/c40e7fad2f6ec7db1ed577c7a8969429d0816126/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4580fac5a6c8ae1532541cf766edd841fcf5cc7c/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7366bc58f71a3660a12f5a1302972429b084ec2c/
microblazeel |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/2ff511eb8d00b94aca68427446e2d0f6e4317a5a/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/a45e0c5bb73b90fb9fea010768a71fd112d16264/
        i686 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/8b9c7ab1f77b9675995b2eeda0c1ba8568d39df1/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/21c4d3c6dbeb9b08224d6ca6336df5c9d89ed64e/
     aarch64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/164858823ad2f0dfe82e304c648d1bab95828dcd/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7de79b031e8bc9fc5ebdc4ef1646c49870b90df4/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/45e402571c9d00a48a27c076ba4044dfa1d26158/
         arm |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/914256534c97b23fcdfda7f9235ac64872cf52bf/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/1f60d7543a458f8a0e2f79bd4941ed72e3f38a29/
     powerpc |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/79e662af963635273870f888b77398b51fe4313f/
    mips64el |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/7249755892d71ecbf20bfbae82b5fa6091576ca1/
      x86_64 |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4aaebfe1631a395ba682305b8920b89ab8c0871c/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/6c9c30f89e0aea427a06472b6fac5f41a18c194e/
     powerpc | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/2bd946a5108ac0732ab4dc0ce2dbc3c04bdf8edd/
    mips64el | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/1da61af7020f3841070eb5ba6bd3f5ea8af9c4e7/
     powerpc | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/7d701240811607c0eb1c29c4dd4ff97521c801c5/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/8b739118d28b866ebdfaa78fda75072272c64610/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/cfce8550e44a63746d864d2044034a5d78432b06/
     powerpc |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/a23767f7303e2ef9f32ef8f51429ba7605bc506a/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/6f7d6c77aeddad611f4be8aa6694122e9ea1c714/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/f7fb7b951fb02912d9eb4c26e02c4457967a5a08/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/5a8a88f5c9100b8119ec737cc7a470cc6f2f1040/
    mips64el | Resolving www.ferzkopp.net.... | TIM | http://autobuild.buildroot.net/results/8aa459306d7ad01af38eafa98ba76a07fec8822e/
         sh4 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/3d326ba195682b6650ebabcedbe4b5d4fb5cf116/
         arm |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f6f66e0121f2a43aaeff375bfa0762f409ea2c50/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/ac2fe0c7b1222c2c0325f806b88da543f4e02d07/
         sh4 |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/11897243bc346f0660b3f5f48b0d6edfe6259b85/


-- 
http://autobuild.buildroot.net
