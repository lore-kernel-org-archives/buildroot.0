From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 06:00:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-17
Message-ID: <20190618060056.C643F875F4@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  18 |   0 |   1 |  19 |
   2019.05.x |  16 |   0 |   0 |  16 |
      master | 175 |  53 |   1 | 229 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 22
          modem-manager-1.10.0 | 12
                   cups-2.2.10 | 3 
             host-cargo-0.26.0 | 2 
/home/test/autobuild/run/in... | 1 
fs/tar/tar.mk:32: /home/mar... | 1 
                      gzip-1.9 | 1 
               host-efl-1.22.2 | 1 
             iputils-s20190515 | 1 
          libcdaudio-0.99.12p2 | 1 
                 libidn2-2.1.0 | 1 
          libtorrent-rasterbar | 1 
libuio-ca28ff0f69d89a789a47... | 1 
                 python3-3.7.3 | 1 
                qt5base-5.12.2 | 1 
              qt5enginio-1.6.3 | 1 
            qt5location-5.12.2 | 1 
         qt5xmlpatterns-5.12.2 | 1 
           udpxy-1.0.23-9-prod | 1 


Detail of failures
------------------

      xtensa | /home/test/autobuild/run/in... | NOK | http://autobuild.buildroot.net/results/583ca4a407295cf0769c0122868c9d00eb29d3c1 |     
    mips64el |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/2a7032a2c8dc684ee0996e57497356bf7688c572 |     
     aarch64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/58e20c3ab927b89228976affd061e5f8fe102d41 |     
        or1k |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/bc4d3113751c45bcedaad752b547712792d506bf |     
     riscv32 | fs/tar/tar.mk:32: /home/mar... | NOK | http://autobuild.buildroot.net/results/89705a21989ffaedd1b2b8bb77a142d1783b1092 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/bd6bea0c1237c2fb8dc80ec6720ad7f1ef188486 | ORPH
         arc |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/0943158d6e7ec0ebe6d6354dea312fa594155c33 |     
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/39185f274a8465726de109d14798d6d9488f2d77 |     
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b323760d20a218d8b55d60f985ae24d9626c5cf4 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/331a3b42f44888075b42797402c96f92fade5b58 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/a804955a94fdf2016521e438999ac41de7fbbcf4 | ORPH
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/65f7c9a5e508285c4f670e615bc9ad841a449a9a |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/253ab5f8b33fb9fb706794fa6038245db3e11790 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ddcad8d82b4af9d61eede8af669af75ea0ce860d |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4b7bc3c817379fb1fff6a2e27483cd367f5e6b12 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/4625974f257e327421aaee33de394fd000ea8056 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e8cc052999fe9b9959a3e1bc9af679fce4744d1c |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/597a9851a0bc385306a1ccf4fb7f8d761b2e8e22 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d456d428e37a8a2e12f57655fc79313cd713e359 |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/bf0192658f6065d320b6a411173be4a302914526 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a848d2b152864467963b32837a3a701b06995743 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/42358f391373d7a482eb60dbc264ed2408f43036 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a527c5fff3a7456cfbefb46d8f0dcff2401c67a2 |     
        m68k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0e838135545b329cdbb768b0914d8769767b55e6 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/04a9198ca12106d5ebc3271e4b4f6a4b6fd4b68b |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/3dc117eadead282b068d24dd0bb35521bf2fb6c4 |     
        i586 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b13144a0693a44fce32adea14ca9711160a786dd |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/44ccd9bb3c43cbc800c780513a990b397f61d55f |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6800c6a71a254af261a1ce0d6932403f798290e5 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a6d0f13e83414717a0818bfb859dbdd99859c713 |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/ba67524d2c76f1870e669d5f8579a11cf9d7e124 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/6d1397d8f1bdc2c43502350f004c28e0213428ba |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9ba7ce8e1a16f869df5bf8d8d42bc673f0515a5a |     
      x86_64 |                  libidn2-2.1.0 | NOK | http://autobuild.buildroot.net/results/7cd60e8eab565f1f2de0700c352f06c850eb100a |     
microblazeel |           libtorrent-rasterbar | TIM | http://autobuild.buildroot.net/results/410e75676abc6bbabe9029ecda969e3d909f3e18 |     
     nds32le | libuio-ca28ff0f69d89a789a47... | NOK | http://autobuild.buildroot.net/results/ed5ed805c3582076a906b57019d9a13d01b794b2 |     
 powerpc64le |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/9ce577144078936af0a3afa5982f3efe98ac29aa |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/09293dc9ba1e2173fbee9cd32a7c85621a34bda0 |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/2743b260f45ea31987fdb0e3626b7f42be42e78d |     
        i586 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/ff337c5b1a3c2f4cc4ee147feb44985bfeb3590d |     
        mips |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/59244078afbe9890a09dc1ea2b5c44b2a5dfd925 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/fbe602bcaa731d15dc9dde3d5eb70c6b20378fe5 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/b5e54a1e58ec5201623b120d043839bb48a2d2a5 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/7b570151bc0d2a1fa18c5febcbb8526cdea00e51 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/c449817e751ceb26db28106b5fb444e0129b76e9 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/7129caa30735a1dc0a1c0c7b878b268e6c6436a4 |     
       nios2 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e83c104b25c1feee55983c5101aad3251bc6f058 |     
      xtensa |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/4a372ac67839a4f997825a142079951645a29898 |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/eae6063b29cb7d3b09a4032cefc1f66f9203111a |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/5c406f4bd157d394ef88e33d3ee63cfe79e0eff6 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/73cc66dcb10e58a006fd08496c5159cf50b62262 |     
microblazeel |             qt5location-5.12.2 | NOK | http://autobuild.buildroot.net/results/bef146f2df1be4f020f12845e809f48c9348d41d |     
  aarch64_be |          qt5xmlpatterns-5.12.2 | NOK | http://autobuild.buildroot.net/results/1606496d2d7b3edb00dd4ed5e8bb0ecc8b45a048 |     
         arm |            udpxy-1.0.23-9-prod | NOK | http://autobuild.buildroot.net/results/28e0324857cf7e8de88ccc04968b3de1bb45ded6 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 


Detail of failures
------------------

microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0bd5e9af644c6e60b00a516b702cd5daab682603 |     


-- 
http://autobuild.buildroot.net
