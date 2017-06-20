From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 08:27:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-19
Message-ID: <20170620062720.1639020978@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-19
================================

      successes : 154
       failures : 236
       timeouts : 0  
          TOTAL : 390

Classification of failures by reason
====================================

               util-linux-2.30 | 122
                   expat-2.2.1 | 30
              host-expat-2.2.1 | 29
     python-cryptography-1.7.2 | 13
knock-258a27e5a47809f97c2b9... | 7 
                kvazaar-v1.1.0 | 6 
linuxptp-97c351cafd7327fd28... | 5 
                  cc-tool-0.26 | 4 
dropwatch-7c33d8a8ed105b07a... | 3 
                   attr-2.4.47 | 2 
                   libnl-3.3.0 | 2 
    trace-cmd-trace-cmd-v2.6.1 | 2 
                beecrypt-4.2.1 | 1 
                  cppcms-1.0.5 | 1 
                  giflib-5.1.4 | 1 
                harfbuzz-1.4.6 | 1 
           host-doxygen-1.8.13 | 1 
             host-nodejs-8.0.0 | 1 
                 lensfun-0.3.2 | 1 
              librtlsdr-v0.5.3 | 1 
          mediastreamer-2.14.0 | 1 
           python-pynacl-1.0.1 | 1 
                socat-2.0.0-b9 | 1 


