From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 May 2015 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-05-08
Message-ID: <20150509063015.990CD10160E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-05-08
===============================

        success : 302
       failures : 29 
       timeouts : 0  
          TOTAL : 331

Classification of failures by reason
====================================

      host-gdb-arc-2014.12-gdb | 3 
                host-gdb-7.8.2 | 2 
                ipmiutil-2.9.5 | 2 
             armadillo-4.000.4 | 1 
         lua-periphery-1.0.4-1 | 1 
               openldap-2.4.40 | 1 
                 cdrkit-1.1.11 | 1 
               host-mono-4.0.1 | 1 
                  hwloc-1.10.1 | 1 
           libmemcached-1.0.18 | 1 
          google-breakpad-1373 | 1 
                  boost-1.57.0 | 1 
                  guile-2.0.11 | 1 
               mongrel2-v1.9.1 | 1 
                gnuchess-6.2.1 | 1 
            python-pyqt-4.11.3 | 1 
                jasper-1.900.1 | 1 
               harfbuzz-0.9.40 | 1 
               alsa-lib-1.0.29 | 1 
          enlightenment-0.17.6 | 1 
        gst1-plugins-bad-1.4.5 | 1 
               host-qemu-2.3.0 | 1 
                xapp_xfs-1.1.4 | 1 
                sqlite-3081000 | 1 
              wireshark-1.12.4 | 1 

Detail of failures
===================

         sh4 |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/ed989c8381dd5bc414126d1232fa052ba7b472c7/
         arc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/1ccf0829c13896c000aed1956155a34844207b2f/
     powerpc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/e65a86ebe5fb902e62028c0b28d61fe0fbdff5d6/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/371e1120db15b5bcd384ad0a2e61d3e52547eaed/
      xtensa |           enlightenment-0.17.6 | NOK | http://autobuild.buildroot.net/results/d035e3735e414acb26ae79a8cf55a562c89d01e8/
     powerpc |                 gnuchess-6.2.1 | NOK | http://autobuild.buildroot.net/results/dcb1c0eb7212bd8d1e0d8b51fd517b73b7569cea/
     aarch64 |           google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/2deb9591726f4f19f4abb41c283aacd2feaa3188/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/e8364dbf4d890712798082cfe6a1c4d1b276c4cb/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b788049094fac66acfc10f93253da183a8482e97/
      x86_64 |                harfbuzz-0.9.40 | NOK | http://autobuild.buildroot.net/results/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c84be810c32bc5829f817f7b6941990a93c7e7e7/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/c2bca7f49bf86fd41127e46a08146067e36cb7dc/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/ae6153134082beda6d82eeeedc507745df3097ab/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/52597d7a4675020c6adec629c78bcf9a4d772285/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/a5e8bd1ca971b31d2c6ef1f3982ae8197714fe2c/
         arm |                host-mono-4.0.1 | NOK | http://autobuild.buildroot.net/results/227f942107e4fcbc14bb1e7d97e1e2758d6f3f2d/
        sh4a |                host-qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/a4ebeebc3015f12846e364cea540fc4be707d377/
     aarch64 |                   hwloc-1.10.1 | NOK | http://autobuild.buildroot.net/results/41403f8ce4751a27dd1bb9c43f5a97895dea3980/
      x86_64 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/3cc9f9371b858adf27ec3316f5a3db3d8c79ae54/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/815f4d9e9e2e9b1e759e6cf74fd651674fe78703/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/d7a6fba85562a07f0fd153b23087a8b818d01445/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/512f71355c7b7b3bfe219d60e1382d16410e9ee5/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/337b840c0b6bcd05ac170a8cdd52082af6ab6cbb/
         arm |                mongrel2-v1.9.1 | NOK | http://autobuild.buildroot.net/results/43a7f2a592d19dfeebf449314de496f9583a3ed1/
      xtensa |                openldap-2.4.40 | NOK | http://autobuild.buildroot.net/results/d60c8b4522e99cf385ee41aa20a1d49deb59c5fb/
     powerpc |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/26d395d124fd41df7d768e101e624e5aac385565/
      xtensa |                 sqlite-3081000 | NOK | http://autobuild.buildroot.net/results/4c198b1fd63df715c6ea1b3af6a3a2f5f4d3631d/
      xtensa |               wireshark-1.12.4 | NOK | http://autobuild.buildroot.net/results/5ba7d18262ce6a2dfd69db07d064a971267f1128/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/688a839ec57e7bc83b490535871b2dac0b1309ff/


-- 
http://autobuild.buildroot.net
