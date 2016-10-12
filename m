From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-11
Message-ID: <20161012063024.8CA3F1059C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-11
================================

      successes : 223
       failures : 225
       timeouts : 1  
          TOTAL : 449

Classification of failures by reason
====================================

                 glibmm-2.50.0 | 70
                busybox-1.25.1 | 37
                    gdb-7.10.1 | 17
                   gvfs-1.30.0 | 16
               linux-pam-1.2.1 | 9 
                     vlc-2.2.4 | 8 
                    mpv-0.20.0 | 5 
                   glog-v0.3.4 | 4 
                libsigc-2.10.0 | 4 
                    pppd-2.4.7 | 3 
                alsa-lib-1.1.2 | 2 
                   assimp-v3.2 | 2 
               audiofile-0.3.6 | 2 
                    cups-2.1.4 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
dawgdic-16ac537ba9883ff01b6... | 2 
                 lvm2-2.02.166 | 2 
                  cc-tool-0.26 | 1 
             ctorrent-dnh3.3.2 | 1 
                   dvblast-3.0 | 1 
                  ffmpeg-3.1.4 | 1 
             freeswitch-1.6.11 | 1 
                   fwup-v0.8.2 | 1 
             fxload-2008_10_13 | 1 
                 jack2-v1.9.10 | 1 
                    lftp-4.7.3 | 1 
              libarchive-3.2.1 | 1 
               libbluray-0.9.3 | 1 
                  libffi-3.2.1 | 1 
                libmad-0.15.1b | 1 
               libupnpp-0.15.0 | 1 
                 liburcu-0.8.7 | 1 
              lirc-tools-0.9.4 | 1 
            live555-2016.03.16 | 1 
