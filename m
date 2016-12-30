From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Dec 2016 08:29:47 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-29
Message-ID: <20161230072947.6975E20764@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-29
================================

      successes : 159
       failures : 68 
       timeouts : 0  
          TOTAL : 227

Classification of failures by reason
====================================

                collectd-5.7.0 | 18
               libglib2-2.50.2 | 17
                 gnutls-3.4.17 | 6 
               sdl2_ttf-2.0.14 | 5 
             host-nodejs-6.9.2 | 3 
                 jack2-v1.9.10 | 2 
                   open2300-12 | 2 
               wireshark-2.2.3 | 2 
             berkeleydb-5.3.28 | 1 
                espeak-1.48.04 | 1 
                    git-2.11.0 | 1 
           host-cryptopp-5.6.5 | 1 
                  lcdapi-v0.10 | 1 
                   lite-0.8.10 | 1 
                  ltris-1.0.19 | 1 
                  mpd-mpc-0.28 | 1 
                    mpv-0.22.0 | 1 
                    qemu-2.7.0 | 1 
               qt5webkit-5.6.2 | 1 
              sdl_mixer-1.2.12 | 1 
               tcpreplay-4.1.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/90a180e39567b5f0e7a539f8192c7b6241a30c0f
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b594c2eeba5ddb820ef16e206dfca8515cdd0ed8
         sh4 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a08e9cf61352e233e2bedade218aa711aee41fb7
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9694e03b3f5219e9be1fe7f3d929e4c91d527c05
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8df2c253f64a9d4840eb2e445c1a3fa9a17fd2c5
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3d816b7493a97873db0a40a609ffb30a9fe00e6d
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9e997180fd731815955f4af304ca275808bda544
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f5bd5fb123fce6ad935ea9477b525def5ec7fdb0
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/71796243d79f235c3707c9e151df6b67e1886a12
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/577fc0eb54110d57643a0fa13cc9091d33d11eb8
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/379984cdfe51480551263af060851769d8ca46fa
 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ecf2511a05000bb57844307e7478363126aea430
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f0ee7191049e383c08d3af217e8c0be790b0ade9
      xtensa |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7aadbd0eecdf73c680507481b2a77b5a6b20ac63
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/06a788fae3169104ebf7ca9b8027924fc95fbcec
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e7e04bf0e3290e91e422940d17856cdf0c7840c3
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/081af66984800ed3f0b05ab62b4b605925c51ebe
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bccc79fba219bdfff9540c02ec165be0a11fe5af
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bdd48527a066c219ae183f0f4737580ee77a3607
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/47461dece9b7a2597756ba7d2b0e82d308de4189
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/59cad754e3d21c39ed061c3835d655f0d74b7b18
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/0f9a144b129bb2e1f45fde3851e4f873a7f68305
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/b7913648e6a8add7e9532c54e69a01c1618d7211
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/59f20cca07d40ad237dfdea031c0bf68a826a265
     powerpc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/3be9f3f23751ed6ff34e63d89b4884c2ee5a864f
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/915cf38cde2dca626c13e721a51c81f9c072fdda
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/55daab7059409af782e1c09a597127d7d10cf321
         arm |            host-cryptopp-5.6.5 | NOK | http://autobuild.buildroot.net/results/ae761f447cd53f16ba3fe1113cb5b3581df5d473
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/19cbc41aff1903fcf3d64bede9eb675b7874eae0
        i586 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/083cbe1792737002aa5911a1238d54823cf5f81b
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/a98e2c95fde72ee258ba4d02408610ef46f20b59
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b4d110c3fe41d045b8d72939551f8a2b8100d445
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/36f3b2f0932bb458754ff52a1b3c66b3b9490971
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/9086b3ed90010b81b9f0a906680de5bf0c3ad8d0
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d1fb479a29e9f4bce48436d29208597c5d066744
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/2f87f659633d3e907e3248482d0f4243bd540b70
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/090659bd4611f90f5ce14e9137c39864dd032755
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/d2d0ec534cb3e7797746a2b3298f771e428e723f
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/38b25a13d70caf4406f5d9ffa37467cd0d4b7ad3
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/02ec0d76c511ad78b4ddf142db3b50eff0ea350b
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/0b3da1c005d2dcd71352d73cb1f3de2d33e8828a
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6771ac8ac9ebc42b1f4f798e502246444d88810f
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1e670d477c9f1fd82aa00b8acaf56993dc9621ed
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/e559932d49d60b878e56988393f6e3fd8e993319
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/1a7fdfe69050001ef589f138d5ceb7556106f815
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/0e5cc20021fa022e8542f372eb5fc98135d088e3
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/47d210d99b09443cc1e0e5fbfe57ec41c22576a2
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6299d48ef04f256606dd86c1567e04ebc5155658
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/c79cfa5a358d0a413b18a9d4c19f48c2a040c982
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/719f5cee863ab2db98f405280bce8b9223e44f1c
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/94df817fc9b1e9fd2d0b7801ad43ae5258e6d461
         arc |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/e1a9f078408c99cd5c56318f12ee55ad31ae1ec0
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/83495a84fb2a7850aa9194f414b06baadb1bab20
     powerpc |                   mpd-mpc-0.28 | NOK | http://autobuild.buildroot.net/results/caccd72f038ba914d5adcd3ada0549a37fb8fa49
 powerpc64le |                     mpv-0.22.0 | NOK | http://autobuild.buildroot.net/results/81d59c237f44ba83ab1cfba785e3748bb9e0b391
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/bb73189b9d0850c9c4ef89c7efab2c1a261700a7
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/919ab62cedc25fc7c60864d99c208628edfbe472
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/b889cdfc570313e5941cdb46acdfab109d024137
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/ac94f8be0a40866a2673ae9398e00ffa06c7aef3
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3cb85ed55e4ef11153cecd5c40c12e218c2dbdb7
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/73e9e7444504e6627eaa746991de65fc699ed0b7
   powerpc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/721f46c1a1e3df7f973797d2dffccec620b47c7d
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a40136fbb1f888b6a72f81c5a71a905ec2ae8758
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/02ee0f315581315f49a15f1b51c29e15633e811f
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/f10eb26807796fbc2fc448bc07c4615f771355ac
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/123febc8d71a4acd62ccdb8bbbb7e32c6ee49b00
         arm |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/cd883b40503a6f4d3035e09a383db2d5a21162ad
         arm |                wireshark-2.2.3 | NOK | http://autobuild.buildroot.net/results/1ae34debe7e95eab33a895ecdf04c0ddf96cf4ab

-- 
http://autobuild.buildroot.net
