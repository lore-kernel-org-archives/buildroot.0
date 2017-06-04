From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Jun 2017 08:31:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-03
Message-ID: <20170604063107.5BFCA21CFC@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-03
================================

      successes : 207
       failures : 167
       timeouts : 0  
          TOTAL : 374

Classification of failures by reason
====================================

                    exiv2-0.26 | 38
           uboot-tools-2017.05 | 29
             ipsec-tools-0.8.2 | 24
                 lcdproc-0.5.7 | 23
              gettext-0.19.8.1 | 10
          host-doxygen-1.8.9.1 | 9 
         host-gettext-0.19.8.1 | 9 
                 libiconv-1.14 | 6 
                   bdwgc-7.6.0 | 5 
           erlang-jiffy-0.14.8 | 3 
                ejabberd-16.01 | 2 
            libpwquality-1.3.0 | 2 
               libupnpp-0.15.2 | 2 
                 mplayer-1.3.0 | 2 
                     gpsd-3.16 | 1 
                openocd-0.10.0 | 1 
                     php-7.1.5 | 1 


Detail of failures
===================

        i586 |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/c9ec16635fbdb2d6ddf11e317bc537c111ea7050 | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/c22ec44e81b0754c2b51779312165a8b98660a7f | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/be72890b1f8db8f96be089151a95cf89c72e512c | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/2f964ef37de9420c9af88c76e9bd73eb5decd5ca | ORPH
         arm |                    bdwgc-7.6.0 | NOK | http://autobuild.buildroot.net/results/c0b9dd1c25892a8130deafd1296710901bddeaba | ORPH
     aarch64 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/aa29638d3303c8974a1c1d70fd62f3025781463b |     
     sparc64 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/b0e5d54019243a4ec4cca8f3dc3a4f88d0cc3320 |     
        i686 |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/1b0a5b31876c1d060943fdf0da0abc519c5e4d9c |     
     aarch64 |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/fa984a0d53cf44b6b84eec4d1c0a3f38f0f1cbd1 |     
     powerpc |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/120b0239e16714d4eca9ce9001b60c0988b0e898 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/6e3d181e537610c2c9bd26d0cbb8b50f1a5ad7b3 |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/362104c1e2b6e9843d4c84a61b683a87bdf5e641 |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/b6fa034745171a799903dfbb589dbb9f2f5f9274 |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/6664ebb05dba39f0d3335b175c51d8e88685550c |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/44b557d9793a9c56e7bdd158ea3bd1244178e10b |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/01896423702555d4b5f599587b1b46d66c44f60c |     
     powerpc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/defcdd3dd57b031c31bb16c0075f079a482bf52d |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/40fdf1c20241363778cd6924e3c71d0c81ca01a8 |     
        or1k |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/98a9ff77c45c576cb283638c8fe57e8abe05223f |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/8104766e516903e70149372f7e476251fe63da15 |     
        mips |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/46f273cf46ab5050ce7c23c968fcc7ce69f32626 |     
 powerpc64le |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/6c0264bf35c4cc0c4afaf6001930fdbd6125029d |     
     powerpc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/375d5f00b2215f5cfc517759704f12c808a67c61 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/67fb248f0ab0bb993ca292c13e92768aa58a5982 |     
         sh4 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/74b384a3ca24fab9ee7efad43d4c4db959faf961 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/d326b763a2b5a95196719eaa542662a5edc6bad9 |     
       nios2 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/2ea63689fc59c3828c8da9e1cf93a63dd4482e6d |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/2958741c9d2a4f9bd08f730fecc93ee4aaf415f0 |     
