From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  8 Apr 2018 08:00:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-07
Message-ID: <20180408060017.0C59E207F5@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  34 |   3 |   0 |  37 |
      master | 204 | 136 |   0 | 340 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 2 
     toolchain-external-custom | 1 


Detail of failures
------------------

         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/b7fa2e1006d244b2a85058a11963f15a063a38e7 |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3ed7727041901a56d354882f4568e53cc1ac4631 |     
     powerpc |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/0afc9db7318ce981dafcb868bb6e3ec5615b934d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.56.0 | 81
                     lxc-3.0.0 | 6 
                   flann-1.9.1 | 5 
   python-yieldfrom-legal-info | 5 
    azure-iot-sdk-c-2018-03-16 | 4 
                    liblo-0.29 | 4 
                  zeromq-4.2.5 | 4 
                     php-7.2.4 | 3 
          usb_modeswitch-2.5.2 | 3 
             bluez5_utils-5.49 | 2 
                  host-go-1.10 | 2 
           libfreeimage-3.17.0 | 2 
                   picocom-3.1 | 2 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
     docker-engine-v17.05.0-ce | 1 
                    efl-1.20.7 | 1 
             expect-2014-05-02 | 1 
                      icu-60.2 | 1 
               libupnpp-0.16.1 | 1 
                 mesa3d-18.0.0 | 1 
                 mplayer-1.3.0 | 1 
package/python-yieldfrom/py... | 1 
              tpm2-abrmd-1.3.0 | 1 
              webkitgtk-2.18.6 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/35f9f7a4adc6c2cad741079e4afdf1408c94703b |     
         arc |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/258a0d3e7d40ed2d558127d9d201a8d21c219f0d |     
 powerpc64le |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/3197c847eb12aebc3509a7e11741530df57d2f14 |     
        i686 |     azure-iot-sdk-c-2018-03-16 | NOK | http://autobuild.buildroot.net/results/70c9a898a5ef148acc92fb505a8d2608b8ac485a |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/0c8481ff392231071688ef043a918a655e351dee |     
         arm |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/5bd6feb5c799f86ac9fa3774f5eada2fa16319d4 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/faa9b1521f382d96d01f9d00894ad8f4ea724fd1 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/723665a54dc7540259a11caf1cf502b6d8b8f6d2 |     
         arm |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/a26d700a6952cc984b28dc26ad9837b59989592a |     
      x86_64 |                     efl-1.20.7 | NOK | http://autobuild.buildroot.net/results/b9c59daccf1390ff550516cb562fb87da71aedb5 |     
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f0cea5ea499b1ba34c5b66c9f01789e421e828f3 | ORPH
   powerpc64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/52d42023e84854ba20f3872aabe1c4eb110439dc |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/330504eb513e45e16ca1e7b4c9b72ed68e693dba |     
        mips |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/cda3a556209e4e30e2671b1105cf5e89678d4962 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/cb6e4bd2b697076940727bff5fae923ee5163f9c |     
       nios2 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/c83114ff9b58d0d4abf7d405139f2d785d1dfec7 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5a3c0ffc2b93895370e001f59cf7a895c941ff3e | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/1e9e2533c1de4a5d4285fd70100fa6375264a3bb | ORPH
        bfin |                       icu-60.2 | NOK | http://autobuild.buildroot.net/results/3097ccfa4b7afe9518a909d7e84fc2803c79822e | ORPH
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/5fdeb359f154adf713f2488910b235c2224b281b |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/095563e177076db593f010e738f550b9dfe793f1 |     
microblazeel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8cc0a4875e56f8e16c44bfe293e459cdc2d7c72e | ORPH
     powerpc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/959bc2603bb585bb214e2d9bac0b937df4665b7a | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/5b639d968d512f2e51b3af7c2490715992d7eaf8 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0b11919c985375febfa20366a93d1878fd6b3263 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/159f49b2f56d7b4cdf49d6ec257cf2560b6dab07 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/593e29e7d4b673f5179576874f1e28974b4447db | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/d78d3aec78f43ca233757526fee1e04102f5163e | ORPH
     powerpc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/05401cbaa7fb16dd738b1a2692413fb99910742f | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/beb7295d6ea711db31ce9cf8fea342404849c80d | ORPH
     powerpc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/3d2c5cc924769b73eb6af3d9d83259ec8f48cb69 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/77f5292c7b95239abfb6812b5a94db0c20a6c4a6 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/c58c473f8e755ef1f5a73992949515f0a193c488 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/384b074da9ee79bfecb40f465b9c51fb5d692aad | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/064d699fea9fa9febad972d8100db42e3deea825 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/457b586ffd28fe3897c5267851d76c20cc30981b | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0c92c6ba7c13423fdfafc2565b7ce24c06daeedc | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/7fbccf02d71c5192d7a2b83da1a2bdeec9413096 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/bba3d8d3a00c8885215ed58a8cf68e774cfa87a5 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/58d98c26ca0214e195d5de193b82445a856b9b7e | ORPH
       sparc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/a42b890f8b0216864920f6c2355795e17ae7d692 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/9774d155fbf1d7dbb9d3ce72ff661c63497ccfc4 | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/cd8942c0e5fca7cccafbd5bc3cc04af457091259 | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0876e08e2154abe7c7ed1bdcaee0f09599914468 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/90b002ab451c01f42d15eb2337b901b8725b81ed | ORPH
