From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 07:01:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-17
Message-ID: <20190318070113.E1E6A85CC3@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  31 |   0 |   0 |  31 |
   2018.11.x |  21 |   3 |   0 |  24 |
   2019.02.x |  30 |   2 |   0 |  32 |
      master | 245 |  62 |   3 | 310 |

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               runc-v1.0.0-rc6 | 2 
                libsquish-1.15 | 1 


Detail of failures
------------------

        m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c7357d045b078c5742bde21c82904b4ec0defc35 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/a63e9c9f026ce49dc299116affce0f85b567786d |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/0ab86addc477d45542a5cb283d3636fb73da22da |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            optee-client-3.4.0 | 14
      host-uboot-tools-2019.01 | 10
           uboot-tools-2019.01 | 7 
                   netsurf-3.8 | 6 
host-gdb-arc-2018.09-releas... | 3 
             nodejs-legal-info | 3 
                qt5base-5.12.1 | 3 
                   netsnmp-5.8 | 2 
                       netsurf | 2 
          wpebackend-fdo-1.0.1 | 2 
                   dvblast-3.4 | 1 
                     gdb-8.1.1 | 1 
                        jasper | 1 
    kf5-modemmanager-qt-5.47.0 | 1 
                  libssh-0.8.7 | 1 
                    ncmpc-0.33 | 1 
          openjdk-jdk-11.0.2+9 | 1 
package/nodejs/nodejs.mk:19... | 1 
          python-ipython-7.3.0 | 1 
              qt5enginio-1.6.3 | 1 
                    stella-6.0 | 1 
                    uftp-4.9.9 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

         arm |                    dvblast-3.4 | NOK | http://autobuild.buildroot.net/results/d5be91349f57d34110dc8d9cf1ced2e7ea44ac62 |     
         arm |                      gdb-8.1.1 | NOK | http://autobuild.buildroot.net/results/fa439bdf2b91cec542499da0648d4dafbd9f74d7 | ORPH
         arc | host-gdb-arc-2018.09-releas... | NOK | http://autobuild.buildroot.net/results/07321ca0bd7dcffd699e906e1f691c9851342731 | ORPH
         arc | host-gdb-arc-2018.09-releas... | NOK | http://autobuild.buildroot.net/results/1fa9866651e1d01cf6d8be468680cc973a9d1c5e | ORPH
         arc | host-gdb-arc-2018.09-releas... | NOK | http://autobuild.buildroot.net/results/e9fe7e94db1edab9c359e152279ca01dd69e2c99 | ORPH
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1d3dbe893b5fec2a08bced10907590bb7d1c14fe |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2a039c9743caa180fe707d6a9fa38d9b6be2a99f |     
        or1k |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9ca0fa2b34a8cb31ebb8fd6860af5998d089894d |     
     riscv64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2468321383f2594a00c40a4990d590d6c8e69e58 |     
  aarch64_be |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4ba4d7945d0eafba66b42d96cb4826679ddaea5b |     
      x86_64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fe458daf672e2af1aa15645c83669fd22153a25e |     
         arc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/37380bea69952a689664aab40ce8d6b65e6c07c3 |     
       nios2 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/209166b15d4f816db20884b9a30e17e96b6ae90e |     
