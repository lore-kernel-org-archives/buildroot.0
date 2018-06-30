From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 08:00:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-29
Message-ID: <20180630060034.AFC6220A33@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   0 |  21 |
   2018.05.x |  16 |   1 |   0 |  17 |
      master | 141 |  44 |   0 | 185 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 1 
                       unknown | 1 


Detail of failures
------------------

    mips64el |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/eeec2ed80e147c172ec2d50958b12cfa38b2cc8d | ORPH
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ded4d07fbf59ee2061be6feaf15593833992be1f |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 1 


Detail of failures
------------------

      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/7082ef48e33eed8d5e6bcc72827bd9bd98c36fd7 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-aespipe-2.4d | 8 
             gnuradio-3.7.13.3 | 6 
                   wampcc-v1.6 | 4 
                  boost-1.67.0 | 3 
               mono-5.12.0.226 | 3 
python-libconfig-b271c3d9da... | 3 
               host-llvm-6.0.0 | 2 
                beecrypt-4.2.1 | 1 
                   dante-1.4.1 | 1 
                    host-rustc | 1 
               json-glib-1.4.2 | 1 
          libcdaudio-0.99.12p2 | 1 
                 libidn2-2.0.4 | 1 
                libmpeg2-0.5.1 | 1 
              libostree-2018.6 | 1 
              mjpegtools-2.1.0 | 1 
                mongodb-r3.3.4 | 1 
                 omniorb-4.2.2 | 1 
                 opencv3-3.3.0 | 1 
                      qt-4.8.7 | 1 
          qt5charts-legal-info | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/444439abeec7b057a9b9fb473ade010bb946ec6c | ORPH
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ffe1bb132c112748d3ed7cefe898e06916f09f9f |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fd9037fae3e728d2be147380e5274a6da6948ac3 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/632bbfc8c510ebe7868c3d9b036ec54b1fbca269 |     
         arc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/2fc3beb01abe299fbb2db84d42dd81e66ee89007 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/6a92c5428c463e514eeb38aa9ae6306fef4de343 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/279116b3e98c557af6dd63c13ae2a5f150756a9d |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/867c91286a4464cdfabb5fb9cc1c829149e8cfc3 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5293476f80592a53864e48f57d160a931f837468 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/cd7a3f79fe3d0e566f06c170d09ff7fb1180a4ae |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/98fbbda9a5a6ecf729d8a5c38560deafc2f2d321 |     
        or1k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/33d22f4d96fb439be8551355290896ef6d3649df | ORPH
        m68k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/6aa9031962603354086b49bc49add92fde496ec2 | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/76d73f767d3aab3c97d61188f5666899d72ed82d | ORPH
         arm |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/db50f4415d18441f94b641ef6dc5a3672678b8b9 | ORPH
      x86_64 |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/740ff7f43460abeed568dd4afc1592e18215d29d | ORPH
        mips |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/109be51538871cc8eed74d4f74c761babb36ff4c | ORPH
        m68k |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/2c80d4010ea09090e1419ae4eed2bc52b64b274e | ORPH
     powerpc |              host-aespipe-2.4d | NOK | http://autobuild.buildroot.net/results/29dd4e930db0044000a78d5fce61613e4c9aca61 | ORPH
         arm |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/84222a111d7a4cecb14f9fb280ff5763d61ed592 |     
      x86_64 |                host-llvm-6.0.0 | NOK | http://autobuild.buildroot.net/results/d9265c7a1f9d6568d0a187dc52a08168e1954c91 |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/b01f54b20483cf70caae02a5dc6ac9ffc120bf09 |     
         sh4 |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/a7a6f20256f86c88c9c6a21d8c9381c755fa7c02 |     
microblazeel |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/e3b295b4b9ee962ce703c442d1cca29e3023c35a | ORPH
     powerpc |                  libidn2-2.0.4 | NOK | http://autobuild.buildroot.net/results/26ab9a8d4f7f9cada3078ff70db7c214a7de9f9b |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/56d9e6dd6cbb325135ee6405b423389202f0c5e1 | ORPH
     aarch64 |               libostree-2018.6 | NOK | http://autobuild.buildroot.net/results/1618d02f511bda6d6fa9ce50d7b76c9b323d7c6b |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/c773c53a56038474f4385dcda2c40ef483a9403a |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/e62ec36b0fe8652bd3d0c87910c71e10cc443d7a |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/1d087cfb72badef7339c7dd12433e0f48e2b5e3b |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/52bc81b20d867d6cc8e089abbe19ff678767ae2a |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/95809831b46656cb23fe596fa86d1a73f34d3ab2 |     
       sparc |                  omniorb-4.2.2 | NOK | http://autobuild.buildroot.net/results/f52e628aec99b7a8c1bd2a18e4aea4d20b2422e6 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/69031a4c68ee882e536b4a2f16f0422213df2a36 |     
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/677e9e3de52c7126b48e833f35c5af003672b8c2 |     
         sh4 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/7667cdc53dd9466c93ac59661272cc5c504616c4 |     
   powerpc64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/a215843916158a2b7791f0904a918d94b23541c1 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7636215b2bf276bde4243fc55a2c34417a2eecbb | ORPH
       nios2 |           qt5charts-legal-info | NOK | http://autobuild.buildroot.net/results/c95d34129902a0511b8d64c9d50f1ffa293b33fd |     
     powerpc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/3128c9442bd3fe2eef00cffc19edb6cba7acd131 |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/437a8991cf039467ace68755ac351dbceee51426 |     
         sh4 |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/7eeee7488e563ed914a9d5bbe79cc7da78b676ff |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/25b10a142490f07f47a5f4728dbce1900a9fbb71 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/107469b213472d638dddf27d4a41e939ef1808e8 |     


-- 
http://autobuild.buildroot.net
