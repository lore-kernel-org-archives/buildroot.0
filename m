From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 08:28:50 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-19
Message-ID: <20170220072850.3A90320757@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-19
================================

      successes : 195
       failures : 35 
       timeouts : 1  
          TOTAL : 231

Classification of failures by reason
====================================

                 wavpack-5.1.0 | 5 
czmq-5205ec201e97c3a652c17e... | 4 
                 sngrep-v1.4.2 | 3 
               bctoolbox-0.4.0 | 2 
             berkeleydb-5.3.28 | 2 
            lttng-libust-2.9.0 | 2 
                    mpv-0.23.0 | 2 
                 qt5base-5.8.0 | 2 
dawgdic-16ac537ba9883ff01b6... | 1 
glmark2-7215c0f337dae0b2325... | 1 
                     gpsd-3.16 | 1 
                 jsoncpp-1.7.7 | 1 
             libsidplay2-2.1.1 | 1 
make: *** wait: No child pr... | 1 
              mosquitto-1.4.10 | 1 
                  nodejs-6.9.4 | 1 
                 opencv-2.4.13 | 1 
                p11-kit-0.23.2 | 1 
                 qt5base-5.6.2 | 1 
               qt5webkit-5.6.2 | 1 
                   slang-2.3.0 | 1 
                   ympd-v1.2.3 | 1 


Detail of failures
===================

        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/f7eab9e205d3495bfdd9f1fb7006e0362b1ca7b9
     powerpc |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/469519bb5cc52fa53aef15378509bd7907158c17
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/034b9d26c0f6bae3e7b290a323c42b1dc0aabf4c
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0e2a8f433d5ac5b5821654c7f3b2cf90e79234b7
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/611cf3948d527c6fa3fe669e38d4db72e161d55f
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/054c71dfacc212a62e846dae4c17563b5ab9b0b7
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/50e86d4a418b5a3944cff8f8aade2dc729fcc180
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/f512e4c5d50d3ef5e0fbe9cba641498de33f3ba1
        or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/206fbd5473c8c6840489990cb2552566c62ef3c8
         arm | glmark2-7215c0f337dae0b2325... | NOK | http://autobuild.buildroot.net/results/51162285d197deabb63727c19cdf5512b0e68f29
        or1k |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/cf544613733c9d01911047b027893b2c6c4980aa
        or1k |                  jsoncpp-1.7.7 | NOK | http://autobuild.buildroot.net/results/f9e42cf62f828e3a214fa42d91b5c8ece286267c
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/9e3d8eecf883a73cd74fffa9bc0a46ca0b057fdd
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/56f6e4fe4c03b523ed3549341daba2d283eb3342
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/f2ebba6bbbcc91836b61a05c7530a61c7e0cf670
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/941f3d234f7d922939dd838942f884eab19601b8
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/2bc84ba2d1167018e2d48e5183ead22b6425dcf5
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/e914bc0f955e4ba740614f93cbfa401b673b754b
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/4c150fedc74530d09e8ecd678dcf5664251606e7
         arm |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/6f2ae486c2f7b11308fd4eb2669dad68f3a618d2
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/f37312f613f12dc713548e44d880cec57fbd486d
        or1k |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/a63248c8a98c1d74c83085cd2daf4dc1138482ca
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/6befdfae4b7462841b39e2096eedbcfda0fbbbb8
   powerpc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9c21ffa1555ca165bd53fea866a2f2aa3b6005ca
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/e802326197a510c53ee004ce354baa051245cf5a
      mipsel |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d285e5983b86de4ec7ded1b11ba9309a2a92b33b
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/9009dbd8dfcb5bd2dbab104450d0a88a6b7209bd
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/d04f4938acb44e5a1c83e0ee83fcdfdd1d308013
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/4ac05b6453075ebce61578ba4fab18bc9b12207d
         sh4 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/054686d919c556dbd578b37dc85fa16057feba7e
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/ee1bc46c0552c862c61961c1a64c10e8dadd2303
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/6943a5255490e12dfc235d1db2fa5cf868d381e7
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/893e7f0352684ce71ad88f7ab41b59f694729ca2
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/dc91c550186cbf7a1c9c16795b31d3a0913a7ed9
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/a1b026873dc09257f26cd031163d4cb9f4d07823
        or1k |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/d6d0415f447b95be37bae11552ad05b41aad5976

-- 
http://autobuild.buildroot.net
