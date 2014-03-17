From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Mar 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-16
Message-ID: <20140317073007.BA17D101C74@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-16
===============================

        success : 51 
       failures : 39 
       timeouts : 0  
          TOTAL : 90 

Classification of failures by reason
====================================

                   slang-2.2.4 | 7 
                   ptpd2-2.3.0 | 3 
                     wget-1.15 | 3 
               netsnmp-5.7.2.1 | 3 
                    crda-1.1.3 | 3 
              host-scons-2.3.0 | 2 
                 mplayer-1.1.1 | 2 
                 httping-2.3.4 | 2 
czmq-b5730c5f8290a611fd3b92... | 2 
                    php-5.5.10 | 1 
      libnetfilter_queue-1.0.2 | 1 
                coreutils-8.21 | 1 
              sdl_mixer-1.2.12 | 1 
                  zeromq-3.2.4 | 1 
             dosfstools-3.0.26 | 1 
         host-python3-3.4.0rc1 | 1 
                directfb-1.6.3 | 1 
                 qt5base-5.2.1 | 1 
                  python-2.7.6 | 1 
                pulseaudio-4.0 | 1 
                elfutils-0.155 | 1 

Detail of failures
===================

   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/498fc28ac70da6b6eef761919126b0e4cce1630e/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/8fe980af40ec74ced1e2b74ad9404aca05e4c027/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/29de0d7958b5819d3410256ea6af2d214af3ac47/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/ee3a5a56555ccfc8b76e10c5d35599ccd6e1b5b4/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/eaab0ff911be035547422b2b8aaebb0cf99e828e/
      bfin | czmq-b5730c5f8290a611fd3b92... | NOK | http://autobuild.buildroot.net/results/9484ad012f5b9230087127fd626014eeaff756e9/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/92dd06cf3c64f5b275c5eb0c45c4528f4f1d13c0/
      bfin |              dosfstools-3.0.26 | NOK | http://autobuild.buildroot.net/results/4b3983fde3b0f2187501d6f7648831c1644923d4/
   powerpc |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/06202d51d053524f2ae0967ac44ea180ff98cc62/
       arm |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/5ff8d84731550b2f3d94c768917d71974b5090d1/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/451e32e9124384b07f00f48e24e5337b9d9107e9/
microblaze |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/c045825f1a538ad58c0d33929929e0f21603b29a/
      bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/9ce9b4c52a7e0d0159b5b4b9835b9e3e7f8b2a08/
    x86_64 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/dcbcc67d6dd2b21228b79ea64c698ad6b56cd716/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/415161992c37297f413fa26e0c263cf4604c5340/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f2ab780fbb7372ef4104a31040950455b4e6c183/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/a0aa1b8645ea9237c4bcdedd7cf2b05d416a3ed6/
      i686 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/17bf55c8b19c874e43a46603d784d4ccd62fa45a/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/a5093c889ceb8654d9e43650484fa01b30dea9bb/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/2afe3d6ecde44641f44748b504d03c372f45c329/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/e2aac319c4abf82cdde9f6e944edd464e56a6ac3/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/3d7b69c0dd075320163f5644bcfcb89c51a66a76/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/ef39a4656c96842bde40dd9135989df460cb2ba8/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/1a13b1265665ffec867c9db73f90b8a6694e4726/
      bfin |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/929abae3bcbe99179cea2aff98e5603f4b7effb9/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/087a5c457a901a4154a5eaf26c3b87a2cfc6b944/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/00764fc1065147be729de0676f00c4ae722dd811/
      bfin |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/6ba399db1715a7759048e0d532768a335c3c97cc/
microblaze |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/e8e3fcec72427f6433de6977332cb5a292650542/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1270baff589ee1942d53ce57c20bc28646dfb3ef/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/acdfe9c171633e75e71d2435d4b1cd82f0a1b75f/
    x86_64 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/5a92014604ac9223fc85ab25c8940bcf3935bfc4/
      i686 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/8b5c4de6dfe373de2fe78e1206e23f63f8025feb/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/191bab288c915d4443df603f795d413c7b80c4b4/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/9c058ca15ba30925b3d8b784516bc1f864c0f4fb/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c68afe6a5a15ae83629ac07b900d6b3e8a480db2/
    x86_64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/b14095938e86ca140d9f19170597adad1710881e/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/a18c8e4b5edb43e1846cf61f4389e7aa69a2601f/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5435e869c635363ee1d254456669291606d1a90c/


-- 
http://autobuild.buildroot.net
