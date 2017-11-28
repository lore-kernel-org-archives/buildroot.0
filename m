From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Nov 2017 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-27
Message-ID: <20171128070012.4EDDD20746@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  14 |   0 |   0 |  14 |
      master | 223 |  15 |   2 | 240 |
        next |  45 |  12 |   0 |  57 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-mono-5.4.0.201 | 3 
                    php-7.1.11 | 2 
                  autofs-5.1.3 | 1 
                  boost-1.65.1 | 1 
              host-erlang-19.3 | 1 
host-google-breakpad-7515ab... | 1 
                   jamvm-2.0.0 | 1 
                 libdrm-2.4.88 | 1 
make[1]: *** [qfsfileengine... | 1 
            mesa3d-demos-8.3.0 | 1 
            python-pyqt-4.11.3 | 1 
                   qjson-0.9.0 | 1 
               qt5webkit-5.9.1 | 1 
               tcpreplay-4.2.6 | 1 


Detail of failures
------------------

         arc |                   autofs-5.1.3 | NOK | http://autobuild.buildroot.net/results/ee01ffcd3971aedfbbedbcccefaa28d09255f123 |     
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/fc53290dd10e8a951ab8d98dcf2c0738fcbbd76b |     
         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/2985e6a8c003f7ce41fd5aaf5355bcaccc820ba0 |     
         arm | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/a1a91f00437691e0b868683e7e583be13c428ec7 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/4e97725717639445bcf146e7e315a61088cecb51 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/1a401434d8dfb36d05d42d9f73f19b97e0115d0e |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/c0c8aed1cb94157372b0a92ac80bceb174731f21 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/87e7595c1cc850be76d3c214669196663c40b7ae | ORPH
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/0034a704d839b5cd12c15c80727d8554e7e7e0a7 |     
 powerpc64le | make[1]: *** [qfsfileengine... | TIM | http://autobuild.buildroot.net/results/fde2ab8aeb2f5f3b91d80c47d7177adfb778f883 |     
         arm |             mesa3d-demos-8.3.0 | NOK | http://autobuild.buildroot.net/results/f61d75793944ca54cf59e22d01ee1b19939f2ceb |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/d2a0cf7b76f862234c42bdd6bb398722ff098239 | ORPH
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/c17344003874181967195b028a14e3c861543b02 | ORPH
    mips64el |             python-pyqt-4.11.3 | NOK | http://autobuild.buildroot.net/results/16aee42568ed007e42cf567ede9da6e423075939 |     
         arm |                    qjson-0.9.0 | NOK | http://autobuild.buildroot.net/results/7b1315d2e73cdc276b79f860091efdbe4312428a |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/94e6fb80c4ee52a09dae18908735954ad35fc02e |     
    mips64el |                tcpreplay-4.2.6 | TIM | http://autobuild.buildroot.net/results/879761998edd7541606f84727597098369815795 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                     avahi-0.7 | 6 
                      feh-2.21 | 2 
pdbg-77158819158d1d7053a737... | 2 
                linphone-3.6.1 | 1 
                  quagga-1.1.1 | 1 


Detail of failures
------------------

     aarch64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/1e974c814ae4236077a869339be1143a9af7e5cd | ORPH
      x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/1b4b37381d78e41dcf87e3494181cfdacb452d8e | ORPH
      x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/0256f5be80314b00c02881ce7aa1dec35c8afc83 | ORPH
         arm |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/17044c2d88c291265daeb9302af8b8f1ac56aae9 | ORPH
      x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/5721634ffa2a4544a82dda08c1fcea331ecdadaf | ORPH
      x86_64 |                      avahi-0.7 | NOK | http://autobuild.buildroot.net/results/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca | ORPH
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/ab7270f20676abef7eabde0541bfc4c5fb0f3bab |     
        i686 |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/91a2acfdcefb8aed1af9b31a363709a3467b3237 |     
     powerpc |                 linphone-3.6.1 | NOK | http://autobuild.buildroot.net/results/57f6639b1e0c7748083970a5dd8048de7f04dde4 | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/73cdaf12f9e79c89e7081b32509ccd530d6bf690 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/7c277eb7070597e728352ca6a68c1f0077cc8147 |     
        i586 |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/338913676b689adca4795c93b9af45c8b026aee1 | ORPH


-- 
http://autobuild.buildroot.net
