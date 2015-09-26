From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Sep 2015 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-25
Message-ID: <20150926063012.22FCF102FE4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-25
===============================

        success : 214
       failures : 41 
       timeouts : 0  
          TOTAL : 255

Classification of failures by reason
====================================

             lttng-tools-2.6.0 | 4 
                directfb-1.7.7 | 2 
                 sudo-1.8.14p3 | 2 
                    ruby-2.2.3 | 2 
       kompexsqlite-v1.10.12-1 | 2 
                libnspr-4.10.8 | 1 
              strongswan-5.3.3 | 1 
            shairport-sync-2.4 | 1 
                      pv-1.5.7 | 1 
                     tslib-1.1 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
freerdp-770c67d340d5f0a7b48... | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
             webkitgtk24-2.4.9 | 1 
             iputils-s20121011 | 1 
                   bdwgc-7.4.2 | 1 
                 fio-fio-2.1.4 | 1 
                 mesa3d-10.6.7 | 1 
xdriver_xf86-input-vmmouse-... | 1 
                  libssh-0.7.1 | 1 
                  gamin-0.1.10 | 1 
                  mono-4.0.2.5 | 1 
                      icu-55.1 | 1 
           qt5multimedia-5.5.0 | 1 
                    glibc-2.21 | 1 
                     links-2.9 | 1 
                    php-5.6.13 | 1 
               iptables-1.4.21 | 1 
                    faifa-v0.1 | 1 
                busybox-1.23.2 | 1 
                  apitrace-7.0 | 1 
      host-gdb-arc-2015.06-gdb | 1 
                 libdrm-2.4.65 | 1 

Detail of failures
===================

     aarch64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/2daa7526cca7cf4dc8fc1e500f9ccc886718fc2d/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/dd5d3cc8428984a07356117b44f684c8c2570e90/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/a436e97a1db9b92f820d633699c65b02efcf610e/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/ace8f936d7f230e733ebc5cf5dd114f1dc7c2db7/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/008db41e50b8e5397eba09fad06599fd7cd954c2/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/a4e9d00a3e7022bc6f951855e20b64d1d592a0fb/
         arm |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/3800a8bdc60423944f766bcbcb06e583202eaaed/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/fd009ed42278d45a4b9186fe20538f04b1235440/
       sparc | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/8b22f30ca903c3d2856f02ace424b0a5ce99d24a/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/bffad3f53ed4c4c08bedc9ee608d459fe7930e56/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/30d14d048008c09f6e0a549d3bfb46783240332a/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/84a9851b07c91930def3f63ac4e8601f924f0bc0/
    mips64el |                       icu-55.1 | NOK | http://autobuild.buildroot.net/results/b27a03311d28b03ba38be8a4bd442ce11ec40b98/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/00bfa5b6e4f0c12e455bf381493fd5bb17b749a9/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/0c6fc6016a19b1836b7316a7bf550783e7e3ab55/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/cf1d0ec42d4c9f40274c2925a93528374949366b/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/dd5108e16f66ca3b2ddf9b1d5db2c3385697c61a/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d66d07621d3145d44d168755273790e237d2f047/
         arm |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/abb935e7fe71369c593ae92b3acf4a2a674a0300/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/3959d4e764db05d76a6d478dde03791c4e69bdd5/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/363847b425eda2cf47ef347aafff6b9f1e5fd52c/
         arm |                      links-2.9 | NOK | http://autobuild.buildroot.net/results/3442a131f37ea2c14b533d0f2c070299c933cfb2/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/53ae437727085139b6765bbcd923e3bea6728efd/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/28cb52afea719219c3fc4a30eecb3c1d702087f0/
     powerpc |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/f29afa684d4deab253c1c995ed16bbe528c28c49/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/769d0534c3260ccd6e15503d79aad070b79a68ca/
       sparc |                  mesa3d-10.6.7 | NOK | http://autobuild.buildroot.net/results/bfd70b632389a45f10c4792628005cd28a267c7e/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c369f62a92d3bfd40aa38a411c5a8d3490c263f8/
         arm |                     php-5.6.13 | NOK | http://autobuild.buildroot.net/results/8bd8679c7dd73139ecc155e6194390e077cd2b4e/
       sparc |                       pv-1.5.7 | NOK | http://autobuild.buildroot.net/results/90a36659e4480a866a00c6ca7ebfc2edad8887b2/
        i686 |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/27d816a8d96937420fb127bc5142a4852c1f1e16/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/f2ee6eba0c6f70608af001617664a4d936fbc3d3/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/8f399fab23f2bd77a2be3be0a0b113475aa56019/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/5b7006079c1dc8af0c511f7f4061b7734a91600b/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/8f6c25c7e763f218d2610096401461d43a1ef278/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/b936633e216c1ebbdc8888359e6b7abe4b758c22/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/e4d0eaca93d3b419a587eea4c31a532af939e3c2/
         arm |                      tslib-1.1 | NOK | http://autobuild.buildroot.net/results/492bbde81ba36a708f205fa8d36591efd8af5039/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/cbd748b83a24655f1195efb36fe26603ae72fd0b/
      x86_64 | xdriver_xf86-input-vmmouse-... | NOK | http://autobuild.buildroot.net/results/2011ae075db2cc3c22706f96b190de7a4bda99eb/
    mips64el |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/4e212942a50bae8460bd66c2e508e1d827244482/


-- 
http://autobuild.buildroot.net
