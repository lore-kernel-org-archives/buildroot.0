From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-09-10
Message-ID: <20140911063013.3C70A1011F8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-09-10
===============================

        success : 233
       failures : 45 
       timeouts : 7  
          TOTAL : 285

Classification of failures by reason
====================================

make: *** [core-dependencie... | 4 
            libsvg-cairo-0.1.6 | 3 
                 gnupg2-2.0.26 | 3 
             lttng-tools-2.4.1 | 3 
                    strace-4.9 | 2 
libwebsockets-v1.23-chrome3... | 2 
                 tn5250-0.17.4 | 2 
              libgeotiff-1.3.0 | 2 
                  xerces-3.1.1 | 2 
                 libssh2-1.4.3 | 2 
               alsa-lib-1.0.28 | 1 
                     rpm-5.2.0 | 1 
                 wayland-1.5.0 | 1 
snowball-hdmiservice-f75c99... | 1 
                     tcl-8.6.2 | 1 
                 libdrm-2.4.56 | 1 
                minidlna-1.1.4 | 1 
                libinput-0.3.0 | 1 
                jasper-1.900.1 | 1 
           libmemcached-1.0.18 | 1 
              librtlsdr-v0.5.3 | 1 
                   duma-2.5.15 | 1 
                    dash-0.5.7 | 1 
                 cdrkit-1.1.11 | 1 
                 qt5base-5.3.1 | 1 
        gst1-plugins-bad-1.4.1 | 1 
                     gdb-7.6.2 | 1 
                   perl-5.18.2 | 1 
                 xenomai-2.6.3 | 1 
                  thrift-0.9.1 | 1 
              libarchive-3.1.2 | 1 
     0K .....xapp_listres-1... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
ti-utils-06dbdb2727354b5f3a... | 1 
              libsvgtiny-12121 | 1 
                 python3-3.4.1 | 1 
                      bash-4.3 | 1 

Detail of failures
===================

       arm |      0K .....xapp_listres-1... | TIM | http://autobuild.buildroot.net/results/1769b5a2df1ef062c0a6c80963533e2b2e577475/
   powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/97c1ccf706ce121fea1f47c4a638be7ccf5b6832/
       arm |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/ddc7121d2ceb06451d5931ef6e27f73c5bd6c12e/
      i486 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/2f29d58971689269187d91aaf75c64db60fd64c5/
   aarch64 |                     dash-0.5.7 | NOK | http://autobuild.buildroot.net/results/786269c33fb9a1459fdae0fa60aba788d6e73c1b/
       arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/cf9336f484c482b99cf47b7e6a9f53e4931095c7/
    mipsel |                      gdb-7.6.2 | NOK | http://autobuild.buildroot.net/results/85e66962da9a6b80e1d1b721031b6ef0da45e3d5/
   powerpc |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/d984735051662b0f1a6cf72f7584f5e96d0e53b1/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/342297b13a07badd52211999da5e6392bd33083d/
      i486 |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/434b9fe1f227efe909c277b3f4adafa3a2a3ddf7/
   powerpc |         gst1-plugins-bad-1.4.1 | NOK | http://autobuild.buildroot.net/results/b50d7a070e4d81e880d36f283938a148fb704adc/
    x86_64 |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/307cac65287420252a5bb64715d9a1edd90e72fa/
    mipsel |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/9082ed4a8feb58fd60318fba80686b0abd3616b7/
       arc |                  libdrm-2.4.56 | NOK | http://autobuild.buildroot.net/results/b8f256772fd50747ae78a4e477d9c218daa59823/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/36a6e45690873418eb9d38bc52fb5561990a47bd/
      bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/40ef01c95017cff00336118315730150f37fc687/
   aarch64 |                 libinput-0.3.0 | NOK | http://autobuild.buildroot.net/results/571e49630302d6dd8b0acf46a80ca5262b0dce94/
      bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/41b2865c718312190147460e954aec3705cf3f7a/
      bfin |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/31558fa7f029b3a4755993adf5fbceb260962da0/
      bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/ac041f1a592389ccc0dd3f2b059cd846ec00b816/
      bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/d3dff36ebcecb8cb0abfb7f8f8286b15cf9aec99/
  mips64el |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/12053475ec6dfd44eada46b5cb6968a52b725208/
microblazeel |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/9301b326f617f0cd901468f4e105cbb56e8f4616/
    x86_64 |             libsvg-cairo-0.1.6 | NOK | http://autobuild.buildroot.net/results/ddaf52f32a5901264607196e8cf4bc2210c87dea/
     nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/477377c12b44058e8a7b34ddaa8b05c0237f5268/
    mipsel | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/1de9f45caf60caada3a0091de03fc7b293b7e341/
       arm | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/24bcd47c0f7c1c7151585ef1c5720b6f74724b1a/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/eee37ac019933186c47d83ae1126834676091b7b/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/8245bf65b46258c92d03dacc5a855c30842f2ab6/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/f2c6af46cd9e8de3b6026526be472f580e01e195/
   aarch64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/9df8dc9580fda4f8639e9505379940c6d46e09a2/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/5195dab457be06b3b661ea3b823b1c4332a26d8e/
    x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d0656ce1707f5349afdb0e246565dd38eaed8ecd/
    x86_64 | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/d29e01e82992f5d732cfbe2183c0814ae17c66f1/
     nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/67f017cc11a8ffefda549970d66487443733c71b/
      i686 |                    perl-5.18.2 | TIM | http://autobuild.buildroot.net/results/f52e0685883476cfa50171a4cb1acc4d5e58adbe/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/3e4a22c81c29c44065db2660e811f06115a0fc21/
   powerpc |                  qt5base-5.3.1 | TIM | http://autobuild.buildroot.net/results/6c505de144ef2ac355f21a4ee5c577ce0773c582/
       sh4 |                      rpm-5.2.0 | TIM | http://autobuild.buildroot.net/results/1dd779b787d4724d3e5be933ff80ab559f4c67a5/
      bfin | snowball-hdmiservice-f75c99... | NOK | http://autobuild.buildroot.net/results/47f52078c52bd1270e9d7ca795a4b3b21737b39c/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/46ed46dd3880513e96f92a417d68b7e75b6e804f/
    mipsel |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/383601bcc67d1155fd7cd9a0fd2388e05e2b172d/
    x86_64 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/acfd6b7f67a91cc95f4bea157ef9593f7d4f02a3/
      bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e303050d4f389bca09c6be0e9dbb5fab821e7317/
      bfin | ti-utils-06dbdb2727354b5f3a... | NOK | http://autobuild.buildroot.net/results/4d4de1e854ac1c31979461a27c9368ead854845b/
  mips64el |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/5ddc8636d6555851f692c0c21f583df235340b19/
       arm |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/b38952f355a39053db6bda2924fe3925c0c6ef58/
      bfin |                  wayland-1.5.0 | NOK | http://autobuild.buildroot.net/results/09e4eebf3c9c683f564f6da6f7228973327ec555/
       arm |                  xenomai-2.6.3 | TIM | http://autobuild.buildroot.net/results/c2ba9bd3e2833663baa73466d0166d402df8d0e9/
   powerpc |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/a30fb31747fd6f5666b3881065183656c90cf72c/
   powerpc |                   xerces-3.1.1 | TIM | http://autobuild.buildroot.net/results/f31f84d6440c391e7dafafdd73497ed3c3259af2/
      bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/f698f9b438050938ff141dfc2491185c7a0c876f/


-- 
http://autobuild.buildroot.net
