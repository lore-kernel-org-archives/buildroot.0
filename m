From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Mar 2018 08:00:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-10
Message-ID: <20180311070021.E5A9920650@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   0 |   0 |  30 |
      master | 154 | 137 |   0 | 291 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    ncmpc-0.27 | 22
                   libxcb-1.13 | 19
                  mpd-mpc-0.29 | 18
                   ympd-v1.2.3 | 14
               upmpdcli-1.2.15 | 13
                    htop-2.1.0 | 11
             libmpdclient-2.14 | 10
              host-libxcb-1.13 | 9 
           host-cryptopp-6.1.0 | 4 
                  udftools-2.0 | 4 
                  cc-tool-0.26 | 2 
                  host-go-1.10 | 2 
              keepalived-1.4.1 | 2 
                tpm2-tss-1.3.0 | 2 
                  boost-1.66.0 | 1 
                    liblo-0.29 | 1 
                    make-4.2.1 | 1 
                     php-7.2.3 | 1 
           python-numpy-1.13.3 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/eadfd60519299e8f38070d4b9f50b593186fbde9 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/4f54507ed4eb37ebfdbdc5942dd0a6dca0ce71f0 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/051af52b3afed25c2c4a3177ce6fe5dea93fc8fe |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/b62d05c36668a499898af59a5093b67d766fc912 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/48bdaea345a421b4f3ed01a04d6fc39d4e2a46c5 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/263d65e7ad644e71423f62bd423d559bdaa82868 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/c5c22ac8a89e416e897aef4d56625b4cbacdf721 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/607426b7136fcfbf6c23661d1ad449c98d504ee4 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/83fc65cf7253aa61355a81139aca5f3ef8bdeca2 | ORPH