microblazeel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5360ebb4cd839c28f9454aea23c9d664536a0b04 |     
     powerpc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/dae04b6c9ea6c0085e15d4b569a55089dba68e34 |     
 powerpc64le |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/b6ef29d877f36259808fd0df6eac089b9d78ec1a |     
         arc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/a3f018e35f3a13346c2c6926df875ec174837bf2 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5a12ff99cbafb569559b3b3c121545137015e90e |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/24533261729663c6cb34ddc8d493c6f5f7eae785 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/963e4d0858156a4aa428b7edbe5d3031fc62392d |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5486b7985ceb6e7699e890aca7ba5958f922a726 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5f4ded3e5d767ee8deffe7974538fa0a7827c3ed |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/913bd19f29b7994eb2b24ec840ddf08de2c1ac34 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/1d81a3812c55454b72c09a4071f50ca0bbe47dac |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/97f01c280c86a858719acf09a28952f66fd3bd42 |     
        or1k |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/14719ab78793a3ab30ac8d4a8a1b213684bf0da9 |     
     aarch64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9c2d4e4491b332c5d8154e7ce0e3ba6e0ebd537e |     
microblazeel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/fb48d618bf79e8769d1fb38040fcd172f75e00db |     
         arc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/705aaef04b016d7971c8ac1893f0a6e217985c8e |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c4847775d1543ea8e62f2c43426e8defb3c731bc |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/1eed97289fa3d29fb9b4e107a469fd722e4fcf6b |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/ec0bd21fe6bc30164d48c23e1d243791e1020f16 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/693b401e436431001318dac2749f6245162a6d91 |     
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/53506f4bffcb95eef71f5b8b1995e1d7baca1077 | ORPH
      x86_64 |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/e721369f3f92a5571528ea7d61c4a4ce787c0b89 | ORPH
        i686 |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/804d0f5d17ea8cf87877454ba808c2c1a0c2acf0 | ORPH
      mipsel |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/5a9a094ad3ffb8ae7431c298c4f903aa7be2d047 | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/dd6325c59f2ece958b5c73800693a804d3037737 | ORPH
      mipsel |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/28b03f835f9da1f35745d944c80e550f7736be52 | ORPH
      xtensa |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/ffac1a9d8fe32a4bfbd51b06cad2aa1842d853f3 | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/813d39ce4bafefaa6a9f8d618a978bfce715f0be | ORPH
         arm |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/05466b38e3794ecf1c0e20a2324350a19a15b2b6 | ORPH
      xtensa |               gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/2e0e7f25949a73a62da82ba0c00b52096456aa02 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/c8d7c13c5bab7509800eb93961a2cf63cc6f40ae |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/4d4373a7920181e948e19dcd2f6bb8bc6c08becf |     
      x86_64 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/5564a102e34cf28775f8a2ee68ce74e0ca2bd590 |     
    mips64el |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/7aa298c7770ef9456775a6c114644cde879cbeb2 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/1272fbd8baaf0871c5f3183b0b7d79b031f90d51 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/ce0a4b869ca86c2db123289d5ca5473c97895eaf |     
      xtensa |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/3910c76124cff03cb2ca167b243384015b1fa02b |     
       sparc |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/ae0738684b702b09ef751f74f084cca6be92d2a0 |     
 powerpc64le |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/0f4d179a6848fc21a7c277124b1d75c3fe42745f |     
   powerpc64 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/1061897f331e689722c9d08d50e540346798bf7e |     
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/dc15f4d2c225c49f80de1bbfccfbf7810f3c7bfc | ORPH
        i686 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/46519bb16d955aaad0e090c97e61ce861599baf4 | ORPH
     powerpc |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/cb5963ef3573a041fcb0784f5e0d70d6a39e4106 | ORPH
        i686 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/b6b13a9c6169cb45a5b8b216012210d2c0273347 | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/b24e0f0e1fbc7402df59b6840bf4a389dbc20cae | ORPH
      mipsel |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/ab72bc00a95e6edd84c9837619c6ee2f6226d957 | ORPH
     sparc64 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/ae743aaf5933c2e4a0bf3ca75aa93c16540422f8 | ORPH
    mips64el |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/afe94a99df20e3421091d8b76243a7fa18c83e76 | ORPH
         arm |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/d75eee956091e90d0cfebb0c430c5fa89d1faa96 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ca7a15e9abbd3c176cd1279e1f99c5db04999a02 | ORPH
        i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/73f473fb26d3a3c887091dbaa56f91924aa2e5ef | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e0644449640157c95b2a854076f857d8513ba4e7 | ORPH
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/991e4dc5a6880e9df8d1339220eecb942ac75fc8 | ORPH
        or1k |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/a8772fc189f084196fb4abdac1aaaced771a4205 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9475d60fbe3c1fa6fe25b17307889a315750ea63 | ORPH
       nios2 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/c71c3b2854b5be09be83225980083095a12d5dbd | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d0fda9434dad6e0a011c60339dbe77ac92fa38ab | ORPH
        or1k |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e6cae2f98e8c3820c605c8c5c04df7796f6ff70f | ORPH
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e67fe987901030af59373b4a2c31a0631b2c4356 | ORPH
       sparc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/ac0fd04d38b3d0bb56176705ab0f131ff97e7092 | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4f26b58fa8307df9693368bd05f55c3d1f79057d | ORPH
     aarch64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9192a69a5dc4509f5cb1a353a8e70bcea5623b32 | ORPH
       sparc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b7264b84b018ce3ebd31b855e7a7ad46fd08ae9b | ORPH
      xtensa |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b61bb9b6b47bc6907c829475b353f6a0556b501a | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2940f890c731e5cde9f59f0410f33289f102310f | ORPH
 powerpc64le |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/5ea171267bbaedcb4996016a1e7478bb0c73561e | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/14a7db9905bd98048312abae59f2fe9effba0bce | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/77e7fbdbad3745369b23361d6cfd76ef8a309621 | ORPH
