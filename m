From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-27
Message-ID: <20141028073015.67097100E86@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-27
===============================

        success : 220
       failures : 72 
       timeouts : 1  
          TOTAL : 293

Classification of failures by reason
====================================

             subversion-1.7.18 | 11
trinity-d68d1f7b9ab6c65a379... | 9 
                  avahi-0.6.31 | 4 
                 samba4-4.1.13 | 3 
               alsa-lib-1.0.28 | 3 
                 schifra-0.0.1 | 3 
                directfb-1.6.3 | 2 
                elfutils-0.155 | 2 
           libmemcached-1.0.18 | 2 
                 webkit-1.11.5 | 2 
                    fltk-1.3.2 | 2 
                   lame-3.99.5 | 2 
                    qemu-2.1.2 | 1 
trinity-5d2dfe9727eb9c8dc44... | 1 
                  zeromq-4.0.4 | 1 
                   opkg-v0.2.2 | 1 
              host-erlang-17.3 | 1 
                 pixman-0.32.6 | 1 
                  thrift-0.9.1 | 1 
                   mono-3.10.0 | 1 
          shairport-sync-2.1.5 | 1 
                     tcl-8.6.2 | 1 
               libsigsegv-2.10 | 1 
                  tstools-1_11 | 1 
             alsa-utils-1.0.28 | 1 
                   argus-3.0.8 | 1 
                   git-1.8.5.4 | 1 
                   ushare-1.1a | 1 
                  libv4l-1.6.0 | 1 
                   mp4v2-2.0.0 | 1 
                minidlna-1.1.4 | 1 
                libgtk3-3.12.2 | 1 
                 nss-mdns-0.10 | 1 
                 omniorb-4.1.6 | 1 
                     rpm-5.2.0 | 1 
               iptables-1.4.21 | 1 
               libglib2-2.40.0 | 1 
               arptables-0.0.4 | 1 
          libmicrohttpd-0.9.38 | 1 
                  nuttcp-6.1.2 | 1 

