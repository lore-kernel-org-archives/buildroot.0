From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-06
Message-ID: <20150907063016.E32C8100E4D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-06
===============================

        success : 247
       failures : 78 
       timeouts : 0  
          TOTAL : 325

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 18
                busybox-1.23.2 | 3 
libyuv-1ebf86795cb213a37f06... | 3 
libsoundtouch-010a91a59071c... | 3 
libbroadvoice-f65b0f50c8c76... | 3 
             lttng-tools-2.6.0 | 2 
                   bdwgc-7.4.2 | 2 
                  samba4-4.2.3 | 2 
                directfb-1.6.3 | 2 
            ibrdtn-tools-1.0.1 | 2 
                 mesa3d-10.6.6 | 2 
                coreutils-8.24 | 2 
               iptables-1.4.21 | 2 
                  boost-1.58.0 | 2 
xdriver_xf86-video-r128-6.1... | 1 
                    php-5.6.12 | 1 
                    vpnc-0.5.3 | 1 
            gst-ffmpeg-0.10.13 | 1 
         conntrack-tools-1.4.2 | 1 
               iptraf-ng-1.1.4 | 1 
                    neard-0.14 | 1 
             ebtables-2.0.10-4 | 1 
           libfreeimage-3.17.0 | 1 
                   redis-3.0.3 | 1 
                   kexec-2.0.9 | 1 
                dbus-cpp-0.9.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
              drbd-utils-8.9.1 | 1 
             iputils-s20121011 | 1 
                     mtd-1.5.2 | 1 
                mongrel2-1.9.2 | 1 
                  libssh-0.7.1 | 1 
                  mono-4.0.2.5 | 1 
               linknx-0.0.1.32 | 1 
          sane-backends-1.0.24 | 1 
                  iodine-0.7.0 | 1 
               valgrind-3.10.1 | 1 
                     gdb-7.9.1 | 1 
                libldns-1.6.17 | 1 
                 clamav-0.98.7 | 1 
                 mesa3d-10.6.4 | 1 
                   dhrystone-2 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                  connman-1.29 | 1 

