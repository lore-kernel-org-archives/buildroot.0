From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-19
Message-ID: <20150320073020.5F0D6101265@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-19
===============================

        success : 262
       failures : 56 
       timeouts : 4  
          TOTAL : 322

Classification of failures by reason
====================================

                  boost-1.57.0 | 5 
                libtirpc-0.2.4 | 4 
                  dhcpcd-6.6.7 | 3 
                  libnl-3.2.25 | 2 
freerdp-b21ff842ef3de583751... | 2 
                elfutils-0.161 | 2 
  toolchain-external-undefined | 2 
                 jsoncpp-1.6.0 | 2 
                collectd-5.4.2 | 2 
                  cppcms-1.0.4 | 2 
               libsigsegv-2.10 | 2 
         lua-periphery-1.0.4-1 | 2 
                     vlc-2.1.6 | 2 
                    wine-1.6.2 | 1 
                  libv4l-1.6.2 | 1 
         network-manager-1.0.0 | 1 
                   strace-4.10 | 1 
                 libssh2-1.5.0 | 1 
             bluez_utils-4.101 | 1 
                     monit-5.7 | 1 
           libmemcached-1.0.18 | 1 
               libecore-1.7.10 | 1 
    libcec-libcec-2.2.0-repack | 1 
make: *** wait: No child pr... | 1 
             fxload-2008_10_13 | 1 
       host-xapp_xkbcomp-1.3.0 | 1 
               dvdrw-tools-7.1 | 1 
             host-thrift-0.9.2 | 1 
              postgresql-9.4.1 | 1 
                poppler-0.24.5 | 1 
                 python3-3.4.2 | 1 
                  snmppp-3.3.4 | 1 
                    fftw-3.3.4 | 1 
                  python-2.7.9 | 1 
                    php-5.5.22 | 1 
              lbreakout2-2.6.4 | 1 
                 apache-2.4.12 | 1 
               wvstreams-4.6.1 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                 rsyslog-8.8.0 | 1 
               host-qemu-2.1.2 | 1 

Detail of failures
===================

       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/776be8ef579e3444123d8183dca1062ece656436/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8ecb166381176d1536a95aa8043c4c8ec27cb436/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/be58c0ededb72a5bf648cdf341d303a47be6d2e6/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/9df4ebdeef3db16f543a20fafffd563c17e6d10d/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/902a470cbf0211660acd7fa696db49be98aa9473/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/16a6c29e352414c4e448cb2ab19ea65cea0a88e7/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d6b953b41375e0039df29fc047091fa15ef53607/
      x86_64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/8c9560d97c92675eb73c495114099353ff04ba27/
      mipsel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/1b0b8c8e8284ce85c22dc0efd78d88631b3849e9/
      mipsel |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/4b6f12d92a275847f80bb4c34c3b5c8e89941c95/
      mipsel |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/d4532856e2af51b0655234e6aad91070066a2806/
         arc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/3536fb1f05f5b839ee7da385e9599e219156ddee/
         arc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/467a9ff5000720196be35154b92387c5b339bf33/
         arc |                   dhcpcd-6.6.7 | NOK | http://autobuild.buildroot.net/results/39b8a62b2314b9ecd4ecb652e6c7d9186cc26bce/
    mips64el |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/a51da652314b01ae15f99708c5551f571247342b/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/b1735dd40143b4c1477ebfedefcc8dfb2d045f35/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/418df0dbea23757414dab4fb01b6a1671ce02ec8/
        bfin |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/14748bff901665bd746cca1d017013f0aac6b234/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/50d9d3bb6a75df439ae7216947c6eddd07af542b/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/98faa9a86527a0f019383fa1451cdcfa42c542fd/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/79ab6ae65afc6dee81ed5485c99efc04b1f4bfa7/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/6c3415d1ef69297505f41417e7c317dd601840d7/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/b78825825cff3960f24b9e8c1794cd110f800d4b/
    mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/336cbcf9067631f710240937ab80dd72ab0a4b06/
        mips |        host-xapp_xkbcomp-1.3.0 | TIM | http://autobuild.buildroot.net/results/3c107396c1e85674a0fe96c4461bdb057cc67fad/
         arm |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/ac4f687ad17e3640997cac869a1f57cb485370b9/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/31abd330627234292372810b6e15068c63aab3d8/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/a2154e20ea0099aaee699dc174b67f09a17438af/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/0da45465a1aadfd5fcd81bb19fff1acc21bf0989/
      xtensa |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/63bd9d37ea95137bdb3626e55ccc254767ac8345/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/6ea892732f42ffafdaca58c7d5f7e276d2ddde27/
      xtensa |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/96a3180caca2f8755f07fa53fe67c491f8d3492c/
         arm |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/5299e86c73fb7f0c1250e180883e34b3e8097778/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/647f20f870cee8472a850d4ef114d1278fb6f50d/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d3da339b00fecf5b437a099841eff6a6a1ef0a8e/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/6b4738d6e91cef1aa85e59f97f3ad3ee8f523a36/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/70813dc6a26c60b50044ace56aedd7f13464d023/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/83841630fc5bf326be4584bdd990c0b3a6b8d95e/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/0d87bd2483915c72d1ef7d71dc7b443418da421c/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/cbce061b2689d19c671976bc2412b52d8dac3cbd/
         arm |                   libv4l-1.6.2 | NOK | http://autobuild.buildroot.net/results/af3ed39f773a47f0bf1e928e3531abe8da380292/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/50458573d8ddddfe6e946afde9c217613d3eedea/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/620b8c4f0076326bdc470232302d191a5f2b31c5/
      x86_64 | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/3db62cb3128cf420142742cb8f8db00614a2912c/
         arm |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/8d5d9b65cca0e3d6cea744d628175a439559396d/
      xtensa |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/8292ec221426d61029ac9b10a9d8189392b5a86b/
         sh4 |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/8bb4a155c06526309dd55fd1839358e214d44219/
    mips64el |                 poppler-0.24.5 | TIM | http://autobuild.buildroot.net/results/f2e1dec0609a464dfcfd0a3d2f56d49a65811223/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/195f745f9cc795a74132333560bc07b8e3939004/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/c96950fb7b151698f9a4eb7314d0bc754a9c36fb/
     powerpc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/0faedb6228965f9be420edb69759753e66cf5bbb/
      x86_64 |                  rsyslog-8.8.0 | NOK | http://autobuild.buildroot.net/results/1b745408187b7655ae22942572367d7ed911973b/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/50521d3b513a361f4c543d6fb346de7075aeb2e2/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/fa7c6ad255a013f045ab5dd4e922345e3cf2250f/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5cb0253b21c3093845e699d5bbff2ca49dbb0861/
         arc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7607167af80823d271a2211664f56ab008f4984a/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/b79fda40bb91ee6f17d6a426b6bd22ca11e7ae1b/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/ad9e2f843e9ddeca6b49970c9f160b49da703376/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/26525abcd553e8216252d3c6d1d473679aacde59/
        mips |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/ebaeb301415e63e089f9e73acf4869369de8f174/


-- 
http://autobuild.buildroot.net
