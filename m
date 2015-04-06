From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Apr 2015 08:30:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-04-05
Message-ID: <20150406063021.048CA101341@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-04-05
===============================

        success : 204
       failures : 75 
       timeouts : 5  
          TOTAL : 284

Classification of failures by reason
====================================

open-plc-utils-1f6e7e372b31... | 7 
              lirc-tools-0.9.2 | 5 
               kodi-14.2-Helix | 5 
                libtirpc-0.2.4 | 4 
                     gdb-7.8.2 | 4 
                  boost-1.57.0 | 4 
                      qt-4.8.6 | 3 
              drbd-utils-8.9.1 | 3 
                host-gdb-7.8.2 | 3 
                ipmiutil-2.9.5 | 3 
                host-ola-0.9.4 | 2 
               libecore-1.7.10 | 2 
              procps-ng-3.3.10 | 2 
      host-gdb-arc-2014.12-gdb | 2 
                elfutils-0.161 | 2 
               alsa-lib-1.0.29 | 1 
                  snmppp-3.3.4 | 1 
freerdp-770c67d340d5f0a7b48... | 1 
      libva-intel-driver-1.5.1 | 1 
                   systemd-219 | 1 
                    qpdf-5.1.2 | 1 
                   bdwgc-7.4.2 | 1 
               log4cplus-1.1.2 | 1 
               wvstreams-4.6.1 | 1 
                    fftw-3.3.4 | 1 
                    gpm-1.20.7 | 1 
                     tmux-1.9a | 1 
            host-heimdal-1.5.3 | 1 
                   atftp-0.7.1 | 1 
               qt5webkit-5.4.1 | 1 
                 lrzsz-0.12.20 | 1 
                collectd-5.4.2 | 1 
