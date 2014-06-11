From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 08:30:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-06-10
Message-ID: <20140611063007.B20E7101726@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-06-10
===============================

        success : 84 
       failures : 33 
       timeouts : 0  
          TOTAL : 117

Classification of failures by reason
====================================

                 mesa3d-10.2.1 | 10
              cosmo-14.03.04-1 | 4 
                   perl-5.18.2 | 2 
                    sdl-1.2.15 | 2 
                    fltk-1.3.2 | 2 
znc-b396cafdb249544164ed029... | 2 
               alsa-lib-1.0.26 | 2 
                pulseaudio-5.0 | 1 
                  zeromq-4.0.4 | 1 
             xlib_libX11-1.6.2 | 1 
                 libpfm4-4.3.0 | 1 
             e2fsprogs-1.42.10 | 1 
                 omniorb-4.1.6 | 1 
                 httping-2.3.4 | 1 
faifa-aa0b5f90b89a9fd153313... | 1 
                pinentry-0.8.3 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/b2e567d75d8f49620f5d6528671c386d09ad319e/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ac6b8e95cbcb79316aa969d09a27c72628d180c5/
       arm |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/12feeb4578dc62778b27d9a1a2253b0fe7fc8a91/
   powerpc |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/db2dbc335a4547c15097fce4796fcb32cea63264/
       arm |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/1399a67635719a91f02d8ecbbcfabaa9cedbbe47/
     avr32 |               cosmo-14.03.04-1 | NOK | http://autobuild.buildroot.net/results/30b9cbcacc03059112fdd6c456253a47eddd7792/
    x86_64 |              e2fsprogs-1.42.10 | NOK | http://autobuild.buildroot.net/results/0159246b52659508a4bbba4126ab27b28a2b2e2c/
     avr32 | faifa-aa0b5f90b89a9fd153313... | NOK | http://autobuild.buildroot.net/results/c9db413f6534006bff5f5b1bf65f59b268cb2c4f/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/f86c4066af27a6b759ae0f6b38eeff22f7de3f4c/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/c9e3e59a96c911216d3ebf27c35919a8aa00cf04/
      bfin |                  httping-2.3.4 | NOK | http://autobuild.buildroot.net/results/12d86a8b4da206181f403b1932f107f5dc667c9b/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/f4fee3d8a739054b78d223adc890ef0686bec618/
       arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/c78af0901c546768d6a35252c8cd62d0365bb016/
       arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/f9af75c43efd10a47249adf7c85d677d297f8561/
       arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/2555da8c6d5cda1b12fed4758c2461dc9ab6ba5c/
       sh4 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/18acc7c80e5c6ab9f473f22da844313eb41e2d56/
      i686 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/5893724af3e2fc40e06503e4667199214517614a/
       arm |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/560813b1de4aa435d06ee2106509bae42ab56a31/
      i686 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/0bbac51fb91712c0618f3d21f8f36c93370d5b06/
    x86_64 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/255bc7b40cdff7c5fb4e48d3fd8728fff098490d/
   powerpc |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/28916360f199cd9ba39569e0f3b516e3dd694591/
      i686 |                  mesa3d-10.2.1 | NOK | http://autobuild.buildroot.net/results/06b37e3e46a9035b3b5dfe71b5d339738267627a/
      bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/de5cdae456d83b0a1ac86cfcddf0c973c2304009/
       arm |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/dc16acd4f980c7e8f929271fb8b10af073fa20d0/
       arm |                    perl-5.18.2 | NOK | http://autobuild.buildroot.net/results/d572d4fb702339e3efe72e5bcf45833db3342ea2/
   powerpc |                 pinentry-0.8.3 | NOK | http://autobuild.buildroot.net/results/691d27c63a6aec982be9044b5b5565a3308c9e12/
       arc |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/10f791ef003d78a7a5594b4d9eceaadb0331216c/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/29505ee0b3563e2ae0b2163441b07725facd5271/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/fac5d9fc4ddf5640ff64e820321d1d035a62625f/
   powerpc |              xlib_libX11-1.6.2 | NOK | http://autobuild.buildroot.net/results/f361ad015f7ba9216987895c16bc5116881c9d30/
       arm |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/92c991de52d97844b50cbb9c8a73d41a94d064fa/
       arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/ec54a502914c944a5959a7d002e6b89f55583278/
       arm | znc-b396cafdb249544164ed029... | NOK | http://autobuild.buildroot.net/results/a65b408826d1487409d0c861ac44f5313dcbf057/


-- 
http://autobuild.buildroot.net