microblazeel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/383ed8e3af12ce7ca73d11ba7bc49fe39b7338f1 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/3389709e06258cbd4b5d05b715a93fc22ca0ba94 | ORPH
        m68k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/05e8fe7e5b7ebf2e807781edde1a8ee744896632 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/6c6951545bbd25716f9d3fb17cae1b2b80b7bcd6 | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8105c12adff942d39ebc4a08570faedd162228af | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/9914f9b1d528e846b100fe5404e32fb412943ee4 | ORPH
      mipsel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/b8989a1b989d3d0f0e5104d1dedf2dd0864df8ca | ORPH
      x86_64 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/e442a684ba47e7951644f4a177ab31e08456b6d8 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/b2323f90214be743dcfbfc08ad54da64085f48d5 | ORPH
        m68k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/b5416543eb99ae6e688244ae405a328c163bdcd9 | ORPH
    mips64el |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/18ddd0f9b294415b4f8bb2d9d588ebcb736f4e5f | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/e4165fb5ff6ac99aab4e17c4ddc2fc9949e231cf | ORPH
        m68k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/598f7ae899f5320e274bace256fc5ab5bd76c878 | ORPH
      mipsel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/08f2ac2a690ec99c9d2d997ec101a9f3ba9f8c13 | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/784a606f1980e7a3ea932e71cea2894375e048c9 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/d36be4f2635e7db1f47f4098ac9945ae5a25ffc9 | ORPH
       sparc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/159b69476afc7d5d6cfb53d76d276a6f0fae582e | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/7d7a4b362bcd63283ea5dab8e29a4aa24067c26e | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/4c2b13aaac26a6258686ad184179aff19b24148c | ORPH
    mips64el |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/349ee3d4720ff90cc6419ffd0fd018b5c3ebd714 | ORPH
     powerpc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/56b287d454e90fefedc948dd183289407c17ed57 | ORPH
    mips64el |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/7e73b562522eacaa33bd8b0c312374ada2d95278 | ORPH
        m68k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/9a9c2a1a5f8239bcce5528e2756511d727c4900f | ORPH
microblazeel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/fe93e326e1dc765042db4bc079d4983cba75ffbf | ORPH
      mipsel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/22490af57d3e8ab371f57140ad70cbaffd6e9bab | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/afa556842a5feebce005db87b56d2a0529001d58 | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/f7bdfb01a706603917a23ef2b7c7fa218548952f | ORPH
      x86_64 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/2b356f64a6f88570cb5286585a750c70461a85d7 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/30dd2331fca04bdd75b770af8e9f447a5aca30ad | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/d801a4a536bcdaf8101200b64a3f57a55a28bdcc | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/570c9be8cc41e5a8a4e52b69eedbecd8ce545203 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/db5769f874a0aabf51ede487573dc3cd943e20fe | ORPH
       sparc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/60a89da9c0158956299dfd9095b3e5b643553957 | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/f112427c614a93476924733d0ba7373899138669 | ORPH
      mipsel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/ed1251a934c681633c0de19814ab5d674a31df0e | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/f98247192e2f5352eab2ebda48acd6312d1107fb | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/2f5492c9fb20fdf5cd3f7ca99abd7752385b3310 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0fd0fe17d7c6d9ace5d4106eaf20f2cb67b4bd4e | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/990e19e3500986263f99354215e33214a2e89116 | ORPH
        m68k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/22370cfc8d6a1fe00399d0011d4c25299809d886 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/fbd3a56db8173c89d34f71021758f40fe1f01e10 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/9c3ccd345db56154861ad5755ceec9de46ca8469 | ORPH
      x86_64 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/7f2967ecbbb8f54e7593c0c50fd20a0b7f982fc0 | ORPH
      mipsel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/077918c918820d260d40ea64249f998e512eaa6d | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/ba9af284bf95d71209ffcf8c5528a0fce9bc8a53 | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/7631fb805978a723d04e851c366b3c4a3fdb72d7 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/2532205243d53e056aa86935078bf12fade5ea54 | ORPH
         sh4 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/0ab6438a99c2ca55e5d0ce340f6467c99e833701 | ORPH
        i686 |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/41e686a45c7a6872c2bda68c754ce63926366b9a | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8a6747b5516f5202eec0eceabea5fc29baccd45e | ORPH
       sparc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/b8ac2ae8a9883cbac8263fef8b4d8902996a7cd8 | ORPH
         arc |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8f2baa191ab2e8b9e99086e5d4b5fdd49858e83b | ORPH
         arm |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/1886a79a67f14da606dd8f2e742c86038dbd071a | ORPH
        or1k |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/3123f884cae8278cb36db2fc766f10b1c9449f18 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/8d90b819e69ec782db942c75a31f2852ff2e8bc0 | ORPH
      xtensa |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/2d2a0d809118c63a4ce288b2d3e5dc684dfb4ebc | ORPH
