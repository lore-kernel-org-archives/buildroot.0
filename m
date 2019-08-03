From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 03 Aug 2019 06:16:19 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-08-02
Message-ID: <20190803061624.83F9F20424@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-08-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |   8 |   1 |   0 |   9 |
   2019.05.x |   6 |   1 |   0 |   7 |
      master |  80 |  60 |   0 | 140 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

             openjdk-jdk-12+33 | 1 


Detail of failures
------------------

      x86_64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/36bd5527ee9f7f3d36a8bffbf9bc8f68974b9b61 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-mtd-2.1.1 | 7 
                  boost-1.70.0 | 6 
     host-imagemagick-7.0.8-53 | 5 
              host-bison-3.4.1 | 4 
                      icu-64-2 | 4 
                    mpv-0.27.2 | 4 
            host-mfgtools-0.02 | 3 
                  cmocka-1.1.5 | 2 
              domoticz-4.10717 | 2 
                  flashrom-1.1 | 2 
       gst1-plugins-bad-1.16.0 | 2 
           host-harfbuzz-2.5.2 | 2 
                 libv4l-1.16.5 | 2 
                     mtd-2.1.1 | 2 
          qt5multimedia-5.12.4 | 2 
                       unknown | 2 
              iputils-20190709 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                   mpd-0.21.11 | 1 
                      pdbg-2.2 | 1 
                 python3-3.7.4 | 1 
              qt5enginio-1.6.3 | 1 
   vdr-plugin-vnsiserver-1.8.0 | 1 


Detail of failures
------------------

     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/d6c73d0ab3bd419053d229e4e95554bbd50811de |     
     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/2c37854736d2c2b4233f33044a1db174352abb90 |     
     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/3683c6367634ce1bc04164e61974e9f95521fdf2 |     
     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/1eab1cd2dc73406980f41f8eabb45a76c5553530 |     
     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/38ac679cf285a5cc63ca6ae6d697199f40c8372a |     
     riscv64 |                   boost-1.70.0 | NOK | http://autobuild.buildroot.net/results/eab872d4539b6434a983282028233f779efe408e |     
     riscv64 |                   cmocka-1.1.5 | NOK | http://autobuild.buildroot.net/results/a3dd4c75f0a7180aa64d918cafdfd1236bebbf10 |     
     riscv64 |                   cmocka-1.1.5 | NOK | http://autobuild.buildroot.net/results/4fa11737121ebd01ff2aad98eb2c70c3a9767ce4 |     
     aarch64 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/cc2827071c7cadd2398328f6adc500af8e69d848 |     
        i586 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/3d7b4289250aec46158bcf7bcd97578a08551994 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/80596079dead15cfdb401b56ddb39d32c7f76ee9 |     
     powerpc |                   flashrom-1.1 | NOK | http://autobuild.buildroot.net/results/bb8578f476f959634b7bd4361c0e13fa1a0ba4a6 |     
     powerpc |        gst1-plugins-bad-1.16.0 | NOK | http://autobuild.buildroot.net/results/b01e9f14c8263cfec7a96370c5db0cbeb536f0b9 |     
         arm |        gst1-plugins-bad-1.16.0 | NOK | http://autobuild.buildroot.net/results/802204e64ff07b80e98c62d88f4f9567c25fc542 |     
     powerpc |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/82ee49439464fe3622633d9682f2a392664df59d | ORPH
     riscv32 |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/b4c0fb05d00a62b145aca04a4d398d8215239f71 | ORPH
         arm |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/488847f0c5df140175dfd068e78efce4790491b9 | ORPH
         arm |               host-bison-3.4.1 | NOK | http://autobuild.buildroot.net/results/8568bcef944096f2c21470d36f02b520989af5eb | ORPH
     riscv64 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/c1e897746701d6b91e9e130643edcb0a3394ea2c | ORPH
         sh4 |            host-harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/c978ebd17cbc89fb188017bbac965751feb443c9 | ORPH
    mips64el |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/8c6863ee8d54930acd84380be737b3c0ef73cb23 | ORPH
         arm |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/6d1235aa0c466091ba8fac17576e553cfc38aae0 | ORPH
         arm |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/cc968d703cd1cc371f8c4613dc798701e1e73274 | ORPH
        i686 |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/7c78a88b5c43002dbfbcb190a9e4ff057504135e | ORPH
     powerpc |      host-imagemagick-7.0.8-53 | NOK | http://autobuild.buildroot.net/results/5f0b85033e800c9eebc46812592966ec6826bb5d | ORPH
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/ad049361c2db227d8f5ef057d82a8ef967ff7d38 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/67b6d59e3a8a5ef4c3f8f4b8fff586e9c9e2e3a4 |     
         arm |             host-mfgtools-0.02 | NOK | http://autobuild.buildroot.net/results/7746a7ded2426d239c7953ce78b768aba411fcc4 |     
         arm |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/5622e7ddb01deac11ae77aaa87463570ec16200a |     
      xtensa |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/aee578ebf14985288dae4946cd859da6ad4c3c4b |     
     riscv64 |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/b62f4e933f98d56c2b37447bbc3a8da78f419917 |     
      mipsel |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/f85d0772c69f62665d0584467b5daef79d85e768 |     
    mips64el |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/e521d3ea6014a82883dba4df908d3b8b6bc02174 |     
