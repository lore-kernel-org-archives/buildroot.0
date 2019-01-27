From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-01-26
Message-ID: <20190127070027.2AE0620763@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-01-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.11.x |  27 |   0 |   0 |  27 |
      master | 165 |  37 |   1 | 203 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/1d3e204928861f5659b1bdbd7281647c4b081b62 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 6 
zbar-b3b4e32b55f570372fc3af... | 6 
             libva-utils-2.3.0 | 4 
                 gnu-efi-3.0.9 | 3 
                     php-7.3.1 | 3 
                  ffmpeg-3.4.5 | 2 
                   netsurf-3.8 | 2 
               skalibs-2.6.4.0 | 2 
                  brotli-1.0.7 | 1 
                    efl-1.21.1 | 1 
                 gnupg2-2.2.12 | 1 
                        jasper | 1 
   libtorrent-rasterbar-1.1.11 | 1 
                    ofono-1.28 | 1 
                qt5base-5.11.3 | 1 
                   strace-4.26 | 1 
                    tekui-1.12 | 1 
                upmpdcli-1.4.0 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/2fbf892824e90cd79fb72888107641dc9e654b27 |     
         arm |                     efl-1.21.1 | NOK | http://autobuild.buildroot.net/results/49603813d4d16e60a457ffc103c21f1e96c3e9a6 |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/e3cc1b01a9dc65c3600cd6a48af1a9d240483cda |     
    mips64el |                   ffmpeg-3.4.5 | NOK | http://autobuild.buildroot.net/results/ba2daa14db6b5cd5f8ee91f913e68b215ea957ce |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/a9110016499b60e67246a09deb43bacc21d91d4e |     
         arm |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/b98321493cbe1196a74a6b78fa693c06092560df |     
  aarch64_be |                  gnu-efi-3.0.9 | NOK | http://autobuild.buildroot.net/results/06e047e42422a41f3f382eefc4c58aff12af4941 |     
       sparc |                  gnupg2-2.2.12 | NOK | http://autobuild.buildroot.net/results/aec073b6791d0e184458bf6a8e7cffb1d5f944f4 | ORPH
         arm |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/4a9b106ec9fb05645d7bab588d8a2f6dd84584c6 |     
         arc |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/3dda1608cdabf21e59cdd00ebb2db271ef643b85 |     
    mips64el |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/9da6c67578f51e5075257cf25cc8eea36a2b36b1 |     
      mipsel |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/56d93fb2028f38040cedaefd7c046f35a69f57fc |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/515f0d870ea98dcb7136bce48fefe9aa666fa2ad |     
      x86_64 |              host-grpc-v1.16.1 | NOK | http://autobuild.buildroot.net/results/d08f3336f996cfa4ea5dde655d8c105e59d1e733 |     
microblazeel |                         jasper | TIM | http://autobuild.buildroot.net/results/06af9aa4e44caca433e72990f728e47cf50b1cf6 |     
      xtensa |    libtorrent-rasterbar-1.1.11 | NOK | http://autobuild.buildroot.net/results/2f1bb62388480825d390670a82ba16f75fafae07 |     
     powerpc |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/13b5334ada9a665212c9476e2b95f343b4819ca9 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/f4874e01427b3c835838e2cc1c09ed54da3f6e92 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/7e349e13204a819ed0a434078e80e709eb614563 |     
         arm |              libva-utils-2.3.0 | NOK | http://autobuild.buildroot.net/results/be26e1dc4aa61a77606517501d7d503a4abe062c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/c207820b961ac9b8e33f195bac9f7092df0b7936 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1470545c80bc634610e5c99435af5c16ad3958e7 |     
     aarch64 |                     ofono-1.28 | NOK | http://autobuild.buildroot.net/results/1e35ff4ce1499bc0f279ad763ad0f718ef57e83a |     
        m68k |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/f2c08212914bb8c460dadfeed64c12481af7375c | ORPH
     powerpc |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/772a9f2c06ecb51f41c63314535a0b7ac43db470 | ORPH
         arm |                      php-7.3.1 | NOK | http://autobuild.buildroot.net/results/9be99a233dbe6d667a5e33a8145b2ed8fe3e2204 | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/0e5337ef588989b447677d24e68d2a260b3edbd6 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/b955c918b606d3218d70d15e9e4e3a75c6bac549 |     
     riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/e7d57dfe81deb2eeaaf6e2ff166d144b8e73333c |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/8ac78d820ac42276938c4c7494141f9d3fa08606 |     
         arc |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/572abca8a9952e4a676adf42258ab9ba8a52022e |     
        m68k |                 upmpdcli-1.4.0 | NOK | http://autobuild.buildroot.net/results/138d36b2251ff00b888a3a18b334ad46cde781cf |     
    mips64el | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/cba299c49ec1df0687c02b58b317cc7632464f63 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/0180f841d148aa4b0d5f42d9ccc0ee88da3a3c2e |     
     powerpc | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/fdaea7067ebc95750c9d1ae093759e5129c963f2 |     
         arm | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/8a4893e3e8a71e080d22a9fd5121837dcf52f0e8 |     
        i586 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/ce9596c56bfb9bd199c2e94f9a64ff2ee0be7c0e |     
        i686 | zbar-b3b4e32b55f570372fc3af... | NOK | http://autobuild.buildroot.net/results/5d7f399056f406c9b4b22bdc6c90e2fd8d8fffa4 |     


-- 
http://autobuild.buildroot.net
