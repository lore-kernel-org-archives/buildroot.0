From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 08:00:38 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-29
Message-ID: <20180530060038.E361F20D99@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-29
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   4 |   0 |  23 |
      master | 157 |   5 |   2 | 164 |
        next |  17 |  21 |   0 |  38 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   exim-4.89.1 | 2 
                   libnss-3.33 | 1 
                  samba4-4.7.6 | 1 


Detail of failures
------------------

         arm |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/b34e1f1105e9fbdaff003fd91a4e16e21af61efc |     
        mips |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/de2552a406535cb013f34e1d783cf650066a0407 |     
         arm |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/e3d5c7a2ad9f214e9faf74c1ad8baf71ceb4853e |     
         arc |                   samba4-4.7.6 | NOK | http://autobuild.buildroot.net/results/b13ce5d72806961a783a528b0a2eed02acb14e76 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

gstreamer1-editing-services... | 1 
               log4cplus-2.0.0 | 1 
                qt5base-5.10.1 | 1 
                       unknown | 1 
                     webkitgtk | 1 
              wireshark-2.2.14 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

         arc | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/2717f59bbe10bdc1769a6eb9d8e09d6c8c6dd15f |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/3ee0396fdb78f209834b09beea6e6785272e9ff2 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/1f167feebb04924f148bc792718ff80ffd085b1d |     
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/5e3422443702221780c3c91efa2108806660dbb0 |     
    mips64el |                      webkitgtk | TIM | http://autobuild.buildroot.net/results/b62949d7cd55e148f9aac92b0e9fc800cce26034 |     
         arm |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/7384adae1e15ef8361fe60d6119f9c0bf925b26b | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/6ba7a11e2e176de7335a6edd797c6615fb94b104 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 9 
         conntrack-tools-1.4.4 | 5 
host-imx-mkimage-rel_imx_4.... | 2 
               log4cplus-2.0.0 | 2 
                cifs-utils-6.8 | 1 
                  host-go-1.10 | 1 
              librtlsdr-v0.5.4 | 1 


Detail of failures
------------------

      mipsel |                 cifs-utils-6.8 | NOK | http://autobuild.buildroot.net/results/4b95404a89a595ca9c1e3df912169e9d36ff2bd7 |     
       sparc |          conntrack-tools-1.4.4 | NOK | http://autobuild.buildroot.net/results/c4b833d30f4fcd9a400ef4f1d8725d6f210e406a | ORPH
         arm |          conntrack-tools-1.4.4 | NOK | http://autobuild.buildroot.net/results/5e1ea89e01a9cc13bd384c97903e1726df6d2228 | ORPH
     powerpc |          conntrack-tools-1.4.4 | NOK | http://autobuild.buildroot.net/results/9c178ec5ad84224a385c3184f09ea9b65867a302 | ORPH
         arm |          conntrack-tools-1.4.4 | NOK | http://autobuild.buildroot.net/results/0aee137c9977e0fb33e7e557b75481780b90edcc | ORPH
     aarch64 |          conntrack-tools-1.4.4 | NOK | http://autobuild.buildroot.net/results/906294c51bae69c5fc66c56da1cd9f3e8f2e4b45 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/cef55d42d3d3f167f20d9c82caff241e32d3a89f |     
      xtensa | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/662c31750611ce97a1e2757e54475b952a815728 |     
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/10a3e6f45542c12ecf5de0c8f76d63b4442157bd |     
microblazeel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/554256f771861c50ab9887ac6552f11d078ade73 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/85f4c7ef4d288347a1892b750de62cf1bfa2f603 |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/fbbc0c3aad955fc77fd5a1f8c68d225b54839540 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/216e788a6069ed43a988dbe7f960782c4a662020 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/0830b985fff1a21f00b24cd5dc9d39add861ff0e |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/5dd7da61018ca56794b659a7c219cfff5bf53ff9 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/731447d78a2aee16b187b0e54c811b84e37a7333 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/c3ffe6595ecc505e277185a8e2f7fccf8cf30f88 |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/f8c412ce7e4a554c999b8ee577bd185ffa7313ea |     
        m68k |               librtlsdr-v0.5.4 | NOK | http://autobuild.buildroot.net/results/e68a37b057d9060bdf9f2a51a26791bff0219293 |     
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/ce001dabca61f2102b8f0199a55e54ee1a1620b4 |     
       nios2 |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/ef0d8d7fae835ff555202f6de320945226ec00bf |     


-- 
http://autobuild.buildroot.net
