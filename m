From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Jan 2014 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-02
Message-ID: <20140103073007.E79CA101DFF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-02
===============================

        success : 88 
       failures : 42 
       timeouts : 0  
          TOTAL : 130

Classification of failures by reason
====================================

             transmission-2.82 | 14
              cryptsetup-1.6.3 | 3 
                  libv4l-0.8.9 | 2 
                     php-5.5.7 | 2 
                    ola-0.8.32 | 2 
                 dropwatch-1.4 | 2 
                 pixman-0.30.0 | 2 
                 fio-fio-2.1.4 | 1 
               w_scan-20130331 | 1 
                 cairo-1.12.10 | 1 
         dvb-apps-be76da69f250 | 1 
               alsa-lib-1.0.26 | 1 
                 dmalloc-5.4.3 | 1 
                coreutils-8.21 | 1 
               libcgicc-3.2.12 | 1 
                  thrift-0.9.1 | 1 
               audiofile-0.3.6 | 1 
           imagemagick-6.8.8-0 | 1 
                 webkit-1.11.5 | 1 
                aiccu-20070115 | 1 
                busybox-1.22.0 | 1 
            lttng-libust-2.2.0 | 1 

Detail of failures
===================

      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/e9bacaa60a8b19d76a840ea02525775c4678759c/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6544a4fffd25efb39d2ea819fc77e3d9eb961764/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/36c3ec9b81bcd6f6953dda25b9f887dbe498f026/
     avr32 |                 busybox-1.22.0 | NOK | http://autobuild.buildroot.net/results/790592fbcc68b0f7cf9b02baa1ee26796281b8d3/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/4abe965e3cb304f4f7a60fd29f4c080b8d8b9e1f/
    xtensa |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/1aa246d721b09dfc1262f0ea6fa12cc73c0cb574/
      i686 |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/3ad9745963d062018586671de95386530e9eea3a/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/e4764ed26ceb5eeaf5b75f69ca092dd744c23444/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/7175476c53c5e237ca4edc8a0b84ad24bcf37a94/
   powerpc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/2785ae771c9d7a072aca45a32b97bdd829cafd86/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/06a5c9169ba2e630f2cbf0b349a1d1dbf277dad6/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/debafab7c282e7c42d072a93e6b9dc99fe901109/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/5d06ffa789fe41cff3919e1b1b399feae9074bab/
     nios2 |                  fio-fio-2.1.4 | NOK | http://autobuild.buildroot.net/results/ceda3abb1074415fadd13c133a80d2f49209f4c2/
   powerpc |            imagemagick-6.8.8-0 | NOK | http://autobuild.buildroot.net/results/4f8ea412da3a3d942f22aad6ee00d20ad02f0f23/
    xtensa |                libcgicc-3.2.12 | NOK | http://autobuild.buildroot.net/results/7ccbf088cac523f5cccc36d4b5edc3a45c670044/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/3dc9d397cf078c2d3c7dd8f2fc5640c852e8c022/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/68fc2cc422afdad6336f91d9aabe526742b58e79/
       arm |             lttng-libust-2.2.0 | NOK | http://autobuild.buildroot.net/results/ad8635abaa7e667087068bf1bc9c530c96dd7469/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/4601b36b5d25b8bd0046a5f793b853eb8a41b9d4/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/937341afb81ae37328287813d6eb529b3a6682fe/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/4feeffb030497f82018415863f4cfe841737fb49/
       arm |                      php-5.5.7 | NOK | http://autobuild.buildroot.net/results/65bf18f75def06ec3b723ea68be35b19a109d6fa/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/01869b49eb1d305cec98d4d9ecf046427e88c2f3/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/0e8a2f5fc1425e153c112f87083e8a93f726e3df/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/84275328f31ac1b7becdffccf81175769bf031f6/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/4bbf6c8367cd5980b87c3a5b91c8b356714c3371/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/f9d39f2f5f672b0e07e0b68b681035e9b086a939/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/47382f98aa07592f5e6cd6deb6eadb1e9147712c/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/132e9b0685b3c0edba469b436bef11afbd3f16d7/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/d677d2157623cd8d23d3e53381eeb3f9002bd500/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/6dbe02b7147c5be468dde9a792eca819afb9e4d2/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/22468c6d2d480dbcfe4c367c8cd998e1d8c61650/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/26272b83509dedd9b64931a1004e2f7ba7dd3240/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/9588b6963376550d4d497ea003bc0889a03faca0/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/d4e8804775c618bf6f6b01789a65bef9435d3d1e/
       sh4 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/63884de929fb7339ebf44b08cb5d1ab30010666a/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/eb486228a11a9602d4bf40e771744d2b2b40508f/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/1a89d9990e9bfb28fd360dcf1f8c5bae35eb8aad/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e676639d6bd38ca9a1cefc427b96b32534e28f2e/
       sh4 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/ebc09d3429aefbbb2ee623296a3d6501226d5650/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/25d89316c29e1d21e81be3d6e724c03f56b30d8c/


-- 
http://autobuild.buildroot.net
