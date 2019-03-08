From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 08 Mar 2019 07:00:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-07
Message-ID: <20190308070100.7EC2F8782A@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-07
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  26 |   3 |   0 |  29 |
   2018.11.x |  24 |   1 |   0 |  25 |
      master | 224 |  79 |   2 | 305 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

               host-efl-1.20.6 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   qemu-2.12.1 | 1 


Detail of failures
------------------

     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/2b24e4c5764e518b52564da792eb7e24139213e2 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/1e7db0aed7ba09c62e023f075bd558ce3befd866 |     
         arm |                    qemu-2.12.1 | NOK | http://autobuild.buildroot.net/results/fcf12c2a4036d61905c598d92b463063baac916e |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

               waylandpp-0.2.3 | 1 


Detail of failures
------------------

     aarch64 |                waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/1585af4bde7e49b7827d48586de79076d2f3424f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

          imagemagick-7.0.8-27 | 21
                  flashrom-1.0 | 10
            optee-client-3.4.0 | 8 
host-imx-mkimage-rel_imx_4.... | 6 
      host-uboot-tools-2019.01 | 6 
                    ncmpc-0.33 | 6 
           uboot-tools-2019.01 | 4 
                  linuxptp-2.0 | 3 
                   netsurf-3.8 | 3 
                mongodb-r4.0.6 | 2 
                   netsnmp-5.8 | 2 
                qt5base-5.12.1 | 2 
                  brotli-1.0.7 | 1 
                       fdk-aac | 1 
                   glm-0.9.8.4 | 1 
                       netsurf | 1 
          qt5multimedia-5.12.1 | 1 
               qt5webkit-5.9.1 | 1 
              webkitgtk-2.22.6 | 1 
               wireshark-2.6.6 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/98db62635c25b7cf85239d2e628cb9bd1c49bfa8 |     
     powerpc |                        fdk-aac | TIM | http://autobuild.buildroot.net/results/0ecfb711024e49890a5f3a32f5c10e7413408bef |     
         arc |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/ef6869bc40382145fad1079b79107275c4973494 |     
       nios2 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/09d857102c469ede1db0bff8aa0dcd82a4001eaf |     
         arc |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/7ff88ae17f7132fa8c6bf1111bf1eb1c12292722 |     
microblazeel |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/1acbb47905930bac295662a0ae7c2f31a2f37515 |     
     riscv32 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/b5243b8c6652475060bae61ef434b26548db4aec |     
         arc |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/a4e16c9a49e3d3145b2bfe947811057ad813e258 |     
         arc |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/5e625ca6b542b73b67993450b19a4bc9405b9277 |     
        or1k |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/f960cbe32d1f3116d3d70cd99163e87d373df5dd |     
        or1k |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/22c72369cd5b7a8200bb03564bdc342ed026ccac |     
      xtensa |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/fe9478402b80d891b8985cf0eca2ee4e6fcc9538 |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/993c0068d0583104742d13a0dc0343c6239ff167 | ORPH
       nios2 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/bc6685f772c984380b9d1631cdaa196442d8c567 |     
         arm | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/00e4e1dc7a400a3a3486ea4479465f2d5445c202 |     
        i586 | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/ada51bcd28de18da5fce6ec3778a6ffcec20afbc |     
      xtensa | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/2be1e1177de77ab85f38cc7087594de8f6c0800c |     
    mips64el | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/058206f392ae2f935f48e2fa2f758429d7475dbd |     
    mips64el | host-imx-mkimage-rel_imx_4.... | NOK | http://autobuild.buildroot.net/results/88662423906b3128e45c4c8e7a1d4ee49d214e04 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/69ac4ca15fb9b8078964fa8d7c2431725b5e58a8 |     
    mips64el |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/fb96803aa932f1fc364d070503bdf9f5e5cb2c2e |     
 powerpc64le |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/3612d4447e32360a364941aff55353044167927e |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/0c86eafedc65c3ed426afba29d95419e568413b5 |     
         arm |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/4aad30f5e20544315b5485c46165a9512eb8b1f6 |     
         sh4 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/966ce425a7c0a6c90559b440a447c085f2c6b54a |     
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3450ff2d191c0a52d247939189239488c98aa346 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/69cb88b5d723adb158640c9454b578b77f068aea | ORPH
        i686 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/70eff5fcf780c9836bb2727d12d1054551b65de2 | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/9f10999f38bede1f54b354890f33ae880c5e232e | ORPH
    mips64el |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d227101ab3fec3be6ff7f1cc6b20f35f17d6082f | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/d01841788c9bf69f1ff9799c35b68458e86d85f9 | ORPH
         sh4 |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/3af90a16eb8f9d48f44e906687f19efffb404946 | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c391e763ec638465a0823096e0063ddd2f80fa43 | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/a4fc804b2f2f18e98799e5cfdfd1e26472411a03 | ORPH
        m68k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/c333e1ffa0b2448b586361eb67249c8c3ac694a3 | ORPH
