From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-19
Message-ID: <20180520060020.30BFE207F4@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   2 |   0 |  25 |
      master | 272 |  24 |   2 | 298 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 2 


Detail of failures
------------------

 powerpc64le |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/cd04fb8de0c66b2bef4f44abe7a6a46edf1cb6f9 |     
       nios2 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/d3ba95c273e0db8ff26632f21c7593f40b072b4c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  autofs-5.1.4 | 6 
                qt5base-5.10.1 | 3 
                  samba4-4.8.1 | 3 
          host-faketime-v0.9.6 | 2 
qt-webkit-kiosk-34efddb0bf0... | 2 
                    quota-4.01 | 2 
                  flare-engine | 1 
                    gdb-7.11.1 | 1 
             host-gauche-0.9.5 | 1 
                        libnss | 1 
                     php-7.2.5 | 1 
                   qt53d-5.6.3 | 1 
triggerhappy-b8228880661293... | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/c4bb4d6f9ba2518b817fd33747accc1fb7694519 |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/2e22908ef0aa2775fdea3a970ba75870b885d8e6 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/a77a47c00358580ee2837f1a19dd3bc6c2534145 |     
 powerpc64le |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/e69c9a5daaef6388faf87590ac24480306dc5c2f |     
      xtensa |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/4479632c4f1dfad2cddbd7d7391a27b1f05b8f21 |     
      mipsel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/9188ac3516e9d06b4995070f942fbbb4a755ad0b |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/42480ee672497a600b87e8d983e2d427befc62af |     
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/6b5341ce3a1deee24680018fef66ed025bd660b6 | ORPH
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/08e73ee1d57f5bb3da54b054a46bb91bbb955132 | ORPH
        i686 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/7a20bd6948c304de29b2a8e8efe32f33b386620b | ORPH
         arm |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/e107899908f3e36244c3f5743a2d88bedd46d0ef |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/518b8fce3c484d5cdf6e2dc776d8d0d3079dea4b |     
       sparc |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/c14120507216c46664714686c71847402149c314 | ORPH
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/3c993f6c1a87e54d1580198a5390ebc5da33b474 |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/19209ee4941a677f85ce1368295e214ec424a9a7 |     
         arm |                    qt53d-5.6.3 | NOK | http://autobuild.buildroot.net/results/04fc5310a64a12e2b98a0fabb09fe5fcdadb4500 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/7220529cf5865eae423dca2726df1c83552432f8 |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/d358862990f5da89374437f36558d4ef935d4c11 |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/e1fbc7034c6452e32921c855973ab62ecc5fa601 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/e84ddda5c5a299fa1d7d8a83d30d06e5e19b614a |     
   powerpc64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/3528108de20d04fc6eae15ecc1003c70ce2adb45 |     
 powerpc64le |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/f49dba5274df30344295b3cfdcb219c6e28dda9b |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/4e36c413aa6b50bf3f6d7e1e369bf1481c078679 |     
         arc |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/49fc605eca6e83bd3e8ffdfd31541d2e6bde2a83 |     
         arm | triggerhappy-b8228880661293... | NOK | http://autobuild.buildroot.net/results/08cae1216e3c3a3b1ceec5057fe2858f364ce040 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/d94484eca4185d0745507c6e64a251728b2692b3 |     


-- 
http://autobuild.buildroot.net
