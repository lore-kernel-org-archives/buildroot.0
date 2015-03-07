From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  7 Mar 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-03-06
Message-ID: <20150307073020.C6D511011A8@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-03-06
===============================

        success : 238
       failures : 117
       timeouts : 2  
          TOTAL : 357

Classification of failures by reason
====================================

              host-cmake-3.1.3 | 72
                  uclibc-1.0.0 | 8 
freerdp-b21ff842ef3de583751... | 4 
                collectd-5.4.2 | 3 
                     vlc-2.1.6 | 3 
can-utils-002f8eba8703e88cd... | 2 
                    sox-14.4.2 | 2 
   libnetfilter_cthelper-1.0.0 | 2 
       erlang-p1-iconv-dff5ee5 | 1 
make: *** Waiting for unfin... | 1 
         conntrack-tools-1.4.2 | 1 
               batctl-2014.4.0 | 1 
                  weston-1.7.0 | 1 
                poppler-0.24.5 | 1 
                host-gdb-7.7.1 | 1 
                 mpg123-1.22.0 | 1 
         lua-periphery-1.0.4-1 | 1 
           heirloom-mailx-12.5 | 1 
               host-ruby-2.2.1 | 1 
                 qt5base-5.4.1 | 1 
                   mono-3.12.0 | 1 
               libecore-1.7.10 | 1 
                    qemu-2.1.2 | 1 
                   slang-2.3.0 | 1 
                gptfdisk-0.8.6 | 1 
              lbreakout2-2.6.4 | 1 
                espeak-1.48.04 | 1 
                  snmppp-3.3.4 | 1 
                 webkit-1.11.5 | 1 
                host-ola-0.9.4 | 1 
    libcec-libcec-2.2.0-repack | 1 

Detail of failures
===================

        bfin |                batctl-2014.4.0 | NOK | http://autobuild.buildroot.net/results/37af4e1e5a8a69dba2ed8ecedec68b8727927ba6/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/8f52839127c2c9a6cda6fb9bd7a44ad4d1d19fd0/
     powerpc | can-utils-002f8eba8703e88cd... | NOK | http://autobuild.buildroot.net/results/8f06dc86c698eff1e49c3c74b028b90c7eac51e1/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/09924cfeea2021a24caf80ebb9f9aa173b20ca6c/
     aarch64 |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/1864746fc9025f1062a3bc97249440212e154802/
         arm |                 collectd-5.4.2 | NOK | http://autobuild.buildroot.net/results/018ceaa2e9cf0d97f70b8a608bf75e9a38772877/
     powerpc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/233bd7e17f288ae85dc274aff7a23203c3cdbbe2/
         arm |        erlang-p1-iconv-dff5ee5 | NOK | http://autobuild.buildroot.net/results/7aaee4a05e010996f9932f6a6f68da7ee6c3c5e2/
      x86_64 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/430b2ad4e394501d0220b1ef21fdaa95b8240cb3/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/6e512c19460810886664e2462aba689623c198f7/
         arm | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/d15652fc851c34702ddaee0e554798f9c0166fda/
         arc | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/fd5a6d6268aed262df3116eb874850d1789dd45b/
        bfin | freerdp-b21ff842ef3de583751... | NOK | http://autobuild.buildroot.net/results/730de618a49539801ae3a48058845067ec889bd6/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/4b75f1c015ec924d51e77453c33d934bb3f96870/
       nios2 |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/3bbe8df67de39b24d32b7a84752f4eeceb0c487d/
       nios2 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/283a094bf8617a0e9c218ae5812ca34cf6cbc14a/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/d06dc90cbf33ef45b6ba60b34caadef86eef322b/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/5ecede138be6067d9e84e6ad16184ff93478f3c7/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/52c1a2504ed057b16a1bf31025f921e97d8b7b12/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/765885b04142a37f18c492d4dbd9dc512724f19e/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/c517133fd02f20ad7e28b4506a6161c9b0bbf78c/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/822ac886f1d9fdcae9bdc0899468cf07d859729e/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/dfa8970fa5481a264784bfd04884aab5175141b3/
        i486 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6ace702afb2570a5ccf4703bde78e2ca046fb51b/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/83a2a4955195aa2cb176138b8d0cadb56ae48262/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/97c3e1822ce8805b7aace19cf52346a0c042d74f/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2017c8a451562de646ab4c0aeb75b64c2d494bfb/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ff10815e690b4e3f29fbae61c8b089bb18455671/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/4706fee9f6f4c0b04691a70a394bb17179f6efb0/
        sh4a |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/0e65512d42e8f96234bfb898df9da6ba6e892c0f/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/711858aebfcbc669e8aee0f43f3a6c15df6b1001/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/35e9333f6267f2c5e0ebd4985bf2005d78be5179/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/371251cdbe25937cb139d571d79091e5dda2ee5f/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/dd75183e702e52ff45e6ce185f3cdfd30d7a49fa/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6448745bf7a0882c4a4b1e697cb647707604e960/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/41880fb0f04d816bc83010292bb8dc6e45e643b9/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/22d6fdb2e901834bda982cfdf78ebf213763fe8b/
        i486 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/125a0ce1a51bd5efbc2043a3c44efae039f5986c/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2d575a5ab29beb9c9fc75e54c8f2c0eeecc37c62/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/00f46b1287bec198aec12b1aa8e6ecae91b6a9ff/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/9dbfb821bbda8a2fbea4e8cc4235cf4b3c38c8e9/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e2261d6482b4dd3d78d1535a428118685b7755a1/
        sh4a |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/79b734e596ff4c396bcba2d52f9cd6afc4e7e481/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/927b11a17479db1538564fc8695e390dd10a4713/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/4e0a6c6a3a9b9d5ff3f93e0a6c250ca22429f600/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/d47c1248f81bf3913f9fcc68f916978eb69c09c5/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/72bf98e5b6923e4f7c263b0dfdb163c22522e181/
        i486 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/3fc57e4494e171c87770dfef915ec2da2df18163/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2cb1642031728b63f79e41e81ae01b193ab6672e/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/012a8d1de4b1207f5049f917fd85ac771b3eb785/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/fbcec4f0d53d07b23e6f1043171543876870b434/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e5262bb80dd528b257249a2b750e337829dd1b99/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/1881468c32f932fd9ab02ef2b794c898cd7084f4/
    mips64el |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/68650d3a1651ed299bd830f2e2f0a099de102efd/
        bfin |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/18f1f88ec2b1dcf858432be504b657d267629621/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/2fb52fde7624f4b067cdb0ae3be23590692bd6b7/
