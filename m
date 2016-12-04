From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Dec 2016 08:29:59 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-03
Message-ID: <20161204072959.746C421D18@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-03
================================

      successes : 163
       failures : 340
       timeouts : 0  
          TOTAL : 503

Classification of failures by reason
====================================

              host-cmake-3.7.1 | 190
                       unknown | 36
   host-lttng-babeltrace-1.5.0 | 26
                     efivar-30 | 18
        lttng-babeltrace-1.5.0 | 17
             gstreamer1-1.10.2 | 7 
            lttng-libust-2.9.0 | 6 
     toolchain-external-custom | 6 
                   cmake-3.7.1 | 3 
                    rpm-4.13.0 | 3 
             berkeleydb-5.3.28 | 2 
kvmtool-bed2bd9e1fbef581909... | 2 
               trousers-0.3.13 | 2 
                  apitrace-7.0 | 1 
                bind-9.11.0-P1 | 1 
                  cppcms-1.0.5 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  lcdapi-v0.10 | 1 
              lsqlite3-0.9.4-2 | 1 
             lttng-tools-2.9.0 | 1 
                 mesa3d-13.0.2 | 1 
                    mosh-1.2.6 | 1 
               openldap-2.4.44 | 1 
                 openssh-7.3p1 | 1 
phidgetwebservice-2.1.8.201... | 1 
             qt5location-5.6.2 | 1 
                  sispmctl-3.1 | 1 
                  squid-3.5.22 | 1 
uhttpd-59e0c739634f46a164d9... | 1 
               upmpdcli-1.2.10 | 1 
ustream-ssl-ec80adaa1b47f28... | 1 
                     vlc-2.2.4 | 1 
