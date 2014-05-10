From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 May 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-09
Message-ID: <20140510063010.4D1F81010DF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-09
===============================

        success : 68 
       failures : 41 
       timeouts : 0  
          TOTAL : 109

Classification of failures by reason
====================================

              qdecoder-r12.0.5 | 11
                protobuf-2.5.0 | 9 
           host-protobuf-2.5.0 | 4 
                elfutils-0.155 | 2 
                  cppcms-1.0.4 | 2 
                libmpeg2-0.5.1 | 1 
jack2-ab409a65df95bc261ff72... | 1 
    libcec-libcec-2.1.4-repack | 1 
                    gpm-1.20.7 | 1 
               alsa-lib-1.0.26 | 1 
           imagemagick-6.8.9-0 | 1 
                   slang-2.2.4 | 1 
             lttng-tools-2.4.1 | 1 
libwebsockets-v1.23-chrome3... | 1 
                libsigc-2.2.11 | 1 
                 libpfm4-4.3.0 | 1 
                 cairo-1.12.10 | 1 
          glibc-2.18-svnr23787 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/3a72d567a4c26fa374af5c9a5b1644362a2f74a5/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2f80e55fe50c32590cdab9475daf54d96d501268/
      bfin |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/bbc9e3da31eb38e7614fc47da5821a831bedc1f1/
     avr32 |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/016aa51b91e6dca69a830f518d2787772b799673/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/87c55e8a05871ebc326e17f11c3e7f0418a4b6b2/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/8bc659f962379c22ea7896cd05627347fd2e6f4d/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/0f4df1aedfaff75fbbf3e2611884100780c7726f/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d9a7cd7228a80c60489a5c7f9ef4525ccb2400ec/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/cc7873842959a5ba3222c9e70e8b1513d8936d71/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/73811fc73253aecec5560ebf5ccfa52e28e01d6a/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/0d1b1baff85de54902d9c07ff41913f49d89042b/
      i686 |            host-protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/11b92a8fec6aae0839ece48b2ed5e58a159f24c5/
       arm |            imagemagick-6.8.9-0 | NOK | http://autobuild.buildroot.net/results/1532fdd30128a606df9f40dfd8092865300a1615/
  mips64el | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/f3cd51c35067468074039d299581b12d701af7e3/
      bfin |     libcec-libcec-2.1.4-repack | NOK | http://autobuild.buildroot.net/results/1dcf0fd573abb1137c45d97ee4545bb610592434/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/99125ec556c386b8795f5fc5c5d255f8ef0c7fbd/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/b9c6dab9ed0f8b2fd0f1a2008c3a8fe7a4360123/
     avr32 |                 libsigc-2.2.11 | NOK | http://autobuild.buildroot.net/results/9736db34c946d4a820aae660e8d0afaf15c7eac2/
      bfin | libwebsockets-v1.23-chrome3... | NOK | http://autobuild.buildroot.net/results/961f31463c0acf8c8bd33bfd7f535bf24b0cb494/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/27fbb934dba686d44ac2afc4e62be368a3ef00b9/
    xtensa |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/ae9fa612d0b6c9d593504206d5cedd480ad2547e/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/2606a545b3962eebe1331fed701552c2b3dbe097/
       sh4 |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/bcdd448b364dbca32779491fe4535dd04d61e411/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/4d2aea1cdd7f40ab606382210fea5843ae72fea4/
  mips64el |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/f906d803473e99decf75928b18ff63a90bb1e41f/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/2d7502dded4e1dee6fa152183ce170e9cce81cbd/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/4c3ab411e5f2a7acb68197548742de0bea2571ec/
   powerpc |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/3a0d5224e8804ea1c4fb158d47b1dc61f9c4bae9/
      mips |                 protobuf-2.5.0 | NOK | http://autobuild.buildroot.net/results/78c6071f1c49440b9e7bf192867c209885ccedd5/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/bb68a5f845c6750d19a28f06a31ceb7b1f667f30/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/906f8e43ca4464929142d84b955b5461c8683130/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/fae47c457631bc87f026e39bee1be9d73bc7052c/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/b0763ae47a743370937264bacd7cc6f437ad8c8e/
   powerpc |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/ce80256b12bce9f3683fcb266d8b0461f77a93d0/
  mips64el |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/9f1d3a7e8af1ce7a9352ce0aaf2576893dd38364/
    xtensa |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/2cf47321ce71ba70b7ac2f6e65cea01c43f4c5a0/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/f581064492a8c27c42775446130951858eb468cd/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/da8ce760cdabeb9d4cda00dcc801817e4b4eb12c/
       arm |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/163640270e4fb4e7850fb11cee9faf0d7657d724/
      i486 |               qdecoder-r12.0.5 | NOK | http://autobuild.buildroot.net/results/43ea78c69add490c611e60d05365052077114576/
      bfin |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/97e6cca838cefd48ee91489c6b1914d78da6bf91/


-- 
http://autobuild.buildroot.net
