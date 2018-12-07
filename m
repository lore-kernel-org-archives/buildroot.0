From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Dec 2018 08:00:29 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-12-06
Message-ID: <20181207070029.CF0512073D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-12-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  16 |   2 |   0 |  18 |
   2018.08.x |  16 |   2 |   0 |  18 |
      master | 175 |  57 |   1 | 233 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
       host-libunistring-0.9.7 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/f947e2f5a36fc8faacfd736bb80b440150b1f4b4 |     
     aarch64 |        host-libunistring-0.9.7 | NOK | http://autobuild.buildroot.net/results/8b4ede42cbb04708b277f9f0bf7112f4b6fb9112 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 1 
              wireshark-2.2.17 | 1 


Detail of failures
------------------

         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/698e709636978d5e0a5aba4ac36330ee3e1e3d1b |     
         arc |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/4561e1220443331b72fbe7bb75fe5c929c38b741 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 9 
                     lxc-3.0.3 | 8 
                  linuxptp-2.0 | 7 
             stress-ng-0.09.47 | 6 
     intel-microcode-20180807a | 3 
   libtorrent-rasterbar-1.1.11 | 2 
               qt5webkit-5.9.1 | 2 
                civetweb-v1.11 | 1 
                 dmalloc-5.5.2 | 1 
                   eudev-3.2.7 | 1 
                        glibmm | 1 
                  guile-2.0.14 | 1 
             keepalived-2.0.10 | 1 
               libiscsi-1.18.0 | 1 
                libmpd-11.8.17 | 1 
                  libssh-0.8.4 | 1 
                  monkey-1.6.9 | 1 
                     pcre-8.42 | 1 
               pulseview-0.4.1 | 1 
                qt5base-5.11.2 | 1 
              qt5wayland-5.6.3 | 1 
       shadowsocks-libev-3.2.3 | 1 
                   strace-4.25 | 1 
            sunxi-tools-v1.4.1 | 1 
                   trinity-1.8 | 1 
           uboot-tools-2018.07 | 1 
                    vte-0.48.3 | 1 
                wolfssl-3.15.5 | 1 


