From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Dec 2013 08:30:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-14
Message-ID: <20131215073007.6302A100241@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-14
===============================

        success : 98 
       failures : 15 
       timeouts : 4  
          TOTAL : 117

Classification of failures by reason
====================================

                       unknown | 2 
                elfutils-0.155 | 2 
                   lftp-4.4.10 | 1 
             fontconfig-2.11.0 | 1 
                 civetweb-v1.3 | 1 
               w_scan-20130331 | 1 
/bin/bash /home/test/test/2... | 1 
                      icu-51.2 | 1 
                 netsnmp-5.7.2 | 1 
  CXX      Source/WebCore/p... | 1 
                  ltrace-0.7.3 | 1 
                aiccu-20070115 | 1 
                 rt-tests-0.83 | 1 
                protobuf-2.4.1 | 1 
                     m4-1.4.17 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                libsecret-0.15 | 1 

Detail of failures
===================

    x86_64 |   CXX      Source/WebCore/p... | TIM | http://autobuild.buildroot.net/results/0fd3a8910ab02348fb3f070f4a5f6a2bcf5171a6/
      i686 | /bin/bash /home/test/test/2... | TIM | http://autobuild.buildroot.net/results/a0e2535fdef522a4f393834cf7320f1d3cf1a1db/
     avr32 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/0b0916540102c27c2c771f422e1d043da84e5a14/
    xtensa |                  civetweb-v1.3 | NOK | http://autobuild.buildroot.net/results/073f935ee14e4fc13fa2503ebc6688b77b64f60b/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/2921ce3e8f83a7e434e50ef5afafe9e7707ada49/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/b1c24773c934fc41b5ead342e6cb38e4ef951e92/
      bfin |              fontconfig-2.11.0 | NOK | http://autobuild.buildroot.net/results/0b82105acbd24e44a8cc1229342b56af35674b08/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/bf70c4b2c62759f442e806adf97c15d06438375e/
      bfin |                    lftp-4.4.10 | NOK | http://autobuild.buildroot.net/results/1e1a10f855d2885dc4dd1878847633dff0f2c1b7/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/c84c96eb01fccfaf0575201a4fc16af9f7b54419/
     nios2 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/828c04cd3788b26d2060074612c5b172bd203d47/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/44b5b7f332adb5cac0310c0bc40f10a03acfe736/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/e60eddd96ed2a40eb582a87605542ac23a1e8ff4/
      bfin |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/9fb3fcf54ed5a21fb09388346df072284a652537/
      bfin |                 protobuf-2.4.1 | NOK | http://autobuild.buildroot.net/results/11e7c1c5365deabe75428bbf9d5ee0e8af9015ce/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/4d3f5f5d9e4da76b0926420b1408a8b9cac26138/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/10204feeecb95f1157491e482ee4ea3be80c34c2/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/9d8d2289cc62e00e87e3483bf48cc2f8381e50cd/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/928ff57b10598be26b0071c1e7b697ae1624af55/


-- 
http://autobuild.buildroot.net
