From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jan 2020 07:17:59 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-17
Message-ID: <20200118071804.BDA5F2002D@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  3  |  1  | 19  |
  2019.11.x  | 14  |  1  |  0  | 15  |
    master   | 87  | 70  |  1  | 158 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 10
                   mutt-1.13.3 | 10
                    parted-3.3 | 6 
             freeswitch-1.10.2 | 5 
              host-grpc-1.25.0 | 5 
                apr-util-1.6.1 | 4 
                 libnss-3.49.1 | 3 
           host-doxygen-1.8.17 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
            python-cffi-1.13.1 | 2 
           uboot-tools-2019.10 | 2 
               acpica-20191018 | 1 
                      bash-5.0 | 1 
                bitcoin-0.16.3 | 1 
                 exim-4.93.0.4 | 1 
                    git-2.24.1 | 1 
            host-mfgtools-0.02 | 1 
                   host-nodejs | 1 
            host-systemd-244.1 | 1 
                liblinear-2.30 | 1 
             libopenssl-1.1.1d | 1 
               libsigsegv-2.12 | 1 
                     lxc-3.2.1 | 1 
                pipewire-0.2.7 | 1 
           python-bcrypt-3.1.7 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.5 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
                       unknown | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/20f900e6551b60c19e15d8d24513d0a564c748d1 |     
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/51f2c1ed5e870241c84ac11ae84d3adc2f024b55 |     
powerpc64le  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/03979503b53072f93f996e1edaa78eaf7b28a34c |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/4a3fa32ff6e4c2474c47987449a1c573fd854f1c |     
    arc      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/cf2f522b7bb313c6205d247bcdc378f85792f9df |     
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/1aef509d65f1708428751d9ed483b3febdbbe487 | ORPH
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/7f432ea856f8cf9f34df36fba5d233b387e0af46 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/04162ea36289f430183d9830d9820224fe427e21 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4cca2ccbaeca2f6a85b676e17dce393c2228ec4d |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9ce9f301d952d49cd3225f3cb43bb974151116ca |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/fc1a34a52284b563be9e9e2a3caf6cdf9004eb5a |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/457d2bd39ed9fbf531ea173c3ef49f673475b3e5 |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f37d679be22ec8ad13843e3e4ee758b10a02d3bb |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/68f0923a78bb25054cc492643529bbe1cf335604 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/0469056910a74cd0f3173b7abdc9c3479e75302c |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b81ae950dd256ce7a312da6b1f5a0009b7954d03 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/96f421f5c7749c7a868602d6284a3828e73c20a6 |     
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/7adf30244f0a022ed5c64882973c1740d03786f6 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/69db303b3dafc1ddd822e1a03943eca65fb3dcb4 |     
    mips     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/93edf085a329cb0e0ab03bd39f321dea50695a23 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/9c85c5307c463a77559724d9fa3c3ef38e2e0b6f |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/c353270f0772e7615657158c0c2b16fc9b790e45 |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/5cd090703d504463dcbac72bbd5a6e455232fa6d |     
   nios2     |           git-2.24.1           | NOK | http://autobuild.buildroot.net/results/e0373dd5ff6a3b7d665f14e8c59e86139da97e9c |     
    mips     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/0e529581c0d1303572d2e47867e50ae9b17409ce |     
    arc      |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/cfeeac844d02b23fb828c53afe3c361471cef431 |     
 powerpc64   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d701f97b93bc4ea906763316c5a19e7b0dff7a86 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e9d4c0a98553ce8614686dd4bca83d7a6e866e83 |     
    m68k     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/a2ba810724407f2b67bfa034dec5403af2579fa9 |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1b252a1eae9649d715972bfe86c8535c2148d849 |     
   sparc     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8be2c0cccff6e777eb9ba7f4ac5640e16b4d8257 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/c193512ce2cf3928ca9afa3a7d8e50b5a6ca0f15 |     
   mipsel    |          host-nodejs           | TIM | http://autobuild.buildroot.net/results/90e52858eb2ac3f0ad693f88efef5852e4d24d68 |     
   nios2     |       host-systemd-244.1       | NOK | http://autobuild.buildroot.net/results/1a5faee7cb49b6fdd0af54ec4580d3174950fa2f |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/50b11290d2c759d5c1614bd74ea02aaed0fce0af |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/c307c1b0815c09632019d025a7a5c43313b2e257 |     
    arc      |         liblinear-2.30         | NOK | http://autobuild.buildroot.net/results/a444b2086fca8648365261938d02f1a59f4366d5 |     
  powerpc    |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/6630e061786c3d436ae5fabe6e90adc8f3b1bad3 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/7e595b94cf82b38958da10060365a2c249d68f5e |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/a881ec3f42c6a9a2f38dc0bbfff31b57d67ae834 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/8f2497e0c673ba2b13d52cb4f5ecb6fc03bb5c51 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2ef5fe94ab23eb0f33adf6ab060cbf8082b15875 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/6586b710687c86fa31a2bf27553425d722edbace |     
    i586     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/cd2c879d1d05f1a7449ba86a5af67cce56bc9ebc |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/febd427f64bbe48e47cffe9333a9d755170837f1 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/89df0d3bb748a1b191d03e8d859fbb184276924b |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/fc62fd0c34154ca52a771637adc597a758dace52 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/94fb3b27a46fd600fa932f9393483f3298a06af9 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/1ab51e0fd9918d6b821fd5c5edbb66c03e60f89e |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/92a9fcf9544a789e7c5e1fb309568ddfd8f7aece |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/278f04fcebe75aba7d183008142ec1d9a716e339 |     
    arc      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/4b31ab86e63eb43b839351b1c0a345b399a1c707 |     
