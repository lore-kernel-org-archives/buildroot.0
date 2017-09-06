From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Sep 2017 08:31:21 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-05
Message-ID: <20170906063121.879B3208F6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-05
================================

      successes : 193
       failures : 56 
       timeouts : 0  
          TOTAL : 249

Classification of failures by reason
====================================

                openjpeg-2.2.0 | 16
               ifupdown-0.8.16 | 9 
                 vim-v8.0.0329 | 9 
                moarvm-2017.05 | 5 
              libtomcrypt-1.17 | 4 
                  stella-5.0.2 | 3 
                    efl-1.20.2 | 2 
               linux-pam-1.3.0 | 2 
                  boost-1.64.0 | 1 
                  cppcms-1.0.5 | 1 
                   luvi-v2.7.6 | 1 
                     mdadm-4.0 | 1 
                 orbit-2.2.4-1 | 1 
                       unknown | 1 


Detail of failures
===================

     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/82dc1dc831f25bbca1429f2b010fbefcf2e5b04c |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f7fcdbe9a2883dc74ca286ea0ff93fe975a3a2ec | ORPH
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/000ea9cca357b51802fbde5d5ca991cccba24218 |     
     powerpc |                     efl-1.20.2 | NOK | http://autobuild.buildroot.net/results/62e96be61601347e92f9c115209af4962fe82492 |     
microblazeel |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/d4620d6216a336bb46432e3134f08e6170f3c8d8 |     
        i586 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/cfd62fd72cd6e438e5bbee2df03ced57338d5056 |     
     powerpc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/b449da06a8e1f92f4d2a8b87a4db3c12ec5dd44b |     
        i686 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/0c989875016037a9f20a2c024ba66bb79a95d70f |     
       sparc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/9780cd73f3f4dbc5650f4b05df49d615c958dfd8 |     
    mips64el |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/98017fc9d13e15ac94707214e0f7f85a942de7b4 |     
     aarch64 |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/bce55cb473eb3261f5951ee6530a7cdfc8998724 |     
microblazeel |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/91575900b2a6ad7194023efcbd1fde89ad1e02c0 |     
       sparc |                ifupdown-0.8.16 | NOK | http://autobuild.buildroot.net/results/348808054ca27598c9a369d3c8d9f3af152780a4 |     
         arm |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/022a51d33d768c8f1962921f3ba4c2c568001427 |     
      x86_64 |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/e45bc1b0c0ccc7deb5591ea613816687bd45aa8c |     
    mips64el |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/7bb0536170f8d49a21c8258887db9721602662c4 |     
      x86_64 |               libtomcrypt-1.17 | NOK | http://autobuild.buildroot.net/results/dec8d2c9b72644c799ed867813ff7ffa9d01183b |     
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/27509d95022efe00f2b58f2f7afc4d1068e27ed1 | ORPH
         arm |                linux-pam-1.3.0 | NOK | http://autobuild.buildroot.net/results/16ed41e25fa1a085f293213322a1a5d82e80d749 | ORPH
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/eaa42c250f45ebdaac2d60c839abe2dbc2bf2f4c |     
         arm |                      mdadm-4.0 | NOK | http://autobuild.buildroot.net/results/d04c55255097e9cfa7ecf4629793375f6eab61d2 | ORPH
     powerpc |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/9089390856fd45e170abdbd657d5f6a121716156 |     
    mips64el |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/415ba49dc05feb3a3f2274735d50db89d367cc52 |     
     powerpc |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/c8e45b1c3c2c0b664de348486546cbc7c8d01e96 |     
      x86_64 |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/00edf26089077d96fced4cd7f720bbc2a86ac2df |     
         arm |                 moarvm-2017.05 | NOK | http://autobuild.buildroot.net/results/4688d616ed39666e8f3bba0d54e7d9c0caa46dab |     
    mips64el |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/709ab4bde22efd69b962e2311174438a1435dd3a |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/15e165c06bf35051e62a8b41e7ffca04a4c52188 |     
       sparc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c6a008c7ba5e9bcbecf5d3ea751b07d67d6b62ff |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/a55f8c3f779598ae6621b4c42285eac61215e7a7 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/d45b77149d87d47c7173408545ebdde93a2b5257 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/83917f7b64f91c77ced89763efb0dcf2e017d73e |     
      mipsel |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/c055813a5ea3e11a5a87f67edb25a739df5e95db |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/0fb4c1ed73d937345dce9dfe99f36574ca010d37 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/44d5f9a61afd04e0556ede292cac10ee6223a6eb |     
      xtensa |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/4849ecc0e3da5d8ba55d665414ac26aee07a33e4 |     
         sh4 |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1529f3cd3a3689d33ad736e7ad02f8f4e23be107 |     
         arc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/18fcae4e0d526f95dc947e255d2f12530d882c78 |     
        bfin |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/533fe88e6032633a5190d58c167c8a7fa90ac72f |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/89e861ebd5378bfb898e4e61225f241c3040c809 |     
     powerpc |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/67999356a4a18ccd2845a9e996692f21062e1f98 |     
        or1k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/8766ecc3ff9c0335f162dc2031a7aa5f19649f02 |     
      x86_64 |                  orbit-2.2.4-1 | NOK | http://autobuild.buildroot.net/results/bca2c064cac7ddf926299990faf9ee0ce4d9353a |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/b4dca20b5a55372660c412c62a3a76c8af728eda |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/10b73362358f3af45534a0cd096672dd1460a7d0 |     
         arm |                   stella-5.0.2 | NOK | http://autobuild.buildroot.net/results/18c1106eee809de48865bf5ebcf4c7445fabe45f |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/32f224f81789a5761c9eed2bc24f67bf88bec2df |     
    mips64el |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/0105e3ac0be0b7ef154037eeb12f34d654d2e7db | ORPH
      xtensa |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/e255cc5761cf320732b795ed11b5bc64b9be4507 | ORPH
      xtensa |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/351fa4464c304646968c8dc0bce91a69a08f1792 | ORPH
      xtensa |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/becc5132673d78fad21d8690c2f27d509d1dc89d | ORPH
    mips64el |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/47034717e1d37a06be71ce991c3b728da045916a | ORPH
        i686 |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/3fb725baac1e5ebfba7cc8945530db3cb6f12b15 | ORPH
        or1k |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/1f62173b54835cefcabfd10f816cceeca0db76d5 | ORPH
        or1k |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/839c42359e0ffc1440fb75f3bc4d8d39351b21f9 | ORPH
    mips64el |                  vim-v8.0.0329 | NOK | http://autobuild.buildroot.net/results/3f0f6b43b149a5d0272274481e7706516607aed4 | ORPH

-- 
http://autobuild.buildroot.net
