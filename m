From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  9 Oct 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-10-08
Message-ID: <20131009063005.9593C52C1A0@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-10-08
===============================

        success : 59 
       failures : 91 
       timeouts : 0  
          TOTAL : 150

Classification of failures by reason
====================================

           mediastreamer-2.8.2 | 20
               minidlna-1.0.26 | 12
               lighttpd-1.4.33 | 8 
    trace-cmd-trace-cmd-v2.2.1 | 7 
              cryptsetup-1.6.2 | 3 
               libglib2-2.36.3 | 3 
                      icu-51.2 | 2 
           mediastreamer-2.9.0 | 2 
               audiofile-0.3.6 | 2 
                    php-5.3.27 | 2 
               alsa-lib-1.0.26 | 2 
                 cairo-1.12.10 | 2 
               ruby-1.9.3-p448 | 1 
        host-util-linux-2.23.2 | 1 
                beecrypt-4.2.1 | 1 
                 binutils-2.22 | 1 
                libiscsi-1.6.0 | 1 
                  ne10-88c18f0 | 1 
        liblog4c-localtime-1.0 | 1 
                 qt5base-5.0.2 | 1 
               boa-0.94.14rc21 | 1 
             uclibc-0.9.33-arc | 1 
                 libevas-1.7.7 | 1 
                 ffmpeg-0.8.15 | 1 
                 binutils-2.21 | 1 
                  connman-1.12 | 1 
                  nettle-2.7.1 | 1 
                  bcusdk-0.0.5 | 1 
                 libnspr-4.9.6 | 1 
                      qt-4.8.5 | 1 
           imagemagick-6.8.6-2 | 1 
                valgrind-3.8.1 | 1 
       gst1-plugins-base-1.2.0 | 1 
                  dhcpcd-5.6.7 | 1 
                  weston-1.1.0 | 1 
