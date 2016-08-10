From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-09
Message-ID: <20160810063029.6F291102D04@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-09
===============================

        success : 206
       failures : 76 
       timeouts : 0  
          TOTAL : 282

Classification of failures by reason
====================================

               openipmi-2.0.21 | 4 
              pcsc-lite-1.8.10 | 3 
               tinycbor-v0.3.1 | 3 
                  fio-fio-2.13 | 3 
               audiofile-0.3.6 | 3 
kmsxx-a706f157b86e906968080... | 2 
               binutils-2.25.1 | 2 
                  cairo-1.14.6 | 2 
       poco-poco-1.7.2-release | 2 
                  babeld-1.7.1 | 2 
    xserver_xorg-server-1.18.4 | 2 
                   dante-1.4.1 | 2 
                  ffmpeg-2.8.7 | 2 
              lirc-tools-0.9.4 | 2 
             host-libffi-3.2.1 | 1 
                 host-go-1.6.2 | 1 
                alsa-lib-1.1.2 | 1 
                     mtd-1.5.2 | 1 
                xfsprogs-4.7.0 | 1 
                   systemd-231 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                    lftp-4.7.3 | 1 
                   cmake-3.5.2 | 1 
             ntfs-3g-2016.2.22 | 1 
                 gadgetfs-test | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
                   lldpd-0.9.4 | 1 
                   assimp-v3.2 | 1 
                 libxml2-2.9.4 | 1 
             host-gauche-0.9.4 | 1 
                ipmiutil-2.9.9 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                  connman-1.33 | 1 
                pinentry-0.9.4 | 1 
                 clapack-3.2.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                   fwup-v0.8.0 | 1 
               logrotate-3.9.2 | 1 
        ltp-testsuite-20160126 | 1 
             libxmlrpc-1.25.30 | 1 
              squeezelite-v1.8 | 1 
           igd2-for-linux-v1.1 | 1 
                     xen-4.6.0 | 1 
                  openjpeg-2.1 | 1 
                oprofile-1.1.0 | 1 
                 jack2-v1.9.10 | 1 
                    norm-1.5r6 | 1 
               mosquitto-1.4.9 | 1 
libamcodec-6f9b99182f94be14... | 1 
                grantlee-5.1.0 | 1 
              libarchive-3.2.1 | 1 
                libtirpc-1.0.1 | 1 
                  cc-tool-0.26 | 1 
                       unknown | 1 
               qt5base-5.6.1-1 | 1 
                bellagio-0.9.3 | 1 

Detail of failures
===================

        m68k |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/081aa0b4f0e65648653ae7d3c157dd887f41f58d/
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/01f4be126c2d786a5ad7f220c2cf60539888a480/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3c2196e7c8f5e7c278af655d17ee57527680f084/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/9f6c0d4aaf5348ab499744856e92775ac38eb0dd/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/394e530c5dcd9ccb590eb151aeaadb37d11e0e39/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/4ff19128f2aa861d0ad91e96bd32e7de0321a522/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/772ec47dce51e29406a53785b7733ee6124da095/
        bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/ada44228bf13ec05382275bd6571396f5ba2b1f7/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/e263cdf69ae5e6c5a1cdcc43950df5a0052ed1b1/
        m68k |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/72fce07ee7857b5fc87474bb0d6226c86707d905/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/7be65682380f7c2321e19b5e7cbf6f67c6b55874/
       nios2 |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/b5cb831e2b309a6e4b3497a6da23fd023dcdab29/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/f34ad4f0cf094fa31b7dc18522e9eedfc5c2c940/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/d14921d20bfc260e2044b9869560b5b2d839d518/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/3e12415fc18168b301008f552259a84c7beb13b4/
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b5ac909853bbcf6ea16cef5c973b0d203aa262fb/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/e54e09d52582d543f065371c94319b0756f273cd/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/1118d568959006b7f973761884fd3f4b63be19b1/
         arm |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ca4c67b093afd6f14349fcdc87b02e0480172e8c/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/5a04bb54cd9b33d1292ea58aea2bf6f91c1d4722/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/6d8481e989cf8f8918c44981e9ecbf3ef0eed575/
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/f660ba94f509d47ba88dd9449e5b58ade15f25a7/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d6cb92a6e32f61e9f3a5949b15d965131de9817d/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/5e6cc4c432ce6c964ac285026978ad14d9eae97c/
        i586 |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/481649105bd898d01829b31042e096f4ccc56694/
        mips |              host-gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/f07acec6df9785c34f6d2e320b4940772e90d0b2/
         arm |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/5106180047c4eecb4cda501927ae733a193053e3/
      x86_64 |              host-libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/f9f420128da09ef57ed2339bb3a8e89b308e27d8/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/7de469f9042b61f942b69ce66f454911491afed2/
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/b5e47741fb4843428cbe10f8c250650b060dbf1e/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b593d422f394f1ed6a91faaa5ff73c769d523abb/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/01fa012c01ec41aa8d93f319627337221acf1dc3/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/1ddbc071fa8e5f52bea98f62d289d1c6cf075bec/
         arm | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/68266cb5b26a62387dc99aef31fc9654c8fcd505/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/85114d93de24b7a685b64ba3fa8b41f2ebce50a4/
         arm | libamcodec-6f9b99182f94be14... | NOK | http://autobuild.buildroot.net/results/fd200405e32aa590c011eb55d22c7ce4ada8568d/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/89556bcc30eba232f9662ea62b072f222d7d2239/
      x86_64 |                 libtirpc-1.0.1 | NOK | http://autobuild.buildroot.net/results/715c3ff13844a030767a49731069183aa02cc5f2/
        m68k |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/8a4e26bb1c0c64759e3914eced0a36baa0967f0b/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/68d3b8441d725ff503b4b433d02e3adce32948ef/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/183d4eb246663b684780aefb9eda735fc5ef36bb/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/585e50e86a9ef6badd07c2dad06c762c4d1f3446/
    mips64el |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/c8a6001f437701ecc75f6c9252935645bda8a8c8/
         arm |                logrotate-3.9.2 | NOK | http://autobuild.buildroot.net/results/f6a91b9067deb6b704ebcd34f03e309b8d19408c/
    mips64el |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/f439ccbd33430280a651de97f40e764e43e29612/
