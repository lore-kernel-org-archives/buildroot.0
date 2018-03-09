From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  9 Mar 2018 08:00:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-08
Message-ID: <20180309070013.64E03207ED@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-08
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   0 |   0 |  20 |
      master | 152 | 144 |   0 | 296 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libmpdclient-2.14 | 38
                   libxcb-1.13 | 36
                    htop-2.1.0 | 16
              host-libxcb-1.13 | 13
zyre-1d949e4bf79b694ea883c3... | 10
                    liblo-0.29 | 7 
                  udftools-2.0 | 3 
             bluez5_utils-5.48 | 2 
           host-cryptopp-6.1.0 | 2 
                      qt-4.8.7 | 2 
                   trinity-1.8 | 2 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                   exim-4.89.1 | 1 
                  host-go-1.10 | 1 
              keepalived-1.4.1 | 1 
       kompexsqlite-v1.10.12-1 | 1 
         libcpprestsdk-v2.10.1 | 1 
                 mesa3d-17.3.6 | 1 
                     php-7.2.3 | 1 
                   qemu-2.10.2 | 1 
                  stella-5.0.2 | 1 
               xfsprogs-4.14.0 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/74ae8884a96ca776c1113a4b6c86afd49b5dcdcf |     
        mips |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/e925e919bed2c74b93ac6755d0015194ac7c66ad |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4988ad7d717861bcc261cf40438ae0e7c9a49c14 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/daf0ca578de74764c173abb110056dc4ef5856ee |     
   powerpc64 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/d4b761a04a1909f63d13ea45b27aa9c1c5714691 |     
         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/99926e0ccb3cc0ec91a82f13dd049f5800262484 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/1de5a8031d0712d814ffb617ebbf87de15421d59 |     
         arm |            host-cryptopp-6.1.0 | NOK | http://autobuild.buildroot.net/results/63987ea750152617967d4b86fde7cefa57bc7135 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e81f32173a7306420e72cadd18b6b646a811b6e4 | ORPH
         arc |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c9768fcc1a7e15f508b5491c8ad9cc0cd0e439dc |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/e5dcf3536a4c67370e216e34d11a5ff3cd4c5a81 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9770fa00084f78ee23d70669bd049f31a7d18b65 |     
        or1k |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a688faea13f2ca7942f996e851694079975e83ef |     
         arm |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1d042069755db505704c2107141f1500d4e1ae6e |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b181f660c461ab55e9d11f9148cae27b35c2f920 |     
    mips64el |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/ad61510c3821d05f6f2a60f0513b1264b23cab4e |     
       nios2 |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d0febb56fbebcc656c380ae960c512fa9aa2b719 |     
     aarch64 |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d4486cd255c49840140547986a99af9ab73290bc |     
     aarch64 |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9389d0ffe8cbf4fad9f3e1b1589c79d9ff32c500 |     
        bfin |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4380920117800d47cf5a24dc9d4d580f1db2f2cf |     
        mips |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4ad2e76cbc778fa1f00ceea9161e4141abb46d99 |     
      xtensa |               host-libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/bfd0106af0dbb44c26ed25e56e47ffc6c8a207b4 |     
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f111e6323acbe078c225f0c6853c3070c98fe1bb | ORPH
        or1k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e7550854f19871f3c997a4c77391c82f0cbc83fd | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/4b5be833cfd1d72e04334f69f3a531541fec8270 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/59b1e91f9353a3c3c38db73f58cf76a2b7e6ead5 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/1d757914f38ac360e631c00dd3cd93c647906042 | ORPH
     aarch64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/29b0744802022a443443ea37074a58bf8ac520eb | ORPH
      x86_64 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8e77145e25ec56f50237c16a60e8a6a04dbf8638 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7ba7fba278a3dca2071f74567a00b95ec5a613ba | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/de29153d0b8ad964f016fb10a0ae10695797fad7 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/ae9c883147c4af7f254f0d7c961ce1be3660984f | ORPH
         sh4 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/27f20b32fcdc1a650d9c0a360f791b70c922681b | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/a286c54894130690aef5078348a9f519d6ea2dd4 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/d8bc8faafe615dc57ae3f7c0b7d0cf3568bc8ae1 | ORPH
      mipsel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/0a9a165bfd3fa7d36ccd5b2c974465ea298251a3 | ORPH