microblazeel |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7d7bc25f9da29333483ea2b94be4f6df8f557fe4 |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4bd2ea4c13edf748ae42bd6701d1a13e95bdc5fc |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/86de7b8acbf4e7541651af0eb9be2f44711d9d35 |     
       sparc |     kf5-modemmanager-qt-5.47.0 | NOK | http://autobuild.buildroot.net/results/b941a3deaa57cac79f1686d47ca6ababf2f0d5e4 |     
      xtensa |                   libssh-0.8.7 | NOK | http://autobuild.buildroot.net/results/f4a3c71a3e699f4a0c987332bb2a3fc647bc8817 |     
     powerpc |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/71f81da46cac73102975425ac9fc98e2e71531bd |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0474d2f04125257650a0f0758102c9830f1ec14d | ORPH
        i686 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/af119c43b8a541d4ad5f788af3b972b6d3637eb2 | ORPH
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/4cee1be40bec3d34a5b187ea0ebafa90e853cd6c |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/04577a91471fbba0cbe2ccb61f74ecf1c5f21171 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/91d0dae7a09505c4bcf7109124dda3af1197d25b |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8876a13b498a0d97553096c3e077a663f69083b3 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6dc5e0ffc9a6d9523de89b713e47712452c513b5 |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/099bba66c04a39e85cafc2590519b6672495bcb8 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/984bcedbbc35eb1b5abf7369ad2b826311b1db4c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/313f7e4f4c3b70380d7467a24812dd3c1f8994fb |     
      x86_64 |              nodejs-legal-info | NOK | http://autobuild.buildroot.net/results/a65776ba1045f12263a686933eb6a4b5d6ff7333 |     
      x86_64 |              nodejs-legal-info | NOK | http://autobuild.buildroot.net/results/4bf66b9f05e9d04171156e44c7dd87619e429747 |     
         arm |              nodejs-legal-info | NOK | http://autobuild.buildroot.net/results/aab619106a7d763f45e95a7ae3d85816fb4a6512 |     
  aarch64_be |           openjdk-jdk-11.0.2+9 | NOK | http://autobuild.buildroot.net/results/a034e641fe163d4502fd9411af1d96c14d13c5f2 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/c5e1199089a30c8c73f2a881421ccc8bc40ba3dc |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4b3da2cff8925fe283efea8a6f93f782abc7a101 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/889071142774b88f9de3df72b93080da70e76cdc |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/d0f2c21aadf9d2a354b2ae7729b410f84f23a335 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e5404fd2428542b699dbfc048f861a4bde844e3e |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b673ae56b53fa21f2c627146a63e67bcc452c417 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ba2784a22f242971687d5af210d72e21150262b3 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/bc384c80a00a315feda7ead2c1a64e6039a71217 |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/4c595427aef1b820ba3b0b399d48d050b7688ea3 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/6a048af40ade616427d5f4fe327819e312880cea |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/6339e01be0310c3b52ed773885ecae208824575f |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b249bb68f77070694876ef5d9450af3c8bd31a03 |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f558d6ee781ed467dfd63b1c565811ba9e2a597a |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/22d1d9dfce9c91047c170386223192b6f147bc0f |     
     aarch64 | package/nodejs/nodejs.mk:19... | NOK | http://autobuild.buildroot.net/results/8ed7178348b9f2787ee68a0b4c6802df8060d676 |     
         arm |           python-ipython-7.3.0 | NOK | http://autobuild.buildroot.net/results/7d765d2b15bfe72b05de62e86a01d57f1696c837 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/e11bd2dded746b0cde7a7a90ab634726b66d2883 |     
      x86_64 |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/56559bf2df4651241a19ed84f9ef4fc5175947aa |     
      mipsel |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/dacac0f9406b40de569bc16df3ae81c7667ce274 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/08f873c03cf62c2122a4906d01481827de86f476 |     
         arm |                     stella-6.0 | NOK | http://autobuild.buildroot.net/results/cf5bd2f262b108e4b90b6e31e46c5f82b9aef0a0 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/2f5e797ea8a7600b4b70ad3b54187c514f3515d2 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8ce9a706b7069427ee8232568e636345da3b0b88 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/1739e0c8e23c427d07ecb8787791694746ae3bd3 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/bfc8b706b93174bb11cbc27af8c590beb50dee64 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7a5d012a64147f6325171af658db8d983af47d7a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/8c8ab697757f4a376cf752a7b1db2dce242804fc |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/332c9d2232c03440bf71794ee7850b1f6fd51d11 |     
        m68k |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/8fbb22afd1c17b176926e0114eabdb47548c0d91 |     
     sparc64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/26e7905ea67f91e2af9e77126e194be85f47c35f | ORPH
         arm |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/1ea6187ca6dcaa4d33ab4b0e98c9ad155db46d13 |     
     aarch64 |           wpebackend-fdo-1.0.1 | NOK | http://autobuild.buildroot.net/results/a09e9bd4f52af8176bd83a5507b995bf4905b803 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
           qt5serialbus-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/03e4b22a894a1976088020979d6e7820844d4dde | ORPH
microblazeel |            qt5serialbus-5.11.3 | NOK | http://autobuild.buildroot.net/results/8a3d8f81a4256a696b5a09bf711544b83bf7e3e4 |     


-- 
http://autobuild.buildroot.net
