From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Sep 2017 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-09-24
Message-ID: <20170925063059.86F6E209F6@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-09-24
================================

      successes : 104
       failures : 31 
       timeouts : 0  
          TOTAL : 135

Classification of failures by reason
====================================

                   libidn-1.33 | 13
               pulseaudio-11.1 | 5 
               asterisk-14.5.0 | 3 
                openjpeg-2.2.0 | 3 
               iproute2-4.13.0 | 2 
               librsync-v2.0.0 | 2 
                     ngircd-24 | 1 
                openntpd-6.2p2 | 1 
                   pcre2-10.30 | 1 


Detail of failures
===================

    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/151644d758ff134ada76e3d3af07fc06f78d13e2 | ORPH
      x86_64 |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/be2caed438f75e1a0fc8833716972f392025c081 | ORPH
    mips64el |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/ca3ae091a62cd3ee3021b6ce6bd60b47d5283121 | ORPH
         arm |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/24d6dbafba2be3dd35072ea77f9975f99a431178 | ORPH
        or1k |                iproute2-4.13.0 | NOK | http://autobuild.buildroot.net/results/0eeab1a0ca943f9a035a0d458ddf9cc210bc87f4 | ORPH
         arm |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/9353e6070dba5e01e8bcd2ecc4890e635be7e72d | ORPH
microblazeel |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/1627577a7df6574d8da475cfc2e5b7c2516025f4 | ORPH
       nios2 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/04b0ce9e48159c558495012d384f38217bd0ade7 | ORPH
         arm |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/29c1fc29db6e37c963e0617066b1479eaf36f1ff | ORPH
        or1k |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/274c14b176df5f687a5f361b65ff1f590d6b754e | ORPH
        i686 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/5d322a912dc7655a7f5af08990107647c0f0159b | ORPH
        i586 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/652de382fe7435d3d3b4f41c503cf3f868065802 | ORPH
       nios2 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/0718cdae3f5a800a88348bb898f50c6c7d398172 | ORPH
        m68k |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/d5a2e7adf50d65b21d85e8f98b693a50c8f3e93c | ORPH
    mips64el |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/8f27ded10fe49cd82d9f1d6b13e3365c6870cf2e | ORPH
       nios2 |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/83f410b049078ac874ba0ad47d0f090c89094a78 | ORPH
    mips64el |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/0d9e6e5c9c34062fae27333e48e01e7ce02be406 | ORPH
        m68k |                    libidn-1.33 | NOK | http://autobuild.buildroot.net/results/2364ca5f4d984db82393bd2c9b51465063e09d16 | ORPH
microblazeel |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/e6be3a72f90f49e4391f0cfe24fcf95ce718a9a3 | ORPH
         arm |                librsync-v2.0.0 | NOK | http://autobuild.buildroot.net/results/eedf9c25a759b0900231006ce5f8c20f421de23c | ORPH
         arm |                      ngircd-24 | NOK | http://autobuild.buildroot.net/results/461fa08ef11dc4ae8074a2d634138e4fcfaa8d16 | ORPH
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/e25e3476fa99c4bd97ee08b3e6644cd336599367 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/1b7ce02097fbdfd7279e01e13a827df0299afa8c |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/fb185c94651628c647f3b2e84cde768c3f3566b1 |     
      x86_64 |                 openntpd-6.2p2 | NOK | http://autobuild.buildroot.net/results/2304c4de26bd6217b79aa035be340a3c81497cbd | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/cc61f8bda3f7e4b21b048185e57d90ae73da8763 | ORPH
        i686 |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/b700547fd0f95aeeba0ddb6c3f03cf8cd317f8b0 | ORPH
      x86_64 |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/39c5ab705fbb697239a9e838842a8cf7914aeab3 | ORPH
      mipsel |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/e9dbd0e24a67bbf86cad8b9405768e1bdf5ca556 | ORPH
        mips |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/9fc61055f6d3bbf5a2f5a186207b903093733d45 | ORPH
    mips64el |                pulseaudio-11.1 | NOK | http://autobuild.buildroot.net/results/480f15e87affded9fc00fd1f3d7531d63a23beb4 | ORPH

-- 
http://autobuild.buildroot.net
