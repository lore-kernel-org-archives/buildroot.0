From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 May 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-05-06
Message-ID: <20140507063009.23A95100E55@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-05-06
===============================

        success : 93 
       failures : 22 
       timeouts : 0  
          TOTAL : 115

Classification of failures by reason
====================================

              postgresql-9.3.4 | 4 
                 clapack-3.2.1 | 4 
          glibc-2.18-svnr23787 | 3 
             lttng-tools-2.4.1 | 2 
                  zeromq-4.0.4 | 1 
make: *** [host-gdb-legal-i... | 1 
znc-b396cafdb249544164ed029... | 1 
                    fltk-1.3.2 | 1 
                 fio-fio-2.1.4 | 1 
                  bustle-0.4.3 | 1 
                  opencv-2.4.2 | 1 
                     popt-1.16 | 1 
configure: WARNING: unrecog... | 1 

Detail of failures
===================

       arm |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/400f86cd3c5e418a05089f7a58ecc1cf436ac810/
   powerpc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/d1d721fa697956218dfc2c865dfb61911cf2600e/
    mipsel |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/518ed5822cfd88468f5600f3053699e1b06d7245/
   powerpc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/0d7ea169ab8b2da946ec4444d6e3db1a352c08ff/
   powerpc |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/6e14fa44622e8e4e16cceee591389b07517f6aeb/
      i686 | configure: WARNING: unrecog... | NOK | http://autobuild.buildroot.net/results/dab457f00dcf6fdb5a5081291eb9ebaaadbfe7c0/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/9cd30031a40f768f6090cfba44c880fb2406672b/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/2253f1efb8da80f30615535724f6b444a38e7fea/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/bd0aefa1b1efb1a28d2af89a983b389ed2aeeff5/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/a0679d22dde393a8daa2e109e2438100e36e982d/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/1b19e911ff26d53708ac107e271d179e0e913735/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/f1982b05693fe3c6939729f7008afdc56a58e7c3/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/6e25c8c64756ac6515a91ad4238de977773b67be/
      bfin | make: *** [host-gdb-legal-i... | NOK | http://autobuild.buildroot.net/results/753570793be3f35bdf9b344af7252607a82c3b60/
       arm |                   opencv-2.4.2 | NOK | http://autobuild.buildroot.net/results/ee6187d85c84af382e54b0c9c16ee0e8ec45d0a6/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/bfcb2ed27debafc584e133f5ae11ad2061ad2b16/
    x86_64 |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/992c17e43664e8f2dfdfe711c1b0a43ebc21af90/
  mips64el |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/2bbc9606281f4c96a264c5e1daa50f7957315047/
   powerpc |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/0162d66ddbfe7f240819eaee9e76bbd0a0ad7e7f/
      sh4a |               postgresql-9.3.4 | NOK | http://autobuild.buildroot.net/results/d1f2083608540e9b7f778a25d54b94bdb582eca1/
       arm |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/7c552e514f8c13ba8cdd420dc5bbf5edac915a83/
       arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/53e97320fcbad6e51a0bc5183c03a00f86ba86ae/


-- 
http://autobuild.buildroot.net
