From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-18
Message-ID: <20140319073009.63398102654@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-18
===============================

        success : 54 
       failures : 38 
       timeouts : 1  
          TOTAL : 93 

Classification of failures by reason
====================================

                   slang-2.2.4 | 10
                 mtools-4.0.18 | 8 
                     wget-1.15 | 4 
              host-scons-2.3.0 | 3 
                    php-5.5.10 | 3 
           imagemagick-6.8.8-8 | 2 
                rtorrent-0.9.3 | 1 
                   ptpd2-2.3.0 | 1 
/usr/bin/g++ -c -fPIC -O2 -... | 1 
                  dnsmasq-2.68 | 1 
                cifs-utils-6.3 | 1 
                    fltk-1.3.2 | 1 
                    crda-1.1.3 | 1 
                elfutils-0.155 | 1 
                  samba-3.6.23 | 1 

Detail of failures
===================

  mips64el | /usr/bin/g++ -c -fPIC -O2 -... | TIM | http://autobuild.buildroot.net/results/49ead8b53929e6957d5a11da361a3f8f3049c180/
       arc |                 cifs-utils-6.3 | NOK | http://autobuild.buildroot.net/results/e8e6852caa000d408da9e885214622bd0af11e19/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/020b215c4f452ec6b071d90cc47dd64f1c5b5c71/
      bfin |                   dnsmasq-2.68 | NOK | http://autobuild.buildroot.net/results/84518557b9db02977f51e085e9d03617d6f3e136/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/903f1322b8886ccbbfbf7195437028ec9363e445/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/2350125e586c0cbb8608eeb2821b3a6db781d468/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/71b5730a076421b2122243df06050aca481ca0c7/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/e06f217e4e672653a5952ac74abe362b1c708297/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/f52d5dfe3509b78a0c3420c8926998d24c3af2c1/
    mipsel |            imagemagick-6.8.8-8 | NOK | http://autobuild.buildroot.net/results/53a7758ef116e0f81af35312e9b66dfa6c63ae72/
      i686 |            imagemagick-6.8.8-8 | NOK | http://autobuild.buildroot.net/results/ee7957ff7f61dcb18cca2ce683ed18894405f7a6/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/88458761d3618c5ec4f8a490626e11466c178d17/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/43250cb435b60f3d8dd3f6e14f5c1b92f4272858/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/9c66341188e5041e1f46a23df36e996c18238f32/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/b3489e7d47a2330668d4457f8ab6b823911c0350/
   aarch64 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/2e410a80c7d351d542957fbf561e9256349728cd/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/9964b77102b91a78c8d7693a433cc34398885052/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/81f3ab4d244e427b32935337f63b0abed5d6b403/
      i686 |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/a15165a1d0b9e5c77d6042659ae4f9030626ebbc/
       arm |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/e84b14f0d4bc02596023a10e413d05459f39f820/
    xtensa |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/fbd6317f384608a5ef46063d442651c2126158c8/
    xtensa |                     php-5.5.10 | NOK | http://autobuild.buildroot.net/results/99580cd10a1108822a81d9c252516adffd04b2fd/
       arm |                    ptpd2-2.3.0 | NOK | http://autobuild.buildroot.net/results/940fdc345b25b73b89895b0373675b3e8de20c40/
     nios2 |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/4dd0225c1cb82b66215320c266149791de345093/
     avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/4a44a0c7d485eec5939827f560678ca8a7a38b4c/
   powerpc |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/340c05f9c7efd62339e6790761aaec86de7f7f91/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/aa4c80716959e99200ba298ce46ce945a0700d43/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/1d5eddf4621f71e3a20b0f68c1b224386d77ad0e/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/2f6f87f8749107d34ceca13e4af93f338027cf83/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/4dd7d792ee85638e5d2cf47db7e1ef7ab6c11c62/
    xtensa |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/6783989d60e306288cca14dc03d883a4150590a8/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/cbc5f726dfa64b42e45cbf54bba31c8c55ed17e5/
       sh4 |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/2de29e8bdcfa6994083e749f337feb660a165e2d/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7e4d8faaa756059af5a6d5ccf04e2ad66424717f/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/cb74af69c7fd682e5a58569655eebfc0e4650f5f/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/346e8c4dcc833f8d1f8636d635c3e17b4684fcc1/
       sh4 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/971b32bd2611493abfa233b2d2d552a2a1971e6c/
   powerpc |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/afaf8d7af66a46fe880b34daec5313869a5f008f/
    x86_64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/097ac602193ec8fe202401c04ee43b50894b40fd/


-- 
http://autobuild.buildroot.net
