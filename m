From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 08:30:09 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-17
Message-ID: <20140418063009.C3584100F28@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-17
===============================

        success : 55 
       failures : 36 
       timeouts : 1  
          TOTAL : 92 

Classification of failures by reason
====================================

              jquery-ui-1.10.4 | 9 
                  zeromq-4.0.1 | 6 
           host-nodejs-0.10.12 | 4 
make: *** [core-dependencie... | 2 
             util-linux-2.24.1 | 1 
                xapp_xwd-1.0.6 | 1 
libstrophe-d408eaf2bbfe5ff5... | 1 
               audiofile-0.3.6 | 1 
                 cairo-1.12.10 | 1 
                 mesa3d-10.0.4 | 1 
             lttng-tools-2.4.0 | 1 
                      checking | 1 
         matchbox-keyboard-0.1 | 1 
            lttng-libust-2.4.0 | 1 
                  samba4-4.1.6 | 1 
                 mplayer-1.1.1 | 1 
                 dmalloc-5.4.3 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                directfb-1.6.3 | 1 
                    gpm-1.20.7 | 1 

Detail of failures
===================

      bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e8ec4605948e573aec53f50e24ce0e7f3120ccb2/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/337e90c6e596c897ad6cefed7a2fbcbfc00105dd/
      i686 |                       checking | TIM | http://autobuild.buildroot.net/results/e0af9ed77d3fe14d9993f8555eb99b65c8c71988/
      bfin |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/a0f7381f1c5e8b34f8309d32eb56474d6a2bec5d/
microblazeel |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/d9727e453d7c7c982ce32db5efd455496966e211/
microblazeel |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/d76d14246063e5f3e674c93d634df416305d6f22/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/4ce758e1b1885f65523f16500911f42f997b1722/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/5c84f1c6d7aa62176626f99b2011d79cd07cbc8b/
      i686 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/edd5deac60a1908e770f6f3c74855f32e677a752/
       arm |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/c80f442339995c20dfd39ffd6a55425ed00f6125/
   aarch64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/294dc32c5eaa5d3015838587c68ae0e1901cd797/
       arm |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/08e9149677edbf8e5a8d6f9e2686d06116b38294/
  mips64el |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/e7f36705099452bc5d8a7eb0f4f6d02613f7595a/
    x86_64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/346706c10a13178920b38c3275cdb41f850b7d79/
       sh4 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/0c893f34bfb0ebec20892f0211e92b5c8e13725d/
    x86_64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/4a4414b5dea4b4c4301d6a4a6f25753ce6583415/
   aarch64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/bcf6141053af8d116e88549389508804658a8229/
      i686 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/01bb622d9599df39ce99af9dbf333068cfa06f52/
    mipsel |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/c023a0ef9caeebb075db42b0394a8da3f451c13a/
       arm | libstrophe-d408eaf2bbfe5ff5... | NOK | http://autobuild.buildroot.net/results/60d04488a65fbfc3bc44528c9e8ecef78582d8a9/
      i686 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/f6c065189da2c63bc3c899bd868d274a0bb3a726/
    x86_64 |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/4b295c0d713ac44bde5025f3535eb2d7b7ed13e9/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/1b25aa0d09caa1e2d583e102ce8c1cca3a1eb65b/
       arm | make: *** [core-dependencie... | NOK | http://autobuild.buildroot.net/results/ddcffe4b4e483e4b1bc09ae5e412f2733d103e95/
       arm |          matchbox-keyboard-0.1 | NOK | http://autobuild.buildroot.net/results/d9aa2b6ddce920ea45fbd7093addfc0ee6b94467/
    xtensa |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/081662a14e73098d50d473a331f7469c0e248997/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/b7372c3e0b4ca57353ddcf7cc9c92ed1834e8aa0/
    x86_64 |                   samba4-4.1.6 | NOK | http://autobuild.buildroot.net/results/335ba0188c4de9f7a23131f17a8549250dfe98f9/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/85d0c27986254989df2e6352db3f15031b027948/
       arm |                 xapp_xwd-1.0.6 | NOK | http://autobuild.buildroot.net/results/12b7894a4f67d963ea93622eea1adc2d2c3d6847/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/ca7f8cd2fb56cbad8335eacaacaedebd82184b1a/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/af783975d88cfd3cafa75ac03fb0a3ec114068ae/
      i686 |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/34a548a2d675c805086742ec30e51393deae5318/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/3d9638c1e901e1ef77a41f70564a808e17f0ae45/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/fe34c664bfef94b5b791a3731b27b0b6e420a685/
      bfin |                   zeromq-4.0.1 | NOK | http://autobuild.buildroot.net/results/3bda860a269dd9a4e38533cc9350892c68102618/
   powerpc | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/a374e85c714aff26bceaa0df4199bc44a1278f37/


-- 
http://autobuild.buildroot.net
