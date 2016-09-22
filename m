From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 08:30:50 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-21
Message-ID: <20160922063050.82BE81029F0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-21
================================

      successes : 207
       failures : 301
       timeouts : 5  
          TOTAL : 513

Classification of failures by reason
====================================

          host-libglib2-2.50.0 | 241
               libglib2-2.50.0 | 9 
kvm-unit-tests-682187afcc99... | 4 
           python-daemon-2.1.1 | 4 
                libxslt-1.1.29 | 3 
make[1]: *** [libavfilter/a... | 2 
                    mpv-0.20.0 | 2 
                    qemu-2.7.0 | 2 
             tinymembench-v0.3 | 2 
                     vlc-2.2.4 | 2 
                     xen-4.7.0 | 2 
android-tools-4.2.2+git2013... | 1 
                    cups-2.1.4 | 1 
              e2fsprogs-1.43.3 | 1 
                   efivar-0.23 | 1 
filemq-e59951489045825d6fc5... | 1 
                   fwup-v0.8.2 | 1 
                   glog-v0.3.4 | 1 
                   gperf-3.0.4 | 1 
              host-fwup-v0.8.2 | 1 
                 jack2-v1.9.10 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
                  libffi-3.2.1 | 1 
        ltp-testsuite-20160126 | 1 
                 lvm2-2.02.165 | 1 
make[1]: *** Waiting for un... | 1 
make[1]: *** [libavfilter/s... | 1 
 make[2]: *** [all] Terminated | 1 
                 mono-4.4.2.11 | 1 
                    mpfr-3.1.4 | 1 
                 mplayer-1.3.0 | 1 
                   ntp-4.2.8p8 | 1 
                 opencv-2.4.13 | 1 
                 orbit-2.2.3-1 | 1 
python-libconfig-b271c3d9da... | 1 
           qt5location-5.6.1-1 | 1 
                    quota-4.01 | 1 
          sane-backends-1.0.25 | 1 
                  trinity-v1.6 | 1 
               wireshark-2.2.0 | 1 
               wvstreams-4.6.1 | 1 
              xmlstarlet-1.6.1 | 1 
                  xvisor-0.2.8 | 1 


Detail of failures
===================

        m68k | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/95b6c5b1fb4b7e02c86130638842c6aac4beb22e
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/bad574604c51edcb02ad55d8e11a93442cf9ba77
        sh4a |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/41ea60bebfc741604a5499df74363b498ad77a48
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8a1883be5cc69651fa7838858ca36b0b84deccb4
       nios2 | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/f9b964b19b48a1b165f88ec4bbdc19b6c104908d
         arm |                    fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/c3686dd26ea5adce9bab93d247eb9ff406577771
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/1c822e231ad827ef253a6b9eb1dc43bf54169d3f
        m68k |                    gperf-3.0.4 | NOK | http://autobuild.buildroot.net/results/db3ca0425028d2eb2ec176cc842c7131d48190a0
        mips |               host-fwup-v0.8.2 | NOK | http://autobuild.buildroot.net/results/a7473f5168bde2f0f2bb749f28af15a42ebdf93f
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d2c3cdc044f8d12f11fbe0ee86ed70c30bac5987
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/05ccec644d6ccfde91dd4a3eeca3845026435723
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b60a425df428636593e319677cb0cb2bca76e607
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/573b2825e772072ab5379a08d20472a02f9bf7ed
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ed17eac12802f72a0fd549316716e54949344c80
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/edbf7d8260c5172c3aac1299f65a3d5cccfd259b
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/371628af001e7e5864b554528a00576c6efd09e3
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/fe5d6805c2f7e58b103b112733e6570d88cb3bfe
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a362b7612aab535c63106d0a32875039cb59c6c1
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/151b17539bcd5a53cd5befed25efe854115da7bb
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a043e5dc070fca27e28578c3af51c82f14f38ec
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bd2a18abd5a8470a14ecc30edf9a3d88cbdc7dec
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ed2f8e2724be2bbd7d7350277ba47635c6f81764
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e513fc8e4bb6d0502380c5b430eee12aec426143
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2b8d0d2675885c02c624cf9e918fd92e279b9824
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0b16ad756ec8317da7e7b20e4f447bae18452916
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0543edea76098d472267b87a0801da512e0bbffb
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/02ed0e7c7120311539d07ded148bdbc7bd6f4bf9
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ac42f5494ee6a99350306ddda9ee531c4c2acce5
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5702e2fae3ae49debbcce2fd86c5357695d8cefe
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4027b8e994acb4a740b7a3179c98d00d9c60f6d1
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/39e311416e4ce143377866967c2d6b2e60b15393
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/964e7402e568238ebc6df39d16e374caf6eeb087
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2e21f4514a7699a98e7ff16688b82ebf5657cbb2
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d79d0636342c5dc3b4cdcea2ed33a39452d67160
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4a900840a0f90434c67e999c21ecb4a6c7ee70f7
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/da65c8ff3ae04fa519fec665543e4d599626af32
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d99ee05c460eb09c8ff6c4cadcb031cdc7955010
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/895cba8570bceb20cc639494fa19202e2b532f51
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1697be5a9fa286b2ae61ca7080c0a40357e1ca51
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/58d894c93ee2f4a96790b7f5c39f18d24556afe4
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bb3200a2f05c30ad1bd20ebcb032716e7396b8b3
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/efcef3735b59b6cd05e735a4316a52cff6703220
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/dcd7cc2a19d5cce241c28ba918effa94d240fa0e
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/92ff329ef1a5dd5ee39e25e600217716926684f2
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c57bdec57653f317c9d8c368835290b832f50738
       sparc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cad20ff054c91d9e950466f0d2f0aaff1b8bf063
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d8e3bffc1c355035442131c3f5381f4b3ab3c57a
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3cd2242f4edfc20e8962d6c546b0c89680362c9b
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c3d5927f3adae9f3ec0412d2b541a47b521ea0a2
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd1d56c758901e51ebd11a5acc7f3bc0325c709a
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/61921e7b1bf89193166290b931d444fd5cb0d4a7
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/50e0e723bea402a4446b1c3834c6aae98ec10ef0
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/976702e4a97ce787e0b29091cbcf4886e7e80034
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/35f13b6a46f076bd164de6f6af6d0ef7cac95cf0
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a979c8b0320d78c64f2f3bab7471e4f628579e60
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b5a4e6f6af53fc2bda385c0088e8224ddc1a21de
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e99f936c0b1bc683c577790d659721494a2eaa7a
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0734626fe7f98b49a8b8ecdcb586cafe72b8a100
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/225783186cd0843e8f24ec67a50077f3cbf7c8d8
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/81cfbe61db5273986a354353a9ed7fc87d0def52
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a2b74f44fc88b27424223ab9e4bbfda2bac8c7b4
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f6b1a161db0e739ac74d30caa4780841167bb3bb
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/36b9143c5b015eabe487a02c798a40bbb1d0d13e
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3023658dd3c8f6dc21aa0a925780e2e7802fe1d9
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/38ca4d839338aec8a3efe3052472b76e53681b37
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bd84bae1d71b51b247c617ecfdca2d461853de4c
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0f74c6de93401010c5c9f750ecb8883cb0e8a752
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7af276a81e0cba544b8bf2dfdf580ad8a82b8055
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/93ef77d17c6e96df154df92e25bc5e30ba64295c
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e1d6e7c49de56d725fb409cb120d1c934c7dde66
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5c45f78f9127a6d7782588472b8a712712b3fbc2
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/981f92bc6c071af47a5f062c152c9072727c75a1
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/42b2b19a7cdd140ab79d0712d90a00fe08f2531c
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/25b235ad302853226803e66cd7bcf086ec185b3a
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ff39c9f83983a3d5679e3e88128c1018ce540113
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e783a451b8d6254191f95a1abf897229f5708151
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d3e378ee00cb6a4704f67562a4364b5166a93513
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2670df57dff0a7da45ae2aa51c53af9f7627c83a
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c475dc84eff59f44a021a2fbf7606ea34a5496ce
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1ee71f31680ec5fe0a789f9b9363d547c126f972
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e5353ed87cd3bf7fcb057f9dd28a598203c6f20
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/be1d1f30c61254f84e7c6aea6aab87aee443f8d9
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7dd700e8136a000207452bc0b2cf8d5d831315b7
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b1c69dc2b9df12f7c2a69cd8cd72bd471e862cc1
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4d1972ae4a50815ff256b7b907a9a5274228aa4b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/59d97e1f2469e3cc81b348e03ff011eb75846230
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd1ad430f1c8ef523fd031e880e2bf0fab2ada03
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b7107156ad92cf960505aef2b1cbeb84f97822b8
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c501c02de7fd1bccb5edfeba8917788b3f4973dd
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/512c368b1f519a98967ee17d480397caecaa962e
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8be79c571591467c56fd355581868b036c5e3557
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3876346f311d74ece23a3565c2eb4c80c1a7626a
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/9f8b382333e2ba6d40f22ebde864ac9579431dcf
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2108bbc4b268f25b5c56594986600be1ce2c425d
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/922e378aee4367167d8a4c696d053e2c0db1f8ca
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/608bc618413bcd967622447c0f790020a3c68729
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3135bc73680b22d81a077d8467530a2a84fb8b00
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5d1bf8d98e14fd1f0280c6f9b10fbed116d783e6
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6b580608e2408f225675c4667a2360bc64c834f9
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4f6efdbf46f19a47a3e6cbcdc6fa9739b289b555
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/9b6ce9ea25cca36d8b01749f0e959d83f9b3c97e
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/eb3e71577c9a3a4862c0816a4e1ac69ec34a906a
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c428be035ac0e764d411bfe238127f8ca5fe249c
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e7da04adf2fee6205b8324ef842705b92ba3c009
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a06ffccc52f5041e056c23fd903cc83434704de7
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e7dd654dfc4f66787d07aa24042de842530b0bb5
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/54956d94369c9e7e793626f81b3ad80a19a51def
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f1e3863510a0a1af70e8f325fb7939dcc5bc5ccf
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/30f5abf759c30cd01c6717654d7687aca01d896a
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/78812634a417a09352153e7f3cf44fca0d2f0fd0
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c0b359d1617f17fe6b966c240b19aa6344a48675
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6bf4e969bac62d130da86e97e083b97e3fad3576
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a673643bc23ce248152670e92ad29e2268d012ef
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5c61db1ded018bb46668691882e6d80f1349a1d4
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/506333653482990b32f303dddb16497eab10161a
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d00d60ffa74cc009803b7d1cf81a4b156dc75321
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1b24d73af658b2410e7a77e0c5cbe1519913aa61
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1089f56421abeee99f63a89e9d08788d5f131077
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/17be0d9bb01034ba2ed064661fe3af05fe5f3bed
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3cfed9020f1f25fd282f0f2833fcfafcb58e9d85
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b7216dfa8063df16d9f7d2fd094a29f514e9c09d
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a91b613f72bb356208252013222310e0ff2aa9fe
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/17d851db37591d8da40ff4fb8570a5380713fcef
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d2f702d413e39c0169fcd6f33da1b560be8d3142
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a2d19a343db79466040c62f156c2788edfd691b7
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/403e6c99dc58c3a68b42b2ce9c1d9b6b9d405f10
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4c575573d0a5ed4186d426eb9831bcffd346f7d8
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d9b6cff732132eb6aa858a341dce0ffa82c07c11
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/321cf87d5bb763745e9927e1e1c638f2857dd60e
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/00a0a416f8fc7862265e22fb956e294259ad23d8
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f558d1e9309c59fca9f615a89091f5ba518cad29
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3fd96465017ea12f41c40b7f5b39a9c454450d42
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/9e6be0e273689691265c6d159652624599eeda62
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7d9dea0e5d0f678c89c471e0feeebe55595a6317
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8c57d31002508b81b4b358119d2ce393537948e5
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d3de6f98ec51ed86dd764b4f3f615f8e01efdedc
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/254b124c4eac6d2f0135ffbd5e8647f04ee8b74d
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b51b0d2c318110f17acb1b887a77073f545149ef
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cfb224b10a9e7a4dd7dbe2d12eac2cb10ea71139
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b67164265bbe2cc091ac7c765ed6501cc0d1bd3c
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1de45d49a11babeae2675fd629618c11ef76dbf8
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e2363d4b766cd101360d79d5c4bbbc6980830eaa
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/221535372c6821618cf4369a300ab8ca6f8ea42c
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0d05e74087905b50a174884e3bd274b478e6345a
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3bb25c0662e5e7df7f277843afaef9891e6dc7ba
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8e603ec3990b5f84de1237d7cbe38e52e8a025e5
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0c1c3c69018a40067e9cb79163b9478e75347030
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/79e9a42a4a5b8c611b6f85e7d36e516e180cf446
       sparc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a3590a4317616dd68bc789eae018d50925dc1247
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a62f63de6e18822920e4ea510359dc33889106ea
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/20bec5407f45c2c1392f05df3c3bdb0376a3c6fa
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/efe096d8eec6a7f4888186a972d95109f2a517e7
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/dbd45062bdea94a994fb22bcd15f4aa3d9077331
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d85db1c1b5cee08cd4c4812b6bc485ab191a2292
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/9f7a95207a4fdb1f321999cb43c03e3113ddc697
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/26fbacf67eea2df156e3ab9391826ed5f6aa0ca8
        i586 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ba197463eed21d0766b9dfe3b106d0d296f2fa6f
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b3749ab69f4f97d810f91bb20166f37865ab1287
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4266e516cc7f20936504957f4ffe5d17fd5b9a64
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3940af128e2e4c4485c4f1865ad374f60a46b784
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b2aa218ddc878b3a9e86c6266a4aecfaa97dabd9
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/67d601b11a7895122b9641e9ac62a61126b8cd1b
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7a684a4a0b57276231e4275a7b91fe33688863ee
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3ef53930ae8cb02a603d5f7719e73586e9591480
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a0d1a5e2507ad693076fbf7c7d927104d290433b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a89f3a0da476a029e3204f4f2b930c088bfdef0a
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/43f2ffbea7cecfc78f10562313454d98f4a2f208
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a1e185cd4537e5d180452315006109049a81bb7f
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e39207ee1b5be8322fc4248baeb1399cc071d599
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a0c0701545a6b86366a4d01de4bfa53318476faf
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7e866b322417cbce4b2f3aa76524c0304b43a202
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/943324a25b9077e359c0c0d529cdef4162fc6416
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5600464707b0fd8f26fb5fe4dd9932f690d86029
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c08b50d61cdc03b590fa5afc62bfb23d61dd589a
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c55adca5f203614c1fbe216f8be1eecb9bd30897
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2bdc0c68c3d33a8a14fb2a34391100f3b512dcce
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0044a9ec33bbb7ad18e34dd9a77806aef076c8ff
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/93794c5cf0a97c96604f01412c2158faa7e207d3
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2848caad89f5b87520da50a1864e0f7e4c5f54ee
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8b53d22557b8742023bdd311ccd9a0ad425d3d37
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f36ae941fa82e948194bd5f5fa8b07dd7dc464af
        i586 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2e7d4982f18b3a61a38145b0961bf05e1e7e34b8
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/12a430d08b4470fb43c71ed6acbe10a9e0edac1f
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/83bfca360a5b744e9b353322fe469f1950d3b64a
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a744c6a7291e17c0ed7130c65d0c075d68e46d34
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6283bea473e6ca83ece90e4193a4e837a3fa159c
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/83f7e18040132373e7d231abd115a138d8ffc6a3
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ddcc7dfa56fc9837592ec5e735ac523bd0b03be0
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/82bb76dc28169c3b3c73d1af8e07ae06935c64c0
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/753171fecaa282e67e17631191f677ed1619c4e2
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/825c6feecbfcdfed63411e71ebf4c2531936d854
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b4e947ec3b3673428414cf54a424e2bff0fc2d96
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4825c10bd5b1017cd003ffe39d98c0d8d8adb81d
        m68k |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/afff817d13fe93962eef941a63b12776dd6c0c00
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a0e20389095d7c8ec0b4b1fd6301a4aa314c7712
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6fe8cfa343ff54ca6c9d4b22d101a8f59bdc3351
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/161d26c40a81060c825736b839ffca1eb3cc3363
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c64c93143155098e3c87d49c8cdb0ab0200f3c4b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bc6f56b761d4d66e1016903be1f10e68b18c05ca
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e3a182b3e02fad83849e01cadc68d1a2ed537a5b
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/49b8d4efc4143ac03c4b2a63c5604404568e48c8
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/db55162786b332348f6872d8a33839b47351f295
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4eb375057b0592d24df61b4be7989746e7e0747c
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d4b8e385414154c8c343033566dae609250d5ca6
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/59042d6a0c7999a32c91404c33bbb095e57089ab
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/92a2a40a3b0a54afff1b77500095a73c68120689
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/958d20cac066b6d5198120b505632e9fb989a3eb
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/bff1b3d2e59343200e8f907f10a57db65bac086f
       sparc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/53de869e665292afc895ccd17296075e137e2c63
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3bed26402b4873cd811242eeea90f873496b7180
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/47b384fac714bd7f9dbd2040ce1a8c7145be8630
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8e662ae2facc5d5dc2e51f80a16c2aea3fdef539
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/38cc2d236890df67397748794fb8f834ddd4375d
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/09839cf49e6a7a62aa091a6a2833540730ef3727
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0b7315dac91b8e779f9fe9644122017c69e89637
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/64ba48b1dc77133dd0d9633419af5cde21264cc5
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/715415dbf5b6a6a776a3eafc05fafc93db6c6e9a
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/beaa3fb84ccebd61ec5036c74d5e1a0760f381e6
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c62fb3510b0d8cf524f85d8634972a3b71b5b900
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/304c6f640341d10d31640124ac92a06259b0486a
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/94da44ad2347ba7c25f888e70027f3626a7916bf
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ef42aa360095a8cf102e1af117bfb3150d1a88a3
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c417c4586bb80551e499dd2db53b98cbb11d591b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6747c771003f4bec9aad92e618210c9734f08a47
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6cb1922fe34ce80a87584cb1256e07f011e91c12
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e6b9d756958610fc7c121532a48ab99657fa4817
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/71a6063b04e6ddbe61db7624e1c14efa20d666cb
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a244a6969086ecd1e7152c061fa4027ff09e766c
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/88fc4ae842cf1a6bdab68e3fe72b12f0eab35b87
       sparc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6225553d45e1588d48598d2e4fdd25484b390c47
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3e3e17671374e9be1fc6e24aa3ac9655e2d663f4
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/650bc14d4fb4c85c0883673a881ad5c1a0810f42
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/515331ad0f856180a37aa1ec51d605c7e9877261
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2b2bd8300104856da2761eead0b5e1f7df58b9ee
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c0d6777a859f8dd39a0950ac8cf51ca9924944b0
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6f8652ac39c51bf18b92e3ca2a45d3afe618b666
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4d4d535435c7dbbe5e769c42673c6edcd0cdfde0
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/34d824989cb061c2154f23a1010e41779f7b8e0e
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a4c99b2dde7b1bd2e291f8f3a601eab14614ca1a
     sparc64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5f6d919577648bb4a9dadb33623a3ab7e9ea8960
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d495f0f68ae872e04ada5716d76b9e811bd943fa
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/32ae25106e91f7ffe03466ef0354c255067dd94f
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/504df3fd17bdf82e5f7e0140ed3f87e50d7188b5
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/749813748c6374a271f3e896b773448a470b0417
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/20eed2c7e37b452a2a5566024936fc260bbc742d
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f1f36587e7b58990cde35827120263518df03701
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/29eb0438909643b2d43b49144086d9e7e19d4b67
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/13ebcd49da077eceda1c1163204798e8b757bb48
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/137da28eadd35b556f1e4c811f2bdc88483eecc8
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/734772c55a6aed319651f8628247886be99e5b13
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/bed286cb987e6451765892094d2e11c5325afcbb
         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/960f072ee8eabe39593983ecae64150d0765de38
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/d9a6261c747c839cf6b6ae5286fb4435941e08c6
         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/576aaad67a535881dd54f3ef64f7aa666397fdd0
         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/069e9fdc420ac97f86085f42728b856e93a8c11e
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/cf24f2fde89959fd182cb407887d7eb850c1d25c
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/0a04d89cc16c706dec55e834911ea767d617c7cd
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/bd4988b87ff375f4cf01f62d9db4cacaa5a7798c
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a0e5a8bb6d085ce008186fcbc60c778747feb11
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/77d851511d55dc5565efc08e5df6d26f89cce297
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7793add0df5ab87eccab5ebcf50612b209c0db2f
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/00c71f36a4b309f875e7e1c3dd9ed89abe65e3d0
      x86_64 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c2602f2e9db665d5a1d7cea8f3256099ce34a527
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/68e189158b7e7c087bb85bc8dcdd287de3d0f2c4
    mips64el |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/027ff1878acaf390c1309607f6d1b18a393a551a
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/80a55b7d8296dd70b3bc68aba9bb19d10636d35c
        i586 |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8cfa52b94ee1e7d80ac90af83fa6556aadbb6c79
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/b33f34dc23f7429928d7d0b1478e71d8e7fffed2
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/df4bf247c92847024dff88ce58a5f47343f06258
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/cad02570ec039511b9495e82d98439e9f0724b37
         arm |         ltp-testsuite-20160126 | NOK | http://autobuild.buildroot.net/results/2d20e6ecfae0393c32b405b34541a9c2cf364f0e
        i586 |                  lvm2-2.02.165 | NOK | http://autobuild.buildroot.net/results/6437e11ae8b64e65b376f9201bf561c90b03f50c
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/0fc6f4cd2479383ea45f5ac2d94d210b7382ffec
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/5fe5d418d090b406686d564d50fc0461ca62d282
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/a6b87db6667379b90428debae19549da095b668d
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/a45956cb8e85eca0ab35f443a68adebe29e2c176
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/d391b1f13e1b6b9116b187ca8c9d075b44598541
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/77a4f34996f147504015fe6fe6b354fbfea6a16e
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/7157c65d18384998b0ef6ed07a62b7317cd2ac77
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6b5344a53076893d78dda45f67609f6b20e31cc7
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/bef937b43aae87de16aba2284741fcf4c5b7ce3d
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6d2a11e5618c1eed0fb8e4247950d44b34cdd968
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/9e074da71e72c4c1d71b0a4a77f4ef2509c0f02e
        i586 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/5e85eb1473b990009327b3633b6417a017f7a15b
      x86_64 |                  orbit-2.2.3-1 | NOK | http://autobuild.buildroot.net/results/1de8a716ed3a311764d84ae826c501b4eae76e65
         arm |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/486c37771ba7c3734f03e5de9b7d4b684d0101a1
    mips64el |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/2d9ffbf7b13c48268d95063bc8783f242f1603e4
        sh4a |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/213be66bb5fe27e7012b9cc5d7c1e370dc059ad7
      x86_64 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/67a95034b56dd92174a403f69d66768dc7e003c9
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/3ec9299f0089f71008af5b3c2a6deb862346af8a
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/73e37f441f6820f3a21ef6513588e78522e012a1
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/0e4f15ab2946d7d00064a7990f4e66e943069c4b
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/81342a012295e8dfab00b0372aa4c77180c87a33
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/5816a67e71c4e92a91c4e9e0266d8b125af6baf1
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/636b7a48987a4a60146c460f22faba8cea3b415e
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/2650a42d9024330209719d242d09ccb203256e3c
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/4bca51af8bc1e7d38891d51009ac45df6d8c1e78
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/2fca707deb6fda2da83ab817f8e594f76415d997
     powerpc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/dd75feb9f692cbd699d5ecbfd8d48d53100f628d
         sh4 |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d23f38e969964c6d979b6708ecde3c61fe28a177
     powerpc |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/74fbe323275314a6abb87f47dff50d03e6948bc1
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5cf7fce5697185f9761175ec8ffc1fbdfe48f35a
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/a5362f644e46c5eb2d2c662a63d028b9d2e97b44
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/a27e035a674359328e675a00463cd16a7f92565c
        m68k |               xmlstarlet-1.6.1 | NOK | http://autobuild.buildroot.net/results/2379cdfacba9eeadbcfcc62bf9329019565bbae7
         arm |                   xvisor-0.2.8 | NOK | http://autobuild.buildroot.net/results/fdb5a568fb38a9d20780cd37eecb71b60b6ca96a

-- 
http://autobuild.buildroot.net
