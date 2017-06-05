From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Jun 2017 08:27:42 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-04
Message-ID: <20170605062742.8397D212AF@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-04
================================

      successes : 249
       failures : 98 
       timeouts : 0  
          TOTAL : 347

Classification of failures by reason
====================================

             ipsec-tools-0.8.2 | 35
                    exiv2-0.26 | 20
           uboot-tools-2017.05 | 11
          host-doxygen-1.8.9.1 | 8 
                     gdbm-1.13 | 6 
                 lcdproc-0.5.7 | 3 
                ejabberd-16.01 | 2 
           erlang-jiffy-0.14.8 | 2 
                 libiconv-1.14 | 2 
               libupnpp-0.15.2 | 2 
                  gauche-0.9.5 | 1 
                     gpsd-3.16 | 1 
               iproute2-4.11.0 | 1 
                 mplayer-1.3.0 | 1 
                    mpv-0.25.0 | 1 
                openocd-0.10.0 | 1 
                    sdl2-2.0.5 | 1 


Detail of failures
===================

         arm |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/a7198f528768008cd6c340ccb5f199eff31426ec |     
        i686 |                 ejabberd-16.01 | NOK | http://autobuild.buildroot.net/results/a502fbbb4b5e9434b59bc2b7342eadfba730a95e |     
     aarch64 |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/5c045a517ccdc97244a4cfca54465dc8d5fcc717 |     
         arm |            erlang-jiffy-0.14.8 | NOK | http://autobuild.buildroot.net/results/053a3efcc9549d7a5e49bcb810aef0e82d6e5f24 |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/102db43dd03df08ef5ca0433de5c36350a03faa8 |     
     aarch64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/b798385a2fd9b5dc9b59e499784a22114dc60c7c |     
       sparc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/075f8c1e266e98c1d98857d83733d78b104011cd |     
      mipsel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/9df15db6c352c0e173ed953c3b5d14fe196af79c |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/d55dbcf88d8b31129d1ba50aaf37fa9e36f5b895 |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/e54eb70f0fea90d51f9456244507148ec1e96453 |     
        m68k |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/55b53e180d3179df3f5b0ad94984a8d6149099a4 |     
         arc |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/94f2c0aaaee8a433f4925fd30ea8eb3140f58192 |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/0f985993a0c0076f027cfe25bb13d6b85c644c0d |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/f1563d06cba7af6b291317f1c88b039d68f2f20a |     
      x86_64 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/909a269cf552a746938a227bbf4aa803788dcd5f |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/a56c8a8a4c76b7c359ca7f5252be93fd70c6a4c1 |     