Detail of failures
------------------

       sparc |                 civetweb-v1.11 | NOK | http://autobuild.buildroot.net/results/caaf05ea11ba27ff6a3548b14df9aa56df80ed75 |     
     aarch64 |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/daa83893823c56d42cf90b0426f5eef7d34c5881 | ORPH
        i686 |                    eudev-3.2.7 | NOK | http://autobuild.buildroot.net/results/f8c4d965bab0821835b925a0659d3ec786e7ff2c |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/1a20975cabb10197080049f9188469e5926ebc80 |     
         arm |                   guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/9d8ae34e9eb36b9f1745ed892ac7e1d74266489a | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/6ad5ee7f0afa1b5dabcfcc6616d66fa8521f726f |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/da5bc4f62501254925e7e07519a9167597a6283f |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/79c410389a2df54b1ce6e82c0b7e40fbb3b862ed |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/ea24e0ba1525c80c8d15d953b2a68955759bc4f0 |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/56fb83c73232decdfbe50a842ccb5db7a27b816d |     
     aarch64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/cc653d1d3048578658fbef0ac91f0a35ffd3e887 |     
        mips |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/f1939a45f2356e46311f3a3b9cb7a4d07a265687 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/987e89da6e99b81d245048dc09bc70cf70599131 |     
        m68k |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/5e61713a295bf875c14d17bbad4872661e2bfdab |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/2c0388afe46c64fdfd1ee38149d71bd2277cd758 |     
        i586 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/cf269e63fe6617dce7de6640e41a894da9bcacef |     
      x86_64 |      intel-microcode-20180807a | NOK | http://autobuild.buildroot.net/results/c92ba5e5e9593dd48af46ad4960a6b13bd31f239 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/d2f77b9f39c83cd149adcc3f125ac02114b2a5c9 |     
      xtensa |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/bf3108e5c6253613dae97d22946cc898f1b7c02e |     
    mips64el |                 libmpd-11.8.17 | NOK | http://autobuild.buildroot.net/results/bd097b24f2228152bfb71e00890c617d4db58ea4 | ORPH
      x86_64 |                   libssh-0.8.4 | NOK | http://autobuild.buildroot.net/results/7f89ad91766fa5fa718255da90afb8823325e1e5 |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/a23cfc688850ff3a7638c83f2af78a337ad03b5d |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/d94a75258201558b9bc843b57f6ceb53fd6391de |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/07677c99ac5a4e3ebfd5d0e63dbe53b8b6568878 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/b0e6eb052f535370ce767ee9a6209316962cf6b8 |     
     riscv64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9edb8ee08d262f249995735431e876fbe46e2b12 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/f7454fa62844eac9d4442ef23fd642d9beafc465 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a03c305e97d59171d09fbf1cc16afe7a174c6875 |     
         arc |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/2e0e59d622e7e4b26d2f420eeb8f8232c3a94d04 |     
      xtensa |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/e83d49c5d4f6a91588db4fcc440458e64058d210 |     
         sh4 |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/38bea9bf49c3b8da2c27577f3da996d05b0a24e9 |     
       sparc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/3eb389d3c49229c65c921ed0ddd619350a1be833 |     
       sparc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/46a38ce2cde4f24f7507c9eba79a80e5587dc490 |     
     powerpc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/7164b8e0b24db5038733a2c7cbdecd0267fad511 |     
         arc |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/5b822ecf32b2e77f0d950131df15a42068589143 |     
      mipsel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/66cc3133887724d5bdf7fc2d1ef8e598293dbe26 |     
         arm |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/f5e36d9bdf8925e37ec92d5636c9c30cbbc0452a |     
      mipsel |                      lxc-3.0.3 | NOK | http://autobuild.buildroot.net/results/3a42197f036c294a6de812fe4b2d9aa24de25ffb |     
        m68k |                   monkey-1.6.9 | NOK | http://autobuild.buildroot.net/results/6565d7ccba11504d61c1746a609fee1b7beb7482 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/db07103dbb276d5f0d7b842a33fe57a4849131ac | ORPH
     powerpc |                pulseview-0.4.1 | NOK | http://autobuild.buildroot.net/results/b139ce131a2b0f58ae2d1611eeb7a6492adf16e2 |     
    mips64el |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/0a5e1cdae16d0efa6afa5fd01b4888e349b1ac5e |     
         arm |               qt5wayland-5.6.3 | NOK | http://autobuild.buildroot.net/results/0718c8fc115e3ebc6731ee4a685da21dde032c93 |     
      x86_64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/e714a293f0924d348dba744526f6aaf3ceb5c6a3 |     
     aarch64 |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/86e4a72ab62f4f48fa28f79e77b4ec57b27f0675 |     
    mips64el |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/35282b1e963ee40b7b7b2d5786248e0095f7df71 |     
      xtensa |                    strace-4.25 | NOK | http://autobuild.buildroot.net/results/5a0112b7a2c81fa5253c9adc93efe415256cd811 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/20375caec25a3c7ab8e193f472e8bca98ea1b9f6 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/24df76872507d2c8cf996d68536c74e74a0dcf91 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/769a901bd74fda6e22a3af766df23c28bde1bc92 |     
        or1k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/d5a5a45f1d39223a776fd8556b837bf366386cdf |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/7c73473c2e1caef883bc5d9af6add88ed25cbf2a |     
        m68k |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/660f10b8f783f1008663bbbcd7b04bf87fa0b2c0 |     
         arm |             sunxi-tools-v1.4.1 | NOK | http://autobuild.buildroot.net/results/457f6d58d008fd373d39ef56bdf8a0dd8757eba2 | ORPH
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/aaacaae0af78769c4bcbc569ac0db077932c6161 |     
         arm |            uboot-tools-2018.07 | NOK | http://autobuild.buildroot.net/results/e8849ad00542f94efa21efd1888ab53ddd9cae73 |     
     powerpc |                     vte-0.48.3 | NOK | http://autobuild.buildroot.net/results/6dada849a87b68f6f69e3ed760995e86dfa25ad6 | ORPH
  aarch64_be |                 wolfssl-3.15.5 | NOK | http://autobuild.buildroot.net/results/4cb1cec57d150abcf9fc2f2b92bd23310fd02c4a |     


-- 
http://autobuild.buildroot.net
