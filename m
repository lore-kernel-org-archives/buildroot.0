From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 08:30:32 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-15
Message-ID: <20161016063032.BEDEC102960@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-15
================================

      successes : 160
       failures : 93 
       timeouts : 2  
          TOTAL : 255

Classification of failures by reason
====================================

               linux-pam-1.2.1 | 17
                libgpgme-1.7.0 | 6 
                 hiawatha-10.3 | 5 
                    pppd-2.4.7 | 5 
                     vlc-2.2.4 | 4 
                 jack2-v1.9.10 | 3 
                    mpv-0.20.0 | 3 
                    qemu-2.7.0 | 3 
                   bind-9.11.0 | 2 
                gptfdisk-1.0.0 | 2 
              libarchive-3.2.1 | 2 
               libbluray-0.9.3 | 2 
          motion-release-3.4.1 | 2 
                    php-7.0.12 | 2 
                      qt-4.8.7 | 2 
qt5webkit-b889f460280ad98c8... | 2 
          shared-mime-info-1.7 | 2 
               wireshark-2.2.1 | 2 
               audiofile-0.3.6 | 1 
                benejson-0.9.7 | 1 
                  cc-tool-0.26 | 1 
                    cups-2.1.4 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
         docker-engine-v1.12.0 | 1 
                   dvblast-3.0 | 1 
kvm-unit-tests-0b04ed061003... | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                  lcdapi-v0.10 | 1 
              lirc-tools-0.9.4 | 1 
