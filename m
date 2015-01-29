From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jan 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-28
Message-ID: <20150129073015.5E3AD101557@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-28
===============================

        success : 272
       failures : 35 
       timeouts : 0  
          TOTAL : 307

Classification of failures by reason
====================================

                benejson-0.9.7 | 8 
                   mono-3.12.0 | 7 
              host-erlang-17.4 | 3 
                  zeromq-4.0.5 | 3 
             libselinux-2.1.13 | 3 
           python-pyzmq-14.3.1 | 2 
           libmemcached-1.0.18 | 2 
                jasper-1.900.1 | 1 
                  ffmpeg-2.5.3 | 1 
               host-qemu-2.1.2 | 1 
                 openocd-0.8.0 | 1 
                    qemu-2.1.2 | 1 
               dvdauthor-0.7.1 | 1 
        gst1-plugins-bad-1.4.5 | 1 

Detail of failures
===================

        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/79e6e21432ae4981d54afb8820bfa107a0900842/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/37729d48675c88c56b633fd42b49493bd59ff189/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/745d2acf96b0357fa9d847a1556b47d8964e1ded/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/1b4299e001d1db9cac27602124c993d3c11c93e7/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/b7d79c16eb34ea3aa5dbfcad4e85197026992e23/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/9012b9b07d66fd6dc422014c7e1c2715a000905d/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/3ff2022d0b10a68731692a28b9287a06fb632e70/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/ee5db406d92421a93e7820ffcc79c96eb8dc4c70/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/946cc4b70219cc3414780587989a59739b2ed5ba/
microblazeel |                   ffmpeg-2.5.3 | NOK | http://autobuild.buildroot.net/results/2551aae55620c6ba3da20b8be161dda302e057c3/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/274aa273e672ef51956fc108bea10b0ec6320cd0/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/6c17741518018e56bcf94628d7ce8f1fad32a06f/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/0152a52c88d01fae9013c4101b6fb5fd6f282884/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/53e965415b5e7c63442c92e17326ed2e082f3349/
        i686 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/e58a0d7d5c084be000ae7d5b3821cd68d6639aab/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/62d44e547da1c9bdf5663a80c9bccbe9058539bb/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/0899dc046eec03585dd16a6c57117be89157744d/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/fd682326f2047fbf74e1e80580864dee54a4e647/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2ed846b1574e5c436f8aa68fcaf613c3112e6c47/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e15c2e3c395318d02768c303447dc01b84d5c883/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3a901420e3601021507729bb30dc47e4df9b2a6c/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/d409f8e2bdce545885c6e16d5fb4d8c666db16aa/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/be85bf20587d15d921500de7e81bd85626d6098d/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b4c86b05ce6fde9a4e2e5749e2dee43ee5a5947a/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/1eb67115bcd5882baa8b5c429b34a7f846aa76f7/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/bfcf35c21f673b28105d9eaffa552a4a1cf8f579/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/bd392c0c7ac934ab51ec312a48a5f04e87dd3289/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/71d2ff1303b5e4448e6909323bd376d712652040/
        bfin |                  openocd-0.8.0 | NOK | http://autobuild.buildroot.net/results/5f3937cc2b6758e11b9c58d0563beb261821872b/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/664ed5387347810d1a821b6ca261f7dcd10a6c34/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/8866b8b3ad9868f445d5b9e63220a8c43e33d0d9/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/efb3639e71ecd554fe23f4fbc0a3c905eb3f9336/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/af65ae15bd36bb7a6c4c771e97acac0aabae2210/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/1245337703d50d06e7e9d9a79dda566cc19a7a42/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/41883a0016c959d67d4e83bcd6b1dec546705763/


-- 
http://autobuild.buildroot.net