microblazeel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e46541ab56e3259fb12ce60f00e5fe075a4e0a08 | ORPH
       nios2 |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b0b79df85e9d7911d59102d3a62db73db5388ff2 | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/df543d5277b3d5c8f0f29d6ac19798778473aa07 |     
         arc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/8262618de99062fa13a0a3742e8c7aec94cee138 | ORPH
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/797a9b5fdf6ab0f16f2249324b48292dfab61d9f |     
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/372e793d4022bbc698a0c939672af6971753d85b | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/956091f0c7f385b5c422d07c5cd5bc1a2f7caad0 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/84133769f1b912c5250cca3f60bd8d38e196dd50 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/0aab104411654a5c496e7df4e61c322c1f932bc1 | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6cb4822d489c9c0fd91eaaa9760fc75f27c368bd | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/0836daad338f41d8becd93ee7b42bea115f879a9 | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/7c0cbf8083ed446d6dc7a09b486c3757c8123b0e | ORPH
       sparc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c02851ce2a17c690a4cd2f07312a5e4ed95ffee8 | ORPH
        mips |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/60c369519dc86c9af4222c8195d15a75c1df5c25 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c86b29e53044aff89b465dc4992f74cabce2232b | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/51c8813c304af4febc8775ebb804b7fa0d9bf235 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/03b3415eaf6f00f59884ddc0a5f6912178d8d9e3 | ORPH
        or1k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ba2cf9db1c827dc9aeb82d8695308aef3b63a270 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/8056f16bfd986b75c78a71757dff4edd1623bde4 | ORPH
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e98b141d5466c330d751e560d987c8c5d994bc1b | ORPH
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2a364aa4163429cae5420bd98074c5a74dbe3c8e | ORPH
     powerpc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3147622d55de7404e5df4422ac56cb6656c8602f | ORPH
      mipsel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ca3a1776b3a4ab555dd095eb81673fba62a2373b | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2d49e9eabb1678d4714d7730bf508fa40f3dcde0 | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/52dc861893bf0aa475a9c60da5ea59fb77fc16c8 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a5add9688e9572662a6c323400539ada37e61720 | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/49ea54956e0371e27aa56298ced3811733b120b4 | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/8d684cc34122a36746c6bfb6d91281ecb908c4fc | ORPH
         sh4 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/00af3302c4029670a585beb3cb65bd8623cf12da | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d96d7d4695ad5a82f03769d9041cc5616f5672c7 | ORPH
        bfin |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/2b8846a7943e37eec0ad8b28762ec12866819ae5 | ORPH
 powerpc64le |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b192acffe1bdbb33e3c617d33791c90b3ffd8e82 | ORPH
       sparc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/aabf9c8c8037f3656da1737ca37f4c65a1f6038f | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/e4bf4f29fe825cd695d27a5219915446365addc1 | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/1bd7fd0df960275157f8d1d1ae7656a355ed1cd6 | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/b4156478b484e2d41f6743ab87cec80b5af3c779 | ORPH
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/011cd42a78518658a42d99332fd77ce250e5d8e4 | ORPH
   powerpc64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/08c048067dd3b3973c6868e0dc0b208d1b85c2a4 | ORPH