powerpc64le  |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a897db44866ba9145fa932ac6b7bd953263f376d |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/6cc0576499e8f7009ef2b3cae52e14afd18c31fc |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/736cea667fa5226618b74403d0603848fa097402 |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/7318afc1069c42d4dcb5163fc1cef29d39f274c6 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/7421f6accffae4410f805cd8df518c8af8f89be7 |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/f67204cd09965688be4413b0cf9bd9e9021429a4 |     
    m68k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/34ec35dcbdf2934617deab1c8e688625f8bd08ed |     
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/268d12ce1c326bbc9a08a2a2ed8b0d3356649a18 |     
 powerpc64   |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/e1f8389b84c8ad6cf56a3f513c09f156317816f3 |     
  mips64el   |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/c680c124b9778d51e9aeb5f2ea8bf1143f264bf8 |     
    mips     |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/6d3b4e2472ebbc4aedf53881327d62bf39f198e8 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/b08a014b53cf8665a60c062ccfb6580b077f72ed |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/4d99593997aee809563f594454fa4eb16f30d08b |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/1a68b29e0dbd8196a741aa011c149223839d6230 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6585f0415ee6c46bfb7ef2a6cd4f2f6303a09798 | ORPH
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/6a5aa97560f56346a31b59faa8b22a6d946f16fc |     
    i586     |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/d2c6dc784948650f9fae8fcfce70aca085bc5f8d |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/73bcec5d1107c229f796d12f36d888542ace3080 |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/89343861efd957e79231fb869584238882a6d6b9 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
                     host-llvm | 1 
                   mutt-1.11.2 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/1d6f5f83f02af7302da2d350b4ba51eb4edd4f29 |     
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/f3cf760515a39d74570e8e344d2c6daf5beefc71 |     
    arm      |          mutt-1.11.2           | NOK | http://autobuild.buildroot.net/results/f05ab0d401cc5d1116f57d908b1a200fd0b55ab7 |     
   sparc     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/c85a86a90402ee4857697842ef4b33a729db7dc3 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

google-breakpad-7515ab13768... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/10552eb90b5ccf36fe44f04b5730fffe483bebd0 |     



-- 
http://autobuild.buildroot.net