microblazeel |                libglib2-2.56.0 | NOK | http://autobuild.buildroot.net/results/9bd0b422b4a9293e14aaac37405ba213b5b6ceef | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/000a46954d0c6d3dbc4b4634a0d3a3c955fac679 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/6c2cd3a18e807a06a95fda32d7922fb1dcc7bb4c | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/58cb834bbd69bafc5cb0f23c236919c609648c05 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9de1c2007818082e88d77572abf8ff8a72e01930 | ORPH
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/08bb02f1357939a83bf88d2e3bb5ba860344d718 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/53a7e4ac0f68e7e06069e630313dd25e418f6787 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b655d6853c25a195df28d91512b3ffb6c654fc90 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/95e687d80d6cae6197be2aa4b58c5628600745ec |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6eb95f52268ce4706cd3086c2bed8ecbfe9a789a |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/581996723673eaf3270a89323bd1324a12d55a84 |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/18c80682e99ad6ef094d3a0d0718b0675cc00021 |     
     powerpc |                  mesa3d-18.0.0 | NOK | http://autobuild.buildroot.net/results/b7b961d27e0a5db7a9c3ab57ade7421a4431a272 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a4c82171c7a7ae28b04f887f6b912310a87cfc19 |     
         arm | package/python-yieldfrom/py... | NOK | http://autobuild.buildroot.net/results/a64e7bf9bdfd911085228398c55e1d802f33f2df |     
microblazeel |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/38cd314af207cd39f7681c15a4f5006ebb482baa | ORPH
microblazeel |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/c805e8f337babe0cd764f2e4e9f5f76872dc5433 | ORPH
        bfin |                      php-7.2.4 | NOK | http://autobuild.buildroot.net/results/0b6026fead4f7f77f3ab0fbf44bea09faf12d02f | ORPH
      x86_64 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/9cd07e1d2518c5745269d28cac07a6a4937c4c79 |     
      x86_64 |                    picocom-3.1 | NOK | http://autobuild.buildroot.net/results/65d0f449822f296dfe6b9be0e03a5a855f700a9e |     
    mips64el |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/dff21d63845d3d6a5f78c1000301cdd2104595f4 |     
         arm |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/220e82f555ce6c98b89605bab72c7ea3eea61c66 |     
         arc |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/337bc218142b8c5dfda605671506e336c5515775 |     
       nios2 |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/1a4086574c5b7a24180797d5172d44bd108193ab |     
    mips64el |    python-yieldfrom-legal-info | NOK | http://autobuild.buildroot.net/results/708d4985df042d128ea1a2a01e64ff360da1a212 |     
     powerpc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/b29a2f868438a2210873ea72f491db63175848be |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/8dc92d19d59eb28365d38736024371d29d236786 | ORPH
         arm |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/ddac3d21c071365a419af0ae588e29e2aa5393f0 | ORPH
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/738ca1d29ec192ddc7c67102cd96f48c66fe1a2c | ORPH
         arm |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/6c6b0ce8e9d34583903d29414731f1680a8ab8ce |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/909298d3d1f0e3d7d6059610c487c16cafcc8031 |     
      xtensa |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c06c4a3c4a25b20b5477f5f1318e548c6d4d1486 | ORPH
microblazeel |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0230509bdc006ebd6d81b4617dd5ae5a533999ec | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/04d98bd752b64d5952fc5603c1fa3284891197e1 | ORPH
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/dd6b33211a096c7060cbddc0c102b307c05c1d2c | ORPH


-- 
http://autobuild.buildroot.net