Detail of failures
===================

       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c35070ad5b7ada7fa4d32bcb15a3e8f0518b1eb4/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/3d17c1c660973ba0d5a5e248be0261b195308f53/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/9137c22eade566544e892f44e1760ee136753e87/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7524e0b7092121e6b11288c683458c24bf864789/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/c0b02785a7941407894b481125fdb8999c29b742/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/fad511f76e85f33f2ad14133deb9b74d708f2f57/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b1e05aada2926952cf2015c305aa71900f8d1925/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/68feca1461d50fe915ff2477e6a69e5b6e094a5b/
         arc |                  clamav-0.98.7 | NOK | http://autobuild.buildroot.net/results/4c38c2d9631b106654e2769945b1d98f44b23ad8/
       sparc |                   connman-1.29 | NOK | http://autobuild.buildroot.net/results/1ec48e511a62530be8665d968ca0f2dd644c086b/
         arm |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/08ad986f5e560e07985bbb35d49c3c7bb27bd67d/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/67acfed77b272aa9d89213a3c1ad16a0f7c3c173/
      x86_64 |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/f1d95c2cf49aea51f855b96a4fbfd67bf21f24ce/
      x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/586a55a16bb042644d8b90aea7f7e877813c1342/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/5289ec7d3d03027d072c7aa9fde2faef9053a272/
         arm |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/7c045f9eeee898215f9bf2f3bba85a7d43ee0681/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/89345826e7a2543eedaf994bdd215563085ab6a1/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/b6aa71e60f2db5f3378186e06a11d7bbca0f2eb5/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/31823120c11334ec68a9ecc58ccdbbe92bc44cf4/
         arm |                      gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0cd19849428737b70b7611e1cc188538d89ec546/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/06e62518bc3c14f0d5a5032ab4f710fc45765b73/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/30e4d9906cf58e603158d6fad19a305d3cb26ee7/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a632c6ef3a8e77c9a635f81d84f25532950bd2ce/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/247d6fd96505ff43f3105ad8c8994b9a5a649549/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/05006adcad14ead88e123d421bb5d103381e41dd/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/20a32faab817cc936deebef5f929d8a0d30887bf/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/73c9dce3d0814335b8f1ae1ba862de0f9a25af01/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/18acc5fda3ed6b665ef929ac451d3b70db2ec232/
      xtensa |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/815f9bbe82212e34811dde1199043dc6c2e6e959/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/81132de326d4a17c302a20e4635380ec06ede424/
        i686 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0793cbc2f73aeedbe131f4d881ee11e96631d794/
        sh4a |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/8f4b37c36c5b07d735828972ebff941d4e4ee521/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/3660ad627a0439c38dcdc3f96853e02a3ed5d29a/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1fdce5d697b16338e62a7d1ba24fac4c1ab86887/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/0abfe82714bb209c68a68201f9f2f44904f84f05/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/34cef0ee08d7b5fc16ea57f2e3f471e53138bf0b/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/a822e2f06fac031a8b55e8b14e8c0e449513b74d/
        bfin |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/9cb9b5fcb5852810f57cb7bb6817564de9ddda7e/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/4d2893bbee431e1f7d8cd7ccfed8b53d61c708f8/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/3104651cee53385c5696711614080b488d711a5a/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/8bff95ade4428b0a72e5db686e7cf1f4f2153cbe/
      x86_64 |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/3847e8ef28e1527764eee18224f361115aa7063b/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/aac25a76a6ab0a7359dc4727d3658e9b435beb6f/
         arm |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/0b6ec0ea170ab0875873b7c424d37b38d39c63c4/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/2fa8ba95fb1d8c7c638f637a34abfd4aba20b1cc/
         arm |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/8431c773e422455b955ed0f933175fcb133ddb68/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/f30701f1d699b62955738be49f85e51b20b19bb5/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/fd2a6eabf837abf85b74f52e9ecbcde0a7c41934/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/50d36ab673c95be88636bdfa7724c8b6ba82b4c1/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/062f50f968e65123d2cdaddfefec9cc5027c6db7/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3fa9610657e3e44d762b23fea299cb5f1bf25143/
         arm |                 libldns-1.6.17 | NOK | http://autobuild.buildroot.net/results/c4f89030b5041ed8229db89a3c8ed96e3b1007c3/
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/a92fcb94492edfdf15c1e18c13b03d75c0210382/
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/d1d9a17a93f5ab61b4fbab67e0b61e79709d411f/
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/d5548c5dbbb94bef8eccf614962d0a4fe5c91133/
        bfin |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/be9f95b17688eaef83372f22e343b17c6bbd5e73/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/ccff5d1cb3de8642e3fa24a6b01b31a503df67f9/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/0c559f1b1b9bc9f2e2a131e34f034ce4e34fa75b/
     aarch64 | libyuv-1ebf86795cb213a37f06... | NOK | http://autobuild.buildroot.net/results/6bf9e48b53f77b8a7bb8a667ea3f63298a4685ce/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/f94fe7b380b549d4d3dddb871d9bede67b2f09a9/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/f4ca7ea2dfc157de80c94b3aa9f9a9f35c664be7/
     powerpc |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/0c2d3a1cb5e8a887ea60eb4785dee885eaf59aae/
      xtensa |                  mesa3d-10.6.4 | NOK | http://autobuild.buildroot.net/results/46bf3d71f18c553f70de1b8870272740d26157c8/
        i686 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/6ddb336e784bb9806d7b95e33752ad4a5ed0c280/
        i686 |                  mesa3d-10.6.6 | NOK | http://autobuild.buildroot.net/results/755269e3e897ec8887bf2eebbc9096207ab113c2/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/f6ff11390c3c9afd143b71e265762b1e572ed2d1/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/efb77f3fbce0e9f7077fe814524e4fbba4b66ac6/
         arm |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/3af4ef252c8cb2b22134d91ce48e5930c60ec437/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/2192cf9ae1effa480a2a38b3a13bed956d70db0c/
        i686 |                     php-5.6.12 | NOK | http://autobuild.buildroot.net/results/bad7ebc7ceb0aa1c367fe6ca0f972a8bc27febc7/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/515d642bb73b6d8b5efd9501ca6155c3e915bbbf/
       sparc |                    redis-3.0.3 | NOK | http://autobuild.buildroot.net/results/b80f5687e6f8627816ad5bd80f65429d64740876/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/769fccd9c2a1caf842c7dec4fd1afd98a19889f3/
         arm |                   samba4-4.2.3 | NOK | http://autobuild.buildroot.net/results/42d94b5f22a7191341ec37a61a1ce1f1a2e906c2/
     powerpc |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/d9f5c8fbf6f4718878519450bfc1490237a13334/
      x86_64 |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/3b6f253f30afaee428ea0fc559be210dcec61dae/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/db0246b2ec70a4d0f6eb2ac0b625674d73ddbd87/
    mips64el | xdriver_xf86-video-r128-6.1... | NOK | http://autobuild.buildroot.net/results/0c469ad4f94c2834cae0e615395a82bc3d2d0946/


-- 
http://autobuild.buildroot.net
