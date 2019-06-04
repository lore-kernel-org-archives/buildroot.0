From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 04 Jun 2019 06:00:46 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-03
Message-ID: <20190604060132.577D1261F7@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  20 |   1 |   0 |  21 |
   2019.05.x |   4 |   0 |   0 |   4 |
      master | 190 |  62 |   1 | 253 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 29
                poppler-0.77.0 | 7 
             iputils-s20190515 | 5 
                openzwave-v1.6 | 4 
                     vlc-3.0.6 | 3 
                   gpsd-3.18.1 | 2 
                   libva-2.4.1 | 2 
             openjdk-jdk-12+33 | 2 
                qt5base-5.12.2 | 2 
                    efl-1.22.2 | 1 
             host-cargo-0.26.0 | 1 
                host-libsodium | 1 
imx-uuc-79e9798eee9cd972d92... | 1 
libubootenv-8a7d4030bcb106d... | 1 
      lua-cqueues-rel-20161215 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/eefbc430e433e8f165b6dd15c9c6e66d84f8c4d2 |     
      mipsel |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/5b50f85f276b3d46cdaf073783c1dbad56e05d4c | ORPH
     nds32le |                    gpsd-3.18.1 | NOK | http://autobuild.buildroot.net/results/bb71048505a9475dbaa37059e408aaa809993442 | ORPH
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/725b7cf05a18479109f61b712f14e99a0e2fb784 |     
     nds32le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/78026987f135a980856e136b6bf719a8e3719166 |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/beb069fbf99e9466a727134502a3907b1bd4deca |     
 powerpc64le |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0086247b42bdc55b545b41204a73f5b63d2a8b74 |     
      xtensa |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/50534ef411af0eb4c92373b50df3de51314833c3 |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/89a514d6f8d82df580131c9e177553a5901c7706 |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/22b377ae228ff62e53e56eb7ba88ec83b6f8c88f |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/49cf806ea954833d66956d73f320af3598093e10 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ba69c4a756a119bf25bbf36f7d9a3e7bf9161d5a |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/7461e63739be062b3a21708a296954dcd96397a6 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/e8a3a1dce78f96c6b8e05d2cfa44249045aec202 |     
  aarch64_be |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/fbf740ecc62c210729561c71a8a9b59260d945ba |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/081b328f98f540957c083a43b71de5feedceef8d |     
     riscv64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/b1e15ed518afc357391d260345bfc5eee2f70026 |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/87f345510c0d8eeb357ffc4f008d01f74d51757e |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/05191bcdfc019ff98cde61fd2d0b766d4bd06f8a |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/b8c3d54bfe671345d8cfa1e22d4086d5142e0386 |     
microblazeel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/c405e6c16ba597173c04823d5a1fbd06d1cf781c |     
     riscv32 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/7ee21818593ae4ddc7e5e5368d13f478400d5ced |     
microblazeel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/063d99a95338c2e28291289ab978f4ae6bdfa222 |     
        mips |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/cfa129f95509975e388ef6faf267dd8b17aa9398 |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/8d9a33844fc41928ca4b5b5773451f96e755924f |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/a87925cd183f362b42217b1c79023b567c6ea028 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/50111ca3de6289feb2a94359285e8260ec9df87b |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3b24b5f542514fec630c6897743d4ed6f14b46f1 |     
    mips64el |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/902c480dd2041158e1779f2bb2ae545c834c5c79 |     
        or1k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/98ed5226769cde3469ca20597f8634f53d0023f9 |     
        or1k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ba393ad00f9de5891eb5472e79afad64fb30f48a |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/3bdf89710c0d92655257962f09c6106680d10a64 |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/eafec0e72ff6b934bd9ff7f4a9db24b3590f141a |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/15a2bbb8f9bf3d69cd1d65870d52e599eebcea72 |     
         arm | imx-uuc-79e9798eee9cd972d92... | NOK | http://autobuild.buildroot.net/results/afcb62eefdb32b63dfa9b3a38e876fd9df485744 |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/fe371cb946fc6be2db996e46837afb13befeafed |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/3a5d248f94d16d15779d011b985045855a3e9403 |     
  aarch64_be |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/efca68cfd2d9159080bf46842f5e5ecb5a18fd3e |     
microblazeel |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/f954aeddd8d82ce5653ca1f9785b18d18d0998ee |     
        i686 |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/56ea0dde7659a4c0750062f6a2ebaadd6cceeb4e |     
         arm | libubootenv-8a7d4030bcb106d... | NOK | http://autobuild.buildroot.net/results/6b3280e6ee39d968527fb4daadcdcf8518b38efc |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/1e3d72fc1633de1b219b238b565d9184de3fd6fb |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/af5933a6f6cd7ca3b17068ab180a9bd0dfa5f78c |     
microblazeel |       lua-cqueues-rel-20161215 | NOK | http://autobuild.buildroot.net/results/c35964dda4e2328c2c1f3b2388677b68c5ed461e |     
     sparc64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/43c5d08f599e8f44b59a576d243ae1c7b27de7a3 |     
         arm |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/3bc49a7c78eff5ad896625ed2956fbf5ec48d780 |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/4bed6180a08a30605f4654684bf50af760d55c97 |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/b60a85513c1796eb74923c7f1a68cf981dc548c3 |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/ddbd451627468bc6ba20a7d9e2f2124ea1842d63 |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/6873fc06c00acb3b46321a2092f064a3bd012975 |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/6d7e5b4277d71aa4a767aca5b47ee2d2179a1e56 |     
         arc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/c64e88e7041087e84cc0426701fe8ba54bcf980f |     
    mips64el |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/956e441d9e704d9d281d7ada0655821fc394b667 |     
      x86_64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/0f0284f9a7d03fff57d15b19a3e61e912a1ca271 |     
      x86_64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/db31c9fe220b279a8ce5a2f611cb043d697468fd |     
       nios2 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/1b238173db5e9989c2f7f190e9f5dd016243a60e |     
     powerpc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/94e3264100d0cc93f6e8cd4ffd646c572c11136e |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/066810013bc179316136de768a070cd32b1053ec |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/984e2f67cd2071b65d55502b87000755de88e205 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/3464468e01ba4a21535cba709a004d7f2ff960c3 |     
         arm |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/f964dd4f9d1ae2a3b97340f3ea2f206d9a70a053 |     
     powerpc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/17dc8a76f7103a61182d8c9cc2f4886da8337ae0 |     
         arc |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/861bd18d3df7ce21ba5060d812f0849b16f6b77f |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  linuxptp-2.0 | 1 


Detail of failures
------------------

     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a83357d29ddfb1ac2ba30445ebe2201973ab84da |     


-- 
http://autobuild.buildroot.net
