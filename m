From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-13
Message-ID: <20150614063017.D281F101558@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-13
===============================

        success : 177
       failures : 41 
       timeouts : 0  
          TOTAL : 218

Classification of failures by reason
====================================

                sysstat-11.0.5 | 19
              lbreakout2-2.6.4 | 2 
                    bc-1.06.95 | 2 
                libtirpc-0.2.4 | 2 
                openssl-1.0.2c | 2 
                      atf-0.21 | 2 
                      nbd-3.11 | 1 
                   glog-v0.3.4 | 1 
                    qemu-2.3.0 | 1 
                    php-5.6.10 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
               harfbuzz-0.9.40 | 1 
                     lutok-0.4 | 1 
pulseview-198f9bc74d6c955a7... | 1 
                elfutils-0.161 | 1 
            host-mtools-4.0.18 | 1 
                 libepoxy-v1.2 | 1 
                     lxc-1.1.2 | 1 

Detail of failures
===================

        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/95069436dd5b2004e59851b8c731d534b86062a5/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/9e19e815da3bea8094a68e787e04493477ef909d/
         sh4 |                     bc-1.06.95 | NOK | http://autobuild.buildroot.net/results/f0593dc856b6d9e95d3e429dae57ba2e63b46222/
         arm |                     bc-1.06.95 | NOK | http://autobuild.buildroot.net/results/b0b9dced0014a5a8026fa972f95085e8bd16a07b/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/eb5e60e1fe606979b949a1ce30ccee2ce16e1a30/
         arc | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/15dd34cf5dbcd39706f8e864847652ee3fe668c7/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/54cc876458b4aeb96384e3096fd5f384af09feef/
         arm |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/852337d2c72595db644ba2a6e1ce8baf891c067f/
microblazeel |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/6b2610e92133c579ff00424e732440f015ccb82f/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/31d480e5abf7d13414e9b59060f86bae9d65efa7/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/7c17414048fd6376422858d1327b50a9609c0de4/
         arm |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/c50c9bd1de9e10aec13ad69ed3665653a3ffdaeb/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/d30993a7cfb4874159eab83c73e360d518471bf2/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/331c84b322c6a0205c15f9c5237047f0e2a63ef8/
         arm |                      lutok-0.4 | NOK | http://autobuild.buildroot.net/results/1a0d7764a98e64b6c2ffccef6feaf3e0ac045789/
         sh4 |                      lxc-1.1.2 | NOK | http://autobuild.buildroot.net/results/bc9e99bb4b33c52e7fd2df305dc3eedbf2b3e6cc/
         arc |                       nbd-3.11 | NOK | http://autobuild.buildroot.net/results/e5bd05623dd6c57bb0338592ecd21a5ba0cbe95a/
         arm |                 openssl-1.0.2c | NOK | http://autobuild.buildroot.net/results/4cb165163bcba032887e122ea00f759d3cce7d73/
      xtensa |                 openssl-1.0.2c | NOK | http://autobuild.buildroot.net/results/7797f94874d4b24aea6c57efe685c5ede4a46db8/
      x86_64 |                     php-5.6.10 | NOK | http://autobuild.buildroot.net/results/ab57c58a01dfcb5270122daf70a83fd40afe3fd9/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/49f305296e0a8f161c9d3f6caee87ab9023592d0/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/dcbeae960f2ed0e8c82111a69668bd15c804e548/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/df41896f7a1d1680019ad81cab56b665ab34642c/
    mips64el |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/6613d97c40f40a48267b06bb48d547e4425a07b7/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/c0177fb2607228734164965b61959976a6a878c1/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/1c9be8a113cb286c73554cb6b1f2436ef9ffe91b/
        mips |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/57bbd42f1874635ab553560dcf03bd285afa45ee/
      xtensa |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/9ae07695eaf0b5375e2f5e26b2c24aa976465c5e/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/c16db4ce3e0d13c6dbf28061caa9c7cbcf182c3a/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/c11e0e4318968610547c22bdd976976702409218/
      x86_64 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/5a39e2551155e96bf603c310a5dd2d5e6e4a865d/
      x86_64 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/52b7d813964f1069ad34835528a3c592ef8471a6/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/5945858957bdaf9aeeea29be2aa4b6debb694ed6/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/ce1f65c629feded7138325e03228b13e3527c582/
         arm |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/a836b22c6caf767d85ae75babc2b17726fb5e6b2/
     powerpc |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/398dc7ee30e16a633062b17a0f2131e71082eff6/
      mipsel |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/581e52770416dd4331c13f965ec3c5c5988fc47a/
      xtensa |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/4267f431c0bb39642ff702ab6d22543e75fb024a/
        i686 |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/eae2baf2db08d90ad55d3842242707cfd788df9b/
      xtensa |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/bdce55b88a4aaff82ce0a492a0a4f49ab5b9031b/
     powerpc |                 sysstat-11.0.5 | NOK | http://autobuild.buildroot.net/results/fca7a563456c41f5a1996ed7fc02987fa695bb13/


-- 
http://autobuild.buildroot.net
