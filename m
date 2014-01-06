From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  6 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-05
Message-ID: <20140106073009.9FD69101F41@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-05
===============================

        success : 82 
       failures : 58 
       timeouts : 1  
          TOTAL : 141

Classification of failures by reason
====================================

             transmission-2.82 | 15
                dbus-cpp-0.9.0 | 8 
                aiccu-20070115 | 4 
                    ola-0.8.32 | 3 
                   squid-3.4.2 | 2 
         host-elf2flt-20130904 | 2 
                elfutils-0.155 | 2 
               aircrack-ng-1.1 | 1 
           heirloom-mailx-12.5 | 1 
                 libpfm4-4.3.0 | 1 
                       unknown | 1 
             util-linux-2.23.2 | 1 
                    crda-1.1.3 | 1 
                 tn5250-0.17.4 | 1 
                 ffmpeg-0.8.15 | 1 
libwebsockets-v1.22-chrome2... | 1 
                 cairo-1.12.10 | 1 
                  dhcpcd-6.1.0 | 1 
                    systemd-44 | 1 
        ltp-testsuite-20130904 | 1 
dtc-e4b497f367a3b2ae99cc520... | 1 
              cryptsetup-1.6.3 | 1 
ne10-88c18f02199947b2c8b577... | 1 
                  libogg-1.3.0 | 1 
              e2fsprogs-1.42.9 | 1 
                 mplayer-1.1.1 | 1 
                    strace-4.8 | 1 
                       kmod-16 | 1 
                 webkit-1.11.5 | 1 
                  thrift-0.9.1 | 1 

Detail of failures
===================

      i686 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/2913d0f5ec54e004792e419ceb248ba02b9ce619/
   powerpc |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/db366ede46d62bd277a1f4f30e3c00b6c89aee21/
      sh4a |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/efd8c4d6fe88d3196d2030c9b74588d711ed5749/
     nios2 |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/a4c96aa64092bc1e29c09d5c573b7e90fe43b031/
       arc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/7c93476bc29404c2dec65d1388a4b93683171634/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/0e602a7977779b36f469a83eefa7c649eb8a873c/
     nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/93c6588f3ba535167498685c65edf323ea9e2dda/
   powerpc |               cryptsetup-1.6.3 | NOK | http://autobuild.buildroot.net/results/8fd5f1efb26b6bc6a5c659c2450eabec435d0446/
    mipsel |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/ac5a8be0f3171ee7e7cc9e6b10da22e083793a93/
    xtensa |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/ad4b29b90b86f3ac94189e56eb603dea20d92258/
    x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/44fc2cab2b60aa82460bb46b1035ddda115af750/
       sh4 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/78d25c75be78a070e9f24b33513b00be3c1984c2/
    x86_64 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/44b9b1d145c76274c13bedfb1a93b3948704d28f/
       sh4 |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/9fbb09479cfd753d9fe80d978308c5c0d1aebad8/
   powerpc |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/c78083bfb4cac6295bdca5a8ba11a9dc954392df/
       arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/4586871cd343c5da0f92aefc2bda2d4ef41efd43/
      bfin |                   dhcpcd-6.1.0 | NOK | http://autobuild.buildroot.net/results/0d02ec69bf9fdf395dca6b2044f3ce5020ed0c32/
      bfin | dtc-e4b497f367a3b2ae99cc520... | NOK | http://autobuild.buildroot.net/results/3067fcdc2ef995ad89232464beb20645210a97f3/
     nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/145e901c4390a4ced7b0f445824825a01925be45/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/c66a61bafb435376c3bddd5d49e456cb15e3ebfc/
     avr32 |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/a68d83188b2ab06a8aea199f9197235778c4614a/
      bfin |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/ef61c608ef961047b425f48c99cd2fbcaf3dff14/
     nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/8bc514a10beca83e4d0cda0c0b62f4a6b056d835/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/1fe7f0f26c1913539aecb3e9f0d7a36f8dfa285d/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/014bd725ef1fa89258111a842429cca0ba5210aa/
    xtensa |                        kmod-16 | NOK | http://autobuild.buildroot.net/results/a52f390fa6f87438927e75a49d0fcdb67a48a816/
       arc |                   libogg-1.3.0 | NOK | http://autobuild.buildroot.net/results/0d2d00f0783c265f7fe05ab4c41620219cc1b3c2/
    xtensa |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/ea594807b891cbe1f0eddad7f89d34af160636c4/
       arm | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/ddbaed2656d48c86ca8b62ca6afe8edb4c3a4524/
  mips64el |         ltp-testsuite-20130904 | NOK | http://autobuild.buildroot.net/results/e03c3b8ad212dc2c23cecb9f8a61b344bc128fc8/
    xtensa |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/34787691528eef6a4e39b8ea3387d74d4b0c200f/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/d56904a990c388cec873fd72c3050d0dabda204b/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/ba9d3633609a66287660cba6616a661636d8cd99/
    mipsel |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/c875e97f114970d60e94bc4fe1a5991018733f4e/
       arm |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/212b3d211047ab4c1ae516d1fe1aaf8faf021683/
     avr32 |                    squid-3.4.2 | NOK | http://autobuild.buildroot.net/results/840ad60bda912870955f24a1d6efe82ae19f71a3/
     avr32 |                    squid-3.4.2 | NOK | http://autobuild.buildroot.net/results/d6081789f0cf0bd458d0d545b78e2024d69c9eac/
       arm |                     strace-4.8 | NOK | http://autobuild.buildroot.net/results/8a03fc0e5aa2f7e749d632ea7d0fe56b71297a02/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/7582fb025d1953593f4c065e0cd59bc70e4c770d/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/fa19527a2b5d5ef3243a436482ee21ad71c7b004/
      bfin |                  tn5250-0.17.4 | NOK | http://autobuild.buildroot.net/results/02cedc329c355255e9f9b3b87aa2777de321d1a4/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/25148f80bef896109514ea3931330f9df7efbd1f/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/ec3eeed674e21e1a0fd414e896856db85e5db801/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/b83a846a9893b4d33e4da14711d1bf3f385a17ae/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e5e063ab34d8eff9c4d360af5a3eb7095e77f91a/
      sh4a |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/c2a9fc5d2fb0e1737935e6b837b20267ccbac078/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/41a926bcec42c2d002b916f58c52885b31372fcc/
    x86_64 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/4e306ade0496d17d7f39a990139935e807c9ce2d/
       arm |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/5ec5c65840aeab6791014a24388af9f2656c2194/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/340158307a776512109185cf33db63bffa53df7b/
      sh4a |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/e73cd26bd45852e57aad2d185ad33343c2aa7661/
      mips |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/1900dabf10010cc73b1102e2390417a83e0bf532/
      i686 |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/92d63fe857bfceca8708202cbf235af35cad8bb1/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/be72526d05b164398279f44bbf7119e8e6d1aadd/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/da471da93fcc6018fcadfb55e9673dc8f6934323/
   powerpc |              transmission-2.82 | NOK | http://autobuild.buildroot.net/results/61fae30f6b9ceb9b3144a65b567ee5ca4e094753/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/af95ab87b3b8f4f23b91078bc48f0da95e39ba30/
       arc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/d10ebc62b92433a3bf6b1882980d3249633e5960/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/49bee0a96f90861bb4655c5b476a2481ba601356/


-- 
http://autobuild.buildroot.net
