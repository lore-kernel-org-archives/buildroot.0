From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Oct 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-29
Message-ID: <20141030073016.88C09100A62@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-29
===============================

        success : 205
       failures : 67 
       timeouts : 3  
          TOTAL : 275

Classification of failures by reason
====================================

                 schifra-0.0.1 | 8 
                  avahi-0.6.31 | 7 
                   mp4v2-2.0.0 | 6 
                   libcap-2.24 | 5 
                  nuttcp-6.1.2 | 5 
                 samba4-4.1.13 | 4 
          shairport-sync-2.1.5 | 4 
           libmemcached-1.0.18 | 3 
               libglib2-2.40.0 | 3 
                    qemu-2.1.2 | 3 
                  zeromq-4.0.4 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
                   lame-3.99.5 | 1 
             armadillo-4.000.4 | 1 
                rrdtool-1.2.30 | 1 
             subversion-1.7.18 | 1 
tvheadend-596b4e0b29937a612... | 1 
                 webkit-1.11.5 | 1 
               alsa-lib-1.0.28 | 1 
                      qt-4.8.6 | 1 
                   mono-3.10.0 | 1 
                 python3-3.4.1 | 1 
make: *** [target-finalize]... | 1 
                collectd-5.4.1 | 1 
                    ruby-2.1.4 | 1 
           heirloom-mailx-12.5 | 1 