make: *** wait: No child pr... | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/s... | 1 
              mosquitto-1.4.10 | 1 
                    mpfr-3.1.5 | 1 
                 opencv3-3.1.0 | 1 
                  openjpeg-2.1 | 1 
               qt5base-5.6.1-1 | 1 
                    quota-4.01 | 1 
          sane-backends-1.0.25 | 1 
                      tar-1.29 | 1 
               tcpreplay-4.1.1 | 1 
                 uclibc-1.0.18 | 1 
                 weston-1.12.0 | 1 
                     xen-4.7.0 | 1 
                 xenomai-2.6.4 | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

        m68k |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d727cb7f89c71e7f873341ab4a21e247cdd309c0
      xtensa |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/25cf75b98035727be6c7e4dcb81cf054db76b76c
     sparc64 |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/54bbe31a2e33168d6ab1285228d2951b10a5c6f8
    mips64el |                    bind-9.11.0 | NOK | http://autobuild.buildroot.net/results/156057008f289f1743540662d13b52df0a7e85f7
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/79bb20f5e3436b8dcbb5f4ea60ae8d2003df725d
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/2e591b9d8f3d471580f5aedc1e6c768548cb9539
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/802c9da856c0ebc8c132381259ef99ec12301a76
         arm | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/6a44547abf85c6d98fc45059b598f7f48d1a97f0
        i586 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/995e53c429f2cc86f30e13d35eaf8921379226fc
      xtensa |                    dvblast-3.0 | NOK | http://autobuild.buildroot.net/results/456b1fcdea7ec6e593dd76ed7780c51714e798a2
        m68k |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/f60b76777db803dd8b45eadf9c93accc5a576456
        m68k |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/c8dda410656130b2f10bf38c449fb60cd1273461
      xtensa |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/54b2c7df1b1d2edab5f4925455248eaabea7ef87
         arm |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/8e0d749daeec2e84acabd2142c7cdd181a8ef621
        i686 |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/43d9c469057d50ea2539ac20bddd60700a0744fc
     powerpc |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/8d77069856620ec0e95a2e9bd865be08180fedff
         sh4 |                  hiawatha-10.3 | NOK | http://autobuild.buildroot.net/results/a66307b2fc82cfa0426523e1f2a4da90ccf9e585
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bf5af9dd47e6556369fb22c6d131ed806ce20d1c
        m68k |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b47fabf62885e7cfb22f48223732d4d095378ae7
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/39e26ae07ddbd9312fbe08fc63705ed589768fe2
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/32e2010e4a87953c64b16cdaee1d52f475fec7fa
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/94be7865708a37bbd53bd4ceb782cdea5b9439bb
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/a641db51564a92def7a3ec8e1bb5ecf675383762
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/e88f213d103ba991e2b428ac5e5efcda34ef0901
        bfin |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/f815e09bbd6fde72e48437bc6a6e9b9647a992e0
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/46f284ef07953c84b0646270549bfeadc016fe95
microblazeel |                libbluray-0.9.3 | NOK | http://autobuild.buildroot.net/results/2a916965a798e6cc194fb56e7ab0d89f6c8da234
     sparc64 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/12293ec60d0a44dcadb1d5700d186b5ea9d24f45
        i686 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/0452b6a3efcf5fb580ffe7f8b0ee024d750a0705
     powerpc |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/60fd62d06c8de4c6c6162bd90c0b175521ad452c
        i686 |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/fdc4c8f2b8d0ea445f1603813acd30e87be72a42
         arm |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/410559f6bc7f021fa42dc3aa9aa5a6376a3f54b3
         arm |                 libgpgme-1.7.0 | NOK | http://autobuild.buildroot.net/results/d8e345bfce5317463fe92134964a920ca2346464
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/4364a47fa3944444a299b0edae583029fb4c49d8
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a8b1ec49181b01e2332f9d4afb1fe4f833338b27
      mipsel |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1a16b013c44c193afd27e2e0cdf339e465f8eb54
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/c6771e88672277c3e5992f437b687e13de0da827
      mipsel |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/b5747fffeaaffe4546d9f069f4ac840163a0c532
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/41ab336b996ed0d3f20c5d6f86fbbca7e1350094
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/19343e94380d565b860deaf7280c7bea25d95af1
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/1d1402923c31ccd709c571f4b5f7850adbc05876
       sparc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a9b4e271607b3b14749ce57a60b0324f6a5d1bf7
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/973775880f28c87a2306653b30b3c9d9da12fc5d
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/44a4466d064d05469d258feda1f9e6ccffa9626b
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/4a6dd94805ed1d5dcfd64b6bffd84ac667aa404b
        m68k |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/2da4b6a07635dad978a436ef675763509a390bd7
        m68k |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/164a6f5184b8e30e3918da144b0a9af7d7f8b708
      xtensa |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/e9892dc1a432c9b258e0d07ce45fd4a14fc25efd
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/cd37cefd873e2d6061a03a7f9bf8749e015f699d
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/7d58403d131bbd3fd9d6b90d3100b2f7d90478cb
    mips64el |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/161771b193df29fa6401ea73cde6662a0e81301c
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/cf0063494362029b132bcc2637114478ab09750a
        i586 | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/220d301c25c7f54a303e73901c70c287f5b51613
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/ba8c8897fd68c4cd6b2ae6fd7dfdcecde95faf8a
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/54ee0a6f68bf075a81d8a8b11a1824bb9a6d305b
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/513b2b6ccfe0533191bbe4062965b7bdcb9a7225
         arm |           motion-release-3.4.1 | NOK | http://autobuild.buildroot.net/results/d7a9a25a765ddb1c231735f4f3994ea6e7ea24ea
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/d7cb68757f8f7dfe1ded3b4e78432e55f6eae4d0
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/7327695ec3550e361e4e71031b93db1f07abe8ff
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/33a76dcd5a76df9a6a391d2e93f1b4d311bf7743
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0d1cddcbcc38c70082860c03bf1104963d55d3b2
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/2f441a2eeb7cff457bda86fb37eb248936cd5215
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b9c5e5c47dc104c205915fa5d905aeb5ee4ed43a
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/9249b54cc83d176c484cdfa3b16f60679374d218
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/b3f00309186be65191a9190164a768826ff658c3
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/d2d05489ba1a255cf972ddf9c0d1dab6af513b91
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/482941c523ced7af2f765fbcda0a2de95c84fa67
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/481c564f78233664cd87875eb63dc37815ab416f
     powerpc |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/086065d2ede9415187c7607016ede9f57b0a43f6
    mips64el |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/082424533ff2e5a225080c4234a24786536e3c24
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/6bff450bf5fd5d796d153826e1903d03840db6c5
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/816ab89ff131aceb3ef8895fbf0545b45f7b9114
      x86_64 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/42104209e734f2353982bbcdae81655d705b9092
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2bb977e4b24065f8eb8ffe57d4d596ae9ebe38d8
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b5ccb349f1e6e19067fa306cdf9f6e6e60462f3e
       nios2 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/04253b2f45a7cfb08e04cd9263f53da254d954bc
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/2f0dfb0015c37ca1f406b0f66abea6d5bd42fbed
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/205565536ba9715e334b7aa401ee29a6abb3a847
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cef7f7750afe420a012678a40806014f5a7da2dd
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/aad925488ada6db1b690be1d7c7aa06cc8195be2
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/e016da7dced4bc1806ff45fa3d7411df463b271a
         arm |           shared-mime-info-1.7 | NOK | http://autobuild.buildroot.net/results/ae65330b227a951d6e6bb2e89bf1177ea17aa703
         arm |                       tar-1.29 | NOK | http://autobuild.buildroot.net/results/6329d3649cd936284c8033cedc65df882d85d66d
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/118940b1a4b400b6f01a34d98e6375f878e5f5d7
      xtensa |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/77d17c787484a7ba798bb524ac7db0d95cc8fc6e
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/9e930f180df844e1059a6ff17a3925dcea9f1ec1
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/cf8a58892770fe1803cc0bd5782665b5f341b310
      x86_64 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1ab907821d267fb867edfa18312d99852b342c90
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d1983f94e66ea58e246027a234aad96653ea22a6
         arm |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/d4bce15ff852073132ef2dfe8d505f6aea18b0e7
        mips |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/196b96e28a2cd5983a58948df4a2c3eb3bccdfa4
    mips64el |                wireshark-2.2.1 | NOK | http://autobuild.buildroot.net/results/981bc3ca65d0b79a77afa0fddfb0408c06716a71
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/5e6289bd515438b9e5299ff1eb37f2964eeece2c
        bfin |                  xenomai-2.6.4 | NOK | http://autobuild.buildroot.net/results/d9d23691ea5e326fc19adcbb1927c4a3739d8db2
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/260b09867ff3c9af8c4ef5abddbe2adc6ee945ad

-- 
http://autobuild.buildroot.net
