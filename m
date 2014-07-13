From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Jul 2014 08:30:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-07-12
Message-ID: <20140713063011.F2DB51011AE@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-07-12
===============================

        success : 97 
       failures : 52 
       timeouts : 0  
          TOTAL : 149

Classification of failures by reason
====================================

                libgpgme-1.5.0 | 16
                    parted-3.1 | 7 
            host-python3-3.4.1 | 7 
        gst1-plugins-bad-1.2.4 | 2 
                 libpfm4-4.3.0 | 2 
                libmpeg2-0.5.1 | 2 
                     popt-1.16 | 2 
          google-breakpad-1320 | 2 
               host-parted-3.1 | 2 
            btrfs-progs-3.14.2 | 1 
          perl-net-ssleay-1.64 | 1 
                  python-2.7.8 | 1 
             util-linux-2.24.2 | 1 
             lttng-tools-2.4.1 | 1 
                    fltk-1.3.2 | 1 
          enlightenment-0.17.3 | 1 
                   czmq-v2.2.0 | 1 
rtmpdump-79459a2b43f41ac44a... | 1 
                gettext-0.19.1 | 1 

Detail of failures
===================

   powerpc |             btrfs-progs-3.14.2 | NOK | http://autobuild.buildroot.net/results/3b887022cf7af65ef95a5d0134550c0aaad1db6d/
     nios2 |                    czmq-v2.2.0 | NOK | http://autobuild.buildroot.net/results/8ab4b89fadb30d2e05d2e602c2a46f07f7bfec3a/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/6271a72358f1d9a1f4a51ca9f2fcf4d5670e1296/
    x86_64 |                     fltk-1.3.2 | NOK | http://autobuild.buildroot.net/results/60b738eb6d0833c318ab04dfee0d8f8db16225f0/
       arm |                 gettext-0.19.1 | NOK | http://autobuild.buildroot.net/results/28a9aaa928209a42eaf22553b4e20b344eeda9da/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/942928c71f6e328d89a92734361c76eab6ba294c/
  mips64el |           google-breakpad-1320 | NOK | http://autobuild.buildroot.net/results/35f0e061c9b923c90ff66ae1355b2de8a4f01b32/
  mips64el |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/f7eb188778b6be0af060337c65b22d0f5249ab04/
   powerpc |         gst1-plugins-bad-1.2.4 | NOK | http://autobuild.buildroot.net/results/6d477b7042d949c3ceea9a63bd26ffc187a67221/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/a7d9604cbf4b96ab364717ead44f9562f8ee901a/
       arm |                host-parted-3.1 | NOK | http://autobuild.buildroot.net/results/dd0a0d414e563a3de1b634c9fdc8c46671626662/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/52412c92812b90287a2dafdbc05385a346ce43e7/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/d805b6ee1e4f14d900ccca1c3b976fa01e614975/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/8d48c05374f33cbaed1947e8a351b99515655738/
       arm |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/b7675810aaac74d27cdf4ed21dc3081e9b716931/
  mips64el |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/ab0a49d4fb50b433b0cc5b119304bc08f1da574b/
   powerpc |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/4a4af3f057e6e966df20e4f653dced519445e785/
    x86_64 |             host-python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/73f7bada78dd0f70436cea3bec1f7fee10a875de/
       sh4 |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/a545ae725b39941d642dba23cd3b5ea352b72628/
   powerpc |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/9673447a3b3dda87f525d7e29bce15053438a7f8/
       arm |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/d8d9f5357884d39fb074b307f1ddeb9c00420c1f/
       arm |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/f4712254eb48e6645913acd99cf05e3de2ac0530/
       arm |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/9db146b1998fedd9fed92989b35289f5a924d7dc/
   powerpc |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/2989a48c392e7b79fff1d041c2ed4de5dadf6911/
       arm |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/eb1e06b1d99c441b6086c07ee04b084a61041dc7/
    x86_64 |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/c64eb4c65c999c884ba6ef7ed83663899e3a3bee/
   powerpc |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/a5e971f4f5232556ae09832b4c39fe83c239de49/
  mips64el |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/a528355eb57de329d1e160dd65df6f9a2f6aae48/
       arm |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/e1c355f15a3f51351ce8dac52cf512248dd430d7/
   powerpc |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/647c94875ff99ff921cba4efb1d41cd3d7d22053/
microblazeel |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/2ff619cc0fe9efeaaf65fc45ddd47fd5e61b4351/
  mips64el |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/8dd36e9232823e0a9a834456f44fb393ea071976/
   powerpc |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/f0ec04013228b6076cdb5fec0db3a54b3cd01bef/
    mipsel |                 libgpgme-1.5.0 | NOK | http://autobuild.buildroot.net/results/380182ce95df726fbfc39de60e03027404a9d93a/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c64133cf75e108206c777bc54f7c1efeb70a6982/
   powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/b0bd3fb362cb5404cc99789e6505db2917daa32f/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/70a5e3347f41918bb8ef867cec28052180e1bb5d/
       arc |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/345304d1b2fbe6b92d02a3738ab395039a594e37/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/c1f3c61a715f6123e63a0118539975f642f0f126/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/51b6438213df7bc3443db8a7f95b03a0a4224fc8/
  mips64el |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/58ea632ab32ad40487136e8057fb6abfae53715d/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/4aea3a481cb992fda3bfd0e69b1f57ba87c47463/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/c27d75c8057c1344cb1f03d56f716de5fd3d7447/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/88b8be36f4e192d0cf8c2057969ba11727d5c1a6/
       arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/da2012e5983fffb86173908468f5e2a88104e276/
   powerpc |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/4f7c4e5a04ac4fb9ecab018a9947d0f4b0a39272/
       arm |           perl-net-ssleay-1.64 | NOK | http://autobuild.buildroot.net/results/ba994104ef6d2b0ee2092844b459c8df119058de/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/291101941264fd173c0a5437796fe7b091f4ae25/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/3fa0fe962dbf93897fab1a65770d45b95a05e126/
       arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/fbc308805e9084b5409d304d266f6e088dbad7b4/
      bfin | rtmpdump-79459a2b43f41ac44a... | NOK | http://autobuild.buildroot.net/results/213deb461c007e9dc12e41b8485d5b75b5e585bd/
       arm |              util-linux-2.24.2 | NOK | http://autobuild.buildroot.net/results/445436627ecf76499b3826040a5e74ba5302c810/


-- 
http://autobuild.buildroot.net
