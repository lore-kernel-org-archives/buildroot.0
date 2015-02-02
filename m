From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Feb 2015 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-01
Message-ID: <20150202073018.60EC410149B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-01
===============================

        success : 283
       failures : 33 
       timeouts : 1  
          TOTAL : 317

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
              host-erlang-17.4 | 7 
          sane-backends-1.0.22 | 3 
               libcap-ng-0.7.4 | 2 
                libevas-1.7.10 | 2 
               dvdauthor-0.7.1 | 2 
                    php-5.5.21 | 1 
                  zeromq-4.0.5 | 1 
          host-gcc-final-4.8.4 | 1 
                 libfcgi-2.4.0 | 1 
                 webkit-1.11.5 | 1 
            gst-ffmpeg-0.10.13 | 1 
               host-qemu-2.1.2 | 1 
freerdp-440916eae2e07463912... | 1 
          libmicrohttpd-0.9.38 | 1 
           python-pyzmq-14.3.1 | 1 

Detail of failures
===================

        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/2306f045d07c984ce3cad875083ff02c58a112a4/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/8ed29a7da188d4421d65dfa98d790df5a4a96554/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/0a1d45af7ff179fa3d628bc4b52e0d5c1fea4eb1/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/5ff33622f8cbb0582af84bf471b25355bad07552/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a736b67ef01c1154f821fa2e52b3caeb61ca7b9b/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/b06a415d025ed2f53b485aea7e273c71108c704a/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3712e74a589d546d4178d0146f5ea067ab1d69e4/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/7c4bad7218dbe21c542e80f04b0eb7e256a32119/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/853534baad8a5f51e4d776fe35f6550a984b0140/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/ecd6709ab5e53dba6599a3ba9a0a29242a5f270d/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6e67efc81ca9937a08b4d9f909d77433707816b0/
      xtensa |           host-gcc-final-4.8.4 | NOK | http://autobuild.buildroot.net/results/271e3a5ab5e8595cae6ff1e633caa7821752dbd2/
       nios2 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/fc11f6597c27518906d0f7155c0f58ec6c2df75f/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/050157e503560aaabfd0de0dc766140ce39c94ab/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/9b30cf689b717f34feeda1777e3d536de2993196/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/cc73a4de17affee91851b8a7f43509af5907d262/
         arc |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/0744e6db7c8786fb3c219b671993ce6ebd877e7d/
        i486 |                  libfcgi-2.4.0 | NOK | http://autobuild.buildroot.net/results/85937872dc4700a2435a2f2b35a0ddaf64ac0e22/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/ddc2e0971001fa69369f9856e91aed827eaa44b2/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/abbaf0fc3984a831c308b940dd4206fedae6fdcc/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b55b95ba506d2f872690a66c5fe57da53ebc617b/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/0326c2f8264a881f9e84280d94eeb9e421128587/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/2db68ce5ab03055db3232eea5a978f534c2a2324/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/e317cf368f6d0f9b54ec46defb89a9804f04509a/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/ccc8b438e0466f4ac3ece1bb93e954368a9e0c0a/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/0dc013b918a693f0dd916388d8f52e3098ada7f4/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/c32c6f1e1c54eccbc92c675eb9a448a1ed490a04/
     aarch64 |                     php-5.5.21 | NOK | http://autobuild.buildroot.net/results/19b959388c7858ef71063d5ea35d84964ed88a7a/
         sh4 |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/04d5ceb5335912916f05596a285e84d38a7c7d31/
        mips |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/b80fb6c7425caff0e73ef60f6099c0d1331535c3/
         arm |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/a3fcd55c4614244f194208a0cde3188ffe383d90/
      x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/493fc7fbc3ae27e41b727f2137db7eb04e8a2320/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/08a8dbdf3c768b2ce2626f848cfdaee8be9eee0f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/82bacbdf80e254287fcfca3fc381602cac122db4/


-- 
http://autobuild.buildroot.net
