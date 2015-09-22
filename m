From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-21
Message-ID: <20150922063017.3F1551015B5@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-21
===============================

        success : 205
       failures : 53 
       timeouts : 0  
          TOTAL : 258

Classification of failures by reason
====================================

            shairport-sync-2.4 | 20
            micropython-v1.4.5 | 6 
                    ruby-2.2.3 | 4 
       kompexsqlite-v1.10.12-1 | 3 
             lttng-tools-2.6.0 | 2 
               util-linux-2.27 | 2 
host-gdb-6be65fb56ea6694a92... | 1 
             bluez_utils-4.101 | 1 
                 setools-3.3.8 | 1 
           libfreeimage-3.17.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
ltrace-c22d359433b333937ee3... | 1 
                    vpnc-0.5.3 | 1 
                openntpd-5.7p4 | 1 
         qt5connectivity-5.5.0 | 1 
                 mplayer-1.1.1 | 1 
                  mono-4.0.2.5 | 1 
                   mpd-0.19.10 | 1 
               iptables-1.4.21 | 1 
             bluez5_utils-5.27 | 1 
           host-openssl-1.0.2d | 1 
                dbus-cpp-0.9.0 | 1 

Detail of failures
===================

       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/c0e6ed2df5c6fd19266fa8756a64cf49d399a5ec/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/6115bc7385abee39d5371081e784c000eb2484f0/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/8046d5cab73e275404561d6d619aa31c2d611e4a/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/2d6b899b3d63c6c0b35cbf300356cd6c880b7f4f/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/4a63678220916719daadecdb224d4ee532df2855/
         arc |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/92d68157c2a43321ca2d7489ad1cdeb42d6cf4c8/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/cf5072d45c1c21fc41d6144fde2c982775ad89be/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c2b475b13804e847410511fab3cfd1b480f45cdb/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/68c1cd7ce7889cf8bad8354e8d7b04e912885cb7/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/5a33e200b927741a86abdcbaefcbdd11d107ecfa/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/19ef1961c68e45e0d0e4c406bb5d68e072597822/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/a4a095472d0588aff35f243eee6315a4f6a26278/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/df51de948ce15a3f1d406c3ea2ca1be3e4bfc97a/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/5a67e93b211bd98e98df6153812c75b1d8859b46/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/cd21ee5ca3ca441aa2941e8d2729afa99d0403f0/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/e2253de3f96e9a53e75b4cecaf56c1df2950803f/
     aarch64 |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/8895f6e1a15f5c55eba1665a9c0b95e03fcdec9e/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/1262c9a11a10b4f84788ef85f95a2a93bbc683db/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/d403a4bf66e8f4ddbba2edb9d6e744423a9f21f9/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/cb213a75691a44719a556760780606de41b381b7/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/71e4cc8ea9033462f010916f98df57cb507a2425/
         arm |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/fc5368f917ac6b7513e8c742f6fc4ebda040a060/
         arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/446e6a3272392acbf658ba1959fa13def97b06f0/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/601f0c2e7878d7f75dc0ee699641d1df0ffd3f4e/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/55ae6489ec812ac88c21d012466b4a447edf2de3/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a58bda29b8b4970b8ef272ceec505f1320be2f13/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/6f5bc3ee849e5e4ae2fb77cde002dc7e3c596b42/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/7209b6b4c6e74d3cd8dd3d9bfdc37916b430092f/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/a2487b0276b68ad033ad71085060ed81b8a592ab/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/32f51c79cc4b1a6b4732f1510f22da9a8becd82f/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/9e5d0bebf3f22fad70124e28bc218f776c03d70f/
         arc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/4c6074e9c03f48466c4116e0cbfc0854bc2b1f43/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/fc1ffbdd3f670ad11588f6ef10f7a479661b3a16/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/f264b2a6ad962cb3941173661e083d7adea92d8b/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/fffa63a68509e31f6156e0341bc24c031c0060f1/
      xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/74d93c02a6d6558bb00869d1437b881d3795d202/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/2c3e7e9f366584b8994ebd6d1df55acad440582e/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/253eba2f1bf569baac03d6af1e25af4b2d79d472/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/3ed93a3dbab296a0978f3b6f81e44287e2ad5905/
    mips64el |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/f652d651e5950e0ddff7c69b90d10a64447e6365/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/7d2a1178dd94abd0b256a3dc1fb7f3636b48b95b/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d84553502f3d2f18f7a0f55a93f10ac7a1b64589/
     aarch64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/2a61e02f3b2c6a72d2e9d54b3a4e05e941cdea96/
      xtensa |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/67093cfde690e532e7d5b9ebddce81f4b9275939/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/3b177cfa7babde5bb14b1ffa51ecd8e311eba84e/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/2ee776246caaa81b6c9ee0aac898f9a4d3541756/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/1545cd04f2535ef38461b65e81ac3e1295066db3/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ce9577ea4d017a17c1f0d23f7cf6284afe5acabe/
     aarch64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/497284b836bde8a6239ff7febd6acd5f87bdb1e4/
microblazeel |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/239c1fdf4b6ab72b143698cc76e14a155086277b/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/c400a063e8a213570a9f04462c462b93a8e97d31/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/bbfb189d2abfa6521dbd59820a0f790cfc5009f3/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/6a92471c0dabea615aa0b0787577aa2de791338b/


-- 
http://autobuild.buildroot.net