make[2]: *** [libavfilter/s... | 1 
              mosquitto-1.4.10 | 1 
net-tools-3f170bff115303e92... | 1 
                p11-kit-0.23.2 | 1 
                    php-7.0.11 | 1 
                 php-zmq-1.1.3 | 1 
                privoxy-3.0.26 | 1 
                      qt-4.8.7 | 1 
               qt5base-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
           quagga-1.0.20160315 | 1 
                rsyslog-8.19.0 | 1 
                    ruby-2.3.1 | 1 
               tcpreplay-4.1.1 | 1 
                 uclibc-1.0.18 | 1 
                    urg-0.8.18 | 1 
                 weston-1.12.0 | 1 
               wireshark-2.2.1 | 1 
                     xen-4.7.0 | 1 
                 xenomai-2.6.4 | 1 
                xfsprogs-4.7.0 | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/115ed374e599fbd9bdda85a9164613e9df56ba4a
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/30f38e5fa7d69321a645d67d42cb1539bf1093a1
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/9ddf7ce1d8eb6278266d5960976f6541ce9a3cda
         arm |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/33ac0a0c1f09bedc26527e5f3b0b7b4c96757184
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/114ec23ec804b0da8a2c7a8813cbc1ed4c67f670
        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/62e00853a4fa8e813d25e37f3fee6e3d59f9bdf4
        i686 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/6420dd40ccbf22281642ca67442bf597394552a5
       sparc |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/549e0e0490fe6702f1889e0e884c8a88bc0fd976
        i686 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/3c39ebe5e1145bc4287476dfb0bc206dd0d8521e
      xtensa |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/bad97f85911e6fd4712741940bdd8dd2f50b2fd3
        sh4a |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/a52446981d537f28b28cf41a872d9e0fe0012f39
    mips64el |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/d64ed7af92d9116e28354a6d38f88ce53d2ca542
     powerpc |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/94943196c9f0802937453bb3e69e0581c304a644
    mips64el |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/c0ee118d55e6737eed8d44007883effaa0758837
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/746f38f286f8c689054608ad6c02cc5bd76bb204
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/026eaeaf68f540f5bb8b23f3a2618dbc532c2fbc
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/f57bb5db1137b72cd302e8bdfaa2e8f72e6c1667
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/818610a682a296034732a069d6a3bb214a98213b
      mipsel |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/52a35e3cf8adab0a75e06f0e92a9e03e6c566d0b
         sh4 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/53a1e5f67722b745284f03c16e69cf745753c651
        sh4a |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/b01d0e8012fadd3adee57b7098a3d649568d44c6
      x86_64 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/c495042918874668c1dd44d0f67f5f25e5e3c6bf
        bfin |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/fb94ded466531c85824bae555be52e40a17e6877
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/1fd6a97c91873c55063e650497647d9b40116e18
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/552f8bbd13decdfb044d9a3adb5866ed7c09f75e
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/b57e6ff1da2060d5e02dd5fd82463a2b66c1e022
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/290d331cbb0f6411e474af53afde69b13a2ef8a1
     powerpc |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/c3ec199b2895a516e4e2c9e0fe0d5862fb8353c2
      xtensa |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/8b08050794d1e9c4d3e3c971d21921fafbf9e157
     powerpc |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/ba4492eec2d95130487824a6e10af8779df0f892
      x86_64 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/17b2a62a9b9ec4d1607109057496fbbbd1ab99c6
    mips64el |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/6c86188f6b6c7a57c7374392aa3e8a23a07f2772
     powerpc |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/3f1a92e430f29421412d2c964296e1e44f4df678
         sh4 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/1c18e474b74e301ba1fc05759f8d233c64325a57
      mipsel |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/53780db18a53925f23381717343c27f68ce0cced
        bfin |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/89ef63486e866579c026aef677f46258fc16f00f
         arm |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/3ed840c4d6884f586d7eec5427c6cab5992574a4
        sh4a |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/b2544592be136ee19642fe560426412dad8a15b3
       nios2 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/48ebd7626d918dbfb8f35053f7853fac22cfb089
        sh4a |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/b493bb154f3ce8f0eed364977a108e18092e3b80
      x86_64 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/5b5e0fa9bcadc331d165d79e257ce96acf8ef646
     aarch64 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/6cb5cf39cdffffab368781790e07c619d492f9e2
         sh4 |                 busybox-1.25.1 | NOK | http://autobuild.buildroot.net/results/18db6f2d97cfe8de7aff004a7cda954bdd0a594e
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e0d9ac7e7ae4dfced13fbaa37684c17a00a04f3b
        m68k |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/4039808478efebdf9b91b18faa80e71cb1744801
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/2e7fa62b52df101bd0c794d236ed99bde42bf0e7
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/6653992373473ac66c5f46693bbc2d7388af93b2
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/e3d40d01710b182dc9927a83b82c58c41643c5cb
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/2110d93419bda53c0121b74453c6c335c4886972
        m68k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/b5c8db333f3b482f6f7e5c1bce8bf4ff3d34eefa
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/15b634ac8a7990b5d7f195188aeacb70cf01e228
         arc |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/2579489ce72208f081217e5affcb81f691802aab
         arm |                   ffmpeg-3.1.4 | NOK | http://autobuild.buildroot.net/results/6e7d48b75149f396f1bd21f7a7745368d3522bda
       nios2 |              freeswitch-1.6.11 | NOK | http://autobuild.buildroot.net/results/ebc35b94de9e59b8f66dd0ba2c57dc8205254ecd
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/e4c04504df597a6a4dd29cff4d50fe9fa9d14f28
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/416e4c073b8d09b025a3b6fd0d694f6f88cd7012
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/00196fb92a5e25aefe2f3bcd48d9432b49077000
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/dcad485dfa50db32af5b12cfd32c0c0594effec7
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ea78753ca5c4bdf2d0c8927c12e2aa1969ae0941
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/749129afca56f9e7260030990b8d23db2b02f751
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/641ea89842b9e0bb50b1238045150c1b1584031a
        mips |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/d0e88b6c5d5ab352b9a14db8037d5bd63adbb8aa
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/b9a8cd06c270e81395d06b6ab594ba0fb7f57a15
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ece1fbdbba834d1a79b8749fd6f5765c5f8977e7
        i686 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/52d2d8b76916ac937eec54060ef80268c32d2361
     powerpc |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/bd338851b3fee3ed73d2e91e3d1d48b3d878de58
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0a2b49bd4445242edc8424e3487bcc2fad683fe1
    mips64el |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/0882d74ea31c79b87da5680b7f9933b7d8c3803c
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/5184beacd785af88953ccd7f3774512daa3a827b
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/06c2ab4f365988f9a8b027e026b3f0f5c0c3ea3a
      mipsel |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/608020adb9737516b28f0173ce93e9117e4446b1
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/11cbed6d4628d1619215e4dc71fa057f43e798df
         arm |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/13e97d727e64541e64648a7c1eebf8bd629060be
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/b3e6f39a6367ccedc98e6b8feae1bf54e813dc61
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/dfea70f16cdd4556aae2d875b97d24de06561ebd
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/901cf4e1db57df42e46ebc9851cbb113615dda18
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/7fd72f1a5264067680619ad43d35c85e43717e25
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd735f89de624450e22f07f2717bc86cfa5d3b68
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/199d900f2bd15ec1a3e29a7c7100917562e48212
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f482a73c307002293d5d9f39169cdbbf54c586fd
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/baf5c41e2ae62891abc7f6f8f24569a1f09e1026
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/3f3666f4e460617d75ec04ab2e2df529e3fe2fc7
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a54438899e16c1ffa53526a5bfd961f268a8b297
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e728ec0c09db2b1c58c5dff101dbe0cc99aabb27
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/f7a6030b10ab0e169188647d508c83fbb90b80f0
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e4cda1a224b8488cceebadefd14c06f5b31852a7
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/925dc27a66e5e5a1e45ea7992a69df559c7fa7ce
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/5922ccf326389a5f28068517405037a4081554de
       nios2 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/47bdc86c1f385ee08d1592e8589bf0f0258ff4d0
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/12b2f5305166115900404b9478772fae13c2a541
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/912f1026da051607800802d79ad3ae8d5614dd98
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a93e2982ac96d55d212af29fd9b7be59b3f57804
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/00410b13c0ef70ec9c0f24945818e2df81f6c434
         sh4 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/132181861acaebabcdb66f4a6be3a0caf537c636
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/8c3378fc709eb53ee441570d189c43279b9e2b8c
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/b525410deba17e0498378c0adcd622750420eae6
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/031dca390182fefd4ee3fc65065674f8006d0311
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4f251a5ce609604c4babecd21ac7e2e824343f2d
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1eb890299b6b797a4f9b8a9f8381c13cc52aafc8
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/1703a3a897a27c61d1b1925509edb61837a60351
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/762f967cb05a5fbfac7266e633d260bfeeb179ac
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/eba0cd3c7e4777dfb5a1ab5285979ac82c96f979
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/bd62cdcfbcea6106f289c342304fa59e54125f81
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/9a75c3d0e5b59ead930244ce3b7e510a0a746a3b
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/444b31b7bfe94482e507ada6a69965e9dbdb688e
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cfb54e77778b24032bb40227afe757769f06efb7
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/421009df563cd232b7e3ef6b5ac569d4783d9778
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/dbf7f90b0ccecc70112747227e29b464a43bae3e
     powerpc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2806051472e388d41f22889e067e3057f6af6900
microblazeel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/225e3b7c0e83d92dc529e73fad26d891d12ddde3
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/89f3d28d08551d967d9ca1427fc1d70c463cf395
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/27960460b4f5aff394f2dec231dc5dbef49c430e
        m68k |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e64d2e3b5ad6169601848cf840bb0dbd42a2726a
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/5d18c1380a923753d8a80a5647231d82e8a7447a
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd4aef69d609955290dc2d1cca9d166705382a44
      mipsel |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/5c58c770002c87b0dd5e12e40bf0a1ec35019935
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/550d8a1e53bc740ee9b1337789e40bf03ed8cfdc
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e18bf2660336158a8526580a3a547878461c71c1
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c22eb26689cc39b1de580de9115f00173d700e9f
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/158b73edc13bf129a4ebd8de75709785dfabd90d
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/77afb84cf08126eaeedefdbd8e0a68a81ce09182
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/72b8d775dce3293b037cb7ac77bcd3a0ecff4b36
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/c7716bf8d0e71c47af2913666753c6977b1ece7a
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2720b87d36cdec1c91709c41c3fb3763d4919826
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a0a6a0259abedd85509abdfcd758c050a6a54c58
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/966cbb6150d49d46ef80fb92e0333f1918f9534e
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d60006f16babe7f3703ab960687974c1bd43ae20
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/df6cfaf1480b1bb69ed10e7325cd258b7631fd67
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/29b9b38bafc95aae216416ad9ec2a16c04e56915
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/a79b09c229d70c45b6927330d99a80a2bdec4089
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/d44972c1185208855cd80fae039f2113667a2e61
        mips |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/54076897178e77ddc196e2c5af980019e6cc55ff
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6d4cef4036fbdf296ad63e703a35eb7af5722c6d
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/76f0e1cf10e71d46240f1e694206a7814298ae8c
        i686 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/ccfcd3b34da0fe3f6c4976ed2fbc5d0de4cc71ba
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/bb1b11facf976d897cce62891b5ecf5e2251f4cd
         arc |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/371927bfe4d75a8b28dc72ada89cb6edc10be4a1
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/07f0ad503c9b8f54024f49df8e85bcbb35801848
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/383aac5b04c8a8e6e4ae16d27d7b713a132efb35
    mips64el |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/e1932648556d314b921cae195c3a2c38bc46e8d2
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4172850ad103f08caac7deffeef8b3d84174e88f
      x86_64 |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/2136ff84ffaa5d53257577505d573b58d4896ac4
      xtensa |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6b54555f82b243ba0c7b2c49de8ade519183033e
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/78893800595a134a563e41e19b6410d5d7585d87
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/b351ae20148423daad44dee3da3a0f54b654d8bd
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/245737dc172e37e9c0d8d416ce06f0fc47d6b764
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/3943e4b0661b29b17fb18d9cd2e9435836afa315
       sparc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/350dac61c5b82485c1b75ea6c400c27b3d7426c2
        i686 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/5beb1674dab64d95cb4e8b8eca558404450bebe2
     aarch64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/1dca6ee2ce21fb1c2d8b84ccc60783d567713e45
     powerpc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/b111f007d85f7b41306572dfe97bf83ba12479f8
      x86_64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/76f0227b4044816877f328d199c831659846c166
       nios2 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/8ec610aec5c89dba529e2aca9efd2c8593fe6b83
        m68k |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/6755a4d9e1bef3d1781ac252a78174e784846a00
     powerpc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/f12620bc28c786dccc41428991242ed0e4a9174e
         arc |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/32b43d5271fc2ca7ef8983627ba084f2ac50b299
     sparc64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/8672131a015d18159ae2945bccf732e15a3b0a3a
      x86_64 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/8380f3b2646ed80ec27a24227bb7233ccee7a6c8
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/2d7cd80c84f0758b459667c952a53724243bd5ea
         arm |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/fddd3da8b98ff540dad2591e03caa9df8698c039
    mips64el |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/4ed1d5bc179d1800773277dea974bc490aaad669
       nios2 |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/98164488da9b96eb452f86c88cee288df3d95b84
      xtensa |                    gvfs-1.30.0 | NOK | http://autobuild.buildroot.net/results/d45066437678e2937e620a4904e66b3796fcac2a
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/155493b08f241f61882bc6c8de6ba29430c0e91d
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/123151c3d4ab50088ba7dd78e743a9f03b950013
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/451c514ed1099b5b8a69bdd1b3429155edbd1925
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/8b0ab2de0ca902e7e7de2fca5f05f54b4389c753
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/ea45ff24f123aa79d92d1426dcea36017b93e08e
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/ae2cecc6cc8534591d0200a83b9c352c4cdf064a
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/ab07b444038ea4388c47057f1be713bf6327ed89
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/4d67be931e278bb0a388350d684c749b76e63b3d
     powerpc |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/60d2695121a10811198da11db9531e7d79227b94
        sh4a |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/33fd21a30bbf481e4d76ef5e67e2997033326341
      x86_64 |                libupnpp-0.15.0 | NOK | http://autobuild.buildroot.net/results/a85310316108ee219c77c9e315560ef44e23c549
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/47aabc219a2fd50105881b1e2715f7eeb1a6a588
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e8b6abb5485c66d5aa12715a30241182b812edcb
     powerpc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/aced896ba4ea95cc5e44c2a5cd44fa73a7c63e4e
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1bdce97a346431f9543f44830ccba80c9f28dbcc
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/3f3536488e07c23e7fe505dd76129c3777a307c9
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/d6ee57631f95482467d74633d8e086f48a556ce8
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/891ba553c4ba9958bc88c7565e1b5ca09da52fae
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/341f363af36927f7cfdcf88479b0c508e57403c4
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/aef9fefe6bf68dabfdcf19ad5b344a7aaa5877b7
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/c201859950f3989de0df132fc61fec042df0909d
      xtensa |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/c85cd5547c508a9158042de2840854a9ea1fda6c
        m68k |             live555-2016.03.16 | NOK | http://autobuild.buildroot.net/results/d195537f765590bff7b8fa2ddaa2308ed17c2931
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/e343072556bee867140e8c1211e4685a547f7a0c
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/2b5b12a4aa2cba6c78313b31a87bdbf588160834
microblazeel | make[2]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/7f0262ca7b6ba47d007b28d269ea30f0707372a0
        m68k |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/030ef0a9bd51a2c52d6026e0c1e383a9bdae3c4f
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9c6f1e6d9b97d123d6161ce07fceb66e003552fc
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b98b09929e61c106c5e2f6ea9a964be0fc7721a0
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/e7bcf7f8501a51605064d50ae3556d25e2e908a7
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9f4e6a14654867796ca55163c028929b2564c438
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/75be524c3d76b9335f266211b684133891c4834d
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2d28b56a1559162671f179741e46ba6f88ed7fda
microblazeel |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/8c139abdb536b28a1a1433091b8488a33fffce77
      xtensa |                     php-7.0.11 | NOK | http://autobuild.buildroot.net/results/0fc6878d66968db238edc8ac69e295588db07e80
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/81b6c82e63b9ca1a57ce7aa3aa13e10070c018c1
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/a0c6358fdcdeb9f50b0a30bdecb71886413df9a8
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/ae8c72a2846519d14a19bf6113127c152353ad75
         arc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c698ddb9f0ab919e940449be6c98d59bb02e5647
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/f1ab4eb631067c0d29a020cb977eb6a09abbfe19
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/089bb419c92474cad22b6690a5a096681d5c9b4c
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/7b7e6e5db60a9b9ede42908e096b904ad9961cd3
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/cd1d859eb1580cd74acca03f6eb5d78306f1ec75
      x86_64 |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/e3dd68affb04504400f398276aebd601e2bb740a
       sparc |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/99df848e1afeb2b9b8a2921efe3cfd2ceade093b
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/c64f280b02872e9ee2f7a2512bf7beb9862deb9c
      x86_64 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/a5291a396332f08328f6030164468983a2f47e13
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/f995fb54efa56c6ed2e1bc759ea97fb44b2415c2
         arm |                     urg-0.8.18 | NOK | http://autobuild.buildroot.net/results/a81534a1e4a7ef053f5a97e0f26312849ed19375
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/077657e103e891dc9475270854c21b9a99087007
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/a550b9543060e6244d33b7a3f898529dad8b6aab
      xtensa |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/e30f1a27ce27e1df46baf3d8b08132ac8d80e3de
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/7e8f6fa5c161b435d448816921418d6a67e7d28b
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/bfa10eb162998b948d775cc613d5cd4dc612c137
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/391eb0ca86680f4a9320f13fb8202783f7dd4293
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/23035d2a2cece8012e450de36ce506b03c31fa46
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/4dab7da9f92e5e8dd9de8b2d4faf3ee46f6e5f92
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/87521e9a313c281034d3f9cb564b8b90d6b664ad
         arm |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/3e0b8788db90e15b8c18cf5155510ae3878f59c3
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/779acfef26f62a6d664c9c78cf8c540960e6ccdd
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/b988bb1d49250ecacf418748856b85274774ff9e
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/d80d0bfa2c73e192865248c827b07b0fe308a521
        i686 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/2219b9a9b74897492908a75d317a8365a2392e44

-- 
http://autobuild.buildroot.net