microblazeel |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/e3b96704f0b23e82999aa3d6e93233edecbecfe7 |     
    mips64el |                 host-mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/e57697f64222d15c9723897b32cf0a1abdb8592a |     
      xtensa |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/e6c6f826d8280f2bef923b3327d2a9a13ce2f7e1 | ORPH
       nios2 |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/91eaec34708d91f8a05af189243be0b7cabce31b | ORPH
      xtensa |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/066b8fbec7d9aea56b905300942ed371e962a744 | ORPH
       nios2 |                       icu-64-2 | NOK | http://autobuild.buildroot.net/results/97e282dd518e00ffc428338be45e42e908d89d7f | ORPH
         arm |               iputils-20190709 | NOK | http://autobuild.buildroot.net/results/65efac3280c9c1e7823db0b77b021b2b8ac875e3 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/d5e165af3dbe4b26164aaf9e41651d428905fd43 |     
         arc |                libupnpp-0.17.1 | NOK | http://autobuild.buildroot.net/results/61055816f7f03ac506ce6af697929ae1cda754ac |     
      mipsel |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/3d6bc949a78931575d4781497e3e72c5560a2ee7 |     
       sparc |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/9b7d5191035dfafd6cd123d900592dbc7d20d039 |     
         arc |                log4cplus-2.0.4 | NOK | http://autobuild.buildroot.net/results/7cab0cf3fb58d3f10d08437aaa63b7414bf34f22 |     
         arc |                    mpd-0.21.11 | NOK | http://autobuild.buildroot.net/results/1fbd7503625355cde0b4910589d951ab70f86291 |     
     riscv64 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/be6ba7510e83ebac3e7a923c147bd8b6bbbad86a |     
     riscv64 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/fce3c870678524e8575f9ff21e2c43f7aa8eb63d |     
     riscv32 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/0c34aba8e2a9f317d70e5aacaae7132976f21a81 |     
      x86_64 |                     mpv-0.27.2 | NOK | http://autobuild.buildroot.net/results/09fccbfd82b5ce67358c23074da4cd00e80c7511 |     
         arc |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/8d36c9e7a2cb5afcb0ba14d39fbd0e2811653e98 |     
         arm |                      mtd-2.1.1 | NOK | http://autobuild.buildroot.net/results/4a88dc095dbc8f39dc70c864a5cbf2be932de4ba |     
         arm |                       pdbg-2.2 | NOK | http://autobuild.buildroot.net/results/81b1107bdb06250e1a7837506aec0c9762e771c5 |     
     powerpc |                  python3-3.7.4 | NOK | http://autobuild.buildroot.net/results/cb49c539501342e45cbe5ade82e588fcdf51f05b |     
      mipsel |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/f18ffa50afd75fd90af832f4ec5c66d01b9354c1 |     
     riscv64 |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/88e4d3e7590285369131d12da6a1d8c33ba1faa3 |     
       sparc |           qt5multimedia-5.12.4 | NOK | http://autobuild.buildroot.net/results/5c41a6c0c51a72f6b25d408091ad472e9bb3b2a8 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/8dd9b749afcb4170167693e6d3c68d7290a2932c |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7fdf80adc3dbcf9444fe207830b42363c8d4c1bc |     
 powerpc64le |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/d12d76cf5f80d2e0b8ce14a14908d8f477cdb656 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-cryptopp-8.0.0 | 1 


Detail of failures
------------------

         arm |            host-cryptopp-8.0.0 | NOK | http://autobuild.buildroot.net/results/ab24f281c5b0837eb7bd7116bba00c2f88dce293 |     


-- 
http://autobuild.buildroot.net