make: *** [harfbuzz-legal-i... | 1 
                  tstools-1_11 | 1 
                  zeromq-3.2.4 | 1 

Detail of failures
===================

    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/6c07a0bd86d75cf1b064fcf10562f3d111711614/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/952287932cbab641f7ab65409d92de55d22e46e7/
   powerpc |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/8c38fc6b5bdf4934e3b7942470b265283245dfa1/
      mips |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/d0f6c6d778eb46fddbb399d82a22499b5cdaab82/
    xtensa |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/dce05a11afa7c33fe18e4e953bd34c2b6da8ce2d/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/7f083359538fe1079c9aadbd332d16a33332cb00/
    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/d10a16b7aac6267d027334838dbcb8d5e2f29a11/
    xtensa |                  binutils-2.22 | NOK | http://autobuild.buildroot.net/results/b46524626cab681167253d68c45f0eed091a347c/
       arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/403a77cfae0c269539c2cebb606cbad29a8dc70c/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/26cd07251f03db332680081b69dc0332bec696cc/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/40b78b8aa8e97e94b7dd2b9bbddcb969f9753836/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/1de29e17482c7b2837de9abcab7c735119017597/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/064f379dcf75b1df62fcfad9e56c25b6508bafb6/
       arc |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/162ada2bfdb22fee29110582b64bbdec085d2a62/
       arm |               cryptsetup-1.6.2 | NOK | http://autobuild.buildroot.net/results/55a991bfd3e47c02b8730aca29ab9bf145e7978e/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/582ca7125e848c285f6999aa8e51e1fc989a6b71/
       arm |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/2d8ba59092328d1e90a4df48443291b0b97ec848/
   aarch64 |        gst1-plugins-base-1.2.0 | NOK | http://autobuild.buildroot.net/results/e2e3f6672da50cc1e116238156ed53c9a78dab67/
   powerpc |         host-util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/55cc665e88c4980f088abcfcb2a3c034e78d4286/
       arc |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/385ed3369a63ec0f6511c28ce51033e39e5c480a/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/931f97c088b94c1956d3582400f3d950f0a9b43a/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/bdbabc83635ce2320d927b224dbf17673e1ca0c0/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/e8dc65e6114234e41c041c3783927226e63a65a7/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e12b162ec1c843bb26fc9dba783a7dceb0fd3654/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/23e7fabd032d39523e5da43aa9bdde24dc39c348/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/0210da12c79aa586724140a6d329fd2b0525f32b/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/96efff6cd144f9bea57bc0d8b0d6ff165cc42e24/
       arm |         liblog4c-localtime-1.0 | NOK | http://autobuild.buildroot.net/results/27695cc1e551b4837666b7b5b60200412a7e9f64/
       arm |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/86bcb4dc5c766ef3be2a05238473661647abba3b/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/c8d163136ffc4ad820ab61b4b54bb5e64f2f3580/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/b4b72580dab83217e582bdf23394d09e293ee278/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/de04a676d636bdb5722829aa2747eeca2c76bde4/
       arm |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/496ae7d9175bf51ba755db3bb6d8e7d0eebb539e/
    x86_64 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/f45af94d908351bf98a00657ae33fcebc5629d93/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/016ef81391a7a8bd45f302dbb0c6a1542c4f7930/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/dc600338180f2a2336620fcb2364cdbbadea3b6d/
      i686 |                lighttpd-1.4.33 | NOK | http://autobuild.buildroot.net/results/507614eb0215c259dd29f2a05fdfe497ca2855a8/
    x86_64 | make: *** [harfbuzz-legal-i... | NOK | http://autobuild.buildroot.net/results/40509638a554355b9f50e5540e69dc34ea041b92/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/7de14765a6b74ce066d7d84868c7f36ae1d2162e/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/12f36e5ced5596a1cef9c1b22904ca9ee7e904cd/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/181a241a16c6a791e1ce40c5c6a47c2e9f2aed3f/
      mips |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/edec8850ad85b5a418b1a13a8a785d73f692dd2a/
  mips64el |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/a956d8971ee70bde846349a299b2f12cae2317cb/
      mips |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/7843038e1862f99e0a5bfaf5b9a59dd99b1304cd/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/9e43141dfd138e9503c374b118dd4fff3bd4d963/
    mipsel |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/05ee1c4072d800fd994d404963809fae86b537ef/
   aarch64 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/53011a45c382b9178d862c183fc786a21f832fc8/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/87ac39157f334b863b956d6d8809718507678123/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/0d50cc89c37f579c67f6507c5f95bc9b844d563e/
      i686 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/ec5016b93c409e478b2a86a26e9e73c707fc4264/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/e08dd32f1ebe3c2d57377267ffc4f1a062cd174a/
      sh4a |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/9c2f74d08d035947e57bf1c1c281c169f98c8dc1/
      mips |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/0c2380d073a283c8809c8073a5ae3fb9e97bc0cc/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/88593e278c62d74574ae0c2b34df3edbb4e31960/
      i686 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/2d25cd327d740415651bed767fdbe81a5cd19f10/
    x86_64 |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/5b1a7239ca771203054e85b97b5eacca2fb561c2/
   powerpc |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/bb02b648d6ea4f7f8c86594e756a99b2f3c9cdf7/
       arm |            mediastreamer-2.8.2 | NOK | http://autobuild.buildroot.net/results/0448e5bc6ff830a3dab71eeddef4b7c9e3436ca4/
       arm |            mediastreamer-2.9.0 | NOK | http://autobuild.buildroot.net/results/65328a242919aa9a2540e4e9d6fd6354e5d2bac2/
    x86_64 |            mediastreamer-2.9.0 | NOK | http://autobuild.buildroot.net/results/47d0b5fcaafd2b8dbd3f5b0ea9e08eacb43abd1f/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/ec8b674825a56d61748252bda287fbe9baafad67/
      i686 |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/862490f1f6232104c619e588ede77761039380fd/
    x86_64 |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/20a1b3a9f040d2207b6c533a158e9747054ddd2d/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/c007663fa9152042f33f01e5dda4f038231b0687/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/92c415a73383ca84e931391a40ddd93a076075e3/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/7b10a273890c84fe9b72564409da89be92db2396/
      sh4a |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/f5c80bbfffa6f6be6f6d916d513f488a09d730f4/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/7c247870e206421f1bb130add0b7a02424effc5b/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/cfb718a9aabd745cb2f7a1dd73acdf7ba6e807ca/
       arm |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/c9fb917a933f4fef93cea63a418dee58a54d4d73/
    x86_64 |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/596f5c27ad638ae8589299a03c1a243f3edb53c6/
   powerpc |                minidlna-1.0.26 | NOK | http://autobuild.buildroot.net/results/1ab9b773f4be4205ff2be7e9bb2c7ab8d8a4b8d3/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/3fab37cda510e637ea3273e63d0fe9fc719cc347/
       arc |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/9ddee44c11e1b82bc0c29ab198a5d4b20cc397d4/
  mips64el |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/086ebc2386833190e88a190197ffe9ec3dc586fc/
   powerpc |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/70e7548870d47ac1f98ac28d9afd9c2032390b15/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/de85670846391e3037ade26d5d6c39679d52bd0a/
     avr32 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/101cf66e12bcd2706c71d7510519e76d9799ea55/
       sh4 |                ruby-1.9.3-p448 | NOK | http://autobuild.buildroot.net/results/9fb5fbfab1aff6cfd7725f85706203d1d3bab1c4/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/b888dc42823c912919ecd9c12d836c39277abc4c/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/1aa7e441059680e9c2b03f153ef44cdfd13d4ea6/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a90f45953226817859a92c7d7a87fb4c9610dfa4/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/5538b2ecc319e8d7694fa823ddc297aef8f9a935/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/9f9182eec052a1b84530f199887e8cd31420e2a7/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/782bb5a92b90a70ac39db589811c4bf1abfaad36/
   powerpc |     trace-cmd-trace-cmd-v2.2.1 | NOK | http://autobuild.buildroot.net/results/a2a73193a65eaeffe88fdccae4ab56a962b07fa5/
    x86_64 |                   tstools-1_11 | NOK | http://autobuild.buildroot.net/results/d0ff0640283de629938ed3dfc0ad0ade10225d13/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/09ffea1a0c83bae51df71180f948495de8e5db61/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/da195584e68fbb656455ae003222e93c81d036a6/
   powerpc |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/873b9dad623dc2e4494d7f4db5eddd7ffbd99c8d/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/5a722d99d8a62ff964f528080073083d7f69d42e/


-- 
http://autobuild.buildroot.net
