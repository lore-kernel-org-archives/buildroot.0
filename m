From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jun 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-06-26
Message-ID: <20150627063017.384821015E8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-06-26
===============================

        success : 164
       failures : 41 
       timeouts : 0  
          TOTAL : 205

Classification of failures by reason
====================================

                  uclibc-1.0.3 | 11
pulseview-198f9bc74d6c955a7... | 3 
             berkeleydb-5.3.28 | 3 
               libsigsegv-2.10 | 2 
                   tor-0.2.6.9 | 2 
                 qt5base-5.4.1 | 2 
              gst1-libav-1.4.5 | 2 
                   ntp-4.2.8p2 | 2 
               upmpdcli-0.11.0 | 2 
                    qemu-2.3.0 | 1 
x264-c8a773ebfca148ef04f5a6... | 1 
                   glog-v0.3.4 | 1 
                 python-2.7.10 | 1 
                elfutils-0.161 | 1 
                      atf-0.21 | 1 
                iproute2-4.0.0 | 1 
                pulseaudio-5.0 | 1 
               openswan-2.6.43 | 1 
                libtirpc-0.3.1 | 1 
                  bcusdk-0.0.5 | 1 
                 empty-0.6.19b | 1 

Detail of failures
===================

        bfin |                       atf-0.21 | NOK | http://autobuild.buildroot.net/results/5958518abbca1afe6f8847f620ca7a1a13d45cc5/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/888dc4e8e63b6b4d479d1d671ebfcf64899030e1/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3493a0a98114cdcc4e573887f41a25cbf7d6987e/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/968b6602c6dd877fce8e14ac34ceceda3b86e05f/
         arc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/ec6b8b03c8c87446f68b988fe17d3545b00234d1/
         arm |                 elfutils-0.161 | NOK | http://autobuild.buildroot.net/results/9896d5eeaef66991ab0a8bf7973dbc132b312dfe/
         arc |                  empty-0.6.19b | NOK | http://autobuild.buildroot.net/results/41d29897f13d8b00e9a2447b6342553bfccb964f/
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/a52856b88b243c380ac45b77c79e7cf80306eb25/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/6e14c589b4fd7762f7195a9a4780b78caab28e74/
         sh4 |               gst1-libav-1.4.5 | NOK | http://autobuild.buildroot.net/results/3af3de5ce4e8a0b683e2daada7719e9cce11d799/
         arm |                 iproute2-4.0.0 | NOK | http://autobuild.buildroot.net/results/f7f570875dda18ce384b8aa01c953472a84528ce/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/2e2fc1498d761495edf05c5c5d9b1295ce3806cd/
     powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/b0a07c8ddcb543820cf8627026f9172a5eb2ea10/
         arm |                 libtirpc-0.3.1 | NOK | http://autobuild.buildroot.net/results/192b20336ac05d502a439d0cb3e94839a4497d16/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/83bd87e0d2c7721e73f6659fe021b332474e461a/
         sh4 |                    ntp-4.2.8p2 | NOK | http://autobuild.buildroot.net/results/b4fe942e1b26d80c9551934fa73afce1f15e59e1/
        i686 |                openswan-2.6.43 | NOK | http://autobuild.buildroot.net/results/8b44ba9e791d53122f24a70176998f6a97ad33d1/
         sh4 |                 pulseaudio-5.0 | NOK | http://autobuild.buildroot.net/results/69a60c7e3cdd507b98881070d03c8d069df06885/
        i686 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/7313280f593c20d9ebc06dac98a9bea963200de1/
    mips64el | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/7dde14b81d71d663c9b1cf694286c1e776972fe7/
     aarch64 | pulseview-198f9bc74d6c955a7... | NOK | http://autobuild.buildroot.net/results/b438a895c82602e57f419342298b1678358a836e/
     powerpc |                  python-2.7.10 | NOK | http://autobuild.buildroot.net/results/1aeefbb02fdcef768612441fd6e06a8cf970cca2/
        i686 |                     qemu-2.3.0 | NOK | http://autobuild.buildroot.net/results/8228ceab8c9c027b6d69c8e77731f69c08d7773b/
        mips |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/cd6c986c3db38db273e2f720f50178b180cb8f38/
    mips64el |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/ffe72ab92d41455926b1cc708dfad6c15a2ba824/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/b236d4ab1ef11b65a731ea9362379f3acfce8485/
         arc |                    tor-0.2.6.9 | NOK | http://autobuild.buildroot.net/results/498c4afefdd864af2c8c5bb85ff7c53ccae03ec6/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/b9df8933b43e63fcfbdf62c5ead4b425eb2614cd/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/1b559781b97ad24e1677281d74886bf824a15ef7/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/cd798cdd4aa860ad4401037f7af83fc8b9865097/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/a0b19aed75259c26f7c1a897b7c3a095a1d97ed0/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/3058f1f5d8540711383cec217eb1e7eea714148b/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/44c278df4d0973d9801e1c52205f5322062b939e/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/88b2cab560c800aeb44aeaec89347a033515df4e/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/181b0886cee366faa8b198ea26c3e5250223ab84/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/662f3907e231415af65db1fbd91bb6f26359a40d/
      xtensa |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/dfcd824dedd74422d941eeadc0fbc70fb3edf627/
         arm |                   uclibc-1.0.3 | NOK | http://autobuild.buildroot.net/results/d2ea95c9c7795f615908314e63a501669573b7f4/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/fa0d3a5f537a75de58537bc7e10225ec6b741b7b/
     powerpc |                upmpdcli-0.11.0 | NOK | http://autobuild.buildroot.net/results/b53daad90aff06187b5551983cd6864c9b180252/
     aarch64 | x264-c8a773ebfca148ef04f5a6... | NOK | http://autobuild.buildroot.net/results/64bddb04a5f84158aa81124492a359a3c795e6fe/


-- 
http://autobuild.buildroot.net
