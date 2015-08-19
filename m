From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Aug 2015 08:30:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-08-18
Message-ID: <20150819063013.E74B810154B@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-08-18
===============================

        success : 180
       failures : 38 
       timeouts : 0  
          TOTAL : 218

Classification of failures by reason
====================================

               libpthsem-2.0.8 | 7 
                busybox-1.23.2 | 4 
                  weston-1.8.0 | 3 
                  boost-1.58.0 | 3 
                   bdwgc-7.4.2 | 2 
             libselinux-2.1.13 | 2 
                 qt5base-5.5.0 | 2 
                 mesa3d-10.6.3 | 2 
             alsa-utils-1.0.29 | 1 
               linux-pam-1.1.8 | 1 
                harfbuzz-1.0.1 | 1 
                   dhrystone-2 | 1 
                   msmtp-1.6.1 | 1 
             webkitgtk24-2.4.9 | 1 
               protobuf-v2.5.0 | 1 
                  ltris-1.0.19 | 1 
                    faifa-v0.1 | 1 
                  mono-4.0.2.5 | 1 
                minidlna-1.1.4 | 1 
                   tinc-1.0.24 | 1 
    xserver_xorg-server-1.17.2 | 1 

Detail of failures
===================

         arc |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/605249fe36cf0698e2211a6707ebe0aaa1d73332/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/b66e107c3f1cea60a64fbfebd042839187838c8f/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/fa94a7b7b3add55944dfa82915e172c3637893a5/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b20f4fb82c3bcb3633f1e8230a9051b6bb699dd6/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/22b710346d2cd78b7b51cdccd18d670bb6ac5d24/
         arc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/b946c39ac4543249330caeb6c528f273f886137a/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/98fd1c9a3f92d2354fe3bd9c233916f720e26234/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7ce7267bdc4da3bd0069cec49b8286316d220cd9/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/3ebe4454210fb257af08a0ca9cd13844d6985d58/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/cf90773bcca2b0401135779a293af33dc9cf658b/
         arm |                    dhrystone-2 | NOK | http://autobuild.buildroot.net/results/004704ff6415be66f4cceb1a1d12e527f9eb1fd0/
      x86_64 |                     faifa-v0.1 | NOK | http://autobuild.buildroot.net/results/9eeb9d1497d94dfbda710e8bcdf781bc6d4b8724/
      x86_64 |                 harfbuzz-1.0.1 | NOK | http://autobuild.buildroot.net/results/ad4f31237e8e127ee40f6914c6b48879e17856e9/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/90fe673b4aab2c2231b419dbe8307d747680f583/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/0c72434c9f0cab6b1afbe7592273a909211b30a1/
     powerpc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/389b0dac8bb62ae72fd43396f5cd05de39472fa8/
         arc |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/edd545f529bdb075baa96cba76864146594acee5/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/d2799afb5042b08d556953d89ba2b75815f5022a/
     aarch64 |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/e0a6e39e58a76c15e621e713a1fba1ce6e2cfbb0/
         arm |                libpthsem-2.0.8 | NOK | http://autobuild.buildroot.net/results/3a11a92b731977acdd7ce98d1e4464b40f8e9aaa/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/417e81ada0977aca0c5bb7b1f2fe1c238e829d49/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/eb7a0d940d0bce0a09f357a2d6b0bb359d69367b/
         arm |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/e337d69420ad00b2cc4017d639a31803926f2353/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/c5e65c8d5a8f2042e5f9f0fd186d44ac5b9ed60d/
      xtensa |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/737c2a94e025d813da45be6375dc0ef9af4f0b05/
     powerpc |                  mesa3d-10.6.3 | NOK | http://autobuild.buildroot.net/results/62b525fffa6ab9a211ec96940517decad0e54f9f/
         arm |                 minidlna-1.1.4 | NOK | http://autobuild.buildroot.net/results/c9ffbf16c255d4d993c8564b53610bb9a6b90a79/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/5d99bdf77f1942fa403081267c362aa1f8fd0dab/
         sh4 |                    msmtp-1.6.1 | NOK | http://autobuild.buildroot.net/results/95a75c3696807ff6256ebda12b037c4db9e6efc2/
         arm |                protobuf-v2.5.0 | NOK | http://autobuild.buildroot.net/results/89856178211d9d077fabd9affe4007ee616f9899/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/966f2e4bd4237e082922b27b141e7277ffd8a76f/
        mips |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/305e5c31a6bd37fe5ee20821ba4e693d9bc495f3/
         arm |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/32da2e5ac384383c1e40eb17bf87970d912b235e/
         arm |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/eb8804abced7297b5edb5073f7a29d8b37dc6c6a/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/ef685a41a56e81dc93a40f23f8cd55860f44e055/
         arm |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/d842a17476e52f064d678a6a1a9ac5f7b6f2446e/
         arc |                   weston-1.8.0 | NOK | http://autobuild.buildroot.net/results/c42d72498e05364a718748caef74bba6c423d7d1/
     powerpc |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/0900f6d340b92c6fd1d391a9e2424d0b421c3cba/


-- 
http://autobuild.buildroot.net
