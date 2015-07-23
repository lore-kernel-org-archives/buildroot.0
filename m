From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 08:30:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-22
Message-ID: <20150723063018.EA19A101D01@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-22
===============================

        success : 229
       failures : 182
       timeouts : 2  
          TOTAL : 413

Classification of failures by reason
====================================

                  fan-ctrl-1.3 | 24
                  ffmpeg-2.7.1 | 16
               openipmi-2.0.21 | 10
             libselinux-2.1.13 | 9 
          c-icap-modules-0.3.2 | 8 
                 qt5base-5.5.0 | 7 
                libtirpc-0.3.1 | 7 
               libglib2-2.44.1 | 7 
               libpthsem-2.0.8 | 7 
             expect-2014-05-02 | 6 
             qpid-proton-0.9.1 | 5 
                  boost-1.58.0 | 4 
                   systemd-221 | 3 
                  cppcms-1.0.4 | 3 
                 empty-0.6.19b | 3 
                busybox-1.23.2 | 3 
                  zeromq-4.0.5 | 3 
                   audit-2.4.3 | 3 
                  opencv-3.0.0 | 2 
       host-erlang-rebar-2.5.1 | 2 
                 clapack-3.2.1 | 2 
                    cramfs-1.1 | 2 
           libfreeimage-3.17.0 | 2 
socketcand-8339e62a6bf60be5... | 2 
                iproute2-4.1.1 | 2 
               linux-pam-1.1.8 | 2 
           host-heimdal-1.6rc2 | 2 
               audiofile-0.3.6 | 2 
                  ltris-1.0.19 | 2 
                  c-icap-0.3.5 | 2 
                      atf-0.21 | 2 
               arptables-0.0.4 | 2 
                 netperf-2.6.0 | 1 
libnfc-7b7f5061427b5456835d... | 1 
                nodejs-0.10.40 | 1 
