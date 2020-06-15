From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2020 06:27:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-14
Message-ID: <20200615062805.A5A7F86F50@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-14
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 17  |  1  |  0  | 18  |
  2020.05.x  | 23  |  2  |  0  | 25  |
    master   | 120 | 109 |  2  | 231 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               linux-pam-1.4.0 | 57
                  boost-1.73.0 | 5 
                qt5base-5.15.0 | 4 
              host-grpc-1.25.0 | 3 
                 host-icu-67-1 | 3 
          python-web2py-2.20.4 | 3 
                     avahi-0.8 | 2 
             freeswitch-1.10.3 | 2 
                    mraa-2.1.0 | 2 
       qt5quicktimeline-5.15.0 | 2 
                 ripgrep-0.8.1 | 2 
                 rocksdb-6.6.4 | 2 
                  rygel-0.38.3 | 2 
                       unknown | 2 
                  assimp-5.0.1 | 1 
                        bullet | 1 
                         clang | 1 
              gnuradio-3.8.1.0 | 1 
  gobject-introspection-1.64.1 | 1 
                 granite-0.4.1 | 1 
           host-nodejs-12.18.0 | 1 
              ibm-sw-tpm2-1563 | 1 
                      icu-67-1 | 1 
          libhttpserver-0.18.0 | 1 
               libtheora-1.1.1 | 1 
               libupnpp-0.17.2 | 1 
                  ndisc6-1.0.4 | 1 
               qt5webkit-5.9.1 | 1 
                  ramsmp-3.5.0 | 1 
           uboot-tools-2020.04 | 1 
                  umtprd-1.3.6 | 1 
                wayland-1.18.0 | 1 
               wireshark-3.2.4 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/0740f913f0e7e42c2b6501df5d5c610c09ea9f71 |     
powerpc64le  |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a7ea8eb05e45fb3d9029362f74f0d27a1a4bfaa2 | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/86f392f29ee27b47acec19051f539b2e02ac1547 | ORPH
    arm      |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/a531cc83853f1d6133562d6d446fe23622d5e595 |     
  riscv32    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/767ffa956da0702265871f5cb05b7e103e9a6e68 |     
    m68k     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/94445226b03d20fd922013a352f0354884e0268f |     
   sparc     |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/1f85ca7ceedfb89424bc9acc2e9ef79f973b4637 |     
  powerpc    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/cc09cf68011933326587fa1d70aca02f714c9999 |     
  riscv32    |             bullet             | TIM | http://autobuild.buildroot.net/results/21858a1d1083c9592fb766e1f88152335a96ad89 |     
    i586     |             clang              | TIM | http://autobuild.buildroot.net/results/a5492fb870a174ef210cf35f77b90631d53b9d25 |     
   nios2     |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/ef8fa82bb8fb6920d3d2b685c9b28971e0a07d2f |     
  mips64el   |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/793973870cc8af9f95570fbdc96e4d9cb236b3b2 |     
  riscv64    |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/4fa653cc9b05a3f9281f21af03aee49cb685e5df |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2d0fb63f93f22b05d732524914e8e170b2889896 |     
    arc      |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/de4b1e124cfaa8e214a033ffdac29cbcc6f7dbee | ORPH
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d1e57433046c659e2b59578abbe5d0bd5e77d829 |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/7bacc906d6166457a4d773236590eef6a4e1a87c |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/739847ef8a8dd585ebcf9e582eaff0b7c213d063 |     
   xtensa    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/d204f1a528765d1440620a1eed8c29cbb5ec93c3 | ORPH
   x86_64    |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/1ea376138c4618de907411d375fba0da7a9b490d | ORPH
microblazeel |         host-icu-67-1          | NOK | http://autobuild.buildroot.net/results/de8b28590f6e249b44981df547cb7fe033a4f0ab | ORPH
    i586     |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/b68dac41ce2f50a76a30e9164163823bd3005b7a |     
    i586     |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/f75b8bbdf40a6f89d09547a7c31ca52cda4ad75b |     
    arm      |            icu-67-1            | NOK | http://autobuild.buildroot.net/results/6d2658a3c165c99df3eae87b2970e738bd386245 | ORPH
    arm      |      libhttpserver-0.18.0      | NOK | http://autobuild.buildroot.net/results/e16a8da678da635de9466d173659f0b3c7c1b350 |     
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/e2c67ac025484caf0cd68ff36fdae20e58b4837f | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/82c240e902e67fc3601a6904cfc702d37329bd68 |     
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/112b804ce2455ab6c0b4e71eff8d87661ee2ba44 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7d1e780e12f792d3168506e999ec603adc119dee | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/c42d822cd0518825e0ed9a7aa72e67bd100213db | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4d6687c1afd20db3af4607a9abfec760e7608b2b | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/52d70f5893f956d292d9acccea9fe2afdea57d76 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/1a489cff90ff6cae03b9a916892fae281e0d5645 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/93df51f5ba1f511aa0adec2fb04288dfcc0d50d1 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/845dc1a5a80f09ea861bf73fe3c7bff398fcfe61 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/f969d5977226d733eb7590749a1649af31355a88 | ORPH
    i586     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b548c7c5c8c3ce44fe95c1e2e11598601861c6ae | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/182d0fed97bc6cefc8e3020929643d4569b110a3 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e060ea0d59700ce7de49023b932a78bef24e7527 | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/819938739056a863c2eb048ca780012c6cc846fb | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9bed9658c4781bb43e45a998cbd011fa2161731b | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/222462b7a93862a1822af5704b26e6169acf6e97 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/4295e2364c5ddfb75c20b0c281c737e4755efb38 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/1dc2f34e5b62448ee81d0c55b015f101711b52dd | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b91b28af9b52c63d0bd99bfd5d900fbdde4077e2 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/581f86147b7c3a4932df9a2c76c3f8323bf3f56e | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b35e6661bcca9bf606d46aee0b870e611ec04b7e | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/ed52b8ae42d9b3376d734867642b3c8afc2a2bf5 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7f8748c1cd39b3637f75e62c0b28aa3cbff5114b | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/0af12d0c1a480f3945364158ebe7d324cf0697f7 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/16db65722b558e2626916eb68b713aa3b34923fa | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/c768f0bd6738f6f9613f344ef292feaeebfe09ed | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/8b91c69daa5351899b38daa49a9f59d381dd88a6 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d0eb3f6e1ca9bd7e65c0a3561d6229398a45959e | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d56053c65b733a792e98a14af99c94d3ab796cf5 | ORPH
   sparc     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/93ccccf8681ad5e710a52ea356066ecdf740b0f5 | ORPH
    i686     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/680be317f0f5a7033de54cb82b6386b3817072ec | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/32e566e305b8504a0a17cad2bd5df7d9c293872a | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b95ecb83eb3b1399d6524e7515409c4c7cf0ed07 | ORPH
  powerpc    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/800c6ec43ed795e887cb822055dd1f833c705a39 | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9c2a16ffb0b7346e8db1a055acd689302b9a4384 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3162962e497ef72c755559f9c592c008b1454209 | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/af40441a37aa07c4b5a59630c19bd55252cc8999 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9f6ffcb384ca6119fe3d18b13b6d0c173ecbe2f7 | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/bb960cac810b56f3096ba07e3ab203aea74a7053 | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/9285833e3d9cc708bbf789229c00007cdb27e748 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/b0884aad400e14ede1103688ef3d196a93cae1dd | ORPH
   x86_64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/c0a5e5b2b56b6ea1a965144499c4ce5578a6fcc6 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/dba6358d997012444edc890f34a79737fff45a05 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/3cf61a3355a2990ff26e71178fbda52c8045220e | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2e634e22583f1f54cd4aff4d22942a3bcf4951a2 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/d77121c93b12c18531f5c3d40ee7e88e8d1ebe3c | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/27d43d5a18e343391da11b613a367b6825962cc5 | ORPH
  riscv64    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/2490a7b0b1e7f742772203cc5355c9d2fbba7b60 | ORPH
    arm      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a11ee785781c54e894d140e0b4d4207beb9fe790 | ORPH
    or1k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/7e31649298df93b69cd0d4e9ce48347058bc59bd | ORPH
    m68k     |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/eb77ce2406c3bb0d1b1381af38ce8cb85dd25b1f | ORPH
  mips64el   |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/78737a91d93a4422d4b375b74370c0e882bb05db | ORPH
    arc      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/50a58fe480607c45bc55fa946e38d61917236cb2 | ORPH
