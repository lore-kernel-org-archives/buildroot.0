From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Mar 2019 07:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-19
Message-ID: <20190320070050.3030222C6B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   3 |   0 |  21 |
   2018.11.x |  36 |   1 |   0 |  37 |
   2019.02.x |  25 |   4 |   0 |  29 |
      master | 166 | 105 |   3 | 274 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
                 mplayer-1.3.0 | 1 
               qt5webkit-5.9.1 | 1 


Detail of failures
------------------

      x86_64 |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/707eac0c7dec55091f2a18105f8897f05204a2c5 |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1d2a820b7adce6a76fab6a3b097dcf6064c94216 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/12b0161d398c7546af8a60703e68c657e9251fce |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.11.2 | 1 


Detail of failures
------------------

      x86_64 |                 qt5base-5.11.2 | NOK | http://autobuild.buildroot.net/results/bde052a283e69f2d22b701da644a7a8257092da3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                       unknown | 22
          angularjs-legal-info | 15
      host-uboot-tools-2019.01 | 11
           at-spi2-core-2.28.0 | 9 
            optee-client-3.4.0 | 9 
             libmpdclient-2.16 | 4 
          openjdk-jdk-11.0.2+9 | 3 
                qt5base-5.12.2 | 3 
               wireshark-2.6.7 | 3 
        glib-networking-2.58.0 | 2 
                   glm-0.9.8.4 | 2 
                host-go-1.12.1 | 2 
                   netsnmp-5.8 | 2 
                   netsurf-3.8 | 2 
              qt5enginio-1.6.3 | 2 
          qt5multimedia-5.12.2 | 2 
android-tools-4.2.2+git2013... | 1 
                cutelyst-2.7.0 | 1 
                gerbera-v1.3.0 | 1 
                        glibmm | 1 
                        jasper | 1 
                  linuxptp-2.0 | 1 
                       netsurf | 1 
             nodejs-legal-info | 1 
                    ofono-1.28 | 1 
               openldap-2.4.47 | 1 
package/angularjs/angularjs... | 1 
          python-ipython-7.3.0 | 1 
                   qjson-0.9.0 | 1 
                    uftp-4.9.9 | 1 
          wpebackend-fdo-1.0.1 | 1 


Detail of failures
------------------

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/f1648f245d77f85661bc0d2f1e8097c3695206d8 |     
    mips64el |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/fdf6b64648dfa58ec74de31104a1a71248242d80 |     
     powerpc |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/0faeac3993f7f13d4ad282e4accbc6037dbb97a0 |     
     aarch64 |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/473ebf09504ac35c4d51108cf7cb66331ade663c |     
         arm |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/842dda4aa72d8b0f4fb1ff575058001a6d7526d5 |     
microblazeel |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/671a212021a225ab410c596d2377f2f264c66b3f |     
        mips |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/d90dd7cc71721288bdd5feaf139485a666661a0a |     
        or1k |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/fb628e0970a18c782418fea9224e556a66b38384 |     
         arc |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/ce6d7089545b68d71b53bdcd8b46ef6f83aaf883 |     
       sparc |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/0b8ad8d8384d605c2230e862548ccaba1f06d9b0 |     
    mips64el |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/34fd6ae3f9b7ea80b0de62cac2cc67f796f5f766 |     
    mips64el |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/6195af65c0ccf33f0333a5957ed308ca0f9c010e |     
        m68k |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/1d3a41dba79761f7b23f2a432c75e0eab71e60d8 |     
    mips64el |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/5c1b12a10dbb49ac6edf69bec0e6fe16d8219495 |     
         arm |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/6ca67c003cfdc8a3bd15509b3b368b0062ec7d4e |     
         arm |           angularjs-legal-info | NOK | http://autobuild.buildroot.net/results/439b374c9e5a94c4c502ceb546240061a8778066 |     
    mips64el |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/a4f9abd52f926c024e122ee8872b9c432d6f91aa |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/7d29753917bca34b4231ccf96157c127991f2993 |     
         arc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/a12765b1e42e638e25db540cde830568a1c30c4d |     
        or1k |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/8e929a1951a1452805fef237e23bd418f74da289 |     
       sparc |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/bf419418ebc05e314c8e51b2da5d6dee7133b87e |     
         arm |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/83250522c79b5749fc8236ba2b0e873a12747413 |     
    mips64el |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/f2a322f3459a2775647d975c0d59950509e2d78f |     
      xtensa |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/27860bd98de7746b93c256ee21f55329721a995f |     
      xtensa |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/07b0a924ca94cca8149ac871ea16e861b574c755 |     
         sh4 |                 cutelyst-2.7.0 | NOK | http://autobuild.buildroot.net/results/0a9b536dd7e060f94b939949922d1acbb01bde5e |     
         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/e9548f8d43abe3a2f2aab4acaa19289af2b9737d |     
         arm |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/fc2e68921bd84d13d2e9bc900a91e46b08d698fe |     
         arm |         glib-networking-2.58.0 | NOK | http://autobuild.buildroot.net/results/9f9fd830e165e88796fc4743f35a2f6f4f951c6a |     
