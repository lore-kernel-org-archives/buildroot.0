From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Feb 2019 07:00:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-19
Message-ID: <20190220070056.9EAF485A4E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   1 |  24 |
   2018.11.x |  28 |   1 |   0 |  29 |
      master | 199 |  31 |   0 | 230 |
        next |  52 |  18 |   1 |  71 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                    gst-ffmpeg | 1 
               host-efl-1.20.6 | 1 


Detail of failures
------------------

microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/2b3f1481e4b813c6f8b17646c5da47d9f214dc9b |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/104bf2ea795fb7fcb0bab32ef48ca12076654d6b |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                     efivar-35 | 1 


Detail of failures
------------------

     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/82e7790da16fc17c34432d30b9bb9e8c38d66e2d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 6 
                 qt5base-5.6.3 | 6 
               runc-v1.0.0-rc6 | 3 
                   luvi-v2.7.6 | 2 
                   netsnmp-5.8 | 2 
       poco-poco-1.8.1-release | 2 
                gerbera-v1.3.0 | 1 
       gst-plugins-bad-0.10.23 | 1 
                   i2pd-2.22.0 | 1 
                ipmiutil-3.1.2 | 1 
                  libssh-0.8.6 | 1 
                   netsurf-3.8 | 1 
                 proftpd-1.3.6 | 1 
                 python3-3.7.2 | 1 
                   tor-0.3.5.7 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

         arm |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/b66805ea60d1738a94bb3a0c8e60dc396a8a2064 |     
        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/a8457ede18df9f10d5ca3c61d90c446b3e75b867 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/a882b1058ae69f3cea0d37015f6f657a55c9b13f | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/1e1c298700a560f107abfd21fc4c4ea42b4488ae | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/409c52b7f3d44da480ea2206e0af353ecb91f467 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/2bae41200b509966924abe6754b917a03f1a3c93 | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/c87276deeabbaf69ecf832c90f5c75c984850143 | ORPH
     riscv64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/1b7c66d4852feaf7d75c16571bfe6d4132d4783c | ORPH
       sparc |                    i2pd-2.22.0 | NOK | http://autobuild.buildroot.net/results/31c89000d79c3279c974bf4369df975e4b0b940f |     
      x86_64 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/2b411ee3b714efb115583aed2704636738ddbc21 |     
     powerpc |                   libssh-0.8.6 | NOK | http://autobuild.buildroot.net/results/21df18373d67fb3a4051d2092bf0638f5425c36f |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/71ce4cece876fc37a4b9dde2b3f9d454a66d5fe2 |     
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/9a0d1428bf217593bf62758c7149f8b37bac45a6 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/2a02c4742c1e04eb518553a605137e7ccfd11109 | ORPH
microblazeel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/5010ff2aef19ead81aa01040e23fb4ff92a25c3f | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1bfd74d82ae71db4186eecbab6c51ea39c4dd010 |     
     riscv64 |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/9a8213c502df53222eafc3ecd2fcfa36db20950b |     
     riscv64 |        poco-poco-1.8.1-release | NOK | http://autobuild.buildroot.net/results/55604740a0188d7386169b4eb113a84b58b9b255 |     
         arm |                  proftpd-1.3.6 | NOK | http://autobuild.buildroot.net/results/9c25c3cb3cf93b76c0538c5376a803641bf6575b |     
      x86_64 |                  python3-3.7.2 | NOK | http://autobuild.buildroot.net/results/48626fb8d06e5a8d37b77d663bb5741c902bbb31 |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/6abdfdb1a1478d62f29751013c01214cc93fddde |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/ea66a29b32f8d0357be830ef7ecdd06d30b657f5 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3733431711754915fb6c7e9883dcd3b45cd9947a |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/4662baaa395c5767ef370e4cb891db40053a54f3 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/144f8c9d30441f34137ace885ccb9f33b88e5d1b |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/11b82f60c8f50b275b85fbc181e3eab65b837878 |     
        i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/3fd0124563d7c83804d243c1712f99e179966468 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/5b698fc385e80aa361aab2ef7da2950f6de862e3 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/c9b5c12646dda2ad1071ac31cdede090e61abe20 |     
microblazeel |                    tor-0.3.5.7 | NOK | http://autobuild.buildroot.net/results/f36e3ece6864e38a74430cf65c73ce9e973628e7 |     
   powerpc64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/9e0a6a6c61dfe9602d521ca0717d00458ac00dbd | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

            optee-client-3.4.0 | 7 
      host-uboot-tools-2019.01 | 2 
                      ddrescue | 1 
                     efivar-35 | 1 
       gst-plugins-bad-0.10.23 | 1 
                 mesa3d-18.3.3 | 1 
                mongodb-r4.0.6 | 1 
                    ncmpc-0.33 | 1 
                   netsnmp-5.8 | 1 
                     pcre-8.42 | 1 
                 qt5base-5.6.3 | 1 
               runc-v1.0.0-rc6 | 1 


Detail of failures
------------------

microblazeel |                       ddrescue | TIM | http://autobuild.buildroot.net/results/4a9b163b180dd5b531391c5985aa1e0513d21c80 |     
    mips64el |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/10e01a7cf0b6c9a876d49524b3080fbce48093f5 |     
         arc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/2ff0ce4ed697da955df4b730b253dfc1ce48662d | ORPH
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9a097697b97c7b26e62ff231bc7a3fdc9b637ff8 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/60502d78f89b20b29f6bf9fe94e5bbf8e48c0cc7 |     
         sh4 |                  mesa3d-18.3.3 | NOK | http://autobuild.buildroot.net/results/ca293a2a7f8e6735dfb3c4778b5d083fb39bbe81 |     
         arm |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/4b7d2da1b6f659905d37bf0cd27cb588322f15a0 |     
        or1k |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/4b131d4e5c0e2e26438180f0ceedacdc29c13755 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8f6fdbf8a21967363b737bc771252bcded4278a9 | ORPH
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8be356ccdba8d1fa46e8a78f70d82f4c58bdcfcc |     
      x86_64 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1ab1223c533a151055246a4ef043495e1736e128 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/46c37db6e00dee9e7fc46aa06016970c0b0cfbf5 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/3d854100ce0a00f8ac08af0e3ef18f33cca55fd6 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/30c4fd022627154d6e110a2a3a6cdde658d2300b |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/f6ef976ea6d6f80c437cf88a63a6c20eb17d7caa |     
        i686 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7e0ac10e429c7efc1984ddf8ead80fcb5b544387 |     
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/d0526825072edd2ca1fea77b0ab0600fb7e35972 | ORPH
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/658d2d3800024f9044306ab2d0e0ea0209f5f9cf |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/db52189d722fef3d2a2f2c8741ce42e781abbb34 |     


-- 
http://autobuild.buildroot.net
