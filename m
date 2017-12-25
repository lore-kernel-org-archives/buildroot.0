From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Dec 2017 08:00:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-24
Message-ID: <20171225070036.1C1C4207C8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-24
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 250 |  88 |   4 | 342 |
   2017.08.x |  19 |   3 |   0 |  22 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         host-cryptsetup-2.0.0 | 41
                    brltty-5.5 | 12
             libostree-2017.15 | 12
                 libdrm-2.4.89 | 3 
         host-ti-cgt-pru-2.1.4 | 2 
                 libpqxx-4.0.1 | 2 
                     pound-2.7 | 2 
                qt5scxml-5.9.3 | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
     glibc-arc-2017.09-release | 1 
              host-erlang-20.0 | 1 
                 host-icu-60.1 | 1 
                   jamvm-2.0.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 mesa3d-17.3.1 | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                    php-7.1.12 | 1 
                  physfs-3.0.1 | 1 
    portaudio-v190600_20161030 | 1 
                 qt5base-5.9.3 | 1 
                  samba4-4.7.3 | 1 
                       unknown | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/06f4d84c98c9d2457b335073916e3e404f456c51 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/9ab9135cb480ff1d8b6c8923d3004b3141c7857b |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5103559dec563bf4055dc818f58d259dfa6259f8 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/66ce48bdaf6a8ad36a410ca3550f39e59ed283ec |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f31e617ae2236d57bcac9c684005ca547975dac9 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a5df09f8bd72b472585412e01d12fb48862fffcb |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/a3e8d900a4766252236b34a4971832dc0b26a28c |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/feba2d5b5b5a19ed0a4cebc122835553a8a1202e |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/69807a84ebc508898ac58d365169aa82d4ae0f51 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/f572cda277de0bccfcc3e601c603f357c0744aa8 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/edcb0b5c343a79ffdde86e4f2a4daac58a653ad7 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/04488ffc4154c9b0df35b52e64ca59152488e089 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e98e791e8970c54fafe9ba6f6ea9d18f895f8cb6 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2a99efee4927b5ad6fe453ae6f2db016be63630b |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/7b2506179477a1803f390294876eb1d8360c4cca | ORPH
         arc |      glibc-arc-2017.09-release | NOK | http://autobuild.buildroot.net/results/d98f70013a2b9d013710cced3103f2b79f421519 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1518292ae974bdb81c77432fcb130405b4e45364 |     
       nios2 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ae2ebbdcc593e98d2175e2eaa00427c5542248bf |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ac65d82a9b779eec4982f84dad4868059f0d7313 |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/dd415fc15e5718fa555369eb4b3706805c821bcd |     
         sh4 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2451675ad4eb4e3e4b770032e09b225962424799 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b34f867866a2724123309a058367ac9cdf11cddc |     
        i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/0f4f0fff2dc7a65bfe38db31d2585b8e2041fd7e |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f7a62e9cd8b97eacf9784a6f6fcc95df017f3281 |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/0e27b636812308ca87b590d8466e4979cf770332 |     
       sparc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/89c9661d77708be4b798e5164fa115b80a49ff42 |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fd4d1f7500260f062c68fdcd45a20c86c7b9f64c |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2545c236b5963fc6805f56d0a46843b04182c353 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/3d4e1b1d80a5da939718de4d9c39e6d873278bd1 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f3b0244a28778bd33144be6169e479abb0528eeb |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/33660efe271843754417b2cd0be1fcb3a53517fb |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5772678ded5fa5ec82383ce800943b2ca4fbffb5 |     
        bfin |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/96b2313fade052195ba7572ac50f266c1239dfcf |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/804a28600f8e8cf114d934d7313e367fa872ee90 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1aa634a4568f44a7fba0fe68a7fee3ad4cc64d65 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/55345104dfe50cb1d0d04cd2df969c0a0db9edf7 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ba57c767cfe6f1468bfd0d5b7ad67b2d61e9fe39 |     
       sparc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/af6fdac8d69d24260ec30323c5711852022d2235 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/343321ae5e2c73c13fae08e6f443df29015795c6 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/9e43d33a2e44724e690c0ad139ba45ed8aef7f38 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7ad119c62e5a80ea5ef7ee5e904b431a2caff9a6 |     
        or1k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c0ff1bc26621da706a66f33a1261532cd788d7ed |     
      mipsel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/4ef07fae8e2db135a2879756bad3670d9b964985 |     
        bfin |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/9b1a0463d599e5892bd15c0019e1843c95c4fa5c |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f4b68d4d85a791a848d0268b00c5e4e9f28f134a |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/143ff0eb8d14ba0799e90a96b4c9d862d4b01d2f |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/bb3ec7e260ef201cbbf7e6bb8c20c8df68ce77e5 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/87724c0c0d7095bdeddf98f8824be66864603dcc |     
        or1k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d82f10131b4f0e4f30f49fffe4a101a98503018e |     
       sparc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/3e534189e130b023c09fe7037ab6a0b50687327f |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/9dbaebc018b8b45788ee03102763f321bda316f9 |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5da927e5e3eb8aa30481b733f24df3bc488f504e |     
        mips |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/0bc1de40679130533407e7936f5ec3cef5f7a585 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2f655666d2708300b8926b2657ac1a09ac1808a0 |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d85605e958e50d223dc151076e39e2e3feeeae75 |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f55e172e51de4557b03376a0f5a2d96a0ddfcfb4 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/486ae3ec4f87546463fd943d91bb19494921b2a2 |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/cd66759c09a46b4842f940c44f0fa184675c017e |     
      xtensa |                  host-icu-60.1 | NOK | http://autobuild.buildroot.net/results/d5b5eb7cef7d8c84d9bbebeca6ebff06ac16d2be | ORPH
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/b0b38862b04426e9dd3d6a291a7012977cbe5a85 |     
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/8524b4c723caa026933844f6827438e74265ed8b |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/f1a33bae16809633c58187bf990a262e6facf67f | ORPH
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/de10b08cf37c2a700b6964c21458331ca01ea4b2 |     
       sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/c2385eeefad258d0de7fb34fe310ad46690bbbd6 |     
       sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/b01f8ef48b0362e2cf09323c07dec76407b184d8 |     
       sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/b45ec2cfca31c18ad93cf6f9991f22a14e2316d3 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/290defa9b5600ad654f02d9d9b38a0fd094ea859 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/c0244e85a2158747edf17e1470f64bb5c353b593 |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/9aa65f30640ee7ef3418c33a49f6b9d7c8c90d17 |     
        i686 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/fbfe365714cc61496d650c36f3024ade6bccb25a |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/279ed265fc4759d87562549abfb8a8fe6d5bc548 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/d5ead189eff485a628920d8378213bd032202951 |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/b58c28a27504c7aaf22cb8fdb8a4669969e47744 |     
         sh4 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/3cd7b10f34606eaa376d29be22fb39acbee310d3 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/56d80db990f1ba2f070eec9ef6e43f16f679ba58 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/9b8a8ccd22e9a027e37006cdf6b951c93c80b13f |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/0922be2f9d82dc948dd66b44e73b865ea40a3250 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/bde092b2e97634b77d842436ad60fc6b880c18a9 |     
        m68k |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/3ca66b351a6ca4f329a597b80167ab081fe01fcd |     
        i686 |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/6c33611d9f045f2f6827894823fa781b045f5330 |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/ee62ce205457429a8c6741492865ca316e7abee6 |     
        i686 |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/27ddba3ebd5fae2df8500565a55a283fefd32dd0 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/7a51377b7d97485389687258902ff5962f90351f | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/6542b91fee2e93347e80a049fe0844cd02d524bc |     
        or1k |     portaudio-v190600_20161030 | TIM | http://autobuild.buildroot.net/results/27a08bbdd2af42a44d76d4e94fbef05e8f74b1c2 |     
       nios2 |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/fd9a67ea3b748777215d0b99367a3dd077825096 |     
         arm |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/d3368939d7ffbcdde4ce4bd914236c61b86d382d |     
         arm |                  qt5base-5.9.3 | NOK | http://autobuild.buildroot.net/results/d9f698a30477fe93ae2db66f83f0bbe57b8a389a |     
         arm |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/3a29089203f6098d3239e8e77db564f96905964d |     
    mips64el |                 qt5scxml-5.9.3 | NOK | http://autobuild.buildroot.net/results/cef096df6f25798068087915a8e001ad1dc44a63 |     
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/ec40f7db7f62f9741776c2f03aaaaf7e0cfaf832 | ORPH
     powerpc |                        unknown | TIM | http://autobuild.buildroot.net/results/a1e765f5f6173660174a8385e5541c4db6d639b7 |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                 host-icu-59.1 | 1 
                   jamvm-2.0.0 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

        i686 |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/3eed8276051ee4d1f1062b96d17b85f4f8ddc6d9 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/3d9fd98d5f92eb58e6e958a3ce3ef4b343d53146 | ORPH
         arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/9dc2cb42087ba53acc4df6cac4ce5ea83e2b02ca |     


-- 
http://autobuild.buildroot.net
