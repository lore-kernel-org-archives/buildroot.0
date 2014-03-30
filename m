From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 08:30:08 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-29
Message-ID: <20140330063009.351A010159F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-29
===============================

        success : 46 
       failures : 46 
       timeouts : 2  
          TOTAL : 94 

Classification of failures by reason
====================================

dtv-scan-tables-cfc29758d13... | 7 
                  newt-0.52.17 | 6 
libuci-262fede3e8c8c08c1eb0... | 5 
                    crda-1.1.3 | 5 
             lttng-tools-2.4.0 | 3 
            lttng-libust-2.4.0 | 3 
                  python-2.7.6 | 2 
                     wget-1.15 | 2 
           heirloom-mailx-12.5 | 1 
                    gpm-1.20.7 | 1 
                  samba-3.6.23 | 1 
                      bash-4.3 | 1 
                     popt-1.16 | 1 
                 mtools-4.0.18 | 1 
               libsigsegv-2.10 | 1 
                  zeromq-3.2.4 | 1 
libubox-bbd846ec2d72b262975... | 1 
              host-scons-2.3.0 | 1 
libstrophe-d408eaf2bbfe5ff5... | 1 
                            li | 1 
                       unknown | 1 
                 qt5base-5.2.1 | 1 
                valgrind-3.9.0 | 1 

Detail of failures
===================

       arm |                       bash-4.3 | NOK | http://autobuild.buildroot.net/results/fbf1085af739daa8a4097797ffeadee4d556953a/
    mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/3900d544ac3c05a114421bee3fae1c413c0aad6b/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/b2cbabf88d607f30a23a85810dfc85990a56a8ad/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/916cd9045ee57cb86c6b16e7a2444dfe955c6865/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/60b3994c2cac0fb3c813b7e39d1f51bde9a8d6fd/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/946c460f69e34805909fa19a8c8d21bd231ecd0e/
       arm | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/39db5c4834323fef2cbb0aae4250c74c9c96c413/
      i686 | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/3b3c58d3156e1d78d6c2cd02ffa6a4aa35373ac2/
  mips64el | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/099c0d06f5d0ec71d20b81ba269bd766159294a0/
    mipsel | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/290d19972c5062f893d0b80958e52f8b0003ba77/
   powerpc | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/3379a3a4e5c3144adc83361cc8ab49c4ba9e6dbb/
       arm | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/9297fed9b5b513b86ca9e3554423296f6d2ba479/
       arm | dtv-scan-tables-cfc29758d13... | NOK | http://autobuild.buildroot.net/results/c4741f9c750bbcd72bef5309c68e89561b506505/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5b8f6af6a0da34e153595ee980c3ffd10be3add4/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/ed91bc67a6397ef143b06edcd3ed3e0dca10d7e6/
   aarch64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/3b4092beb423312de68cb839f42d114da9866ba8/
    x86_64 |                             li | TIM | http://autobuild.buildroot.net/results/e13f9022b60d1c83ba2efebc01e5cfb635713ba9/
microblazeel |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/f4ca17831f866dc062086c1e688d4701f4dcde62/
       arm | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/21072a847ecc682594ed06897fa45f888b562123/
      bfin | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/4e112e4463fef7ad8757259b222fab10fbd09d0d/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/e5fd0428650a74da4854df58aadb90f9f7cf644d/
   aarch64 | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f541c6ac3acafde80beab838e8a22f07decb4220/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/367c6adcfda19586b8e30c7c445581009e08c285/
       arm | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/78711714775bd03105deec3ce960231c53363a8b/
    mipsel | libuci-262fede3e8c8c08c1eb0... | NOK | http://autobuild.buildroot.net/results/f76a1b22b91d0d7a5bc30cce06c9eaaaeefea449/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/95c1af35aa9ed0f440f6a7ef0e4aab1e909c55f1/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/806df8a4eb2c50ec491af3d8a6c143b0bb2b9bf6/
       arm |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/d3fdad7199a0a2825455fc2192e6702ef3a9dee6/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/24286b28431327c20a88c7d892c866bffc889001/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/eb26e20b657a8f942dc9794459214c55296c060e/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/b575098f26aac9c8db385f5ed55dc07e9a4aa07b/
      bfin |                  mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/c0ff79569690b5799c25c09bde581cee6acb9910/
      i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/5533328ec987f12d0b3dd81c430e960d3dc50503/
      i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/ce14539cf65c717d44dcb119129336a2c82e9aca/
       arm |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/1c1c0eae1a1dc3dc5e27f4e2b11403488912618c/
      i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/a75aa9e6084d6dbf03dd334e0de807dfe0c9def0/
      i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/d8230c956e856bd66dc39339a9ca287a8226ec2f/
      i686 |                   newt-0.52.17 | NOK | http://autobuild.buildroot.net/results/02dba612586d290255fb080cdc938b24dec483a2/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/74aa73ad319f9ebaa6243dddd6a88f2496d5b627/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/6c9a6e25b115b28f3caec5b9f52a36a5bc4a7367/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/fb26c6319ac2ae68d107d008ea30908b8456d942/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/7dae6c1e051acfc82613fc8a6123077e24dd624e/
     avr32 |                   samba-3.6.23 | NOK | http://autobuild.buildroot.net/results/7cf2fc3f5d98b653dd3050ae893a60a9ff869374/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/d49d69b4aa7f9377e09c85f7265b38ea237554b6/
  mips64el |                 valgrind-3.9.0 | NOK | http://autobuild.buildroot.net/results/21352bcbe1b309fef0f996c275cdfcda08619d96/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/d7de3ecdf8989f114cb7c697b6b03ad6cf7f68ab/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/967fbefb9c425f0f5750ee678f4f005669f0cdc6/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/edf1464a65701baba1624c8c94eb77bd16257fdd/


-- 
http://autobuild.buildroot.net