pulseview-19be0af16af83ca10... | 1 
checking command to parse /... | 1 
                numactl-2.0.10 | 1 
                xapp_xfs-1.1.4 | 1 
                     vlc-2.1.6 | 1 
         lua-periphery-1.0.4-1 | 1 
        host-xlib_libX11-1.6.3 | 1 
               polarssl-1.2.13 | 1 
                    webp-0.4.3 | 1 
                 python3-3.4.2 | 1 
            libnfnetlink-1.0.1 | 1 
               linux-pam-1.1.8 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.29 | NOK | http://autobuild.buildroot.net/results/d0b427a3d670e3f4ca1c0820edeafd10b3b457af/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/a39be4a0856d90fb690ce9d5416bc87046ea9be0/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c99f14b251b6196f5145d80ce7028b3b4c59fd3d/
       nios2 |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/58104f17d966d9b92ad273c283d825a58c40e516/
      xtensa |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/d366767289052f7c41c981502b964712480cc0f3/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/4cdc837b3036cc5171ab7bc60e0476c50d69208b/
         arc |                   boost-1.57.0 | NOK | http://autobuild.buildroot.net/results/8463950ce476c42acc80a996cf2c7d1685b1f643/
         arm | checking command to parse /... | TIM | http://autobuild.buildroot.net/results/a143902064b997ad99bea8fc9652e523752b1e7d/
      mipsel |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/dccce3a03f3e074335bbca566df5e9d097c74326/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/2f827aeaca1f76f3d54430d04b0ebc5002cc58c7/
      x86_64 |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/d8cbb888787401ddefadaea8dd239a651f3dbff1/
     powerpc |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/402cb7713c3d311e704ff2352bab52e55c5a13cb/
         arc |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/988f72484d73712a707b7f6cfa981ff9685cc0eb/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/f29364b33fd5bf22c6efca9a618231ff245f5dc5/
     powerpc |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/346c21b741f5f06f2ce495290556c933b0c927de/
         arm | freerdp-770c67d340d5f0a7b48... | NOK | http://autobuild.buildroot.net/results/c7e6107d5345930cb4434eab0e4a430ec41dc84f/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/04a1d7bfed8075779e39990fec28c68d3961fa8a/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/4b9a4c0400dc151242b49d79229570945521ca29/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/5faa3a97df5c18d3dbe76c64461ab2bb55f072b8/
        bfin |                      gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/9a8f5b0631c00371d1e6252e721caa995c137077/
         arm |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/a4b076d2750056710ab85e364e9e2c687af971cc/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/ae8fd5316e448916307610113eb4b2a8ca5112d4/
         arm |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/e4a55859088f5a59019c3cf6860a3c6dfb74c2be/
     powerpc |                 host-gdb-7.8.2 | NOK | http://autobuild.buildroot.net/results/35563beb619c0104bfeb28895527d5bdd44a779f/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/cc0e26ab0c76bb6045c1733847926c4b4b0ce3c1/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/9e199b2b098ce717a185da9c389df63b1e90f7d4/
      x86_64 |             host-heimdal-1.5.3 | TIM | http://autobuild.buildroot.net/results/bb9737199572a87e2b8482917bd33438da7d7e42/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/e417d88362d9d8a34bc1a0daed881273d366b4e7/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/f9dacf9bf383c2df552dfedbe718b1f72f4d8a85/
         arm |         host-xlib_libX11-1.6.3 | TIM | http://autobuild.buildroot.net/results/e96314a7e14a03556059a1dc0a84caaaa6a398cd/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/434b156b5c9b5c7b65ffe6174cf4e029e7e3ffd8/
     powerpc |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/b2b50be359431b828e60c2ffdcd0fa1ca1cd5605/
     powerpc |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/534db17480b68d63e2071091f631090e73be477e/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/e6138bac331370b02af746e319ce8fd6fe51b793/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/e1b0fbc6631a0073d743705400460b8679b28a0f/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/c6301fc6f11204ee157a4f6a848dda9666cfb450/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/c3dbb01608debd1bf0af6acd6eb9de6d01424982/
         arm |                kodi-14.2-Helix | NOK | http://autobuild.buildroot.net/results/1c12779e67ddc6d3dffbc1d2e5ebf9887ae721ca/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/4a9c6453670f95202f9b6ab060869465a0e4f410/
         arm |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/1a5e577e94b1f1456b1ff1c7784e233842985bd9/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/b55ee4c748a562389e9cf8a51e35c7d2b288645a/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/7a0446c75cda243b2f2d1873e34767d561ce8461/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/a940dfc5fbf278fdc08c405067276faf11ac4cf3/
         arm |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/1696aa598aca57c99e50ff9c79fb95fc13616a35/
         arc |                 libtirpc-0.2.4 | NOK | http://autobuild.buildroot.net/results/edc0a47d098374d408fca014864d7f36253caa14/
        i686 |       libva-intel-driver-1.5.1 | NOK | http://autobuild.buildroot.net/results/0b741126dbeb10cba93460a5342c92e0203dcca6/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/3db111d98705c3dce68f43479bade35d06a30131/
      xtensa |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/85724dfd014cec5a80dd18a635826daa2edc1417/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/348da3a9be4f07c4bade2c2e201f51efe4b57cee/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/6c6e014a751650c16d25dfd3d673bd3199c72b2e/
      mipsel |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/a74563f700a47065ffd1ba42c83c2d7722bacd89/
     aarch64 |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/ec79a63968ef58173c95a55c9160a0a1616e0e99/
         arm |                log4cplus-1.1.2 | TIM | http://autobuild.buildroot.net/results/3ab6908f20bd2bd4ac3b13694499eb39c36824b9/
      xtensa |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/24f574e8dd67918dc87a25b8ad3b7e10a8d0c8a1/
        mips |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/471e88e98291888a7a4cbf3a71aa2204fea994cc/
        i686 |                 numactl-2.0.10 | NOK | http://autobuild.buildroot.net/results/67c14cfa3764bcb7f073bc511cec1729359bd930/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/ddf84f562d0b4fdc27f1b4383f4f02ab4696e7f7/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/1355ebf63c8759b7c60ce5d510a067f34ffdb1dc/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/fa977ced5ad5574df34a128992818fa19b6b1ce2/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/4fdc56f5dec6c8773086a4661eff1e4ce6ef660e/
     aarch64 | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/62b56fa6ae84614866de103c917e9d1a30259b53/
     aarch64 | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/12162c27ee375c2e5b7bf250b262210b3f916aa5/
         arm | open-plc-utils-1f6e7e372b31... | NOK | http://autobuild.buildroot.net/results/7fd5f30afe71b01b4877d48cc3fd9dc34f3ee178/
         arm |                polarssl-1.2.13 | NOK | http://autobuild.buildroot.net/results/546298d84a89ab5471fe14d1cf7189f2967e3637/
         arm |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/91c1ffa5f822d05a491c0e4a54ed883e4c85931b/
        mips |               procps-ng-3.3.10 | NOK | http://autobuild.buildroot.net/results/3b38e0f3163f0a45b487d30530ecef024555bfa8/
      mipsel | pulseview-19be0af16af83ca10... | NOK | http://autobuild.buildroot.net/results/5a087f2007658e38ee94b1b2fc192b70912373c3/
         arc |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/c63f4e958eca5a85e8b7a86a926763fb5597d53c/
         arm |                     qpdf-5.1.2 | NOK | http://autobuild.buildroot.net/results/6d7957c494542b6d27262d923a861b88efa66a6d/
         arm |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/674c64a8d69a2a62197a0899e6ae2fbcfe156b7b/
        i686 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/8ec1e5bfd87ef4cebe8446d5600c14735971637a/
        sh4a |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/477a57e024c7751c7270e1eb6eb009b3af255ac5/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/e1b53c9726a4217671221c4ffab7afe5ba9340f1/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/6605408159e2930ac15e67bd7c80a5b1d9c9d33f/
      x86_64 |                    systemd-219 | NOK | http://autobuild.buildroot.net/results/f510014600bc7d1e3cf81ff53268d186c8b417b8/
         arc |                      tmux-1.9a | NOK | http://autobuild.buildroot.net/results/47ece1c01fabebfb172be7c5098bf57564a5648d/
    mips64el |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/750ea3ad3653f49b431e951ee81f31628991a3ef/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/737a8ea64a6d6a05e8f292c92f3a35d12cc2f2d8/
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6531009b2eae64b4e79f66a625cf2a3f9ffc2ac6/
microblazeel |                 xapp_xfs-1.1.4 | NOK | http://autobuild.buildroot.net/results/988022e559af81d9b7dfc716dfb84bd0fa3698f2/


-- 
http://autobuild.buildroot.net
