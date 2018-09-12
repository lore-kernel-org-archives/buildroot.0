From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 08:00:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-09-11
Message-ID: <20180912060043.2E8A520901@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-09-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  27 |   3 |   0 |  30 |
   2018.05.x |  15 |   8 |   0 |  23 |
      master | 161 |  76 |   0 | 237 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 3 


Detail of failures
------------------

         arm |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/e53d100ea65559891d8f223a485e11cc24686852 | ORPH
         arc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/4cc48144bbec18d9dfcce37c0e7652c10585ce07 | ORPH
     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/bb6c261fb176b5761d2b4c41644c30533bd6f6f0 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

              host-bison-3.0.4 | 5 
host-android-tools-4.2.2+gi... | 2 
                qt5base-5.10.1 | 1 


Detail of failures
------------------

         arc | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/261591315a957d70163b7487537ac558b95175c3 |     
         arm | host-android-tools-4.2.2+gi... | NOK | http://autobuild.buildroot.net/results/b0dc5aca1bd574f0dd84b29da7024e8c4fec3442 |     
     powerpc |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/39de62fbfa33182799b28652e1752ea97dbf065b | ORPH
    mips64el |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/2f66be5a9c30867440b5b58e803840bbca276f13 | ORPH
      xtensa |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/12323a72fc9fdf21f568642a656f19a34a23351d | ORPH
   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/919a2d5a245937f9f0ea61ca67af621b3b1f17a3 | ORPH
   powerpc64 |               host-bison-3.0.4 | NOK | http://autobuild.buildroot.net/results/e41b7361f77495444fd23ed91192e10142be74cf | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/8d70a19df3107e497b3acccfe905bc8c014917b2 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               target-finalize | 18
              ptpd2-ptpd-2.3.1 | 8 
                   botan-2.7.0 | 5 
host-vboot-utils-bbdd62f9b0... | 5 
 Makefile:708: target-finalize | 5 
                     vlc-3.0.4 | 5 
                blktrace-1.2.0 | 4 
               boa-0.94.14rc21 | 3 
                  boost-1.68.0 | 2 
                   dante-1.4.1 | 2 
      perl-crypt-blowfish-2.14 | 2 
perl-crypt-openssl-random-0.15 | 2 
       python-numpy-legal-info | 2 
               bootutils-1.0.0 | 1 
              glibc-legal-info | 1 
              libgeotiff-1.4.2 | 1 
                  libssh-0.8.1 | 1 
                 lvm2-2.02.180 | 1 
package/glibc/glibc.mk:134:... | 1 
         perl-params-util-1.07 | 1 
                    pppd-2.4.7 | 1 
                rtorrent-0.9.7 | 1 
                     squid-4.2 | 1 
          synergy-v2.0.12-beta | 1 
              traceroute-2.1.0 | 1 
             util-linux-2.32.1 | 1 


