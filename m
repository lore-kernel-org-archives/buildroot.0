From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Jul 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-28
Message-ID: <20180729060019.7C1F0207BD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-28
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   1 |   0 |  20 |
   2018.05.x |  31 |   3 |   0 |  34 |
      master | 166 |  63 |   0 | 229 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.7.6 | 1 


Detail of failures
------------------

    mips64el |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/0534adf441b775adf6810c8860e1773892ef0708 |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

           python-numpy-1.13.3 | 1 
                  samba4-4.8.1 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/b2fc18d6ba6245e2b91eacfab195a9b4d81b80fe |     
      mipsel |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/63c882a0ac501d205ed4d6ef55bfe1e6aa320f53 |     
     powerpc |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/0f3180051e046d765ad1d46b77fec63a3069c47c | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-dtc-1.4.7 | 14
                  boost-1.67.0 | 11
             gnuradio-3.7.13.3 | 6 
                  samba4-4.8.3 | 5 
linuxptp-303b08cbf55096aba5... | 4 
              libostree-2018.7 | 3 
               aircrack-ng-1.3 | 2 
              argparse-0.5.0-1 | 2 
                 copas-2.0.2-1 | 2 
                     dtc-1.4.7 | 2 
                libmpeg2-0.5.1 | 2 
                    ncmpc-0.30 | 2 
                    brltty-5.5 | 1 
                busybox-1.29.1 | 1 
                cgilua-5.2.1-1 | 1 
             coxpcall-1.16.0-1 | 1 
                   libnss-3.38 | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/4726a58e6fd567a74746ea0fdb5d76b5dcecb1d5 |     
         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/bf57257940a4365a55567173c04b65aca19cdfdd |     
      x86_64 |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/0a4baf55bd5f192ec9243f6fd9a3ee3bb8b332ff |     
        i686 |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/6f7067b310aaf3a44598e2fad04028c89f43c579 |     
      xtensa |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/37fe289124ec7ae0bccebd5d096da03395dbfdf2 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8e920456dea52abe86e595678d4732a907bae512 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9db0c0e1e90734c16dc4aa21f8127f35b8a32b5d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/0fe491728a5dfc59d330333dcbba3c9ef20c3d4f |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/941fd039f6823c7323767ba589e0f9231b48f26a |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/e3e1d7a6b2a8106bc5d042618278d03dc902f1e3 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/2abb60e444ac42b56937d193d0e58c3dce547332 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/367bb59b6492fc8d54e52a7cc4fed29f583b858e |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/cd1226c38f1c4fcbda9428ddd66cdf13ee2c7329 |     
     aarch64 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/4068929db9d70e02e6a40f747f23551235ec7d26 |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/1ad24ecead5338e6fdb979b13c2cfe8652f93c8e |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e7a44c66244f0031d543fde26644117456b192f6 |     
         arm |                 busybox-1.29.1 | NOK | http://autobuild.buildroot.net/results/31e0fb6b1fc35e3d16a5a3d44e8c9063d29b05f0 |     
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/255b8b2cef2595d42e5f6a1c46039a8330c0cd8d | ORPH
        i686 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/1bedeeae7d526033116e35118bcf7a5bc628e39c | ORPH
     powerpc |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/f9ca99b07500f663ac9be9a447a0a50083a3455e | ORPH
      x86_64 |              coxpcall-1.16.0-1 | NOK | http://autobuild.buildroot.net/results/705ac32053c0ee809076e647641638d8c1e2268d | ORPH
    mips64el |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0c67a484651f4c104f0d7dcf35fd918f2356355a |     
    mips64el |                      dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/0aefc3aa03a93b1fdf76f2d8946b6f423405382f |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/9691aef49c51698f83baf5bac1f61ed8dd762165 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/fd1a48483337140951683b284067f59fcb480099 |     
   powerpc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0bd5d1f8b157da40fd6b0d0a6ee8f60466390c94 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/5550a1ac184c40f372bafe7a9aabd60b2b9833cc |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/43e9d6475454ad6b34de0c3687b24fd9f4a6d966 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/adc1dd6daae4bf837d41a828f121b63bec181767 |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/a2a2c2f2275018b465da8582b463d5097d330ad9 |     
      x86_64 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/1ad41fd4890af0c97ee4ff2994ea5431b8953ef8 |     
       nios2 |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/a2bb5868eb71fa8fd19d23c4914f97437a7f2f64 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/f7c97bf623d7375d7d2fe39d1ad019b247b88c26 |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5d4ffc26e9129410b9cd472b143121a4a08472ab |     
         arc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/a3e7d5773c477079d2efa9e0a44f0d147de2b875 |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/90dd695506ea33cd9809bd4e7051bfb0a7f21d0b |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/dfbf8e95dd6da976c4d4ded0127f30ff182bcc97 |     
        or1k |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/4acdf441247b1f1c955362a97825d35ce04bb5bd |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/5292a5d1723cd544a24fda29aec172b5d45c1047 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/4c3f8bf9b29ebe3d930abcc88ca20bcf39c78a7c |     
         arm |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/4308bb39bd25b8a474fbc7bba08315aa1f301919 |     
     powerpc |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/05650fe2e7d69b04c8144553c3c125f4134d0330 |     
    mips64el |                 host-dtc-1.4.7 | NOK | http://autobuild.buildroot.net/results/755ce83eb52017ece723ca79a17668a188bd77a5 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/dc1ceec5761f7eee6160a3ce1b1552df4d21229f | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/8314a5948f3aca974f6d226f1d410af5af7cc63d | ORPH
  aarch64_be |                    libnss-3.38 | NOK | http://autobuild.buildroot.net/results/419957e3594d493ff239bc46b59a2dffdcbfa11b |     
     powerpc |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/c29b3fafb64e47b3c874d00e886632c0808e7a21 |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/37b3d48b6d32da205c63f5d69a01f6e9ab428701 |     
    mips64el |               libostree-2018.7 | NOK | http://autobuild.buildroot.net/results/01649ea068bd8243f9ce48744d4f08f3ada98676 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/6b9615d8723277e045f6c8254adeaa741b542279 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/de5562051d7acbdcee672e3f698263c8af463a8e |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/7c4613482af3de45077743a1e4d5a09a320a8480 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/0e05f0406974d4d77abc72633b49ae6bde0d3d16 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/418fe977ab1f5b80104ad351e9a92b0ea2173f8e |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b9a409596d763b0595ea74a66d4eb59b1a94e3ad |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/8a437c9928f43f40126fd175ebd39f60d894611a |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/bd323244d8f85628545c6e3d9718f5a8f52319be |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/97065139aa26f4eb956bd5935475328fd1d68736 | ORPH
         sh4 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/46cdf0499be35eb7b37ec30883cc27c90ebfc0eb |     
microblazeel |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/55dca0b5834da5750e529265522bc103177ce0f6 |     
   powerpc64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/47eb6fa68c8c963046f89a90a66cb2e53620f0f8 |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/be853b8d4867a155ced06214bfccfd0fee9ba0e7 |     
         sh4 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/4f606aa04cc39ee361463bd11635a6661a895b12 |     


-- 
http://autobuild.buildroot.net
