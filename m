From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 Jan 2020 07:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-30
Message-ID: <20200131071812.6B8E520448@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 14  |  0  |  0  | 14  |
  2019.11.x  |  7  |  3  |  0  | 10  |
    master   | 75  | 80  |  2  | 157 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 9 
                    brltty-6.0 | 7 
                 libnss-3.49.1 | 7 
              host-grpc-1.25.0 | 5 
          libmodsecurity-3.0.4 | 5 
                    parted-3.3 | 5 
           uboot-tools-2020.01 | 5 
                apr-util-1.6.1 | 3 
                    olsr-0.9.8 | 3 
toolchain-external-codesour... | 3 
               acpica-20191018 | 2 
                      bash-5.0 | 2 
          gstreamer1-mm-1.10.0 | 2 
          libpam-tacplus-1.5.1 | 2 
           libwebsockets-3.2.2 | 2 
                  ndisc6-1.0.4 | 2 
                 ripgrep-0.8.1 | 2 
                     vlc-3.0.8 | 2 
                  cairo-1.16.0 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
           host-doxygen-1.8.17 | 1 
                     host-llvm | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               libtheora-1.1.1 | 1 
                libxslt-1.1.34 | 1 
                         mimic | 1 
                 opencv3-3.4.9 | 1 
   openvmtools-10.3.5-10430147 | 1 
              spandsp-20180108 | 1 
                       unknown | 1 
               wireshark-3.2.0 | 1 
xdriver_xf86-video-amdgpu-1... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/4ea6cc3797876c21f3bedec3828786619040d617 |     
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/f2d7af16a2189cc6a8d0ddd27a3c9560696f0d03 |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/917258df659dfc22ee84502e0fc92268c7bf1140 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a15ec9d079ccb491b747d67b5e988bc0ecd84a86 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/88f8b63f6b1e03c3fa48f2152d6880e26b1a549d |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/32cf355da220bfbb8c8ef02b618f11aed085a49b | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/38bfe46a65c8c7d9078f7728be6c04dcb22637d1 | ORPH
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0f8b9b25c9f169b115c3ee193f73a9a627aef229 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/ac7e5b09b64d880fc009264aa7cac95f0d83a1fc |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/6115d5d02ec37403e8b200bec0092211f281e9bc |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/2eec6e06b7c2b2bd2372fcf5866bc82760e42dce |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9c1883f57f26ab026332026319a252d40eeab163 |     
microblazeel |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/bc99de05f05ca37be8ebdb85ac0ed47ada760f13 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/66b2f7e9142d0178d0b66426be0e65054454a817 |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/754937bb871db9ffd1e0692f18fc22d9a4989e0b |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/b62b44208fe24926ae6fdae957462ac0fdfb30a2 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/153984d7b64e7126160769eb8b8f13d0e87f19bf |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/ab7a0c6f71421e2139f1e3e028cdcd412d012695 |     
  mips64el   |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/d330d256fa59cafd74d300624540229117e3ec19 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3fbb8d8b967a903c1a84ec4208b47cc59666e565 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/98556a3f6e22c904a71423add6e0a30e35cca586 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/0358350ab4808e2cf277600e8af2d202e7ff0376 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a1a22d5d90c70aaa69faf27ab8b8ad9d9d3d7774 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3c97f3de1f80bc8db214d2c333b07fb23b8ed70d |     
    i586     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/7972f486fd5789058ea792af4f0d4c824b247aa9 |     
powerpc64le  |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/f936ad05bca4bb776917306700750ba6d2498ef0 |     
    mips     |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/be239c3845f41b32486f4f8856d16ff632934da4 |     
  mips64el   |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/f7b6822d49bf16b8f3a5ed3ccfac90aa5d3364ff |     
  aarch64    |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/9092a3bddc9fed3bb34ec9b78732c928ec46dd9d |     
powerpc64le  |      libmodsecurity-3.0.4      | NOK | http://autobuild.buildroot.net/results/33cd6cd72aa72dc91fe5c7a58bf338f4e04c469d |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/0a46d17d44b69afa8576b7a09ec825319d195489 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/4b261f2190042da47531699326ab62b24aa688a6 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/c7124ee2abf82631794dd46b4913b8f7f634751f |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/7b0d8e7bda10404647a7117855afe5d87df796b8 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/3cb0459749ed966e0f5929759a2db04e9ea085d1 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/34b720da67f973f58a0fafe09cba7b7282e1e783 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/1eb74e710efd9039788f1c8665f4d3aec7656ce8 |     
  mips64el   |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/2330b996f692dd06b77c4bce720cc608eca464bb |     
    arc      |      libpam-tacplus-1.5.1      | NOK | http://autobuild.buildroot.net/results/35aa5bcbc1e65e9c20bc8a4c897698c15f6480b9 |     