microblazeel |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/173e01c536c58c79058d5175720e33fbaa794e86 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1d30c5dae7b8cb81a0580ebb5d8480587243757f |     
microblazeel |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/00c324e28ecaaabd5374bc43f3ea13e0ae296224 |     
         arc |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/00cc1ce83af0ce3d98b420077cb773965efabe6a |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b627134ca6d0b26855bf58c1684a4dd27dec9970 |     
       sparc |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/28f3cf4fff0d225d9f8d1c1a5d9fc7b24343a063 |     
     powerpc |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d00a1218fffe2b45aae812c6614a5bab27c9fcf9 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/2b9dfc9840d727c2f851296536314fa933e30a11 |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/889c948b5e2ae59ad1c416f003e0c3d0f8e9440c |     
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d08a6375655587c5a4fdeeb88d7e0d066e7a3d03 | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b30e757acd9599f4032e4e8bf718bb178fa5e54c | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7c0980aafff11adf08e49abe1adb91f1edb5a59d | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d57141abd6ee8b341b8c2618fb28c9af0d5bdb3f | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/674cdf28afaa70bc75071024d3958ed62eb00adb | ORPH
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e4fa933d058e7c48e9f14c65adedea504bb407f7 | ORPH
        i686 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/6770e7b512aa23ebf3850648f92acea088470283 | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/4f4fbfdd39672edbca32a1de05ebb82696389948 | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/645ec647dff664db12032fd15901abf07c7c4d12 | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/63d7b9a34446c57b744307ea5227c2c3fc8c8a75 | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8c95ccbf373449ebcb55730b13b1828bbada4463 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/71a2aa06cf3f006c7acfae3d53569346b5d31265 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/6797cd4747df736740a1979bebad8441ebb89d31 |     
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/cf8a595ced86f24645b06b6eec3ec2e32aceea93 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/81e444c6005cd8fbfa57991dbe0ae45bd6bc1297 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/fc2840d08ac9931d7d8394497d46ca23c8efc1f4 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ad314b587db7f3feb9a8ccb14eaf54b8862af44f |     
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/7042d03227a1eba26432df9c388a82601f28776f |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/34bc7b04b83d248b677379c88326d74284dc0700 |     
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/932b78a76ccedbf7f587aab70198309dbac39aa0 |     
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1397de9c02e13b6196b3f9823604610d68c53e00 |     
         sh4 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3a67479f87f6d0cb95b43a9bae1155b5e58fee7b |     
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/8d8a0873d22941543fa99fef4ee476741120642e |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/93dd176d699259504d5f97a28bb54b524c189cf1 |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a073f2d38a757ed84f86fbeb8c84b7eaeb45a5c4 |     
     sparc64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/76ed9df26ffdb89c8de14419655fd8655e45e9d6 |     
        mips |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/19ef4db778c26ce68e4385c8abadc3a6168f5148 |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c322acd822a08f3c969d92145c14ab0e6fb05265 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9e2163e1971f67778d767da5f5df550f96da75d0 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/126496dacffc340ea51402874bc610873547a9c9 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c643be3caa7bc499abe7b2119fdc8a59d4e15a6e |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4648cd3105444c4b772b7f8206cf67cdd602876f |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/db8d0039446937024f95c4da5053d433eb46fa8c |     
      mipsel |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/e2c4c539e936367ee841b14c1c01fe80870a3e6d |     
        mips |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/99230a2dba8399c60b5b9f4c55ef274c663aba36 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/e82e8c95436c6b324ee9b2d1854c166b6cbced48 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/676d99cba23a8cca36655dab6cde319d8fa267a1 |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/dafad37aa90d74c263042f1be276f69f361c3722 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1133aac7c3861cf6cdb18b593de690617d36b3c7 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/f493f63e388821f22d98e66d2a6cb7ea2c94850d |     
        bfin |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/fbf621ceef679b78f2653150680dbe071ff434fb |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/38ee32d00c82b2a7339fd2a8b79660f53b882fa9 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/266def4b81bcaa9048c185814e750e7f27ecb778 |     
         arm |                     make-4.2.1 | NOK | http://autobuild.buildroot.net/results/8418f5ed56dacd6900946e7d56ad36ad03c7bf7e | ORPH
   powerpc64 |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/ee9e88e52b6acab730110a034c5cf7404ab75e31 |     
     powerpc |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/71faf8048f682cba68aea0fe9b7e2226fdb4d9d0 |     
    mips64el |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/5db517139efeccdf55306212c81dbc85b6e2ea5d |     
        bfin |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/5c4e8b1c9fae4d23b27f7e4fddccecbd79158439 |     
     sparc64 |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/08be9c19c8f37700c0d3f9e3e70eef9c017004de |     
         arm |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/15797fc41928103c870c3472a780979f4ae1089c |     
     aarch64 |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/91f4414769290db460c7947c19f19915486236e3 |     
     powerpc |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/47c9aae16ef448aaeef8d92a633419957d5c83e1 |     
         arm |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/3a480ab0727d7fe0d9662c180fa5e8588e439d7e |     
         arm |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/eca5706a74dd3db9047c58370efa3428d5d9be61 |     
       nios2 |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/9aa00a6617f0b90e0cd2b59a7b397f7a65494ba3 |     
         arm |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/23a927a065555d3370bb173ac65969d30fb1b5e2 |     
         arc |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/c6c1eb66ca27ab883ad9243e718d419ceddc2176 |     
    mips64el |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/61f211b54c8dd80210d815d2fc5ae7dd636cf3ee |     
        or1k |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/29c98813f49e8c841c5d44c2c0d1180023afe7c7 |     
 powerpc64le |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/c2f31a1b7ec6cdef5a8c156c5bdc16336de65064 |     
    mips64el |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/aec9f3de545a832b66cd00c217fbaa99246e1715 |     
microblazeel |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/420e8d5a7c82e7646e5632651c4c3dfcb8837f3e |     
       nios2 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/0ee55b833f672096c0d6b6d82d814c123aeaf2b6 | ORPH
      xtensa |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/9f599e922b535d701fc916165045a06e85e7c332 | ORPH
      x86_64 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/63e88bf6c9bc3c3a0e2492230ed0c0c2a490a6df | ORPH
         arc |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/95928aec1134a1dacaeacda2f576cd03c1e3994b | ORPH
 powerpc64le |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/75456b8743ad72fa8e68ae8552c3b3562869911a | ORPH
        m68k |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/cafbd43caf3fb570c30017112429b314c04dff0e | ORPH
        mips |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/1c720af25e9668eeb54c63460ec94707d6917fda | ORPH
        m68k |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/104d7cae76a04f2342ff1b643bc318d30865877c | ORPH
      x86_64 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/e352c6818dc6a4da324c361d714248af9643d85b | ORPH
         arm |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/3dcaf1da193a2918971b8c6127be8ab82deb24eb | ORPH
      x86_64 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/49679ecb726589499138854142e3f410fef0e44d | ORPH
   powerpc64 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/51a2c06565b3dd0e0c49a4c218664adb78b70428 | ORPH
         arc |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/ef08aaf8158ba2eb592b62fc16b4edb2ce7a7bcc | ORPH
     powerpc |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/7b40919b37686f6b780a1eadfe80e19bfea75a8a | ORPH
    mips64el |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/dd3a17a7fb2cc2a69a18a42e9b279677a62fc304 | ORPH
        i586 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/db9bb6defa52342aeedb7b0f2a6f18db66a62f17 | ORPH
     sparc64 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/005e22d9b4d359bf427e4f304e9c4d47ad2a9fb1 | ORPH
         arm |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/4f5effeabe9120a9e9df1fab3a587cbbb91db162 | ORPH
         arc |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/4be07ec27d5e6f163ac81d6c8a3582fb089cc7c5 | ORPH
         arm |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/1bde517abdf0e0e534a0abdae5cafba5828bf275 | ORPH