libshairplay-64d59e3087f829... | 1 
             lttng-tools-2.5.1 | 1 
                      bmon-3.5 | 1 
               iptables-1.4.21 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/701e9c94533d7596f30b61db8b3d0d0e17a42376/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/ce377c533f20626fdac9db79a7a07de031ad16e9/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/f2686ef7ef152892ba02c73cd5a16895e12e3cab/
    mips64el |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/448d9bb6764ebd38c00143b48502aa07f43131cc/
      xtensa |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/075c168683f42844cbb1f435ce0ec3129068db7c/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/150ae55895da2ae02f2988cc60e94832dbf16acd/
     powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9832057f82793849dd2137d6309fe66cb9fe7bbc/
      x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/422aee9ed725ce0a9642d1c84a5542e9b9d25879/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/c94a5c8d4e06b9a979a4ee87a317cd05add9e264/
        bfin |                       bmon-3.5 | NOK | http://autobuild.buildroot.net/results/41d8de50f863a27d040fbfd92c00e1d394515a03/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/755e07217c5b24a98ab5d7c5ea2ecd2af5bd90e1/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/360593bfee61d418687a5c15dd4f9191fa87924c/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/49e084728e2e7a54a8f1d1520c151ec0a58db50b/
      mipsel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/85093e8fbaea53d9b2f2260b2cbab57ebfd682fd/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3f353ab045d5558718acf69eccc7daaebaf55ffc/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/3976f96511e9b6c1f225cc3188ee0ac0fcace5db/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/26397241abfbca6dcd0a5d59aba002732848a003/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/4caf76c099f2347062a4c58edec78a24c8d6220a/
     powerpc |                    libcap-2.24 | NOK | http://autobuild.buildroot.net/results/d933df91a1d0e476b41cd2f2e031d70daf2b1265/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/8452d127f36fcbcc16e0d7ee63aab33d7364dd2d/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/4b3e58b217855ace5dd5794b08918bfb24a0f34d/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/712468f19f001be37e87d2dfd21d4d45aec1ad7a/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2cbf469781347e7d32c05951308ce8bcea2162be/
         sh4 |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/33f2fe55457526766565da4d394781030b102029/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7ee4a0945b000aea81dbcfbecf883a27b998e5cd/
        bfin | libshairplay-64d59e3087f829... | NOK | http://autobuild.buildroot.net/results/eabfa1ecbbd5490cf94ea0393382a25c93a0984c/
         arm |              lttng-tools-2.5.1 | NOK | http://autobuild.buildroot.net/results/152de1e9131f154f9a6caad6563175d41682f462/
         arm | make: *** [target-finalize]... | TIM | http://autobuild.buildroot.net/results/d439146ad71c7b3487e151f3c37ecb0f591f6c70/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/a0f88ae1d1cee12200d5e53a86b5ad0c6fc51413/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/e6624821995db02d1b0c371e81b886f12a5664d8/
     powerpc |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/1d063a5a065a37bf35e17290f924ced9537d3267/
      mipsel |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/043e23a8a1575f249d4654e2ce5f4a24e29d080a/
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/d5a3ef5fa29c8f558e1a1eb93af493b889353ef9/
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/c6f1f7eef34025f736e35b5714029f5190bcb648/
      x86_64 |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/bc4beb415491fdfb65639c0d51ae75a1789c68dd/
        mips |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/c30b228d9b59195b1fd63e5e454306f0180c76d3/
        i486 |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/9b335d93fd1dba87a5c30923718e137f28b46867/
        sh4a |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/1c3224dd3335b720038a265b64a73695c02c334f/
        i486 |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/9e2e0839a3a30368e3687fa7bfe7aba894332880/
     powerpc |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/edc4e64e4fe179bcd4ae92bd03e048047744085c/
    mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/94aa0a79892ee110cb5a32cbfd0a6fbd0b09daff/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/388c36c0e1e0a298cf23d054976e1807b3e8840c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/3625ffcd18994afe5d16c65c11360084d1686d79/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/617da4b8daa1db2d2ebe65cfbf05a8af576e26ef/
        sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/c4dcec24586ffa8b493a8747a2e2855ff26a49b2/
      x86_64 |                 rrdtool-1.2.30 | TIM | http://autobuild.buildroot.net/results/5d5b6e2c415b2672cbe6674fa2f7fd401631ae01/
        sh4a |                     ruby-2.1.4 | NOK | http://autobuild.buildroot.net/results/91d2cc4ea2a74e9d80f7b5cf7d19673ce5193a41/
      x86_64 |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/ff7099ea46322d35014a95748f74e4c73078a112/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/2e55cf3489736666c871a2bc5235d3b83d6328dc/
     aarch64 |                  samba4-4.1.13 | TIM | http://autobuild.buildroot.net/results/5a5b2c3a1bd9b4729790d0589d5b9d7a534f40fd/
    mips64el |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/5c06931f333ed401ef929d3e10f74c57f72ad58a/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/042b3b72790fe001575ef3007ce687360a915095/
    mips64el |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/431294841f485e95c49ac07a3e20fdb58d07e95c/
        bfin |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/255261defcb0f5e7c11b1419e9b912782255f8b9/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/6b36af7f65886cbcc1f4b87447c7a0c8d6a9c1dc/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/54e4acd30abf3bfa3c81fdc68409b8d6d4130714/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3a813a1be0ac00741584cb0b120168e32ca363c1/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/7575731eb6d095277be78c90d66c275c8ba12621/
        sh4a |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/b4bebde3e664b633dd15f9d6df87197dfd4cfc01/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/1527966939bd5b49b8f75da60bc0402fec38e451/
         arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/a6ab7641a3cafcdaeffe11f08d5fcacbbb882d8d/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/048224d82b841e1d3317fef1e5ce70e7ca49aa4a/
      xtensa |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/58eafd2499919a45bfb5a2becc233d3678deedde/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/b4125ebdfce5b3a29b8747ddc80ac19fc625031f/
         arm | tvheadend-596b4e0b29937a612... | NOK | http://autobuild.buildroot.net/results/f5aa44e0a96820fb8edd47e8096131b68f64f6a7/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/91872fc408dd62c703624dc19ae2d9f5d002defb/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/dccf3e5038f105bf643e9068c29022411eed471a/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/b9805c66455a52d993088675f34c5a3c23f5ac3a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/cd5d638957100a72de1b464f2e294ba4d67280b2/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/d8630b6d01a3343fc2f018906cc2301a97cc1aed/


-- 
http://autobuild.buildroot.net
