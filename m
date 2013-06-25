From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-24
Message-ID: <20130625063005.225ED52C0F8@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-24
===============================

        success : 96 
       failures : 66 
       timeouts : 0  
          TOTAL : 162

Classification of failures by reason
====================================

               libglib2-2.36.1 | 6 
        host-dosfstools-3.0.20 | 6 
                 libffi-3.0.13 | 5 
                  poco-1.4.6p1 | 3 
                   cups-1.3.11 | 3 
                openssl-1.0.1e | 3 
                   icu-4.8.1.1 | 3 
               libcap-ng-0.6.6 | 2 
               ruby-1.9.3-p429 | 2 
                   dbus-1.4.24 | 2 
               openswan-2.6.39 | 2 
               aircrack-ng-1.1 | 2 
                  libedit-2.11 | 2 
                  ne10-88c18f0 | 1 
        ltp-testsuite-20130109 | 1 
                  prboom-2.5.0 | 1 
              e2fsprogs-1.42.7 | 1 
                    nettle-2.7 | 1 
                 rt-tests-0.83 | 1 
          host-protobuf-c-0.15 | 1 
                  boost-1.53.0 | 1 
                 binutils-2.21 | 1 
                  iozone-3_414 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                beecrypt-4.2.1 | 1 
                   wvdial-1.61 | 1 
             gdk-pixbuf-2.28.1 | 1 
                 qt5base-5.0.2 | 1 
                 lcdproc-0.5.6 | 1 
                 libnspr-4.9.6 | 1 
                  bcusdk-0.0.5 | 1 
                 cairo-1.12.10 | 1 
                     m4-1.4.16 | 1 
               qt5webkit-5.0.2 | 1 
                       kmod-13 | 1 
                    acl-2.2.52 | 1 
                  dhcpcd-5.6.7 | 1 
                   mplayer-1.1 | 1 

Detail of failures
===================

    x86_64 |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/00b155abab7a4053ed4fbb29b4ed09824dd52c2f/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/c3c32a039a081e60b7342855a6daecf5f4e36918/
       arm |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/4808ab27e2703157eb209b3ffa79121059450278/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/3f32481b1f51b63f565d8557297ab8d99cd32f84/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/c4097b0c2b0de603be6c5a6bc553b931b03aeab8/
      bfin |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/60a6cf21c26e7df4fc086beed8053f465903497e/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/50f138b47071ea0970e564b9967fe2e2c06f8bb8/
    x86_64 |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/22ecf0e69bc89429d61772bad7f21dc9e0175d4d/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/477b91971b7ee361725fcf06c544feedb754d2a3/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/77c3f1d27b992b4c436d5a5334a637c77ef3bf09/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/de8a2efb7c4ac3aa6274aab8b009fd60621ae1b7/
   powerpc |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/e1ee23296e782a217501bb99951bf2ddeb5e0382/
       arm |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/4b99a353db224b881241c84d69fa4c689698aa20/
      bfin |                   dhcpcd-5.6.7 | NOK | http://autobuild.buildroot.net/results/f4dd9ca2774bc89e6f976d75a13190d8a1e457f3/
     avr32 |               e2fsprogs-1.42.7 | NOK | http://autobuild.buildroot.net/results/bb3f166b2444fbbba8731300a427f3f3fc470ccd/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/624d0dd6ae18a12d90b7a2cf6ab6b6c500c9dfc6/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/26215b8527566d64f6686d19dc665d24bbe28dbb/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/4a17be24b811c51b50744dc3355865b732778607/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/c2b111d98390a92291bc3e83580971f74eeab87d/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/ebe05adfbe9c4db6f5826c25d9bb56d5d1a8f4b2/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/44d029aaebea7ba5b47d7b631f5e257ebaddfcec/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6c3466e43d2a602a40d1544d8a989ea431b19da1/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/a5bd332b4392798152262ab1f1e610c1befb4761/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/5e8f09ec0706841085c76ca1ab02d56a3c2ff61c/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/5b65c8955a58b0cff280a263d3d5ab65fcdad84a/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/49a7a81a07b2ff07695aaa48707b633d9cd74ef8/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/9ff46b4ec73730abac2459e1cbb49521d407640e/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/f77998734ef2a8cdac19cda78574ce2db816abbf/
  mips64el |                  lcdproc-0.5.6 | NOK | http://autobuild.buildroot.net/results/521cd262cbf77942b9c9db8fabdddd36f11b0a94/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/fe063aa7e8b8e18588cb4b68f0d19a26106f51a7/
     avr32 |                libcap-ng-0.6.6 | NOK | http://autobuild.buildroot.net/results/ced37c7588c48ae6c8c57cfab8f0a44decb2606e/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/34d760c858b99f8ff1b5945bc5bd3a66e4105c53/
    x86_64 |                   libedit-2.11 | NOK | http://autobuild.buildroot.net/results/0b0fa8c57a9635e9fca6ad48b4be1c2e2e7acfa5/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/57e4a30e5093caf1ccc7f9a18a5c1936506abe53/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/7a6ef8e9d64f256a743a16224657f4797c02d179/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d5ac2f5b4677b02a6ea7b50a32b44b08c241096f/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/cb2beb64937889cf681a259dbbf4171d6037afd7/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/f9964d3f589a9038ba1ee7594330cc3cfb7ce0b0/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/a7a4cacd42d90132676121d2cd49ede376577783/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/af6599b25418b43430a48d4be8f13476cd718c58/
      mips |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/6ec5259b27f1b4f0022580646db9fbb568ef05a7/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/4a9b3d1715e81887673def8986abcdbcd5f0c50e/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/f8921c719dedfeb72db1d5f06db63f3ca94d4a09/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ee34b2072694e47b59cedca10ba88cedca9d2d43/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a794241527f0c5d97336cc9c5bad040609b91399/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/0c4f86dc8834a03048acae4494faf5cfeb78cade/
       arc |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/9412f811ebfcd9d64d6558c5c64d67c2b2037da3/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/8abc3383cc42a63662f8a5d875bb09112639cba2/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/33e2f418fc0b459e219ff89a87b86b764a998868/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/4be3dd69a51b1899fd3366e237d4cc97316aacaf/
microblaze |                     nettle-2.7 | NOK | http://autobuild.buildroot.net/results/489dbf5d345280262ee623556cb183f50150edf0/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/495caae96c3269ace366b1bc0094ba128e9e19b9/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/96c4d77b153753962e2d125693425e5089f98a6a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/8c0be5f4ba5c07295716ba63daaa60cdd5afd730/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/b89d3ac580f1c1b59eacee67a6338924e8f65a0b/
    mipsel |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/a76373e9b9ff13f5761639b5a4183378dbe0a5a8/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/67187c0914c992d14bd48f3ba7f85c664ac442f8/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/637b531d356ec31492b3a2c85c5d0f9964f769bc/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/e2fa6bf060d3e16bc93f774aefe59f296191d924/
      sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/386ad45f41b0544b5a4c84c44ddd559e92413583/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/9e2237d7623833016517199fd283036d02bffb79/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/7e331d0e77c419cc4ab022f0f5a7f9db170d7253/
       arc |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/a2bec474d23ae8294cf7cf69256169f5cf52d2af/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/b0dd313e047b7afba64a67cf092f709726f670f5/
       sh4 |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/48f459c29c8369fe5a068a5400e60af02daa0fad/
  mips64el |                    wvdial-1.61 | NOK | http://autobuild.buildroot.net/results/b946036c822d116923f686b22f8e1c1d3bcfc973/


-- 
http://autobuild.buildroot.net