Detail of failures
------------------

         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/abe859f808e5d02471ac08df8ec312d597605b5b | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/2c542cc2da06d167e93db026b307ca755492a38d | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/66d0b238d63d61204d00ce9ac6fd25a4651ffe4f | ORPH
         arc |                 blktrace-1.2.0 | NOK | http://autobuild.buildroot.net/results/e2ab2e01ad7946c8697c0e9b4d46f27f857812f6 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/0a9f1259e9dd10fe76052f20ac955ca4bfe4ad0e | ORPH
         arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/42b66d9ce34d8adf5eb4161c531e931af2856cf7 | ORPH
         arc |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/33be67d61925ecd9addcb0f3aeab75f74626eabe | ORPH
        i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/bf69f1eb08dfe21c396a67995299b1ab8d1b8a05 |     
      x86_64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/92bdc781a1f0c74a764c5e2cbac6136df284d894 |     
         arm |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/85b3abe282f68d71663e3d8fd556420bdf3591e6 | ORPH
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/d7fe2b852597b9dc257ae9439c6f6c5d311cd559 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/0000636025b843ab343dc45ccd29979325aff428 |     
        i586 |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/2a3255b5c302d7a4a1b1eff519bca6db6903cda0 |     
         arm |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/3fb4f8a463264b886b1871fb66d151033ba44895 |     
     powerpc |                    botan-2.7.0 | NOK | http://autobuild.buildroot.net/results/42d02821ff5c994d5b2fbd1df061d50b0ec7cd03 |     
   powerpc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/3c50223676bf75522e9fdca5b95d3f3d0522191c |     
         arm |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/78a2ba88d85793a9c11ea0ea77a5f6be94af5f23 |     
         arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/5758277127abc71c67b3fed20445711570eba831 | ORPH
 powerpc64le | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/1849be60dd13c1debfbcfb8fba5cec113e81af62 |     
        i686 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0e527d231fa791ec8e3375804f1a0043f92d73d0 |     
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/899569165112fe577cf191cd4f0c698cbedeb9b1 |     
microblazeel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/4a21307984cb16d7879149dd9b9b062181b0388f |     
      xtensa | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/38fcefe4feabfd95692cf6b3f7ecf84259fca4de |     
         arm |               libgeotiff-1.4.2 | NOK | http://autobuild.buildroot.net/results/29dc394225e44b82af3b4a4abf7f78250b50ee6f |     
         arm |                   libssh-0.8.1 | NOK | http://autobuild.buildroot.net/results/ab1c54b63e664b101230573879b5237380f2d0d2 |     
         arc |                  lvm2-2.02.180 | NOK | http://autobuild.buildroot.net/results/55dc8e0ed6413788443ae47595418663384524e8 | ORPH
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/53206efb0e3bb3dde2c138bc8b8f4b8507d4d563 |     
       nios2 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/b3ec2eb77b5c85798ce18a20ffd8f717c9bc193f |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/54d2fb6ab050bd029922a70cfbce2f386ddcd2a7 |     
      x86_64 |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/d09fbb020642da7758d2aaaf89515b6b1fa5447e |     
         arm |  Makefile:708: target-finalize | NOK | http://autobuild.buildroot.net/results/4f7adc7e6000510d1b48e8d7a1c6373cafbe5daf |     
         arc | package/glibc/glibc.mk:134:... | NOK | http://autobuild.buildroot.net/results/943d5f5dd8efce7c3cea1286b1c002642b35c8ff |     
    mips64el |       perl-crypt-blowfish-2.14 | NOK | http://autobuild.buildroot.net/results/a29532c8d111c2bff4a9e4266b20e359a5423a07 |     
     powerpc |       perl-crypt-blowfish-2.14 | NOK | http://autobuild.buildroot.net/results/aa764fd8e851225664af94e3bcb68657126d85e0 |     
 powerpc64le | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/d509ba9469f4e04029eca2bc97f3be27bc0a5cd4 |     
     sparc64 | perl-crypt-openssl-random-0.15 | NOK | http://autobuild.buildroot.net/results/b706defd187bcf18529f66a71bfea29dc91ae9fd |     
   powerpc64 |          perl-params-util-1.07 | NOK | http://autobuild.buildroot.net/results/182ecae405b71f68bdf1c706642130afc57d4b2f |     
         arm |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/a22a02231a729bf63d6f342e4ea17fd5e87cbad3 | ORPH
     aarch64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/d35a761395b04ac938edee901bedc4fe92957625 | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/bb4728553113041ec5bcf67e923da8d9e4ed3ebb | ORPH
         sh4 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/bb0132fbdb397aaf05430e8c324617b9994f8757 | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/c3ea5e2491fdeec2cebe070e9de0b0c8d556cf8a | ORPH
     powerpc |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/9f9eea9027153bac9fd5a56a04777ace8c531cea | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/52b085b4aeb94810defbe5a209123fa22c19d58d | ORPH
      xtensa |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/87efd1dafe3b18e4f5eff50b2d445f4e9c1cb1cb | ORPH
         arm |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/e99f262ca6cb22d115c96a02d4e9a9e77e1a7222 | ORPH
   powerpc64 |        python-numpy-legal-info | NOK | http://autobuild.buildroot.net/results/3500747e8e10351eaa41fd0149f69d3a3d3e5c78 |     
         arm |        python-numpy-legal-info | NOK | http://autobuild.buildroot.net/results/63a64dd83049c51abf054749351c794358066242 |     
        i686 |                 rtorrent-0.9.7 | NOK | http://autobuild.buildroot.net/results/9cb686013ccf8c904645450ab1ddaac37a563d77 | ORPH
     powerpc |                      squid-4.2 | NOK | http://autobuild.buildroot.net/results/19627148eba13a7416a89ad1f23da480a072a891 | ORPH
       nios2 |           synergy-v2.0.12-beta | NOK | http://autobuild.buildroot.net/results/72744f7e32fb0c2989bf940f662ba0035184112a |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/38e94763f4bad3d6bc6d6f8d3043204d357dacd5 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/31d61ccb2d16d29a4ec89ee2ea86996d498d8952 |     
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2bc9f2f9bb67c270e671e29f2070cce9fa753417 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/ec55be12b54a89fdf4660fe8adb2617e8d89de8e |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/8e93b359111909289ae9a28b0a0bf79a4dbb847a |     
       sparc |                target-finalize | NOK | http://autobuild.buildroot.net/results/37270fb91ed836b12139bc1467dde8640bf6db0c |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/be0c06fd1ebb9c0b10de95e170da8dc3a65a67b3 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2cc5f9bccee607de35fb500d20a3459c811edec6 |     
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/6c2dcf1d58053cf191a70441af359c9e57e4d887 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/67c73de8bd05755d97e4e9a7f342125bb7f0bab3 |     
      x86_64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/3bda786b9b0ce8aac83dc59b693596ee91206564 |     
        m68k |                target-finalize | NOK | http://autobuild.buildroot.net/results/7cc794bdc77287000a54fb181016f35de76e9862 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/9849759c1f9b5659f3dda2ba33ed24296b4477c8 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/6e1dc22aa122c6214044f48d2ed3e3f1b09d338f |     
         arc |                target-finalize | NOK | http://autobuild.buildroot.net/results/7bef91dc4d663e43b6a396321396ead7d81cdbbd |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/49eb5282d96d467815962c169af671786d68d083 |     
      xtensa |                target-finalize | NOK | http://autobuild.buildroot.net/results/bb2e456ab4f64dcb14e246938408d3c21ed14ce0 |     
       nios2 |                target-finalize | NOK | http://autobuild.buildroot.net/results/f10c6786f094e4367af475d04e866cb1445d140a |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/ec9a2e1b023e4701382c261c6a18f0df448a9e8e |     
     sparc64 |              util-linux-2.32.1 | NOK | http://autobuild.buildroot.net/results/e4c9cbbcebe13d8b1fa30e5691a0de30138a2525 |     
         sh4 |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/f6d4fca6063c81a8e240fed4db89269e455f057e |     
    mips64el |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/1c768d12646322d4e0f929b41364c7555fc96466 |     
      mipsel |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/73187b883d7fe14b08a4903b326706c9d1f8b519 |     
        or1k |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/c7348c442d3f585ace0bc62860f802dc08150776 |     
         arc |                      vlc-3.0.4 | NOK | http://autobuild.buildroot.net/results/579e2418e59680ad4bf3dc85f2918457b6221bfa |     


-- 
http://autobuild.buildroot.net
