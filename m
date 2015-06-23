From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-22
Message-ID: <20150623063017.1881A100D7E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-22
===============================

        success : 187
       failures : 47 
       timeouts : 0  
          TOTAL : 234

Classification of failures by reason
====================================

                pinentry-0.9.4 | 9 
               upmpdcli-0.11.0 | 5 
                   tor-0.2.6.9 | 3 
                   glog-v0.3.4 | 2 
               qt5webkit-5.4.1 | 2 
              strongswan-5.3.2 | 2 
                libtirpc-0.3.1 | 2 
                  bcusdk-0.0.5 | 2 
make: *** [openvmtools-lega... | 2 
                 qt5base-5.4.1 | 2 
                    feh-2.13.1 | 1 
pulseview-198f9bc74d6c955a7... | 1 
             berkeleydb-5.3.28 | 1 
                  libftdi-0.20 | 1 
                     vlc-2.2.1 | 1 
                   libiio-v0.3 | 1 
                 empty-0.6.19b | 1 
                   ntp-4.2.8p2 | 1 
                 cdrkit-1.1.11 | 1 
                   zmqpp-3.2.0 | 1 
             exfat-utils-1.1.1 | 1 
               arptables-0.0.4 | 1 
                    php-5.6.10 | 1 
                  guile-2.0.11 | 1 
  toolchain-external-undefined | 1 
               libsigsegv-2.10 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/770d776dd2451c57cdbf30e3be6caf60a5f85e1b/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/acb6e4adb9e4efc635fa070d986c789aab8c0cdb/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/d221b30f9cd933e3eac02f213511c111daa19aee/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/181ee367c3f1a1f034be47668059f0da6a41da76/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/606c6e0e8b6ce45f0f4504a1b88b8459628413a7/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/5ce838bc2c86ef145e96138b6320d02c62ec80c3/
         arm |              exfat-utils-1.1.1 | NOK | http://autobuild.buildroot.net/results/cb676237e0d74715f3f175cf80709dfb62640ef8/
      xtensa |                     feh-2.13.1 | NOK | http://autobuild.buildroot.net/results/2fb84cacff8077049549a878b62d452fa82794bf/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/d9a7122e364f754573b89eaebe477ad9d83bc148/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/0976e156e3634a70764e2ecdf396db3d53d9b1ae/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b46999f7ac789cdae67332229a033737f424342a/
         arm |                   libftdi-0.20 | NOK | http://autobuild.buildroot.net/results/47c5244236de032c65dd3f6cae87c3a08b41d3c9/
      x86_64 |                    libiio-v0.3 | NOK | http://autobuild.buildroot.net/results/e6b346bedaf5402a60e4de3a48863731e05d418f/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/cb581a04a66320493a39c41f04cab9c4bfa65062/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/eaa2b1b03efa49840f50e0b66e5027bd31a74e0c/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/21200836187307b0a22052b9831b0d41dd774b2f/
      x86_64 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/96a37b6d17c4f8e0f0cc100441043b1246b40c45/
        i686 | make: *** [openvmtools-lega... | NOK | http://autobuild.buildroot.net/results/0c974654da21046327355e83868a6a0f28898d69/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/ba83b8596c72dfb5677c5033112aaa5bdf1e0171/
      mipsel |                     php-5.6.10 | NOK | http://autobuild.buildroot.net/results/dd9df595e40cde8905d7d8be47ee737571b96369/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/eff5ebd9fb95303fa6cafd36bde16ba82f05791d/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d8d33efd16cc94dc9d9d4b2d7615a0abb5752ee4/
        i686 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/14483d35ab5009e854c7ce86e26942fdefd5c1f0/
      xtensa |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/da35c42ea2a7cfc1539f958868308d65f4a65fae/
microblazeel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c5c412b36896572388ba581a24f857e5003d8bf2/
        i686 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/06c5c2762ec22271fec20a6d15548011e40875d1/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7bb3229714fe1fb2cad0ba3c5b4545d8d31aeb52/
         arc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/c4805785077e955c61f246d0e4d8416d8dbd10b1/
     powerpc |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/2b79d95d5376d3ca6c0e7db3bc902ac638659d3c/
         arm | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/4708bfbfdb037f4ab1a803c35db8560efc748ee1/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/b32fbacf57094b8b0478f819ac16310e67fca52e/
    mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/9df045b6f410ab2e4f732fe7573d4f189a2fc57e/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/c36e97c3947cfe1bb67fe913ea05fe6bf6135386/
         arm |                qt5webkit-5.4.1 | NOK | http://autobuild.buildroot.net/results/4220f027a88e1c8e07206db5585a0b6cd3b33588/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/3f4787720595c4babdc42b1bcd8ee226b730b3f2/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/88af7ddff2312a97f0e7979d077df836ffeab352/
        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/bcaebadd60226a012d414155d517e65344e7a225/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/d8fd018e75b3b61e7abdbf38c7b9169e570d9902/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/60c067696674808745361d9fe0ca990a8d9b1be2/
         arm |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/16baba4e25803bdb052e43f9bccdd5588accb232/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/483630948269a8c0f8584ca7bb29ff59a2565172/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f97e0bbb84c125c92ea86b1423085790ce7a66a3/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/d3f740fdb454bb339ee6de4b16a0c952fae72916/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/72b8d5c4763d273bb031673941bbc3277e8c75bc/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/f0bab98534f9786b795cfab72dac49c260cf2f23/
    mips64el |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/816599b86ced68b217ddb543d5635d3490ac8096/
      mipsel |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/6923672d7f2752558e35ef7d206508c3a194dc55/


-- 
http://autobuild.buildroot.net
