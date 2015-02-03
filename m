From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Feb 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-02-02
Message-ID: <20150203073014.6A129101A87@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-02-02
===============================

        success : 252
       failures : 37 
       timeouts : 0  
          TOTAL : 289

Classification of failures by reason
====================================

                   mono-3.12.0 | 8 
              host-erlang-17.4 | 7 
               host-qemu-2.1.2 | 3 
             libselinux-2.1.13 | 3 
                    strace-4.9 | 2 
make: *** [core-dependencie... | 2 
          libmicrohttpd-0.9.38 | 1 
       opentyrian-2.1.20130907 | 1 
                  zeromq-4.0.5 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
           libmemcached-1.0.18 | 1 
                libvips-7.42.1 | 1 
               dvdauthor-0.7.1 | 1 
                    qemu-2.1.2 | 1 
                     rpm-5.2.0 | 1 
             util-linux-2.25.2 | 1 
             armadillo-4.000.4 | 1 
libwebsock-3c1615eeadb0b582... | 1 

Detail of failures
===================

      x86_64 |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/3cc1d483353f5399297f33b57a1a6f90ff5f2561/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/db81d0cbc5e3a53161a9290e719468f78b07d368/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/91e1e886518acea516217ba7e4bc967b08d80b92/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/580d13eec9b8867514ba1ade5f1581040d072d46/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/a76b2debbff3a63bc3c2f65bbfbed363a614383d/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/53e81fc6f0cce278fbf052c924b820a4bdb2bc9b/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/64300c031b9170ada192e96652e2e31c11339609/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/f12ae18563ec9deac85e5309091ec38d00fb5fd6/
         arm |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/e3e99977acc4a4c84d0e86f9bdfa19be1f2e9e1d/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/95c63f4a30b42fcaaa754222ea3764851a6bcfb2/
        bfin |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/f83e056daf2cdbe8cf182214b5e8da6f6015d13b/
        i686 |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/a3b2d9568d7027bd4163d2a91281b76197cf8a93/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d9877276d7e9f82385a326ac03960ddeb9b3be9a/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/07dbdfcf0a7c3e7c05aa58eec1dcb5f9854fc7be/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/710188a977914a0d783077f27cef283246a8aa2d/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a8e6bf8848c6e19edbc0a581c9a3f850809dc4a6/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/1ad4a5a76c6faa7596c29575f3aae13046b7c7d9/
microblazeel |                 libvips-7.42.1 | NOK | http://autobuild.buildroot.net/results/bf62c66aac469daf00c0a5c15b5f86803088e6f8/
        bfin | libwebsock-3c1615eeadb0b582... | NOK | http://autobuild.buildroot.net/results/e0f33375fdb9a82b1e52d2c354973216b5b2197a/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/bb7e60d8c7e546f31f47458f4689515b010ce971/
     powerpc | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/f586262b194fea866e0cebcea5a607aa9308fcf9/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/a9146b629b68be59abb503551a7f7041145b01ab/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/3c34db30033ca37bafd7671d7d90aa18b3c95123/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/226f4cf2f6c03f6b51e06899c42442c483bbc6e9/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/5f0ff8c3bbb4d0cd6488b31fb5faeaea24e19bea/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/247a18af1508f1a6da17f9212da73776abb4a1d9/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/abc9a11bf8c40b8a8dec1222f61d87ef0009df4e/
        mips |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/b1b0331379b097c0c1157606d167e146dbc07908/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/671e27e6ac66395fac8977ee997c80468765e873/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/31ff28e6a6c91d39e66a849f47b2f2251374347a/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/7b771e684462ec8d3a57edf05b4e4697b3636d60/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/457d3d9231f1422b19ffbac6d4a6ab02c6d6c22f/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/c23dba1fd619154127b699fa86297f790eb19398/
      mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/09fc853a989668e26d58a9a91eadcb06b65296c1/
      x86_64 |              util-linux-2.25.2 | NOK | http://autobuild.buildroot.net/results/f3b318c904b6325fd143a55f2f9fd1c55bb9cfd5/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/dab53e908b34dbbd3c53e6183c686d70d796cfb6/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/cf968d12f2115efadd50fc49f69325dd24b13839/


-- 
http://autobuild.buildroot.net