microblazeel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/b20b5aff243046db7ca97e3cf8d2de993bdddabf | ORPH
       sparc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/70681803d74f3222f5d78d0bc811b8a16a210015 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/dc2ac7f771d324159b717c52cc11cb8d9d7e585d | ORPH
         arc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/0572023bca9694d790509f254b40cbe70c76552e | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/7c9ba7f2c3f93f9b72c2e8a98d2eff5d79dc6d5f | ORPH
     powerpc |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/8b81d1f9e99bbf4f42a36528c9e3217a0ff08565 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/93aba04d6b7972100df448e816729e052548a516 | ORPH
      xtensa |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/676a912a307d7e05d5636cdd6bb2e840a52046d5 | ORPH
      mipsel |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/e57d386b2b2a7ff749e13620549e9077cc8b3f82 | ORPH
        or1k |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/fb5b80f54825375827a2e01daa793d8ead9074c8 | ORPH
         arm |           imagemagick-7.0.8-27 | NOK | http://autobuild.buildroot.net/results/6febbf5e8c9ca718f196e3633b88617564114570 | ORPH
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/9c8fb9915d130da77044a1b333a08bbb215974f8 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/c17573efa26b527520b1043e068a01e26c74b3b9 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/8b081f9f8e72e752fd6b96484bebb63da457e557 |     
      x86_64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/f1072fc37ddac9aed4d8fd5f73bbb08b935b0a32 |     
   powerpc64 |                 mongodb-r4.0.6 | NOK | http://autobuild.buildroot.net/results/c3572bafbff48127dcbc20da2636d9b4b177d77c |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/14e44a5495c130ed28e1f29b5fa0b555d33a5603 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/9585a6f0313a341c345549d9b5312671ee77a3ff |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/2eb39277f8dd62c2e70522b33f012e9a5a470abb |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/f82c9d47e33d85f2752030ebcf14ec0274982a55 |     
    mips64el |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/a2a30a9b558a1ed91f8aa9a0d36e9f6094f2142e |     
        mips |                     ncmpc-0.33 | NOK | http://autobuild.buildroot.net/results/edcf178512df60915e3c3d2efd60d6ee80c29338 |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/f014ce32ab0d6edf8d7aab25a47603b2aec2923f | ORPH
      mipsel |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/3166e69a93e40809a24dd4de9359383b251ae6b3 | ORPH
         arc |                        netsurf | TIM | http://autobuild.buildroot.net/results/db561cb8f1c6e37f29ffb44e519a2918b74bf51c |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/8b3415c5caff62949a608b22df66fba8bd563cc3 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/bcaba08f8b1602dbb8379476a1b606b8626a6954 |     
      xtensa |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/afe91cf5a677f893c2ca32984938b1c32d79531d |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/9ab8120a811e45a7b9864a81b93a4ad8b9ae0a43 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/ea89dc840029ea56be20c93e36830dcbc6ee6c14 |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/8f3f40cfb1cff8a51afb5d3ecc04459c09c6c959 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/37f8879dc239542af3a68d25eb03b0b08945deba |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7fe65bb314a91d2e414a84d086c98cd26799cae7 |     
         arm |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/6900482067a467c2d4e6a6623ddb1c6ca76e7125 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/b9c3c9852cb22937411dafb43f7430e91e5cb156 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/1ee4f4242f31037695f4736c31e4afb73ea49b69 |     
         arm |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/ab8a420d5ab3c727621e98d30494a65b9c7e3808 |     
  aarch64_be |                 qt5base-5.12.1 | NOK | http://autobuild.buildroot.net/results/8ac7f6202e58265809e8a1f29870d4ab092e4bdd |     
       sparc |           qt5multimedia-5.12.1 | NOK | http://autobuild.buildroot.net/results/eb88ce920a21ffaae6b4da78d1bfc655c2401505 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/46033e82adf592c3b92c6d50cfaf45bd58beeaa4 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/dc0e84bb7e5689ec98e053cfe28665a1d63a93d3 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/10d26a39dfe1d0cbc08711bfb65ebb1b3ad3fce8 |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ac242ce5946bef2edd9e899704a0932c6558205d |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5d609d9baf365116d34439a17547d5c254d576fa |     
    mips64el |               webkitgtk-2.22.6 | NOK | http://autobuild.buildroot.net/results/64548feb6335fdf74e6aa71beefd88e723b21ed9 |     
     riscv64 |                wireshark-2.6.6 | NOK | http://autobuild.buildroot.net/results/577fdcf665679688a3c1e6fbf2940bdfee63acd0 | ORPH


-- 
http://autobuild.buildroot.net