microblazeel |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/570598b23b5937cf2adb2e3d19a5d10543276b73 |     
       nios2 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/5c3195c419efd1b75f5d53b74bbf8588526e0892 |     
      xtensa |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/b42803afa73a5039e0706f6f415653a001f130fc |     
    mips64el |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/037a80e7dfdd2db381f43a5a074d9289bf68a2ab |     
        i686 |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/36aab016db9dc87803c6d4e044014df66db804d8 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/b8a7300d5c599621c5c3983d20b9d545a131ddc6 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/c04ac4d0dcbf8197fcb2f8a80927d8b495d8b0d1 |     
         arm |                     exiv2-0.26 | NOK | http://autobuild.buildroot.net/results/bdc95deadc8f6364f0f2df5a52545e8b1b621404 |     
        i686 |                   gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/f396b996a59db79f7a0926aec49c488c3a2797a0 |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/ea625ddbe5a5e4e173b80cadde11e43431f49106 |     
        m68k |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/68f72fb93020c062d58b5b548efbcb2889836c3e |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/f3952dfe576272c8ea4eb2228e2731aeeb217099 |     
      x86_64 |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/25f325d21c51f09aefc21cad0e7ec41bad2e3c6b |     
         arc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/ba6d3f28d2f0441c37f56961c36b06d2e3353ddf |     
       sparc |                      gdbm-1.13 | NOK | http://autobuild.buildroot.net/results/4ebb8c47a71043470ce3fc626ac10f02902c2a43 |     
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/1723967ec96bd90f7b4bd209d34367d55faf59b3 |     
        i586 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/e551f4ece37fe7449aa6a72b6eb09b6aa3a8a0f2 |     
      mipsel |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/f00e2e151eab835fdce31457af0d78a504b177e6 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/4a64bb7b371833fc94f6ed70ceb3ee778a1389c6 |     
     aarch64 |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/46b30c8981503af3f1352804c01fbaedbb550ad8 |     
    mips64el |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/70ff3d221c3d6b5c859bb0b5a6d305f8ab9b2674 |     
        or1k |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/365de5e7d9851dd7cc2335fe7457fb29a68636ab |     
        or1k |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/43de5eb7282ec8283ad2744309b91addf7cce0d3 |     
         arm |           host-doxygen-1.8.9.1 | NOK | http://autobuild.buildroot.net/results/22ded20797705b20788a41e447d2da9c3599556b |     
        i686 |                iproute2-4.11.0 | NOK | http://autobuild.buildroot.net/results/c779ebd1d10f976f667cf480036b619e975f48b7 | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/0f414eb99d3cd81f9bd59f505f7836b42c264e50 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8330aa0d0bba1a902b61b67307b1a1b6e63d8bee | ORPH
       sparc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d66aca6bc1571dd64255cef632526d52fb63ab20 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/84b15d2d146cabeb05e5ad939e3736c217ad58bd | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d7c4d07c681bcd3fe5ab5b8ba4998499c00f26f2 | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/d9149ce068f0b3a453a1803a1bbc3afe45f1f95a | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9052611f8d0c25e50c1585a7166e338a9bc5c3da | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/96e6125aa1a245d17aaf37087ee855b6fc4313ab | ORPH
      mipsel |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/4a3b58b20a77f77435889e0c7b186b7daf1feaa4 | ORPH
        i686 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2a4714181537345e7f996b5957d6d6fa75adb9a5 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/76b1b8f68b1c907de1461355f5a4c0a780cd0079 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8b4f6fe1968d63c86d0760afec29df7c96f2d21c | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/6ea1af0f4077389170b43ef876adbe2878c0fd26 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/39b14d51beafc002fc1ffbda946c0665bbb3141f | ORPH
        or1k |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b9c265e3921e286312b5bec90b9296f7c4eb39a3 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/eda1d500075b5d1021606885e1eca08eaf87aac8 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/03ca7c8ac0e0ae978f7854e172254d71f053940d | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/394d4c13a7fc1cd325ac9c97c1548f24e1db061a | ORPH
        mips |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/7ad01acb18d428c55843a34994600529d98d6a1f | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/1e015566c981d1c88ea4067ea2bd320b9adda583 | ORPH
      xtensa |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/af4ef222e22bc41bd9023e61855ffd59a4097486 | ORPH
        sh4a |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/538d1532298f8c7d92d2dec6754170a98a8b95f4 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/76d9b683f440d79b6867a8d7c00f391f25f2cb5d | ORPH
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fc599249aa61fe0d04319074da29d64b6b615db5 | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/883c55c21523048ef3bbfd94da50b435d40e9a0b | ORPH
    mips64el |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/06b12074cce6679d9f18b5d0c7713fa59b34f134 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/9315362e598da1dcf6f5356ddc77122bc96f18f8 | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/8bd08023b6ede3f7f2b838ec2c8ff77ee3f44b5d | ORPH
      xtensa |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/fb305489a8b1ba5ec2a55f1c5a59c70720cfcc93 | ORPH
 powerpc64le |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/aa52c06b40b133c54ed360061a8d93658ec6aa41 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/e9c94b749c528fbc970d842ebbd33ab04f3fad1c | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2f13045df72b5eaf3091bd8108459d32e3b8d116 | ORPH
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/248f824f8c937d2b73f7c371f54393e87af4ee33 | ORPH
     powerpc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/b6282c890575c12e8919b2c489465a15cc8ce4a9 | ORPH
         arc |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/7174a56a6e4d00982b663982cac059aa0867b33f | ORPH
 powerpc64le |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/7a4f3e9e1633e0814e4c4acc0fbb2ccbcd198b27 | ORPH
    mips64el |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/c31b4c5511d444ecedc46d7012d3d1eac021f5f1 | ORPH
         arm |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/8833197ca4e916599e764b20c16e67f157b12bc3 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/4ba53c5b38197f41850e973dd06bf806dfb33f12 | ORPH
microblazeel |                  libiconv-1.14 | NOK | http://autobuild.buildroot.net/results/58d5631c851a3f7aa00a6b0b882a3bcb272fc68c | ORPH
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/5d13077e52ecff69068db42abe8b9ff903261745 |     
        sh4a |                libupnpp-0.15.2 | NOK | http://autobuild.buildroot.net/results/634d72309f03f89d646b692f828f7f4619d57cb3 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/97032f3c59c5860a7b0459197cdfe592c00cd5d7 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/cf59d006f478efa25fcf3f75df685215691b3de9 |     
        m68k |                 openocd-0.10.0 | NOK | http://autobuild.buildroot.net/results/a9106df1f64fa1659476f4d3e304f18b801b97ab | ORPH
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/25898b45cefde9661d8ac87dd84bc883bb5283d1 |     
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/21848cac22a101a34cdd644a1b859933928810d5 | ORPH
      xtensa |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/12c5bc9c92f955a683dbde25b55587e4373a8525 | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/c0260e9f01b30ee577b7bdea5e786d82fba8b3cf | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/3345b4a4f382a232fffadf7874db3b0c115c8459 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/76c1d78417347fe70466fcda96539739a04a7bd6 | ORPH
        or1k |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/cfea4ea42540eedb1479dd3e3a090d705303dfc3 | ORPH
      x86_64 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/57d1b9420de0ea469bf5a5ed27a0abbc8687eefb | ORPH
 powerpc64le |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/54415068ec3cbd4ae1566bd3d3ce071a8495857a | ORPH
        i686 |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/a34a51549c5980cf2df61fa5488de2e03fc22a01 | ORPH
         arm |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/a395ca77d502352ec8c41bdc392f35a578bf28db | ORPH
     powerpc |            uboot-tools-2017.05 | NOK | http://autobuild.buildroot.net/results/b983a1093e226db2f0cf05feae8285346313dbdf | ORPH

-- 
http://autobuild.buildroot.net
