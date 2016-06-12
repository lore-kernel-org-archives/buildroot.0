From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-11
Message-ID: <20160612063029.237EA101D02@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-11
===============================

        success : 201
       failures : 136
       timeouts : 0  
          TOTAL : 337

Classification of failures by reason
====================================

gsettings-desktop-schemas-3... | 16
     python-dataproperty-0.3.0 | 13
            log4cpp-legal-info | 10
                  boost-1.61.0 | 9 
                flannel-v0.5.5 | 7 
             bluez_utils-4.101 | 5 
              e2fsprogs-1.43.1 | 5 
                 log4cpp-1.1.1 | 4 
               linux-pam-1.2.1 | 4 
                wayland-1.11.0 | 3 
              host-libxcb-1.12 | 3 
      kismet-Kismet-2014-02-R1 | 3 
          sane-backends-1.0.25 | 2 
                openssl-1.0.2h | 2 
              gnuradio-3.7.9.1 | 2 
          xproto_xproto-7.0.29 | 2 
                    lftp-4.7.2 | 2 
           linux-zigbee-v0.3.1 | 2 
                cifs-utils-6.5 | 2 
                     php-7.0.7 | 2 
            lttng-libust-2.7.1 | 2 
                 msgpack-0.5.4 | 1 
                     dtc-1.4.1 | 1 
                   perl-5.22.2 | 1 
               libupnpp-0.14.1 | 1 
                   erlang-18.3 | 1 
                 lvm2-2.02.155 | 1 
                  connman-1.32 | 1 
sconeserver-bbb384404575f8a... | 1 
               libcap-ng-0.7.7 | 1 
                  gamin-0.1.10 | 1 
             netbsd-queue-1.70 | 1 
           host-xcb-proto-1.12 | 1 
                 rpcbind-0.2.3 | 1 
                  qemu-2.5.1.1 | 1 
                pinentry-0.9.4 | 1 
                 mesa3d-11.2.2 | 1 
android-tools-4.2.2+git2013... | 1 
                   libxcb-1.12 | 1 
       gadgetfs-test-undefined | 1 
                grantlee-0.5.1 | 1 
tstools-08f6be304040e7b8476... | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                     gmp-6.1.0 | 1 
                    mpv-0.17.0 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                  mono-4.2.3.4 | 1 
                    quota-4.01 | 1 
iputils-55828d1fef3fed7f07a... | 1 
                blktrace-1.1.0 | 1 
                fcgiwrap-1.1.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    owfs-3.1p1 | 1 
                 dmalloc-5.5.2 | 1 
                 opencv3-3.1.0 | 1 
                     vlc-2.2.3 | 1 
                openmpi-1.10.2 | 1 