Detail of failures
===================

      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/ca81b60c155692a587a0224c9d55386b7f1c95f5/
     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/e0cca0db806a2f193e5bb2a9788d9a0120447108/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/00b2f8499ae12762b8a6d892b105cc66abdeebf9/
        i686 |              alsa-utils-1.0.28 | NOK | http://autobuild.buildroot.net/results/08d8c30c9e42e8825f10855486af2b1f79ab868a/
         arc |                    argus-3.0.8 | NOK | http://autobuild.buildroot.net/results/a0e6f5815d30618f94f028e87d508243a9873205/
         arc |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/57ffebbe925391badf81f6867fdbf16975b4af6f/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/1cbc0c9e686daa666c672cb848e58b4b9e3cd60d/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/9eb7d56193b0530ea5efcc1f5b4ca6a8963ffd72/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/cccc85316cbcc4c9f9df217fccb8162df6343cd0/
         arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/930bb82025a4c6bdf171ef3aa44140e754d03e7b/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/f53a9917ea6d296d854a2693df88bca61ed3341b/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/68c557ed34b1c706ac60c8d14607a5ab2eb877bb/
      mipsel |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/52436c1cd0942efbdb5994eb787b76b2317e91a7/
         arm |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/af8032f93a2f5b90572cc1d4403592ae21236072/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fec8cd56c79c8250ac46e0ae55606183181b495e/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/fa68e72357cb0f6a6c023001cc9c8be8cb6fd51b/
         arm |                    git-1.8.5.4 | NOK | http://autobuild.buildroot.net/results/751d095de6c09b9682f47fafe6c86f6f5ed97602/
         arm |               host-erlang-17.3 | NOK | http://autobuild.buildroot.net/results/ba7e3d85fee5befafba63d17ddefd6c2b66a91da/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/150fcb4defa7a25a84986a805d1740da250f7758/
        mips |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/20efed139bfde298bc30f9174f509f805855241d/
      mipsel |                    lame-3.99.5 | NOK | http://autobuild.buildroot.net/results/721dff299b204b1d3ccc0846009eb17faa2d29eb/
         arc |                libglib2-2.40.0 | NOK | http://autobuild.buildroot.net/results/e4d23cc00dd009ac420caa5997424337ce1cf585/
         arm |                 libgtk3-3.12.2 | NOK | http://autobuild.buildroot.net/results/a23db0ac750c6b4e1196201e7cbd3c537df09c07/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/2c27e0f9e6b363a88c780649ce5d1bda28bd0b85/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/f9cf651bbb747e2c290b6b1a447c4f31a1e07945/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/62ee7cd6df8e4ae98277f30310eea8a285086b62/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d9649de5824c755a8077e44cfa2eb347581913d1/
     powerpc |                   libv4l-1.6.0 | NOK | http://autobuild.buildroot.net/results/3077b929f925538fab93360b4e6c5e6e22fe1c3f/
       nios2 |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/ddbdaee382709d7b989bd74d94fbd0c2d5b61d90/
         arm |                    mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/64e687b3cb271dbf987d416dc4e47d52343084c2/
      xtensa |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/12c117788cefce403c760a6e2173dd91d9b6c77b/
         arm |                  nss-mdns-0.10 | NOK | http://autobuild.buildroot.net/results/a2f379a7963586ca9290a34da4022ad5d2af3279/
      x86_64 |                   nuttcp-6.1.2 | NOK | http://autobuild.buildroot.net/results/265a9d65df1ca1759b34ac1abddfb69d20628fb8/
        bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/a4b089cc689ec9fec4cc2af5e65146c0b6f8450d/
      x86_64 |                    opkg-v0.2.2 | TIM | http://autobuild.buildroot.net/results/391b42bd672ec5b1c6244065cb95f8a67d75d508/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/b8a2de871eec249d03744fcd4ea6b5d3d1b01bd5/
      x86_64 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/742b27fb853fecbb7408cb0a09a65a2a47d5c450/
    mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b4d06ffc9591aa67bb1ada7ba2a664450cabc77e/
     powerpc |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/9cdcfbb2c9b032635cccfdd9586f2c7f89443f2a/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/7d09014021805bbfb8b5e1f8a7ea82c519a08ba9/
         arm |                  samba4-4.1.13 | NOK | http://autobuild.buildroot.net/results/196711fafc205f8d5b69a3e7f976d8a5d7da7fc8/
     powerpc |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/a36e6d07e25d79eab23777e8206b41055e5f460f/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/3646f9495c15d62056c0e2e9f87821d8f2dcf2e4/
         arm |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/c9ca95a208bc22ff7cb325f670a8be58f27f68cd/
         arm |           shairport-sync-2.1.5 | NOK | http://autobuild.buildroot.net/results/00929df01474813be576936e80e86374efdbc327/
        i486 |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/9d18566978e2fbc3fcdb9cea97aa599a7309273e/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/630dbe642f730c7aa37136fa97d047b777b7e10c/
         arm |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/de243c429c1e443efdbba82a860dbb7a03d5b746/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/1e63585ceead0874c649c7a3f5d19cc7fda8053e/
        i686 |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/13449cd77fbbd1c2b21d04b1fc866a086d915353/
         arm |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/d0153d039bbb2d3b6d43f967607460667116c1c9/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/e3fc33177eef955830a7be68e7b23503fd1d9ebe/
     powerpc |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/39e16cddf9b2c6ee4762f1a3d0a623785382b090/
      mipsel |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/40ce377893789883503deaa57912b87d2e0192e8/
         arm |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/8ebc0cb1e80d946c71c7486c365578065a4cb386/
     aarch64 |              subversion-1.7.18 | NOK | http://autobuild.buildroot.net/results/b518d7640bd8159fd198a250d8a78417bf0ede41/
        i686 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/39fcde223aa8182c3138f49e1d59d067fe38a01e/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/9f1da55cb5b84935e0e0ea663781425f17267c18/
      xtensa | trinity-5d2dfe9727eb9c8dc44... | NOK | http://autobuild.buildroot.net/results/602c40ec4ff4deed209465e9b241db2ad6ca4193/
     powerpc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/827f5098f0dc25c605f153f87955487d429ad90e/
     powerpc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/9bda18558b1b4c7e4f526539abf07a3513538bd2/
        bfin | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/71e9aa1b0921a1ada942138887e953b2da346aab/
      xtensa | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/f1a6b45a2fd1c180e67d59235c49822c803886e7/
      xtensa | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/6bb3b3db8d4a9682e85b8b0bc01f693429fce139/
     powerpc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/08639cf84743df6d42270461180561bba077f34a/
      xtensa | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/4a98a51efc50a5ccaf5b710e03d8f9c17a7d3f72/
        sh4a | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/921319170f1f06e29af0d7d9e843600e957828f1/
     powerpc | trinity-d68d1f7b9ab6c65a379... | NOK | http://autobuild.buildroot.net/results/d9e104039ec0524b89fd855ad49db9c86a572455/
        sh4a |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/b77cb2f749005f605f7798011bc09654e3d399e0/
        bfin |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/b9094554624224aac8a7c27a08476ff41098fa16/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a00395f14ae9b7b19a080a698f24e3b1046d171b/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/a3a01fd60ca8cc21f06f9385d6ad585e3974d366/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/80c114ed9278682c3213b38ca8d3ed10b25ea4fc/


-- 
http://autobuild.buildroot.net
