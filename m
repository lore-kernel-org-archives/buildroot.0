From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Jun 2019 06:01:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-26
Message-ID: <20190627060116.4A5242041D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  16 |   0 |   0 |  16 |
   2019.05.x |  13 |   1 |   0 |  14 |
      master | 156 |  51 |   0 | 207 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 1 


Detail of failures
------------------

      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/dd2065525fab0bbd27a964463a48be08e480b6a4 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.4 | 16
                       unknown | 6 
              iputils-20190515 | 4 
                 python3-3.7.3 | 4 
rtmpdump-c5f04a58fc2aeea629... | 3 
               libcap-ng-0.7.9 | 2 
              libsodium-1.0.17 | 2 
                    proj-5.0.1 | 2 
                qt5base-5.12.2 | 2 
             xlib_libX11-1.6.8 | 2 
                harfbuzz-2.5.2 | 1 
                 hiawatha-10.9 | 1 
               host-efl-1.22.2 | 1 
           host-nodejs-10.15.3 | 1 
       python-matplotlib-3.0.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 
               wireshark-3.0.2 | 1 
         xfont_encodings-1.0.5 | 1 


Detail of failures
------------------

        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/8ebfe683c13bd6f7f5c23e3eeddc048191a4532b | ORPH
microblazeel |                  hiawatha-10.9 | NOK | http://autobuild.buildroot.net/results/e033f131a773195c8df5bb4693a991dcd829e3cd |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/8e9ed4ae90a48ef4150d872cd9648581b75895df |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/633fde05eaf7d3dda2ee2a024b3e75d9a1f929d8 |     
        or1k |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/027cc460b5297f32ea32aba44120e51281594e80 |     
        mips |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/0f32d0b2da8284f7722f098d9354cb787a8bbf26 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/4acc514553e19bae0c89b6480202179b26fcab46 |     
    mips64el |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/53ebbea791ecbaaacadc75385cad26e3d001a514 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/8c9ba941b405a3d5bf6c64c1d9693f8ecc1826f6 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/c6d11b28b4689bc84bcb8fb7bb881f4edb340a21 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/288b3b5cd2dea7bf5f044a42e851112dce5d32d7 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b04e15a03bbe010a2c636e8c6866ac41c2659140 |     
        i586 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/4ffe03f7244bccad7553289c8e4bf35ff03953c3 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/77172b53951b1d44a3dd182b5acd0203f98068e6 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/180ef1324e1d62cd11c7c6b372854c2ab3d28ad1 |     
      mipsel |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/f3d2cded2fe1132452887941f7ccc6e70650feb8 |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/64d1c5a168c317fa032dfe7270b1155909607357 |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/87caeb993af3b876b94f6b566076368c59e10c20 |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/2ee8bcd5fa90d4527738cc9b80d913ef4a1cf3af |     
      xtensa |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/ee40b2236eae1407543d7bc015eb72daacfad17c |     
    mips64el |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/316d5de53e4bdf7a4a2126b6a12e842a26232779 |     
         arm |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/28c5473fe74e901826d63c6f6825ae9e89c27eb5 |     
     powerpc |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/a302ed5003b8752777c71fe1a0add92a106e0c28 |     
        i586 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/0ad78edefc6592eb2b28a7c1209b70cb6a7408fe |     
         sh4 |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/b44ad1c3b415f0b117d9c6a128fd06c5c131ed2f |     
        m68k |                libglib2-2.60.4 | NOK | http://autobuild.buildroot.net/results/10ea24821dfdde0e2f2c15de0c13bdb7d7501f98 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/d3f516c5880fb78abd7db50858a3b894bec14f13 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/da721d4169fb82bdd767f9821dd04695f1e76b56 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/84990cae2852b6be01bdd0837207d0efbf7358a3 |     
microblazeel |                     proj-5.0.1 | NOK | http://autobuild.buildroot.net/results/dfddff308edd79610f903bf8dbeaee0ad9a016fe |     
         arm |        python-matplotlib-3.0.3 | NOK | http://autobuild.buildroot.net/results/a23978c240912e547816192418aad79360fc4aab |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/ad69fb81694b1a1ec436074f07d908d8654a3e77 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/3411038bd509f2ddf1ea135a48a5af9838f165c8 |     
     powerpc |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/7df7593e208d0c8a0531743f896099e0e01056fc |     
      x86_64 |                  python3-3.7.3 | NOK | http://autobuild.buildroot.net/results/69b37d32b9521ba5b5a9d5bdf4ac2b5a5876a77c |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/b7314e6a0e18b213b453c11a71306f556be99201 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/1f10c478104fcf618b50871305e4d6ba4c90e3ff |     
       nios2 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/9be754f3a81e9cad00354b8b8a2e7097a153d38d |     
         arm | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/5a17699533a2e9540f4db0b7e019391c38279443 |     
      x86_64 | rtmpdump-c5f04a58fc2aeea629... | NOK | http://autobuild.buildroot.net/results/e74bac7004bdae6b23b7e6c313d61d5d3b8680fa |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/13b71b239fd55647d327e002e89a4d15b80d2051 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bc10b822dc6e830c38f93a25a50bde14625739af |     
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/27d42ee42cddd03cfd167459568951cb066b4606 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/0bdf82baf115f229867ea17ef6d0530d25ababe0 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/a5c3f6b41a06a53713d099672407ea3cfafac652 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/95e9fcac8053067b3550c96ce80135ff2fd8541c |     
       nios2 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/ed614c6f349a88a9d01596f8f2875e4c79dbfab2 |     
    mips64el |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/ba498e04d40f818b93c837c297211d8a04a53ebf | ORPH
 powerpc64le |          xfont_encodings-1.0.5 | NOK | http://autobuild.buildroot.net/results/87dbca1262a935e9344832722d75fd2fda6a4e5a |     
         arm |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/1f5ab6713018a16f70b4e040c92374c15bd55c81 |     
      x86_64 |              xlib_libX11-1.6.8 | NOK | http://autobuild.buildroot.net/results/404cc6106d4d053ce8757ac3adf8e72900112e02 |     


-- 
http://autobuild.buildroot.net
