From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Aug 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-08-07
Message-ID: <20140808063012.A63E8100D93@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-08-07
===============================

        success : 101
       failures : 42 
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

                  mongoose-5.4 | 21
              gutenprint-5.2.9 | 4 
               ruby-1.9.3-p545 | 2 
            eigen-ffa86ffb5570 | 1 
                host-mpc-1.0.2 | 1 
                      fbv-1.0b | 1 
                     nut-2.7.2 | 1 
                 gnutls-3.2.16 | 1 
                openssl-1.0.1i | 1 
                libinput-0.3.0 | 1 
              libarchive-3.1.2 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                 iftop-1.0pre4 | 1 
                  python-2.7.8 | 1 
    bandwidthd-v2.0.1-auto-r07 | 1 
                  perl-gd-2.53 | 1 
                  prboom-2.5.0 | 1 
               alsa-lib-1.0.28 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/af61a1341566595f366ab2b6425e6d09501b10e4/
       arm |     bandwidthd-v2.0.1-auto-r07 | NOK | http://autobuild.buildroot.net/results/db134dd77d3ada23f8e659592100bd77c87608c1/
  mips64el |             eigen-ffa86ffb5570 | NOK | http://autobuild.buildroot.net/results/1a3ac71f1fc314492823554d4d69fe7496110262/
   powerpc |                       fbv-1.0b | NOK | http://autobuild.buildroot.net/results/9cacec257f979745a7d4a43224b243ee4e16f9ac/
       arm |                  gnutls-3.2.16 | NOK | http://autobuild.buildroot.net/results/894ae45e1d6f575945bca07530e7baa22999b0be/
       arm |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/76ebd481da4f61ea07f3dcfd80979d6205183d81/
      i686 |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/9d48a75da86bf6e00332b9d505990cf81b101c62/
   powerpc |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/1ce1c8ae1228a31732306ffda2c8fbd81d2818f4/
       sh4 |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/f74d4c5e8dda9600e2c070f5a055185a4d04ab0d/
       arm |                 host-mpc-1.0.2 | NOK | http://autobuild.buildroot.net/results/ebda11bb7810be3983a80b5b0415d583d1af66d2/
      bfin |                  iftop-1.0pre4 | NOK | http://autobuild.buildroot.net/results/1f45e2adcc80c4a209aa5895260985460933575c/
    xtensa |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/ebf40260227afed2a43fec9556aa3c28b01e2a86/
   aarch64 |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/5cc5b07068b819e07e4ba64c29c216e26cb19e9f/
      mips | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/6aec8081043357d620b4a23a01f4e56a0fc4db44/
  mips64el |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/f44a84069266a2fcf5a4332b6e66264a54653cac/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/b3d4c1e76d2b3932a7eafb45c2d187f025776768/
       arc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/9c8ce4c350e7ac6af3fc73c1599865d3cefb8f25/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/f73ad78db9f0e50d1edadacbfcd91cdc12c43287/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/ee976891e00448e83a7491fe81c2d710ce7b61da/
      i686 |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/1d80c0fdd7859eaf8af5c36fa194212b23054836/
       arm |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/fdcb14599005d30821424d48980ff11dd057af6f/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/55fba3e598eb2ebe44a4fc1a569afa656b6933fb/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/7cd2d664d866d685a18134730021844417fe0d46/
       arm |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/701711626548bd166cd5bc5669e4761ffed074d1/
      i686 |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/a5991d34055753b762e31bfb41635b3bd7da8e13/
  mips64el |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/1f832d2a23fdc7e8a2f550cc46377ccf0e8b056d/
       arm |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/ff7a000fbc99887da1e37fd8f5eb0abf1d6458ae/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/d36313fc33b2e3b1ad08726e90a0ad0217381d3a/
    x86_64 |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/f58a895e96e8686891a793005a709a3311ce8294/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/d774d0235425bdfa6c9fe93656a690d864a9177d/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/a748839f4ee0327b360a368ffef9c889dc28b14f/
       arm |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/45ecf334f6c95aae8ab563c6bb56c84a370dc1a7/
       arc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/2636e1dbe3a2b99b79bb72ded8cf2df74d898611/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/588de260f10aa7eda207f2025bb2b2576a6d6b17/
   powerpc |                   mongoose-5.4 | NOK | http://autobuild.buildroot.net/results/cb2d9117cfb9b65fbcb7394d69fbff38ff0fef7d/
       arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/5bf75e5a182da884b561256d7db671596d467fae/
       arm |                 openssl-1.0.1i | NOK | http://autobuild.buildroot.net/results/3c413e8365ba43e44179a191c35ea5f06f6cc3a0/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/e4f89400766ed7784ae671b5e3b9798b543197e9/
      bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/9b551a373bff08bbe9684b523c86f5ec1e8a6b1d/
       arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/bdaf9ace39db02e5dfefdd9eb200ad0f50fba9dd/
      bfin |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/d923bfee42f62e04e8aec03905058e1adff2ba43/
       arc |                ruby-1.9.3-p545 | NOK | http://autobuild.buildroot.net/results/d2610cc6cabae930a108492948789b994c49f6a7/


-- 
http://autobuild.buildroot.net
