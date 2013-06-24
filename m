From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jun 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-23
Message-ID: <20130624063006.0A8D152C0F8@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-23
===============================

        success : 103
       failures : 76 
       timeouts : 0  
          TOTAL : 179

Classification of failures by reason
====================================

               libglib2-2.36.1 | 10
                 libffi-3.0.13 | 9 
        host-dosfstools-3.0.20 | 8 
                 libnspr-4.9.6 | 3 
                openssl-1.0.1e | 3 
               openswan-2.6.39 | 3 
media-ctl-ac40b79f002a2315f... | 2 
                  bcusdk-0.0.5 | 2 
             gdk-pixbuf-2.28.1 | 2 
          host-protobuf-c-0.15 | 2 
                directfb-1.6.3 | 2 
                      qt-4.8.4 | 2 
                beecrypt-4.2.1 | 2 
                    acl-2.2.52 | 2 
                  zeromq-3.2.3 | 2 
              fontconfig-2.6.0 | 1 
                     m4-1.4.16 | 1 
                libiscsi-1.6.0 | 1 
                 rt-tests-0.83 | 1 
                 dmalloc-5.4.3 | 1 
                   cups-1.3.11 | 1 
               bind-9.6-ESV-R8 | 1 
                 zmqpp-31220ca | 1 
                    dash-0.5.7 | 1 
                  readline-6.2 | 1 
           imagemagick-6.7.8-8 | 1 
                       kmod-13 | 1 
                   neon-0.29.6 | 1 
                cegui06-0.6.2b | 1 
                 libiconv-1.14 | 1 
                      udev-182 | 1 
             tvheadend-5513b44 | 1 
                xapp_twm-1.0.6 | 1 
                 libevas-1.7.4 | 1 
                   icu-4.8.1.1 | 1 
                 nodejs-0.8.22 | 1 
                    flac-1.2.1 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/be573ea5447863f6328493489d2747acd3ed600c/
      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/cee2943bea98b2e047f8b5099c4d4572b57aff03/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/5edf51c6207da758d25f291b1cd456b27a5db955/
  mips64el |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/9cbc0bd21b2f95bd6f8609d8b8f650d83f02d112/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/70498baa0a621040da4ede505f8575dcddf54679/
microblaze |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/0be7d317574ceed4ab149c20bea3defd99ce7fd8/
  mips64el |                bind-9.6-ESV-R8 | NOK | http://autobuild.buildroot.net/results/29bbe464a48c24edbdb54b70cf7dc7df32d39181/
  mips64el |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/fbf1a107dc7249a35a7df7cc5be3bf0bfbe6b4e6/
       arc |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/c814b40c12ce788d87261750299c1cdd0de3e32b/
      bfin |                     dash-0.5.7 | NOK | http://autobuild.buildroot.net/results/9ffde0aaa717efb6a5c0ef1e4e7f2cdd0621c150/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/88564cd05acc4d0f4069982c49cf8348eb122575/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/c25b03f41070ada3ae6e23d3b2749783e1cd0934/
       arc |                  dmalloc-5.4.3 | NOK | http://autobuild.buildroot.net/results/0bdf9dcb94df864b7742c7e8d0ec21ecfff884e2/
  mips64el |                     flac-1.2.1 | NOK | http://autobuild.buildroot.net/results/c4349cb8a9050f5c5510a6a3c74c526d4b551918/
  mips64el |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/24ae114cd06dc9ae5499fc5778aee8292be06f48/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/aecba0993e18ef978f653852e28d2e64a37a4296/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/fdd02681985bf4b906b092787f349397c5b6c2c9/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/5e284755f526771c4b4fadf07374955610ecb356/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/6ad1cb2b5be9ed7c070ba82c3239aa25590c9308/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/4ec4a54138124a60b80e5b4bc6985ecc6f0ef125/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e10092a0a3d17130a018c1de396157a83be72b13/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/97e53e914f992d61e25ba2e65a6c2ec65e79e076/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/e80723d6003da447b803441536927ae0139af73c/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/73c66f8c21a7574f40cec7ea5a6df90de50c6784/
      i586 |         host-dosfstools-3.0.20 | NOK | http://autobuild.buildroot.net/results/d60f1b4c374aecd744b3db058c21701155625ade/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/abfcb4308aa360f0cc6de186f826c924a6e85b76/
       sh4 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/f39d9a87faf95308bd92bc4b6d20a915ab627173/
      bfin |                    icu-4.8.1.1 | NOK | http://autobuild.buildroot.net/results/8d5094882e65e3d80b7dba68f3b1d0ff817d719b/
   aarch64 |            imagemagick-6.7.8-8 | NOK | http://autobuild.buildroot.net/results/3451e5cb6a320f4776af985548e3e20ea7c1dd2b/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/46a18635e16de6ed101b72c03eabd759e1290d50/
      bfin |                  libevas-1.7.4 | NOK | http://autobuild.buildroot.net/results/7b7bc39af46d566c65bd4ea991e0044588186728/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/86befae7371ce1d2d3141227aa7d950b4d395fbb/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/463ceb029905867f969d77ac43f39cec45080aad/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/bcac44fcee50282e34ab42827f0eccdc7696a444/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/839b1b8e58aceed12215f172bed2f750a7af4073/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/29373cf234cb3a3de83562242a42de094ae3c2d9/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d7f04b6fe5e1c17bd53c0807bbe53e5a78e35947/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/67dc0f6414cabe6d0ed5d00b9a4a7fb27f65a3eb/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/48d86b1f85410bb4405d6d0937b0b79951886787/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/49be32100cc4c579bde6831695990f49fbb28608/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/bc4167324043f83dfcf63834f551651a24598070/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/16674af0186c6f10192913ff72851f09bcb8add2/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/1acfbe1aa963c5dce080afa2e57e5bc61290f027/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/46812f446700ed6fe1ac8b586db46efa8a1087fe/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/65fe7f03890aa878a6c4e90945ade43c222c7aab/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/1a4f4ecd154c460791d103e9d243e07ac2167dda/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/f1348eef1fe64caaefa87d38d0176b43bcf888c1/
