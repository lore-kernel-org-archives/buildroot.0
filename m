From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Jul 2018 08:00:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-01
Message-ID: <20180702060035.2287F20A32@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-01
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   1 |   2 |  21 |
   2018.05.x |  25 |   0 |   0 |  25 |
      master | 163 |  38 |   0 | 201 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    gst-ffmpeg | 1 
                host-libsodium | 1 
          libcdaudio-0.99.12p2 | 1 


Detail of failures
------------------

microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/5d1435f88fb69004c988dd44e2d9716e71abe6a0 |     
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/94c14c1c669f5281cb6255027247c213b1e2c6d8 |     
         arm |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/3232ed4c8a36d3ffa3882b49ad7e5e3e38e0163b | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    host-rustc | 6 
                   wampcc-v1.6 | 5 
python-libconfig-b271c3d9da... | 4 
             gnuradio-3.7.13.3 | 3 
linuxptp-303b08cbf55096aba5... | 3 
                 opencv3-3.3.0 | 3 
          host-libsemanage-2.7 | 2 
              wireshark-2.2.15 | 2 
                  zeromq-4.2.5 | 2 
                beecrypt-4.2.1 | 1 
                   dante-1.4.1 | 1 
                     daq-2.0.6 | 1 
                   libnss-3.38 | 1 
       poco-poco-1.8.1-release | 1 
             stress-ng-0.09.32 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/cd46ea773e275c9e92a4004b04d7a61b5a727621 | ORPH
      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4139ae4eb4139fb2062f490562887c91497a2029 |     
microblazeel |                      daq-2.0.6 | NOK | http://autobuild.buildroot.net/results/a9cd861fb155dd0e653557c9bd901bcb0a5267cf |     
        mips |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/05057188ba7095a6fb1c9a87008d6f40eed6e0aa |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/2902d65212a726daf51ce684e8eb42ed8fcf4033 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/2d3063c10bea3d09181ac2754204e176480330c5 |     
         arm |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/818f875c8939eca50bbd854c195bc66037306065 |     
      x86_64 |           host-libsemanage-2.7 | NOK | http://autobuild.buildroot.net/results/10a6e4b6e491ab8f6bbd06a570f81d9a36f0ca1c |     
         arm |                     host-rustc | NOK | http://autobuild.buildroot.net/results/ab16ea8c43fd14348ea1d933f90e116903e2e2a0 |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/525e6a3acf7b9617a2d811f57d8a92d2540ac009 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/e1e3dc81e4dcebbdd702223f3733ecb502c85cfc |     
        mips |                     host-rustc | NOK | http://autobuild.buildroot.net/results/82459b72554cbe1dfab033a859292943f10b5a31 |     
        i686 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/929553980c268a5fa223aa2583d4f472185c6f54 |     
        i686 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/326435deaaf1ccdaaf1dce47f7beb7fbfdd4a2b7 |     
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/e0f9463dfdd51bb06c7575a7a630494f9413bfad |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/548ec8e8987be807eb262250d856fd74e65f987b |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/8b059b21d86748f78d97714329ff217b5bbcbaa9 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/ecaa5a570e5fa94300172729d4fc9eeecb49889e |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/ec1cb01f8341bc2e73126f42b7f2a257beddc038 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/3b9c630c52ba4e84cf72f55cbbcb82c8e131b079 |     
  aarch64_be |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/a5ef9f348255196945b31b667fca6c4504699df6 |     
  aarch64_be |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/d8d17f3cb669585af592afb5e824088ae82ccbcf |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/584d62abb28461026db8492332f5c92d32c6e2d8 |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/ffb21a3c372674231a9355eaf24682c5d9ac21dc |     
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/14ddff9c67e9ddf639c486963873dd95a56f4ccb |     
       sparc | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/dac071e4147e87ab234304999eb7d1723c682020 |     
    mips64el |              stress-ng-0.09.32 | NOK | http://autobuild.buildroot.net/results/64941ac5b7dcd9c100bdc47cdfe73cce5f23c3d8 |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/23803a8db330721e5d083decca9d943bd3620de3 |     
      mipsel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/1f251666f9c00bb77361cc7386e9bc8372d23009 |     
         arm |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/22b34be2c20e597ccb54267ff54e188ab0cd9527 |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/ba5198d1cd623931e094b300d01f4677691e01a6 |     
      xtensa |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/888e0ad4af621d7ed45a182f3629a7963bbd7ddf |     
        i586 |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/121d98b689c16c107922b7e7ad34c9d30b5758dd | ORPH
    mips64el |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/65545fd8d7cee0c66a213f590e65b164fa67c2da | ORPH
      x86_64 |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/41444cb919a376bc716b5f6a08805aff47ab3128 |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/f2cc94b26c31197677db4ff3f0cec942ab157ece |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dbed1faa7710a7575d8ecc08cc8268455a29cd4e |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/aceb1129157e44af6f1bc36a473668fc22cdd12b |     


-- 
http://autobuild.buildroot.net
