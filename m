From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 07 Jul 2019 06:00:56 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-07-06
Message-ID: <20190707060107.BF4AA84E34@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-07-06
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  17 |   1 |   0 |  18 |
   2019.05.x |  11 |   2 |   0 |  13 |
      master | 142 |  41 |   0 | 183 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

           host-nodejs-10.15.3 | 1 
   host-xapp_mkfontscale-1.1.3 | 1 


Detail of failures
------------------

      mipsel |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/e6bbfdc0ed7b9ea09ff37edcaeb5ba92d00918a8 |     
 powerpc64le |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/c788b9ada92c4c7c1e297039fffdaaf5658c0795 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              iputils-20190515 | 6 
                    atk-2.30.0 | 5 
                       unknown | 5 
                  dnsmasq-2.80 | 3 
   vdr-plugin-vnsiserver-1.8.0 | 3 
               libcap-ng-0.7.9 | 2 
              libsodium-1.0.17 | 2 
                suricata-4.1.3 | 2 
tvheadend-8f1de1621d78c9143... | 2 
           at-spi2-core-2.28.0 | 1 
                  gnutls-3.6.8 | 1 
                harfbuzz-2.5.2 | 1 
               host-efl-1.22.2 | 1 
               json-glib-1.4.2 | 1 
                libvips-7.42.2 | 1 
           libvncserver-0.9.12 | 1 
            mesa3d-demos-8.4.0 | 1 
          modem-manager-1.10.2 | 1 
              qt5enginio-1.6.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

      xtensa |            at-spi2-core-2.28.0 | NOK | http://autobuild.buildroot.net/results/b46f989e2c5d37e9c6535ce5630c80ca9d0a9009 |     
        i586 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/c02beef0c90afaaa8e822ede93b9543db2850a16 | ORPH
         arm |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/96b9d43d183039b579add59dc70dd24f4a7b66c0 | ORPH
     powerpc |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/85cbd90fd2be28d9c2f2626f6ec1987726fac4f2 | ORPH
microblazeel |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/baf504448731dba6c6d30912f6f09a505daac0a3 | ORPH
      x86_64 |                     atk-2.30.0 | NOK | http://autobuild.buildroot.net/results/121faeab29af465b42d2ec8a1d8934790960ce2f | ORPH
     aarch64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/44cd002fdbba335ca20ee2e70e1067c08b6da375 |     
    mips64el |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/44269a21cefd4eeea69f20159bd60fd183958ab3 |     
     riscv64 |                   dnsmasq-2.80 | NOK | http://autobuild.buildroot.net/results/ee195b7d148ae1ca325761d87a7dd0c44bc800bd |     
       sparc |                   gnutls-3.6.8 | NOK | http://autobuild.buildroot.net/results/d640b443f01f792cd758b5dab5e02c8bf4b78168 |     
        m68k |                 harfbuzz-2.5.2 | NOK | http://autobuild.buildroot.net/results/99f3a7caf4ac2a1e0e1d4e01841775fae0334c92 | ORPH
         arm |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/dd729d47642aa37be067800efffe46e9993bfdde |     
       sparc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/dacdb07c807ceefe438fdceed13729983ea1e80c |     
     powerpc |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/96a792f35feedc9f8e2c34918bf8bb70ce8cee49 |     
         sh4 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/45cd7d7bcb801d6666203c2cfa49083397a1dff2 |     
        i686 |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/bc46154b9730fc97a7c26c8f89359daf69888375 |     
         arm |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/71f1eae9a11811179c57388f65fc8d24daf82300 |     
        m68k |               iputils-20190515 | NOK | http://autobuild.buildroot.net/results/fbbf0de08a64db031bd390e3e8d0b74d0fd228ac |     
      xtensa |                json-glib-1.4.2 | NOK | http://autobuild.buildroot.net/results/783675c31f264feeb79e86ac42df7a1bf4f19b96 |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/bf5e1aaf0caefc4a3f62446124b952cf9fa5fa9a |     
         arc |                libcap-ng-0.7.9 | NOK | http://autobuild.buildroot.net/results/8bf15122c3eda5b986d8bd6a1c16db4fcfc1e6b9 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/36e01420f39b79513c16c97240fee8289e763ff1 |     
         arc |               libsodium-1.0.17 | NOK | http://autobuild.buildroot.net/results/1adcfbba9ebab28b27d4bf724d3c14a40135e405 |     
        i586 |                 libvips-7.42.2 | NOK | http://autobuild.buildroot.net/results/e17966ed3c02509f269495e7f60d253306774883 |     
         arc |            libvncserver-0.9.12 | NOK | http://autobuild.buildroot.net/results/3cbffe5039bd3c087ba9c1cb88de89f4fa369313 | ORPH
     aarch64 |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/b790a0c5c6bc6268f5fffb12693db0d027b4cc96 |     
     riscv32 |           modem-manager-1.10.2 | NOK | http://autobuild.buildroot.net/results/db8a2816167730d14a8d8028ee535f0a95cf2d2d |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/58b2d298437b40c579638d6c48f1548b7f1fcdd2 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/cb09d9670f4526d801a2ffc0c8f880a021fe1378 |     
        m68k |                 suricata-4.1.3 | NOK | http://autobuild.buildroot.net/results/48622af6b03f89d453d924ce9d38811f2f5c567d |     
      xtensa | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/249195d12a0ad60818007280da0de44524ff6866 |     
         sh4 | tvheadend-8f1de1621d78c9143... | NOK | http://autobuild.buildroot.net/results/68a28fd0ef745123626a03bdebfb9cda6e31bfd6 |     
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/f8f98d05a1ab5736f484992fdd4c348301a5561e |     
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/4ec0e0f5fffc57b4640f1c12bf0443f8b3c85b3b |     
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/6a2b1f40674a76fa93c1e666cd9d5f777b28f492 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5b14ea629aeb9855e1b1dcdd0f5b1898a959c4d2 |     
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ab90bc8ac232d74e7658718c000b521fb1d855bf |     
     riscv64 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/10e608d02dd4f4492168491894025036fcd8dd83 |     
         arm |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/d55523f4610e175d29df71c293645d01e813c242 |     
     riscv32 |    vdr-plugin-vnsiserver-1.8.0 | NOK | http://autobuild.buildroot.net/results/a974bfdfd6ba377ed37146b14f184deb35d95565 |     
     powerpc |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/cb742ac170ff765acdeca85c235557b6926a6280 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

   openvmtools-10.3.5-10430147 | 1 


Detail of failures
------------------

      x86_64 |    openvmtools-10.3.5-10430147 | NOK | http://autobuild.buildroot.net/results/82bfd16f3af04a52d3d03385972257dd4cd0acd5 |     


-- 
http://autobuild.buildroot.net
