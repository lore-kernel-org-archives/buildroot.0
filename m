From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Dec 2014 08:30:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-03
Message-ID: <20141204073013.8946C10100B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-03
===============================

        success : 217
       failures : 31 
       timeouts : 4  
          TOTAL : 252

Classification of failures by reason
====================================

zmqpp-36413487f05b165dfc82a... | 3 
                    flac-1.3.1 | 3 
                  guile-2.0.11 | 3 
             python-webpy-0.37 | 2 
                      qt-4.8.6 | 2 
               alsa-lib-1.0.28 | 2 
                  perl-gd-2.53 | 2 
                     rpm-5.2.0 | 2 
           libmemcached-1.0.18 | 2 
                    php-5.5.19 | 1 
checking size of long int..... | 1 
freerdp-440916eae2e07463912... | 1 
ltrace-0896ce554f80afdcba81... | 1 
                 qt5base-5.3.2 | 1 
                 gnupg2-2.0.26 | 1 
                 cdrkit-1.1.11 | 1 
                poppler-0.24.4 | 1 
                   czmq-v3.0.0 | 1 
                    ruby-2.1.5 | 1 
                 libnss-3.17.2 | 1 
                    fltk-1.3.2 | 1 
              lbreakout2-2.6.4 | 1 
               qt5webkit-5.3.2 | 1 

Detail of failures
===================

     powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/e4a2dbc3ba8f83eb23aec4bd804f7f38a5a95401/
      x86_64 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/c685032dc9299164e1ba849da906ba2d1369bc94/
        i686 |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/827fa0b2c7d037b7e6120684fbca8a3a4705032e/
         arm | checking size of long int..... | TIM | http://autobuild.buildroot.net/results/a6f3206dc6cdfbed488a1af177a80c04c8f8c2d4/
         arm |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/9cee91f9ce6774d6ff646c3f5e48826534779a5c/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/32f08d1cf914e0f01abc298be3baeca7d16856ea/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/918cd61489a630b3843d9d6e0796527396f18101/
     powerpc |                     flac-1.3.1 | NOK | http://autobuild.buildroot.net/results/e94f0a9591abaea9f9d3494710ab1e4a0f9125c1/
      x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/7c78601015ce24be7175ab2613346574218ebaf8/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/20307aa079e1260ad33b2cbb8abb2c6b491ac0b3/
         arm |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/6d6713314a18f98ca58a39143894b29889f38fdb/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/72652041b2b1f151a12107954824691ba60daf84/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/da26c312b5e20a5a6489d402fbb56c78ada39967/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a45d4eb8bdcab57940cc6e9dd53d447642eb08fc/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/8d569c0a1f2e72d58a7664c7c79256fb3d149ac5/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/140c8fb5b19e1db2f8b7a3a2f2ea0e0b304bb22c/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/aefccb32a100ea12a025cde123648f3831385b1d/
         arm |                  libnss-3.17.2 | NOK | http://autobuild.buildroot.net/results/b139749cff44aa02ee63f0d690cf62abf7e3cb56/
        i686 | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/f31583b7cc78dfef096853285825a9cd259b0287/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7638fb073612a5b139ebfe9ca63f7a9e7aa3948e/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/ec81007a0f807e966e147f21b0fb149d18b3d879/
        bfin |                     php-5.5.19 | NOK | http://autobuild.buildroot.net/results/23e991d51250d5326425daf9678d97076a1fbbbf/
    mips64el |                 poppler-0.24.4 | TIM | http://autobuild.buildroot.net/results/f208d685b0455814c8fbd51b8d3e0310f91bc15d/
        i686 |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/17b293a775c212e0398d5991ca7eb899fd30c9fd/
    mips64el |              python-webpy-0.37 | NOK | http://autobuild.buildroot.net/results/cd54da4f4e74c90b4fc5b3a6282e1365745b794a/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/0b41df9ee5eb85602eb8f953423918c2839ea5fc/
    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/a5deb601a8844eaf7102392c02d95eb324bcaecc/
      mipsel |                  qt5base-5.3.2 | TIM | http://autobuild.buildroot.net/results/0dd65af2b14814e2b4398b774683d2dae2ae7c36/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/59afbda61f6851a8e9e02bfaf9eed1653ba451a8/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/a40c83f6956364e00cfaad8e9eee47800584d199/
      mipsel |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/ebdec2240c80253b30845690b89bc1d61c04a0b7/
      mipsel |                     ruby-2.1.5 | TIM | http://autobuild.buildroot.net/results/b8e2012cbd963e415b19d57e781fe11a728576a6/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e2dd7ac398485ca34c1cba52f73b67682c025d1b/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e36aa544baffa11f346b5db535edc66c67cbe3be/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/60f5d5e5ce4d5f75d06c62f01b920a5754d8385b/


-- 
http://autobuild.buildroot.net
