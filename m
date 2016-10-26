From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 08:30:34 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-25
Message-ID: <20161026063034.60C851036EC@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-25
================================

      successes : 202
       failures : 72 
       timeouts : 6  
          TOTAL : 280

Classification of failures by reason
====================================

        host-util-linux-2.28.2 | 20
              python-pyqt5-5.7 | 7 
                 libnss-3.27.1 | 3 
                     xen-4.7.0 | 3 
             berkeleydb-5.3.28 | 2 
                  cppcms-1.0.5 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
kvmtool-372f583d359a5bdcbbe... | 2 
                  libffi-3.2.1 | 2 
                 lvm2-2.02.166 | 2 
make[1]: *** Waiting for un... | 2 
                 mplayer-1.3.0 | 2 
                    mpv-0.20.0 | 2 
net-tools-3f170bff115303e92... | 2 
                  olsr-0.9.0.2 | 2 
                    php-7.0.12 | 2 
                  apitrace-7.0 | 1 
                coreutils-8.25 | 1 
                    cups-2.1.4 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kvm-unit-tests-0b04ed061003... | 1 
                    lftp-4.7.3 | 1 
make[1]: *** wait: No child... | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
make[2]: *** Waiting for un... | 1 
                   patch-2.7.5 | 1 
                privoxy-3.0.26 | 1 
