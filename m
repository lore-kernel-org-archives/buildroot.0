From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Mar 2014 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-13
Message-ID: <20140314073010.7D52F101987@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-13
===============================

        success : 54 
       failures : 31 
       timeouts : 3  
          TOTAL : 88 

Classification of failures by reason
====================================

               netsnmp-5.7.2.1 | 5 
                     wget-1.15 | 5 
              host-scons-2.3.0 | 4 
                directfb-1.6.3 | 2 
                minidlna-1.1.1 | 2 
                  python-2.7.6 | 1 
libtool: compile:  /home/te... | 1 
               vo-aacenc-0.1.3 | 1 
                 msgpack-0.5.4 | 1 
  CXX      DerivedSources/w... | 1 
      libnetfilter_queue-1.0.2 | 1 
                elfutils-0.155 | 1 
                 mplayer-1.1.1 | 1 
                    crda-1.1.3 | 1 
                  samba-3.6.23 | 1 
mms/mmstu.c:356:5: warning:... | 1 
                  avahi-0.6.31 | 1 
jack2-37976441044d69b91d61d... | 1 
           imagemagick-6.8.8-7 | 1 
                   patch-2.7.1 | 1 
                  mysql-5.1.73 | 1 

Detail of failures
===================

    x86_64 |   CXX      DerivedSources/w... | TIM | http://autobuild.buildroot.net/results/ab184afbaa4002422e9449ae8191de0ee495300c/
     avr32 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/76e4854812b0ef3862c080eead4012b35ef27f0f/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/da1906e9aa09bb96617a1be306ee694080e5b26d/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/45bbbb3fe2fbca0ecef2ff22f6feec5f56ef49e8/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/20e74f384b7b1d4092de5f2f1e4be9888920f7d7/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/f2928f1883f7b0319c0c816602604fad7ce56490/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/a9d0b53a32c42058dcbe6c6150219703b34017cf/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/0fbc78fb485ccb5235df389f3ad6c6958d30f970/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/4908fe552cf61520d97408fd43f41ea6c8ea6c25/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/3270f0093052528953648143436469dab7b2d6b7/
       arc |            imagemagick-6.8.8-7 | NOK | http://autobuild.buildroot.net/results/85deef67654019a630d6cbc37f3dbbbc071aad38/
      bfin | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/7b943cec29b730e4a014bd508c2ad295ffd635ae/
     nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/ae274f491a51d208c195dfc87d50a3c1497967cc/
   powerpc | libtool: compile:  /home/te... | TIM | http://autobuild.buildroot.net/results/d777205e11ddcdc09f469ec013251139157223a5/
       arm |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/c6baebe005d6c024514bb1ade5ca391ea341c239/
       sh4 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/b228ddd3d9f719825eb2fb2623e029cdc8e1fe12/
    x86_64 | mms/mmstu.c:356:5: warning:... | TIM | http://autobuild.buildroot.net/results/622d4ac2185ec0a7639c235f01c7040e21e5adac/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/2e42ce984fd566922b760123ba751999428bf0c6/
       arc |                  msgpack-0.5.4 | NOK | http://autobuild.buildroot.net/results/44849a386cefb8899f4560296bfbbd8ea19ee910/
    x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7b06ce77b72db980493260602a5104e2c39e1bf5/
       sh4 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/6b0d764e4ac84ebbbc8331dd3b70baec0dd56663/
   aarch64 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/01808efcfaad7fe7849f1c7e7ce8a94c8345b4d5/
  mips64el |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/0e0233c5958731904a930be9ce73a08df9052e70/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/5078f57d0165fa82933121f9fa8325a531c0df76/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/540db25e86cdbe1f23f94ffbd847f4f1f87593e2/
       arc |                    patch-2.7.1 | NOK | http://autobuild.buildroot.net/results/0f92ba6437da5457ed6c0168f0a70a72a58fd471/
   powerpc |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/0bf851ef3ffe21fe73b35e7ff08947b4822eb181/
     avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/112a952b296076c663165960c626a4df0900ff7c/
       arm |                vo-aacenc-0.1.3 | NOK | http://autobuild.buildroot.net/results/659c706cd330699b342f088ef84f49781f9fa052/
    xtensa |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/9d6cd74daf5cae31636ae46b051eacd0f19313dc/
      mips |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/27557ea4988d379890bf7b3f786ce9041657f1d9/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c5642cb9756906d79f7aad39f561bb2c4195ab69/
   aarch64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/1a7234740a78aa045faed3965090cbbca224d121/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/2d9f549014d5fb5b261fc1e38f972d342c04e349/


-- 
http://autobuild.buildroot.net
