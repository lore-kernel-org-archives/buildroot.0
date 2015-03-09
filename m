From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Mar 2015 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-08
Message-ID: <20150309073019.02AE81011A3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-08
===============================

        success : 231
       failures : 53 
       timeouts : 5  
          TOTAL : 289

Classification of failures by reason
====================================

                  uclibc-1.0.0 | 12
host-softether-16b713b98da8... | 4 
                directfb-1.6.3 | 4 
                  snmppp-3.3.4 | 2 
                     vlc-2.1.6 | 2 
freerdp-b21ff842ef3de583751... | 2 
                  thrift-0.9.2 | 2 
can-utils-002f8eba8703e88cd... | 2 
   libnetfilter_cthelper-1.0.0 | 2 
    libcec-libcec-2.2.0-repack | 2 
                      qt-4.8.6 | 1 
                  python-2.7.9 | 1 
znc-b396cafdb249544164ed029... | 1 
               batctl-2014.4.0 | 1 
         erlang-p1-tls-53f0478 | 1 
                libevas-1.7.10 | 1 
                       unknown | 1 
                 webkit-1.11.5 | 1 
               sdl_sound-1.0.3 | 1 
                    sox-14.4.2 | 1 
                host-gdb-7.7.1 | 1 
      host-gdb-arc-2014.12-gdb | 1 
           qt5multimedia-5.4.1 | 1 
                 lvm2-2.02.117 | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
       erlang-p1-iconv-dff5ee5 | 1 
                host-ola-0.9.4 | 1 
                  giblib-1.2.4 | 1 
                     gdb-7.7.1 | 1 
           heirloom-mailx-12.5 | 1 
                    wine-1.6.2 | 1 
                espeak-1.48.04 | 1 
                yaml-cpp-0.5.1 | 1 
                 apache-2.4.12 | 1 

Detail of failures
===================

       nios2 |                  apache-2.4.12 | NOK | http://autobuild.buildroot.net/results/87f25b20f63eebf7f75e35064bad79e3d383e7a8/
        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/852713a923e9112902a781c20f2907ed659f89d6/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/2732a255ebb1f3c0307b62218c6a6b7a471de0d0/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/75d18a5a3604e8529d999b9c34aad4a0f25bcb85/
    mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/23fea2e4d668d69565d5f50493635fc834c54ce1/
     powerpc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/06347240b3fd00de332320f0bf8700bafff3a21e/
      mipsel |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/ed1dd80f1f592c4887d316199c33806c60e29e99/
     powerpc |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/6866614dce845103c0bc49529fa8117b654e3b93/
      x86_64 |        erlang-p1-iconv-dff5ee5 | NOK | http://autobuild.buildroot.net/results/cb4fdf6db523682dff1ad9fe000b6ed4d22bd21f/
     powerpc |          erlang-p1-tls-53f0478 | NOK | http://autobuild.buildroot.net/results/2d187b7a810ef190e256a61c6a2d56287da6acae/
      mipsel |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/7ef3bb95ddb78fa189c1ada2a6b4132512c44644/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/9f9a26271aad1737b5264d510abfbc14400c2f24/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/d3922966e951f929615654e58c36bc05775fa22a/
     aarch64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/cd8c1706f3c8301fc8263e2ca04356894626ecee/
        i686 |                   giblib-1.2.4 | NOK | http://autobuild.buildroot.net/results/e1a7691a6528d635c308d7bf47a8be8aa0594190/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/201dcd9dcba77756819ac2b806303d781fedfb5f/
     powerpc |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/b47368fe9ae48aaf3c0365f5b153c2c458591751/
         arc |       host-gdb-arc-2014.12-gdb | NOK | http://autobuild.buildroot.net/results/758e78e00df80260d9df51b6902ee15d8b1a150b/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/3a1555de4d299b4c89937750a4e6c1b04ae5930a/
     powerpc | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/7cc13d07441f6cf2ff2dbcc55ea58e997e470d2b/
         arm | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/1ea2635936c046729a70d7779eeb74490b4d0084/
    mips64el | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/98d9b270cf3ef8c2a43eef395c8607f20a6e8d2a/
        i686 | host-softether-16b713b98da8... | NOK | http://autobuild.buildroot.net/results/5f1166d866edad9ff3d3cb2bc04573b768a89bd0/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/2b2bec71f886d5822aacfb3fc0de3eb5efba5b58/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/83247429bffa6414efbe5b434d9abdddeac38a61/