microblazeel |                         glibmm | TIM | http://autobuild.buildroot.net/results/8222f8e20bda4925ca512cc1600b7c309f43bb71 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/dc1df682219d5dd9e84db38c1141ec3feceaf071 | ORPH
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5f83c709e92463f2f27582f9e455e16926339e41 | ORPH
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/05d1b85c741c41c4df469d3208b4333fcf54a12e |     
    mips64el |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/a324e774a26bf230158e52ae08f2f6998d3560a6 |     
        mips |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4442e108a3741064800278646ffe8975cc3a3c52 |     
         sh4 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eb8f71c25b4c07a06e74a8be4a28756f78422a0e |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ec68e9c2d72876c1b0b17a769c999c80dcb91a37 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3dcf6d0ea8138425a2a4dc0ca628903d9e5c696d |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d8b8203922d69f5f575162a1c0f0d3766a64d548 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/a09702cd5bba893b3eb5d46eff1ebc661bc36a92 |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/796035f2f1b4b730b9c4fb0d533295b60713dab0 |     
        mips |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/bf098bc5dbc278693d9f1abf2693b0ab19790827 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/99ca48f0157fa00c88337f9e844aea78f6257dda |     
      mipsel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/372fae3e44bc3f68aabe2992d4a444e4ee85bb45 |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/d25f17485d93ed71aa3070e6d3a3dcc7862fc78a |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/10fecc1de365cab6248647c22c5f3ffa5b6c2d60 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/69c1cd2f62568108f6580cdd0ae53e393e2b4852 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/67e4e7f86e949d2fed966a0808947978cb972065 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/21ff6e2ff754e063dc75a560da369383d9dafd59 |     
         arm |              libmpdclient-2.16 | NOK | http://autobuild.buildroot.net/results/8c6fa55b9e6d0bd89d10dbeaafb3fb5b670b6f98 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/a704361916aacf70d0827506a7f16c9de8054a37 |     
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/a004533393cb74c2145efc5bb45551e80fb811dd | ORPH
         arc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/02b65d2a2d40ec22cede59ceeef005bef3e5bf85 | ORPH
   powerpc64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/2a6318878658e8587d9d482a996d36a48c8fab52 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bb121a83ea0216fa5e4afdeacf20ea633b614970 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ebe3d654cf14234f83e1d6f82ead30a632264663 |     
         arm |              nodejs-legal-info | NOK | http://autobuild.buildroot.net/results/d51e59a789eb5977cebad8648a634303a352c219 |     
      xtensa |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/b96abb3c418bdb269d7f34a91157a3e96fdd0201 |     
     aarch64 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/633b2361f7ab588fcc41fcbf5e92aa4eca895c6a |     
     sparc64 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/f763193801c4af8289c49832811395df49b1b876 |     
     riscv32 |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/84f423cc795ce0957801a5f7b35c0c800f527fb1 |     
        or1k |                openldap-2.4.47 | NOK | http://autobuild.buildroot.net/results/0cd8ecdc30f96e4dadc97085941776880b13b1d4 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b2b99bedd3e85a7d6db8e85b6146ffa99cab5f49 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8bb90c180c3c6e1884f87b409e124750b50f9fd3 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/514e59cb6188dcbab5b29adc5b9f6a6134c5587c |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/04f8fb174a7cf80564b6098f4dba585744297ba2 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/fef23093f58242825e04263ce4faac7c12255c9e |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d1a38c1ac9b33ffe05200b89393affa403ea5050 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c1d6fe94ba688c92c2034768866d9d527cb0557a |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/baa5993ec90a6b7bab5fdeb81102f160e3f3ff55 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bfedba5377de577556588bf4354019c1def49fb4 |     
