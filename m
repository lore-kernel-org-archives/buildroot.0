From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-09-14
Message-ID: <20130915063004.597EC52C1E6@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-09-14
===============================

        success : 72 
       failures : 60 
       timeouts : 0  
          TOTAL : 132

Classification of failures by reason
====================================

                   squid-3.3.9 | 9 
    trace-cmd-trace-cmd-v2.2.1 | 7 
                 qt5base-5.0.2 | 4 
                    orc-0.4.18 | 3 
               libglib2-2.36.3 | 2 
                  zeromq-3.2.3 | 2 
             gdk-pixbuf-2.28.1 | 2 
             tvheadend-5956233 | 2 
     xlib_libpthread-stubs-0.3 | 2 
               binutils-2.21.1 | 2 
                 cdrkit-1.1.11 | 1 
                rrdtool-1.2.30 | 1 
               qt5webkit-5.0.2 | 1 
             util-linux-2.23.2 | 1 
              e2fsprogs-1.42.8 | 1 
           argp-standalone-1.3 | 1 
make: *** [core-dependencie... | 1 
media-ctl-ac40b79f002a2315f... | 1 
                beecrypt-4.2.1 | 1 
                     rpm-5.2.0 | 1 
                      pv-1.4.6 | 1 
               w_scan-20130331 | 1 
                  prboom-2.5.0 | 1 
                bellagio-0.9.3 | 1 
                 ffmpeg-0.8.12 | 1 
                libsigc-2.2.11 | 1 
                  libnl-3.2.21 | 1 
                 dropwatch-1.4 | 1 
                openssl-1.0.1e | 1 
                   mplayer-1.1 | 1 
                  connman-1.12 | 1 
               alsa-lib-1.0.26 | 1 
          host-protobuf-c-0.15 | 1 
                   expat-2.1.0 | 1 
                   dbus-1.4.26 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c99003ba2cb38ca187ea99f4902e46efe6a3cce9/
       arm |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/b2e945751bdf9d170e8ad2533820a7e05a5c3c73/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/325199430009fc0ad197b24bbcbb135b18be8971/
      bfin |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/290d39fc26b9c81aa67be816b1385a6c11eaf67b/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/1c024af80809b8d913952da1cf407dad7f211c2b/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/6a8809475626977a1c90da394b138736799f2b93/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/1d7d5cefe7d2352a68aa29c4389c15b85272ac64/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/e789e22ec1e25b4444b4814e031e149dfc34332c/
  mips64el |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/b20ed6e770c3fc3192fbe5b81ec25d70a5a61699/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/1d488e5997d3819f02a97f124d6b0b9998d91449/
microblaze |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/50002693315dba39d3237d10639ae79112c1ea53/
       arm |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/85cc325fc4dc562a57ccaa8d4b15540d286a0855/
   aarch64 |                  ffmpeg-0.8.12 | NOK | http://autobuild.buildroot.net/results/7475d0880e298ca82b69983bff2cab96a9d850dc/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/b8a446968f50484a4955fd2582ef134392f68367/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/045d6f9a680489309e3dd36f12340767b156a69c/
   aarch64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/ab326d5373f6391e390ed53b57dc16a7b99a0373/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/6e292d15bef4eb18bb829258f005c06a4e9b6756/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/14f6b4f9a310ca5bf2309abe14387450959164d1/
      bfin |                   libnl-3.2.21 | NOK | http://autobuild.buildroot.net/results/d756ce80f1c23bdb839d2b4afbaeec9ada5c4fa5/
  mips64el |                 libsigc-2.2.11 | NOK | http://autobuild.buildroot.net/results/58bc5ad8faca6d07a154121a6449842acfcd9f8f/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/1726666940dd5310a2f422fc8d0b4b78e2717a08/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/06b35b59cbc5b7bd7a23343f360301fde4d5e2bf/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/f29d9f2556612c905339bef8de18059e7cd37775/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8afb3e2a2b72a07e05a6ff6596380222d618b81a/
   powerpc |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/4d2a3635f4cfa12cdb4bded252710c982c260332/
    x86_64 |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/39f81e6bf5dae28a833964d8dfd287af484a79ee/
      mips |                     orc-0.4.18 | NOK | http://autobuild.buildroot.net/results/052e65795ab756e2f08f7c2338abba1eda0cb7e1/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/e830f45eb811a26f8ed684091346a739d6a5ec4a/
       arm |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/f91acf36eddc32ff6e2bf64e46af21446644ef33/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/5a42efb8bd08c6301401a83e16605591274b1e01/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/054391e5a5a13c671b230c07406b37a889ee71a4/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/585cad322ff8cafe80a4ad66ef463eb969c2c9c5/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/e70bed99363d35b77e2163bb0282b5dd09862046/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/d4e4db4a1384d583c13b2dccf7707f57df13ee02/
   powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5df33f1162ca06138d8ea51cbc5c97399d2617e1/
       arm |                 rrdtool-1.2.30 | NOK | http://autobuild.buildroot.net/results/4e4da6ddf6d1643db45f7e74baaa83ee47313735/
   powerpc |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/f0d3bf9304cf9be9d8e463675fc47d564f286ab6/
   powerpc |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/660737355caa2e49c1801c9e36e189dafcb9dbe9/
   powerpc |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/26f233d7d666d57489a0e493cb179de94a76bb87/
      mips |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/0e4019559fc2b5e18cc82828e0b50d4888412a10/
   powerpc |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/8263d4fce40b1d4f37c77126783efd6fe9307b1f/
      sh4a |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/b1d9fd6459222ed8e3c1748719e99f0d29862dfc/
    x86_64 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/24065f61c80bdc4ff9cad30dafbc9fa316452268/
    x86_64 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/2d0a8801c704350116e7f40d9d3e21e1332ff07a/
    x86_64 |                    squid-3.3.9 | NOK | http://autobuild.buildroot.net/results/97c74170481afc89fe0a5da756455f8c32264256/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/50994b6b36161193c9ca1b38fe0ae9e658703f06/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/cef541365bb3a2842a76f38ecb4c19290f84cd67/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/dc2074e9d8bd86d4f73f519f7f9124d7149fdbfd/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/2573dbff4c850c766f42cb45486a68327d63c673/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/19028c91f0659f3c50d95114da302751b22dfcce/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/0400407395fb5acf6a4fc93c8344c42373ce03a2/
       arm |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/177587d5eb5799319d99b89d7d09e9298980fd78/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/271ca9606da6bc2ea9a148d85b883e4d064ed26b/
  mips64el |              tvheadend-5956233 | NOK | http://autobuild.buildroot.net/results/53bce6013bde337c6b75c477d76a75bea7db1e9e/
     avr32 |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/19f0ab3532f3138d90830df8937101a7a91da4cc/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/d8a3ebc87ed5a7c2c04ae80101f74b7bf114d8a9/
      i686 |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/451b25ce11775a016b7a3bd7d870f249b593674d/
       arm |      xlib_libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/3a1c13dd4cc8553a4d2d130d6425d4d95b245942/
      i686 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/424de5642cecd8e3466371f8b89c062d52609224/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/65859c1bf86d0f9c4f84bfcef0761b66c3d2a5bf/


-- 
http://autobuild.buildroot.net