microblazeel |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/a6a0fe639c213e9f16a574b7a625229cb2412451 | ORPH
    sh4      |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/59488b1decbc79528a8b16412815f10022500b65 | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/e97bbfd19c5928bc94bf136d3891a816487991e4 | ORPH
   mipsel    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/bfdea994f4f43132dfb55b0ac13a56ff8b0a1b1c | ORPH
   xtensa    |        linux-pam-1.4.0         | NOK | http://autobuild.buildroot.net/results/974d5ebfac72662f4ebcf971da32f436562a445c | ORPH
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/eba53a387fabee45809295bec938d07b03a87711 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/10e904dbe472ef69b8ca53d5ac6715c960543ed2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/083a784aaff8c20a47b6b9eb7b1726d2e751ef24 | ORPH
    arm      |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/0f4b7bc21a6881487303e6d44c6e9512874daf23 |     
   nios2     |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/71b1e8588b7bfe788a2e45e0b19e6343d74e55ab |     
  mips64el   |      python-web2py-2.20.4      | NOK | http://autobuild.buildroot.net/results/5fbd5e5831c7a3cf28fc02c20d15947205d881df |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ccaa58c71130ad78a4c9d2568e9184417adfda8c |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/1a47b153f889fec546e15fd8cf1825f6efee4514 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/a1c89bbcc70994e0338fd1f8016d9292d031f61f |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/0548e14a4ea2e11e6d79a555b43d7a350672c4ff |     
    arm      |    qt5quicktimeline-5.15.0     | NOK | http://autobuild.buildroot.net/results/116bc7d863a99bc7ef1915d7a8731d956603aa2b |     
    arm      |    qt5quicktimeline-5.15.0     | NOK | http://autobuild.buildroot.net/results/203008f23aebe60ea59bd1e316e4d78f93da76f8 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/7d60e6fb4dd86b3488222846b7a8b28b8ab5d706 |     
   x86_64    |          ramsmp-3.5.0          | NOK | http://autobuild.buildroot.net/results/73870142f59eceb6fbe90b4a35a1d53b9f1fafef |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/e2fb3250fcd78f289a17ecdf3ebbe12223ddba6f |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/6da4b7eb8598ae05c6d690f54d954b66a76172c4 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/32ebdf0b2f9b3d25ffa6ff209d449c4051dbcb11 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c2d04665946c9234b07244e84f2a1dcc9bd9a704 |     
   x86_64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/ce10057919d9cdeecbf0468e98a1c976eec32df8 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/f3571a365ecde92426fa9a63b13f5afdff8ed047 |     
    arm      |      uboot-tools-2020.04       | NOK | http://autobuild.buildroot.net/results/0ea4480353a9b2b0f9c0f1720ba8263fafcc5f2b |     
  riscv64    |          umtprd-1.3.6          | NOK | http://autobuild.buildroot.net/results/f10492ef8935982ab13186ff29d235f70d74af3e |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/aad7370da17887a25e669dc5ea756667fbe0d6da |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7b7b2f764c24378aa0123c0fdb437bd149406db7 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/e4dbd3fca04c6ba82fc2ce7584a6b73e37fb14eb |     
  powerpc    |        wireshark-3.2.4         | NOK | http://autobuild.buildroot.net/results/02762db6e74a2ea6e94205ffa9821c9a55ba161c | ORPH
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/e27eaa560b2341fc58712f74e1b369526d5ffd3a |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |            unknown             | NOK | http://autobuild.buildroot.net/results/2f20daf486d0644c7cbf672451baf2acc66e32e3 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

               belle-sip-4.3.1 | 1 
                 gnutls-3.6.13 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/cd00b672856d55355596e89506f2bfe86c43f765 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/2f8d0186ac2f6dc02feeee145dafb2454fbc7ab3 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | 8.7_SP3      |     
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.7        | 1.1.8        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.37.2       |     
                       agentpp |  DISTRO  | https://release-monitoring.org/project/21316 | 4.1.2        | 4.3.1        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r39   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.7.9        | 1.8.0        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 9.850.1      | 9.900.1      |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 5.0.1        | 50.0.1       |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.10.0      | 17.5.0       |     
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.2       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2020-01-22   | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.2        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2020.1       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2020.1       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     belle-sip |  DISTRO  | https://release-monitoring.org/project/14378 | 4.3.1        | 4.4.0-beta   |     
                          belr |  DISTRO  | https://release-monitoring.org/project/80042 | 4.3.1        | 4.4.0-beta   |     
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.19      | 9.17.1       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                         bison |  DISTRO  | https://release-monitoring.org/project/00193 | 3.4.2        | 3.6.3        | ORPH
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.19.0.1     | 0.20.0       |     
                         boinc |  DISTRO  | https://release-monitoring.org/project/00211 | 7.16.6       | 7.16.15      |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.3.1        | 4.5.0        |     
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.6          | 5.6.1        | ORPH
               ca-certificates |  DISTRO  | https://release-monitoring.org/project/09026 | 20190110     | 20200601     |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.17.2       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.201        | ORPH
                     capnproto |  DISTRO  | https://release-monitoring.org/project/11515 | 0.7.0        | 0.8.0        |     
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.45.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.45.0       |     
                          ccid |  DISTRO  | https://release-monitoring.org/project/02612 | 1.4.31       | 1.4.32       | ORPH
                       chartjs |  DISTRO  | https://release-monitoring.org/project/85785 | v2.9.3       | 3.0.0-alpha  |     
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 3.0          | 20200518     |     
                        circus |  DISTRO  | https://release-monitoring.org/project/21726 | 0.15.0       | 0.16.1       |     
                         clang |  DISTRO  | https://release-monitoring.org/project/11811 | 9.0.1        | 10.0.0       |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cloop |  DISTRO  | https://release-monitoring.org/project/21332 | 3.14.1.2     | 3.14.1.3     |     
                         cmake |  DISTRO  | https://release-monitoring.org/project/00306 | 3.15.5       | 3.17.3       |     
                           cog |  DISTRO  | https://release-monitoring.org/project/21333 | 0.6.0        | 0.7.1        |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                      cryptopp |  DISTRO  | https://release-monitoring.org/project/14487 | 8.2.0        | 8.3.0        |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.2.2        | 2.3.3        |     
                          cups |  DISTRO  | https://release-monitoring.org/project/00380 | 2.3.1        | 2.3.3        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.26.0       | 1.27.5       |     
                      cutelyst |  DISTRO  | https://release-monitoring.org/project/21335 | 2.9.0        | 2.11.0       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                           daq |  DISTRO  | https://release-monitoring.org/project/13264 | 2.0.6        | 2.0.7        |     
                          dash |  DISTRO  | https://release-monitoring.org/project/00394 | 0.5.10.2     | 0.5.11       | ORPH
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.18      | 1.13.16      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.11         | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 9.1.1        |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.13       | 1.4.0-beta.0 |     
                      domoticz |  DISTRO  | https://release-monitoring.org/project/21342 | 2020.1       | 2020.2       |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.9        | 0.5.10       |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.12.0       | 9.13.1       |     
                     dropwatch |  DISTRO  | https://release-monitoring.org/project/21344 | 1.5.2        | 1.5.3        |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                      easy-rsa |  DISTRO  | https://release-monitoring.org/project/17770 | 3.0.6        | 3.0.7        |     
                      ebtables |  DISTRO  | https://release-monitoring.org/project/00113 | 2.0.10-4     | 2.0.11       |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.24.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 19.09.1      | 20.03        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.177        | 0.180        | ORPH
                        elixir |  DISTRO  | https://release-monitoring.org/project/00673 | 1.9.4        | 1.10.3       |     
                         empty |  DISTRO  | https://release-monitoring.org/project/20564 | 0.6.20b      | 0.6.21b      | ORPH
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.8        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.24.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 22.2         | 23.0.2       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.12       | 1.0.15       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                   erlang-idna |  DISTRO  | https://release-monitoring.org/project/45374 | 6.0.0        | 6.0.1        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.4        |     
                   erlang-jose |  DISTRO  | https://release-monitoring.org/project/16913 | 1.9.0        | 1.10.1       |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.6.10       | 3.8.0        |     
                erlang-p1-acme |  DISTRO  | https://release-monitoring.org/project/45375 | 1.0.1        | 1.0.6        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.20       | 1.0.23       |     
              erlang-p1-mqtree |  DISTRO  | https://release-monitoring.org/project/20220 | 1.0.5        | 1.0.8        |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.5        | 0.7.0        |     
                erlang-p1-pkix |  DISTRO  | https://release-monitoring.org/project/20539 | 1.0.4        | 1.0.5        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.30       | 1.0.34       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.17       | 1.0.20       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.29       | 1.0.33       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.1.2        | 1.1.6        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.16       | 1.0.19       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.37       | 1.1.41       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.4.2        | 1.4.7        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.21       | 1.0.25       |     
               erlang-p1-yconf |  DISTRO  | https://release-monitoring.org/project/45378 | 1.0.1        | 1.0.5        |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.6        | 1.0.7        |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.3.0      | 2.6.1.0      |     
                          exim |  DISTRO  | https://release-monitoring.org/project/00768 | 4.93.0.4     | 4.94         |     
                         exiv2 |  DISTRO  | https://release-monitoring.org/project/00769 | 0.27.2       | 0.27.3-RC2   |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                         fastd |  DISTRO  | https://release-monitoring.org/project/17116 | 18           | 19           |     
                           feh |  DISTRO  | https://release-monitoring.org/project/00790 | 3.4          | 3.4.1        |     
                     fetchmail |  DISTRO  | https://release-monitoring.org/project/00801 | 6.4.6        | 6.4.8        |     
                          file |  DISTRO  | https://release-monitoring.org/project/00807 | 5.38         | 5.39         | ORPH
                           fio |  DISTRO  | https://release-monitoring.org/project/00806 | 3.19         | 3.20         |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.2.1        | ORPH
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.13.0       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
         freeswitch-mod-bcg729 |  DISTRO  | https://release-monitoring.org/project/21862 | 1.0.4        | 1.0.5        |     
                      freetype |  DISTRO  | https://release-monitoring.org/project/00854 | 2.10.1       | 2.10.2       |     
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 20.05.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.8.0        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.34.0       | 3.36.0       | ORPH
                            gd |  DISTRO  | https://release-monitoring.org/project/00880 | 2.2.5        | 2.3.0        | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                        gensio |  DISTRO  | https://release-monitoring.org/project/67634 | 2.0.3        | 2.0.5        |     
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.4.0        | 1.5.0        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       | ORPH
                   ghostscript |  DISTRO  | https://release-monitoring.org/project/01157 | 9.50         | 9.52         |     
                           git |  DISTRO  | https://release-monitoring.org/project/05350 | 2.26.2       | 2.27.0       |     
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.62.4       | 2.64.3       | ORPH
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.65.3       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.8      | ORPH
                           gmp |  DISTRO  | https://release-monitoring.org/project/01186 | 6.1.2        | 6.2.0        | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.12       |     
                      gnuchess |  DISTRO  | https://release-monitoring.org/project/01206 | 6.2.5        | 6.2.7        | ORPH
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.2.8        | 5.4.rc2      |     
                        gnutls |  DISTRO  | https://release-monitoring.org/project/01221 | 3.6.13       | 3.6.14       |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.12      | 1.14.4       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gpsd |  DISTRO  | https://release-monitoring.org/project/06846 | 3.19         | 3.20         |     
                      gptfdisk |  DISTRO  | https://release-monitoring.org/project/00885 | 1.0.4        | 1.0.5        | ORPH
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.4.0        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.14       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.25.0       | 1.30.0-pre1  |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.37.1       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                      gst1-imx |  DISTRO  | https://release-monitoring.org/project/21846 | 0.13.0       | 0.13.1       |     
   gst1-plugins-bayer2rgb-neon |  DISTRO  | https://release-monitoring.org/project/21851 | 0.3          | 0.4          |     
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.97.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.6.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 3.0.2        | ORPH
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.45.2       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.1.4        | 2.1.7        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.6.4        | 2.6.7        | ORPH
                       haveged |  DISTRO  | https://release-monitoring.org/project/11695 | 1.9.9        | 1.9.11       |     
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.20.5       | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.335        | 0.336        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.2.0        |     
                   ibm-sw-tpm2 |  DISTRO  | https://release-monitoring.org/project/18952 | 1563         | 1628         |     
                     ifenslave |  DISTRO  | https://release-monitoring.org/project/21670 | 2.9          | 2.10         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.10-19    | ORPH
                        imlib2 |  DISTRO  | https://release-monitoring.org/project/21676 | 1.5.1        | 1.6.1        |     
                 inotify-tools |  DISTRO  | https://release-monitoring.org/project/08864 | 3.20.1       | 3.20.2.2     | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.4.1       | 20.1.1       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.4.0r      | 20.1.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.4.0       | 20.2.pre2    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20191112     | 20200609     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_489        | 3.489        |     
                        iperf3 |  DISTRO  | https://release-monitoring.org/project/01389 | 3.7          | 3.8.1        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.6        |     
                      iproute2 |  DISTRO  | https://release-monitoring.org/project/01392 | 5.6.0        | 5.7.0        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                      iptables |  DISTRO  | https://release-monitoring.org/project/01394 | 1.8.4        | 1.8.5        | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.2.2        |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.22         | 0.22.1       | ORPH
                       jansson |  DISTRO  | https://release-monitoring.org/project/01417 | 2.12         | 2.13.1       |     
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.9.2        | 0.10.1       |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.2       | ORPH
                 jquery-mobile |  DISTRO  | https://release-monitoring.org/project/59395 | 1.4.3        | 1.4.5        | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.2       | ORPH
                        json-c |  DISTRO  | https://release-monitoring.org/project/01477 | 0.13.1       | 0.14         |     
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.7.3        | 3.8.0        |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.2        | 1.9.3        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.20       |     
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.71         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2020-04-R3   | ORPH
     kodi-audiodecoder-modplug |  DISTRO  | https://release-monitoring.org/project/21818 | 2.0.3-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-nosefart |  DISTRO  | https://release-monitoring.org/project/21819 | 2.0.2-Leia   | 2.3.0-Matrix |     
     kodi-audiodecoder-sidplay |  DISTRO  | https://release-monitoring.org/project/21820 | 1.2.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-snesapu |  DISTRO  | https://release-monitoring.org/project/21802 | 2.0.2-Leia   | 2.1.3-Matrix |     
     kodi-audiodecoder-stsound |  DISTRO  | https://release-monitoring.org/project/21801 | 2.0.2-Leia   | 2.1.3-Matrix |     
    kodi-audiodecoder-timidity |  DISTRO  | https://release-monitoring.org/project/21800 | 2.0.5-Leia   | 2.3.0-Matrix |     
   kodi-audiodecoder-vgmstream |  DISTRO  | https://release-monitoring.org/project/21799 | 1.1.5-Leia   | 2.1.2-Matrix |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 2.0.6-Leia   | 2.1.1-Matrix |     
        kodi-audioencoder-lame |  DISTRO  | https://release-monitoring.org/project/21798 | 2.0.4-Leia   | 2.1.1-Matrix |     
      kodi-audioencoder-vorbis |  DISTRO  | https://release-monitoring.org/project/21797 | 2.0.4-Leia   | 2.1.1-Matrix |     
         kodi-audioencoder-wav |  DISTRO  | https://release-monitoring.org/project/21796 | 2.0.3-Leia   | 2.1.1-Matrix |     
     kodi-inputstream-adaptive |  DISTRO  | https://release-monitoring.org/project/21795 | 2.4.5-Leia   | 2.6.0-Matrix |     
         kodi-inputstream-rtmp |  DISTRO  | https://release-monitoring.org/project/21794 | 2.0.9-Leia   | 3.1.1-Matrix |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.4.9-Leia   | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 3.5.6-Leia   | 6.0.1-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 4.7.2-Leia   | 7.0.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 3.7.11-Leia  | 6.0.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 2.4.6-Leia   | 5.0.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 3.5.0-Leia   | 6.0.0-Matrix |     
                  kodi-pvr-hts |  DISTRO  | https://release-monitoring.org/project/21783 | 4.4.21-Leia  | 7.0.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 3.9.8-Leia   | 6.0.0-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 3.5.18-Leia  | 6.0.0-Matrix |     
               kodi-pvr-mythtv |  DISTRO  | https://release-monitoring.org/project/21780 | 5.10.16-Leia | 7.0.2-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 3.3.20-Leia  | 5.0.3-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 3.4.2-Leia   | 6.0.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 2.4.7-Leia   | 5.0.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 3.4.10-Leia  | 6.0.0-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 4.7.0-Leia   | 7.0.0-Matrix |     
             kodi-pvr-vdr-vnsi |  DISTRO  | https://release-monitoring.org/project/21774 | 3.6.4-Leia   | 6.0.0-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 3.28.9-Leia  | 6.0.0-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 2.4.6-Leia   | 5.0.0-Matrix |     
               kodi-pvr-zattoo |  DISTRO  | https://release-monitoring.org/project/100438 | 18.1.19-Leia | 19.4.0-Ma... |     
    kodi-screensaver-asteroids |  DISTRO  | https://release-monitoring.org/project/21771 | 2.3.2-Leia   | 2.4.2-Matrix |     
    kodi-screensaver-asterwave |  DISTRO  | https://release-monitoring.org/project/21770 | 3.0.4-Leia   | 3.1.2-Matrix |     
   kodi-screensaver-biogenesis |  DISTRO  | https://release-monitoring.org/project/21768 | 2.2.3-Leia   | 2.3.2-Matrix |     
      kodi-screensaver-cpblobs |  DISTRO  | https://release-monitoring.org/project/21767 | 3.0.4-Leia   | 3.2.0-Matrix |     
    kodi-screensaver-greynetic |  DISTRO  | https://release-monitoring.org/project/21765 | 2.2.2-Leia   | 2.3.1-Matrix |     
 kodi-screensaver-matrixtrails |  DISTRO  | https://release-monitoring.org/project/21764 | 2.2.1-Leia   | 2.4.2-Matrix |     
     kodi-screensaver-pingpong |  DISTRO  | https://release-monitoring.org/project/21763 | 2.1.2-Leia   | 2.2.2-Matrix |     
         kodi-screensaver-pyro |  DISTRO  | https://release-monitoring.org/project/21761 | 3.0.1-Leia   | 3.1.2-Matrix |     
        kodi-screensaver-stars |  DISTRO  | https://release-monitoring.org/project/21759 | 2.1.4-Leia   | 2.2.3-Matrix |     
                  kodi-vfs-rar |  DISTRO  | https://release-monitoring.org/project/21900 | 2.3.1-Leia   | 3.4.0-Matrix |     
                 kodi-vfs-sftp |  DISTRO  | https://release-monitoring.org/project/21899 | 1.0.6-Leia   | 1.3.0-Matrix |     
    kodi-visualisation-fishbmc |  DISTRO  | https://release-monitoring.org/project/21758 | 5.1.2-Leia   | 6.1.0-Matrix |     
       kodi-visualisation-goom |  DISTRO  | https://release-monitoring.org/project/21757 | 2.2.1-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-shadertoy |  DISTRO  | https://release-monitoring.org/project/21756 | 1.2.3-Leia   | 2.1.1-Matrix |     
   kodi-visualisation-spectrum |  DISTRO  | https://release-monitoring.org/project/21755 | 3.0.2-Leia   | 3.2.0-Matrix |     
  kodi-visualisation-starburst |  DISTRO  | https://release-monitoring.org/project/85703 | 2.0.2-Leia   | 2.2.0-Matrix |     
   kodi-visualisation-waveform |  DISTRO  | https://release-monitoring.org/project/21753 | 3.1.1-Leia   | 4.2.0-Matrix |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 2.0.0        |     
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  DISTRO  | https://release-monitoring.org/project/01550 | 551          | 562          | ORPH
                           lft |  DISTRO  | https://release-monitoring.org/project/21863 | 3.8          | 3.91         | ORPH
                        libcap |  DISTRO  | https://release-monitoring.org/project/01569 | 2.27         | 2.36         |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                     libcgroup |  DISTRO  | https://release-monitoring.org/project/01575 | 0.41         | 0.42.2       |     
                        libcli |  DISTRO  | https://release-monitoring.org/project/21470 | 1.10.2       | 1.10.4       |     
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                 libcpprestsdk |  DISTRO  | https://release-monitoring.org/project/15531 | 2.10.15      | 2.10.16      |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                      libdvbsi |  DISTRO  | https://release-monitoring.org/project/21571 | 0.3.8        | 0.3.9        |     
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20190324-3.1 | 20191231-3.1 |     
                    liberation |  DISTRO  | https://release-monitoring.org/project/16833 | 2.00.5       | 2.1.1        | ORPH
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                         libev |  DISTRO  | https://release-monitoring.org/project/01605 | 4.27         | 4.33         | ORPH
                    libfribidi |  DISTRO  | https://release-monitoring.org/project/00857 | 1.0.7        | 1.0.9        |     
                      libftdi1 |  DISTRO  | https://release-monitoring.org/project/14622 | 1.4          | 1.5rc1       |     
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.9.2        | ORPH
                      libfuse3 |  DISTRO  | https://release-monitoring.org/project/00861 | 3.9.1        | 3.9.2        |     
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.5        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.36.0       | ORPH
                  libgpg-error |  DISTRO  | https://release-monitoring.org/project/01628 | 1.37         | 1.38         | ORPH
                    libgphoto2 |  DISTRO  | https://release-monitoring.org/project/12558 | 2.5.23       | 2.5.25       | ORPH
                      libgpiod |  DISTRO  | https://release-monitoring.org/project/20640 | 1.4.1        | 1.5.1        |     
                      libgsasl |  DISTRO  | https://release-monitoring.org/project/01563 | 1.8.0        | 1.8.1        | ORPH
                        libgsm |  DISTRO  | https://release-monitoring.org/project/12587 | 1.0.18       | 1.0.19       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                  libhdhomerun |  DISTRO  | https://release-monitoring.org/project/18397 | 20200225     | 20200521     |     
                 libhttpserver |  DISTRO  | https://release-monitoring.org/project/21934 | 0.18.0       | 0.18.1       |     
                     libiberty |  DISTRO  | https://release-monitoring.org/project/07981 | 2.32         | 2.34         |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.8        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.1        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.5        | 1.2.0        | ORPH
                       libkrb5 |  DISTRO  | https://release-monitoring.org/project/13287 | 1.18.1       | 1.18.2       |     
                       libksba |  DISTRO  | https://release-monitoring.org/project/01649 | 1.3.5        | 1.4.0        | ORPH
                     liblinear |  DISTRO  | https://release-monitoring.org/project/21363 | 2.30         | 2.40         |     
                         liblo |  DISTRO  | https://release-monitoring.org/project/21483 | 0.30         | 0.31         | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.22.0       | 1.23.900     |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
            libnetfilter_queue |  DISTRO  | https://release-monitoring.org/project/01679 | 1.0.3        | 1.0.5        |     
                        libnfc |  DISTRO  | https://release-monitoring.org/project/01680 | 1.7.1        | 1.8.0        |     
                      libnftnl |  DISTRO  | https://release-monitoring.org/project/01681 | 1.1.6        | 1.1.7        |     
                        libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.52         | 3.53         |     
                        libolm |  DISTRO  | https://release-monitoring.org/project/29706 | 3.1.4        | 3.1.5        |     
                   libopenh264 |  DISTRO  | https://release-monitoring.org/project/21365 | 2.1.0        | 2.1.1        |     
                   libpagekite |  DISTRO  | https://release-monitoring.org/project/21366 | 0.91.190530  | 0.91.200311  |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                       libpqxx |  DISTRO  | https://release-monitoring.org/project/21367 | 6.4.5        | 7.1.1        |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                        libqmi |  DISTRO  | https://release-monitoring.org/project/07307 | 1.24.14      | 1.25.900     |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.49.2       |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        | ORPH
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.3        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.20.1       | 0.20.3       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 3.0          | 20200518     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 3.0          | 20200518     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.3        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.70.0       |     
                       libsrtp |  DISTRO  | https://release-monitoring.org/project/18547 | 2.2.0        | 2.3.0        |     
                  libtextstyle |  DISTRO  | https://release-monitoring.org/project/00898 | 0.20.1       | 0.20.2       |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.12.1       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.7        | 1.12.1       |     
                      libupnpp |  DISTRO  | https://release-monitoring.org/project/15849 | 0.17.2       | 0.19.1       |     
                       liburcu |  DISTRO  | https://release-monitoring.org/project/07134 | 0.11.1       | 0.12.1       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.7        | 1.0.18       |     
                         libuv |  DISTRO  | https://release-monitoring.org/project/10784 | 1.37.0       | 1.38.0       |     
            libva-intel-driver |  DISTRO  | https://release-monitoring.org/project/01753 | 2.4.0        | 2.4.1        |     
                      libvdpau |  DISTRO  | https://release-monitoring.org/project/01755 | 1.3          | 1.4          |     
                       libvips |  DISTRO  | https://release-monitoring.org/project/05097 | 8.8.3        | 8.9.2        |     
                  libvncserver |  DISTRO  | https://release-monitoring.org/project/01756 | 0.9.12       | 0.9.13       | ORPH
                 libwebsockets |  DISTRO  | https://release-monitoring.org/project/11181 | 3.2.2        | 4.0.16       |     
                      libxmlpp |  DISTRO  | https://release-monitoring.org/project/11129 | 3.2.0        | 4.9.1        | ORPH
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.06      |     
                       libyaml |  DISTRO  | https://release-monitoring.org/project/01800 | 0.2.2        | 0.2.5        | ORPH
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 4.3.1        | 4.4.0-beta   | ORPH
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2020.05.15   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lshw |  DISTRO  | https://release-monitoring.org/project/06701 | 02.18        | 02.19.2      | ORPH
                         ltris |  DISTRO  | https://release-monitoring.org/project/21503 | 1.0.19       | 1.0.20       |     
              lttng-babeltrace |  DISTRO  | https://release-monitoring.org/project/00155 | 1.5.7        | 1.5.8        |     
                  lttng-libust |  DISTRO  | https://release-monitoring.org/project/07135 | 2.11.0       | 2.12.0       |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.11.0       | 2.12.1       |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.11.0       | 2.12.1       |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.185     | 2.03.05      | ORPH
                           lxc |  DISTRO  | https://release-monitoring.org/project/01860 | 3.2.1        | 4.0.2        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                          make |  DISTRO  | https://release-monitoring.org/project/01877 | 4.2.1        | 4.3          | ORPH
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.23      | 10.5.3       |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 168          | 170          |     
                 mediastreamer |  DISTRO  | https://release-monitoring.org/project/21746 | 4.3.1        | 4.4.0-alpha  | ORPH
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.6.6        | ORPH
                     memtest86 |  DISTRO  | https://release-monitoring.org/project/01966 | 5.01         | 5.31b        |     
                        mender |  DISTRO  | https://release-monitoring.org/project/20629 | 2.2.0        | 2.3.0b1      |     
               mender-artifact |  DISTRO  | https://release-monitoring.org/project/20630 | 3.3.0        | 3.4.0b1      |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.0       | 20.1.1       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 20.1.0       | 20.1.1       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.37.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.3.0.1      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.2        | 2.9.3        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 57           | 59b          | ORPH
                 modem-manager |  DISTRO  | https://release-monitoring.org/project/07306 | 1.12.10      | 1.13.900     |     
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.2.4       | 4.5.0        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.8.0.96     | 6.8.0.123    |     
                        motion |  DISTRO  | https://release-monitoring.org/project/20616 | 4.2.2        | 4.3.1        |     
                           mpd |  DISTRO  | https://release-monitoring.org/project/14864 | 0.21.23      | 0.21.24      |     
                        mpg123 |  DISTRO  | https://release-monitoring.org/project/12413 | 1.25.13      | 1.26.1       | ORPH
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.32.0       |     
                       mrouted |  DISTRO  | https://release-monitoring.org/project/17370 | 3.9.8        | 4.0          |     
                       msgpack |  DISTRO  | https://release-monitoring.org/project/12278 | 3.2.1        | 3.3.0        |     
                          mutt |  DISTRO  | https://release-monitoring.org/project/02035 | 1.13.5       | 1.14.3       |     
                          nano |  DISTRO  | https://release-monitoring.org/project/02046 | 4.9.2        | 4.9.3        | ORPH
                          ncdu |  DISTRO  | https://release-monitoring.org/project/06045 | 1.14.2       | 1.15.1       |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.37         | 0.38         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.2-20200613 | ORPH
                          neon |  DISTRO  | https://release-monitoring.org/project/07604 | 0.30.2       | 0.31.0       | ORPH
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.217        |     
                       netdata |  DISTRO  | https://release-monitoring.org/project/11046 | 1.21.0       | 1.22.1       |     
                       netifrc |  DISTRO  | https://release-monitoring.org/project/21917 | 0.6.1        | 0.7.1        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre2   | ORPH
                        nettle |  DISTRO  | https://release-monitoring.org/project/02073 | 3.5.1        | 3.6          | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.22.10      | 1.25.2-dev   | ORPH
       network-manager-openvpn |  DISTRO  | https://release-monitoring.org/project/69977 | 1.8.10       | 1.8.13-dev   |     
                      nftables |  DISTRO  | https://release-monitoring.org/project/02082 | 0.9.4        | 0.9.5        |     
                         nginx |  DISTRO  | https://release-monitoring.org/project/05413 | 1.17.9       | 1.19.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.18.0      | 14.4.0       |     
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.2.2        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                          nvme |  DISTRO  | https://release-monitoring.org/project/09074 | 1.9          | 1.11.2       |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                          ogre |  DISTRO  | https://release-monitoring.org/project/33334 | 1.12.0       | 1.12.7       |     
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.5        | 6.9.5_rev1   |     
                        openal |  DISTRO  | https://release-monitoring.org/project/08172 | 1.19.1       | 1.20.1       |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.9        | 0.3.10       | ORPH
                      openipmi |  DISTRO  | https://release-monitoring.org/project/02549 | 2.0.28       | 2.0.29       |     
                    openlayers |  DISTRO  | https://release-monitoring.org/project/06847 | 6.2.1        | 6.3.1        |     
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.4        | ORPH
                       opensbi |  DISTRO  | https://release-monitoring.org/project/21804 | 0.6          | 0.7          |     
                      openswan |  DISTRO  | https://release-monitoring.org/project/21552 | 2.6.51.5     | 2.6.52       | ORPH
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.1.0       |     
               optee-benchmark |  DISTRO  | https://release-monitoring.org/project/21555 | 3.7.0        | 3.9.0        |     
                  optee-client |  DISTRO  | https://release-monitoring.org/project/21556 | 3.7.0        | 3.9.0        |     
                optee-examples |  DISTRO  | https://release-monitoring.org/project/21557 | 3.7.0        | 3.9.0        |     
                    optee-test |  DISTRO  | https://release-monitoring.org/project/21558 | 3.7.0        | 3.9.0        |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.20       | ORPH
                          ortp |  DISTRO  | https://release-monitoring.org/project/21691 | 4.3.1        | 4.4.0-alpha  | ORPH
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.20      | ORPH
                   paho-mqtt-c |  DISTRO  | https://release-monitoring.org/project/21375 | 1.3.2        | 1.3.4        |     
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.45.2       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.2       |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.11         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.6        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 202005       | ORPH
                         pcre2 |  DISTRO  | https://release-monitoring.org/project/05832 | 10.34        | 10.35        | ORPH
                          pdbg |  DISTRO  | https://release-monitoring.org/project/21378 | 2.4          | 2.5-rc1      |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.30.3       | 5.31.11      |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
              perl-libwww-perl |  DISTRO  | https://release-monitoring.org/project/03024 | 6.44         | 6.45         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.58         | 1.20200513.1 |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.40         | 8.54         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.010001     | 1.010002     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0205       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                      php-amqp |  DISTRO  | https://release-monitoring.org/project/15603 | 1.9.4        | 1.10.2       |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.5        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      php-yaml |  DISTRO  | https://release-monitoring.org/project/12515 | 2.0.4        | 2.1.0        | ORPH
                        pigpio |  DISTRO  | https://release-monitoring.org/project/21577 | 76           | 7301         |     
                      pipewire |  DISTRO  | https://release-monitoring.org/project/57357 | 0.2.7        | 0.3.6        |     
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.7.3        | ORPH
                      pngquant |  DISTRO  | https://release-monitoring.org/project/03674 | 2.12.5       | 2.12.6       |     
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.9.4        | 1.10.1       |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 3.0          | 20200518     |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.84.0       | 0.89.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                      powertop |  DISTRO  | https://release-monitoring.org/project/03702 | 2.11         | 2.13         |     
                     procps-ng |  DISTRO  | https://release-monitoring.org/project/03708 | 3.3.15       | 3.3.16       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6c       | 1.3.7rc4     |     
                      protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.2       | 3.12.3       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.6.0        | 5.7.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  DISTRO  | https://release-monitoring.org/project/03729 | 13.0         | 13.99.1      |     
                     pulseview |  DISTRO  | https://release-monitoring.org/project/09549 | 0.4.1        | 0.4.2        |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b2        |     
             python-aioconsole |  DISTRO  | https://release-monitoring.org/project/21244 | 0.1.16       | 0.2.1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.6.2        | 4.0.0a1      |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.6       |     
                python-asgiref |  DISTRO  | https://release-monitoring.org/project/18462 | 3.2.3        | 3.2.7        |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 20.4.3       | 20.6.1       |     
                  python-babel |  DISTRO  | https://release-monitoring.org/project/11984 | 2.7.0        | 2.8.0        |     
               python-backcall |  DISTRO  | https://release-monitoring.org/project/19636 | 0.1.0        | 0.2.0        |     