microblazeel | package/angularjs/angularjs... | NOK | http://autobuild.buildroot.net/results/069f3aa017272991a556dddd213282d6ec8966ab |     
      mipsel |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/60d86ee61cdb2e2bd9514c8a4f0c4be9f93bcc08 |     
    mips64el |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/b3d60a59472097ac79fd113039650ff0347f4732 |     
         arm |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/87076d03bb92a9940447ca80fc1f202e35ef39da |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/d42032f864bac1c46df1b81f680d76b4227cdd12 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/60e0c9fc5dbdec8be0898751fa43f71651db8c8c |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/42c39af1d90ccd16198c9ea520bb14e2957028c3 |     
         arc |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/487adfc643b9e4a92d57fb769887aac4d096eced |     
     aarch64 |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/b4703e0d9611f700d12d997fc50bc0add1ea4982 |     
         arm |           qt5multimedia-5.12.2 | NOK | http://autobuild.buildroot.net/results/d107e653513ad51d1ef54e19adf4924f087de5d3 |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/e513aea8feff43f5d9a30573ec7084b7f3d673d8 |     
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/1165844ab9ab9087eaae51bf5dcfd178416a385a |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/7a3f7804983e7937a7e19ebc9d33e7624e2b903e |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c8baef7919d56e86440ca0ece3156cf71ef8c7bd |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5b370ef76859efbe61c7728f039dd5ffd3845979 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/2c49cacaf45cc5d101c96d477151b4b784dfcdde |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/7f20f025b4e50ef480259586d7da33ab63ce6f82 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a44243b2ed65dba50a15a44bb32937fd9773af5d |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/3342e4d7622cfb8058f0bdaeb323a6ccef59e16f |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/4db61f835f5e20a577e70496fcbffcbc6a5446fe |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/beca640e684bf0cbaeeb62738fd8ac81b93e1407 |     
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/a1c8eb03fe3ea01d0ee4711195ab8432f9fbdb09 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/84c388dc12eb20b0bc7527104bce87a55ea50508 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/084f1da164191c217ce2b13f23525a1e2d22164c |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/dcbf30555bf66724b1b1759472c7082fe7ad8474 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/0609485ef3b0a976ecaaa5baf61b7a72806ae8e8 |     
     sparc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/e788ba0b9d4347411fed002ab3cc65f89a777e44 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/758b563e69df9d72f0a195e12827331474cc3af8 |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/d2afef3b22f9a46a300fce0e72ad48bcfd7784e8 |     
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5938e9ec09721c7146ac053e2f7da7535a9e584e |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b1d83809894017cd51a13301d334c95daedbf162 |     
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/714ea5ef731984b8d3daebfdca8b110bae9780ef |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/3ce02147a8e8a49aa47dc6460470d99ed2c22434 |     
     aarch64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/bdbfd72a5da7e02e85159ee62bf56067adbc8931 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/6015f9829d5d9f6b45794d33072cbf612d6765d3 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/5c96a8c7d19dc5acac828d90882e83802e9c1ab5 | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/137689aea8ea6cbaa5baefdb505e3c9ed8aef509 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
       gst-plugins-bad-0.10.23 | 1 
                   netsnmp-5.8 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/de6b175feb0abf40f60f3b0c9d6744bdbcbf3841 | ORPH
      xtensa |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/e055692bed3c02ad1cd77a701e9e70babf792843 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/1766c091b6028bb1ea13f8bf7ba28f5036ca93ef | ORPH
      x86_64 |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0d06327d9131d3bb09b8c8eb59e458a33c066fd9 |     


-- 
http://autobuild.buildroot.net
