From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-20
Message-ID: <20131121073002.85918101270@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-20
===============================

        success : 79 
       failures : 30 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

                      qt-4.8.5 | 3 
               libsigsegv-2.10 | 2 
                  aespipe-2.4c | 2 
  toolchain-external-undefined | 2 
                openssl-1.0.1e | 2 
               libglib2-2.36.3 | 2 
                libiscsi-1.6.0 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                    zlib-1.2.8 | 1 
                  python-2.7.3 | 1 
                directfb-1.6.3 | 1 
             tinymembench-v0.2 | 1 
              fontconfig-2.6.0 | 1 
             alsa-utils-1.0.26 | 1 
               libcap-ng-0.7.3 | 1 
                 mplayer-1.1.1 | 1 
               ruby-1.9.3-p448 | 1 
                sdl_ttf-2.0.11 | 1 
              gstreamer1-1.2.1 | 1 
               alsa-lib-1.0.26 | 1 
                   squid-3.3.9 | 1 
                     lxc-0.9.0 | 1 
                 qt5base-5.1.1 | 1 

Detail of failures
===================

    mipsel |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/67777100952502ce1234d56d487232b89fc63555/
      mips |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/8c82eb723f332672eec3ea1dadccdcdaa42051f1/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/d61ef4411019699d7b6bcd42faeb090c54d47497/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/3ef1964a674dbac3dc29f51e39c6f2db0ff0034d/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/8606ad5f2fd29472b21ed86e59afb3c7e537bb04/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/aaf5637c06730177e0f98a3bb1bb4f72922f0f4a/
    xtensa |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/a75445ff97aa64206a396a9dfa3592d6e939fabb/
     avr32 |                libcap-ng-0.7.3 | NOK | http://autobuild.buildroot.net/results/9e2b20bd82e7629ae4e732d816fce5328683900e/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/82ec28701d0586cdcabd1765fce4eb6e8f9e872b/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d304c5efa2012aad0d38293833f23ba4196b99b0/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/1dc62210c19261a8f5798c992a20dd70244702c9/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/16cf518c29fb42279b4d3f5bf1a0b08b7991de25/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9821f4d44e65db1ec503acc89685ccfa7664fc32/
     avr32 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/79ad9d7f5a9fb48e7d3210f0aee14638fde8f3e7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/4f6f7b158cb759e631e6a6d1855add7cec27f0ef/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/f554a022deb1798f91b67b06fb1d45f3aab7b40a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/adf657ad294e8e70a0f777cf104c3bcfb31d5512/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/cffd89c243169c2f5fb4066616667cce0072c7ab/
       arm |                   python-2.7.3 | NOK | http://autobuild.buildroot.net/results/627ed1de53a1f059f52b1df15fda8cfd2e02a51a/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ce5eea3c0d4c66f5374430102b21df9a10873054/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/838983b81f54e535a6029bb6901b9e525e7bc309/
  mips64el |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ae499fa0fa999bf7da5ffbb78c5ad4377a252b7c/
     avr32 |                  qt5base-5.1.1 | NOK | http://autobuild.buildroot.net/results/b4d1bdd168bf18f0454f3f00fe78f83a0e77f190/
       arm |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/7c6cc07e360aa998957a48e834b8cc086282d716/
       arm |                 sdl_ttf-2.0.11 | NOK | http://autobuild.buildroot.net/results/d1f3cde93310780e453188f71394b21bc4e5a057/
       arm |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/b33e1f41e50b6e7ac3e30806b9a617d451bc27b4/
  mips64el |              tinymembench-v0.2 | NOK | http://autobuild.buildroot.net/results/ae478962c1b13af9fc46bb0a5379f89b3fbbecd8/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/fded49c26bd51f9e457cd4e785bd27bb9d47c797/
      sh4a |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/920a4bf85916e3e7d71c479e2730787ec0b54131/
      mips |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/9671f48783d2b69f941da97a6486fa73bb221b84/


-- 
http://autobuild.buildroot.net
