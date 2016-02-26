From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Feb 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-25
Message-ID: <20160226073017.941B0101A8A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-25
===============================

        success : 192
       failures : 49 
       timeouts : 2  
          TOTAL : 243

Classification of failures by reason
====================================

                  boost-1.60.0 | 4 
                      qt-4.8.7 | 3 
               pax-utils-1.1.4 | 3 
               nfs-utils-1.3.3 | 2 
                 rtptools-1.20 | 2 
                    ruby-2.3.0 | 2 
canfestival-7740ac6fdedc23e... | 2 
              gst1-libav-1.6.3 | 2 
               libcap-ng-0.7.4 | 2 
        ltp-testsuite-20150903 | 2 
                       zsh-5.2 | 2 
                  apitrace-7.0 | 1 
            cantarell-0.0.20.1 | 1 
                  cairo-1.14.4 | 1 
                   fio-fio-2.6 | 1 
              host-gmock-1.7.0 | 1 
                    ustr-1.0.4 | 1 
            gst-ffmpeg-0.10.13 | 1 
       openpgm-release-5-2-122 | 1 
                    glibc-2.21 | 1 
                   tor-0.2.7.6 | 1 
                collectd-5.5.1 | 1 
              procps-ng-3.3.11 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                  psmisc-22.21 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                 libdrm-2.4.66 | 1 
                 opencv-2.4.10 | 1 
                mono-4.2.1.102 | 1 
               polarssl-1.2.19 | 1 
                  trinity-v1.6 | 1 
       host-erlang-rebar-2.5.1 | 1 
make[2]: *** [code/CMakeFil... | 1 
                       unknown | 1 
                 qt5base-5.5.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/1674e6a620e85c1a7ad76883775dffe7390031fb/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/47e1640dadda448dd228efd732e28fcbc01f02e5/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6fef08ebef4153a088c0ab2c93070ad92ec9a884/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/a691c2dab133ecbb61ee571dafd2a753b297ed83/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/35fb65a33fd4102cbee207381e6eaadd8e9224a0/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/39a130a3c10781e6abbef9fbbaa960936a9a67e6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/70b786c59bd7ea41a9e8defc8e0a8d7036180dd6/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/d8601d1ce8cd1ec10216fab1171a5ca708d3fcfd/
    mips64el |             cantarell-0.0.20.1 | NOK | http://autobuild.buildroot.net/results/7d34af4fb76dd553242633a678d5232e8e800f0c/
      x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/8836d3c9da883d20d789f336a8f8a75112ee59b6/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/bbaaf9975f42fe0a8926a164bc5ba2c4a9c93bd5/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/22e0d3fa135d9dc723e5d0d8d5e1665470af3544/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/8f3cc30ab247de2d416d1c78b3805ae531050ea5/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/cfa4655aa4357020dbc8442f7a18538022a64a46/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/2e54e29ac72e3e3a0ab6160cbd6402402d66944b/
      mipsel |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/a755b672744b2c04e062b7775fb21c8de868227a/
        mips | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/bda4c3edc9c760c24b8ed9d720e2566b83daf4ea/
      x86_64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/11ca675b68b58690f37268ff998e35b0bb3c160e/
        sh4a |               host-gmock-1.7.0 | NOK | http://autobuild.buildroot.net/results/a1e0cf2dfceb51d0d6f53830ac62000a8e613fde/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/639c5c4fdd95c2421a261054591dbaf500231f64/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/11d2957592e14d0eda19a659e3df47b25e6631ba/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/12929125758d13fa91a46a9d6b4d37652dd415ce/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/50c59a235f2f9363df8b3b34125d588a54e7d2dc/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/736ade18bd0473a0b7e451974797f99bb29e9010/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/812454f646c07a79d2943c11fbf874e1da9702e0/
       sparc |                 mono-4.2.1.102 | NOK | http://autobuild.buildroot.net/results/189e9eafb95d53eec2a2d2f080492e3d3e1c9eb2/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/87a364a0e324f9b8ccad03f5387fbaa88073b366/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/c88933d9c804cf49e09f5cc5247fe574d8d84694/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/0d9b185afcd28778f01b1c10f4ca884bbdac24d8/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/346c24372155fe79d646300ea1fad2925ec010ca/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/66d98b7d2c3f4779860a15068ea8c9671bd684ca/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/0f19ffa3ac108497c65c5758fbecb1cfb02d016e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/d57b1fa47add20992f75e30d6faed498902aa696/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/d743745d05edbca414529d0cdc2852221379819c/
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/255d67132ead488a788a176b3726eb153ede60cf/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/543d8871163e5876a2da4c422de4fc7c66655245/
      mipsel |                   psmisc-22.21 | NOK | http://autobuild.buildroot.net/results/ed40502e607cab3219fbae01460d3dfe976862a6/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2d0a6bd37f4a6ddc60dc5448b31377b20a1454ff/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/31a8cdbd3db6c078723453ef933b45cbf7a6834b/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/8ab7f17c82ea9cdaf478682babe029f4b306089d/
       sparc |                  qt5base-5.5.1 | NOK | http://autobuild.buildroot.net/results/62da05baf5708a21ae381c0fc1654507e3afb8f2/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/c55ef80a13ce98dbb585bc63474f55f777f25648/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/7103be04bb8dc36957d8c62f3192b953dad8f36f/
     powerpc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/aed85e45f5aae179ff4dbcd437a3c52debb7322c/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/be7019102f4ba18961e86ca0eeccf97afa1d3fff/
     aarch64 |                    tor-0.2.7.6 | NOK | http://autobuild.buildroot.net/results/8b161bdc627219b2e9dc6ad36ce9b746d188567c/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/44d4b22241ba7d375baab4d5d4e5d94303dd3f7a/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/c05ddcb7cd2a304456f68fb6b65956aef1b9c274/
    mips64el |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/2547f393fc4636d30fceec27bf6c35710ce79f65/
    mips64el |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/29f9272726713c0ec0499b31ff8cb39c6839abc5/
     powerpc |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/d2c1160d2b85536e91d5d68741fd1d16683fdf8a/


-- 
http://autobuild.buildroot.net
