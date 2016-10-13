From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Oct 2016 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-12
Message-ID: <20161013063031.48997102A54@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-12
================================

      successes : 240
       failures : 115
       timeouts : 1  
          TOTAL : 356

Classification of failures by reason
====================================

                    gdb-7.10.1 | 19
                     vlc-2.2.4 | 10
               linux-pam-1.2.1 | 8 
                libsigc-2.10.0 | 5 
                alsa-lib-1.1.2 | 4 
                    mpv-0.20.0 | 4 
              libarchive-3.2.1 | 3 
              lirc-tools-0.9.4 | 3 
                    qemu-2.7.0 | 3 
                   assimp-v3.2 | 2 
             berkeleydb-5.3.28 | 2 
filemq-e59951489045825d6fc5... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
libsoundtouch-010a91a59071c... | 2 
                 mplayer-1.3.0 | 2 
                    quota-4.01 | 2 
                  squid-3.5.21 | 2 
               wireshark-2.2.1 | 2 
                  cc-tool-0.26 | 1 
             ctorrent-dnh3.3.2 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                    dash-0.5.8 | 1 
                  ffmpeg-3.1.4 | 1 
             freeswitch-1.6.11 | 1 
                fwts-V16.09.00 | 1 
                   fwup-v0.8.2 | 1 
                   glog-v0.3.4 | 1 
                     gpsd-3.16 | 1 
                    hans-0.4.4 | 1 
            host-mtools-4.0.18 | 1 
                ipmiutil-2.9.9 | 1 
kvm-unit-tests-0b04ed061003... | 1 
                    lftp-4.7.3 | 1 
libcec-2c675dac48387c48c7f4... | 1 
           libfreeimage-3.17.0 | 1 
               libglib2-2.50.1 | 1 
           libvncserver-0.9.10 | 1 
             libxmlrpc-1.25.30 | 1 
                    mosh-1.2.6 | 1 
net-tools-3f170bff115303e92... | 1 
                    ola-0.10.2 | 1 
                 opencv3-3.1.0 | 1 
                 openssh-7.3p1 | 1 
                    php-7.0.11 | 1 
                poppler-0.32.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
qt5webkit-b889f460280ad98c8... | 1 
                rsyslog-8.19.0 | 1 
               tcpreplay-4.1.1 | 1 
               tinycbor-v0.3.2 | 1 
            toolchain-external | 1 
                  trinity-v1.6 | 1 
                 weston-1.12.0 | 1 
            wpa_supplicant-2.6 | 1 
                     xen-4.7.0 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/6f0882086344061f5b35c6d9ebf8a287d89dbff9
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/3ce630e4c83eb059d89c0e52e8507d25722ce8c9
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/ce909fbf86fd006dcfdc165711b3608f129f49b9
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/6e5e5721e584481a24c8c6d43200fafdf4342e96
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/42c33101f6287c4a238286f992c163ecbe93c808
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/467002cd43ce0a073a3e278d8a7b5889cb0e56fe
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/bc38faf5fa07af29e80bf6d1627a9db400f8b453
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3a54c3233c3fb616d58783a9ab51ef479f487077
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/0d50553c34634d877cf757502d69af5664c8bd6f
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/138569071d0514a0301aa5568bc86706e692d5e9
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/d8d0408dd73368df08c149bbc45722b3290db7d3
    mips64el |                     dash-0.5.8 | NOK | http://autobuild.buildroot.net/results/b043f94c445eefd5781e3ddf699e39cf88fcaa08