microblazeel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/939e5bc9349fa784b640cd348ec5cb653034c281 | ORPH
        mips |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/655702ade49c82b53c447a736327db518f2b823a | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2e13d752270133277f2cca857c03b891bef826b9 | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/521c8e92a001f1df4e724de8c19127fadcc59553 | ORPH
       nios2 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8feea5b974d0d3c580fd48cdc5ccceadf8166fdd | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/befb406709724a7230bc7ffe3c5d7cab5580f622 | ORPH
     sparc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/662aae3a540345d9efa539812584f8db02104a45 | ORPH
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/1ca04a8524fcd4f8e10ea8aa6aed940c41e3db70 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/3e2868be226f1a5a7847dc4446575ae203073243 | ORPH
      xtensa |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/946435eb5bfed661df79e6d1f204abd6246956ce | ORPH
       nios2 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/9c3f77e18ae244a2abb9ea70b6adebe215f143a6 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/d49c8c846107e8a5639ace264766c0611b72d348 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/311e67e1fb7c81c9a61612f69da3e83dcaecacdd | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c13a31fe6e7ad11ddda43b6cd9b1c53fc1d9b647 | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/5cff3cb2b52fc65c5df1ebde58f98a606912e083 | ORPH
     powerpc |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/980323370b209dd4967ffa55f3da3eb773a72fd0 | ORPH
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/f7f764fb80b80c3d7028340c9b42474fe11343a9 | ORPH
   powerpc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/92a7e03af52307c6ccebb5c737e55ec5cbc3e2bf | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/1df4b39e5f740dd5fb18f3e077e3556a34ce8b83 | ORPH
      mipsel |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/31e7462eb29732543dca9d4a531744db4c017976 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c819a8ca46911f53daed7e9e68e6b3ecb2cd3da8 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/1bbf4e49deaf1dec482fb191e55f3eda88c67511 | ORPH
     sparc64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/ba5ada3c17e2f76b95c67fdba88df283739ec15d | ORPH
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/573470f575ba9e4395c2eac3517f75cd879e486b | ORPH
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/7267a8bfed28d54b7a54250cba36631cd23ea3bc | ORPH
        i686 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/f54d5f551b24258bc779b6f8f9ed479becf6d3f1 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/53e24416d32c1f72231ca16386a03531705684ca | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/796d02d1a6289238f5a639c8612a195f9c7edaa5 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/0f7af799a19d3d0696eaa119ea21dc2636e7e2cc | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/8c97bbd482a6e8600a4064ad656f0d0559dea2de | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/361b32e8df3edd2c3995494c17e38d48aef1eef3 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/02887cbdfeee8cf8bcb2cc168c1b381eb870ec1c | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/589aaaca6048fc52f50cc3987f46a5e1d3ba806d | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/61bbfc839f99feb043d3456f107429d6e5319258 | ORPH
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/927ece98c571bdf2c08ae46b307c21c1cb5cb3b1 |     
         arm |             libpwquality-1.3.0 | NOK | http://autobuild.buildroot.net/results/05db309483be830c95eb7661bbdc68baa9d03e07 |     
     powerpc |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/b03b20fa9ce50bf216fe2a54d805f3c05d0985e8 |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/08e93735579beb2ae71389967a26c57226bc65f4 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b121b0443e6f21725df2902c9e102ac21dc79df5 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/dc278544f91c8d6a4a94b040735ecc0ba8de6cc9 |     
         arm |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/638b9bc206c31eaa4e2bf4321ed0e7204c3e7705 | ORPH
         arm |                      php-7.1.5 | NOK | http://autobuild.buildroot.net/results/cf5840bf58d38ae40e93c2536031c1a09e082c13 | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/8a53fb7f5d436909c92d12307b1aa06fe6333ab7 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/bf4b30d48097c68fde90af70e2f1a227c20c756e | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/8b0892e34c8e4def51f7877d1ef0b38a6a36e9f7 | ORPH
   powerpc64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/2324f1a046798b320adc9403d3bfb5ee36e927e3 | ORPH
        or1k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/cf5344a3ef4f1c261dac68bdb9bf078bde60685f | ORPH
         arc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/1760e48fe946fd37b1d4fd3f8db97aa7109b5fd3 | ORPH
 powerpc64le |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/abadd010d01c4bcced47fd1ad731536e34ae5a66 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/9c61738724a793c64fac4289fa5eb900bc591a87 | ORPH
       nios2 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/cfaab8eb13f77e843dffd17b2b2b80c2bc62b220 | ORPH
