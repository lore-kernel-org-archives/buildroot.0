From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 08:30:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-17
Message-ID: <20171018063047.C062A208A1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-17
================================

      successes : 132
       failures : 332
       timeouts : 1  
          TOTAL : 465

Classification of failures by reason
====================================

          host-libglib2-2.52.2 | 286
           argp-standalone-1.3 | 7 
      host-uboot-tools-2017.07 | 7 
                openjpeg-2.2.0 | 6 
                 msgpack-2.1.5 | 5 
            libtomcrypt-1.18.0 | 4 
                openobex-1.7.2 | 3 
                  cc-tool-0.26 | 2 
     host-shared-mime-info-1.8 | 2 
             qt5location-5.9.1 | 2 
           host-libselinux-2.7 | 1 
                libcoap-v4.1.2 | 1 
make[2]: *** [all-recursive... | 1 
                   mp4v2-2.0.0 | 1 
                 mplayer-1.3.0 | 1 
                     nmap-7.60 | 1 
           oracle-mysql-5.1.73 | 1 
                   pcre2-10.30 | 1 
pdbg-77158819158d1d7053a737... | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/923c4c46fa1bc108affd277ba3c39aa90fc48d54 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/21ab2b13d4f786cf37dd3125b1f247cdb6285ee3 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/e9c1a782b1b3f2ffffd69c7a979b29f964a40bef | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/484b5d5cf8f7ba83d6c411a0dacc86195e9b095e | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/709f00e5a6058d9172ca744d6dbb2c76cfcdfdcd | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/2b255cb6cfbd7db1b1a27ad11f1ff0e71b265ae3 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8bb71263b96dec14e684b5068774bd83736317d7 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2d41c0188f9ee63138c86cc3a251271b58bd4c8a |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fb86baea05dda9236cf0b124cd8326c7af2a76ac |     
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/499c9b6dc916fa4c88318e152a68b03cff44b639 | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3315760e91cb0851afd9292638148a84462460e3 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d74bcb885b2d49db0ca32df0f50f45f569bcc48a | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e9b05902adcf0edde60d7b59529706fea4c41c3a | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/29f7ddab372c3fb2e22f7b7bec9f4299fcb4815a | ORPH
       sparc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/af2d5593c195b533d9c5dda1c8ec1378017dd240 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ec6b42a570862808b7f36fb75b2c929209b3ac65 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1a6372b31906fdaaaba993f8a94df93b1fd985ef | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/22f23282e3ffdfd44c02a638de26d1d04303bfd0 | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7a668bbeacfefd8d2ba53ae04028cef1ff24f604 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bf1e3ad299865bc64321eb3a2481df4ae5b3bda9 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7f4d88824cca90a45746cab9921e2a8e94e2e68e | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c3549d48d63d5d1b0b560383938eda57635e182f | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6581bb33adc28c1611b6bcf112313bf7d0e00d74 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7d6c18f548eb0f7042be62f6e579ac1979bad46d | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8d6d3291ce77c69c99146bbe5d0791a4b1c3cb1f | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ff2a316b664618b6188ed283d552ba8074946e4d | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f96ada2fd3456c6cd8eacb36c6f215825321966b | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bf57e4e6a97d921331bb03171214e8c37430316d | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/17dd8b6e5014c06d800f126afc58aef35e5b3d9d | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e14232bf3a0c8b23bc84b660c70d4c9d057fc9fe | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/af50a5716f5161e00ee32776815412d2570d6720 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/453acd0fe5b5c6c8b804e61a280b67fe107d5f04 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/50267eb767dbf8f9c6fb410737abe09c12332981 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e5b029b74dc48be7bcd68187109eaded59b98d80 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/38c09d94fdf21bc13d9bfb90f9f9e4a8e33f863e | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/699f6c4271ef1f1bf871e12d875b066aa283f62c | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/827922a8d28d2e9e37ccc818c11a615ff90360bb | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f0993083e5713e5dcf86e90f97de48efb26f4144 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/28800067dc08e869c6f53bc73bf152de03ac2b9a | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d02090440f63ba68ce2690a17c36ef84f6917730 | ORPH
       sparc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/72f5a5b239218e9ce97d7549b70ee4abbb13ff0f | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c2db2167a899197938f03b94fc2bd76af5d5620c | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4a78240819010502c30029bb36fb79d487c1e295 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f287a8f713a4dde7ce61ecc674bee2070efbf001 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3a67ba173659e7c84a01648c9b50a5a01724cc3e | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/79a52e84400c8f23319898add3d53f37a02ee741 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/9982ee81487c596778d3061dd1f3195264eca49b | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/89ba4e73902f1dfa214d7b6cacc73ad994f4cbf3 | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1bbf62da4dd13f6417bd119be7b454eb2d929a4c | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2dd3e2023ef70add354045f7710d3e8b5a045654 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/369dad5ab633879d404b65dd7bfc99e0ef1b89e4 | ORPH
     aarch64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/dbfdd5771d03dc8ea20dd0bdfed9f8f87aac754d | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d5711110ec4dd50de0ac26917aa99be08684aa8b | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3b81c6f3e7001577ce28d2598f34dfa87f28d85c | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bab49d718fff71b5aea5c353ade5240b3b22d9cc | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3b3d5a0098075d0bac691a62627f2da10a29405e | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b7dbe46e89ea6a0f90092922ce05ca3b63750afd | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/68e3f8e9112f90d69f89ea699c854bdb2b966b89 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b62c51108f6f4ee5261155ad4433a68a79358164 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ebafcc7711b5e4f22483fb55701259e1aa92a28e | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/10a5fa8a09cea22657b65e3e34b5ebd5a1e8aa0e | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/78ae6519b4742fed63499875759f975062780a13 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ab1e37550441cacd3b620f99953553b8623274fe | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/23c8461baea23b5d994dc2f7ed515bf479f7dbf2 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/259f1ef299ba67753741f4dd3493a4b703ebccd2 | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/eccab1216dcee6f1cfb04d0f0ffd2d4c6d4f580a | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7c7f54ea789501d0c9ffddce0866d6de1e219d48 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2e3d41c6a064e0f4e019f4e4057df58d8ceb48e5 | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6ead4312357285c1d3f293f1ba09607609f6d303 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/581bf19edf959ecaf3bd5b2a577f926245b7e858 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f4928fe528b65e364b201ee6edd76535222dde2b | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/826c4592ab799560a11a103a351bc2553938a2ee | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c7bde8b810b8088c3aaed104c72c6cf530ae8c0e | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c63bba86c0be3e8fd662897c2dfb71817d75a280 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0eee6edfe17fdb59f6833c4e922e7f77f3baaeef | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8968b98752ff16ba21004203589b96f828f2777a | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/09388dcdbd73b2bfd5c140741556ab2b81e740a8 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c4c4051d9f1702eb5a8931f7fb35e8cd2b05fb16 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7384338323fc86045a7b1af012568aea90a14856 | ORPH
       sparc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a7eb08dccba7979ae1ca2e8e5b1cd09e4f574a58 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/532f78c6eba813d9d8cf2d437d4c5b90cc0ece30 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d35fd362e1eb54e1fe9b5cdccc8c648397a72a9c | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a9dfd3da6b4dc8ef7794bbd40ca3d4f97dafbf09 | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/83dcdafc0cd1c65792545685d01eda59be3243df | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/22b2d7cb5f89b4a5133452c7b5522039fc594763 | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/028aead49b1f65409f0a052392bcafb700881e73 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7b1e75bfb0ea31f7e34d16d573db0845750758b2 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d9cc27d2e0ff0f8a730ea1265b0bed257fe40347 | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/873547e8bfeb58ca55ca6353c65a9cc1c4c1b1f5 | ORPH
     aarch64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4e0b9822f42e84cc1dcfe3ea59d3ebaaa1264655 | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/223a1922a46262b74b2696c3c9d5141d727595cd | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2ee24a4b22279ec6bef102b9b8bfb6b105abcbb6 | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/88bad87be6911d7c5b51f9bff6366d8eb6efb049 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3402357d8e90f1866dfeaee7bb61119d80dc8bcb | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a23641106684cffa3d0f609f117c10837266dfd6 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/594d86ee1df97abb0bdbe9293e1a5eed2181a76e | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0f665f75d67a361e45857d36e766c85aa69b3ae6 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b150c531151b5eb862daa949332c8ad6aeb79058 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/57ac0199e33fa001a24c5472628bf9d8407e9d8c | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/69b18c3049b924b29e6ee9bf1c6ef2d83135e084 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b7ac1d507bca30c3dcc85fbdc7b905d152d5c6bd | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f84e33fd3591e94ac7d2758b9405dbc92ea4ff43 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bdbbead9bb9d036b0288034ed6076ea1489a72e1 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f02d12f871ddea92ba41d6d44fc8ba22e5cc57c0 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/29c8e8f9ba3a2f48a9e34e520ad3287fdd988065 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a927f0093f9564828044cb271fc2b0dc3f783878 | ORPH
        mips |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b3cce76e0cf0fc8e0af2d5329525ee698cb136cd | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e95c3950404a0cd520adfda47de2c3e7ac1236bc | ORPH
        bfin |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8cb8b3137a9e59f0e6bb3425aaef5b0bb2b613de | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/79fd2f5ef2b6d9f19b4c66a4b50fd8cb83deb8d1 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/11c3753c59ff8f2cf468455266f058a001f083a3 | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/95a42888004d63f9ce0aaa5219ba23e3465d39ed | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/41887d3f67b4a8b42a067f0b77f2db1edf649751 | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/16d981489f2351b9a6125605a593c3ccc070bdc9 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bfd494f58487af1cb8c550e04f0a2f8c6d79ba06 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8575bdc4bc4e73bc3da87ce0848fc41d389ea5b2 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f002564cb7b4b0730115886d75ffc30a53ad6db5 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/61b8ed84d32969a0019436d33303dfcbd3414445 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ec4c9ec697873a136fb5d834e6c3ee0ae590c5cd | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/16b8200c22b2762750970b0b64b6b035b48fd23b | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/28ccec88dd09fbf44feee5fab4997cf1851d17d7 | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/357e4d8f4e1520d169607a6dbb8a242fb1a35ae6 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6d3d6cb45c0a54965e3b0841c70ff430be1ab795 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6231be3c49b0a4d67d607c5878cbb26372538501 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e1b60e7403e7d031a823caa1b0604d436b2e3dba | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/31eeac952877ba787db3d653232022da47112684 | ORPH
   powerpc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/07c7d05e50a3c25c880cf55f5201a077407f9f60 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bca670c80d03e0b4dfade545eccbab9f164bdef5 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d6a68d09aa7d8c92a3340e3a841452d9b39ade93 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0f5fab7b1dc9bc310a07adb144661d9f2f97f42a | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6085a520ea37c23808fa026848185734c45d7f3c | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7f4a1695228bf3685e5818583b293d3dab41d18b | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e96c4675e1dfd979125383a930cb240b287444c7 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4be50c6cf9fc72f60fe57b98aacc1117dfb78f52 | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ae9753f8ef348693b72e708d11e58e5cd9e7d080 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0d301ee1dd1e3e5f6fd6780d24501b8e213530ee | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/acd346b3f09283e52c298f5e035f33a2fb203a8e | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/42c61d6e78f7acfdfd1fa0d44efc286fdfaece46 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c7c73bdd6188c3a73af748059cabd7bb62c3dabf | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/414cf84c8727d1197a910fb9082402f9e9e4fb25 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b12d7067f520485fb7c9c6f37db449bc5735cd8d | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b827228fc79ebd62ee11bb181c5b587008ac86b1 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2ad75d9eaecfb60e4649e9a9b9ca48b8a3854c24 | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/34ab0d738f8ff69fc8b4cd289943dc625258db1d | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ab45757146b78b0d3d989ce4d1e4822c1e4cec20 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b6002ae49c54ce38c4dae431604a810b5cb8115f | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c421079fe0ae4d343ca3b3c43719ae3e2f68d678 | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2cddafb591049e8b17c8263fa6ef247d507e6192 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/36a2cf2ebf45c2cffed4e1524e7b8e7820b14ece | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c20fe3232f4ba9f490bdc1a8ee7455a56e052325 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/63fadfb3b5377a2880c3511c62aa3e9a77385477 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cbf3b7d21ae438cb2456628a44493217f048209e | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/798cdc50ac956335542241294b106d7c1bfbe567 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/372e3152f7a3e617bcd0d5b89cd466b683192d12 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ff268da36a8eb522d8b44bb38dd514ee7036d0cc | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/dddf291f25213a0ba7e46482998887ff5644180a | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/352ade02be72c6de985f431b40fdba7f2ca5febe | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1fc77ec7f581cf3f0e2cf8db3a9e97056ac852de | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1d22e4c6fc63754ced7366f7bcd262d83e81928f | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/82dc4e57f82a8332da678f5c82872fc2cadadc03 | ORPH
     aarch64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a6b62c2503cdb5bd2aae28325a091e4c0ab27e76 | ORPH
     aarch64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8ce780f68a07596e2b1a46173bb1fcefe58a4539 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4473ab282dbe6673f77d8873f2f44c19fbbfd367 | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/60127298bd61bb754f756dbe5323131d10e57600 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/883adc72920943ba4abda76865ba29129803f957 | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ad21e0d3d5c8870abf7477b066e18b830e6b8441 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/63e66c6ae6819352a4f9ca4251668f5a18ee566d | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/de2c9d90aedb974b903d2c874f181aec360c611b | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ceb83706ff314f425d50c75fd98fafd28b0102ae | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/418530710a10c5dbb66baf89f95da2aa4ef0a39e | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/844198906eafedd691189e34d2eabed397910c6c | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e24fe68e39b3b1ba54be4d2535dda39572d37851 | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/abc81d52a08eeccadc6b19db74b5a1a164450c24 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/523db7ea9478301cc11ccc63f1a97e3ba271799f | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/46a3ca973db7479676fa0bc9e1abbf2e705d2a7f | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/21866a94fc3caa44dbe4ed7ce1316c5122867808 | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4ce384b9cdba75549a6698ec71b22d0e1f89e120 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/818a47c24335e749aa944f2dcfde9fea79564718 | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/de1ec2ced4f7ffb3b4143702d7b38a12caab984e | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f637f4d2f72b9fee3e00ac8e12a4b8786fae03c2 | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/aff960ad58d0cfcef5c66e2e9365924089e21114 | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d2db227aa6be97e8595aafd71ffa9f7518c94f42 | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d52bc51324f9d5090949661c0c8c55c56684b3a9 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2c214e7fe595ce4c3210446ab6f12cec5770be2c | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5ad50de0ecffad5586e5650f95e5e86d323ae99a | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/2a83f0ff8f56b4801030db95d0ec37ed2c1ef8ec | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b02d0655776f0232b77d198842fd229cbbc59b0a | ORPH
   powerpc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f004156a055dfe19dcd5d4d6f6c5e720e1214270 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5eafdda4aac4edd858a7cb3ca4010bf3c6c0b705 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5bc22018db71f6e19f47647b624ac9fe213f6e34 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6f14fab5b3b033883955c19e356f7b203f0d232d | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/bf33b2da8fe93b47735cb60da14c492d51ee41ff | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b98bed18ce8a4c86f27b8789af60fb0922132d1c | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0e2dc7c444414cae2ec12737d79a9b861ff7af54 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1d30ea89d55e945c1fbc2c34f062664ca62c066f | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3b974a2dc26da9dd50dcc1f92969a4cf40048c12 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/25b6ffd92235fb3c6df85595cc813a5d57a8beb6 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b94395a1a468e4746d34008f2bf60d66d922ea37 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/669df759cd13a393d0f988ec4e338ec1ca30b48d | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ff09dc4bee90bc0609040e91fc403f0a5ae615d9 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/47dc04d77703b2907215b9ef8800b22ddcfb4e6c | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/156e75127cfe35f37aef243f1bc45be7a771d39e | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/53d9c022b075449ff429835f3ba3894386ebaf00 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/952d6cbd8b9fcaf9be0ae4c76b8a9b5ec745c46f | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d1c47c2b3266a94e6cf55dd8dfc39cf903656954 | ORPH
   powerpc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e24f9623c20c4676babb60ddc841c6627ab18d00 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/39d321c4cc85b5506312f90f44b2da46e03b8a1e | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7f19bbc2db9c2c3e4ea055863157808472e7dc9f | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/14020dca0a18cb181c22e17c9feacf342c4b9595 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/72b4a6d64b94c4bf370dbc7dbe8ee2b7713f79af | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5dec69c3f5ae62a2103e551dacccda072e1fa1f0 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/379d7b8a0217ab4ebe33fd530e6912816a50bd54 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4d7939394acf8e79e8adea4c7ba529ebe279af8d | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b50d399362bc7e6f3c7dc1fdfcfe4923acd604a4 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8cc0531692358f7c57fe24a7a325c929fa270eec | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cdf63ad7987eff4afb9de553b49501b5b21cc8d0 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/200afd00ce55528b424fc7e9e1081de99da09f31 | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ec25f0205cbcf4bacfe0b5b53d21163dc00ae868 | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d5680c9d6879b920ba88fd46bd4ceddc2987ac1a | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/765f66e53cf82280f1acd655390592d0f8e97854 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8b38455b1b0988d1b8f7e1ee377b48e0aa4e0e8a | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/22349a11db0d28568f74da93342fe5287507f574 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0c4492159e1f87a3dc2ff6a607f83f1cc91540b4 | ORPH
        mips |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/12360ac81e3388d4bf0e27a2e25a20d60803e4c4 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/37633b93b7e4947103b98864dd7c2ec978dd025a | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0ba0ea7989958f0b82b3c939ed1f50ae88ce41b2 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5764deb23306251cf1b4e6eadb081a50a601b8bc | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d673fc92d6329b1810a9d7edfc49aa60f7481e4d | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/63a85c2fa15fa22b57ebe448baefd464edeaecdf | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0901d3ab308f13356c7961c70b8f6d8ad91e5e0f | ORPH
   powerpc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/50928cccc69308cf7d3953d305470f4d47f5d35d | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/96a2bcb7ff186856b3c968f1e1ead1ae3ee33c2b | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7517869f1bf959fa364b86cd2c7cb4be2242e992 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/fdf2b5e8d27d9069490284be61779251f6b51058 | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d9a54f271ed596869920754df46544bef62e0260 | ORPH
        mips |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/fa8fe66db92ea25a0aa148d9e0d5585cfea57794 | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/338b100602c7b327e50f08731254fdec7b24357d | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/8b47e24edd109f030a803ccccf391ce3608f3efd | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d5cdbf7c279e114ace4d34971c4b2ffacf70cbf0 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5e335e6c0bb6bf6919c176bdffe76d854aa91643 | ORPH
      xtensa |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/68342d896db89631b7a4303611268a37c2611ffa | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/fd47593b87eaacc2a906688de0639642b4f72e60 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cb008b27b41fc269f288d90fda8e9ed56ab68592 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ac3c9d477291e3b636f12ca2c33868e2dbda6457 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/82fc1022b1daa7bee61c497cedb6d8eb96c0be4c | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/b13b575a4e5fdc536c59d604f91472b44384ca91 | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/02efa0dca8de2efb510e17d0ca757cca9a989e7d | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f71f5548061637c33ac82be93d22d303bbcd10c7 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6ea45abd8eaa1124d89f699f367d7da214e44bfb | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/03842a04d9adee160e3e7d8680d3b26b83ddb81c | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1e83564b83974a7056fb49df5890870a3810d3af | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0cb6c91689d40fa440c73226a6dabd49d5f4fbda | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0058fc2054953d068760192da80951a21f95bb47 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a2e4fb6cdfc20fc8e6abd8f1623dfa24b20594db | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d0f473e7b9e6566bfc48abb92b5e4abe2a4559ae | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cd1b74d8adc13215ac717da180c3ae9854f96ae6 | ORPH
         sh4 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e200804c1580bf2a7b30f50a14e5f8da96afa24c | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/7f0c2ff0b4326da9bb4883b62c3e0fd0de101191 | ORPH
       sparc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/686b32ae5bc38857b9ea1794622fb69660aa4867 | ORPH
        or1k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a8ad27dfb2abe0b1cefe29403e9719fa2ef49a7a | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a18e690e7ef14d726bc9fbe762e1e9f135e0ce65 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/fc62d345f84602726a003933cde3f6d28693a85f | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/4009eb886a54199b1c41609c7d30469877279fe1 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/750975d6fc46e54cbb6c077299fb1bbbc172eeeb | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e1e5aa05663240c452a971a9ba389e91c588f5d1 | ORPH
 powerpc64le |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1217498768f421b9efd95d851c936add49f95bb1 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/e36772ea017c22f210d63f96bd5f0bb580bd0f5f | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/3126edccc65b6b995e26689899313dbfb074abeb | ORPH
         arc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/0af1a2c6d5fbeac6e2aa83575fe6de9a9e1a4cb6 | ORPH
       sparc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/08acb741fa44fe8ea410fa655c91501c9b322f9f | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/738ab4be766a4ca4632382eb86645411444a2148 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/413765d079ce64b218bb825f9f767985aaf7d575 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/50ff3ba05de0f78b348e2ec8f9835ef90c6b18b6 | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/45d6a196193589080b1be762e76a87da91680a3c | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5c3c41652ffc233a4a187ca0f0437e9bacfe7a59 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/5fca37045449c15b67af34ab4fc207e8aeec44b4 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/a510ed14c59e078f55cbb1719fda64b9858f81fc | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/9318611955b9bc2b2124476f9b149d5075ab4d25 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/1d3bec7ea1729e69efce93113163e852b0c53622 | ORPH
        i686 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/ae9e8aa9c9d03c3578e50efe366beb52324b5cb1 | ORPH
        i586 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/6f4705686785a2c3ed5e9e81899f86ad5940cf5d | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cafc9acf05cc218e390a751ae25f9297b5a2c5da | ORPH
microblazeel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/f075587b50a0470300adc728b6145a435e98dbb7 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/32e7191afa8b71f6020e03b13b60b9dc8971628a | ORPH
     sparc64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/07471b1c67d480391393bea9e8cb53c8b4384685 | ORPH
      mipsel |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/82d387167a43b2ad40627d9976dce15a1c79c51b | ORPH
        m68k |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/805f29b9f49b6b38a15e8fb78f569744197b2dc3 | ORPH
      x86_64 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d74b61e303b078451b633fe146eb6ccf0ac8fafc | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/cee28f065aaab6ae96657c931200de945ff41914 | ORPH
    mips64el |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/d46aa7d8ea4779a27ae26136e357cefbdb32ed23 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/270559b6c7f0e704a8d90a496d34e07f02b703cb | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/70ce970f2c46daa875f14429adb34188ae9b7fa8 | ORPH
         arm |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/256812f77ec31d2956528d1a8191be537de4261d | ORPH
       nios2 |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/c9cd892d24e209fb34ddb597060182e9fa9308b7 | ORPH
     powerpc |           host-libglib2-2.52.2 | NOK | http://autobuild.buildroot.net/results/eaf24a7a44b81468d2f5d0f0f35351e395b7deda | ORPH
        i686 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/2fa24857d03688310eb1d5e31e5a41e4a3d511d7 |     
      x86_64 |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/a0bb59748df0ffb2b819ec6a2915a242ac6abeee | ORPH
    mips64el |      host-shared-mime-info-1.8 | NOK | http://autobuild.buildroot.net/results/b97b1daa64106d142d026f5c45d76ec759fe4d8c | ORPH
       nios2 |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/ee927824e73193c0d80531068fa161519f519270 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/9fc4ce296a55b31114603512b7c7bc39b1b3c26f | ORPH
      mipsel |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/01c715a415550b92ff9bb491c64254b296d61f7f | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/8ab2c501769d7d15d634b92d84f6dd2f332fba34 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/e7dfffccb0151c3a0205577450924e5c8441935b | ORPH
        m68k |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/0bed1e571b142dafc37d8fea342c7ad389be703b | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/a8f3c1f418afb3c54bf46f5b78f70b5473ac5724 | ORPH
    mips64el |                 libcoap-v4.1.2 | NOK | http://autobuild.buildroot.net/results/1ed062c7f167bf9cb7a0271917d635a85438416e |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/895452ac973cab0e0bc22636d39cbec7fbf598d3 |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/ed34a3e4db000773b33e75d053aeab33578df66f |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/c82d0173878e58f7192d3cec271b45763e6ea269 |     
microblazeel |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/85cc1b650fd95df8122fe7ab5ed8982a85813a28 |     
microblazeel | make[2]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/63388ca5432a16d54c216786e7d21a18bc4e7e4e |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/eadfd032e7df9c292386c4b8680cde0c6c53c213 |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6d84a88252c038e5ab33238283bd4885acd6f0a9 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/a7881947629351729024b1fc67c3362073d0e2ce |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/dd7f1bf4a3c3e47176c64a8ee4074b9a2f829970 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/057d72bc84c467973ec3c076f5d8108e02d6e283 |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/360af3e7ec2e20a2e8110b30373b9024a728a22d |     
         arm |                  msgpack-2.1.5 | NOK | http://autobuild.buildroot.net/results/e195573e8fe56104389bac5fec7b0781fc85e353 |     
         arm |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/51deb9f046b1e8c7f0bc5749e9a5a9c2f3f16f08 | ORPH
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/b05da21de507c4680f0be6ad36343188893941c8 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/964591dc247c6734351f4166059590c8a44fe6b9 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/781a82dcd0bb32eca2e83d67c80ea7ce2e67f91b |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/3a6ccc1a9959a5a67ce6ab18bce469bc2986ba00 |     
        m68k |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/32da9c6a1016652a90105c289e7c4d155c7da054 |     
         arm |                 openjpeg-2.2.0 | NOK | http://autobuild.buildroot.net/results/24323ab67ca1606cb6d1ad1db8199f7345517e86 |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/2174958041c33097e8bceb71f3502d8ea3d3219c |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/0a3deefb517c6dd8761d561d328261e2bfa5765e |     
        bfin |                 openobex-1.7.2 | NOK | http://autobuild.buildroot.net/results/ba058426e2e570698dfc3fb84c5f04603c541e79 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f58dd54c9d02912e0728e834611dfad5a4fcfda2 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/33fde7180701fb836ff69c2c749e082ae7dbc183 | ORPH
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/5a31da3a7700c4e5d93791e806b0b8333905a65c |     
 powerpc64le |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/1a9a1f430ec10721ccd460410d089253c07bc608 |     
        i586 |              qt5location-5.9.1 | NOK | http://autobuild.buildroot.net/results/a6080d2f95b5c7b29bd73a0698e8af90863bc60c |     

-- 
http://autobuild.buildroot.net
