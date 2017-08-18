From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Aug 2017 08:31:33 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-08-17
Message-ID: <20170818063133.37CF220902@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-08-17
================================

      successes : 136
       failures : 7  
       timeouts : 0  
          TOTAL : 143

Classification of failures by reason
====================================

             transmission-2.92 | 2 
                  cc-tool-0.26 | 1 
     python-cryptography-1.7.2 | 1 
           python-pynacl-1.0.1 | 1 
            xlib_libXpm-3.5.12 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
===================

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e30a1cda39e996309a56e4ae23ad210356df4b03 |     
      x86_64 |      python-cryptography-1.7.2 | NOK | http://autobuild.buildroot.net/results/44b01df1406d24cb1ffc4183926013099d392aa4 |     
      x86_64 |            python-pynacl-1.0.1 | NOK | http://autobuild.buildroot.net/results/395682d33d02fdcaa39d3c0326355bd9ea3d6feb |     
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/e83e112957bbb9b49060fb2b7a5d391b2748b493 |     
         sh4 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/05a7ad7740f27b4653990e778a681fbedfdf4ca5 |     
     powerpc |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/2b6d74252018610ec71a3944e3c2a724e2d7ba2c |     
       sparc |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/c32b9b8dd00d6f6d3db27fae9d8de758a4f25138 |     

-- 
http://autobuild.buildroot.net
