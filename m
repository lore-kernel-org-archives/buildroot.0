From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 May 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-08
Message-ID: <20140509063010.6A8B2100DED@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-08
===============================

        success : 73 
       failures : 28 
       timeouts : 0  
          TOTAL : 101

Classification of failures by reason
====================================

              qdecoder-r12.0.5 | 5 
                protobuf-2.5.0 | 4 
           host-protobuf-2.5.0 | 4 
                 cairo-1.12.10 | 1 
libshairplay-139d5ef5556451... | 1 
jack2-ab409a65df95bc261ff72... | 1 
          glibc-2.18-svnr23787 | 1 
          enlightenment-0.17.3 | 1 
                 libnss-3.14.5 | 1 
                     tcl-8.6.1 | 1 
             lttng-tools-2.4.1 | 1 
                     exim-4.82 | 1 
make: *** [host-gdb-legal-i... | 1 
                elfutils-0.155 | 1 
                pciutils-3.2.1 | 1 
                   lftp-4.4.15 | 1 
                    sdl-1.2.15 | 1 
                  prboom-2.5.0 | 1 

Detail of failures
===================

      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/044c1602c67cc73121751574c13871eea8f134ea/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/90fc7f908d18c5fb52ff366419226cc87f2f5332/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/19815c1f7e5fc9be051d5419615e214c29474127/
       sh4 |                      exim-4.82 | NOK | http://autobuild.buildroot.net/results/59a16e9a24260c3948c0dd11166683074d911b15/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/d75c9275fb6ce020a2dcb2c5e54e98f6c5860fc6/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/691a87842c3ca841063adef57b4400693820ee4b/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/20b1d279b12176c0dcbaa8b5f170f6c8a55eb6da/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/8cdc55c52776c826c5d6bee331a47f31bbd8476d/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/08302aed44116929683207b28a702b62a115e79f/
       arm | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/59e80e367f9fb54b2c217f8988c2d64796622120/
     nios2 |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/296c3b0b4200d65b22dc8a74f1c883a279393006/
  mips64el |                  libnss-3.14.5 | NOK | http://autobuild.buildroot.net/results/0e3f1482d6f2f9bddc53d4e78b575120a2729e1d/
      bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/7027dd71c7555288ebabbd3de4fcdffebcf4a4ab/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/a9a059ee6f5d1129f5711ec606aa28ba934d76cd/
      bfin | make: *** [host-gdb-legal-i... | NOK | http://autobuild.buildroot.net/results/c90f8d3f855e146ac707836c9173c63e289b60d4/
      bfin |                 pciutils-3.2.1 | NOK | http://autobuild.buildroot.net/results/e2eeee11e7beff357bb53cc90506c8409fd7edba/
    x86_64 |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/ac0fd5a386ff5797d699c9cb86b37cfecbc3341e/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/7e5791225334096206887de8a38fd947e1f8e9a2/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/e373a53069c751b5cabaaef157456c93ac7b4f5b/
  mips64el |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/cf147b9188d6787a6a1a6072bf9bc6f7ddf5e5ae/
    xtensa |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/04f9e8d7195f06adca75be9fe50699311c47303d/
microblazeel |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/1b3c1a4e0e043c5ab8ef03807a095a312a19a587/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/e06b1665546e2f85ff26eb487db667abef633477/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/6910ef6cebeb2c4cabb0467f87dfc3ec4be359f9/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/ff9ea039c88457a222c6b0433e019f64817e18be/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/52c384def2adf5f1eace38866d0271aa5332beda/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/b2d50bb7db1dd2fed5142a5e268b180cded678a7/
       arm |                      tcl-8.6.1 | NOK | http://autobuild.buildroot.net/results/48696710a270ac69d6d62654779f164075cb3451/


-- 
http://autobuild.buildroot.net