Detail of failures
===================

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/56f7f78fe9d18a7969c2d5e41df7f9cb3eefa435 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/3c13c3c55bc147fa53cb7d3b2f091264d41d65f9 |     
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/92b422de8bdd67fd2f595d2895c387230d3e3863 | ORPH
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/67ba5d0b1e95a265c8ec5bf317f77101a6466cdb |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b9169d26faefc51637e081e6bc8367929e5bc2dd |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/a7ef7dfda9f6596037021fddff48ac0c2cbc81ba |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2e469c37491647e30281a72c606581902f87358b |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/1f311662408b3423450cfe69d6976afcf704cf78 | ORPH
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/778dae8714aa1acea12d7c2058c7a654dc6f8b12 |     
        m68k | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/4e3517fc07925d82275d87b92612276a9aca1436 |     
         arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/52d50bd418c01d1ae06d168bccc6e0691994c6b7 |     
      xtensa |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e3f587c60ddc07a15b883a1ce4a90ce6b04acd85 | ORPH
     powerpc |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/04ee5fd262c9d4139e464d5ede5258d4c3be47fd | ORPH
        i586 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/304be0cef33b6eef1648a6307c11ac8f38447027 | ORPH
        sh4a |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/b37d3f37352dec0efbfd5691af7054577344b757 | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/3036f6b3d0ac304b21c524d58fbe3783d05843ef | ORPH
      x86_64 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/f9607b0bd802943b64c5d7aabcf752425491852e | ORPH
      xtensa |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/0ab4e3c3d78732289b3f8fccc0694048e528ac4b | ORPH
     powerpc |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/861b0b7a6a6b859ca8dd41a0e11774f03b25ca6c | ORPH
        sh4a |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/7a3c25c35c4eecf3757e5833ce82f156dc2b0359 | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/3d9466e14f6a69cf9d14a775a80769935dc15d2e | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/417dee25a5d20e176381ed6c25d9972f3feb93e0 | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e70130a936c21d006772526bb87082824bd9f7d3 | ORPH
      mipsel |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/794437e6d8b13e4dd577e20626df4b967e5a4e87 | ORPH
    mips64el |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/0240e26d585aecab2f75798853ec4e698bbe6f82 | ORPH
        m68k |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/845d305ab3de202f2c37b1cc2faaac3c29417e33 | ORPH
        i586 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/52448e6c2e072389ff9e34ab22c4420a480eb2cb | ORPH
        mips |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e5bd08c7c13be51c91e6d6b40e3934d81a03a70b | ORPH
       nios2 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/821863d9ed5399b56f1627fabe39d27c9ebe9f90 | ORPH
      xtensa |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/47c4a41bb92c1267cbd28de3d30cd98291f3037a | ORPH
      x86_64 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/f1e8680ed33ef7d8888ee17ddc6acfa5e90878a8 | ORPH
      xtensa |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/05c47c60e91280df1b247e793fc057fe5b8db19c | ORPH
      mipsel |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/0f265845abd7a4948eb3b1108841c38732ce5adc | ORPH
    mips64el |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/d81e59c674d21991f27297bbbc4e0e19ce8192eb | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/c6a1b6abd4dbe80f4fadf40b95c6ebd2b7c94961 | ORPH
        m68k |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/9eace276df9668ae58e7d6b75c856f65b76f5765 | ORPH
         arc |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e5057770f16dad94b536c73ce16bc97a5b79ff78 | ORPH
         arm |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/b3e2f1373932c81febfc96e3db9b06d9f835626d | ORPH
      mipsel |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/a07648feba0f69bd7149c72534d05db293c1afb9 | ORPH
      x86_64 |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/4ff9f6bcabffd07e9d98c9d337db30a5d5e303e8 | ORPH
     powerpc |                    expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e1c025fa76ce09c27871d22f89e90eb37ec4a340 | ORPH
         arm |                   giflib-5.1.4 | NOK | http://autobuild.buildroot.net/results/467f4932b2b079837654d35bf258d384fdb001dc |     
         arm |                 harfbuzz-1.4.6 | NOK | http://autobuild.buildroot.net/results/2eb54aa7723836479e9f4ef46f6d7eb057b5644d |     
      x86_64 |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/f55a04e32c83620661d0542e89eb2dba9433e476 |     
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/cb4a0e195dad7323edd5e301d4942666f3a1c634 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/044bac892c1146100364425a034c6ef70defeb90 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/5ed73a61cdd2fa46ca5eda87fea73a8b761e18d0 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/2fb1337066bc7dd595b0bcf40dc7d3fa772d93bc | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/da1bdea6d65317eb07ceed2fa398ec80b12279ea | ORPH
     sparc64 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/c08d5a1b873774d5ef9b38b857cd7fdbced8ee1d | ORPH
     powerpc |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/e0983b0a22b1fac5c696fd8c18095cac78a5869b | ORPH
      x86_64 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/9bd0b4705198296f1f29cbde45f4ea742d762936 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/9e9bc9b73043185cc900f4dc2a08a21ce7098b28 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/5c43d179f7fe979635632fd3da4908ca27b3964b | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/38004385a55233092056ca9aac0e939acc08ff54 | ORPH
        m68k |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/d6f601b8391b457eef9900c0697c6f3124a74213 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/199b8f2551410b100ace29a54080132235755050 | ORPH
     powerpc |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/967ac8f6957a9ad44f672dfca4900d865dd19490 | ORPH
    mips64el |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/ee564fd844cb9a76dcdde8b49b5d283c0c0b64f8 | ORPH
      x86_64 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/80ebef329dceefef5aac9706f6185fd441d8c58b | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/aa553e48878cae63fb134e150d58b50f1962ca92 | ORPH
        i586 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/b79cf56ff27fe56378a31bc6145d42d627c3c9e2 | ORPH
 powerpc64le |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/3d9241cf3818482626ea465e658ee75da1c648e2 | ORPH
    mips64el |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/acd3a9250a2a58a3bf7ab143a281fb3287eab351 | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/61d6990d88ca5a6338b981b840da7a977b6e2102 | ORPH
         sh4 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/5c045e109868e95b743b64128f83128ed9baa583 | ORPH
        m68k |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/dfd9a4335952a5b487afc09cdcff11325f2fb1f7 | ORPH
        m68k |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/a74cef7e6f8f805c55c8632f7d4e35d66fd21c76 | ORPH
       nios2 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/3876f383d1fd00b565c988db5095e1d3303ae8aa | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/7656d4df6527a918a5cb07bf9e96bfd448293b27 | ORPH
      x86_64 |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/80678541dc1dc88a8a5fdeae820a4623ef1c18e0 | ORPH
      mipsel |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/465f9246e3373efad43f6b90797c369bfa41dc1b | ORPH
         arm |               host-expat-2.2.1 | NOK | http://autobuild.buildroot.net/results/1e8befab988ac9d35603aee828cbe2c54d773c00 | ORPH
        i686 |              host-nodejs-8.0.0 | NOK | http://autobuild.buildroot.net/results/1d7642073d169de941e74dc3a0efba6e992e2de7 |     
      x86_64 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/2472e04feb7b12f6933e265e17a1ec2104042307 |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c65c43c52d839b6588de67f17a028723863294c7 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/6bcad3a81beb02161e1690e6797d52d8f3a5fb3b |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/cfb4a14cbf32373974e09f14e551fa45ea76282e |     
    mips64el | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/9ac26fa1b1ac384355458dd59ca92dff100efd50 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/885096d5155d7eb04889a67671a064bdbf49f245 |     
     powerpc | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/42e1be6a72a3dbeea829b73929a6a3c875fc3462 |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/7d1716d370fd9b7c2a4cefcb7cb95b6ae2e0898f |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/2fd0d573f6e23be5d619a395221f4bbe4e899260 |     
         arm |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/6e1eabd691b8674f61898bc0fe734208d226f965 |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/5134999eefd84236a61a6cb33dc7b66019d65e6e |     
        m68k |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/f8bc6f968d6e61597ee24687d27f66da67e35fcc |     
 powerpc64le |                 kvazaar-v1.1.0 | NOK | http://autobuild.buildroot.net/results/02f3d68492ec3cef90ee0ce9c6032cf3bdab579a |     
      x86_64 |                  lensfun-0.3.2 | NOK | http://autobuild.buildroot.net/results/d61d3fb5ed5aea4e5e5676edc19f9060b491f03b |     
         arc |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/8b8d2a207b321647b3904fa949931c7fda48c3e2 |     
         arc |                    libnl-3.3.0 | NOK | http://autobuild.buildroot.net/results/31411a174556bacc7b7f1ef6c86493436cc925bd |     
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/040c5270f9315e83c723687eefad764aa0d6d500 |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/a3e3490379f217759d67574d63b145808604682c |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/44eabae5ba7f7308f55a36fc691e234297666680 |     
    mips64el | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/6270270a267caf3086c0f92f773fd5d15b613e8c |     
   powerpc64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/113f59e7f64724ba6c2bf36ee33bafdf24a9166d |     
      xtensa | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/300924547871f65536938e44d69760311fbf9b36 |     
         arm |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/85a2ccb82de9b36a6bafd93d44b7a9d4cd0dc19e | ORPH
        sh4a |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/38fe0d539542c128d611983324603122094e3dbf |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ed96c343d26c54476214650e748e834159f81fb1 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/bcb3eaf5157b5bbf648ebf564ddedb924cf40e21 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/85bf9f9a3a5e9a18760b522145cce9db12e1cada |     
        mips |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/8e17e2f1e1d6e5c978783bcceef39a8b56da27e1 |     
    mips64el |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/610e692b651ac69becee874e9fa9f546094c5030 |     
      mipsel |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/ede0ff84407e1cb5964d696d32a15a758e462b20 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/e737c92ffba6eeb4e34698d58db6a3a7b5bb6f77 |     
        i686 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/d7891ff9c2fb53baed309bbc97a75833485f6e28 |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/147e5f4e0aaaf9b27ba226476463dcfc07be9439 |     
         arm |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/a47df7711a07a522275d1ba4d30f89795e28d25c |     
     sparc64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/24b51dc6066bd91d0edaab8eee535d4c810af4ef |     
        i586 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/79d7df1ac654b6768499e6dfb39a194f25fc7116 |     
   powerpc64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/97a99a2706ed5e16253b5d1adbe45dd824d77bfa |     
 powerpc64le |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/6256686eb7026eb5bf09fbd6465f7af04228f38d | ORPH
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/ca9dd7ba6a9e73d068cd51fccb014e654450a4d9 |     
         arm |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/4fc1c2878daa57cc2cd43cbc7978e728ded77eb9 |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/47d239d8a86e095d6feb6c548317d69234490414 |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7c516ade3696ab662f773356250fcb85eb46b2b4 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b75fa116f594f52b5aaf1e42fb05226100b2c35d |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/351c9f53338b8bf9e265ac0145d01f44073c727a |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e94a460e9ebc6dd0ba9bf9579a5a36d2558230f5 |     
        i686 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4b2df4cf289f10d6e7049a813b03ea3c62805da7 |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/584a5e97bae463d623533cdc83a5dc27ace10475 |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d285283c7298db7a453882f58d77d39d7460c95f |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/77020a69c1d88108a5111404b9ffa873901be5ac |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4c4309deac17247c5e18fb45bd6fa06874679eb3 |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/23b39a47fb07249754aea0b66210358acf600170 |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d55a3035848f20b4d0cd5a49ab9ee9cb0f723aa9 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ae5e7890bb82d988abc9a0b696fb126556faf9eb |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/67a7bc82feab183ffa60551956a4a223c332bfff |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ca3e05fc5778e020e3127e36199b15b5afef0051 |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/846df88fd917724c2ecf571ba5fe53eb047ea2aa |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0a7a99dcae1a12668629faeca6691e015cbc248f |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ba3c0465870f6183ea3cdeb34db1cddaf1e6efce |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b61469decc60c6e625b84b55e3a445504ab18b9d |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/c7e5d3c93d406b9cf66cf337d9bc41612837ad8c |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/fc1c6bdff032dffc4103e0dbfc633e6e5754328b |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ad39895f3454e1bafef1f3e8cdc3a782bb8fe7d0 |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/add79eb90e37473ef465c79295cedae8ee158715 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b82ded3a169b8cecef67dea80945ca16688e2bc9 |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/60872c3693eedee66cd3c067b98f194d4cd2e99c |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/666bf9ff322d32c6d24c053efff61845d4a6751a |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/2a3f6e7bd0b03ca1b65a6944bffadc1797dc1551 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d2cd9096dec9edfd814d0bc3af47aff5e50b3679 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/2e10171b889f192c6aec25d5d3615340d2d4b3d1 |     
 powerpc64le |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/59b4ecdbed17e1da56ae757b339d6fce4550fa5d |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/c3cd8c4c46e54650ac08c1ee4ab1624b2386f24d |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/edffeb02bc28bc870e969b42cf2735517c79d89d |     
        bfin |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/bc4900fb11d458d91c5d9b94b9b448d36c673ce2 |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/07569982c9e43c3084498b7239607f95876aaf71 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/19eb1a2f3cc31c5f66840d84eb83f1a0ceedcd9c |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a2399abb50fee6571bd7a4837b02114ba6986009 |     
        bfin |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e55e44c8abf1a403e6114373b3ac204aff416182 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/f6439486904ee69fa3d15adc01cc4a63e958166c |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/f7f460bad36c6478db1144212832b67d1c7e1e45 |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/caaaa7901dce0a00eed9cb09e9ac9caa54c0b702 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7540a850c2c2822cd88e43175aafdac61caddcb9 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e13ef8ca76681b7aa53dac36da9c98cf15a56e2f |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e4aba2aae2d433ac7b630b79b96abb0b5235d1a3 |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1c19c81e5f7ea51e67b814367379bf7b091b1e3f |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5e50b243dbb327a129bc64f89a5b84b128a8709d |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d1d150d9fbb1df128a180aec3ecfecb411d07a72 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/6ce8580e3e6f19fc9c3a264cb6c5efbe1b95c406 |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/954e2fa1c4cde84be60d444210197e61efa2607b |     
     aarch64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/53589b3b2852d41599675a867696dc2640654df7 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/838d2005ba20050a2a4377a70a518a3d3367c492 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1ac736c0171b58e0ef7336a8657177d964388029 |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e9cb21e1ddc4e1d8488cbe4d83f29f6278de5626 |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a2ed9f59b09ac0483cb0d675dfa55f9415142b7d |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ff4402760ce023ad28bbf1aeccbb0d437e3d849c |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/07b514973d4635eaaf984fef6a5f3657e82164bf |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8ea557ae20bd0698ef86f157b0dd7c9e611b3751 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/556044fc0c1e3ffbb53485c0771ca3080b19c083 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/24a66a8434843020600801549b04e103cce0915b |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b440014cb4ea0af2b6757d847dcb592919ac52d3 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b4d57422fe5244938c1d246c9fb4c1f2ec3a7cd9 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/43486b35263354f22b460b58d357b4c37a58e3f2 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/72320ffa7eba2d8b6bd6b16c3ee5738d2d8c37eb |     
        or1k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/781233f5fcf6d78ed559352c5f90fe09eaeb8a22 |     
        bfin |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/e59f60cc51ade9cf98afa09b349b4fcebe4cbc83 |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7e10bf98606312a902bb220ce0657287e49c48d3 |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/bdd757d2e2cea353ab6ea557101a4044297c2e75 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/17266659f8eb3436f1ce04d34fe02442060d0ac3 |     
        i686 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/cbf9970febbc00266c7908d8304504295f0184b4 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/40d31604cc4c2bd44390d7a0bc50dc4de486ba03 |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4563d9018761c8013a864c82edabd81d34dbf748 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7415f45fc1af35696c56d91b8d1f2fbc3380d550 |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1c9b484a5c83a8aa00dd1d706ee2dd57182744a5 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/a1eea2823cc41a8ec3599db314c939658e181545 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/6afd0841351930c2cdfef3a9887c08a455213bce |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/ac9e6c70a45a3ff8d287896d37d6400f5d1d5c09 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/481c51bb655d9a282ea50726aee13111df1ed984 |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/32e86d6e277721b9af923377196515e6dcd8cc85 |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0dadcd33ca5d91597f1b07d168b8e0662d40f7c3 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4322d306d3f80719cbe8b7ede7cb14fe05ef24e4 |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/cca842d43d3bda28b14af0e61c65851ea23edfcb |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/78fb57b69eef370345ecdde1fa9177a191ccedb1 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/c1f4ce4af4a5ceaada4a0f53173e23a57c7a28d7 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/7ef2ad69301d0311385ac829503dd9ad36b8a76a |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/67f449de946dd14d79f926b417506c2759a272cd |     
        m68k |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5d0c0c170c7b28835ba03a0dd2475da962e6e2b1 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/150416171b27439fa04073fd4e2b26666900f0ff |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5899aee526b1ef463dc82b2170fc210d45281c4e |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0687dd550483930f1f24a8a634171dbd8af8fccf |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/2011adc3a28f3f95155150d82a7bb9b465057c77 |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1d8d85097177345f71003c88acbd4540a98bd201 |     
     aarch64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5b3b4f8f80c64f469d77a3ba84f66404b4bd6cf1 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/1a1c4a14095a4e5fbe4ef2c0afcb2f0a14730f59 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/45046dd98e4e17e31aa1e3adff3c2781f99a5778 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/604497cfe7d60d139785713fa0ad2cec283da30e |     
        i686 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0b466c3e2690705ed66f21030fb8e085ebcb8a57 |     
       sparc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/fecb7a6ed05c820720ddc2b9d63641b1dd8ea184 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/91852a1a39ee8925c8b6f0742ea7556b69a6cb81 |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/8d0d348af5814b2b16fe8f95e3ecdc23adfa6a2f |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/f611cc3324af94124dd6f71710e4e70b5cd8fe8b |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/cfbdb4c709383401854d6d04ef2286ef89b7ec9a |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/be809498812bcb44ebc4c6ddaab29f447ac8861b |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0796f6b35cb7e5b85ef8506ff1259b8312af83da |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/669c54d034df54de3e487c9af86c6792b1b9d179 |     
        mips |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/20fce17bc4557d610589af57ce21f1b8f145ae0e |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/4d5f214c2c7e5968946640d5f142be06d81653c3 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/76df0fb397edc3a719f12598fd5653f2c8a693f9 |     
      xtensa |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/b0448fda624ad4fd5a5b1ed8b00ef22e0e507e60 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/df7449c57d6afa222a8960fa3296f021922ec700 |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5a744e43adbbb28cd39fca4d4b6e84f1f825055e |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/038da8f4c72f95b7be5c13e39caa41820539d909 |     
microblazeel |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/91406a98e6ad71e01d0a8f500c884f92e40549a6 |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/79a9f45e8871684fc62de3e2bc96ab07e3de795e |     
         sh4 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/c9dc05e452c07a97fd665bfea54fc3861f6cfa96 |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/3439735a3d1a1589d127cb965e10d9a81e84b1ef |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/2e93a70ea7f2ae9c042baa298c240fa05172e50e |     
         arc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/0de26176a4a3010742cf1c786e0bdc2b8f016c03 |     
      x86_64 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/58ab531d09ad6be8ce5a603d6987b3d05def190d |     
     powerpc |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/3bab4a60cd190d9109e494f6241220a6398ccd7e |     
        i586 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/5d55ef0ff4d13e9264399da072632b4e1ad6ec9d |     
         arm |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/d654bcd29340c6be83c1dc425057e830fc10a0e1 |     
    mips64el |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/bc6f6b1e1cf1f6679555231ffc6a7026ce2c08da |     
       nios2 |                util-linux-2.30 | NOK | http://autobuild.buildroot.net/results/eac1b0b26198009e965b71fc5727c71cf8ad1e50 |     

-- 
http://autobuild.buildroot.net