microblazeel |                 libevas-1.7.10 | NOK | http://autobuild.buildroot.net/results/08c2cfe349e4af3f33781b407e3ca1874cdad7d1/
     powerpc |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/27118c1373bfe2230397504421396b0529759a63/
    mips64el |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/f7eb9c869583a90f129b226c6455c7d8e543caa7/
       nios2 |                  lvm2-2.02.117 | NOK | http://autobuild.buildroot.net/results/9cca9773c56c5ba5115290a13cbbdd013588cf2f/
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/f2ac3f818d789903f9165d458f3dc426029ba8ef/
         sh4 |                   python-2.7.9 | NOK | http://autobuild.buildroot.net/results/5b7caa64b921965b85c1bd64b83f5081a5fcb5f2/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/dde425a02223c6873193adfabd1904e9d8e023e3/
         arm |            qt5multimedia-5.4.1 | NOK | http://autobuild.buildroot.net/results/564b5043c547f4f389ab4fcef49879f6d17f528c/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/a21eec0e576966e2bb623d80ddc3c3fbaa5ca5e1/
        i686 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/29b6cba2a2898ec18a49875c29a165d4cd00442a/
      x86_64 |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/1b7ad5cd29552bca8550a1d10876d0202788cec5/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/c0346123828b78da7f9888ca31d225b8a7151d7e/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/ab4fcfd4d71b36344d37769bc5abcbcb85fa0901/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/635d7e010a02ac65530b36db53de0fb886c22f81/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/c6e34d2afb351ccd70f9dfefdc4187527b98c6d7/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/2606e6cd97375ae018b19f96e20394fa98335ffa/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/901cd73c9b779aaa8f664abec550081b683241bc/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/af57729c1b7807cd023ed4d51daaa5c1a00bab63/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/a9e901b0e969c7ae5eb2acdf42b092424fade4de/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e7a93462b3ded3ea3e88ea421b19ae2b58f89048/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/651f0fce6f8bb5c57f70ee6ffac5b85aab7b03c5/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/0e9630bd4abcbf8d36ec1d1e2eae8a03d38631fd/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/46f1efb9275619776368ebb5f51a5ecac32775de/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e93aa2f42d058d12fa7a8b3c3e5f239a2b7935fd/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/857ffd3454f2ef4786fe63d083023d84730f1578/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/0d3bf07e21685f545af17a9c281252c200444c04/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ad90a607c299c7ca8a0701d00489060cfe1409c9/
         arm |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/bd6c83af7ab69842f8df7e3a6fad3e0eef6a9a7f/
        sh4a |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/e4273d70b748c45cca1745614785cf762e46bd7f/
         arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/a03f19d74ed0e4e223e8b78661a665436b1bcd43/
        i686 |                     wine-1.6.2 | NOK | http://autobuild.buildroot.net/results/9d24504f013fc7e7d66be884188b9704ea7fc9c0/
    mips64el |                 yaml-cpp-0.5.1 | TIM | http://autobuild.buildroot.net/results/f0a03f6ec2f20317db5477b8d0e394f91ac5f351/
         arm | znc-b396cafdb249544164ed029... | TIM | http://autobuild.buildroot.net/results/8861b060fbfcf45f58002de1e26af7f3390b8845/


-- 
http://autobuild.buildroot.net
