From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-17
Message-ID: <20150318073018.A32F610174C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-17
===============================

        success : 205
       failures : 56 
       timeouts : 0  
          TOTAL : 261

Classification of failures by reason
====================================

                  boost-1.57.0 | 4 
freerdp-b21ff842ef3de583751... | 4 
                collectd-5.4.2 | 3 
                   cmake-3.1.3 | 3 
                elfutils-0.161 | 3 
               audiofile-0.3.6 | 2 
trinity-c8c41f99500b5854c20... | 2 
             host-thrift-0.9.2 | 2 
                  zeromq-4.0.5 | 2 
                libtirpc-0.2.4 | 2 
                 openssl-1.0.2 | 2 
                 jsoncpp-1.6.0 | 2 
                host-gdb-7.7.1 | 2 
         lua-periphery-1.0.4-1 | 2 
                   lite-0.8.10 | 1 
              postgresql-9.4.1 | 1 
                aiccu-20070115 | 1 
                    qemu-2.1.2 | 1 
                      qt-4.8.6 | 1 
                     exim-4.85 | 1 
                  libnl-3.2.25 | 1 
                  snmppp-3.3.4 | 1 
              libarchive-3.1.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 
                   czmq-v3.0.0 | 1 
                 cdrkit-1.1.11 | 1 
                   evtest-1.32 | 1 
                  libsoc-0.6.3 | 1 
                libupnpp-0.8.6 | 1 
                    php-5.5.22 | 1 
                   ncurses-5.9 | 1 
                 lvm2-2.02.117 | 1 
           argp-standalone-1.3 | 1 
             armadillo-4.000.4 | 1 
                  libevdev-1.4 | 1 

Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/273481f903c9b0a50ebacf45d032401adb051b9e/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8fb44ce0d7a2b2d4d804e04fa0a8db03b510f972/
         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/9882a8d6af8c6c0032d74d835aa0e096e064d1b2/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/83cb89482922d1c719d0850ddf442fff4835ebf2/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/6aa7afb291dd7f55641a41d859161d8470d89342/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/cbeff3262f35aba913a010943b0fa484db760415/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/607380e059036ae7b71d14ac243bf865ce07cc45/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e05ce8d2dd29b0a8ee60ee9c36b6e8bae6aba2f7/
        bfin |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/12ee6ef40399a572b6ae6c325bef18cebceafd90/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/b76a192f91e75323dffb88e31c8b33f0fcbfbf2b/
        i686 |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/de20f9a7fe1b4948f4e6df7be2a0fa19b1f3a80e/
        bfin |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/1ab954f20ee66651c24aeb67c9128c21569c1bf3/
      xtensa |                    cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/bdfce8f6aa238ed59331f051cdaff1f60e273c3e/
         sh4 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/0b02593d0982a78e28480557aeaca8f5e2cad571/
         sh4 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/926a43b8f635790d7e9abdc977ea803ddaf8a523/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/f71b11714e6297c6677a4260935785929dad8f74/
      xtensa |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/7f7da8478f0a060002816947c09c14f3be0dcad0/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/c39578f10f3d4b85fae1749b251f33c98c15ced5/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/eaec1c624c7fda307606bde0e45e6b6d71f8a50d/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/17afde4fd92bd24faba1042d1b805471c6c849bc/
         arc |                    evtest-1.32 | NOK | http://autobuild.buildroot.net/results/483583cdc80a08fc3fd857825b747ee2592099a1/
         arc |                      exim-4.85 | NOK | http://autobuild.buildroot.net/results/6b61ea80a3a6dcead233c4b408eba8b8d647e841/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/5f00f8a19b51bac0010cfedadaf9b44c26f04f2a/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/6f62dffec0e299a36755184338524e107a932b16/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/9ca9d2bd9b88c324c55c6f121adbcfe5497bd5df/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8118da224ac018d2693ede5345671b6b5a881274/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/3cc45770d4bff287098124e91bae7cf0575db779/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/2169916465f72dc98c22307d7e09c3121d329e89/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/856e6cf8f78dba36f6c75f51b916ac2f17861072/
         arm |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/dd3880d2264af2b3cc61d2d0bf2664241ece0c20/
    mips64el |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/71e9607b7be9e116481a533e2e8e97c367aa01d3/
      mipsel |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/468b0ff356000890e7a78df2a0b2d0fe927d58f6/
        bfin |                  jsoncpp-1.6.0 | NOK | http://autobuild.buildroot.net/results/fd797cc0285090ce76c8fcc4616b80e27f7b8a60/
        bfin |               libarchive-3.1.2 | NOK | http://autobuild.buildroot.net/results/e3bde0a27f00a8be9f85b5bba934f67ac998f67b/
         arc |                   libevdev-1.4 | NOK | http://autobuild.buildroot.net/results/39b22d299441c8858a409120c5a20f288b0aa2ce/
         arm |                   libnl-3.2.25 | NOK | http://autobuild.buildroot.net/results/aadf849ccb4968ae73ffdf23be3ec391f2878add/
         arm |                   libsoc-0.6.3 | NOK | http://autobuild.buildroot.net/results/45ea1341263c2dce5321b500855bec32933d2914/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/db0ea00700616cb69bfff8d6723e68b413f0936c/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/9b59845c6d8ba509867245a115c6c4f8485d5288/
         arc |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/c44c77a73beace1550186a580fe85d794c4f27c7/
        bfin |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/703e00c06d5dfc933382aa339e27934bc21d80a4/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/4d4605283f7c7f67a7bc0c598ee372464a218cfd/
    mips64el |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/0617454bfb604abe2f50d0eb3614ff28bde2b044/
       nios2 |                  lvm2-2.02.117 | NOK | http://autobuild.buildroot.net/results/bff92a60d352026a1c0303185b89a53794a31e6b/
        bfin |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/006790afc5ed7f9c7df2132c999b326ba49d6934/
     powerpc |                  openssl-1.0.2 | NOK | http://autobuild.buildroot.net/results/9e53ca6ebb2a34318e80f4aa73cc428c5d8bf1fd/
         arc |                  openssl-1.0.2 | NOK | http://autobuild.buildroot.net/results/9764ba8794ad9cafcb688fa072b7658a79d4e62f/
        bfin |                     php-5.5.22 | NOK | http://autobuild.buildroot.net/results/31d332cf2c043b50f2e4bb0b358c28e3701a6547/
        bfin |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/83e748aa0d80d6420cb3472b7a83c292c8c53f38/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/07c0be5026caf47603c31a447dac38621d0fb0b9/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/b9be0434ef97f74db0b3c07cd268339d941eee68/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/332464296aec36786ce7ba0adeaabf4e7cbfaddb/
      mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/ca18c7d19ac2870d6b973923c8225509a12f831a/
      mipsel | trinity-c8c41f99500b5854c20... | NOK | http://autobuild.buildroot.net/results/1adc95b6cea42dbb694be9460985902c82e82a5f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/dadd70609cfd4d79a18eca8275dd31178871f56f/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/7f892d1b22916337106cf6331d41dea26406d82a/


-- 
http://autobuild.buildroot.net