Detail of failures
===================

    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/18c6a5dd18e8c724e456c029597a0e28c79f9511/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/219a607c507e158f457f3d13bfd13f7c814110b2/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/23ac08e52c35f55a868d3c6ec1a258c8055bcdf2/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/dc6b1980d18f1853366f7a16635e890d5ff69cfa/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/37c3a3f60c904e842666392f8f1ad65e4dd98664/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/211f3de8b72b20c270d1e425124752584b6f9f97/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c2040e6d5e4194251a1b9573859f67fc381500bf/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/82fe813c605a76289b2c6e08f2c4221e8d75fb53/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/82c37cfa66f02ed1843198957d1b6b5cb8ef4bd2/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d128298a811f265c178908a9fe0e4db196da8176/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/6d0c3f59fd35b52ce3a35ba1a18a1ad1903e2459/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/8264d2385471a669e0a6c48dc0bca639cf882654/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/662eab0f2173ca17bcfe016b2ef1f4a756f7902c/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/bd4c354eff6ef95097eae9e80c5472258a42b780/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d965e6d92ae48a96f4509218cf20c160eb38a655/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/d10ae547723a560dd026e3efedd79789b900b6b8/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/b7e9b3a2b0811bd24b2f06ab36f82bb5f5ff955f/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/7871bf4965c523f5b0b516a28947d0a82df738dd/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/8e4ae8bbcaeadaa5e7de0e75772f8488db278260/
        m68k |                  dmalloc-5.5.2 | NOK | http://autobuild.buildroot.net/results/cc4233a4c3f92275a4071c172330c920c35219ca/
        bfin |                      dtc-1.4.1 | NOK | http://autobuild.buildroot.net/results/9a6d012375c32ae2633a5dd068c17246f7c4ec53/
         arc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/aa7c1e7cc07e927e5460925aa06642ccde6b40a3/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9d77aa1dfae476eda2a1d9101af34f1854faf20a/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ceace2c927d1527969fce0ed079f6b0313191005/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/c0460eafcf007c29ef08ea90a8867d454f35b0ec/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/fbef0559056acdcb57fcc2dd90ec743c24c5d103/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/5a222497e3708e4d5cbb5401a7edc375b693e129/
         arm |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/14a882eea7d71a4cb769d0d13ceda246233f6ed8/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/8a23e8989cd8c7506278df69b6128ed0dca6b66b/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1ae21687d29c24286fc1edf0c0d1aa1a8f6e421a/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e7aea8864a947a796749b0f2b2b6e5eb1ef2995d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e7ad934be6bb23052e88d743ca8472b4044eb5e8/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/5397c8671f57048e6c48abd48ad49455888cc43f/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/429f6e6f55a06e9f49db15a18828c8113f9af68a/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/978952e3372226f0fcdb51675bc03d6b1fe5cedc/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/b58667cefa4952704f084528198e89a83f99b61a/
        m68k |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/fd9f04d5814e3dd196c5c678eab37f89c5494108/
        m68k |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/30ac7b7fdaa51c0fe4fcafbbb558d60cb3d9fe51/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/6ab5214438ab8a4396a1527d164327aea465c229/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/25485b0383baf6e1ca60a4e26cebd2633b97027a/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/4220a239e1395c1e4dd1bb8eb807e3983b853f40/
     aarch64 | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/c30c7685394195c4229e1b5ddb661da086d812da/
     powerpc | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/64275876916a7277ae69fadd8ec6e2577dbb49e9/
      xtensa | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/7f9643957d961459b837da3424eb61e9b8747ea4/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/8cb2d1a01ff889dbb4c1dfcd05da42bb5df3de63/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/8aa5f2140cd6f09680cb15857706fcb0e87a72a2/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/b355955003bdcd087cd71ff6aeaceaa6f5c75353/
     powerpc | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/56cb0bc43563534864f4afeea975b2667562a0e4/
     powerpc | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/ac13579ca3b387ed1985bca6f892e99084dbc927/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/e77ce0e16a31122e23d67adf2b044786dc034666/
      xtensa | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/01a02179ba3d51871ed7bdf965c3f6adadcb89dd/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/ec2c1035d6823adde6de4f7bfaf5e3a59223ae4a/
    mips64el | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/271a25e84b7bb6d2f1c1dceafe8400aba02b0980/
    mips64el | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/f8cd6f53ff54e0723d4b8c9b8ea897d68374166b/
      x86_64 | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/bac17117a17bf4f5482a5cee772f96e2aa25c9e8/
        sh4a | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/1f9d26b7cc848ca9fc494b29cbc549857fbf6d86/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/c9f6061ddef3ad05379590d9c338f70d556734b7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/dfdbced6285724e42eee9b0d5e96a3c1040eb75b/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5873c9170b200d42c97e5bd7d36f0c7de4c6358b/
        mips |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/cfedb47a48d3967992c53a4ac6c6088a7c2a749b/
        mips |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/01d2bb4b122cc602c546aa7559553ca3b7355f56/
        bfin |            host-xcb-proto-1.12 | NOK | http://autobuild.buildroot.net/results/bbf7a641ef3518d30d6c4884494da40ea948fd7f/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/27f8015c5dc32212fca1f143ff00a5ccc4310c96/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/486f3c1c53bd80c2a631217f1f1947385623f1b0/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/b52868dc373a879827b07ec4ab16a8a8a895fd51/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/dcd8f9ea4199cbdb06068132a35730d98563a6cd/
      x86_64 |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/662f38c036cf80d1304847910bd3c48b2c617fb9/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/c6d15666f2f102fd7195050a46784a4348f9b5bd/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/4df590198170f0c2ab7c60a23ee9dba0afdc54fd/
      xtensa |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/18d77f02cace4d821630d478efd9a8b1b3a0dbe6/
        sh4a |                    libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/4f6c559ca4426498c72238f9c4b6d5a11ad7d0b8/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/4801ba210754f66309437f5d0a9ddba1867a7369/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/6d514d9561bcd386fcc85e124a5dfed1d7a370d7/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/11919b19ffdd4abce2fcfdd508a038a34f406824/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a601e9814ad8a21d44271aa8981ba2d4cc92ab52/
      x86_64 |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/5dc2dd490f18a562a7e4b63b1fa20026ed5c7a66/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/02ece63c361cca4fe5a1772dcc6a5641b03d8d78/
     aarch64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/e2e38687df60c63df390d86e0da5f5c70aae4460/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/fa354417cf42f2713bb46ae2aeca5ec0c12f50f1/
     aarch64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/3286c09bd3f104ba1b32ebb4d51245534f0f114b/
        mips |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/faacd00a126955b14e794156cff01b101597ed57/
      x86_64 |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/6112677b18a245b930b84d1e830a6e36e8d1f5e7/
        bfin |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/9ebb2ed5171d5a1be2db06497a210e552bfad078/
         arm |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/dbaec6e87b8fe7378ff1549e56061beaa5d56f01/
         arc |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/69f2bceaa4bc344565470d0c777812e4bb5aa72c/
        sh4a |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/d63cf365391551e954676ffefd20adef6fe29dc7/
      x86_64 |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/1ae944eb74d5d80ec7e2d361660df53829f40ccc/
         arm |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/f8f3bb6efbc496b2891f632f1af1444dec6ca5d1/
     powerpc |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/a80e83ca58b22afedb8f2573513d373913c6a488/
        mips |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/d17da022c554e4a80d1b8fe4d2f1b74f8e745baf/
         arm |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/eb530f729d6a552caf1bb311621b8b0ecf211ea3/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/28c571d632d242519a8167fe559963147be65cba/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/c2c439696353a59709849cf0f645904129f82f24/
      x86_64 |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/264691eb41a2dab1e276e5ed3f8b3c7258267583/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/40b4ec6c14774125ecb7a7b5fd22e383468da8bc/
      x86_64 |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/94534c9f00e9d3324c0465b4d0d5833f57b45f96/
         arm |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/9c9ca9796c598ca5db67f4cf8de7070f5e4a08c1/
        m68k |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/d719db11210d42501332586b4485ab0cc1e125dd/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/f4cd830c32105d4f5df963aeef4ded3b714519ec/
       sparc |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/c93e2476478c0a02ec2ff879030a37dc4ca789b6/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/1cf017f1e87b46f15e0ba96057c8df77a38589b6/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/9e4ec0243dda5eda245f5e8c885a342000405481/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/04211bbf920151e01801f0ed7d6ebfa4f2739d92/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/ac4ad90f8f5cb9175e416bde6fdfb58555ea0c4e/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/7aa1637f7f7495e710ca2592b661c0d78db2d7a2/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/4c557cd815777f5ac7474887cd4755e099838bdb/
    mips64el |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/d44e1da2ffc943b17bd8b586366b245747e211f8/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/9dc7cc1c3e9f5e7a871df63f05728bc7bd8bfb8c/
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/1c5d8d8b4a51e39c9018986654d9fb369a2e1688/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/a9c70ab184164829f24bcb241275dcef2ad61ba9/
    mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/39d2da36eaad26d316c10884b00a01499296738b/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/d2aefbea376e98bb378bde053650214f57c29208/
        i686 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/b6668c385a98cce3d31a54fc71cc64d9a1c2d307/
      mipsel |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/d8881faaa5fbd4cee6a6a2aa0195b786ec9be7fb/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/599af385bf3e74f5925520c7e04106f39a0d1674/
     sparc64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/7eed42776e1587f00d8b3d4f5cce71b11bfe5eeb/
        sh4a |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/5f1a6801cdc8346c98c948a287361bcef3fa7b67/
        i686 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/5fc88447e032f8a463c27aac491d8b8f680e0a2b/
        sh4a |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/0a17b68210668214373fdf43511b0a19437a97f5/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/1399f78b4d68c1773dc20549af7c46aa6191a0e4/
      xtensa |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/2080b02f9a55636e622e013f7c1558e7d70283b1/
    mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/6125837311ed2ad2b899b6bb86c7230d39d8b226/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/16ead993ea80fd078a919428968b1a6c2845e699/
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ad1576ac5206f06968513e229bdfe41a3b88c4fd/
      xtensa |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/29ea10b2361400d2ae517d281a16d8b4618cd9ee/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/e11cee0fa301a3176dae0f4612f7fbb0c4f6164c/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/4e526d41f413dbc341b339a052305abd8cbdf587/
         arc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/9a183cd9e8dac27c5f7f6b312c76890cb4d54c07/
     powerpc | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/9ba81b5eb7ecc499a3c6ce6f7f3b31cf53e657b3/
         arm | tstools-08f6be304040e7b8476... | NOK | http://autobuild.buildroot.net/results/52d773f040adca7d36a7ef23fd4054ce8d235b26/
microblazeel |                      vlc-2.2.3 | NOK | http://autobuild.buildroot.net/results/1d34b7253ee9b538e85dad0185bbe7ace4c86fc8/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/83a06bdddafb1b487fda09b38870edcce9a87694/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/6c02b3b0aab899f0a6551d2e58cf19e1df0c53a8/
      x86_64 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/706a408370da4b435362ea92059f4847fa7988cc/
         arm |           xproto_xproto-7.0.29 | NOK | http://autobuild.buildroot.net/results/e7d64e5e35ee53a84f4bc9e707e2cf74c0e32973/
      x86_64 |           xproto_xproto-7.0.29 | NOK | http://autobuild.buildroot.net/results/12c7f8da91611a8a9bc971ec8eda18d6a1cec5d7/


-- 
http://autobuild.buildroot.net
