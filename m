From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-23
Message-ID: <20150624063017.3443F10113C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-23
===============================

        success : 195
       failures : 51 
       timeouts : 1  
          TOTAL : 247

Classification of failures by reason
====================================

                  uclibc-1.0.3 | 10
                pinentry-0.9.4 | 9 
                 empty-0.6.19b | 4 
               upmpdcli-0.11.0 | 3 
                   glog-v0.3.4 | 2 
                   tor-0.2.6.9 | 2 
                elfutils-0.161 | 2 
                      atf-0.21 | 2 
                libtirpc-0.3.1 | 2 
                 cdrkit-1.1.11 | 1 
pulseview-198f9bc74d6c955a7... | 1 
            gst-ffmpeg-0.10.13 | 1 
                   audit-2.4.1 | 1 
               linux-pam-1.1.8 | 1 
                 clapack-3.2.1 | 1 
                   slang-2.3.0 | 1 
                    php-5.6.10 | 1 
           aircrack-ng-1.2-rc1 | 1 
             berkeleydb-5.3.28 | 1 
                  xerces-3.1.2 | 1 
                  dhcpdump-1.8 | 1 
                 setools-3.3.8 | 1 
                libnspr-4.10.8 | 1 
                 libraw-0.13.4 | 1 
                 qt5base-5.4.1 | 1 

Detail of failures
===================

         arm |            aircrack-ng-1.2-rc1 | NOK | http://autobuild.buildroot.net/results/21b75be66c70cf39998165bc020c2124ff71ab48/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/3afd3da0d628aef96af7013232723273e559d0aa/
        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/908fe59880bd2392de67c6d8a8440a7d245f371c/
         arm |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/d68ee8890d5b7df46fe4635d2ea40280633ca4d8/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c8a25b33baedd9637c0faa1a5f6eaa14269b54e4/
      x86_64 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/6b1f398125b4598ffaa14858cccfbd8dce356dc3/
         arm |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/0cfd3188e221a9581b4670f941b441361d111953/
         arm |                   dhcpdump-1.8 | NOK | http://autobuild.buildroot.net/results/29100641731904b50d73af7cf2db08847fe1567a/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/00f253e8488713dd9aa4a5f04ad8b5bf5d1a4a27/
       nios2 |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/219207940d7a7e13ac1dfcc9c0d4098f9c19a27b/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/526cd8509d579f0172a144bab4b0c97d5d2918d8/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/7bcc40ba9383780549726995bf520d67d5d323c2/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/3b57b0ec74dc93fa9ae155f61cedab1495a5af0d/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/9be21eb12fbfca7edee0fef51a85cdf0c8055949/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c3c771bd7df0fa05cdee60aa1563fea086b0bc0d/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/267b2b362f9683b152213f853de216cede7ce51a/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/58f776f820394df0bc4384d30ee141d9c1b26bf3/
     powerpc |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/296bc0fd888a43700d2ea020f8486932c5d37760/
        bfin |                  libraw-0.13.4 | NOK | http://autobuild.buildroot.net/results/258129887d0eca98d424a1de1797c0add12ebc07/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/c7b7e3c6b3393859caacce1045e56b294c7fd303/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/2572675b093f0c286cb1b6fc8f6bc3bae798d62e/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/051d0cda7c9401c1457bc22bbd561ca5c0748841/
        i686 |                     php-5.6.10 | NOK | http://autobuild.buildroot.net/results/dd56dcbd108c15ebc6fc8a1f916aaac5b08cc42f/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d4bacea9d81e141a756e555a5e84d2da0280a101/
    mips64el |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/8c517109f9f131c063d1e70abda3f6ffe43af37c/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/3f4e10c7c4889f82582ce7b2644cfc359ba99064/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc6b228980a685732bceb30a5d341beb69f4f413/
      xtensa |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/845ea3b40d6a6c2f6847ca94c4a1be198efc17ef/
         arc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/e6afe6e30fc62945096d2ed73437caa94d269473/
        i686 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1df7bb4eaeea378fdc6ab6132a385b3f0b533f70/
        bfin |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/817e4e17eecd68d2a4c4a9863379781865a8123c/
      x86_64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/2528c7dfdc1ff9f0e6030ecfc22ff3acd26808e2/
     powerpc | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/4165cdcce68372bd9a6c2220714a4fd3ed8c1d12/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/926f21deb94b34ebfaf71c856451893183c0e392/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/465fb7ea52b45159e4aa6ab790dc863d0e5a61c4/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/7fd793d1a73fd3f063ef7569fefc2296e1b3132f/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/77fd52bc86df2c6e16ae39d104b4803b1af8ec76/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/b9e6995a7d1ef799d6d06eaa6600d63ae6d54e82/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/278e5d61a6850cb13a15724f4ebbb197084058ad/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3c2e790f13aac15b2afaadde44819d1517347293/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3fb7fe005d813dc340a65e5dd0ff4a777924fe78/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/01b423e4e2f6579c6337ea7ab7151e3e86091f14/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1b240e245d8c8357e49f7cf5db4e55f1e3276aec/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a9d58aa6d4c258537862bd811f140db757bcae83/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/6d913dc4dc0f4bd3e0b4a54b3c531392958dbe3c/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d2ccc9e0c8077fca0ccd502c295a1951325ed90c/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/080b1d4895e5e5aad82b07986e8bff9653aa082c/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/088eb8931ca8d837228eedf5414bb74e1dcb95cb/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/c815a9f866a1d0e4c78cc0b61274b57805a9d182/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/103690897532b5011fa4c435a2b00f24aed51b27/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/e7676f5fa983cbfb937317dacf9f39c2c47af112/
         arm |                   xerces-3.1.2 | TIM | http://autobuild.buildroot.net/results/1ccab047718ac5c52908cd90cf240d32099d8789/


-- 
http://autobuild.buildroot.net
