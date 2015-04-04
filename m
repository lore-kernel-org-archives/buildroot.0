From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Apr 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-03
Message-ID: <20150404063019.29848101497@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-03
===============================

        success : 213
       failures : 63 
       timeouts : 6  
          TOTAL : 282

Classification of failures by reason
====================================

freerdp-b21ff842ef3de583751... | 7 
                host-gdb-7.8.2 | 4 
  toolchain-external-undefined | 4 
pulseview-19be0af16af83ca10... | 3 
                libtirpc-0.2.4 | 3 
                   strace-4.10 | 3 
                     eudev-3.0 | 2 
                  boost-1.57.0 | 2 
             bluez_utils-4.101 | 2 
              host-vala-0.26.2 | 2 
      libva-intel-driver-1.5.1 | 2 
                     vlc-2.1.6 | 2 
                  python-2.7.9 | 2 
              drbd-utils-8.9.1 | 2 
               libcap-ng-0.7.4 | 2 
                  uclibc-1.0.1 | 1 
              xlib_libXt-1.1.4 | 1 
                  dhcpcd-6.7.1 | 1 
                 cdrkit-1.1.11 | 1 
               alsa-lib-1.0.29 | 1 
                  tstools-1_11 | 1 
         erlang-p1-tls-53f0478 | 1 
                 qt5base-5.4.1 | 1 
                 clapack-3.2.1 | 1 
                collectd-5.4.2 | 1 
         network-manager-1.0.0 | 1 
            host-heimdal-1.5.3 | 1 
      host-gdb-arc-2014.12-gdb | 1 
                 python3-3.4.2 | 1 
                espeak-1.48.04 | 1 
                    ofono-1.16 | 1 
               libsigsegv-2.10 | 1 
           gdb-arc-2014.12-gdb | 1 
            gst-ffmpeg-0.10.13 | 1 
                 fio-fio-2.1.4 | 1 
                  qlibc-v2.1.6 | 1 
                  snmppp-3.3.4 | 1 
               openswan-2.6.42 | 1 
               host-qemu-2.1.2 | 1 
                    php-5.5.23 | 1 
              postgresql-9.4.1 | 1 
                 apache-2.4.12 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/64b07b607693368830ef3ab46ee78d6062bb6557/
       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/dd43e3fac1c372e0298716af64307dc58df7a6c8/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/d8ad1788fd5b695e7349b4c12d76c4188d84f3ab/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/7cf3f393540fac762073ecf2f627fce5d85d7222/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/5fcdd64fdad250bde494eea66a129b2e42c70b53/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/0fe7c4c205b6b9db1764dda474678ac227e2d865/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/15798a489563daaf45abccaa990eb9eaab93eae7/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/51bc68f5fd9dd36367f086639d80ddade8631057/
      mipsel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/7b74c4522b842d8bd6276095e1470c74838b1a93/
         arc |                   dhcpcd-6.7.1 | NOK | http://autobuild.buildroot.net/results/de043a8167189df2562e4f842a6aba5f647db3f6/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/0d39c5e097c5d58869847d188fa16fad070bb946/
    mips64el |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/a69032d30da7a7873c0472a35ebb8a412d63753b/
        i686 |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/32d80f64bcb02d453c7364d24198c4eba8ddba3e/
        i686 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/7a087d9d7150c0176760ca60905eb7cca9cf1dea/
         arc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/54f046e433ce11a56ad2426a01b3da010aa7352a/
     powerpc |                      eudev-3.0 | NOK | http://autobuild.buildroot.net/results/11ebb926b891862e270b9cb39fd2ed4344b736a8/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/5e8cc28da6a17dcb142eb6d8a8cada735b211e2e/
microblazeel | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/ccaacae8dcb37942facfb8b28aba868e620eb83a/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/000e20b342076df839bc1ad029f8ef964f72e2d0/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8eb24ea9868dd556c94eaf17b1efa292a1382d7c/
      xtensa | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/70301b554d8c382177ec41c56cb8c66260e0ab12/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/8fa1bffd45f5b1efbbcec14827a0638ea177862d/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/7c0cb42b662c4f3a3bc8798854bca5d8eae40edc/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/0afc1efc7624ef44bef4db4b1f3020ea4eb0d85b/
         arc |            gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/91caaf987368a2d402640af40966edf8c47026eb/
