From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-09
Message-ID: <20141010063012.D7B521012DC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-09
===============================

        success : 180
       failures : 25 
       timeouts : 8  
          TOTAL : 213

Classification of failures by reason
====================================

                 opencv-2.4.10 | 4 
                 libplist-1.11 | 4 
                       kmod-18 | 3 
               valgrind-3.10.0 | 2 
                 pixman-0.32.6 | 2 
                   libsha1-0.3 | 1 
                  botan-1.10.8 | 1 
checking for ttyname_r... l... | 1 
zmqpp-36413487f05b165dfc82a... | 1 
               mpdecimal-2.4.0 | 1 
                netatalk-3.1.2 | 1 
                      qt-4.8.6 | 1 
 24950K .......... ........... | 1 
              libgeotiff-1.3.0 | 1 
               libcap-ng-0.7.4 | 1 
                     tcl-8.6.2 | 1 
                busybox-1.22.1 | 1 
                  zeromq-4.0.4 | 1 
           heirloom-mailx-12.5 | 1 
                 libssh2-1.4.3 | 1 
                  python-2.7.8 | 1 
                 host-icu-51.2 | 1 
               alsa-lib-1.0.28 | 1 

Detail of failures
===================

     powerpc |  24950K .......... ........... | TIM | http://autobuild.buildroot.net/results/7e65daff051ec35de335e54f35c83462cc7f20a4/
        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/56538a6898e6225cd614768e9fb0978bb06a628e/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/3dfc002d8c19001dea4f13aa06cc6ec3f65fc4cb/
         arc |                 busybox-1.22.1 | NOK | http://autobuild.buildroot.net/results/cac1fc6a0ad9285cc080bbe2a3102d58057ff09c/
         arm | checking for ttyname_r... l... | TIM | http://autobuild.buildroot.net/results/de4c7c8e0d9dc5acedcaee39551324fd903fada2/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/385e0d075730f608522132a027f39c86ea568c99/
    mips64el |                  host-icu-51.2 | TIM | http://autobuild.buildroot.net/results/4c4b2e651aad26c4e0652e3116266b79969b07c7/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/ccb67643055a63e90f8ffbcc18da7137db6d3fbe/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/89e1a6328e0105021a22858e97f12107ad786782/
      xtensa |                        kmod-18 | NOK | http://autobuild.buildroot.net/results/415966eab988b04b3f1ffa5ae1bdb9ff3665c3c1/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/876d5fa3bbd2fa7be7aa875815989922db85f844/
        bfin |               libgeotiff-1.3.0 | NOK | http://autobuild.buildroot.net/results/6498d6516a412b12d68fa9f6a66172021abadc34/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/99196ed48a263f2e0a6d3b0aa9be321074e2171a/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/c11d07f65840abae23e86eafd6496e7eafb96bcb/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/db945e8b983be144e0e77295b7b97cfe3483fbc8/
        bfin |                  libplist-1.11 | NOK | http://autobuild.buildroot.net/results/a35a118d1f19101e8fefd7c74c9eca2e062c6c88/
      mipsel |                    libsha1-0.3 | TIM | http://autobuild.buildroot.net/results/359536a3fce91835b4318fb02703df0208744148/
        bfin |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/4e921cca79b5aca4affdc5375955448fcfc1836d/
         arm |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/5931c6fcd44c6d2085a673f4bf0fee1a26eb3936/
     powerpc |                 netatalk-3.1.2 | TIM | http://autobuild.buildroot.net/results/dadf5c5633bb6b052a98a3609a199f643d515a66/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/2c5b92122d8f1939d2d2f5031994986ff2b4c23d/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/fdbb4c8b674d1239214030bc3efe3a0cd9020ea0/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/55b83dc1b31987bd1b5f1689bef743821f459d90/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/e84f69e078b9f58d66196e897bffcd9e65505469/
      x86_64 |                  pixman-0.32.6 | TIM | http://autobuild.buildroot.net/results/0019ad5b91a9bdedb8fb7728bf391b8dace0a251/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/8b3f0b5a05741720487578593a34ae986877455a/
      x86_64 |                   python-2.7.8 | TIM | http://autobuild.buildroot.net/results/95b5a9295cf09b47256ef42973f6c8d068d242fa/
         arm |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/72e658d4d9b8843d5ad537a53424a8515e7854cb/
     powerpc |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/f7562a5435d247c6c1ea1debf908fcd14b14738c/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/bb1914d622553ea075a2b83931ca742752eb7133/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/427943b7224f65b57d675c2e025f14737297feab/
        bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/6abab71e923de1324d9470e56f90fac66d4dd2ec/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/6e969a5740ce414982fde1dbdccb3f3ba5369c58/


-- 
http://autobuild.buildroot.net