microblaze |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/af46c0b7963e90684640cf4dea50ab4ca7c9a913/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/8a22fa315628e97f98e2edea3645314e1f38871d/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/930549c86c5a3f493f3ef1e8afa6cad46ebf4e96/
      bfin |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/2d8732e6b7258aa34e7f1eb910a43b4808fd80ee/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/16d021d337bff3d79f438ada4e9ff37b1c1b939e/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/b575d8e6f564dcf101d542746235b3976cd0c658/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/6f7ff4f39ab18bd4ac94e5f6066cb8df4902fd10/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/89479b29133b94082ff6ea0e18965c874f7141c0/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/32592e1f704b7b2ced5309664e202797b202a5b6/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/ef45de6d49ce49bbd70e75f7b3f2ba76b0417b6f/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/0ee02c4603199ac9a4d12576f0085aa085f6722b/
  mips64el |                    neon-0.29.6 | NOK | http://autobuild.buildroot.net/results/6fdbb75b70331d2162641df8370687f5af67886f/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/9801fb7afc1011148253b2a76f8b31f00d2c33fe/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/25abda20b04a22cfcfeb225730cca468f2c1489a/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/84c8857bfea4f0d5837c6010fdf316dfb97e7ab2/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/71251cc9dd5a5c1810c6fbaf9b995feebe99a92f/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/7457f9fb0657a47294135ca8a931eb44a20f3bf2/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/07086c5e338c146345664028dc3b2598d421a7ec/
    x86_64 |                openswan-2.6.39 | NOK | http://autobuild.buildroot.net/results/03897fd5e0d774723e174fb57a40800874349b72/
      sh4a |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/d9278bfb579c3485983b4b68a3320bd109d56bd3/
  mips64el |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/d045dbf57367382a7a56e917786b1d83922e9f9e/
       arm |                   readline-6.2 | NOK | http://autobuild.buildroot.net/results/2ea9c7c6aa683225ff51f0b1dd1e3f0e052dfb0a/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/5bd0cee1a4280bc0bb8093129a0d7d4a1ee23f55/
  mips64el |              tvheadend-5513b44 | NOK | http://autobuild.buildroot.net/results/6e7648786fe62e7a6aed56804d3154c089cd71cf/
     avr32 |                       udev-182 | NOK | http://autobuild.buildroot.net/results/141d056d871136d5d2f117513615fc109a90dce8/
       arm |                 xapp_twm-1.0.6 | NOK | http://autobuild.buildroot.net/results/780f1a07e24f9f5082efaca570d78f20dc832b30/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/5efb749d610e6d8635794aab38e65e88d3d3db33/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/e2b8ca31857eac64db38e4ab98890afb1dc46b0b/
       arm |                  zmqpp-31220ca | NOK | http://autobuild.buildroot.net/results/a0907bb3574d3cbbd284a0d70d1f4efe30b3e095/


-- 
http://autobuild.buildroot.net
