From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Nov 2015 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-11-12
Message-ID: <20151113073021.86BD810111A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-11-12
===============================

        success : 131
       failures : 72 
       timeouts : 9  
          TOTAL : 212

Classification of failures by reason
====================================

  toolchain-external-undefined | 9 
                  gauche-0.9.4 | 8 
                   mplayer-1.2 | 5 
 make[1]: *** [all] Terminated | 4 
                  ffmpeg-2.8.1 | 4 
       kompexsqlite-v1.10.12-1 | 3 
Enter file name: make[1]: *... | 3 
                    libuecc-v6 | 2 
               libcap-ng-0.7.4 | 2 
             util-linux-2.27.1 | 2 
                busybox-1.24.1 | 2 
                   jimtcl-0.75 | 2 
                      qt-4.8.7 | 2 
                   erlang-17.5 | 2 
flann-04b4a56533faf8c8228d0... | 2 
libbroadvoice-f65b0f50c8c76... | 2 
                openssl-1.0.2d | 1 
                openntpd-5.7p4 | 1 
make[2]: *** [src/BulletSof... | 1 
                 omniorb-4.2.0 | 1 
                     vlc-2.2.1 | 1 
               dvbsnoop-1.4.50 | 1 
                mongrel2-1.9.2 | 1 
make[1]: *** [libleveldb.so... | 1 
                  connman-1.30 | 1 
                pinentry-0.9.4 | 1 
                directfb-1.7.7 | 1 
                   systemd-227 | 1 
                  qemu-2.4.0.1 | 1 
             host-nodejs-4.1.2 | 1 
                      x265-1.8 | 1 
               netplug-1.2.9.2 | 1 
zxing-cpp-fa34227d26e0b388e... | 1 
                rt-tests-v0.89 | 1 
                minidlna-1.1.5 | 1 
                     fastd-v17 | 1 
                 opencv3-3.0.0 | 1 
                   ushare-1.1a | 1 
canfestival-7740ac6fdedc23e... | 1 
                oprofile-1.0.0 | 1 
                  iodine-0.7.0 | 1 
                pulseaudio-7.1 | 1 
                  libv4l-1.8.1 | 1 

Detail of failures
===================

       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/38994e4a3713ff1b94e95ccd90502dd9e37b79b9/
       sparc |                 busybox-1.24.1 | NOK | http://autobuild.buildroot.net/results/afd13afe2aacc49d0c454d08c5b1d5f92caf1b85/
      x86_64 | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/cc49a834f71449f6af9ca22ae7cc8f6de264f319/
      x86_64 |                   connman-1.30 | NOK | http://autobuild.buildroot.net/results/1573e8b5bf0b6fc4c36c901f68b7f4f89621c686/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/7311382b07bee3fada83313d29004f64911a407a/
         arm |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/0fa78353dda21bd0da822540d57340421b93e6d0/
        bfin | Enter file name: make[1]: *... | TIM | http://autobuild.buildroot.net/results/05d2d80050061e3fe1bd95a9644f4178ef73ef62/
      xtensa | Enter file name: make[1]: *... | TIM | http://autobuild.buildroot.net/results/f34f6c72f3b516ccd647a6513a952311405f16f3/
     powerpc | Enter file name: make[1]: *... | TIM | http://autobuild.buildroot.net/results/a7764851cb97e699dc5ace88f3247a403c614192/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/17b0af640b9bbca0954eca5f91c9a3eb831ac309/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d3f303524062243b9bd9da401fa61920315284ea/
        bfin |                      fastd-v17 | NOK | http://autobuild.buildroot.net/results/fe5605209f78ba32005671ddf9da1a53fad76e6d/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/dd0af977a94c6d456c975fea7d6787c1d6632875/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/d6de300e7e080259db98ce7a345c479a3c7cd45a/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2a5326a32283dc90ba1c3c5b3a0d4c9816980bb8/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/2ab3ed529589f46a14533eea9c6003492ec27133/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/8ef6c1cfdf86bcccc5f47d1fc321e475760dbade/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/2b1da79acb6de190ed36adcf3404af599bdda549/
     powerpc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/26fc02ec6a8cecff7c61d89d62ebb6fd7e21f094/
         sh4 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/89460829a737a4dab19103f7a46905636420b0a8/
         arc |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/be729064c1b5befca4028e35256a5609e5daebd3/
       nios2 |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/d2008b8a186de0b044ce8c9ad696e17d2507a34b/
         arm |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/630b6b5c18cef372f0994fa6eb5a7a1082084eb5/
      xtensa |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc/
microblazeel |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/8afb36606eabdc6ae6e65a28a11877af39f9a7e0/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/5df50b59988c6a63dd729c2c11867d92db7a6b55/
      x86_64 |                   iodine-0.7.0 | NOK | http://autobuild.buildroot.net/results/a39603a143821eb4e07af42ee4ee44fdde02f9e0/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/d9225c15d983c114c06916c698eb6408fe3408b9/
     sparc64 |                    jimtcl-0.75 | NOK | http://autobuild.buildroot.net/results/cdbbbe7ee4f7bc46ed7e15bc58f126174e377134/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/e6cec91b109e9627dd24f6492e1b862ffe1bbdff/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/2ec0a2f2e780cd17a8aba43e0f7c5a34173cd8c5/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/3cc0203e28555b5394a0cad861cda4854d470cc6/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/df8b7bafaca581a0e933e1748552c58529fd682d/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/c828e937db6b5b491c3cb815f7a8b84e2dbfd1a4/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/0405852b6719419e3bff5e3432280a2f834cfe50/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/5fa1f7817c0502c0172a9da52254fb51c043cc3a/
        bfin |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/31874de0fd4a4331677f97ea1270703e3c025c46/
      mipsel |                     libuecc-v6 | NOK | http://autobuild.buildroot.net/results/37fd1fc4add8e9888369f691bb9a30cc01f83383/
     powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/1be55f096ddef2aa38fdba681ed97cf74905477a/
      mipsel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/aa494692a88e7a76ac5b98da62f244d014eec0f9/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/7977453d55c05db02d30a2f885fead3dc9c50c8d/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/c6fc974610aacfbf2145fb9890bbdb81e94ec677/
    mips64el |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/107256ccb45ad8aa05381cab741daf9c7cd055ca/
microblazeel | make[1]: *** [libleveldb.so... | TIM | http://autobuild.buildroot.net/results/48f80ff035f93ea04c255790e4e571521a733369/
microblazeel | make[2]: *** [src/BulletSof... | TIM | http://autobuild.buildroot.net/results/684db4f81e55776572c0d5e35b380d564b4e304a/
      mipsel |                 minidlna-1.1.5 | NOK | http://autobuild.buildroot.net/results/6d233ff068b87d0f1e1b8f915db51533a66f5608/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/1bdb9b14d048d1def38c76ee87a585704eb48246/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/7cbc627bd2f3f75d63c3d1de942893c0fbecdc8d/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/4ce9677927aa15488697e449f93d44becb9cc3c0/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8612c0f6b793cb0dfc6698526d58b6b741acea5c/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d2959610b521ffac0f824c70c6c6396ad360e530/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/9e43cea0ce512be7f70ed910889b890e8cb78287/
         arm |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/331b43bcef31af230fbd9523601fd335a152ee4b/
      x86_64 |                  omniorb-4.2.0 | NOK | http://autobuild.buildroot.net/results/8493494f2442848e83d8a55715f95292e0fd600d/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/e6005e8a080f139d1fad4c3202d4e4564624697e/
         arm |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/fef777d77b8a9b13125475b5812577f138e33286/
        i686 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/c28064f383da1f577bd9227d004f1939daf4579f/
microblazeel |                 oprofile-1.0.0 | NOK | http://autobuild.buildroot.net/results/e4de5660c03641097d580f5a5ec4e590f0321027/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/d40a393de391c04ed7b1adfb5d95719d454c0c69/
     powerpc |                 pulseaudio-7.1 | NOK | http://autobuild.buildroot.net/results/c4ffe9fd09543e11b06fdf761c5e0affde4a3bab/
      mipsel |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/fd231a24abac10f4edb98d66363daa09ad871001/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/1c4638875f3c07cbaa86479f0efea62e2006d91d/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/f730b474946f272a05a13ac93e7979aad0524ddc/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/bcf2fc35c80ee5d98c01aac8e1c1efd396162b40/
         arm |                    systemd-227 | NOK | http://autobuild.buildroot.net/results/2ad675dd7fa206e505de719c074e0eaee6cc1da9/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/0b04af508e70120076f8f2aa2c052ed2042ec414/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/5f662bf256a2bb9be74d533f29bf4d653f413a66/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ece13d614801b84b1d51082f390664b6787d8504/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/602eee432268397e6773edaf2a86a1cc6dfea1ac/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/479090f8a5230e2285f8cc9e86bec1daae515670/
     aarch64 |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/e6193150e590a343d3432d8d8ff2bc5fff640668/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/bf6549af9a13c950a9f423147b397ae6c0062b48/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/ea41b32bfd4adadef1ddc6ff4381a89819ac5599/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/b2dc31df41dbe635fe33b40fa5686f4dd8aefc87/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/59946c728593502e4a17cb7e2d75eabac54db537/
      x86_64 |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/315c80487d2c312af3fddfd4f64c047acc7662e0/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/bfa57c5ee34054c525acaf7c8b9eec0f717feb1a/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/f53653211109db98b4145468e77ea419d61c37d0/
        bfin |                       x265-1.8 | NOK | http://autobuild.buildroot.net/results/60fc8d54ec61c96e9beaa84154fe8d7e61e55d4e/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/9a1156711bc234f5669c09c85de901ed0f687cb0/


-- 
http://autobuild.buildroot.net
