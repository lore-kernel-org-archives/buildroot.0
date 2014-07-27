From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-26
Message-ID: <20140727063010.DC87C1012A0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-26
===============================

        success : 95 
       failures : 12 
       timeouts : 2  
          TOTAL : 109

Classification of failures by reason
====================================

                  perl-gd-2.53 | 2 
                 python3-3.4.1 | 1 
make: *** wait: No child pr... | 1 
          sane-backends-1.0.22 | 1 
                  cppcms-1.0.4 | 1 
                  zeromq-4.0.4 | 1 
                 gnupg2-2.0.23 | 1 
rtmpdump-79459a2b43f41ac44a... | 1 
              fetchmail-6.3.26 | 1 
                  ltris-1.0.19 | 1 
                  libplist-1.6 | 1 
               polarssl-1.2.11 | 1 
               libcuefile-r475 | 1 

Detail of failures
===================

   powerpc |                   cppcms-1.0.4 | NOK | http://autobuild.buildroot.net/results/2a8f154ba8a30a4d5dc98f2f0dfa3e3b4b6c5892/
      i486 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/48ad6d3659cf1f04581b7e3d115bebf454ff17fd/
       arm |                  gnupg2-2.0.23 | NOK | http://autobuild.buildroot.net/results/d873a47a57d823258f188b88e0069104d7e011cb/
      bfin |                libcuefile-r475 | NOK | http://autobuild.buildroot.net/results/e7c1edcf3322b8124fb0651512ba53d1014d5277/
      bfin |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/db05e9148ddb40d6b2e6c7283c49e0360bc8dae9/
      bfin |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/5cf2262460a72ce51b479a42fca61cea5f6e23fd/
      mips | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e892f8a8b2064b5f6e5da3ab6ceb69127cb5913a/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/0333661b94c76ec1d1f3983f3ac61170fbdcf2a1/
       arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/3301939b4cfb765e2d04dbd558468459bb60f16b/
microblazeel |                polarssl-1.2.11 | NOK | http://autobuild.buildroot.net/results/8332b14329aa57dfaf243473e5b7156ef08afa71/
  mips64el |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/be598499ec38263443e3bb7e6df668066b4fb5f4/
      bfin | rtmpdump-79459a2b43f41ac44a... | NOK | http://autobuild.buildroot.net/results/04cc4f4878466715d980442bd7114fecbeb51c0b/
  mips64el |           sane-backends-1.0.22 | TIM | http://autobuild.buildroot.net/results/7e583fc981da04608a876ee6d960796ec00ccd65/
    xtensa |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/2b01f06f1c74b51d9750d76d72183761e88db3e5/


-- 
http://autobuild.buildroot.net
