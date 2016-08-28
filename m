From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-27
Message-ID: <20160828063029.EC594101EC0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-27
================================

      successes : 205
       failures : 43 
       timeouts : 0  
          TOTAL : 248

Classification of failures by reason
====================================

                 libraw-0.17.1 | 5 
                    lftp-4.7.3 | 4 
               binutils-2.25.1 | 3 
                 mono-4.4.2.11 | 2 
                coreutils-8.25 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
               domoticz-3.4834 | 1 
                  fio-fio-2.13 | 1 
                   glog-v0.3.4 | 1 
              libarchive-3.2.1 | 1 
           libvncserver-0.9.10 | 1 
                libxslt-1.1.29 | 1 
                 lvm2-2.02.162 | 1 
                 mesa3d-12.0.1 | 1 
                 mplayer-1.3.0 | 1 
                   ntp-4.2.8p8 | 1 
                    ola-0.10.0 | 1 
                  openjpeg-2.1 | 1 
               openswan-2.6.46 | 1 
                oprofile-1.1.0 | 1 
                     php-7.0.9 | 1 
                  prboom-2.5.0 | 1 
                    qemu-2.6.0 | 1 
               qt5base-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                    quota-4.01 | 1 
             rabbitmq-c-v0.8.0 | 1 
sconeserver-d659468cd164e6a... | 1 
                  squid-3.5.20 | 1 
                  stunnel-5.35 | 1 
                     tftpd-5.2 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/5f77ffdd48877b1b599e0c595a10c30c80cce391
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/5ba4b2bb45bc181acf81c6be5724df8bad69e841
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/bff0cab7979ee3cd7c7a05bf3b0649ef27f2abc2
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/c018d770904da15bc46353d3db42b77306cc4d80
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/2c7449ce844ee9bbedbc6416b4840dc85dab1704
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/f0681025491a4e65249df87c8e804faebe0cf0e7
         arc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/0ed9fa9585ec91db3556d6f5b4ca8d99a5eb2144
         arm |                   fio-fio-2.13 | NOK | http://autobuild.buildroot.net/results/38948a1834913af0e9a2aa50c143fd3605bb6db4
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/6db1418d024a679398eb9dbb581bb2a8d4fc021f
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/60aec95f8512f869b0d92590b47bd4640e2f59a5
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/7a72bfb17baa5e9a561c2e449a6d900d52047678
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/43dcc8df7918d0c9b3a9011650a1e1263a84941d
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/cec4710a243eac40e042d02b5007294e13d016c5
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/95fb8ac50185159b3f1e60d1290964dd3fdc26dd
        m68k |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/b0c0e2d775225374ba4c4c31bcd2320ab4a995e5
microblazeel |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e70e6a7092733daab2fe23e0e941b302703805b8
microblazeel |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/2a2f00e0672462c8d1339f41240569b8480d9b9f
         arm |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/76cd99807cd4d96ce3936085553f099f6c943d2e
    mips64el |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/10c04b05f31ccc43a0dc49f514414c948f839cb4
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/3a6b0aa052b4792076337a99e15add1543a91e4d
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/dd7b0bf07ae4201c3c9f95989bfe961a5484b05c
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/22cd51fc271632a0151534f82e265da7e0569819
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/d44b7e6b1be5e6a9c4dda074d9ac3ce63f6476ad
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/0647edae1780095ac9c98445a32fa197c01a7bfa
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/f1cc8d845f153138d6062bea479f692d7c4f60d1
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e4da8245729cd8e4f4d4add46ab5aefe59e00d36
        m68k |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/bb039f918c7a8a9104d477ef9729f1a4d16c38b6
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/007092ff0b534960186f5b1405eab1f4e5c3ee23
        m68k |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b43909c352c8c6d592f18d05d83282a4a4ed998f
        i586 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/08ae2b57f119134874bbd18d7410d5c118127e5d
         arc |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/dc71aa5a7c49bdb346774e1dfc15bea56c4849f8
         arm |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/d1ebd71b59b07111b4c5e3e499c710633da54dc7
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/8d558181dc8c8cac11fd557345e4fa63add6cac2
         arm |                     qemu-2.6.0 | NOK | http://autobuild.buildroot.net/results/a819a9c88ea8d80846b73bf5b3bfb9c4a8fa2e0e
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/77cd4e5fb088c350221d799b64267894c6e2e310
         arm | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/ffaf960f27e485b18fc6d4bd679abd5b634415cc
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/cde9935f6c18944b7e9d790738518abbee5ea823
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/87d268eace27be448e9cd1ba959489d3e7eec32e
         arm | sconeserver-d659468cd164e6a... | NOK | http://autobuild.buildroot.net/results/e929799366e6f574c7b08d8635b18623afd3e3e1
      x86_64 |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/61eeddcb124c15028d4791fb0c6c1f88fb6a731b
        i586 |                   stunnel-5.35 | NOK | http://autobuild.buildroot.net/results/85b5539745c739399bb137c31cf54311b6a80e6d
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/26486e88211d01ee49ad786e9a27a67b849ad1ab
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b9985cff21d5b5b5254f91ecf5b4afa6cfdfc194

-- 
http://autobuild.buildroot.net
