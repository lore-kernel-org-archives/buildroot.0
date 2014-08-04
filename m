From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Aug 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-08-03
Message-ID: <20140804063011.7D79E10106C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-08-03
===============================

        success : 85 
       failures : 30 
       timeouts : 1  
          TOTAL : 116

Classification of failures by reason
====================================

                     vlc-2.1.4 | 4 
                     vlc-2.1.5 | 4 
              gutenprint-5.2.9 | 3 
                linphone-3.6.1 | 3 
    bandwidthd-v2.0.1-auto-r07 | 2 
                 libpcap-1.6.1 | 2 
                 dmalloc-5.4.3 | 1 
    xserver_xorg-server-1.16.0 | 1 
             armadillo-4.000.4 | 1 
                libgsasl-1.8.0 | 1 
                 python3-3.4.1 | 1 
     0K .......... .....mak... | 1 
mtdev2tuio-e1e7378d86abe751... | 1 
                  libnl-3.2.25 | 1 
            host-binutils-2.22 | 1 
                libmpeg2-0.5.1 | 1 
                  perl-gd-2.53 | 1 
                libcurl-7.37.1 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

  mips64el |      0K .......... .....mak... | TIM | http://autobuild.buildroot.net/results/f4384c255804f06af6e791e919410d5ec0c44e81/
    x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/872ade91790646c6436e60b546c8bd9bd1f0ccb7/
       arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/2a596b86971df6f39d57c74137860c00f8f9c558/
       arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/455dfb63dcfd2e8ee67cb8f3eb5b579a10fbee05/
    x86_64 |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/650a303db6d99a7a65c67cd6950dc047a20cc07e/
      i486 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/37f87ad7ba087d42d0001f55305f7468c2a172b6/
       arm |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/50e7453d2dcf0a35c483ae0cc167f40393f77dd0/
       arm |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/d27010da16538ab7ee6cade492a77110a11877d9/
       arm |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/0522a8bbb8b69ca7cae47083356fd541846f224b/
       arm |             host-binutils-2.22 | NOK | http://autobuild.buildroot.net/results/edcf6ce29906d061c28393321cbe86c486a412ee/
      bfin |                 libcurl-7.37.1 | NOK | http://autobuild.buildroot.net/results/4a222a40d627fda6e49714b13b4321d62c9c2e51/
   powerpc |                 libgsasl-1.8.0 | NOK | http://autobuild.buildroot.net/results/dde5c6d97288b52fdbb9edaf837b5b55bfdb50b4/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/35a00dbe607c078193afc18d918c2a635ed43959/
   powerpc |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/3e28b9037da661c1823ea76add25af581bc3ca86/
   aarch64 |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/6caeb7f41ac5e14dbee49f87511af3351f6013f1/
    xtensa |                  libpcap-1.6.1 | NOK | http://autobuild.buildroot.net/results/e31f199a7411bd9362133d18acdc139f2b62a633/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/fd94164588c8d4155b9cf6aeb230a0c8d0310429/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/b72b1f6287986af3d686cc3c8b9c1b3fd9419d29/
       arm |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/bf57cb7ae1bb8ca73af1fb11f4e9aec7c7bb3d8d/
      bfin | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/9a40a7764cbae8c524ac2af6d685288dff677c82/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/f58f126c6806ad914a39affe673f6083c33fe890/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/a4d5bd284c2f86d67c38f97c337de29e3f0b042b/
    x86_64 |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/83025b9072221f9edaa4638687950f8086e1c19d/
  mips64el |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/3b2815d27a2252a2d677eed5c479a88bbb04d655/
       arm |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/0b59e2d0b17501d10c005292a2e1916f23a12a0e/
      i686 |                      vlc-2.1.4 | NOK | http://autobuild.buildroot.net/results/473e601b009d8b045cd6041f3725e9dc81e31f03/
       arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/b2f8027335b4c1ccc5e8fbc02047b56d2cbf7f8a/
       arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/00b277bb7ebe96ced16c2ecda690b60f08b56083/
       arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/acc212dc70abbf86be5d764895ee50b1eb64668f/
      sh4a |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/a7cce11e3bc5768116ed2a32dfc8dbbc52d75a5f/
   powerpc |     xserver_xorg-server-1.16.0 | NOK | http://autobuild.buildroot.net/results/852618a1168df697ad24c9a6ea0dfa83f9ff614a/


-- 
http://autobuild.buildroot.net