x264-72d53ab2ac7af24597a824... | 1 
                xfsprogs-4.7.0 | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/0cd5f8d5abb081fa50c867ad5de78204766fae9d
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3191b0c15a34103a26897207db294f789c0a6ffd
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/074aa42e49e65f80e4ed4ce0896f5bdd2298d9ad
 powerpc64le |                 bind-9.11.0-P1 | NOK | http://autobuild.buildroot.net/results/ccb32f25f92d3008b19b2cc4b402ee7f724a4b90
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fa1ab5f119424e828896c12755892081a2edd5fd
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1e006ee34055c41eee4332d1e0a0dc1ba47667f3
        m68k |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b52f46377df9ddbcd47f5a18aeda4fa179afa2b6
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0677d08b412208877fbadf7065b5e7a188caac40
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/4e0a3ab0b47e51c3588df4d9a2989aa323a3a642
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/a0b773d6fbb6a8cd22141d824c227cf702b916eb
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/6f3104496bdfdd87bfeb37272d56d722bc6d4b44
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/25800e6e10f8ca1b1950ae4122702d5eccb67090
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/cfd02949917b2fc19d1947215e56ad8c514175aa
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/a79763c81dcb08c3819fda704eb1d4b91acb1055
     powerpc |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/3b1533e642019436e4db009361233ec17c31d8f5
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/d72b5eafe761c68d680abd65dcc11cf4e15ceca7
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/4057d38b295d7fb286f421b0ec3457e184b00810
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/a295702661b40e2fbc2283f172996271f344c73b
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/e9184bb57e81f0815459c050aa5b0d9a7912d918
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/36c0014de031926237db910d3d04d5fb579ab332
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/521db2ace5bebcc914146a536a2e10e2e485af01
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/4f9a2ca207af26da19bd7b1147abfdbafbdf02d4
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/34d1d783981c0561b82fcbacdc262d29f08f4f89
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/9995945d818d8c30305045df94e7acbd45004f91
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/9986572a414d9242d3287aa452b46120c5f64516
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/0314aad836e35b9f5424601bc7cc857db0b88cba
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/0b2384b871f2c21ccfea7e594a537a3ed0ea43b0
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/d4349317e16a363bd9fc2ae8c019dcaa00fc4b2f
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/d2adc570af1906c74ee36854a34bb12a9491b648
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/b7d403c8e03b2eb88e65f4a32098dfa9a8df74d4
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/8cebe1e9f1e2eee2a2238856d053de9a1986ac2f
         arc |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/ad243dbe959f0aaf8d88433d4d57e9ccd2570fde
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/529c88f45e72de3e09367d119151dcc903e406d0
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/84e95f781539a274a53b70bf64a02b73a5a24ec5
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cb6bd69b6b1a188957832eda39f71cffaa20aa3b
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6afaae896161e89bae3f9c48320de706b4a40492
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/deccc7023e04efbaf8e372a057477c5807715b75
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f6773b8a21d6e8f5cec57e857e0b9c485fff8a40
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0ef672682741efcc5323a0be4485f641b0ecee9e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/842d8d6f815e6f2bfad3fcab22b4a5fa1b63c0fc
        mips |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9c3f407e506def7ab5a64368108320b8dfa24cc6
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d3a9ef025641b90e2b76f5a382cd649d2cbdddfa
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c7793f892b2f423d96fe684cd83df05013e6ec26
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9d02171a58576d7a6a80c70640d6bbbd827891b4
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/988f4d165f9a0b7c8e5728ba69fe7e79f527a2c0
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/dfec491f547fd6afaf242ba87b27d82e38af2c2c
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d93b917a7d2c071bdb8dc1bad55ac8f000e353c5
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ae41c1436702680e2fd733d7bff348fc5a3291e8
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bc90cf52e67b5871bbe959d06fcbd7cd8fab52aa
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2e7c7cad8dbbf684779261f22deeedcde1062b2f
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/80594d124c530482c01b4fb68ded1ed675265938
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cdbf48a8d916c1c11c3d42bb6fb75eeb026cb5ca
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ac07dc63329ff60063b519440979f7e919e97e94
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7dfa2b4ab1100999e4e46a877fe2837e657368a0
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cca5614d1616154c6b2fbb46fca074d147c48cd6
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/122c8841f1875b019aed60646411b8c364cfdcdd
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/edd126da37b83253cf02c35ccfd09f4ec704ea43
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/df4710b2eebfe62a7f81e9690a03d56a9e041287
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2ff2815b398e45172135ef630e557a07d90aa995
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fed41a6139f6b0934a0b359ba6fb80c32c2ea6fb
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c140fc9173be658ac7390e48410300e16c8053d0
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/167edb6c0d0b9056d7abc810fb0db05608f50f76
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7d1f2a421ff1d93882f7778363c3e68616bd7906
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b2d4ea28ffde2be80752290dfe667aea4b085f65
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ebb73ce14df56e9438393e66b07f05b8dfd63e70
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1b01041e0d20d0996545a036a25267793c5befb4
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9b91e5d760b4136a8b171e856e7336c7c6c8011d
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/02f86b8f77aca96f503ea73a462df3b1e19e6417
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d92aef1598b682c5f9cb6b174d28b56b0df4771f
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cc28f542195c23b3287757cfba45cdcdda085b38
        mips |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6aa31f995b5e6c7229501150d2f53d70798810a5
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4c8321956b320a308dbf6b22f2f8415b3daed6d6
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f18ed9d5ef260e33a61ea4ea852f948b31ecfb9a
        sh4a |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f3ae5a95c89f07bae4611ba5c1051c01bd1f4463
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/141c2bc172f95d88cee0529cee75bdf1717eb3f7
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7b6381310e4d17fb446cef288b3f757de768b20f
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/461f6d93b631aa2f5daeefcdadcc67eb31d79915
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1661fa9417ef51160095fc2c7a4206f1b8f88132
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5c1d2bb7e9cb8cb6bfb58152c6a6e4e21af2f97b
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f89c62bc98314d35c0e2230583b3c3faa61c7699
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/24d0ae06d485bb426a1eb6285b465408c91b68d6
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e93b1aa04b24a1576b7e5692a325604ba66cfce8
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/91ebbba4abda85d0e44d9dcead3b72126abd9d41
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bf28c6fcd82ac66fb31b3e1c93cca964dd3d9710
        mips |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/42c3f115df37742b84a166c9fe79ed523dfdc989
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9da1fcb83459100742510dcef217233c45563a31
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/72c9061bb662599bc76de8fb8b4d74845eb44927
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/de02f49fa61a4c263d22c3c8252770e26404ebef
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/23883b738e90487cec675025078104805adf62d4
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/43ef0244ff9238a387d881e34f30e48736839ed1
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ed85725aa9cd76b7e09a34f54afc49e5151cf681
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d1fc60ab4b7f23c00af85f2d5f100251133a37c3
        m68k |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ff4bfebb78dee23073b133213eee3f8aaa4bbca2
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/67e6061f7c8f95eeb5583d9aa21983d53fd5488e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ceccd9a92551195daf2f8cc46d7c16bed261388d
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0c1237910ae41d57f3848cfeb0701a9e9265999c
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f85b14fe40e27548b18be8eeabbf6272cb890868
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f6a7d6a0a4986449477f9a99969dc3ffa49c1402
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2a0c16ce1b30d21a095aa15fe4957e764facff06
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/117d7858cb651953c5ce5b2da2341f48072d44f9
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f3c9b526d5ea582256ddcfa99712f6ea57dd2eda
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8d8067752e9ef0f49464efe85599b5dd42179007
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b660a68076fa1ee5e574e40c0bfa00065b33ccec
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0eeed5785a55a1c6f2a371fe20fb57e67b132f04
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b79c26337ee559d8217fed7895cc59f79571d1af
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bd1d57eb45f0df6d8cde70c5bc5bf5742c1d9521
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6d08c21daee37f51b205a990733b414ec88d0de2
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1537f5a72ea7f9a12280bf38e44ed43fa60f0aad
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c6c54a3781e06e228d86cf0d348116292afe6a8e
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b4b2e1528ad26d5f27794b07214d8f67280dd27e
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4980710604f09440d37e5fe7cd92b0a621df4973
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5621f801317ea405dc738384f02d35c779c59509
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4b28dc5e26b137a692d0e468c6a12a21b105571c
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/86d9d9675856257c54e46b6d53af46667f183fe1
     aarch64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ec252fe130410456445bc6191935f651e9ded95a
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/85c9ee6c9ef5cb60a8908377d1d84083c4ecead3
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/38a68aaa58adf3c4491f6c2993fa3df2ec873dab
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1bac570302eb96fa5c729003217bdabd454c8c89
     aarch64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b27d4ce29944c3702b11a3ae5fa15a1211ee83d7
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/75b807322df5d916240a58775a0023e79a61d032
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/efae5e2709d7f83d017a04f5f829242b2e67ce15
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5a86b92f82ff62815521322ce8eed56693e11e85
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/235be824f7a41c943cf01750183e06528a95a85a
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5d41f91a5157890ef0a5d3c1f4320c62ffbcd64e
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cb221ecd009b172aa4d01dd786dfec5130691dcc
        sh4a |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0dac8eaa773e566a9d4112d261e748d59054b38c
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e086e85ce6e2181483d29de0f1ae107b87d17150
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8a32738442051326380a3f0fbfe68aafe1f40d59
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4581a3e7172e4f8ff00ff0bfedf0eab32761b4e6
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/062a6f566b298b1d7b91598d82b0191a6e51162d
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b79634cf988063a85c5186f4a10c314e178a870e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b56de347611942c97796296b0f0d2e8bd3716070
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/3c3da02fce3c15bd18fc17f89dcd82565e9ed4ac
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/01f076161e21e68602a6d8011319f841670542ad
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a4ab42576f4b238710f978c1bfd0cc737fa584f3
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f41ebbc4d245ff20bdfdb2b8be4f1a2799e8485c
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7e836bf1f478fa1ebb7866377cbdd8b81220383c
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d488108a8f07354f7cfd1277040b027d422a3c75
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/36ee6856d8d88c9a012061ce314aeebf8049b98f
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f6d1f6b159696c350d063b16751e2ed2e95e3cd7
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/32b1ca967853b1b78d34fdd9a189565846f45a77
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/02ff887db3c7d7ef610337c74a88d65452e14300
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/96662e4e42db354fee988802e30074f2a75d2585
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8bb57a66e1193248e4a8d9ebd4cc4f69352f9c82
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0293539afff174c9c69942885f0ecf9fac44c41e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/eab61ad2de4eee72471c0e4738fb24c9aa205a66
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b0a568b5b773e948b41e8b5abf3d698e9d3c0b3a
        mips |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6fab25b66916ca3d153aedfe3d73cf33943f5f23
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/51bf4b5d8c471c92a12b346a6a0b8d07b8b31e7b
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/933fb3a8cd994033d8eb1a85f90fb48fec8a9516
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f4ca53146c929bbb592ae63d1a5200d42f0a9975
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d82d5fb94fb6754fbeb9902cc3ab3452423166af
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/67e5e8cfdbafbd98362ab2ff971e886c58e4f0a6
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/863ec4e581b071d0ed0116ad7aeadceff8e79e3f
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/53be23c9ed74e44d712e33d83c826f702233b751
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ca593597c3ed0535cf64b9917351a222673d3fa9
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/50d74c7c90af476d8145db0c4d3076104fa51f20
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9d21784464d0b83447ba6ab17830e342c997d771
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9a249eb9d8384120797b495838e72a5710bfd6af
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/316cea5081be007f9dd88fc1cdc689a7b8ffb7d0
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/82b0965a9eed5f7bf4ce33498686f05457fcf0b9
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0a7c7cae62fcf887b60cdecef1201b3e55f74db2
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cedd62cd92a0449bc9aad64b556e24699e070e42
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/417363803183a19634d47522743a4102e5f97c0e
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5770f844bdf3a2d3e2b8110fdf3fed262a1a057c
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ef93c928dd83585514810e5cbce3d0374d1ae208
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/00d5aff8277d7fe66466f604aea7bbc7779134c0
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e64ad4cb6993c612f4743d80dfc515976e4eb612
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/84c5daa0142616b15e6f101f3740a96d4a82ad8d
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/213559f58891dd08d8a9ee8ffb24c1d034126ce5
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ff87f0af175b8b7f13a56b84e3298ce86952535a
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7bf41bdbd1bc425e207bd066817e3d9161d71456
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1309f759994a228570a76fecacaae0d6a064ed3e
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d8bada7d62424eee06b2c1a413d323fe71627ddb
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/20c74933f0f7474753b4ac7e3a17fbdb0318c4b1
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e81e1371a46dc7273de2e01bcf6f0b8c4a370266
     aarch64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ea3e21f6feebfbdc04522e6b5184f3a525829b90
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4da9e3f162b4dc2bd728a76a85d1f386b2b26bd2
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fdc6a6fb5b2d76f91136d5899df000a5f077d1a4
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6973b07934f4170e7d35da2df6deb7281f4e8213
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2c9e774072f9b79e937a36d7ee3136d078f0066a
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bf1adebae468d94d2f8ad8f323f0edaab37c104c
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d2d72e01a3bee6f43e2cea27dec198ed6c690cc9
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0660d5eb5a2db516ee36604cd5cf6caaa00d9fd4
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d4a494463538ebdaf741a4c6e639a58dbbebcbd1
        mips |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/56fcac10b8c82a8855d08181683f1ae3cfaa8b88
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6d3d7a583d5f18dac6cb545f7707b2ec32987281
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4e173b6ae64b4d4bc8df485c6f383328169bb60e
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2d8d2928018be139eda3203e47e4e1b5318cf2aa
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4e703ed8c2eb0f914794038b0ef7bd73a67f38ce
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e9ec7ba8dbbc78d27c78cb560219aa24ceee413c
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/78e297c7c0c3e63d5f6702c3e12758f2d50a1e86
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/309e84bfc7c2e5a90e5d0f22efa49a29f7af0b26
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/71d54adf202d285160020c04465ef37639ff2ec7
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b4460754ad535b6b3d782a9d11e5bb9c2386db7e
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/08d8b40ea2ed7030f9d2a932d8d77479fc2fdc3e
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ac9919a0a25eef024bf5642585c2a1b444daf189
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8dd201d9e4606f258251eacfecacb6977bbb8191
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/da7e1e6b81343be5af71e1516751f915f80c0c42
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e62365488d8ec8b9d4a27f7feedc43bb37f900ab
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a6c79778e5456ad53470b847c19fb352cf212a94
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bf1ed09c3800c6467f89b82cf269a66823a65306
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1fe97324d12f9e6addb5d34ff3805c1dc2f23f3b
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9d45cb32dbcd333bd00b77b6e2625e6285f774d8
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/480521a8f23e1f9a3c7c1ec58a86193a62c9a3bb
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b75bcdec720811513c747f3793187daad0c2d67c
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2b11d3f5043a6ef46491eccb2b781ee2c744c540
        m68k |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f7cc9ba427511444bf78d1214e875bcc02eb2004
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/376d10de2e906f65c259988ffc1eb320160cbe1c
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c86b96a2f1fe3352497d10ea9595d27e2247d5bd
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/bff80f83d7d30e48952378bf4d9fd8beafc6ecda
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fafebdb04df72b1c2060760571929611f74de239
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e8d5f0516e143acab182bb1f87fc6e2315d3cf09
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ef18aad9b14dc47525cfe6053fde59c218992a0a
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ed38871ac9d001f10aef782c3de15dea09638607
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2436e43283f65aa90572381ab9769bef805b20fb
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2ebab67ae7bfe0198e637cfd2b3db1d2d25f0c94
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/3bbbd71f7f81a72253423b2a20db423786b3fa7c
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/968970438bb698a9e45f14f58fd5f44ffc346926
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1e578224ea7abdbb90858ec6abfa6a7b823b7373
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2a04b6d240f8c9f7fecb13090d6839f56c407d2a
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c0cb6ac1934353b4e7abea193ac0125a12ba40a0
        m68k |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/12b66d8fc3c00c9e356b34f19011db2d7272f658
      x86_64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/53558e0142d322cd4b3d3004832f80e38c4fda5e
      x86_64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/745865d95280112b06c9c52cf4561691cc6269cd
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/5fa7b433352357c53712ae0b1a87be63df5b24a6
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/8d8fa311c0bc96b0ffc041f63b8b5c609a292001
        bfin |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/98a42516fa7e2c79e5529d1b5a8d44fcd60934c7
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/7b21414677856266f934f5dfd763a63aabc07a4f
    mips64el |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/daef6007f12301e08046c02d2a4799d1d3ac30bb
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/887b74101bb71a98bffe39f4a64e05f64386f83c
      mipsel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/e24ff772b6511e0498b348985be39e17f5fdd901
     aarch64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/4b221b43a13134635332501815a61691145b1d24
      xtensa |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/3850c6118c37d61b7250e3e7f596eeb9bc4a65a0
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/f078f7bf92b7a2d65aad503eeff9753a50d27f6a
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/44552aaba526c2282c00b702933253ce556207d8
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/ca121055b71bb5f69e0d53dd711bb2e5ea8e6c0c
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/38e399e0f63f69f316fcbbd190a8545ab6c6525a
        sh4a |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/99c55d9dd270e55b4619c05628a0733968ee330b
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/77f4f7c4d32d86f11acded985427ea63fd668eac
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/13634b788727e43d03ea3b17ef590983abbc30c0
       sparc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/855bd4ae4083786e35051a2f7e98095a98f16d75
