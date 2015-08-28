From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-27
Message-ID: <20150828063010.3D17C101B6C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-27
===============================

        success : 230
       failures : 27 
       timeouts : 0  
          TOTAL : 257

Classification of failures by reason
====================================

             lttng-tools-2.6.0 | 2 
                directfb-1.6.3 | 2 
                 setools-3.3.8 | 2 
                oprofile-1.0.0 | 2 
                busybox-1.23.2 | 2 
                   ushare-1.1a | 1 
                  mono-4.0.2.5 | 1 
               iptables-1.4.21 | 1 
                 python-2.7.10 | 1 
                gnuradio-3.7.5 | 1 
             bluez_utils-4.101 | 1 
                libnspr-4.10.8 | 1 
               polarssl-1.2.14 | 1 
znc-b396cafdb249544164ed029... | 1 
tvheadend-d9cf931f9f7242f07... | 1 
                minidlna-1.1.4 | 1 
                      qt-4.8.7 | 1 
                  powertop-2.7 | 1 
  xdriver_xf86-video-ati-7.5.0 | 1 
           libfreeimage-3.17.0 | 1 
                    ustr-1.0.4 | 1 
       directfb-examples-1.6.0 | 1 

Detail of failures
===================

         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8979c4078dcf8e960e08c027da2403cf9a4175da/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/39b0ff1777be83b6b08c2df9ec254cda26069b27/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/6bccf54a41283c6f7e52fd45b8c6c57d173b0382/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5d0be947cd9ac8b65752272dfbf6e1a982b1d7df/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/328d599aeca245d2a8b8a7af8a18f83eb56bcade/
       sparc |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/7b68dcbcb538c36d58a46d35b1523ce12500c00c/
      x86_64 |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/8e3afd5f22312f0660f631fdb82bbb64eda913fb/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/36bdea2d93edb29f782ae728b709be026ce6c480/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6ab38c44240ea4677b0c734e0de63f9c4e6ab07e/
      x86_64 |                 libnspr-4.10.8 | NOK | http://autobuild.buildroot.net/results/1094e37aae41a8d3849a4bd95b082ef2d61d3327/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/ce65b5e9e0edc7af6eca3a00b82f1f555967799d/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d167773466fa2db707580a7f2c3bc946c1774b8d/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/9f8da55ff2fb7d01167844164a57ab52e84a6c3e/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/9ff968c37cd117c8ac092d7e6f5a97a20d481dc2/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/691185cd9c1318ceb70988d165fb93faa08b338c/
         arm |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/f938fdd943551c6a3f9acc950992a4838a149dd0/
         arm |                polarssl-1.2.14 | NOK | http://autobuild.buildroot.net/results/f9fe1f564c15d369b2ebb2971f88e17f99480efb/
        sh4a |                   powertop-2.7 | NOK | http://autobuild.buildroot.net/results/4996b3817befcf61e99943a1417dadb0c92ce63c/
        mips |                  python-2.7.10 | NOK | http://autobuild.buildroot.net/results/affb1d4a328c479be73b7818364db5914bf3d376/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/bd03900c80104f9a5edd86f46acfd61bd3d6ac15/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/2af6bdd9752f39059180eaa04fac0c552d906d6b/
     powerpc |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/c274d5ca72f0cacebf0bc0bb48fe91dd1c6fcbda/
       sparc | tvheadend-d9cf931f9f7242f07... | NOK | http://autobuild.buildroot.net/results/3594fe53c886dc0dfa7e2b62fbac4d9c575cd21b/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/6f0e9189816c9996040eda4c46ed41a5e2bf8fa6/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/4e5ab27506409113bf123cafa51e7fd139f91235/
         arm |   xdriver_xf86-video-ati-7.5.0 | NOK | http://autobuild.buildroot.net/results/0d2b131ec425a62f18015cf38914eabd08aa4158/
         arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/3be4576af95abdbd1d1f77c7e9ed577b937a5e42/


-- 
http://autobuild.buildroot.net
