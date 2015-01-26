From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-01-25
Message-ID: <20150126073014.021AA1012CA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-01-25
===============================

        success : 261
       failures : 30 
       timeouts : 2  
          TOTAL : 293

Classification of failures by reason
====================================

              host-erlang-17.4 | 7 
                   mono-3.12.0 | 3 
                    mpd-0.19.8 | 2 
zmqpp-36413487f05b165dfc82a... | 2 
               dvdauthor-0.7.1 | 2 
             libselinux-2.1.13 | 2 
               lightning-2.0.5 | 2 
           libmemcached-1.0.18 | 1 
               qt5webkit-5.3.2 | 1 
        gst1-plugins-bad-1.4.5 | 1 
checking for stdlib.h... xl... | 1 
freerdp-440916eae2e07463912... | 1 
       opentyrian-2.1.20130907 | 1 
                libgtk3-3.14.5 | 1 
                libsrtp-v1.5.0 | 1 
                 python3-3.4.2 | 1 
                benejson-0.9.7 | 1 
                       unknown | 1 
                  thrift-0.9.2 | 1 

Detail of failures
===================

        bfin |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/27b0940769e3bfccef9a4b2282da4cfd407fc66c/
      mipsel | checking for stdlib.h... xl... | TIM | http://autobuild.buildroot.net/results/6d5572fa41b016665b86c421a1e03ac1f80f9e43/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/d68f5f53eb21761349a98c8959979548e00d7b9b/
        bfin |                dvdauthor-0.7.1 | NOK | http://autobuild.buildroot.net/results/e790fc219cfd0f7e40215e24d725bb5b0c4f5de3/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/e114f7eda0aee93fe24beaa667143d3d3ff6ec3c/
         arm |         gst1-plugins-bad-1.4.5 | NOK | http://autobuild.buildroot.net/results/b05cde8e274ab95cf664c1390c78e2dd3a0f9c76/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/8e72568d2b617159cfd044bbdf9f5eae33bdf679/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/dae702f41a9b7c725121f63b71496d20398f3588/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/830b8cd430b7125934123ddd071129ed10496a11/
        i686 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/35f0a5019244e203d0cb001fd60be034a99dfc75/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/d487ca3e3fb57f4b8f440e6fcafaa230a26fe5a5/
      x86_64 |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/564b0f338371bda0cd868a005504aed508d65027/
     powerpc |               host-erlang-17.4 | NOK | http://autobuild.buildroot.net/results/5864d2888fe379e858fed6c59733c3ef39682ea2/
     powerpc |                 libgtk3-3.14.5 | NOK | http://autobuild.buildroot.net/results/5091711554fee544a2bd49fea2f783ea28567982/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/7e055b24b127dd14697ebf7db607c2e728a7c3af/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2b274a31d534c929cf679370e70e7db9924629e5/
        bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4796d7c1297228e5c293c886004a562d2a726d37/
        bfin |                 libsrtp-v1.5.0 | NOK | http://autobuild.buildroot.net/results/c111fdbf19184cddb80a5845670aa13619117658/
         arm |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/b7db053b6765c1f83a38d840b318f87ffae0d5e7/
     powerpc |                lightning-2.0.5 | NOK | http://autobuild.buildroot.net/results/8bf6d126cc50289d470fff75124ad37a93aec916/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/633b75c6e2c87017f8b42d09fc642abf2c96a046/
     powerpc |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/0a5bfd577ad3d0c05c9d14f4cabea88657b79efc/
      mipsel |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/0232dec9bfa7528ee11d3c46efc8b557b4d459d9/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/7e4991053cf2281618d61a256f5da4d4b647987f/
         arm |                     mpd-0.19.8 | NOK | http://autobuild.buildroot.net/results/b7b29dc01c702460b317f6605dd431f412ee4d0e/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/b43eb06c2dab6326b50897c03dc7657fa42112ac/
         arm |                  python3-3.4.2 | NOK | http://autobuild.buildroot.net/results/e316095f86c7ccae48837e0570462dbffc5925d7/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/594f5b25445fc43129325447cb5be709202ea6b3/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/d6051399259c410c6e5aa120210d0d5657fa7c71/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/c38e31457daa74063008e0ee7058edf82a0e2f15/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/4f800b59ce3637decffb2796d4b465272ccdf0ab/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/91692d0684e9ae3977e2b447758f8b92995aa1ff/


-- 
http://autobuild.buildroot.net
