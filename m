From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Oct 2018 08:00:27 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-10-27
Message-ID: <20181028070027.2CFF220733@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-10-27
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   3 |   0 |  28 |
   2018.08.x |  28 |   3 |   0 |  31 |
      master | 207 |  52 |   0 | 259 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                p11-kit-0.23.2 | 1 
       xproto_inputproto-2.3.2 | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/2380f6f87aa7cae9222a1f3065bfdc0b719735b3 |     
      xtensa |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/9bc1cda6acd26ca047a7f3c0958b3e530f35f400 | ORPH
        mips |        xproto_inputproto-2.3.2 | NOK | http://autobuild.buildroot.net/results/66142f3b14caeffe6943b83f213f7da9cf1cdb95 |     

Results for branch '2018.08.x'
==============================

Classification of failures by reason
------------------------------------

               openswan-2.6.50 | 1 
                p11-kit-0.23.2 | 1 
                qt5base-5.11.1 | 1 


Detail of failures
------------------

         arm |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/2268814b8f5a071ecec1aab962b50a1edcb818d7 | ORPH
       sparc |                 p11-kit-0.23.2 | NOK | http://autobuild.buildroot.net/results/6f4276a48f7f156d4b2c8bec91bc0fda3cc59656 | ORPH
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/adf441293913e5d4967485c99a661ee51953b11f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               iproute2-4.19.0 | 13
                  libffi-3.2.1 | 7 
                     gpsd-3.18 | 4 
                   luvi-v2.7.6 | 4 
               postgresql-11.0 | 4 
                 lcdproc-0.5.9 | 3 
                   dante-1.4.1 | 2 
      docker-containerd-v1.1.3 | 2 
uclibc-ng-test-c6d62cbc6050... | 2 
               valgrind-3.14.0 | 2 
              wireshark-2.2.17 | 2 
     docker-engine-v17.05.0-ce | 1 
                flannel-v0.5.5 | 1 
               libiscsi-1.18.0 | 1 
                libkcapi-1.1.3 | 1 
                 qt5base-5.6.3 | 1 
               qt5webkit-5.9.1 | 1 
              traceroute-2.1.0 | 1 


Detail of failures
------------------

    mips64el |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/28e4e6b783312e7aa478d5de89dfe0bc7806b1b3 |     
      xtensa |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4060bb6d6725db7e221bd406bad84b13e44fe2c1 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/992ab46a1cd2f5f4d55ac49065d1afc3e22973d0 |     
      x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/0b90b1aab6aced90feb062c15935607d59202dfe |     
      x86_64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/249cc19612cac73d0c476179a4bf43d6012ccd08 |     
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9223d953403e5ab0313efd46e9032f6f94eb5f55 |     
      mipsel |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/97e3a86d993ccb1e81849fe8a679ae75bb760253 | ORPH
    mips64el |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/cbdb4cc34080714082f044fde7e069e6ab5a0e8e | ORPH
 powerpc64le |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/be51d38facf1d2022fb5c461ecac6d8acdcca1a2 | ORPH
      xtensa |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/b0a6bd0ccc7120d94316de98825e335e92f0369b | ORPH
      xtensa |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/ff50ba805a884c542f9dc606a34218a73c65dcc3 |     
         arm |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/e7aeb773ad240f20f448735b97594ae73ae4bde8 |     
        m68k |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/a13084018f5ff76616cd9cf7d2058eca0ec14a86 |     
    mips64el |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/128fff0b1090c740fc0eb3dd4726e47bd00a1c32 |     
      xtensa |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/be95172703502b69c4c64d3e0a9090ba9705f0c9 |     
        i686 |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/5f74c258a3adafa5aecd4abc378eef0573143764 |     
     powerpc |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/fc99b1ad49080f552ce611d5a7a2f9fe171b5a2c |     
      mipsel |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/4adb17fff6fd837b88a96d920c5b4b7cb228a070 |     
         arm |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/8af70803bd0feab0e6911455c44cc7c83b4a649a |     
         arm |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/3ceb3f11bf3a0a7386f27e5dd9c205ca50c2b73d |     
         arm |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/40a7184ed9a5c37dc4cae5b16119a2933be70eca |     
        m68k |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/6e9c55643b9c6fe483e29d356c697487966f9c5b |     
      xtensa |                iproute2-4.19.0 | NOK | http://autobuild.buildroot.net/results/2d537d9a0ad0b28c1911550db7c7fbd6f60f9bed |     
         arm |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/09af3cdec6e35ecabe97d6d584153317f7048eed |     
      x86_64 |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/8ad119e298806137eaeb870fb65055c42af63e7f |     
       sparc |                  lcdproc-0.5.9 | NOK | http://autobuild.buildroot.net/results/ce0118bb21475e8c674a766cdfbb560656d381fa |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/33db1cb61aa88e677913d1ead72f52fea066a794 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/b41f5105c15f7f286809a21b25d5e225a5f5023f |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1e4c560f04a477dd44a20547e5f77fd1be4cd5bc |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/dcc26bf2cb25d4a95d6a3b0cc02f80954b7a7706 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/a829eb17b1a3b299045d6fb857b0350cdf8ccedc |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/3b0e993c82945e1dade0f51e6a7ed55dea48ab01 |     
     riscv64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/9f81bb47dc7a3684174900b2363b066919303436 |     
     aarch64 |                libiscsi-1.18.0 | NOK | http://autobuild.buildroot.net/results/7ec1e1cc060bbdaaf758c0d55a053247b731e792 |     
     sparc64 |                 libkcapi-1.1.3 | NOK | http://autobuild.buildroot.net/results/d7363402044106b7fd0903d9e46c59d7cf4138f5 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c931b420883dd1ab2135a862fbc131e55b2e5f07 |     
        i586 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/8eb70030f921b9d987b837a3dc2cd0250445a609 |     
         arm |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/cd7575aeac74c8017e28999c6e8af935d9f7b9a7 |     
     powerpc |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/c29b0221bb03d75daa84384af7372580391f7157 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/dd94c1d2fc248a93a84fcd808c825419122d35f7 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/b3ef1af8476774276ea731560cbc4404e9d626a0 |     
         arm |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/2fbd76729f064943998f55d091107e688dfde4b7 |     
microblazeel |                postgresql-11.0 | NOK | http://autobuild.buildroot.net/results/888116916938542f08a64f87ad82520b688cc125 |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/93b2daf46d0886c9a80b80022486f38363ce5f88 |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/f017f0d0a80ecd548205dc5a9184bf5dcd4d17da |     
         arc |               traceroute-2.1.0 | NOK | http://autobuild.buildroot.net/results/bad859dc34d7790bef0e34ede2cecb4e6e055837 |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/7d00585304cd3721550c964015a1e5a183a0fa1f |     
     aarch64 | uclibc-ng-test-c6d62cbc6050... | NOK | http://autobuild.buildroot.net/results/26e5d07f1ecbb934346181fc548157fbfa288d12 |     
     powerpc |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/b25013f785a11f07e8da3735741b96036712f42a | ORPH
     powerpc |                valgrind-3.14.0 | NOK | http://autobuild.buildroot.net/results/384728ef796a312f741aecc0e6d826f4188b83c3 | ORPH
     aarch64 |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/280480c71ce75609989076f4f5d584509fd28392 | ORPH
microblazeel |               wireshark-2.2.17 | NOK | http://autobuild.buildroot.net/results/7ce34401d667e2c0113b82c75bf4effaf960f728 | ORPH


-- 
http://autobuild.buildroot.net
