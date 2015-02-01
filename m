From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  1 Feb 2015 08:30:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-31
Message-ID: <20150201073015.907C310153A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-31
===============================

        success : 282
       failures : 36 
       timeouts : 1  
          TOTAL : 319

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
              host-erlang-17.4 | 6 
                benejson-0.9.7 | 4 
           heirloom-mailx-12.5 | 4 
                    qemu-2.1.2 | 3 
               openldap-2.4.40 | 3 
               host-qemu-2.1.2 | 2 
             libselinux-2.1.13 | 1 
               dvdauthor-0.7.1 | 1 
           libmemcached-1.0.18 | 1 
                  thrift-0.9.2 | 1 
           uboot-tools-2014.07 | 1 
           python-pyzmq-14.3.1 | 1 
               libcap-ng-0.7.4 | 1 

Detail of failures
===================

     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/f5eb7fb5b68baba35f88d4fef834c8dfb6bb9d23/
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/996f19e18016911b9008e2379a2b5c192704ad67/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/7c54dce4801a53bec378b422edfa42dfa990eabe/
        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/56a721885c890f3d62bf9e13d712767e66937c51/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/9ea51b9d179e914ceec42364750f7d57a0b215d6/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/f1fde36bc5a2857419fb2d1c255a27c09aba5afd/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/34fa40baa1bdaacb9242518d49956eb13dcdaa35/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e062aa09a6aac1bb173cde748d505a241caca4d8/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/08f7a76ff6f40f4ee54c13b84ec78baca40d96f5/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/9f7edc8f242b84bc5f321be7f35750a5b8a538b1/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e5ed8905c27bc2ba4b2ab2db8033e93cc583efac/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/93ef42ab00a07553d356b62eafd9899a33415728/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/79c005c61a80c3ee4e78160ba12a41dabb5e48c9/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/1a90a7d5e198b3cea575d2fe83e2c672efbf357a/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/960756f864eaa843343f3a24cc7c2aece0f0b635/
         arm |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/cf18e34d1a3cd5d5db73abf4e28382c811270b08/
       nios2 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/57d5a97d4c7a93966655f37b8b5c5bf123cb7a86/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7abe7384896ffff2c9c3b1d454fe98beb19fc51e/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ea57ca805f2fa813f26b13ac548c6ce0acc4047b/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/816b7d22fd49657864cf62b6db786cfa394d95ff/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/4ffab866c0dc02257c0d0237098fcd4d8b075fbb/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/3eae99aff462398f01f2a3014ab5b38a965e0337/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b1911b615db9409463dadcf8ffca69f0be90dfb7/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/ae3e604b5f50ef75e2e8b6a6a3da2598dfea601a/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/6379e045dc68c76e617ad418285f1cf6163b9f1a/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a0118fca3d5ca98e3e778d464245ec87020821c3/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/d87d8af14ebcb253315245e7e1c63ae0f480d25f/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/437af00e28792cccb538d04f5df993a1c6958756/
     powerpc |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/40797597024cbb9054fdda8bdf4d011bba966b06/
     powerpc |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/1dc17a54e57130bffd19d360c9a7faae440b8916/
        bfin |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/8a72aef6525da27b92235b918b6d41ad1c7fac09/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/77ae85f24fabd00f2981f2dbddb52d8d5091b4a8/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/77f105d1d076a967078f6174ce3436360b296d60/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/af6b116021edbc6d1d4f39ab77470c9c75d3b49c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4b98e82b498847a76418e72ef2da87c351572bcd/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/48ccfb6581e31b4f800a99d78cc9286edef3e2a2/
        i686 |            uboot-tools-2014.07 | TIM | http://autobuild.buildroot.net/results/f850111cdef2ce4dffabd315011478bb9294945f/


-- 
http://autobuild.buildroot.net