microblazeel |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/d446794f20244603238ba1df505ec2c9a15c8cca | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/a6038cb1d16b385957d0f788796bb278ab242c92 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5a68393dd689640b643b87cfffb420bfe58598f8 | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/eaa5be58b2b20391a901fdfc5696aa14f4ceb241 | ORPH
     aarch64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/7c9b3e438e985c3df01b8f720f32858547bbbd8a | ORPH
       nios2 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/293a8b492c0a667d0ff9eb0211aee2eb29a1f406 | ORPH
      xtensa |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3b95337b69ec9b30daac1c6d1675b4cd48bf647d | ORPH
      x86_64 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/64c30ac3b0b6e309b5289a287476abc6a7398bd2 | ORPH
    mips64el |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/611441f5fe3e39df05ea4f03c1bf3a4792f6b115 | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ce0a43a0967620a7cc3232be49838d004a223d5f | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/69f846c36f590647c4ef61e289b15f393e9f9f8d | ORPH
         arc |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/0d924867bf021f51fff92600f0bb6f9b7223035b | ORPH
      x86_64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c55fd4f0a7aa867ab0d4348b0b8338a9235ba69b |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/58fe5a0f6cc224c037f1816de3c6aca8495ac740 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/50af939747469ef8624851ec9e94543a737294f3 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/3ecf37a7c78081e869acd9206c87a8441f7787a4 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/48ebe086a813a3fff599df39c1a326a89cc98c7a |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/7ccd3e418534a2ec261ef55aaab63ab05013799a |     
     aarch64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/fd52f370181d73edac3a4e0810f32d4f009a2036 |     
        i586 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4a5d4481256637ceefb5a6f85e3eff74bc5bda81 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/10dfbc150db72e7b3f2b6ab79fb1c9094f56b411 |     
        m68k |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/eac72d796fb524b8bd16a7bc584ef857e7414e7b |     
      mipsel |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a6bc2c0436b94b3dfadd6eba1c25d9a889755c59 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9c7542920d9cc17ae090cce6ba3cb7fcb42d7adb |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b5bc415eec98025ab57e4273872780cd4cbf51ba |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/be27192498388f99ed1c9df633cd15d2efe549b5 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/0898b6d5e34f24a6f58f52e12e9712b8cd852814 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/fc05b15e1d8423858f39da3571ea6d2d57dc1b02 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/1735268cf31c82fc068380889a39ac0caecb3ffc |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/5cffc87cfe4dc9417bfe633ab4973a1e658878f0 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/442e4a92d3eaa85ead418800784088542bf9759e |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/3c345d864d8217290f11583ede13fb5a0e98a3bd |     
        bfin |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/9e998667ab9ea2f9a772ed982cb5b8d2b6a0dbd2 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/4f4e84920f8d9f202b5b242bfc37369e9ae7d54f |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/76fb4eabbe5e8a47f7134d147caa98a154a7755c |     
        m68k |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/3a3402227a996dfaf182571be5f7eb6e9c0389d0 |     
         arm |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/7076aae7596acb1b8c8ebe976f9c3498e485ba2f |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/be7228c454cccf8a624114efcffa14e7de5c38d8 |     
    mips64el |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c65d86400b213f439f8a24b61b3f5b671b671264 |     
         arc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c1df4d878b0bd4a4de41b9a70b717a7586f63b8d |     
 powerpc64le |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/006d940effa0757495ca6ef4c0812e8229eb8ba3 |     
     powerpc |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b66bfb3e51f7c9713249425157c9b43cbb44cadd |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c296b4f8d2ea349742b03975464a97174f58f159 |     
        i686 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/c55341c5139034dabad9d3bc2ca3206d0de2fa5b |     
     aarch64 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d7ed10521d067f02c203116e44eafc0a7fb8e442 |     
      xtensa |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/b544ed084fd46f6ba1b43821606b776e1509053c |     
       nios2 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/a4bc1ed8434b22601deb7e6bac40ce2ad75c9465 |     
         sh4 |                    libxcb-1.13 | NOK | http://autobuild.buildroot.net/results/d536641c86083b92aeb3c0bf700ebb3ecfb5dc7f |     
     powerpc |                  mesa3d-17.3.6 | NOK | http://autobuild.buildroot.net/results/455c3b2357759988d33e72a00223d1e118537c2d |     
         arc |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/eb542520c4a461a9da6a6d8cf1b2cc7ec860a022 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/d113f4b7c9fded8575c2f5dec8d419d671d5fbd7 |     
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/3647f1303437b99c520fa94732ab48b0c36dd531 | ORPH
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2bb78428adf797e4dcec7849712735bbbb832826 | ORPH
        bfin |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/16e515602ba2f38910553c37955b449cf7cd2078 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/57558c418ea5c5011ac22e5236beff4d823c825b |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/1425936f15d6589269ba63f10ec061e1438b0d24 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/5ab6e3701aea8e553c15a9c52630dc1b66201ad1 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/db17379742a2e7be08face88da3d6b4ad3c289da |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/569fc52fa760e65d704d2d4a6feca68e12fffb92 |     
         arm |                xfsprogs-4.14.0 | NOK | http://autobuild.buildroot.net/results/58b59b74f6a138b51206f24481f7268104f0a052 | ORPH
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/5e579c2049f843f6ee5e2b1c025e2881765c52c6 |     
         arc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/0ca97f36702cc3971256f7f00b11cb8afa1526db |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/fe2a8df0c74b3b3e9bc6d997a2b941d27fdc23ea |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/f5804474033d5ff781af2bf195de2b81362f7be2 |     
     powerpc | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/b67c002744172f94347e4af320bf0cfe9f40d266 |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/781c6bc6cd84df3bfdb7131c0792d2a9873c327f |     
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/58061e59a5eca6d08a008ac244f29017f3f976cd |     
      x86_64 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/1d8db97fef32d465eb53bf73e0178175fd1b7ec2 |     
         arm | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/300e06fa10edd82bf9113471e77f1c81c0c4a440 |     
      mipsel | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/049f01f9bae9a251c096c2fd965b07f673a12eac |     


-- 
http://autobuild.buildroot.net