microblazeel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e785c4f73da5acef137b9faf1fa0c6f90e9914cc/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/be839a6cf957564743d9fdb3564d1e485ea6a2e0/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ffe49cf4cf0b2f14949b810af0f4f37736c5cdff/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/040bda36a073ad3d970b23e4749ae615ddbcf006/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/1805e83f815ef1a508cc0eca1c3e19eb60912e10/
         arc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/d98ab9f6e852535b91321658e9e57f03f5aac037/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/fcd8113a21e2592dbb2c3c79b8b7a8d0df144af4/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/8ee348f3e9a562faac6f5f17d268f8a8c4e46925/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/5f37fbe4cee73cba4a8b0293bbcc5f48b3554982/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/bcb02d22ebda55cae0e1fed50f5cdebd1e3c3578/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/dd1f1ff978994e5ede09305660ed7faaaf602f82/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/885abe2bcf8d6499d3f32ae36aee9ff6c4fdcf90/
microblazeel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/258474ab86ba9fa0dec4275a77b8e4ffc36217f5/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/ce1d0a597912b126eb8a4d557bc5b2d832437014/
      mipsel |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/06b8734268544e6437357c513763535d9ccabfd5/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/70fbfe24a2860e39025bf6f69ec0b3715c395b59/
     powerpc |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/b57271760c5f506a2f51d00d9ca5b2c32cdb3ecd/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/6c98d984a32dfb39b81b7d5a1a7db3f9107fe048/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/aef38353564f2c17d08bc848e302bae899b34389/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/b18e4e5faa18676d6f165efc56bbe3b95a12d5f7/
       nios2 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/c7a7d3e297d51062c69e3d5a926c28bf9861a8cb/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/553f38aacefa26fcfb6d0b15a94f4883d00aa185/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/a2006df1f5a7d0c0a0209e9a19530544ec0a8ae9/
        i686 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/58173e374f0e7f0ddec5f25133480d280f1918ad/
      x86_64 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/081b941f0d28f751bd2c8c00e13737fa6d20dd9c/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/1ddc210b24c32b1027fb9010d6cb4f42c2f7ceea/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/01c653c48417b9ed2dc7fe597e0b51e07ad4ac93/
         sh4 |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/4ce6a609e7e6fdb5b1b0113ee481faacb4706972/
        mips |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/98fe30a21b63e61278b9da04ac052dd608a5c742/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/e8715bed65bb871e9c2ac45cd61b1b452f573fad/
         arm |               host-cmake-3.1.3 | NOK | http://autobuild.buildroot.net/results/8792c1fbeb64cea69d5b7341fafbb006662c1ad1/
         arm |                 host-gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/a72475004101afd9a43015a14ea5fb68891582a3/
         arm |                 host-ola-0.9.4 | NOK | http://autobuild.buildroot.net/results/41c554dad68a158cc7f6a60305014372dc736612/
       nios2 |                host-ruby-2.2.1 | NOK | http://autobuild.buildroot.net/results/58a72b584e8c1374b59925cd90696d79f24a43f8/
        bfin |               lbreakout2-2.6.4 | NOK | http://autobuild.buildroot.net/results/f20b57210637727c52da4dd28648bfebdaf3965b/
        bfin |     libcec-libcec-2.2.0-repack | NOK | http://autobuild.buildroot.net/results/7c2bd0656e90ada23f1ddcc25b9036e0c433c303/
     powerpc |                libecore-1.7.10 | NOK | http://autobuild.buildroot.net/results/c8ead966e2863c6d9950d04a466c0d5d59ec6875/
    mips64el |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/372327809ea93461f007e7f1ed8824e86b9f4aa1/
        i686 |    libnetfilter_cthelper-1.0.0 | NOK | http://autobuild.buildroot.net/results/6ebda886e3abff16f59e7eaa8eb76eeffc9b160e/
      mipsel |          lua-periphery-1.0.4-1 | NOK | http://autobuild.buildroot.net/results/931ea9234e626cf7f26b45a28070bce4bbc3df5f/
         arm | make: *** Waiting for unfin... | TIM | http://autobuild.buildroot.net/results/b5db0989fdb7b5082e95a38c93629b931c995adb/
         arm |                    mono-3.12.0 | NOK | http://autobuild.buildroot.net/results/9f321b12ad35e25d08bafaf023d62ac41f624e4f/
     powerpc |                  mpg123-1.22.0 | NOK | http://autobuild.buildroot.net/results/8a3a824cba92eaca81b13fb24be92564d6704610/
        bfin |                 poppler-0.24.5 | NOK | http://autobuild.buildroot.net/results/7f5d276e7d7f362a7fcecb93596c8d0e03810f20/
      x86_64 |                     qemu-2.1.2 | TIM | http://autobuild.buildroot.net/results/fbfbc6b9102900b2f7fd438e5d96b626a904777e/
         arm |                  qt5base-5.4.1 | NOK | http://autobuild.buildroot.net/results/fdefaadbb9c6673b4f3d36143db91a508e74cfee/
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/d67bca4ce832be45372d0bc223913145f9b0c6e7/
     powerpc |                   snmppp-3.3.4 | NOK | http://autobuild.buildroot.net/results/f0060c22f72d0daf6503b6f5cd06d1cfe309815e/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/885c7daec7b727d8a7cf47c7576f0e79d4a5ddf8/
         arc |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/8ad063c19b8b0b3e9127579689b4524c53bded76/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/48f37bec20757e5632c162e1e04c07f32333e8e6/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/9db2415cb7c62818645e569113e163faf05cdfa6/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/8c62f67e90fc75fcaaf52769258f64edfebdfa43/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e107e75a9224ec88de7d96a46f99869ebc1752a4/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/b5cafae0bb7fa4a5d74f3b900bd16c44e3c4e5b7/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/e9d775c90c7a92c0979161ef36becd52627de213/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/d816112d661ab02f259420a8dfae82f7d9131e46/
      xtensa |                   uclibc-1.0.0 | NOK | http://autobuild.buildroot.net/results/16818b5995a1be5c1e1c9158eac6cd4d4aa2080c/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/b93ba655b4ee11a0f67c3615fe0de504adce2c4f/
        i686 |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/2439db7ddee86fd8def5a435288d22bd635dcd30/
        mips |                      vlc-2.1.6 | NOK | http://autobuild.buildroot.net/results/daa770256f08b092b9668fcfa768d300b424de3a/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/cf24173f27ccb4babfcbffb1bf4463328690b85d/
      mipsel |                   weston-1.7.0 | NOK | http://autobuild.buildroot.net/results/d367eda8b549b6facd624d0b44cfdc6eb0486c72/


-- 
http://autobuild.buildroot.net
