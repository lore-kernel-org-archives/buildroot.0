From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Dec 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-12-08
Message-ID: <20151209073018.EE5D3101BC4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-12-08
===============================

        success : 210
       failures : 124
       timeouts : 0  
          TOTAL : 334

Classification of failures by reason
====================================

             lttng-tools-2.7.0 | 16
                 libeet-1.7.10 | 16
                xfsprogs-4.3.0 | 10
                 libass-0.13.0 | 6 
              alsa-utils-1.1.0 | 5 
                      qt-4.8.7 | 4 
                  ffmpeg-2.8.3 | 4 
                 pixman-0.33.4 | 3 
                   erlang-17.5 | 3 
             util-linux-2.27.1 | 3 
               arptables-0.0.4 | 2 
                 liburcu-0.8.7 | 2 
               libcap-ng-0.7.4 | 2 
flann-04b4a56533faf8c8228d0... | 2 
               wireshark-2.0.0 | 2 
                   libnss-3.21 | 2 
              squeezelite-v1.8 | 1 
                 dropwatch-1.4 | 1 
                    vpnc-0.5.3 | 1 
                    faifa-v0.1 | 1 
            host-python3-3.4.3 | 1 
            libsemanage-2.1.10 | 1 
                     fbset-2.1 | 1 
                 igmpproxy-0.1 | 1 
                harfbuzz-1.1.2 | 1 
                   open2300-12 | 1 
          modem-manager-1.4.12 | 1 
           libvncserver-0.9.10 | 1 
           bcache-tools-v1.0.7 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                libvips-7.42.2 | 1 
ltrace-c22d359433b333937ee3... | 1 
               libbluray-0.8.1 | 1 
                  samba4-4.3.2 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  trinity-v1.6 | 1 
                   glog-v0.3.4 | 1 
                 opencv-2.4.10 | 1 
canfestival-7740ac6fdedc23e... | 1 
      kismet-Kismet-2014-02-R1 | 1 
          sane-backends-1.0.25 | 1 
libubox-e88d816d6e462180f03... | 1 
          powerpc-utils-1.2.24 | 1 
                    kbd-1.15.5 | 1 
                  apitrace-7.0 | 1 
        ltp-testsuite-20150903 | 1 
                  gamin-0.1.10 | 1 
                libmbim-1.12.2 | 1 
            netsniff-ng-v0.5.9 | 1 
make[1]: *** wait: No child... | 1 
                 gnupg2-2.0.29 | 1 
                libevas-1.7.10 | 1 
                 fio-fio-2.1.4 | 1 
                 libdrm-2.4.65 | 1 
              lbreakout2-2.6.4 | 1 
                  gnutls-3.4.7 | 1 
                  connman-1.30 | 1 
             host-nodejs-4.1.2 | 1 

Detail of failures
===================

         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/9123051431404a48640cee7017725fff2c2889ba/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/de18513e4d52e1623ee82bfd6a1208ff4c9f6f5e/
         arc |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/614d2aa2f55a1f4802bded8cf8d9e34129f0526b/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/b73dfc4b96f4ccce119cb752e959e23a3414a7a2/
         arm |               alsa-utils-1.1.0 | NOK | http://autobuild.buildroot.net/results/2641e9bbe16fb5a0bc63ab7b8d2fbcc1dc32063d/
      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/69196f5f53bebc1085ef7c296e9861962e073abd/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/bd8666c47a94558e7bd34d3a77c7870002c019ac/
      x86_64 |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/7b427b05b24aa53d5d90dafedd54352a946785b5/
    mips64el |            bcache-tools-v1.0.7 | NOK | http://autobuild.buildroot.net/results/e2c49ad7f325016f6df40e2074fd5c8fb23a8427/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/44d69b23ac367dcd5b4322b783728ced89e302f3/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/7fa11b16eac52b454bcfb37f8c69a236ad57c995/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/f27b90ee62cd3da003a1de2204ef9351e1adf817/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/fbd1c5bfca575f7125c638da5cafae00c1576169/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c14ed39e4eee4acc5426f6df5b4a5376f7c0d927/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/6fe02c5174c699fb5d4edb1413c91321753851fe/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/8b975b98ff596ed9c25905b0cc0ad570228c934f/
      x86_64 |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/00ac568c85fcabca0d1bbde186050ec3feaa8229/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/69b1bf10b3dfb99faff21006b0ce497f17c44047/
    mips64el |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/b00c42196f69900cc2f588f4fa44d8e1973f758e/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/4b0eefe3f9c5b5a1ff2ed9c2e642c98a7c7c384a/
        mips |                   ffmpeg-2.8.3 | NOK | http://autobuild.buildroot.net/results/aac1c676b2cb311ae2eac491cc612d4a847c5e23/
         arm |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/6b4f61816b472812167b2af6db63c97334d609f2/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/98dc5e41c9642410b87b4b738b4c7775d3a7cc3d/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/3bc5102247c4f5e55420ef9add8d736bb167638c/
         arm |                   gamin-0.1.10 | NOK | http://autobuild.buildroot.net/results/6f584b3dc0c6ee9052501ad5a46bdf323877a072/
