From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  2 Jan 2018 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-01
Message-ID: <20180102070036.BFCAB203A1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-01
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 181 |  21 |   4 | 206 |
   2017.11.x |  17 |   1 |   0 |  18 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libostree-2017.15 | 4 
              host-erlang-20.0 | 3 
                  ffmpeg-3.4.1 | 2 
                     gpsd-3.16 | 2 
               xavante-2.4.0-1 | 2 
                    brltty-5.5 | 1 
                  cc-tool-0.26 | 1 
host-squashfs-3de1687d7432e... | 1 
                 i2c-tools-4.0 | 1 
                      icu-60.1 | 1 
                   jamvm-2.0.0 | 1 
                 mesa3d-17.3.1 | 1 
                   pcre2-10.30 | 1 
             perl-gdgraph-1.54 | 1 
                 rings-1.3.0-1 | 1 
              wireshark-2.2.11 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/47ae9a76fcc1bf0fd08b0ce07e19b200efc49a8b |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2932c5acc1b6fafa9859880f3ee1ef239e161b82 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/a589d8ce3576f8bceb8fe93c265c635ac875e694 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/aebbb34492e7b6da55a9f5964108536c2dce3628 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/7329e44541318e952063de88d353031e30840e78 | ORPH
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/87735410903bc0de93344fa2c1e8c933361159fa | ORPH
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/9b410d9bfd2658d40004bd6f7cb3b1cdf359a0db |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/b126470a6ff2eedc5f327c5cf9784d68e3927598 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/325503f87a0c994d4f3bea021d8b58f3b95a9614 |     
         arm | host-squashfs-3de1687d7432e... | TIM | http://autobuild.buildroot.net/results/6159864788a60807da0c9344af2f9d447af7b326 |     
         arm |                  i2c-tools-4.0 | NOK | http://autobuild.buildroot.net/results/a1bf99467ad3661dcb3ede491a70a57f1f1e01b1 |     
        bfin |                       icu-60.1 | NOK | http://autobuild.buildroot.net/results/b89921aa539bc25b2517f6ab3f1b14b7eaca8863 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/95b6ec4054ca75779dab74b88e740d9a14d13589 | ORPH
     sparc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/4539b3dcd4b2e7850a8d2481f16e10236dac8e33 |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/cc7a0fbd23109ac94300c1dbfaca75928a70d655 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e1f895e40bd0f55d621a0d74cdd7c09cdc6f3e05 |     
   powerpc64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c40c45ec0233b35e7a0eea5dede8d2bd1640a753 |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/cd9142ec36790bc39f0a8285524b2c928a577c54 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/2f2ce3d3e3159f180cb0347b78c376046674cf9f | ORPH
         arm |              perl-gdgraph-1.54 | TIM | http://autobuild.buildroot.net/results/e5a2f28812dd97c7d02eb5229701584a23a258ed |     
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/75435488ccc0c4ff20c925ca93c6f40ae20c4d5c | ORPH
         arc |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/65fa3e24368ab7bb6a76f84b08065f25abfc6cc4 | ORPH
         arm |                xavante-2.4.0-1 | TIM | http://autobuild.buildroot.net/results/a654752c609fdd8113f3db456b202fb1d1bfdf8e |     
      xtensa |                xavante-2.4.0-1 | TIM | http://autobuild.buildroot.net/results/5bb8c8fe3cb1ec8d8c8b26d567d6445b48b0e99e |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/558937491574951553c16e668460b7939eb59df7 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-17.2.4 | 1 


Detail of failures
------------------

     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/d7ea245f73cb296217da3e4c0af198bdf995bec5 |     


-- 
http://autobuild.buildroot.net