microblazeel |                   ffmpeg-3.1.4 | TIM | http://autobuild.buildroot.net/results/f70f985c45cee9e375aba675ccfc012fd787bf34
       sparc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/e6c1e8b541010772af4d4d336ce2f26bf16b5799
      xtensa | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/5be073266fd8b226196975558675ee75e3ceb36e
       nios2 |              freeswitch-1.6.11 | NOK | http://autobuild.buildroot.net/results/2efe6f8fd73d68f093e16178cc6bec0957ae56c1
     aarch64 |                 fwts-V16.09.00 | NOK | http://autobuild.buildroot.net/results/2e6bc77e89868d7a9902123ffb602c5b745d4580
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/e8c656408ad41253779cc891bfc4767819b9462a
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d9204ea055791bd2231dd36e68959e827784a5ed
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/5de2a4d28137ffe99cde8cd5f20bd72d7fafa6b6
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/320988bf31a5cab2111a199454ee80ba29dea92f
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/baf1e6251edcea02ff1512c4344ef80de6b41f5c
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0b97586c01fca98eb1a508d2d9b970126de0e614
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b89625775783aabb38652cd6636b56f1b8aaa38d
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/311b85204de9a17269a4b43db93d5f769c8c671c
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b471388fc86fc8a014659c3b6bb9eb6b35a4e0cb
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/48157a3d2327d76a0f0eb20d804493e5a5432164
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/bce57a9da1d29989614fb8a3730fc53961223540
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/2f6530260276f9c53a93426e8d56e6f9529afcec
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/21f6d0ee70167fe18d53ae0dc3fec4a62e68f2d5
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/763dd274469e5edc5a045ea81e0fce48e230193d
     sparc64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/960e1bcf6135a93b6aa1028701f8fb76843d291f
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/1c5519417ef29b275475aeb364efc594e42edda1
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/a52453e0bf6bb6bf9e56b1fe5ed6635a6b71010a
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3d40eee3d4d42d1558ea80182a1ebe26c13fa2d6
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/3e59ec9418d93a70da76182e48a0a07ec50422c0
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/88ed7b65845448f2fda4d22cdac911d25e6fb2b5
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/cb04119a51433083375ff7f6697f81d1fcd8d54c
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/aab6f3996894d96241fe5460173548faa1b978f5
        m68k |                     hans-0.4.4 | NOK | http://autobuild.buildroot.net/results/5f7fbb9de2bd7b40a09e325ce71ea415627e114b
        bfin |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/5f92db5519e2cbaf526c260c0e9e73cc0496dc4a
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/57273edb5fb42d8020d101bd98117b1a4bbe33e4
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/1a05449feeabdd7e9df2503d9223ee508b710705
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/8b36b8e2147819225ad22440ecb7331418eec605
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/ee8fc6ef0af13b20d8fce63c2ac88c8dae791a45
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/91edf414b80caa148b88a8b4d0d70728fbd9312b
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/bdd7110678710a3745f7c3cd0cc98782c5c36737
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/ca3029b451a42e1d58172fe5f0b7b0f2b04b862c
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/4ed18a4efb30e32c4a17a00942dba09eb253b371
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/3dc6c5068c01556907286845d6d9bc691bab7ee1
       nios2 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/15a16da3140ce37bf30e96a120515d5387e8a934
