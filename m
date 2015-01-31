From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Jan 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-30
Message-ID: <20150131073018.471AA101271@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-30
===============================

        success : 253
       failures : 30 
       timeouts : 1  
          TOTAL : 284

Classification of failures by reason
====================================

                   mono-3.12.0 | 6 
              host-erlang-17.4 | 6 
                     rpm-5.2.0 | 2 
                benejson-0.9.7 | 2 
                  ffmpeg-2.5.3 | 2 
           python-pyzmq-14.3.1 | 2 
                  zeromq-4.0.5 | 1 
                 webkit-1.11.5 | 1 
freerdp-440916eae2e07463912... | 1 
 31750K .......... ........... | 1 
               madplay-0.15.2b | 1 
              libarchive-3.1.2 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               host-qemu-2.1.2 | 1 
               dvdauthor-0.7.1 | 1 
               libcap-ng-0.7.4 | 1 
                    php-5.5.21 | 1 

Detail of failures
===================

         arm |  31750K .......... ........... | TIM | http://autobuild.buildroot.net/results/db07ae3fd4ed63743c7b1e26195cb7b3134c169e/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/809e8ddde8f844b802e3f9c4510304151dfc2a1b/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/936e99cacd787149b76c0248574f21db97dd17fd/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/916c24a029d45a9c5d552f44f22bf69c57c3df9b/
microblazeel |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/6ddefaf001b9275ee073effbd6eb07be9f43e24d/
microblazeel |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/2f808e29b6b5f7b8926e3e745ecc7da2096cacb4/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/925b6ae97a393d3ffdcee18ae88bbd80ed6c0b0c/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8538de27709c1480e23a239e8b1a0bfda33c6909/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ca605a5787e2ec777bd90068f3e9c5639a41d815/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/5e052d42252c0ab0942e31058c1f4e8565edecf5/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e1825698473c4cfcbec23b3a7a15abe3265a0ac3/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/00151b45348eb660b7a2f46926197942ecd07eeb/
        i486 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/44b23d8120c8df77faf0276e28aceacfce204ba3/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/e72797d12ae7d1d58d71227ce89c8b0b0077cd5d/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/45f18b319641070379f38da659112d6fe5bf6841/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/1429b8b5bbc5187e23925b068371d255bb3a5474/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/f3a0b3ff15e729d223c8c8ee6af75c425cd344b6/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/f4c78a0582470744c7291ec26e2b6fe0c8380d32/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/ed961d3c01642910c4cc12c3dd951bd052b313d0/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a0158684dc97c01a356ab93396fc704ea4f9cf4f/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/d4cfddccd95cf984a435c41e26e82c59534de1e7/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4ebe6e00e74cb9ae0936385847e5b2e1135a6d7d/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/01b7ad816b936e7737dd74b987e2af7323bc0dfb/
     aarch64 |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/53a10c6a8f29a18487ebfd9e1a8d6a4e7e422c1e/
         sh4 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/27adf12cca4e0e998b64fda9bf4be67f6dbe1595/
      xtensa |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/dabaf86900aff2a99eaca2779618ad337e228d4b/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/ed8efe3985e6b423e4c18f9c200aa042ccb9ed23/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/15f2ebc63054fafa435e0eecad101dcd0dbfe665/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a1da77d7ee026a2206980f3ad2c7ca8a5d536560/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/0a310bed5758baa64a5ec28a289260332f202324/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/eedbfdd6b88169a5522bf39b5324af184015e119/


-- 
http://autobuild.buildroot.net
