From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-16
Message-ID: <20130617063005.BC70152C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-16
===============================

        success : 92 
       failures : 35 
       timeouts : 0  
          TOTAL : 127

Classification of failures by reason
====================================

        host-dosfstools-3.0.20 | 8 
            host-erlang-R15B01 | 7 
               libglib2-2.36.1 | 2 
                openssl-1.0.1e | 2 
                beecrypt-4.2.1 | 2 
               aircrack-ng-1.1 | 1 
               openswan-2.6.39 | 1 
                     pcre-8.33 | 1 
                      qt-4.8.4 | 1 
               ruby-1.9.3-p429 | 1 
                  iozone-3_414 | 1 
                   neon-0.29.6 | 1 
                 libffi-3.0.13 | 1 
                      axel-2.4 | 1 
make: *** [/home/test/test/... | 1 
                   icu-4.8.1.1 | 1 
                 libpfm4-4.3.0 | 1 
          host-protobuf-c-0.15 | 1 
               sconeserver-211 | 1 

Detail of failures
===================

      mips |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/8858650f86e6b4851d4c51eda3a9e2980f403183/
      mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/08c4f6292f3645ad9499c73bb8ea8349146f92a4/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/5d004bcab82b6a34a17af19f61625f8094ad4b5d/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4e963e5d5b34f3122e2563643eeacdfdb892e674/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/4d3c8a277af9fe6a71b3384fc4f0cde5627651fe/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/7c621e6c7321fb47faf87aa41ba236a1d11d3989/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/630bc341bd71390107d168d4c8e260bcc39704e2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/dea52adeaf780f2fac00c2461c58f0a62cd27fae/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/bb901c3e5d04d5e10715295399991d0aca06cc17/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/757980a81166fbc46fdb8ca7d7b22d887ddee827/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/dbbe6ac190439e3d00542812f7a594cbbdaadb6c/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/d08f9a8e2ebf50862197aa2b0fdd92242548fcca/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/be8b4869ce7ac00d53eb21dac8b08461fe304d0e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/de0d3b3e3c403c5e6507d78f028f1d2a826bcc2e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/1d52e5f084c40673349d0270271481a62a6d4701/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/951022dc2048fbfabd570d4c5685f668d60e588e/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/1281e5f6fc27c50cca169f51baa1b16767dbfda8/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/2a61850a9a0782edaa67ce0e903f796996d868c5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/daf37fa73ce8a9880a165fd35ebda741154138fb/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/c11d421cc541b193fad3cf4e6407792decca95a7/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/1924fca0fcf635e140c13ef42a31949baa91f3a9/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/ba7caf459c25e0dfa14578fe987f642bab9e7f3a/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/509e69edb1f02f297778ee6163b44f1b7875ccb6/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/0830d435fa87e7f23354b0b78083f5aef1fe72f8/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/1556059437c7e70bc89bfb35addcf03a9bb8bf56/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/b05c8a9558c1255c1595ea1038b1f2c2089740bc/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/588fedb765505abe52655474ce44254d60dcb5ab/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/e7e0df53f482903d9bebc3b68c52eaa5dee371f6/
      bfin |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/e3177309a56895bd243dfd413c2e8cf07198eeb6/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/5140411a2f9cf5f669a0339873d8dc35b51e1453/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/7d5bbd802f4f93bfd8c6a428c92dac92b5f90799/
     avr32 |                      pcre-8.33 | NOK | http://autobuild.buildroot.net/results/8aa34ce7ba879311550f81ed29cf8aeceee8c2a4/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/94295b8339bacff84d41cacf8848f84da5cd1482/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/e59195384471b397d95e0b18070ddfca7f0dbef5/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/f2856c00d99fbf9ce882442ab7b868ccc4966388/


-- 
http://autobuild.buildroot.net
