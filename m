From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-18
Message-ID: <20171219070012.64A4C20734@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-18
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 174 |  52 |   0 | 226 |
   2017.08.x |  18 |   0 |   0 |  18 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           shapelib-legal-info | 18
                    brltty-5.5 | 15
                     vlc-2.2.8 | 9 
              lynx-2.8.9dev.16 | 2 
 netcat-openbsd-debian_1.178-3 | 2 
                   jamvm-2.0.0 | 1 
                 libdrm-2.4.89 | 1 
               libgpgme-1.10.0 | 1 
                    php-7.1.12 | 1 
             qt5location-5.9.3 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

        or1k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/3fe2d053dcfdf5af791e9127f3e9f1dceaabfdc0 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6cfa5e9d37ac1571dc58df538232bb9e1749e62a |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/7b83f7c2722ed6990a141346dd1a5b59e3d723ad |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/384f776a08cd44edd553b211b4fa128064b6a4d9 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/06306bef4ac2e4eecd9b2204875e08b271d5423d |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/beb326790ab539fc3a2a3ebe76062bb85375cd98 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/bb321ebf2e7107d26c1d07a938305819f0642404 |     
         arc |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8b5dab29923ab1609d470bb215ee648c36fd82aa |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5832263850b0272fac69faed27e6a1ec3c1a2d0c |     
     aarch64 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/13a4d622b453991971c0957034a5a8888f5c6dbc |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6adc5bd14ad861f589de7d7ac906754ded3a45bf |     
        i686 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/008cf7c8d609d62a47757b13c1b58e94119a89c2 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8e1a5a3f64be157c9abf0e7b14fceb503f9b408a |     
        i686 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/2b4163228d43248509ee2882fa541ffffc298ab6 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6eab23791ae65052ace26a5067b2c94a6b038969 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/4e99bbf523dcffcdbf8309be69f0b518917c1b72 | ORPH
       sparc |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/d05696d1f77973fc8a8eb4a27a9321b1d1ccbfd5 |     
    mips64el |                libgpgme-1.10.0 | NOK | http://autobuild.buildroot.net/results/aee5db5ee4ba2482f07191fea671d2e301664638 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/f6477d1fd2fddf1a6b7d1148fb536680282098d3 |     
         arc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/8c59fc977c978809e68e0f4463f8c997703da545 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/8b3df48e5f477868ebff544a6f9f2bc9ecec6375 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/1e3d2b481b53efd06274f8df5d47311af23c70e9 |     
         arm |                     php-7.1.12 | NOK | http://autobuild.buildroot.net/results/3f0988a90829546fc9762442c6e9815fb4a16f03 | ORPH
         arm |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/f0422937cd1cdedeca526b338f21cc7a0a35d97e |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/493c985266c67138d358497b63e404d71c8da989 |     
        bfin |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/0f9474f52c2f8c6f0e260ec4c2ce829e3380edda |     
microblazeel |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/448e78e275f6d3e5fbedbce63aba8be1f3ac5785 |     
         arc |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/b22cbf010811e82e6967db51e09f4bd26fa43f63 |     
        i586 |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/4cca9be757dc34a97fe3c63ed4f5e5e28ba386e5 |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/b3d36a0eb310959a59ea6ece29d2ef030ea3c8a4 |     
    mips64el |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/a87c99f30a8c06e3cef1e3e88a311e2157787eaf |     
        bfin |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/7880cac99407db266b309f9912946919f1e1c31b |     
    mips64el |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/ea260d92b1ff59b52b73d1675a1db3c917fc7a88 |     
         arm |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/6c946a53a3178866fcbf1c18d1e5d222d28c4815 |     
microblazeel |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/5864dbc0af0995c33a8741b318672296c9a54090 |     
        bfin |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/42e1b9ab21fd4f7bdad6f9f99e8943b1f7c044c4 |     
     aarch64 |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/1051727376846059b37999e7b6cb72e08bda7e99 |     
       sparc |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/4fd4119e3a0bbfa42d690d249c39e38358f6a5b6 |     
      xtensa |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/978db9ea9f04ad465252316e2f31085516a123bb |     
      x86_64 |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/c6a8ca7274dc02818b57ad7162dc687e93311d1a |     
      xtensa |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/72cfaaa32419f84bceffe3cf1369716ae68ae95f |     
     powerpc |            shapelib-legal-info | NOK | http://autobuild.buildroot.net/results/2ab8aad56f48c01e5db988f2d706a9a4cfb3a120 |     
    mips64el |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/813ec22f379ae00e5ac7f365aebbf1e74472d7b3 |     
     sparc64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/3926aa3dde14a9b012a563b50629934212824784 |     
        mips |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/da8a09ecf5dad8b542add3426850604b75c888a4 |     
      x86_64 |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/c71759ccf338d7d017047d737d4cf0ec11764616 |     
       sparc |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/94a2608441a3bc4a61251eea152a678a136bad38 |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/74a81b669fd968d436f697f4367b22ca7f071db8 |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/64d3292efb9ed3246d4a081805b166118493038b |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/43d8ef04c2b849b34494ac7758ea15fae1ca4671 |     
 powerpc64le |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/287409b0305f274d64cf75aae5373fb30b75102b |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/b7d572f884a3d009e71b72d5916b950ad491412a |     


-- 
http://autobuild.buildroot.net