microblazeel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/9f87c79bf9299c441e73c3354a5423c780b01977
        i586 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/ac03909799727d0660800f2cd0de569407447d15
    mips64el |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/37bc268a25c1dbacd03f648f61d1c83b7436b328
        mips |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/8f015883bbb57f9667a2cd8c219351380dae928b
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/12829555188e956f8d09b8909de7407aa2cf3b93
      xtensa |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/d916c4d72c418bf3dfb2d9922a9d18f8912a06b8
        bfin |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/eef32f5056a2bfc7449632d28ea55c59b2f42eb5
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/badb9ec391f9f0438d593a2768f2f6c6a873c021
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/fd0baa4db9147e6aed2cfd3b7fd5b239bf67c01a
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/517bc53cbfab3b19f122e3e338d1784df8f9f999
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/2ba3e2ec0804deb998d36bc526de5865d3168c5d
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/9fa778fd920ea46bf709d5e084d91fbf9ea13a50
   powerpc64 |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/37774495b7d8f9871ce778bd370c184e8e6a1a22
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/857f768b456a0fb18dd873c56540f8cbb4050834
      mipsel |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/2c3cdef2fedaaf63abdbbe7a59372803443fd9da
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/7546a01bf4b5dfec00bfd2c1038ab2146a25eae1
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/c716946324ab61c159635fcfe6d0de0141aafbd5
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/cf39dd3c9afc0a1f0450605a11901de2a5dbffee
     powerpc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/09931036c09f4777044a4b781016c29167564227
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/a1dab8f23f7f597e72fd26e84f7dff8869ccb82f
        sh4a |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/b42ddb2e722323f5a675d11ba60e86fb12c3c8c6
      xtensa |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/59cfa0aa5d34363e05aa2dbd5b2d461f21c6913a
      mipsel |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/f2c0836da87c882836be93ba5fe2737b7c4757ae
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/62c93321fd2f7ca45d2a0d8e7e5131c746333f6f
     powerpc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/71203be36911b40626a4421fa7890d1ddbb99336
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/8f544913208aa15510190e979085f33fb9a6cfd3
        sh4a |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/a858f76e0dfdfb6398c511d5702280f10a6d1e6c
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/ff9ead0e61e7608b6c3b18d9b1edbb41c5d73dcf
        i686 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/38ebdbecd1532c8651899daf533c63b3d9e4f08a
     powerpc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/1ba318e50108adcfe88c0a14bc2ec234948b55d3
        i686 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a3594efaa4ba56dacd58d93f86b72c47de3b7753
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/18f8fa388bde4b1f13c26a5fa2043ae88e48a29f
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/036e8bb3e26045256d1aaca84aba501ee1099845
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/e94356b18ebc1adcfee85475115f0e29e467a17f
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/c260df9611517dbb03a81a4d8436f78f3e515ced
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/efb268083b5fed94819e5ef35a4e37fcae00575a
      x86_64 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/2556b3266b913964bea25c21d014f4b1b25b6808
         arm |                  mesa3d-13.0.2 | NOK | http://autobuild.buildroot.net/results/f25e54ac46b8e4fd653a59df869ddd967b0874c7
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/990de5eddd84bfdc1ef67ee40565ec46d0cd5b32
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/4884576674dbf484ec507181daa824d8d9825c0f
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/06c7837b2485c2c7fec275e2397836f98809f4dc
 powerpc64le | phidgetwebservice-2.1.8.201... | NOK | http://autobuild.buildroot.net/results/ff8d6997a8f930026029acc56db337217604e238
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/d9dfe30d55b8832104d52212f33994184392eb2c
     powerpc |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/ff7176a344d7e87ee287f95f6bf360866c6c92c8
      x86_64 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/072b4b51ca4a57f22e5ccd03cf674fffe40d0145
        i686 |                     rpm-4.13.0 | NOK | http://autobuild.buildroot.net/results/b647f4942f0b2b8a3250a195f93cdd28dbbb5029
 powerpc64le |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/b88caeaf56031e889cf9557bd29c3ee62835aee7
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/4f65d787e713e81a0e3d4b61fca85d1003177f6a
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/156a67ffb96a6ec35d819133b0c5c4f3b9bde7aa
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/a3e25580b4118de9296f71c6e4e89fa31ef1bce6
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/617a6b5fb75a4205ef8ae1e84d82741880b754b3
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/21f7aa4ea72353a96bee06316c7939f60a7aeaf4
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/7c998e84f4b4a70ff2244e93ab669c6c591937a6
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/c72d5ba9213079e054e45e51fea795b6fdbee8f8
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/70dc2b2e95380ba4a0b3044ba96deb8b67f98643
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/25c7cf5fd63888d3b99510f91044b0ef6402691f
       nios2 | uhttpd-59e0c739634f46a164d9... | NOK | http://autobuild.buildroot.net/results/7c083c5c79c92043e6c818b49d2eee199d7d9bd1
   powerpc64 |                        unknown | NOK | http://autobuild.buildroot.net/results/868967f44e5a352160fb72217769b8ecca295fad
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/fdea55ea622f88f419e1a55b9b573ecccd8627e6
       sparc |                        unknown | NOK | http://autobuild.buildroot.net/results/6342d971c7e2a3dc07e4e5b9fe1703b018959746
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/4d9a804b40d0b56356119f33e7d1a6a670d685ed
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/695cd9f7522e2c19a4781ad6d8ab71e2630d56c1
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2e8b890dffb9200dee2a65e33a91e6aed6981a10
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/6ac66353e7586ecebc3ea21ed9ddd2e478e870ca
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/36f45b7f7edefc43d468c772d8ba77c7e40d93b8
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5dd5399f06253aa0132faf74e7a36a035aea64ba
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/87c3951cd5cc04568b258578fdeedd74cfd95688
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/1f0070161e5a2ada36e3d3f8c73fdedbe9cd90eb
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/79836ef0bb2e8134ac9d8e71c141d5b821ffa91a
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/90c6e4f3687897419f1a68b09718ffbf45fdedc7
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/f6effa401d6c2dab83b1df761966c5689a06546a
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4351805e13c9344f8d8ae0e628ad2b8897e0c42e
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2c40b905f64c6f71c148529acfe05bf311d60aba
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/3052c95184d0ff8a2221aae40fe1bb685933014b
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/06f6e365412b158f42df5496743a409961853d4b
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/06d9d02859c28a5c0a799acc36604eee87aaf72b
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/5140c0c63bad2d5e67f55798937583ff1d44960c
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/2464f3f320d4a2e1913400de6a7e0cce6eaca4c8
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7a550df6b7569e5d0981ca29ce0c7a0e3366c7f9
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/5ae0987ade5dd9b979a8a0b46921e97d88bb253a
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/a47297d7a0c8f196697f1644115ecb6aebb411f7
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/c3619d28fed59f25fc5b252fbb5801cbd9c49c1a
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/1c87648ea9777bc559d6a15b4f2e2c1ad33b1c14
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/d770c328641e27dc769f93916073b4b0349c92d3
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/7c0ce4003337c568ebb68ec742989df34b528219
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/761692ce2af7935f7b6a9dadcecde9c2eb00d4ab
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/244ea81a41c2b224f9e2ff70b0a50d7b3ddfd453
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/fb2ebc508d8968823ee769e61e167c7f998494ec
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/f6c10ab50cf5df5008de4b17ba207da22dfdf113
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f448d0a665433c38d2cdb2d0093705586293e1f3
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/9ca095181b226929f2a3bbde82ead0a82962f192
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9f6c17c16e4605f486a099521393d8992747c56a
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/f9c9970a68077fafe88cb26909945a4202844cc7
        i686 |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/f5eacf8c689922dc716560a1697fd5da71729874
      mipsel | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/bcfe2ad457f93c0ab33132e63205fc89b822202b
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/10fc2df6cd11b9f9acfec6ccbac2cd37b2bc6a04
        bfin | x264-72d53ab2ac7af24597a824... | NOK | http://autobuild.buildroot.net/results/602e0ced5e4c64f461e8c5e9c05c7175f1145e74
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/23933fa09159dcbba33c40cd6b63d3781ef074d3

-- 
http://autobuild.buildroot.net