microblazeel |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/85c44f6620f82957e41cb368ac46bffee402e951/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/6a1bd73cc56cd257fa939702728802b63446473e/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/b0f33713f8141fa3c1e428edda4c4d4a6f3d112f/
         arm |              ntfs-3g-2016.2.22 | NOK | http://autobuild.buildroot.net/results/41e02f7535515dd75f1efc6ea53a5d8c15b1d296/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/9a5d36eac4a38d481df2eaf7e090717548d28649/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/55a8af9ad0038826146d0404e119a9bd8376423f/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/77af7206e8765dae9b4820b55082be290787f6bd/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/6d6e0b8198d3b0400de92f3564453159f204bb03/
        m68k |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/e2e9593b10c03b1d238b119ead5a2470e84fd600/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/635010b1e7f46518aa059d8348224cbf01637a54/
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/f05725424915a1ee825bd7e57399883826c56fd5/
      x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/77dc8ec40074ac334c30a77fc261fa2b179f732c/
      x86_64 |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/bfedb3b028175b24be28bb1cb8f5911deded86ef/
        sh4a |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/8dd96c26d7bdd900706ad25721e01d4cc1b8f276/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/73e44ce4bcc21125ea3caba4dfb8d2683a4193f5/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/791917c1343f53e12f27b06cfd5e1d2e88078014/
        m68k |        poco-poco-1.7.2-release | NOK | http://autobuild.buildroot.net/results/349d4b49d65a652551c4de20233684bb4ffa5ae3/
     aarch64 |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/0e371b1d870d89a8bcb92ff91225e0e1f9ec9f23/
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/863ad2378cb6e9630026c74fcb5ad4fd04b17076/
microblazeel |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/3b5b88959887d8126444b728d59fc46987c52e4a/
         arm |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/11b819cf31dfaca0ed4bc5918ab30ae4f3ec56ae/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/2cd8a7366ef1c3cef898afb3e150e84a67e5f0fc/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/f0fc2c5cda3ac35e289d120dfc864a85cf93cd7b/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/90640255111ccb63f45d2748a277bdea84aa029f/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/e66dc62d703e0f74f1339926ba2837aa69c2e412/
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/f855a040e41f832e1a7d8792a473b65207bee241/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/17641484cb1c2648fcc76e1d1733c71d47025ed5/
        i586 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/366ac68fff498576cc6bbc2ef396e9cb5137c01d/
     aarch64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/26decc6b98fe35733dc6be95f6c6ba3028fddc1d/
      x86_64 |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/144e0be1a9aa7d2f00b535c8266052eedb91bddb/


-- 
http://autobuild.buildroot.net