python-libconfig-b271c3d9da... | 1 
                    qemu-2.7.0 | 1 
                     qwt-6.1.3 | 1 
                  squid-3.5.22 | 1 
             tinymembench-v0.3 | 1 
                xfsprogs-4.7.0 | 1 
                 xorriso-1.4.2 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/afa00060d5ce5238bf4927ddb9e568baea4c6f26
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/c568fc808b63df25204799229a7ed7438ccde334
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/6653fc645e8718013494b7eff208e8b8df3a5c1b
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/c869c2f8b5e7aca09b1fef68de900deff1cb4aca
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/b024da615f2c7b8d407bb528124a8c96a2ef5ca9
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/fb791c09528f96555101b6329569a451e2eba9cf
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/24554ba5f7b1a03c7a2585732286c5d4b9dd7642
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d30a77b0a78e305004765f650a5468d8bda8942c
    mips64el |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/6d2027a7c02a326e1fb6447dee98c1e6f14f49a9
        sh4a |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/b7b8799a3df5000571ed16177fe336a49ece014d
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/d2c3b5b4bf6236c472a063455f4b25ead0052044
        m68k |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/51ff4c6ec7c430c2d4cad5a5d9f979c89f8173ef
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/dc18093d01e48bc17a8fb7fde11372cc7544c180
        i586 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/ad35a0527f56195d6c48697d206fd56da4752ebd
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/68152787a97bce74c70e60e74d877b1a543998ed
      mipsel |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/e8413b6ff28df8d0e97f165752f3a1bda9448372
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c67ef01b1acde3ce231066d098dcae7910e9f931
     sparc64 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f3892b948b43a7f6d4de3114f2baecdae8b20256
         arc |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/3ee60de3bebcadaa8a66466872ae7e3fb1639437
        sh4a |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/c5aa6ba84180bd55a395546c298dbf4d236a3610
    mips64el |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/af58c6500a0934f2206383649af2d591b8a7bc78
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/dacfe6ca488d080577b8f5bf9aa5a7698506d6e9
        i686 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/bf9a352e754eb24e91659d26cea6cd5e98cc1968
         arm |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/16e13a288ab14e40d8c980dee3cf73179019e4c6
        i586 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/7815ae1543c1c1b6fd78d22a914a4d4dc52670c7
         sh4 |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/306996509b90c70b44aadd0c469ff43b63b39383
    mips64el |         host-util-linux-2.28.2 | NOK | http://autobuild.buildroot.net/results/f3c1429690a2ab1abd7e34d5d80ee0fb517bf0f2
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/68b7aac4c2228d5b085194828b3b711f88aa0ede
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/679776dae9ff7150eb874eb0dccfef875a2b8a8a
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/9c047f586c6511a2b9b4bc5131ee932f3c6505f0
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/0dfd2729428c5a8f9998da2f4b48cf2533197cf1
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/f13117617d10585a850cd1ebea8d9c20c92a3bda
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/e8b7e524b7e1c4fada5c01b8b5d0e02820193bbf
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/faa52a1769f46bf697ea02e6c8b5157bcc549989
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/746d409611f730c1b19b2a95952bd585c1309a75
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/22c017bd76423b4549909cf3880d5a6c205645c1
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/546e553e71f84cbd9df96deaf7e340f46038921d
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/8e7d60710f75dc100410451cfa88f3dfd81f6c0e
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/a513ba50d7db3ced4dca0972dbd28c2c8649496b
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/b7603a4b09b5c2644b98e966bfbeff8ad405ef0f
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/52b1a16d89d16e1298bea3eb4439553fe653049c
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/c7b47287173cb8935c2abc063f65b6ff051bea67
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/75b6f0e06682be13c9f5629c329a9c97f4187c9e
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/38c2e1b9e4892de98b011a1e8be8effe70c158fa
microblazeel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/9fecf6e24b86f1cf2c7d5ed6f09c7a4f05c2db8e
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/c335845ecbc0a12b71f9671532188214a49d81ca
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/7764e7aafb5b4946b6d65f58f85cf37a63640a39
microblazeel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/2f49018a61671caa02c43d43565b446cf6ffc952
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/d8a311d58d24f13ded349ab7b204454970407fab
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0c157ca60d7477509c84b259226f1287951a5a83
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f661ccfd59530cb757769b904400b991a3d70475
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/0b7b42a72ac2bef2dd476e23a71f87adad6690f6
    mips64el | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/bfdd682a1972ab32e823de27e23f82c4a38b9d95
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/b08999eea466a64d7bd840ea442ffa9ee65d5b63
      x86_64 |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/a03c7a3a055413047088d988d7fd297dad76af48
         arm |                   olsr-0.9.0.2 | NOK | http://autobuild.buildroot.net/results/c432d82987528b3209f0b98be50d1a8deac3aac1
         arc |                    patch-2.7.5 | NOK | http://autobuild.buildroot.net/results/1da0ac3f779542431fcac615ef98255c52996436
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/85ea09188f1e996cb14b4b83a17736c096c569a8
        m68k |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/cdf91105ff105d6f0d8fe8ca88b989b12bde0e67
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/b63b258ac052bc20283dd0999d2dd60c357e363c
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4baa680afd7bcd257db233feba1ed9de227f2ce4
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/0306710e0f39591dba74f24aff40f7f094bcfa6e
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/1397a10d4aea51d79f70f9172de53112af2038cb
      mipsel |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/caf9f2e1a848b43dbddd1aba8b394ccedb5713ea
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/80cc114dc9e1264f052ed720cc0961cbbb2e5c46
    mips64el |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/2539fc99ed39d49b58bfdb5db6b72a50c0b562e3
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/1bc1e569fd7b3e7facdffe44357f06872a89a424
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/f28fd71b4e0a3dedbfed88fc35f8a0b16d601468
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/323f33c7fa35d15f263c2ad33cf21866c3f67f01
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/cc136f87dc861179384ae3ccf29fd594c15aee23
         arm |                   squid-3.5.22 | NOK | http://autobuild.buildroot.net/results/cbfe9182229bd35d5b8b55c1e3b930dc6efabf23
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/c9c4245403460865a6c009e921a5ab672291ef13
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/6047de8228b8eb41297aaf617a270b7f73709ab0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/e9df9b623876a7cc01b929c0ab39028922932c6e
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/186058b15adee71154dde93a85c7b7aa9746e556
         arm |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/177a468f8318136e08e101e03d58d6f342d5e148
         arm |                  xorriso-1.4.2 | NOK | http://autobuild.buildroot.net/results/04b24df1e2835260edc30e87f2d783f62ebb6cf9
       nios2 | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/c307cfae46b800603b76f623840bd0fd950f0e3f

-- 
http://autobuild.buildroot.net
