From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-01
Message-ID: <20150902063014.24B5E101990@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-01
===============================

        success : 291
       failures : 58 
       timeouts : 0  
          TOTAL : 349

Classification of failures by reason
====================================

                host-gdb-7.9.1 | 9 
libbroadvoice-f65b0f50c8c76... | 5 
                  libssh-0.7.1 | 3 
                 qt5base-5.5.0 | 3 
                  ltris-1.0.19 | 3 
                  mono-4.0.2.5 | 2 
                  udisks-1.0.4 | 2 
             ebtables-2.0.10-4 | 2 
                 opencv3-3.0.0 | 2 
                 dropwatch-1.4 | 1 
                 libssh2-1.5.0 | 1 
                busybox-1.23.2 | 1 
           libfreeimage-3.17.0 | 1 
                     znc-1.6.1 | 1 
                   erlang-17.5 | 1 
               dvbsnoop-1.4.50 | 1 
                   squid-3.5.6 | 1 
                openntpd-5.7p4 | 1 
                directfb-1.6.3 | 1 
         qt5connectivity-5.5.0 | 1 
                   mpd-0.19.10 | 1 
             bluez_utils-4.101 | 1 
                   dhrystone-2 | 1 
libsoundtouch-010a91a59071c... | 1 
canfestival-7740ac6fdedc23e... | 1 
                mongrel2-1.9.2 | 1 
                minidlna-1.1.4 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
             sredird-2.2.1-1.1 | 1 
               polarssl-1.2.14 | 1 
                  fbterm-1.7.0 | 1 
             webkitgtk24-2.4.9 | 1 
                libnspr-4.10.8 | 1 
          sane-backends-1.0.24 | 1 
                 mesa3d-10.6.3 | 1 
                    ustr-1.0.4 | 1 

Detail of failures
===================

      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4e4cea0234e6abf5882296abd5ceeda6ccab89b0/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e8a8f4346fe997bb3ebb44e6fb8a74e02f445481/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/89f8b131758adb7959c518fca46c80196ae7096a/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/29c274be7970e01353e0323f893903246869e4aa/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/a5c752ebdb4e7118f22993be0538cef1d640c2bd/
      x86_64 |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/07b3662af64c45807f45fb349ef861c025ddce1f/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/41832bbccd51224d4bafde0fc3d374dd0dbee999/
         arm |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/d179631385f4bb309321d13c0dbe12311c6860fc/
      x86_64 |              ebtables-2.0.10-4 | NOK | http://autobuild.buildroot.net/results/145dcb42c9f2cd30d18dc8b571907449eeb4e682/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/b6900bcdeb5f152488dd76f7c978e1d2a9dd521c/
      x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/e2bfd86b3adb2c0db64b6e22edb0b2222f58ba74/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/adc0880d4b9cb5b415310ed2c3086fda87213e4a/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/aefa42e6b5f46d6884e7ed63bca8c1226e6f29ff/
      x86_64 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b9d9904e9ef75f45394eee456cd3c4b07da52caf/
         sh4 |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/b9e9762950a6009482c4515b190bf7c596526dbf/
     powerpc |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/f9e6479731056493e0fe1d2e0b8ef7961e3f3e6b/
      mipsel |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/5d78bb59d16ff91fd4653f1429c41e737b2554b8/
         arm |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/44351fea49fb6fba6a6ccaf43e3ca663674d6186/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/c73dcb8b0dd9d316f8f36929f506c41cb0232d74/
    mips64el |                 host-gdb-7.9.1 | NOK | http://autobuild.buildroot.net/results/1f1ca535d23a7f4f4bd095c6775517419be71c9f/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/52ceabb41e0b4ef18fb923ff5e0603583a43659e/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/1f0a77995a7f6befcce74110bcf2c54d102caaa5/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/d68279db925a3a06486df10f214e43877e745b29/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/a9b29923bb9a5af92b5332f1bc9e2ea546bd63db/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/4f3b3135706dbfd1184e128179a27b78864c9431/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e89fdcd4aa2961b8ac6f405e49f92395db06ff52/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/d8bc407ec5b78635db9f469e0ee251281f5d1131/
microblazeel | libsoundtouch-010a91a59071c... | NOK | http://autobuild.buildroot.net/results/1c0d433d435639f4355098fc6915c3588f922cad/
         arc |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/3231772f20a960eb12d2e4ea10687f9c635095cf/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/bbdecaf3516170f2fffbceeefb214a7df168e32e/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/1bb4a804dc0070124a519351b2f74a7f37c45d5a/
       nios2 |                  libssh2-1.5.0 | NOK | http://autobuild.buildroot.net/results/99ab80703f8eefbbab81537edc3e791f209535b9/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/b95bd1edbc40de4cd6872a6511370de78001bbfb/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/83d96ef5ffb1167cd6b9f586034a340283b5ef18/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/4b248bfa6d9d64f54569a95eadb9eaea317b362f/
       sparc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/9666e5ba9fa564346c0159dc970b089dc0ad9cdd/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/af715d1122ee672c48cf11216a950fb61094f7ec/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/e4310da3ff325b5c51f8c7da06b30f354561a703/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/bcb410b4e71c3475d09774f84472cf82293d826d/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/c2b50e426f6816927c3fc3324582323519698f61/
         arm |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/02ffbde4ce200e9186d761289d2a0253506cf275/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/1d3c74e7b61118c9b62cf4e58ba6e3f3eae17d92/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/95aad15826ca77e8167a995f633d2889d741f710/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/a25591333336730cd98985c75c3ce78e86f1a153/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/7c400e224ecdffc0b393f26c64c0845ad8ac15f5/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/dd14adf070af986844510139882aad7f09f0a4f6/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/8a2cf84cc120db42e098aaabe2b2e93590481dc3/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/ff084dae46567d3e174992ae3f77d6367682c171/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/0699ee0963c0f15b6069861f85b2534310a97b77/
     powerpc |          qt5connectivity-5.5.0 | NOK | http://autobuild.buildroot.net/results/6342b4cbf5173103d92cb72aabf8630d5bf9386a/
       nios2 |           sane-backends-1.0.24 | NOK | http://autobuild.buildroot.net/results/6036dfa4f8d594bbf3a16ad7de8ce690b8216288/
         arm |                    squid-3.5.6 | NOK | http://autobuild.buildroot.net/results/82252b6040f118a1bdf6d41cd2ce6395583a073c/
         arm |              sredird-2.2.1-1.1 | NOK | http://autobuild.buildroot.net/results/4bc77733d235ba12f70432be4ead921666f5121d/
        mips |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/ab36c2a1d2ca41a4d9ec6bab7d8d45678dbc5dcd/
         arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/e5bf611b6870f55082a892a2e5536cf11af81273/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/b5aa1cf3052a1e3045edede0d8660a90bf732be0/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/c8ea1cab0a1ee081f9bca994ff5309ea0117d692/
     powerpc |                      znc-1.6.1 | NOK | http://autobuild.buildroot.net/results/aba13674fb3624e0bd6a3b1e17f28883e298c8ca/


-- 
http://autobuild.buildroot.net
