From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-20
Message-ID: <20140321073009.D811510155D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-20
===============================

        success : 55 
       failures : 30 
       timeouts : 1  
          TOTAL : 86 

Classification of failures by reason
====================================

                 mtools-4.0.18 | 8 
                   slang-2.2.4 | 7 
                 qt5base-5.2.1 | 2 
                     wget-1.15 | 2 
                    crda-1.1.3 | 2 
                 fio-fio-2.1.4 | 1 
               libbluray-0.5.0 | 1 
                  zeromq-3.2.4 | 1 
          enlightenment-0.17.3 | 1 
               audiofile-0.3.6 | 1 
                 mplayer-1.1.1 | 1 
              host-scons-2.3.0 | 1 
              /bin/sed -i -e ' | 1 
                elfutils-0.155 | 1 
               vo-aacenc-0.1.3 | 1 

Detail of failures
===================

      i686 |               /bin/sed -i -e ' | TIM | http://autobuild.buildroot.net/results/29f6519fd83d86795c84ebe7ab27b02da7af6502/
    xtensa |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/65ef98b6c36e97bd5b3ecc71aa7fb0b8b0a60910/
microblaze |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/2169175c75bf823faed9de81c339dcedb505bc42/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/27d483474c4ca8028bd1554bb3fa8eb1891b45ce/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/c6b8b927ebed6857c1dba602f28c8b5db6c4fe45/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/96f33ad28b11d03746409bdb53304c624e57e772/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/0ef7358289bff2a5f9efda27115eddb379c1a0b9/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/429915df538866bef7192937d1304b5274dbc4b0/
      bfin |                libbluray-0.5.0 | NOK | http://autobuild.buildroot.net/results/d107aeccd00d5f8402cf83bb28648ead365084c9/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/49305cee4e4ed4efa65364a1581c3968492af331/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/4704ec5bd2ed79286b616acb3016572d50a363d4/
       arm |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/fffae7c4bb8c86734dd006fa1548e2a60ede015b/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/9d20e3cd9ae5443220d3c158db418460e3290bf0/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/97e244f13fc3bbad12b0b4674525188be405b720/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/a88f613d8bd2eab95334c2c04924dbaa5827e307/
      bfin |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/7e497a2345eb3322df831daa62a93a6367693aed/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/e252ef7a3c6138a6dda9236c91280ec1dfccee7e/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/b72114ed4ab31606920cde10f3a853983e55b1b2/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/51d2186bb0702d743b49aecc688ed038011d2f27/
      i686 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/4544aed1f67c547ea13184664463539c13850437/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/91aa3b9bc7d0412878a14f55954d44e3e140d7c7/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/f836b9361fcea28e2dac85d9b51cf3ce398984c0/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/87a0f4f6aca36f5a528d9983fe5f28704071ff6f/
    x86_64 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/2eeefc2129acb7693dd52055ad29fc21e9288267/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/a04183762226fa85f5d028850539abcec60f3dfb/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/017ca1d8876620f9291471296c2cdc5d18ced1ea/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/be36c76bbc00ce8fe3304e830346af7e393a1fde/
       arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/a1d1b20a88cd1a0c0495d0363047c986a6ca1af7/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/50b5744b027127d7b46accd35c5092b2735ac053/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/a1bba3f855f2b08ce0213067273e5c9ba3467f84/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1fb7c93ffe3ac946065c58448760f3d4aadebaf9/


-- 
http://autobuild.buildroot.net