microblazeel |                libglib2-2.50.1 | NOK | http://autobuild.buildroot.net/results/38495e32a3003ce3e422f01927d18167d36a175e
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/74f167eebfe8fbc1a09709fded9cbfb311cc4978
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/5cad628463059c9a805e2731a15159ec6d36c43c
        m68k |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/853b2b5e209ead0f4b5700c00890cb41aba81714
         arm |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/5a92416187c98ec832821cdc8465df7adb500dd4
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/1b855d73c9d4cb756fca5ab82e01b7e9c58cdab6
         arm | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/26f6b2adb6a10ce3a63f8fd858717fc226fb0a74
        m68k | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/53296c7ab5d22f19b55ac222b7ff992eceb1d918
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/64da6647123d53f2dc10b4a26a5567719bfe1a25
       nios2 |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/28452dd9195d750ca1e05f546f1018b63c875653
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/01c73879f9907a7e38a541fb894642f706185f35
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b2d87b3a68e3c1f9b5fda382c405943b23f8c5a1
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/5d93f16c186376cfa4f463c74869c54762dc7477
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/22203e999bb9fc4c536ed6d7670ed6cd9bb4ec50
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1c0c15bf2e5589757529d4cecf9430094b867e87
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/c7d84c6b8f3f933480bedba1bc4d3417e7ba34fc
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/ed53b61745feec6e1137533f0f92e8c97dec4887
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/fef771bc68541e557a1939add1f9ec0e5d0770a7
      xtensa |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/9517d883c1f5abf504d6bfaadf3c26aab41758e2
         arc |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/89838e2583e07effc42620b4da41788ac03fc0d4
         arm |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/cee4e358be52ac4188eaf1f4066fb1b999adcfc2
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/8441ba23bde0760b8a891fc67fe1242b02e67032
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b15bc34654574939aa633c307205c35f8b886ed9
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/47321746dc7928245c370d2586c486bb7218763c
         sh4 |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9f5f0657ef2bbbc86a6f69be11eb5a1e77f7e745
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/93d4149efe6d1ece54bf7ecb335c035f1b4b58cf
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7abf75bdcd064090f2fdd1fab91bf2c15827bfed
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/20bd49e3b0e2e9be675be6a48b5ef7071a3f35d8
         arm | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/3b0c1491605a991bcb7c44ef22087a75c81f18dd
       sparc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/93f396d11eb527172cb1e4b786facf755f779969
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/07fc98103020e23edb565c688fce05071e9c4bcf
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/283647bb026b7fa9737b565dd43310b201cbabd4
        bfin |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/ed928b2b66511fb446dd358a46f7dd64807f74cc
         arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/efec3b7b3f1cb2303940d50d3570fccf6a27e627
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/5382c1ab103f753524ec8a34a84203a97f0bcd93
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/2fe3745d4302bcf0f4cc10c770c367eca2d4ed1a
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/6b16e01c85da173cd12510a55c020e9999553837
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/6c6ba33a40c187d860ae2fbe0dd16b287c7df813
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/d927886f60304bc4ae449089f13f57a353817c9a
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/ee71f4cabf9ed1ad7b0722cc4f034dc369bc9bc7
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/fc3de022b4590c98e667202d70a8a55fe7e78b24
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/4dea353fe70e92e741231b6e9923f8843259f6a6
         arm |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/9725dbbee8edd0ad62eca4a77f8bee74e1c2cbbe
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/24f63024831dc4a04c05ed41d4aa6036301298e1
         arm |                   squid-3.5.21 | NOK | http://autobuild.buildroot.net/results/db4cc24768d5de3c94979fb83e303f91f25ca4ec
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/ab75d8007b1eff49079d8b849af98d52654f53b3
      mipsel |                tinycbor-v0.3.2 | NOK | http://autobuild.buildroot.net/results/fa49e44f768f41ab7ed46b6d7897a651002795db
      x86_64 |             toolchain-external | NOK | http://autobuild.buildroot.net/results/9786540d9a09f2839202d6722c247e8706921c2e
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/cb4a665746652679487dee2c2e4bca881be3724b
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1af58b62646686b2a8e0f93074f62127fd04eacc
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a834626449fb2344b75212da440651ecf88e31fd
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/af356e27bee8f8ce9597593eee398c2b0563d9f5
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/39ca6c53dd7fcc3022f3d9966b3341e65594fa59
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e80b368e07b0317f88777a6eef4dc2a4a9564f82
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/2a03f608d0965977faf29c3df0392b1b66fd8671
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/107f444658968d47276501172b09e80570560fc8
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/9aee7a6723a2f4c0113570c8bc80eb7875c3441a
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/589cf365ad5374ad6e2f516d7999d5ed979c1841
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/724fda9b138f6191c3a02493c856490b9e9c1932
        i686 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/b50bfe865f70d9d66c44d67f1bc0f35c0d148981
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/c83070f4e209945565868f4c29058f1a537696e4
      x86_64 |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/e306b174a5255dec770e6ad91b25704d3f03d530
    mips64el |             wpa_supplicant-2.6 | NOK | http://autobuild.buildroot.net/results/ed8927d7bd056ecc6dd2553e348ecd85fcb52371
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/70ce9f79bff8be48f3edfa1841e90ae622dc8482
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/a06425cb2f016591be41f8203f7679bad42fb4c8

-- 
http://autobuild.buildroot.net