microblazeel |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/ee6a744384a3811190219d12bd68588a2be5c5ae/
      x86_64 |                  gnupg2-2.0.29 | NOK | http://autobuild.buildroot.net/results/68b4fc96f4954312e0786e5ee48bb57074cb9ae6/
         arm |                   gnutls-3.4.7 | NOK | http://autobuild.buildroot.net/results/fa0e1a8d5c362875ff8e5e901bffb67c3a743eb5/
       sparc |                 harfbuzz-1.1.2 | NOK | http://autobuild.buildroot.net/results/52ea6c6ecd9eec6eb48209e7404ea3495af522d1/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/8bd1cafbe3a4445b62a0d543788578749b0d5ea9/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/7281b1e7d67816e360152fc0fe4e469fb2daba99/
         arm |             host-python3-3.4.3 | NOK | http://autobuild.buildroot.net/results/831d5942a732caf2af39b3974244d889ece04fc5/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/2f361ccd7c8e7e39902de6b5540d7176e3cb7e85/
         arm |                     kbd-1.15.5 | NOK | http://autobuild.buildroot.net/results/9f3aa82eaf11a93789afb3f1afcc90f8c64fbe15/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/f237fca7c5271fefb5e08c4d199c3b11f683262a/
      x86_64 |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/144ad1272e74ecf806cc202f2eca3ff5888aa1cb/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/3b24dd19579052f4f5f5153633e7799eef5356c6/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/dbeaaabb7b72b9cb622f60804e2caf7acf7e843a/
         arm |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/1d2f856f6a81b24437c9f5841498e85be97c9889/
       nios2 |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/b31c8e231623e2430d73955ed483f960730e70b7/
     powerpc |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/54de89f3cb6f1156b2b25634e19e759ecf837c4a/
microblazeel |                  libass-0.13.0 | NOK | http://autobuild.buildroot.net/results/f29682f53060e507d716b813630cc9c83355b7b6/
       nios2 |                libbluray-0.8.1 | NOK | http://autobuild.buildroot.net/results/779dd147f83a4ca70b39a59aa10536e864932702/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/b06a4657789b780c46838ee9f332d9387c25224a/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/99a1b65ddb7a4486661ac19262d89c11a7dad984/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/3b5f5093457e99f1fcd2cfecdea6f6836b777ef5/
       sparc |                  libdrm-2.4.65 | NOK | http://autobuild.buildroot.net/results/5ea6781c0a29b4b5ee3908d92ac0ae2a54d78d6f/
      x86_64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/b85773dfefddc9b27834425ececcc123ed5a3f46/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/d77c179492950342ee51151ddc8a3ae88988edde/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/382eba075f3c76aa71f86dafb67b665cbf7046f7/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f3df64cb89e16222a82e0a3ec65bc1ec383cf63e/
        i686 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/f710885ef7cea94a072efdad88e2176a1835585d/
     sparc64 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6bb8be77e3ef388c73364911799b2de38f628721/