microblazeel | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/3aa51de696cdd980321077fe3914a0ed29afd514 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/bff24b5d886428834c104d6cab241faea4de6fd7 | ORPH
   xtensa    |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/867425f3ea352c1512c552cda0b7c5e03396e5fc |     
  mips64el   |      libwebsockets-3.2.2       | NOK | http://autobuild.buildroot.net/results/20da666aa0259bc648752649532234a3aae0cff6 |     
    arm      |         libxslt-1.1.34         | NOK | http://autobuild.buildroot.net/results/bf3ca4ca0bbd211dd577803f588b12affbc7fa60 |     
    arm      |             mimic              | TIM | http://autobuild.buildroot.net/results/14d8dcabc42a2b00f688ef1b3fe6cff3081eb8e1 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/7ccfd680a17e3f9db7f4b06891d0ff73fb3f75a9 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/9208f3ffdc8c06176a3c88e52c2454dbbc1151e1 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/caa9392b1725f1f00658eae72f021a2ac85aba01 |     
    m68k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/45db92f28ca1514ae8e4870d73aded19be1a4a8d |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/b389d1d33e0b54b06412026efd2f1ab7fcf53e1a |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/24ff03ef51d057e8fd13332e5b69e22236452ce1 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/e4245d0c423756f98a9328b2b5d8b4caa67fec8d |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ff010276ba5d5b97adda9c47d120ae064c7db591 |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/ad2272dfe2744e2b24bda67ec2c7695b26db8cdf |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d115f9b4c51a858f4bc3900a1c101c7ac9acca91 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/a9b466b3ce8134040c76eefa28035d890c5725cc | ORPH
microblazeel |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8914ec455f93f341bf18379e1f80c698a828250f | ORPH
  riscv32    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/2807493e22111c2a5955b6e7251cbaa073feee66 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/8d03acb2c96060051762307ab43b1d7ad377a524 | ORPH
   sparc     |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/48d8de5f4906bd94b5b39f9e76ff74e4d31b9b7f |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/246de94e825df4563f1e05a51f73536f751d9e18 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c36628303d1095cfb64288f4c0cf46f6d78f55c1 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/904fdf041c5addc813365e2db1084a43e1fe7598 |     
    arc      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5485ffcac56e789bc0f24fefce300c1489ef70b4 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/e53b7fa7bd06c54924b4e1b94b09139ab650679c |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/51cdf5c4fd584f242d64de1cabd3807a8551aa15 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/a03b63686c801a771829b48944bde87ee01d21db |     
powerpc64le  |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f6b74e1c9e8d86b7f6db739a230278ce79d77a22 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/8d95975f13621913a9b8a6c7dcae7187d652149b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/8a9636105b3c463f69a6eb94dd9c329b70da31a1 | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/e63ea29d5e0b1447d185d0ee6d61efdf61f106ef | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/4f4d4e9bcbfffd31edaa92903ac17d651314c22c | ORPH
  mips64el   |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/60a68963cb36bf4a8fed25f3ffb1ea6697ad0ccb |     
  mips64el   |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/551695cbceb34298b6c25ad39f2a0a61e464735b |     
  mips64el   |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/cd08034c82cb333c55c65dac3831d07db555e581 |     
  riscv32    |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/861841cb610486fdb96eceece6730306fae660d8 |     
    arm      |      uboot-tools-2020.01       | NOK | http://autobuild.buildroot.net/results/24f86c29fe9d357b76ba42131bede3fe13d336ac |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/983f7c25faa8dae1cfe201ff1e4354f0b627a8c5 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ac070564fceb594cd0bbdf65af1e73b075a3f6bb |     
    arc      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/80f2de94c809c2743dc4f0b064398c15101489a4 |     
  powerpc    |        wireshark-3.2.0         | NOK | http://autobuild.buildroot.net/results/c22e556c2b2aa70a7813f522ec757e9595286e6c | ORPH
    sh4      | xdriver_xf86-video-amdgpu-1... | NOK | http://autobuild.buildroot.net/results/74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                    czmq-4.2.0 | 1 
                haproxy-2.0.10 | 1 
                qt5base-5.12.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |           czmq-4.2.0           | NOK | http://autobuild.buildroot.net/results/2874b7501fec297810da67f5e3b8d58e609826d2 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/5372e4cd5c6f1225b5c6e845440314eda6e27baa |     
  aarch64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/3eb0eb5bcf40710d528207b5bd7a5879dd0a0216 |     



-- 
http://autobuild.buildroot.net