microblazeel |             gst-ffmpeg-0.10.13 | TIM | http://autobuild.buildroot.net/results/c848ea54e27c87ee67681cef12cec033afb980c3/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/5d5349f7ca204192e46efc8ea8641d4920ccec2b/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/20280db576d53294d9ad8efde1144f5db3910628/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/3708752c25bec1ea2734e2ef1950c5de85be3a77/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/7a3361714e28d3315238803be6c33016baba833b/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/bb9945c75bf48441fa08d28fa5e67520f8d98b1f/
         arm |             host-heimdal-1.5.3 | NOK | http://autobuild.buildroot.net/results/c7cda0a4ed087981ee0c820e8cd966b9a0f55bff/
        sh4a |                host-qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/4b69da623638c9d596b78256cd1cae8a6a32dd01/
         arm |               host-vala-0.26.2 | NOK | http://autobuild.buildroot.net/results/663289fd7d8128f2849dd0831ced2efd7925eddd/
      x86_64 |               host-vala-0.26.2 | NOK | http://autobuild.buildroot.net/results/51f49875d156691c2081bebf89a520e84cec7162/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/676da4d8447cae1270ab110dd80e2cbc75f60e98/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/a2274350f4d676ca08550f6e59d8c50f79bb5df6/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/5a8c705ed155fefc384b5c81f74fb20157b2e2a2/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/68929df6c73e3014144a04110bf3c77a4dfa752f/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/bf830135b725c346952faa3c71b592ec07981aaa/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/f36e9f0992581e76988e587e420fbdf650a8b640/
      x86_64 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/058122928b8b871e587d15734e4dff8fc5225722/
        i486 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/05c225c6cb75725526d4451f62c048063d6fa395/
     powerpc |          network-manager-1.0.0 | NOK | http://autobuild.buildroot.net/results/d2b7a2a068c9b99544c60d077196fadb0d26210f/
     powerpc |                     ofono-1.16 | TIM | http://autobuild.buildroot.net/results/65ed337e753cc25fb61a532351397c222db2eb1d/
      xtensa |                openswan-2.6.42 | NOK | http://autobuild.buildroot.net/results/76a7257c16fd5a7707cb994603fb8a4394f84955/
        bfin |                     php-5.5.23 | NOK | http://autobuild.buildroot.net/results/c5f29b486cd0fe2188dd564b2f19d689c1800b28/
      xtensa |               postgresql-9.4.1 | NOK | http://autobuild.buildroot.net/results/642ac3667791fdf338c5377d6f753fed72833c2b/
         arm | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/94ee8cbfd11b137c7a6697340c0e7a53749442ed/
     powerpc | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/1c5d3f59cd40a9e14b271f727902cdbcdae62bdf/
      x86_64 | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/cfe2000911c7ec1793ea978dba8b65df1dec47f8/
      xtensa |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/7ce78169b661dcd6c04dc3ee5b1877c0de09f91d/
         arm |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/22e53878d9c55c2fc17024d6e8f84a955b8677b4/
      mipsel |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/17e9bac364a30e1ad9c39aa9936cc138520ddb37/
         arm |                   qlibc-v2.1.6 | TIM | http://autobuild.buildroot.net/results/4470b7be2a88abd33db84264836189a803e09f9c/
     powerpc |                  qt5base-5.4.1 | TIM | http://autobuild.buildroot.net/results/f421793567a8c8ce18c4b355007e5bc5426c5b2f/
        sh4a |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/852761c042d43ae17ad27c9404d11ea9f3b54ed0/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/33801487773586c8ecff16d8283645ee944b08ea/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/be0a7a99aabab8c7315b0183352a1f87ae313f76/
     aarch64 |                    strace-4.10 | NOK | http://autobuild.buildroot.net/results/a27a9e2bd7b95e29289c4422b89690a42992e30f/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/581a3fa93d23be6e12dca5e4aebd7c6c3aa0c8ad/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/9aea3480eb6604046a17121fb5dc426b31d46dae/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b058fff068a97cdee964eb1e8c780d02c0fdd373/
     powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5c2d158d00c51a1dc260ae696b8deefd98442486/
         arm |                   tstools-1_11 | TIM | http://autobuild.buildroot.net/results/bfcf78735689c77f1e30674fa8e495ec898e1813/
         arm |                   uclibc-1.0.1 | NOK | http://autobuild.buildroot.net/results/c2f5792bbe467556a394ff19e03ddb5f71251ac9/
        sh4a |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/9d1a5940be7d0f3e8a9baeb732b32572504ed38f/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/73ab1889520242f4ff495ac2bc775d5e2bb728cf/
        i686 |               xlib_libXt-1.1.4 | TIM | http://autobuild.buildroot.net/results/79c435f5183219d399e27528cf35d7f93955dff6/


-- 
http://autobuild.buildroot.net
