From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-11
Message-ID: <20140312073010.1991E1010A3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-11
===============================

        success : 57 
       failures : 34 
       timeouts : 0  
          TOTAL : 91 

Classification of failures by reason
====================================

                     wget-1.15 | 7 
               netsnmp-5.7.2.1 | 6 
              host-scons-2.3.0 | 4 
jack2-37976441044d69b91d61d... | 3 
                  zeromq-3.2.4 | 3 
                  python-2.7.6 | 2 
                  samba4-4.1.5 | 2 
               alsa-lib-1.0.26 | 1 
                 httping-2.3.4 | 1 
         host-python3-3.4.0rc1 | 1 
                elfutils-0.155 | 1 
                  dhcpcd-6.1.0 | 1 
                    crda-1.1.3 | 1 
                 qt5base-5.2.1 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/0b3731d2fcdd3cf8121563639f4906473d80fe9f/
      i686 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/f36f0045f68c3ed2a353c4e6d304334c9b1119ca/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/b965913f08cc6247f191f0919c4f530f6cfdb27b/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/267fcec6c83652715d5acdbf708501d197763196/
    mipsel |          host-python3-3.4.0rc1 | NOK | http://autobuild.buildroot.net/results/b0dd7661b6fe3124c3cce70a8f5b94f8f9787027/
      i686 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/f45a4380b0c6197ab502010258c456993a444d65/
    x86_64 |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/10f1a1f6c49ffb6495825323c76f99edd1dec883/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2ed1757c61c7b9c5de5c23d360d53593d95e4311/
  mips64el |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/2242edb4f96f00b777d4678b84ea5de8ac4ddff4/
     avr32 |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/58840df1254034bf77cde3935fd900d1da13de56/
      bfin | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/b83c883c18398df336d2dfc94d2dc839fbbfc638/
microblaze | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/d320b7e513b8aa45c9da0c27a1ae1b55978d4a91/
microblaze | jack2-37976441044d69b91d61d... | NOK | http://autobuild.buildroot.net/results/1c35275a215152cd62ea7f6f86ff1d59502b43e9/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/fcf39b709b75ceeed5bd81d72bb5f45af2ad107a/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/d3f67a5c71adc83c264a629ed754077e0288300a/
       arm |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/0444b2cc6c02356931b52c7fad861cf988542128/
   powerpc |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/771c7b23e1b1e82310e2429fd53a56a8715ac1f2/
       sh4 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/daa8929e482185bc09e27cc8d7958a39f1a1addf/
    x86_64 |                netsnmp-5.7.2.1 | NOK | http://autobuild.buildroot.net/results/f008beee8795f16ca6f94c0b7cceb2d1d970c3b6/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/9446a30f2c2d8c55d83e315d006fefae4f228d40/
     avr32 |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/2ec222a811d71332e1d27d0b7cf814f9180ff490/
    x86_64 |                  qt5base-5.2.1 | NOK | http://autobuild.buildroot.net/results/aebab6e8492eaa5ad390d600c3f6e3488d58f0a9/
    x86_64 |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/fe2c39fc10aef39ecce8d0066cc3a44b1e02bc33/
    x86_64 |                   samba4-4.1.5 | NOK | http://autobuild.buildroot.net/results/0ec1c86361ca8df0bb6957503b687dd0f7e87c92/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/6f16a8a83b0133ec180ad59f2e4a962e0e0acfc9/
microblaze |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/6ca5412031041fb715ad89ffbf313c47b9e1fef1/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/99fa86fc8bf6c5c3e6750fbadb300da034f02cb3/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/3159cdc68706f137dfe83f3e3979aeb8e0be121a/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c49fa80207af6286218fd68c3641d68e1c10310c/
       arm |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/c98c91f24cfcb80a4e64909e69595377d999660a/
      i686 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/15aaac2a74931cf51e29f6888d3493df7dad23f1/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/4f290935de477019772bb18499b6482da7617106/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1853ddc293928564b99efc146f37b1e3e7547175/
    x86_64 |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/6530b646e277297d949c6c217c27bc8e42031fb5/


-- 
http://autobuild.buildroot.net
