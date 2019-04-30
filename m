From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Apr 2019 06:00:28 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-29
Message-ID: <20190430060034.8C85523771@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   5 |   2 |  28 |
      master | 214 |  47 |   3 | 264 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    dhcp-4.4.1 | 14
                bind-9.11.6-P1 | 11
                cracklib-2.9.7 | 3 
                     gdb-8.1.1 | 3 
                       netsurf | 2 
                   netsurf-3.8 | 2 
                qt5base-5.12.2 | 2 
               wireshark-3.0.1 | 2 
                   bullet-2.88 | 1 
                host-libsodium | 1 
     intel-mediasdk-legal-info | 1 
                   mutt-1.11.4 | 1 
              qt5enginio-1.6.3 | 1 
           qt5webengine-5.12.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
                  rpm-4.14.2.1 | 1 
             subversion-1.9.10 | 1 
          wpebackend-fdo-1.0.1 | 1 
              wpewebkit-2.22.5 | 1 


Detail of failures
------------------

      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/f155ab7cf311b753b90b15f43178bcff3024b63f | ORPH
       nios2 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/ab965a2a712fa0d91012b5d0f92c02795ff052c2 | ORPH
 powerpc64le |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/5b05a661983358a3d222a49fa72927710173ccc2 | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/0359dfc6885a180a616dbdcc952b2aa92a1a99bd | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/3208a86c921d9982314929dd25fe2cd800a24101 | ORPH
      mipsel |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/db49e21edfa0273f8c2c5d9c619eb40dfaee3fb7 | ORPH
        i686 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/9e027a69464745bc43e88c0e23780047d9fb396a | ORPH
     sparc64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/4b369da4106ab4dca57dab2ed6f9018367c86cd7 | ORPH
     aarch64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/05b2162074ddf3af2eec0e9ef1039c576c89c087 | ORPH
      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/25ec05957d09057f9df7dd1e9925c3a193fe4e21 | ORPH
        or1k |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/cef3585b65a7d00002266ee4078885ba18362a13 | ORPH
        m68k |                    bullet-2.88 | NOK | http://autobuild.buildroot.net/results/9c6325e6cc86116d1e8c940e0fcfe94243faa6de |     
         arc |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/4fbfa698042cd07e68410069e4bea88a14758d08 |     
microblazeel |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/0f0dd582e8f1e21a488ed25abb09e026a1947779 |     
      x86_64 |                 cracklib-2.9.7 | NOK | http://autobuild.buildroot.net/results/94384c514261a8952240015863e75d4d44014bb8 |     
        mips |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/43cc7ae0804995186a4e8347d79d9caf724fd239 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a35cf381006589a004bde8e8e32830860753772d | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/a75d9a3c9c20bd07cd85aa23f1f79caa94f6c8d7 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/7f88133f8572e1a674fc95654b430c95376ce2c2 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/bdd54c8d68d3b11c4657331d93b7f9bd72a57b19 | ORPH
         arc |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/1745d7e4dc50ad97dbe894258e62ff8c8420563e | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/3309b027854f5c4c3c39903e4f4f3e7236f7d0ac | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/51de1a31e37bd0bde0aef699b831288bc99cf889 | ORPH
        or1k |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/0b8fddd03d015a5acad36d49d23b63732f3965fc | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/2f7e581f237e95463a708bfd5cd243c4416db003 | ORPH
    mips64el |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/6b4d230ad1f73f8c77a4e3668b2e6acb3332d74e | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/ff2b86964becc6b32c5f1cef5c31cf6486c828b8 | ORPH
      x86_64 |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/89c8d2c6e6a03971544d56e23ddb8f6d009a610a | ORPH
         arm |                     dhcp-4.4.1 | NOK | http://autobuild.buildroot.net/results/884e92319906a5fcae97b3abe03f83ba9e1d7057 | ORPH
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/55d823b1dec382d7a281e93a9aa8b48c39f1007b | ORPH
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/c27b5d744001ba6b14626e2dcc199bb3191a95e1 | ORPH
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/6291e2acc372648636829cbc343864376ffaadb7 | ORPH
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/66cb45de0ecb0e50764fd1c622e60417c8c0ee91 |     
      x86_64 |      intel-mediasdk-legal-info | NOK | http://autobuild.buildroot.net/results/5730991fded5ab3474cd0325b399f6f27972ca81 |     
         arm |                    mutt-1.11.4 | NOK | http://autobuild.buildroot.net/results/41a167544a594b30a79d801db61aa65a05032886 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/ecb26f9788fa2f483d2ca43a778388a31504d9c2 |     
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/cafca02ba9a97857036209da04c7f30a68d40d4e |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/d8e381dc3bb3cccd186e2f11171f71d531457d99 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ff96c7f224c72557ccb7e48221def4c3d7a145b6 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/1b1f3322d6d59289d9adaee72d2c6c92b1f32f03 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/9a5f595cc34a38bf6b08539ce6f4b1adc7cb2104 |     
         arm |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/bddc9a213e7de55f4355d4ba992882abc3f2f2a6 |     
         arm |            qt5webengine-5.12.2 | NOK | http://autobuild.buildroot.net/results/19a35be48c224146dcd84d25cfc40feb98c2b5f6 |     
         arm |       qt5webkit-examples-5.9.1 | NOK | http://autobuild.buildroot.net/results/46b5106d6d25f18e1bb69963bef7f1210143e6b6 |     
      mipsel |                   rpm-4.14.2.1 | NOK | http://autobuild.buildroot.net/results/6378ae2a8afe323c331c1ad5109967792c8e7162 |     
         arm |              subversion-1.9.10 | NOK | http://autobuild.buildroot.net/results/098a05b397ba1b05df561b6872b39e17a2bf27df |     
     powerpc |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/0b2d7c61b1cbf17383a495de68412a8d66e6fbe4 | ORPH
         arm |                wireshark-3.0.1 | NOK | http://autobuild.buildroot.net/results/528eb75a99820b9920e15f351b33497ae50ed223 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/69c481c9739b6f6f423e5958b30de81b3cc8c25c |     
        i586 |               wpewebkit-2.22.5 | NOK | http://autobuild.buildroot.net/results/0c2a51926491b112b8b0fea85e3a16422c0b4ad4 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                bind-9.11.6-P1 | 4 
                       netsurf | 2 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/2615ebfdcb068594d028af4823260e613d37e867 | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/c25f81d64e213e48bd7e972d632da6db644855f5 | ORPH
         arc |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/57995e862bfa80c6e244ffddf4fb85ce57142d49 | ORPH
    mips64el |                 bind-9.11.6-P1 | NOK | http://autobuild.buildroot.net/results/e76df47690440de0aaf40bde069adaf1797ffb26 | ORPH
       sparc |                        netsurf | TIM | http://autobuild.buildroot.net/results/f6c7defff15306395f81383c73e7dae2bd2c576b |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/3632cdaa818108dc31b72b347e82a9e29d3a5481 |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/6e4f0d4b310041a74c4f892c15caf00ef1d90018 |     


-- 
http://autobuild.buildroot.net
