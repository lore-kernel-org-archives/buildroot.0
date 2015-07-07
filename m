From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Jul 2015 08:30:15 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-06
Message-ID: <20150707063015.50C5C100820@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-06
===============================

        success : 114
       failures : 25 
       timeouts : 0  
          TOTAL : 139

Classification of failures by reason
====================================

                 setools-3.3.8 | 2 
                collectd-5.5.0 | 2 
               upmpdcli-0.11.0 | 2 
                   open2300-12 | 1 
                   audit-2.4.1 | 1 
                  weston-1.8.0 | 1 
                libtirpc-0.3.1 | 1 
                iproute2-4.1.0 | 1 
                coreutils-8.24 | 1 
               libsigsegv-2.10 | 1 
               openswan-2.6.43 | 1 
        host-gcc-initial-4.9.3 | 1 
                   bdwgc-7.4.2 | 1 
               libgtk3-3.14.13 | 1 
                  zeromq-4.0.5 | 1 
              quagga-0.99.24.1 | 1 
               polarssl-1.2.14 | 1 
                openssl-1.0.2c | 1 
                  boost-1.58.0 | 1 
           modem-manager-1.4.8 | 1 
                 qt5base-5.4.1 | 1 
              pure-ftpd-1.0.41 | 1 

Detail of failures
===================

      x86_64 |                    audit-2.4.1 | NOK | http://autobuild.buildroot.net/results/071168cca8a5624607f7a91c28a6d78ada90fb39/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/820a4f2f1ca8d19fbd2bf261921213689258e9a4/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/239a8faf16d3de5dbb0698d7afe2f2ba09e67596/
         sh4 |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/437ffdd9b6035ba887aa5d4a89dad18a30bcb493/
microblazeel |                 collectd-5.5.0 | NOK | http://autobuild.buildroot.net/results/a5e6891e9ea66ac8216d3302da3702770ef7247b/
     powerpc |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/f6a7bccfb14236345b0046db7bc910d8dc146b70/
microblazeel |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/a2007e1fa1d3d1568373f5041224cecfc15d43a4/
     powerpc |                 iproute2-4.1.0 | NOK | http://autobuild.buildroot.net/results/4158378f5476cc3ab2d956bfb1a4514afcc67e97/
     powerpc |                libgtk3-3.14.13 | NOK | http://autobuild.buildroot.net/results/0ecaa854f99d4faa89b9e8008c6c4d09a865e15d/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/c5fef9a89f99e13de9cabe52c2ac1602d85974fe/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/4d8a4d03c7a423411f8eef75361f67d0fc57f7f7/
        mips |            modem-manager-1.4.8 | NOK | http://autobuild.buildroot.net/results/ef9231cf968abb2a9cd3d37ed454935dc4af634b/
        i686 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/aecc75b1d90d1bc3765e440f92f9240b1a2a8daa/
        bfin |                 openssl-1.0.2c | NOK | http://autobuild.buildroot.net/results/f7b65a6ee84399988411ab3595518289bae1f641/
        i686 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/eef041c54accdc892e90d4e1e2871354f7dee7fc/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/bfbb2f08feae504af445a4c53b120c1c029ea7f4/
         arc |               pure-ftpd-1.0.41 | NOK | http://autobuild.buildroot.net/results/57a6180809bc51f7206280533f0b9898ce4cfbb4/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/937e7ce76a546e36b7e77f139f13dec815bc7bdb/
         arc |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/ca0b1e271f29d7639b6a6e895472a35e2c1d8aba/
       nios2 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/5a5d5ce19b5da852e0fa27a66058d168ca0e7329/
        bfin |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/eb19ab1d4e4f58166c68775229fba4bd77bc2f21/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/1c917039bfb38e8938909e73d626c9420de35a9c/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/5b207d21e1986b037e6acdafe94403c2ae4b70ba/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/3450e0684b5254d95b3e0680ebb6d77a6a91b51c/
         arc |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/8984d725204936f3c2b040fe04fbb888a0d6a75e/


-- 
http://autobuild.buildroot.net
