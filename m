From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Aug 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-31
Message-ID: <20130801063005.46D4152C6ED@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-31
===============================

        success : 67 
       failures : 41 
       timeouts : 1  
          TOTAL : 109

Classification of failures by reason
====================================

                libgpgme-1.4.2 | 7 
              strongswan-5.0.2 | 2 
media-ctl-ac40b79f002a2315f... | 2 
                 libffi-3.0.13 | 2 
                 qt5base-5.0.2 | 2 
                openssl-1.0.1e | 2 
                 dropwatch-1.4 | 2 
                  libedit-2.11 | 1 
                libtirpc-0.2.2 | 1 
                 cdrkit-1.1.11 | 1 
                libiscsi-1.6.0 | 1 
                  zeromq-3.2.3 | 1 
/home/test/test/1/output/ho... | 1 
               libglib2-2.36.3 | 1 
               libgtk2-2.24.18 | 1 
               audiofile-0.3.6 | 1 
                  ltrace-0.7.2 | 1 
                    acl-2.2.52 | 1 
               w_scan-20130331 | 1 
          libedit-20130712-3.1 | 1 
                pulseaudio-4.0 | 1 
                      gpsd-3.9 | 1 
                   dbus-1.4.26 | 1 
                    zlib-1.2.8 | 1 
                    fbgrab-1.1 | 1 
               alsa-lib-1.0.26 | 1 
                 libvpx-v1.2.0 | 1 
                  aespipe-2.4c | 1 
            qt5jsbackend-5.0.2 | 1 
                 cairo-1.12.10 | 1 

Detail of failures
===================

       arm | /home/test/test/1/output/ho... | TIM | http://autobuild.buildroot.net/results/66def7b49b922afc245a4ce9bc7fe8db019e6983/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/40a4236c41629c7e3ef780b17310197c33771250/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/41d973f9537234c3575ff29c3b41dbc20bd82d14/
       arm |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/adfb30519564ab153a7cb03f39d33d5ad35aa195/
       arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/19a0ca7297a96364d41bd9b6aadd868582b8b937/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/322e82151329ae47b8b0d204941af9671e9a692d/
    xtensa |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a79f1162563a7c2f2a1ff8dc83a06c6384758d1e/
       arm |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/5a8d3e7b81ad1376badbddddb26f0266ccd396d2/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/54917e7943143e47263b60b4eee3dfc6f0801407/
       arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/65400137c2324a16b3f335ecc86e8dd5d48207d3/
      bfin |                     fbgrab-1.1 | NOK | http://autobuild.buildroot.net/results/8f29c88893fdbe3057af7dc8db1bcf9014117ef0/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/03984c8cd8e1a7e545416e67a8ea837fcd727b11/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/442b661a827dec26b9e23e38354791b13864a7c0/
   powerpc |           libedit-20130712-3.1 | NOK | http://autobuild.buildroot.net/results/ed85b9d688ad8389895e3ecd7a6a18151efc328d/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/adf23b336df074e162853c73fa91cc46fa3e9518/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/8f882f78cbdf702f836643bbde72c085bd3f4ba0/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/43550b5d06da1ee61303493aa88f055b3072818e/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/da7c77f9dc9550f2e0e74fbc6142c43016b1219b/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/2c573420c0f195479c7d63ff3abc12db0cca4f47/
       arm |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/5bd1cb0f2a1e3b6b3116d42ebf0e7fa8423c50ec/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/164622e738648c556287bc11e62cb6eb16dd7070/
      i686 |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/dc3e560d6a55b71f7f58211edc5bf69febbc091b/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/b18ea0a4203cf3252905d7ebcc61427c95b6d9d9/
   powerpc |                 libgpgme-1.4.2 | NOK | http://autobuild.buildroot.net/results/33c5776d2b3f7fa276a27f7602eb71c4d77c7b62/
    x86_64 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/823e0f249e64b271b6970951dce82feb53950f51/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/583e9b0199e86d70b442d881f08528c079bd648a/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/349dd8b7b3eb5498ec9f120b1f7a9a996cf2686d/
       arm |                  libvpx-v1.2.0 | NOK | http://autobuild.buildroot.net/results/cb827147177edeae5ea4fca508b0415eedbc7a28/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/9447924fd57a97f550df957bfce0853c7e43ad5d/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/86d60f33fcdc3ddf43d6f6f4a7d789afbf4fe720/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8b701d476dfe30b99126d1c580d6ffc13b526827/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/88d381dfe9bcae32011e824cd1aa7cf355484564/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/d4f3eef96c987f48c7a4b83cd9383ba43627bb5c/
      bfin |                 pulseaudio-4.0 | NOK | http://autobuild.buildroot.net/results/2691ffb585e3c356a6e50a4a5eb0650ca2f7a4e6/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/a82806bcd156842bb57e68c3928e2332105d6c3e/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/984b8744a9fe75b146664fbcf5c44364b0d9d93d/
       arm |             qt5jsbackend-5.0.2 | NOK | http://autobuild.buildroot.net/results/853cd29bf427902b2cb82a101964a4e45714cb86/
      i686 |               strongswan-5.0.2 | NOK | http://autobuild.buildroot.net/results/7d139df178d323a45e1a20372e8f4a35245f584d/
      i686 |               strongswan-5.0.2 | NOK | http://autobuild.buildroot.net/results/007e75362cbe4693e36d5a7ab96c539d1f3b00fc/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/ff01d2e71894be4587938d188c56553b737359d0/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/ae4b94b1a619a1ac23e26a365b9690c1ce6cf6a8/
       arm |                     zlib-1.2.8 | NOK | http://autobuild.buildroot.net/results/91f51031f1e7ce760cdcd8b37a684ea08e90b314/


-- 
http://autobuild.buildroot.net