microblazeel |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/3969dd9adb7c12195f39c067bc4eb892c0fb1694/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/81333d1c3612d0a518842b89b3d023f7aa76798a/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/cfcb2120c71b815ef514eceefe0cceb184527777/
       sparc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/9693007cdb6db2234ee196feb668680f8e893e77/
    mips64el |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c7af473b5b7c119e2251b2c77376d4ecef9a12e6/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/e58d3eb2cb4caee34fe3ad1682f6c8862075165c/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/1baa70bc678be3d6c5cfe08418b70b8f2120fedc/
       nios2 |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/c45a0fc5ae0b8b2d76e5d2f93170f65ac98ec7bb/
         arc |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/aafa6025bc86c559251da24c85d6d298022f9488/
         arm |                  libeet-1.7.10 | NOK | http://autobuild.buildroot.net/results/6407f547d6987b6b11c1f0ec6261a24efac98afd/
        i686 |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/970fdf3cf4c9bbb1d702255b488d196c2abfccae/
     powerpc |                 libmbim-1.12.2 | NOK | http://autobuild.buildroot.net/results/0d38bd39616c420411969ecb2a1c0938a253495d/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/648d2027da3f1d936061266f7b077e9b80488d1a/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/4092190c99ed2461fbb06e99c4fdb2fa5cdbff05/
         arm |             libsemanage-2.1.10 | NOK | http://autobuild.buildroot.net/results/f46430c45973dfe39976453f5a91a555ed7bfa9a/
       sparc | libubox-e88d816d6e462180f03... | NOK | http://autobuild.buildroot.net/results/6f317fa1b91d46a9f7390102f44acd99bf45556d/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/a0742934148b50142d3291d06cfd1b63efa2cb05/
        sh4a |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/463d9f8203211b0bd2b2b4d27f67ce46362e0a9d/
     sparc64 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/0ca8ba8ed0c8dd2dc97687f139df2d4993c4455c/
       nios2 |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/2b20f670c1fbd3bca708f54dcdf14d9616a97cf9/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/55936458b21113921a6133f9305ccf0bbea0f138/
       sparc | ltrace-c22d359433b333937ee3... | NOK | http://autobuild.buildroot.net/results/bded287308ef2466954ec15e25c3a31a4679e019/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/7de90031a555314b5a5c748c3f1155218e5fafdd/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/275ec4722406c64ad70e1b13655f1e336f20308a/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/5f865d5c8cd7560ff9d9b8d791cb6b83bdc6aaed/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/aceb4a1d2027c55dd5f462f253af3dacb40416c2/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/0ff880a978ea89af87db964b677b273726f73bf0/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/e537b04aa121feeec456e0b790553700d13a3e85/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/4d36bec2f965a29e5a8bba4550c1bca89a0004af/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/7d3684eba4b694b1bf32466c1b36ed45375e4e15/
     powerpc |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/810c309d8eee5523857db78b25f9b757a53cbc6c/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/0f83fbbaba56599ef83a2883fdb662aef1a56a26/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/c72e7ccbf83d58486c678da411d834a4f2bcc527/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/32b122d0cc63d270eacf30c98dc98bfa9e1823ba/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ac76653cc98a58a609f6a4bc6d31ebf4ca35e572/
      x86_64 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/7133160d7cdafd1638092560e634c224e4bf2d9f/
        i686 |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/ed90cfc7ab95d521bc400a3cee58a47557abba96/
         arm |              lttng-tools-2.7.0 | NOK | http://autobuild.buildroot.net/results/b0a7cf6446d1fa8fe3b982cad15f0257c823e64d/
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/470766f4b3e76ce82d32d23aceeceb3162592a7f/
         arm |           modem-manager-1.4.12 | NOK | http://autobuild.buildroot.net/results/0f5bcb4e3bcfe70353357a77a7f823243f60e012/
     powerpc |             netsniff-ng-v0.5.9 | NOK | http://autobuild.buildroot.net/results/038db9c90209d7b63299bcb502c8cff789ce9435/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/50879f09c76e7a3dba30e4b5c69bc0f8b110faf8/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/39804e91f85383372d4ab89136dca6a1fd9c2069/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/47e3509f7696a64bf2980edf04fc4404086cb24a/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/ff3059c56dd3b453567c440954fe6ac9e3e1de72/
     powerpc |                  pixman-0.33.4 | NOK | http://autobuild.buildroot.net/results/c99aa1dfb8a4a80180cf3c35e9204190e5e0e158/
     powerpc |           powerpc-utils-1.2.24 | NOK | http://autobuild.buildroot.net/results/911f6b341dd341707a52995d029550c6d780eb93/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/84f499671af436c12651b160a4b54361b89e2717/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/888304d36a6f186a8707a5b9b5988f20fde3eff6/
      xtensa |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9d96719c610b75ed2172f457982d85d9d00f5022/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/868a5e590055988f6fcf5012f7c03045a2d047d4/
       sparc |                   samba4-4.3.2 | NOK | http://autobuild.buildroot.net/results/e1c4e345ba25779542a39c562a44ea74b1a3932a/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/399b3380b7579784d40e4f403720f06495d57dca/
         arm |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/1ba524b546d6688071f8b038faa71164e9afc8fa/
      mipsel |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/687dd0dcd3ec03c06b314ee22298c33c307eaf04/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/756ae6ec793916ff0bbf3ed2c45c6a3ac5c39a4d/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/797afb8dc04698d6a92f271d1b2a06ee6069c22f/
        i686 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/ee21aef439fc62e3c1632e58c94e95a314d039e2/
        i686 |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/01114d02c8368323e1d86287a990b250849c272f/
     powerpc |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/90c82e85321a584e5f11ce7e6764b35f3b15bd76/
         arm |                wireshark-2.0.0 | NOK | http://autobuild.buildroot.net/results/9e9a17bbf9771f3be8d76f5551cecbd6ea6b5fef/
       nios2 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/54145f24a342f3be179735f24e329ef8b7f68de7/
        sh4a |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/8032ad97453f915b8b03f42845ce01c3352ffa8b/
microblazeel |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/f1ff416df797765aedb2c751658dbeee8b0e11d1/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/a6fd36825f41bead46bd3bd747d0063ff94fd9c0/
      x86_64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/6f7981eba19ebda2ab412f575388efcc1adad991/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/13495ff78428af036aff1550eeff4527e31b5e25/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/8f4526254a6e46745c87a67c70e8b744e0bdf937/
     powerpc |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/b65fdbb011890d0b4fed868a868d13dce270d266/
    mips64el |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/829df8786f782286ec440068cfcbc7710a7a5bd8/
      x86_64 |                 xfsprogs-4.3.0 | NOK | http://autobuild.buildroot.net/results/b5f80f125052eacb7ce40db6dce230dc4503674c/


-- 
http://autobuild.buildroot.net