microblazeel |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/8f94451796ee55126330a7dd265799ce2fc983bd | ORPH
     powerpc |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/a272a8e521863374901a5e3c0fb9da0b8daa4076 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/fa3f9f383dd7b416c4197f3e30ce7649b2cc791d | ORPH
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/571580c55f226ab44255d2696acbafb4296c95e2 |     
      x86_64 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/7bd462f93c94eab8d0bc141eb1d433ab69672c88 | ORPH
        i686 |                 tpm2-tss-1.3.0 | NOK | http://autobuild.buildroot.net/results/c994129affd47f030bfe31c31a5b04f98d1f61e6 | ORPH
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/02c735f9bf9e8b300c5a0812f27eef0d54a36437 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/3516e2fa9b338cb9cd6d5b7b446ffb95fcc36af5 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/fc5db84d49e3dcd08d9a8a5a5e8ab53fefb54199 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9f90de2569d5ab45cf1881e8b8ae17bcdc9a420d |     
   powerpc64 |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/6e17c7cb60f74fab1ed6563d49b348903b4cff2b |     
         arm |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/375899c87bac17b00c0b12ad4d86d7b26097de30 |     
         sh4 |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/721f39e0221d1a995414e5d108ef1a7724a9c690 |     
      xtensa |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/9518a0f9a5268c77b22c2ba89ba3e286cce0c170 |     
     powerpc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/4917c2a24b1abef9e65a3a36523388757a74b77f |     
   powerpc64 |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/b9196b0249f814155b72433d5c01799a1f9f8fab |     
    mips64el |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/3b8ad2c864aacfbdfd8a59db6da62c1104bcff95 |     
         arm |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/18345b4f6d78d09f6e948a550c497fad0c2dfede |     
      mipsel |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/384ee0f9b218450b3be307bf921b8c8cd9852de4 |     
         arc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/7d52ea2ecd7643ba518eee71c755eee64b9bc459 |     
    mips64el |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/a64e22618e9ec7c83fec9456ffeaf056197f14fe |     
      xtensa |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/f53580a28be16544995709b5ef33798470d001d9 |     
         arc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/65ad59c3d83efe5c8457cc82c03499d1e550b2bd |     
       nios2 |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/c69d20b80f694af8febfc87f310b3fa63d7a854c |     
         arc |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/85b46c1938ba21b7bf06cb370646756da6ff97dd |     
         sh4 |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/a1bff16dc564bed9ff7fedb3a145d4fdf70140a7 |     
        i586 |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/d300b1910c50db78ad602eea21747c7cbe43b33f |     
        i686 |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/4c457cca44f4a6e6d6abac9e8ff8a45265431b96 |     
        or1k |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/2a03c9924b28025d5911240f4b7cc483731e4115 |     
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/92f2f5949425af3206c008ba8233a9a43a4e89b9 |     
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/7ffe8d88572090bcd5303c6114c80dfe7d9c8027 |     
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/c23378e22964cf7aef77683bc986ff7d27e446a9 |     
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/1c79b0c41011fe9a2971ba75703b84e16bc8d1c5 |     
     powerpc |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/4d77acef6f29caff2062a464270529453b87dae4 |     
    mips64el |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/8b5bcb52f42d96790e0922811604e36d1c7eb738 |     
         arm |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/5f3f58c74eb1d26a3a701f0a3e6b2ce018e22187 |     
         arc |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/07adcba71106a2dca963e4071f4673791b41a603 |     


-- 
http://autobuild.buildroot.net
