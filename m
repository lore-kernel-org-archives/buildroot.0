From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Jan 2019 08:00:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-10
Message-ID: <20190111070026.DCB8120A06@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-10
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   1 |   0 |  25 |
   2018.11.x |  24 |   0 |   0 |  24 |
      master | 190 |  54 |   0 | 244 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

      intel-microcode-20180312 | 1 


Detail of failures
------------------

      x86_64 |       intel-microcode-20180312 | NOK | http://autobuild.buildroot.net/results/d5666e3a894845016eb29d8885bf1e70aa2645f2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.3.0 | 12
        glib-networking-2.56.1 | 9 
             host-grpc-v1.16.1 | 5 
                  libssh-0.8.6 | 3 
                   netsurf-3.8 | 3 
                 dmalloc-5.5.2 | 2 
glibc-4e2943456e690d89f48e6... | 2 
                   strace-4.26 | 2 
               asterisk-16.1.0 | 1 
                    atk-2.30.0 | 1 
                beecrypt-4.2.1 | 1 
                gnuchess-6.2.4 | 1 
             keepalived-2.0.10 | 1 
         libcpprestsdk-v2.10.8 | 1 
                  libftdi1-1.4 | 1 
               libinput-1.12.5 | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                     pcre-8.42 | 1 
           php-memcached-3.0.3 | 1 
                php-ssh2-1.1.2 | 1 
       shadowsocks-libev-3.2.3 | 1 
          shairport-sync-3.2.1 | 1 
               skalibs-2.6.4.0 | 1 
                supertux-0.6.0 | 1 


Detail of failures
------------------

         arm |                asterisk-16.1.0 | NOK | http://autobuild.buildroot.net/results/85d30a4f94efa868a9155f7dda593ba8079063b5 |     
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/7e7f6ec67d51d62f161bed92fe43fdd3e474f93b | ORPH
microblazeel |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/9952d496a5bbf040122217292de7c908d0f2d59d | ORPH
     powerpc |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/54a7fabd542bb286b021502fe3cd0a0c16630d12 | ORPH
         arm |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/7746e80ed4799621f823ae4310d2c580ba2de14e | ORPH
       nios2 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/1d11d89feee8f70b1f78ec2bce79f6079437ea18 |     
    mips64el |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/b76f822bd4ddc88d9728f95e5231ae6e6d64db7c |     
     aarch64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/b128c88bab2ebb899314466cd39522765ad2baf6 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/314879a0b472b27ee60a5f75a9206153f277f745 |     
      mipsel |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/bdd371fae88800937f1c3896f0ce4e6bff07c095 |     
     sparc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/e5716a5a89da379c13f2b23f09c1df6214a61821 |     
         arm |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/d6156250c36ffc1935eca3f38ddeaa57418c5d65 |     
        mips |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/f345e5f41f1e1aa5c92ff8a4b8c1ef0cc25bcb5c |     
   powerpc64 |         glib-networking-2.56.1 | NOK | http://autobuild.buildroot.net/results/89fa1b2079edf2f5b842b98182a8e30f3080c007 |     
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/2063f2342fe6d772e7544182b3b466a6a15d68a5 | ORPH
     riscv32 | glibc-4e2943456e690d89f48e6... | NOK | http://autobuild.buildroot.net/results/a272b7b2873718cafd9f712fc84e115bc2727118 | ORPH
         arm |                 gnuchess-6.2.4 | NOK | http://autobuild.buildroot.net/results/7918757b255ed41609609d2083c2d8904ff3136e | ORPH
microblazeel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1348b86f8aa37a054e032bb5b5ad6b68148db6d5 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/1d82cd2ce3df60fbdc819ab74bb0f5a9cf636f50 |     
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/2da157afcbd66aae8bf73fa105c3fa49d384cb51 |     
     powerpc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/043d24454879ddc052f3d4311644fb87edadaeba |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/50c402b733007a4abc5a3bc99933d9fab1110ba3 |     
       nios2 |              keepalived-2.0.10 | NOK | http://autobuild.buildroot.net/results/d229602f2e477499c86567e0e8a3535513d322e8 |     
         arm |          libcpprestsdk-v2.10.8 | NOK | http://autobuild.buildroot.net/results/b6de104c7a7248317e3b1a50abcba1ac2594e466 |     
        or1k |                   libftdi1-1.4 | NOK | http://autobuild.buildroot.net/results/72d16f8ae194066ac4cf416b01f05234623ea512 |     
     riscv64 |                libinput-1.12.5 | NOK | http://autobuild.buildroot.net/results/bf4d3d360f635c3524a52b84a72d558770596ed0 |     
   powerpc64 |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/1c2d7aad8bfe6a56d81305d4cccc7c79c0fec106 |     
 powerpc64le |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/28fa880f3902060c68c181796dc4908d86c47ed1 |     
        or1k |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/d684900e50510f176b1111dbc3375b767887ccbd |     
        or1k |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/6e0a57a85a538c2a9e72b45fbd2ddf3aec06b803 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/eabeed91dd6b95743816fe627d3968a61d74d25e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/80185e3a5741b618dc317c59b1f6f32fb139cc8d |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/86b2c5b6f3e1614b5c8b3db93ea91fd52f7eb92a |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/b18bb9d341b4cf600c596c80358d852f53059745 | ORPH
 powerpc64le |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/38215a2937123fee46921807ac9de26d756c4bb7 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/c8e3bd4fa3e136f477f9956eb58f3e864d383d7f | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/454889af16f806dedf0f62b4750d5f8362f5db46 | ORPH
      mipsel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/3fb53671f7eb0b9823dca2b147cbcb06b08f0aac | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/72ac20a23ac03c4bb497dcbcd855f8e156d8f8d3 | ORPH
microblazeel |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/6c534d97e1e424348457f9565004d649b10b9ccc | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/99d976b9248bc8b0dbccf994a913d8f25459ef3e | ORPH
  aarch64_be |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/f49615c77aa8f8eeab1e9aacc5078f7ac524f397 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/df3d0c5876e6e44fa9c97cc44941512fb7f1e92c | ORPH
      x86_64 |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/a5c2a5b86dc35d224e36ebc2551463aa57cee3bf | ORPH
         arm |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/ece2eb02da755841b970385b45e2f822a41cc516 | ORPH
         arc |                      php-7.3.0 | NOK | http://autobuild.buildroot.net/results/290818b2bc074d5f76b7a21c1f933ed801c4931d | ORPH
    mips64el |            php-memcached-3.0.3 | NOK | http://autobuild.buildroot.net/results/d2117e1b086c97665065e74fa6c4f7c66e72ee5d | ORPH
     aarch64 |                 php-ssh2-1.1.2 | NOK | http://autobuild.buildroot.net/results/8a156bef7656b4f4acc6579e7c368794f11dc31d | ORPH
microblazeel |        shadowsocks-libev-3.2.3 | NOK | http://autobuild.buildroot.net/results/d0ae128011dbcb49b0ce9f86f6d9077e98b7b823 |     
         arm |           shairport-sync-3.2.1 | NOK | http://autobuild.buildroot.net/results/f9b28281b525e470495a5ae4cb60e3c9fe9cfda7 |     
       sparc |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/a6561fd7e90419506203bb2161fdb11318eccab4 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/d1dcb64c38c43f5cdb1c340ef62c7d790a1b6e9b |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/30fc8ed3841b05d9b617644108364d4e087d0c9b |     
 powerpc64le |                 supertux-0.6.0 | NOK | http://autobuild.buildroot.net/results/a55ce09a29a8d09d664b784e6915e35a505f6987 |     


-- 
http://autobuild.buildroot.net