microblazeel |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/e2e57f709e9acd47465362653c2187625b0edbd6 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/979cdb8bb7b8269030baa5e913c1e496f67615eb | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/a90b5e81f50391ea383f50f0a599144470cf59d6 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/c2362c9332ba0357fadfe4e5b97d0d7403b068d8 | ORPH
        mips |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/a860712e7ea6d567df2059c24b4f7639474c6406 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/ca1c9438136bee9b55b332fea8115df19ca37438 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/3c1b03e2b993cc4ecdbe86bc6f662c97c420045d | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/1dc622898c3bb159b0275b17ca3b5623af0c1615 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/9a2313e3aa8a1db8c86ea12618797e53e9f13c27 | ORPH
        m68k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/7f38af9a645cb969aa16a4d4eb29eee83b75b5f2 | ORPH
      xtensa |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/9e8ea903c4d2b08081c4666c8f04f2866266ce55 | ORPH
       nios2 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/b29e98b22f0b58ff2e30f2af6ac7f5d74b42a0d8 | ORPH
     aarch64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/b9861a9efbaa6bc29922e928288818d040aaf0fb | ORPH
        m68k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/07aa8052d98463db0d720b36c856e78548456a23 | ORPH
   powerpc64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/94910513d1b14e3b02ec4aed34de89d1b1d7a12a | ORPH
 powerpc64le |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/83487353e3bb53ba641cbfbb55ed0d41252ebc60 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/0ce35ab102142b840ad0ac7cfb0e0a7a0fe8dfac | ORPH
      mipsel |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/39597777508b2f9c6842e142377ad5f109d7fba3 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/243150b70a2caa641c4e8dd854bc920e72598072 | ORPH
    mips64el |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/f777be9858205a4d3458e807644d20d7b67ae218 | ORPH

-- 
http://autobuild.buildroot.net
