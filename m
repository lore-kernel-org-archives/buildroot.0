From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 08:29:52 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-22
Message-ID: <20170123072952.3357820C13@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-22
================================

      successes : 154
       failures : 49 
       timeouts : 2  
          TOTAL : 205

Classification of failures by reason
====================================

                    ruby-2.4.0 | 11
               sdl2_ttf-2.0.14 | 6 
                    mpd-0.20.2 | 5 
            lttng-libust-2.9.0 | 3 
               openswan-2.6.46 | 3 
                  fbterm-1.7.0 | 2 
             berkeleydb-5.3.28 | 1 
                    cups-2.2.2 | 1 
               domoticz-3.5877 | 1 
glmark2-fa71af2dfab711fac87... | 1 
           host-nodejs-0.10.48 | 1 
                 hplip-3.15.11 | 1 
                 jack2-v1.9.10 | 1 
              lbreakout2-2.6.4 | 1 
                  lcdapi-v0.10 | 1 
                 libnss-3.27.2 | 1 
                   lite-0.8.10 | 1 
make[4]: *** Waiting for un... | 1 
            netsniff-ng-v0.6.2 | 1 
               polarssl-1.2.19 | 1 
                  prboom-2.5.0 | 1 
               pulseview-0.3.0 | 1 
            python-pyicu-1.9.5 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    rpm-4.13.0 | 1 
               tcpreplay-4.1.2 | 1 
                 xorriso-1.4.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9d600abb63df653133777b074a30f6be646610a3
        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/46484e5aed54fe503c1b5a82f9e2dd611d212cd3
        i686 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/25f914c03c593ec41bc86a225858aade6a41d7e6
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/eec5fea69085b12c84914b14af861cf86921f9d9
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/9bfa59e8a502eaa7dbd84a8c5e984ce72300540a
         arc | glmark2-fa71af2dfab711fac87... | NOK | http://autobuild.buildroot.net/results/e9c2e791f7ea608039f1a0555719aaa4564799ec
         arm |            host-nodejs-0.10.48 | NOK | http://autobuild.buildroot.net/results/8334631b54fdfd43d38ca00f42e4d5a98e3a70c4
      x86_64 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/7b7698311b56b156dfbcc39c64f6cb6710cdc70f
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d0b4108aed75f851ec718c2e7d1ba3d3bf5573ad
         arc |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/f86fb0bf7b25b3b878cea0c42ec59fe12156b3b4
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/06d0d802c98ea08c0b298238447677cd2ecf87d2
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/8a3753025d060c3c4f371c12465b763f1ea75cd1
     powerpc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/9c0b6fc56e9074638402e5f84a9590a755c24b1c
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8f89476bc62f636499121808a54358c7558894b1
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0d6fe3a9404f684cf943769d851a851508b7c65e
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0a7fdb5bc1b1b8405616eaaa673b3daf294eeeb2
      x86_64 | make[4]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/4d3aa825c4bc52bd05a866404189d34746db2ecf
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/ee632f7842d503f4b93275e15d772975bc3bdd9a
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/23416c40f147b539f2483372dfdfae5aa64b5c37
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/d59389cd8bbcb0634f643773f3b28a792adfb90f
       sparc |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/cacb3e880dd58f845d1aece8e8b1c85a9cccf3e1
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/70f833d5b05d309dc80512c03c6e6965129d43a3
      x86_64 |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/05a45a434acd2955a0efa9dd02195465a5c77532
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/014267ffe056ddaa335adead1a93136f53173694
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/aaf5fcc1025c53abdae2380a8ae95c4f239394db
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/e2f39c80c10e99f07f49da630f00f905f7b4a969
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/ac17f75dca3db1ad6c99dc7f944766f55b7397ad
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ab9376a63de8f26126489db88e138cd7600be299
        i686 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/22deb11fcb6e929e98d4772dc0ae8ae41f1b4ae6
    mips64el |             python-pyicu-1.9.5 | TIM | http://autobuild.buildroot.net/results/a98f82f5d74316dc44c7d3ddecdd99a0d3a66cff
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/f7e246de15ce39c7b4face7608a8175768e24f5e
         arm |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/fecc9cce130b713c40019494709500e4a20d475b
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/40bc07d67ad1ae48fa523ad5e341c98432766853
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/08d8f368e55e5c405d5298a1c0e653a8d42a3587
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f61aeb4886da43d5f1ed1413d92bacd1b90343b7
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/4763bac99bcf37015b383b765223121135685458
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/bcdd988164a2eaa1bb460a45af072723dc8e322c
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/717e060cf488d66eb78baa95888cfd157bd12a18
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d3742010fa54b2d63442d266fb77e140a17cc35a
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/aac5dee61998b7aba60c6e33ee2d33f51fd0fb56
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/ec1e1eb0156530379fadeb72ecbb350057e5ba25
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/122b0a230543173fc692788185076c3f54ff1647
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a9f65d882538c67cc0ec345237909319e864dbda
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/35e5880b89e622ee48b565df3b92bb50cc2d145d
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/77d46d019a7b4becfb6deb40aad652ebf5a1c677
        sh4a |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/14ad669eccfb6283a1ea8ba4296b25be741e26b9
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/69da9945f2b8e0fa84a0eddd515ebd9b21fe0591
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6daae7a77735478a52a26177372b46c8ae48dd3e
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/dc6df9a830eb4f58765e64234e180a4a08d877a6
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/8c96417e962bc5295a6d7b21863e57e6b771d124
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/433ce812f0e1c225c9df780b1e9b951d19238638

-- 
http://autobuild.buildroot.net
