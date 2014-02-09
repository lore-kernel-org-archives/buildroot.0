From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 Feb 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-02-08
Message-ID: <20140209073009.E8AB010142D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-02-08
===============================

        success : 88 
       failures : 40 
       timeouts : 2  
          TOTAL : 130

Classification of failures by reason
====================================

                   attr-2.4.47 | 5 
              host-sam-ba-2.12 | 4 
                 cairo-1.12.10 | 3 
                 mplayer-1.1.1 | 3 
                       unknown | 2 
                     vlc-2.1.2 | 2 
        ltp-testsuite-20130904 | 1 
                     nut-2.6.5 | 1 
  toolchain-external-undefined | 1 
                  dhcpcd-6.1.0 | 1 
               openswan-2.6.39 | 1 
                    libcgi-1.0 | 1 
                  aespipe-2.4c | 1 
              wireshark-1.10.5 | 1 
                libtirpc-0.2.2 | 1 
                      icu-51.2 | 1 
               alsa-lib-1.0.26 | 1 
tvheadend-c7d0335eb10d02b78... | 1 
gpsd-b4c32aa40cff1b4e1041d5... | 1 
                 dropwatch-1.4 | 1 
                 rt-tests-0.83 | 1 
mmc-utils-11f2ceabc4ad3f0dd... | 1 
                  boost-1.55.0 | 1 
              gst1-libav-1.2.2 | 1 
                libsecret-0.15 | 1 
                  gnupg-1.4.16 | 1 
host-gcc-final-b93bb009e021... | 1 
                 qt5base-5.2.0 | 1 
                rtorrent-0.9.3 | 1 

Detail of failures
===================

   powerpc |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/e3aa11b4c11f69a55d742b91009aafeeac1a816c/
   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/ff7ed8012ff60b1b48267c93247f86a2e5d8629f/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/15f4258420e22a4b4907804e4182cd74a886de13/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/775e32a1349a1e4c0472d58750c68ea52db58f0c/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/804653b7cc39fca4594944845a6552a085b7c14a/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/cf248e83fa81f8fb3700a5542db1fec5e64853da/
   powerpc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/adc8f3a37446a27e799c836492426dd923324fcf/
      bfin |                   boost-1.55.0 | NOK | http://autobuild.buildroot.net/results/e46cb272e28581ab7dfa13398ec593e57fea33b8/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3d33f5818de19cf50d78e714443609b77eed3df6/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/455614a7e47eaf630349ba686ad3775a41e20eb0/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/e48043e874ca924cba223d6d35b50c5ba1f95d74/
     nios2 |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/c59b51b688089aace01520d76bb593cfefe69284/
microblaze |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/a38a272ae268ea774b78a77faed3dea874829128/
       arc |                   gnupg-1.4.16 | NOK | http://autobuild.buildroot.net/results/24a58f8f379018a3bbe09d21361ab18891f7220e/
microblaze | gpsd-b4c32aa40cff1b4e1041d5... | NOK | http://autobuild.buildroot.net/results/7ddf5c750540cb9a2f4df8e24f87e5a37e847e3a/
    xtensa |               gst1-libav-1.2.2 | NOK | http://autobuild.buildroot.net/results/33fcbb79809719f68f3ee2cdb0fcacad82b9e0eb/
microblaze | host-gcc-final-b93bb009e021... | NOK | http://autobuild.buildroot.net/results/d07f1eeceeded204bfec3c6ee9ce0c9713ec5ff8/
    x86_64 |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/751c71690ac4cae713faea46fdf8d874fc44e88e/
       arm |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/8b006dc0a6edf3d2419586006b85c091d693bbd4/
      i686 |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/bda8380f570fd636c90e31639cb8438a2181dd12/
  mips64el |               host-sam-ba-2.12 | NOK | http://autobuild.buildroot.net/results/03d3b0e2ffee3c8d1d4aa1aa8df7ffd420cc7572/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d93cbcb1964453eaae369cf54afcc016605836c4/
      bfin |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/d4bf09a372d1e6987089a98cd481053b49ca48ee/
     avr32 |                 libsecret-0.15 | NOK | http://autobuild.buildroot.net/results/67fbf734906109e7494556eacaff32677e47fedf/
   powerpc |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/aa04cdcd8c78161678ba5ab1a58b9fc2cc5ce771/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/57d026677b4de98ce5dbd97b7f3fdd205f540e90/
   powerpc | mmc-utils-11f2ceabc4ad3f0dd... | NOK | http://autobuild.buildroot.net/results/13acf3ca50e6d54348a412bc2e3b8805767677fc/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/5b6c82e9e12709ae6b698d94666c0f214a0a8fc7/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/17d41546d96c7e217a55e362c7a0df7978991747/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/175415de71aa4e8f38d4cc957f973906cf6d5e75/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/a1796d9417656a4e90c80e5baaddea1f3447d628/
   powerpc |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/b848ef158677615cd80e3a8c498b0cec0586b9d5/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/d581504e0a0b8f76a5d6c3d4dae72332825c2776/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/3115bb7ffcc9549bda4a1597e1efc62387b62b78/
       arc |                 rtorrent-0.9.3 | NOK | http://autobuild.buildroot.net/results/51414e22c8ea47c38df20d864526a370c5a895d7/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/65b3341ca405e6993e57affc047620bb80c98a86/
       arm | tvheadend-c7d0335eb10d02b78... | NOK | http://autobuild.buildroot.net/results/faebbf59d2303ad77bcbda708e24064e3a622693/
     nios2 |                        unknown | TIM | http://autobuild.buildroot.net/results/b792403e049b409b7d41675d3adf85f5fe1b83c7/
      i686 |                        unknown | TIM | http://autobuild.buildroot.net/results/0476550c548cf90f00f1b1d40266a8cce89bb8cd/
   aarch64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/df866c69af7c50eb50d40c38e42d143b29876fdd/
    x86_64 |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/9b46021ea0064850ce8f1adcb5455d6da5bff459/
    xtensa |               wireshark-1.10.5 | NOK | http://autobuild.buildroot.net/results/b5c1cc9be0f88aaa7f6749db05165194586c8ed1/


-- 
http://autobuild.buildroot.net