python-backports-functools-... |  DISTRO  | https://release-monitoring.org/project/28328 | 1.5          | 1.6.1        |     
         python-beautifulsoup4 |  DISTRO  | https://release-monitoring.org/project/03779 | 4.8.1        | 4.9.1        |     
              python-bitstring |  DISTRO  | https://release-monitoring.org/project/14665 | 3.1.6        | 3.1.7        |     
                 python-bottle |  DISTRO  | https://release-monitoring.org/project/11101 | 0.12.17      | 0.12.18      |     
                python-canopen |  DISTRO  | https://release-monitoring.org/project/23230 | 1.0.0        | 1.1.0        |     
                python-certifi |  DISTRO  | https://release-monitoring.org/project/07995 | 2020.4.5.1   | 2020.4.5.2   |     
               python-channels |  DISTRO  | https://release-monitoring.org/project/21937 | 2.3.1        | 2.4.0        |     
         python-channels-redis |  DISTRO  | https://release-monitoring.org/project/21936 | 2.4.1        | 2.4.2        |     
                python-cheroot |  DISTRO  | https://release-monitoring.org/project/20163 | 8.2.1        | 8.3.0        |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.6.0       |     
                  python-click |  DISTRO  | https://release-monitoring.org/project/03802 | 7.0          | 7.1.2        |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 20.4.2       | 20.6.1       |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.9          | 2.9.2        |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.17      | 3.0a5        |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-daphne |  DISTRO  | https://release-monitoring.org/project/21939 | 2.4.1        | 2.5.0        |     
           python-dataproperty |  DISTRO  | https://release-monitoring.org/project/21697 | 0.48.1       | 0.49.1       |     
              python-decorator |  DISTRO  | https://release-monitoring.org/project/03819 | 4.4.1        | 4.4.2        |     
                 python-dialog |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                python-dialog3 |  DISTRO  | https://release-monitoring.org/project/03823 | 3.4.0        | 3.5.1        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 3.0.7        | 3.1a1        |     
      python-django-enumfields |  DISTRO  | https://release-monitoring.org/project/21928 | 1.0.0        | 2.0.0        |     
                 python-docker |  DISTRO  | https://release-monitoring.org/project/03847 | 4.1.0        | 4.2.1        |     
               python-docutils |  DISTRO  | https://release-monitoring.org/project/03849 | 0.15.2       | 0.16b0.dev0  |     
               python-dominate |  DISTRO  | https://release-monitoring.org/project/19648 | 2.4.0        | 2.5.1        |     
               python-engineio |  DISTRO  | https://release-monitoring.org/project/15064 | 3.12.1       | 3.13.0       |     
       python-flask-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/05701 | 2.4.1        | 2.4.3        |     
                 python-gitdb2 |  DISTRO  | https://release-monitoring.org/project/12730 | 2.0.6        | 4.0.5        |     
               python-greenlet |  DISTRO  | https://release-monitoring.org/project/06870 | 0.4.15       | 0.4.16       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.4       |     
               python-httplib2 |  DISTRO  | https://release-monitoring.org/project/03887 | 0.17.2       | 0.18.1       |     
               python-humanize |  DISTRO  | https://release-monitoring.org/project/19799 | 0.5.1        | 2.4.0        |     
                 python-ifaddr |  DISTRO  | https://release-monitoring.org/project/19908 | 0.1.6        | 0.1.7        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/67637 | 0.3.1        | 0.5.0        |     
               python-iptables |  DISTRO  | https://release-monitoring.org/project/11475 | 0.14.0       | 1.0.0        |     
                python-ipython |  DISTRO  | https://release-monitoring.org/project/01399 | 7.9.0        | 7.15.0       |     
           python-itsdangerous |  DISTRO  | https://release-monitoring.org/project/03892 | 1.1.0        | 2.0.0a1      |     
         python-jaraco-classes |  DISTRO  | https://release-monitoring.org/project/20150 | 2.0          | 3.1.0        |     
       python-jaraco-functools |  DISTRO  | https://release-monitoring.org/project/20165 | 2.0          | 3.0.1        |     
                 python-jinja2 |  DISTRO  | https://release-monitoring.org/project/03894 | 2.11.2       | 3.0.0a1      |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.2.0        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 19.2.0       | 21.2.1       |     
             python-kiwisolver |  DISTRO  | https://release-monitoring.org/project/16910 | 1.1.0        | 1.2.0        |     
                python-libusb1 |  DISTRO  | https://release-monitoring.org/project/12301 | 1.7.1        | 1.8          |     
                   python-lxml |  DISTRO  | https://release-monitoring.org/project/03914 | 4.5.0        | 4.5.1        |     
                   python-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
               python-markdown |  DISTRO  | https://release-monitoring.org/project/03916 | 3.2.1        | 3.2.2        |     
             python-markupsafe |  DISTRO  | https://release-monitoring.org/project/03918 | 1.1.1        | 2.0.0a1      |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.1        |     
                  python-meld3 |  DISTRO  | https://release-monitoring.org/project/10562 | 2.0.0        | 2.0.1        |     
                python-mistune |  DISTRO  | https://release-monitoring.org/project/06189 | 0.8.4        | 2.0.0a4      |     
         python-more-itertools |  DISTRO  | https://release-monitoring.org/project/12201 | 8.2.0        | 8.4.0        |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.44.0       |     
               python-mwclient |  DISTRO  | https://release-monitoring.org/project/09693 | 0.10.0       | 0.10.1       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.18.2       | 1.19.0rc2    |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.4.0       |     
           python-pathvalidate |  DISTRO  | https://release-monitoring.org/project/21704 | 0.29.0       | 2.3.0        |     
                    python-pbr |  DISTRO  | https://release-monitoring.org/project/03960 | 5.4.3        | 5.4.5        |     
                    python-pip |  DISTRO  | https://release-monitoring.org/project/06529 | 20.0.2       | 20.2b1       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
         python-prompt-toolkit |  DISTRO  | https://release-monitoring.org/project/08742 | 2.0.10       | 3.0.5        |     
               python-protobuf |  DISTRO  | https://release-monitoring.org/project/03715 | 3.12.2       | 3.12.3       |     
                   python-pudb |  DISTRO  | https://release-monitoring.org/project/03980 | 2019.1       | 2019.2       |     
               python-pydantic |  DISTRO  | https://release-monitoring.org/project/29768 | 1.3          | 1.5.1        |     
             python-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
              python-pyftpdlib |  DISTRO  | https://release-monitoring.org/project/17026 | 1.5.5        | 1.5.6        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev10  |     
               python-pygments |  DISTRO  | https://release-monitoring.org/project/03986 | 2.4.2        | 2.6.1        |     
             python-pyhamcrest |  DISTRO  | https://release-monitoring.org/project/11633 | 1.9.0        | 2.0.2        |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.5          |     
              python-pylibftdi |  DISTRO  | https://release-monitoring.org/project/21583 | 0.18.1       | 0.19.0       |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
                 python-pynacl |  DISTRO  | https://release-monitoring.org/project/12703 | 1.3.0        | 1.4.0        |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.7        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.6       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.15.0       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.80         |     
               python-pyroute2 |  DISTRO  | https://release-monitoring.org/project/20081 | 0.5.7        | 0.5.12       |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.2.1        |     
          python-pytablereader |  DISTRO  | https://release-monitoring.org/project/21592 | 0.26.1       | 0.30.0       |     
          python-pytablewriter |  DISTRO  | https://release-monitoring.org/project/21593 | 0.46.1       | 0.54.0       |     
                   python-pytz |  DISTRO  | https://release-monitoring.org/project/06537 | 2019.3       | 2020.1       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.22         |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 19.0.0       | 19.0.1       |     
                  python-redis |  DISTRO  | https://release-monitoring.org/project/03992 | 3.5.2        | 3.5.3        |     
                  python-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
                   python-remi |  DISTRO  | https://release-monitoring.org/project/21597 | 2019.9       | 2020.3.10    |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
             python-rpi-ws281x |  DISTRO  | https://release-monitoring.org/project/21898 | 4.2.3        | 4.2.4        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.1.1       |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.5.0        | 4.1.2        |     
                     python-sh |  DISTRO  | https://release-monitoring.org/project/10429 | 1.12.14      | 1.13.1       |     
           python-simplesqlite |  DISTRO  | https://release-monitoring.org/project/21608 | 0.45.2       | 1.1.2        |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
                    python-six |  DISTRO  | https://release-monitoring.org/project/04027 | 1.14.0       | 1.15.0       |     
                 python-smmap2 |  DISTRO  | https://release-monitoring.org/project/12729 | 2.0.5        | 3.0.4        |     
               python-socketio |  DISTRO  | https://release-monitoring.org/project/21611 | 4.3.1        | 4.6.0        |     
       python-sortedcontainers |  DISTRO  | https://release-monitoring.org/project/15939 | 2.1.0        | 2.2.2        |     
              python-soupsieve |  DISTRO  | https://release-monitoring.org/project/27570 | 1.9.4        | 2.0.1        |     
                 python-spidev |  DISTRO  | https://release-monitoring.org/project/21612 | 3.4          | 3.5          |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.17       |     
           python-sqliteschema |  DISTRO  | https://release-monitoring.org/project/29718 | 0.16.2       | 1.0.1        |     
               python-sqlparse |  DISTRO  | https://release-monitoring.org/project/04038 | 0.3.0        | 0.3.1        |     
                python-tempora |  DISTRO  | https://release-monitoring.org/project/21225 | 1.14.1       | 3.0.0        |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-toml |  DISTRO  | https://release-monitoring.org/project/06883 | 0.10.0       | 0.10.1       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.40.1       | 4.46.1       |     
                   python-treq |  DISTRO  | https://release-monitoring.org/project/19614 | 20.3.0       | 20.4.1       |     
                  python-txaio |  DISTRO  | https://release-monitoring.org/project/07202 | 20.3.1       | 20.4.1       |     
               python-txtorcon |  DISTRO  | https://release-monitoring.org/project/19661 | 19.1.0       | 20.0.0       |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 1.1.1        |     
              python-u-msgpack |  DISTRO  | https://release-monitoring.org/project/19764 | 2.5.2        | 2.6.0        |     
                 python-ubjson |  DISTRO  | https://release-monitoring.org/project/21618 | 0.14.0       | 0.16.1       |     
                  python-ujson |  DISTRO  | https://release-monitoring.org/project/04076 | 1.35         | 3.0.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.9       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
             python-validators |  DISTRO  | https://release-monitoring.org/project/19818 | 0.14.2       | 0.15.0       |     
               python-watchdog |  DISTRO  | https://release-monitoring.org/project/05341 | 0.9.0        | 0.10.2       |     
                python-wcwidth |  DISTRO  | https://release-monitoring.org/project/08743 | 0.1.9        | 0.2.4        |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.40         | 0.51         |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
               python-werkzeug |  DISTRO  | https://release-monitoring.org/project/04092 | 0.16.0       | 1.0.1        |     
                  python-wrapt |  DISTRO  | https://release-monitoring.org/project/06108 | 1.11.2       | 1.12.1       |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.9        |     
               python-zeroconf |  DISTRO  | https://release-monitoring.org/project/12681 | 0.23.0       | 0.27.1       |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 5.1.0        |     
                       python3 |  DISTRO  | https://release-monitoring.org/project/13254 | 3.8.2        | 3.9.0        |     
                  python3-mako |  DISTRO  | https://release-monitoring.org/project/03915 | 1.1.2        | 1.1.3        |     
            python3-pyelftools |  DISTRO  | https://release-monitoring.org/project/16219 | 0.25         | 0.26         |     
                 python3-regex |  DISTRO  | https://release-monitoring.org/project/05548 | 2020.2.20    | 2020.6.8     |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 44.0.0       | 47.1.1       |     
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.3.2        | 8.0.0        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 9.1.1        | 10.0.1       |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.31.0       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.9.1        | 5.15.0       |     
                        quazip |  DISTRO  | https://release-monitoring.org/project/15197 | 0.8.1        | 0.9.1        |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.4        | 6.1.5        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.8.2        | 3.8.5-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.3        |     
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 6.0.4        | 6.0.5        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190609   | 2.20200229   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 3.0          | 20200518     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.9        | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 12.1.1       |     
                       rocksdb |  DISTRO  | https://release-monitoring.org/project/15560 | 6.6.4        | 6.10.2       |     
                      rp-pppoe |  DISTRO  | https://release-monitoring.org/project/04209 | 3.12         | 3.14         | ORPH
                           rpm |  DISTRO  | https://release-monitoring.org/project/15204 | 4.15.1       | 4.16.0-alpha |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.7.1        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc10   | 1.0.0-rc90   |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.44.0       |     
                            s6 |  DISTRO  | https://release-monitoring.org/project/05485 | 2.9.0.1      | 2.9.2.0      |     
                        s6-dns |  DISTRO  | https://release-monitoring.org/project/16547 | 2.3.1.1      | 2.3.2.0      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 1.0.3.1      | 1.0.4.1      |     
                s6-linux-utils |  DISTRO  | https://release-monitoring.org/project/16551 | 2.5.1.1      | 2.5.1.2      |     
                 s6-networking |  DISTRO  | https://release-monitoring.org/project/16550 | 2.3.1.1      | 2.3.1.2      |     
             s6-portable-utils |  DISTRO  | https://release-monitoring.org/project/16549 | 2.2.2.1      | 2.2.2.4      |     
                         s6-rc |  DISTRO  | https://release-monitoring.org/project/16548 | 0.5.1.1      | 0.5.1.2      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.11.9       | 4.12.3       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.30       |     
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11         |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 3.0          | 20200518     |     
             shadowsocks-libev |  DISTRO  | https://release-monitoring.org/project/21654 | 3.3.3        | 3.3.4        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 2.0          | ORPH
                    sigrok-cli |  DISTRO  | https://release-monitoring.org/project/09550 | 0.7.0        | 0.7.1        |     
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.2          | 4.7          |     
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                        sngrep |  DISTRO  | https://release-monitoring.org/project/17075 | 1.4.6        | 1.4.7        |     
                        snmppp |  DISTRO  | https://release-monitoring.org/project/21318 | 3.3.11a      | 3.4.1        |     
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.15.1     | 2.9.16       |     
                     softether |  DISTRO  | https://release-monitoring.org/project/21383 | 4.30-9700... | 4.34-9745... |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                        spdlog |  DISTRO  | https://release-monitoring.org/project/15599 | 1.5.0        | 1.6.1        |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.2       | 0.14.3       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.14.0       | 0.14.2       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.3.0        | 4.4.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.11         | 5.0.3        | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.7.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.20.0       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  DISTRO  | https://release-monitoring.org/project/06861 | 6.1.2        | 6.2          |     
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.11.13      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.4        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.13.0       | 1.14.0       | ORPH
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.31       | 1.9.0        | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      supertux |  DISTRO  | https://release-monitoring.org/project/04911 | 0.6.0        | 0.6.2        |     
                    supervisor |  DISTRO  | https://release-monitoring.org/project/16289 | 4.1.0        | 4.2.0        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.8        | 5.0.3        |     
                          swig |  DISTRO  | https://release-monitoring.org/project/04919 | 4.0.1        | 4.0.2        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.11      | 2020.04      |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.7       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.1.2        | ORPH
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 12.2.1       | 12.3.3       | ORPH
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 9.0a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.20         |     
                     tcpreplay |  DISTRO  | https://release-monitoring.org/project/13716 | 4.3.2        | 4.3.3        | ORPH
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.6.0        | 1.7.0        |     
                      thermald |  DISTRO  | https://release-monitoring.org/project/14500 | 1.9.1        | 2.2          |     
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                            tk |  DISTRO  | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a3        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.1b         |     
                           tor |  DISTRO  | https://release-monitoring.org/project/04991 | 0.4.2.7      | 0.4.3.5      |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.3.0        | 2.3.2        | ORPH
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 4.1.1        | 4.2.1        | ORPH
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.3.3        | 2.4.1-rc0    | ORPH
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                  transmission |  DISTRO  | https://release-monitoring.org/project/05002 | 2.94         | 3.00         |     
                       udpcast |  DISTRO  | https://release-monitoring.org/project/10206 | 20120424     | 20200328     | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                          uftp |  DISTRO  | https://release-monitoring.org/project/21638 | 4.10.2       | 5.0          |     
                       uhubctl |  DISTRO  | https://release-monitoring.org/project/17364 | 2.1.0        | 2.2.0        |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.9.2        | 5.9.3        | ORPH
                      upmpdcli |  DISTRO  | https://release-monitoring.org/project/15848 | 1.4.9        | 1.4.12       |     
                    util-linux |  DISTRO  | https://release-monitoring.org/project/08179 | 2.35.2       | 2.36-rc1     | ORPH
                           uvw |  DISTRO  | https://release-monitoring.org/project/33083 | 2.5.0_lib... | 2.6.0_lib... |     
                  v4l2loopback |  DISTRO  | https://release-monitoring.org/project/10956 | 0.12.4       | 0.12.5       |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.46.6       | 0.48.6       | ORPH
                      valijson |  DISTRO  | https://release-monitoring.org/project/18452 | 0.2          | 0.3          |     
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.2.0000     | 8.2.0981     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.60.3       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.18.0       | 1.20         |     
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.28.2       | 2.29.1       |     
             wilc1000-firmware |  DISTRO  | https://release-monitoring.org/project/65598 | 14.1         | 15.4         |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 5.0          | 5.0.1        |     
        wireguard-linux-compat |  DISTRO  | https://release-monitoring.org/project/62379 | 1.0.20200506 | 1.0.20200611 |     
               wireguard-tools |  DISTRO  | https://release-monitoring.org/project/62381 | 1.0.20200319 | 1.0.20200513 |     
                wireless-regdb |  DISTRO  | https://release-monitoring.org/project/15257 | 2019.06.03   | 2020.04.29   |     
                wpebackend-fdo |  DISTRO  | https://release-monitoring.org/project/17547 | 1.6.0        | 1.6.1        |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.3          | 3.4          |     
                        xapian |  DISTRO  | https://release-monitoring.org/project/15919 | 1.4.15       | 1.4.16       |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
                      xapp_twm |  DISTRO  | https://release-monitoring.org/project/15038 | 1.0.10       | 1.0.11       |     
   xdriver_xf86-input-libinput |  DISTRO  | https://release-monitoring.org/project/05782 | 0.29.0       | 0.30.0       |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
                       xenomai |  DISTRO  | https://release-monitoring.org/project/18451 | 3.0.10       | 3.1          |     
                        xerces |  DISTRO  | https://release-monitoring.org/project/05182 | 3.2.2        | 3.2.3        | ORPH
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.6.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
              xkeyboard-config |  DISTRO  | https://release-monitoring.org/project/05191 | 2.29         | 2.30         |     
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                  xscreensaver |  DISTRO  | https://release-monitoring.org/project/05269 | 5.43         | 5.44         |     
                xtables-addons |  DISTRO  | https://release-monitoring.org/project/07736 | 3.7          | 3.9          | ORPH
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 356          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.11       | 0.3.0        |     
                         xvkbd |  DISTRO  | https://release-monitoring.org/project/05273 | 4.0          | 4.1          | ORPH
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.2        | 0.7.3        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.2.5        | ORPH
                          zbar |  DISTRO  | https://release-monitoring.org/project/13689 | 0.23         | 0.23.1       |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.5        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2020.1       |     

-- 
http://autobuild.buildroot.net