make: *** [qt5svg-legal-inf... | 1 
                 setools-3.3.8 | 1 
                  mono-4.0.2.5 | 1 
           aircrack-ng-1.2-rc1 | 1 
           qt5multimedia-5.5.0 | 1 
                   ushare-1.1a | 1 
bullet-19f999ac087e68ffc255... | 1 
               alsa-lib-1.0.29 | 1 
               valgrind-3.10.1 | 1 
                coreutils-8.24 | 1 
        host-gcc-initial-4.9.3 | 1 
libsigrok-fe473123ba836445d... | 1 
                   kexec-2.0.9 | 1 
             armadillo-5.100.2 | 1 
                    bwm-ng-0.6 | 1 
                   audit-2.4.1 | 1 
make: *** [qt5script-legal-... | 1 
               dvdrw-tools-7.1 | 1 
                  bcusdk-0.0.5 | 1 
                 libebml-1.3.1 | 1 
filemq-482797b8aa30fcc9ea13... | 1 
                cifs-utils-6.4 | 1 
                 mesa3d-10.6.2 | 1 
                  mysql-5.1.73 | 1 
          usb_modeswitch-2.2.5 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/9e1a0bb43e01303cb4fd17bf82cbac21a3e507c8/
         arc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/f8b61dd7c68296f054fd264dab057dd59203fecc/
         arc |              armadillo-5.100.2 | NOK | http://autobuild.buildroot.net/results/62eba3d48e177e50321fd825c0a76f928717c7e4/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/5c01df6bcb50c773bceec6c004a0a5443611c43d/
         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/d9058a8902db4d90f6d046d020012a866c931316/
         arc |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/5660d58f2b7c6b69dc9e2f6bfb37447cc92cb133/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/0dfe143abb059231577b1da26cca13e7808cbebb/
         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/5be549fe92f09f5f25d38b6eb17df02fcc328aa9/
         arc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/0fbed46fbaf607aeca55f1e43c90bc255eb79940/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/514fa3bac44f8d75f28dac6b1641ee4a350c4682/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/334d2b762109ff7fc9b6bd5d1db62c36bcd18f3a/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/efa460d1e86600462823b2ec099133d9b79c040e/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/56eff899ba61552b4d11621b1f818ace0876dd08/
         arc |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/4f8df3d8db127982fbeefb07c2c296c687bf733f/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/12f544c97e3451fb2a72025ebc62292957e47070/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/ef6c897ea7547e8ed5f019e8ce4473f0998f2c16/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/df83537dcb6f8c5b4f49dc32929c177865b4be4c/
     powerpc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/7a0ab069c505696a7887ba5c561b76b233ce59d5/
         arc | bullet-19f999ac087e68ffc255... | NOK | http://autobuild.buildroot.net/results/decd52fb18a5fea8c1dff16461ef91a7b56360c1/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/80ac69ca94eb2af07b616158b8c1610ab8a96933/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/e2acdcab80666a80972e1d29c42a3bb1ed4f586b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1f94711b8efe52a9554ff6d857c7969de28b12cb/
         arm |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/a4b52aad09cf5b04c906f01945b4d7dddbef1f9c/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/4643cf0c0248ac030604df066bdcf8c2a926bcca/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/d1aafbb9f3ad6d7f990528637c09b7310ec113ba/
      mipsel |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/70a9b6f10b40248b00b4cefbd0cc7d60cdcefdd1/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/796155ea7a2d823ae24f9d58458b1fb14c95fbfc/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/e655ed88cc79ffe74d6deae0ebc39cf0661e8885/
      xtensa |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/21fa04538cb6bb3262dcbd9745e1b73750f22d14/
      x86_64 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/9e6ff18d5e168d4acf410572737590d052e9965b/
    mips64el |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/56058ab675f13ccbe155ef37a90dd7e2e8369591/
         sh4 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/0029e3c92ff5310be3bc8b31d4ff88fd8234f1b7/
       nios2 |           c-icap-modules-0.3.2 | NOK | http://autobuild.buildroot.net/results/635a677c0c9f6c3cbf3cd006467b5b4d266b1042/
      x86_64 |                 cifs-utils-6.4 | NOK | http://autobuild.buildroot.net/results/596b8dedfac9052e15361532f8ad1c70a052c6f8/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/7d6deee4ec801fc06b71f635b7b937c600dd69fa/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/9e1190626f5942fc6b8bf1d47844c18efc135be4/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/3aba5588f82235e3f5a2b30fb6beaa58a446af20/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/520760bf3844fa5fc0a50d0ff7aa0945f160b473/
         arc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/e053d24ea4ceddc1d4c884f64a0165bf0f715182/
         arm |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/a995c3d7c1109b07df61102e3c1ec23207cfac3c/
      x86_64 |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/bb490627a393949fc88c346f6cce23c03a80a080/
         arm |                     cramfs-1.1 | NOK | http://autobuild.buildroot.net/results/b31ed99082f12263be50482d0896dbc3fba94b9a/
         arc |                dvdrw-tools-7.1 | NOK | http://autobuild.buildroot.net/results/127e47c344d9bdacc5c01f12d338e0c16a2b0225/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/58fa0a23024f1c78ced296efe66c9bbf1f23a431/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/4cfe3255688d9512afcf76f1a05ede7a5247f529/
         arm |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/5b05056ac0be7ff6db7909226257f71882ebc98b/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/333ef5ec122f7af33bcdf67e7b0942d37ddf2a86/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/efd0b3e167bb86b49f94a243de7f5153881ff5bc/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/a74bc4fb5487d2b34b374c6b4305dbb8ee44af21/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/ccd501c117a6364dcae265de577599356bc9fb26/
    mips64el |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/d27af505c9578538ada52a674d84eb2cebf316b0/
microblazeel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/44357d2281a28c9b114b453f4c88905083a6498a/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/a14539715e115ef08e11dfe60b9683da053c8fd9/
    mips64el |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9c65033478beca0be4d34f9821bd1c6fd87a077d/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/53700c236322b6e3a2ee9c209fe34ca6377a3479/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/590bdca052e9036c9f98e653d7219cb2f771833d/
         sh4 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/609b910a3a29e1c67db8ca16ce5f4b65a6d556be/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/dee8509370b215c6db2ce15bab510851b9ec3c96/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/19afa2e6c799ab6fdcc8501a12a8b1cb4050b203/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/22a326c4a6c2a82d36270e772e6083f57f0e3c9b/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/35c431ce4fac5894b11ba2a84876d496a7bfe8ee/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/2ca800716299e213d644ca85a84198a37802e88f/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/88475a096cbe2613f273d7088bd129cf9b128b97/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/067eaa7dc8d152141087c90057eda29198fa08f8/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4b86430fb232920ff8de200294ab36f8e1476263/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e6f4b149ec0d34892e84825d9de9119b6f4650e6/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/4c3c68a16cb38633f54ce13e22635e0fb0ea996d/
        i686 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/bf6977f6da84b09684838b31ae6cef7918c90374/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/2804316c978e6ee38fb68c879dacca68b7dfff2b/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/d8ffe5d78157ee8a2ed832b8e7bfea3370da06b2/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0aa0e9ef97772030ae2e04307ba4d180e9170031/
     aarch64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/6acb3f0d13bbac959a5ce15d1694202b03812f8d/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e00e0652e9cfab75733ef147168ddb4b83be0aa7/
      mipsel |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/cd2e9070356a0c2eea581c815a337b329abe59df/
      x86_64 |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/0ac6dacf1b2d8ed84e180b56de17fb9ac7419fbc/
        mips |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/eff159b1d9503f6284822d7326c4e674075eccdd/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/f062266d5be91cb0ecf27768a6faba71cc18faa1/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/2da3c8671c9161952d9e887bf17bd28727e58c86/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/fc767ce09ecff6c1e03325ecbbc41434d8f556ed/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/ca9ca374057a9d70cb0b9e03b681f3a10ac3459f/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/c6a42970a8fade700413fc1b0a173950b160c099/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/bee6f584848831cf5aa41588db4ecc362ea2c7d5/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/1b4244f84d447ec2a02f8cab868baa119c6568dd/
      mipsel |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/eee4b6c3b1af5d42cf83112110ad4f782924fe20/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/3456cc70998f7b3dce3b5d1613cff6fd36bcef3d/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/374059d7fc67b49bcb82adc90698a42af780aad0/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/341fabca1189fd823ebf93c58b46804db386e26e/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/ca08ca65fdd6106272c9247f8ae733ad171a2075/
        mips |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/fe563b8eae1447b0fc0f5ad75edf483f20fab272/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/a1acf0f60c721d745f10c5628e609c18ff7f6a4c/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/1545d0741dfada81c8ef893c1d5fe01d4cd1213d/
    mips64el |                   ffmpeg-2.7.1 | NOK | http://autobuild.buildroot.net/results/0489ffe456b958749424c3eb40627f12769176ab/
         arm | filemq-482797b8aa30fcc9ea13... | NOK | http://autobuild.buildroot.net/results/309fb05519e3c882d8a691c19edfe12eb6718d94/
         arm |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/44dbb82fd3a1b10827b6a2b51f10a09e2f8a390d/
        i686 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/99e733acde6a4b8442a27757cca1e273ad2a6f6a/
      xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/56de85f9bc0ba44248003212b5dc4cb8dcde19c5/
        i686 |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/d6a80caadfac61ff11aead3253d3a5f9f44d1c59/
         arm |            host-heimdal-1.6rc2 | NOK | http://autobuild.buildroot.net/results/1d0be6a9f48f9d7af0a118b8284dc80abc3d82f3/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/74be46593737dc81d3f1bcbf52b6ea0cb67b8389/
     powerpc |                 iproute2-4.1.1 | NOK | http://autobuild.buildroot.net/results/e082f292950a8a8fc71861f01f4c4260c08271dd/
         arm |                    kexec-2.0.9 | NOK | http://autobuild.buildroot.net/results/97908fe93a70a370d40dcfd454fb973e3fcc144d/
     powerpc |                  libebml-1.3.1 | NOK | http://autobuild.buildroot.net/results/34eff70f6efffaba39c6732cf648800050e56402/
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bc620a612eca5c4c367ed8c76686ce2a230725c2/
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/08bd092780bb5e9709155b01cc330ae2c68d0672/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/3d351522e643238ce402142b9c6b9444413171e5/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/aa3d2311313e6f0b751766489cff6ba748eb5251/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/cf17c3960b7e8228b8b131bdd35d3c4ee50f4231/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/1afe76cafa46e9058e99094b73e85f2d22a48362/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/723c93e3ac870c5766dd4dd5780309278f2fb634/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/84b3739a6e46248b636c0f5dab9999e01f8da166/
       sparc |                libglib2-2.44.1 | NOK | http://autobuild.buildroot.net/results/2d0481d8b9bd714bdc2cddca3bca55b8e5c1cb96/
      x86_64 | libnfc-7b7f5061427b5456835d... | NOK | http://autobuild.buildroot.net/results/b6d2616deed3a6f42a711d24d541fd37c4ce0581/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/d366cbb3af43c9a6557f06f3da6fda309dc25bc5/
        sh4a |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/0eb720f04c752532e9958cf5f3c5396620d42c0b/
        sh4a |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/232a8c1ec089a541324e5f8e7a8e0984a885409b/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e09a298162e9dcf7db6a8b97154b9a8ee60671de/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/b0460c2faa1036355658d3a542ee68d75f62802d/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/9058c952a507ad60e7541b9b69f8f3d03d8ee0b5/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/d0eec66be3549f907b21a7dcdbdf272e42df30fc/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/eacb965168e25c86a9445f00365e7fc78f9948a1/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/50926d784daa25ad9f69feb4d9aef83ced7f90e4/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/d4d0ee950f20a88839f831c76f603c352c1c3ac8/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/02d349a5d7becf980acd5acefca2a0b08bd73199/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/f50a54579fdea22ec6c2efb372468ab549202a8f/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e90fce49ec07814e5f0946a10af27230700e72e5/
         arm |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4687a0109bd4082c63ec4b56cba01afcc29e230a/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/7ff777585c2c0125f43e9074da512034e4a57ff2/
      x86_64 |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a56a341e1cbfdbff2cb7a2a3cade0f82b81df08d/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/58652f7bf294c8c4c23f19667a9eeafa1ca554c9/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/b9a4f30a51c3fa3863d0a1b0cf9c09e12d853203/
      x86_64 |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/ae081f46c89966c02e6e87d6860d8a487513793a/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/5e0eeeae7b305f46db240151e05047a0f87642cf/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/8376d16e5dcc2fc7bc2390adddbab0dce63d2e7e/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/97af4119f9d21724974991909910fb8b72c298ca/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/bfb80b7a86793bb9fc017e84ba730f10b6f5f69b/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/aea7a0f9978aefe1b3162eb013785aff2e11431a/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/c2172878b930f65c7b55ec99775361541fc017b6/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/9fcee0b185dc65baa2ab444910d6d1c0a192b8f6/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/6f2f40299358bb691d05de5a869efaf88273335f/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/bb154cab718c0da833189831c59c2ad3259f0904/
      x86_64 | make: *** [qt5script-legal-... | NOK | http://autobuild.buildroot.net/results/951448b9788d515fc285a460e2964506a0b77bf9/
         arm | make: *** [qt5svg-legal-inf... | NOK | http://autobuild.buildroot.net/results/741c9a24676b3efdef9457d9c4b175c1498a811a/
         arm |                  mesa3d-10.6.2 | NOK | http://autobuild.buildroot.net/results/e3c3e441038b72c78c8e94370baa036ab1effb6b/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/3ff839e894f0b8f9c2e3af9629d45e8efc09aecd/
         arc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/392b9e8f88933b43b79f8d87a6c807a8e6397ee9/
         arm |                  netperf-2.6.0 | NOK | http://autobuild.buildroot.net/results/0dc44b43a5587ebcfabc832e5c85a90fe7c7259d/
         arm |                 nodejs-0.10.40 | NOK | http://autobuild.buildroot.net/results/87dab0186abd7b2737a56b2f939f3aba294e8772/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/9b10b66ebb5a92bee2b9bb591cb9b62617901325/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/b7c8fd5fe99a98d07af3f294a398dd5f621cdec6/
       nios2 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/5c436a69e6bae6695101f9be66f0dd0bc7594345/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/0b37f7648bed99bcb1b5bf727171ccc83283d01e/
         arm |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/39106e5f31ffc5733f090a5b9262342d0bd4e9a9/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/49fbd7e2dc72279c5b54d0f59a055e3e5e73f648/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/5f7e6b3279d0e78e3298cdfe7db595e5043ff685/
        sh4a |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/6e30d3c9c1ba455968d0052ef467cf708018c2f3/
      xtensa |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/260de160a3e8aa903cb06668dd5c8607a8a470a3/
     aarch64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/783b0a7d4f0ed10137177934caf3e92bf14e827b/
      x86_64 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/7a82eca434af6c9ecf35beb10cebbbb0c220fc6d/
        i686 |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/bb9a5d4f2058765a3630170a11ee087c9c289c3d/
        bfin |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/2a45164a35e346ef76812c80c733ce3e76a7a80d/
     aarch64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/b9353f5f46ceef85e5992878bcf10f756dcd0a01/
         sh4 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/acb03f5e95279c3c96da2986d9b09fad3a5b2bf6/
      mipsel |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/10e762961cd85aafcfb7836eb73dbb26fcb7d470/
      x86_64 |              qpid-proton-0.9.1 | NOK | http://autobuild.buildroot.net/results/874f43d134334e37d9d4718ca0f0c487802b6921/
      x86_64 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/4be77432390c4cfb557c3f2cc52cf732de037949/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/255a77e01d8af4090e03acb82f9ad93b7c4dd212/
     powerpc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/11edf8d741a69b266eb631cacffe6aa95b8e3b31/
         arm |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/7844e6a3eeecf67dc29277b73bfe714e4d8f0d85/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/b941f35b6c8e1cf3b2c4b046dfcce98700d8f408/
         sh4 |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/c64b640a39285f59cde47cb8d06ab70a5ac97c8b/
         arc |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/f6d24b50f58251c8051d39bc1d09b5b43f81f441/
         arm |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/bd7273a53ed4e0fede5de0d386ec8828888da9ca/
        i686 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/69b319c4d6a71f1837a670a8422f61ecd28ca5f9/
         arm | socketcand-8339e62a6bf60be5... | NOK | http://autobuild.buildroot.net/results/e8b95ce726f631370da0263a8ffae86ade304e2a/
         arm | socketcand-8339e62a6bf60be5... | NOK | http://autobuild.buildroot.net/results/83353021a5a74669e29983fd5d2a24841d50be09/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/29f054b140e2b7307450a9797e2c7fdd122748f1/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/a7053d485dc0452114e50e5508bb01b1e617b98d/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/dd5011220ef918f242e8b4288da3fbb3e630a26b/
        bfin |           usb_modeswitch-2.2.5 | NOK | http://autobuild.buildroot.net/results/854630d7e41a85dff4c79ca53292622a3659ad19/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/3be27b1bbbfdf12e9b2171fb6fddfd77238feaf3/
      x86_64 |                valgrind-3.10.1 | NOK | http://autobuild.buildroot.net/results/60e5a49360e2ee9482b4d548789f874a6502c429/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/dd5f7a279f826cae5c824d1709e851124e24d85a/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/08180d6a59da5811ac6dbbc25ac70f6e0f1bdd10/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/70d21da941ef0e306e77f12019c82e3bcbef4750/


-- 
http://autobuild.buildroot.net
