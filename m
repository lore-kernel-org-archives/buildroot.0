From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 08:30:29 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-12
Message-ID: <20160613063029.DDDCF101A53@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-12
===============================

        success : 212
       failures : 106
       timeouts : 1  
          TOTAL : 319

Classification of failures by reason
====================================

     python-dataproperty-0.3.0 | 12
                 log4cpp-1.1.1 | 8 
              host-libxcb-1.12 | 7 
                flannel-v0.5.5 | 7 
              e2fsprogs-1.43.1 | 7 
                   efivar-0.23 | 6 
                    owfs-3.1p1 | 3 
                 mplayer-1.3.0 | 3 
               libcap-ng-0.7.7 | 3 
             bluez_utils-4.101 | 3 
                    cups-2.1.2 | 3 
                 jack2-v1.9.10 | 3 
                  cairo-1.14.6 | 2 
                  boost-1.61.0 | 2 
            log4cpp-legal-info | 2 
                openssl-1.0.2h | 2 
      host-gdb-arc-2016.03-gdb | 1 
                   erlang-18.3 | 1 
                  connman-1.32 | 1 
      kismet-Kismet-2014-02-R1 | 1 
                grantlee-0.5.1 | 1 
                mongrel2-1.9.2 | 1 
                blktrace-1.1.0 | 1 
                  stunnel-5.31 | 1 
          sane-backends-1.0.25 | 1 
qt5webkit-d2ff5a085572b1ee2... | 1 
                    mpv-0.17.0 | 1 
               linknx-0.0.1.32 | 1 
               openswan-2.6.46 | 1 
               linux-pam-1.2.1 | 1 
               libgcrypt-1.6.5 | 1 
                  squid-3.5.19 | 1 
          libmicrohttpd-0.9.50 | 1 
                 php-zmq-1.1.3 | 1 
                    libiio-0.6 | 1 
                    gdb-7.10.1 | 1 
                 omniorb-4.2.1 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
make[2]: *** [sasl.o] Termi... | 1 
                cifs-utils-6.5 | 1 
            lttng-libust-2.7.1 | 1 
                     vlc-2.2.4 | 1 
                pinentry-0.9.4 | 1 
                  multicat-2.1 | 1 
                openmpi-1.10.2 | 1 
android-tools-4.2.2+git2013... | 1 
                     tftpd-5.2 | 1 
                  qemu-2.5.1.1 | 1 
               libupnpp-0.14.1 | 1 
                 mesa3d-11.2.2 | 1 

Detail of failures
===================

        m68k | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/dd73fa6248df59dc5508be3d39916cc125721fc6/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/9ba6e045d2afcdb630375279541ca33355cfbf8a/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/8abacaa944a8771f7465d761673ea422ebdbd0bb/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/542df6f14ae1092bbe250f4af667718daa15f4ae/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/b9a51b4d4a272a8808076aece1bb433215a5faad/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f889e110f5cb21248cc7c5528bb9d55e0953312f/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/1dd91e406a3aca1b26873f841c1b2e6108729694/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/8549c425b78ff8dcf69d1a9b46dfc3d279f6a04b/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/814456ba65c0269f690cc3c90e875ecdfad38114/
microblazeel |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/043b93ecce404c40fd3891b69c3589a68b07dcfb/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/b5bf56d0d424d5c3041fd0f13b4c8043aed9613b/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/af28483773f820236037b6c0db80856b578c8a70/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/955df3c8f99398c2154b9afb9dbea70207a59604/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/0182854744fe2e95a22ba3d9f40f6a01ca003f42/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/37af854188d39e614b65ab09341d803e39ade48f/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/f9115d329b937a94a9aad7662221f8f87cb77000/
     powerpc |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/c8a4822d70d26c8c6546a258898e82f9855100c3/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/b71123c7d21bbc0b8f56dae5d63a03300a040e0d/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/e6c255b90f3e71453e0290d30298f227542b494b/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9effa5e8f786d06f294a41446fdd779e6bbdbc99/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/98bd52be13a1e80afbecaa3cd9f5a18bd56ff753/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8ccd154b2b1dfc87bca9d3b351958126892060c8/
     sparc64 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/56674612cb60f0fa7b6db19665648c16aad0a571/
       nios2 |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/8d54d18cb9795995026fbc0d546b26d5cfdb659e/
         arm |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/0ebb9f884fa38a4ae32790b8299f4aa8f956b6d6/
    mips64el |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/e01361e4448ec9b12f253bc74d320be4a9432b6e/
microblazeel |                    efivar-0.23 | NOK | http://autobuild.buildroot.net/results/1f4e3a4668c0ea9db29c543e19e7c05f2c2f9329/
         arm |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/6e6678f7107bf8e3482389f94fe035091c5c056e/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/dd176e9c65bf57f6523ae011f1d141d604410e6a/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/e7133b6fef30c9893e8eb9eeb341f8e45578db7d/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/cf4ebae503a55dde94b2f86f2fe767d3ca2e8c01/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/595db2862d4be0613f30fbfb6d2747d76f2a297c/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/16d2008466782c146b5327dd1e4667b5c9353df0/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/59ecca5ee3c98b9b9251482440cf77bb11ed68e4/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/1ff5607a60e1c5e2dde5f0893b7b5817a5811ca7/
      x86_64 |                     gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/8de61806103d0de6c248070ad8b5091d50739db7/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/6e1bd9a4cb860e691c49580a8ad920039d9383a7/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/dc2e26a5bb1c2fa1e3936e1084b7466aae0e3464/
         arc |       host-gdb-arc-2016.03-gdb | NOK | http://autobuild.buildroot.net/results/4a1cd9a0beaff34830fd0f0ec47c30eda0a42d54/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/7760f8aadbbdb65ef979189578f95c4cccc33790/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/ee68194004a1bfcc7c8135705d1b9f3fdb2f5882/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/52aaa06784e40090398dd394fe8a9eb97831ad03/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/e994a639b7fca81b75faeffaf7417160337e704f/
      x86_64 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/b84f81fb2729c3f80251d23426ac972f84ee8e6e/
         arm |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/5d68563dea8a26f8188e808a57eb4dcc188a8e62/
        i686 |               host-libxcb-1.12 | NOK | http://autobuild.buildroot.net/results/f918c4fa1d0f2fb4a4f79798b547555c5e52493c/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/af101e081c3b4bb55107ec3e1b1350a5f7aff8cb/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/50d4a30c34590a660bcd24e95bd02d18d4b11d8a/
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/f7ce1ab21591f61c6da3ccb934edf886ea2b6266/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/851f25f4be17780dead774b96d950b256c33fd46/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/aabc982e6fcb42276dfc73ed9263d77279bfda5e/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/36746909152a628a9977c978b9a88351da082c02/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/c38f9b92451807ee7e6db9cf5080c1bcc0e025d9/
        m68k |                libgcrypt-1.6.5 | NOK | http://autobuild.buildroot.net/results/9b36522602cca85f19c3a3c0b82dab47ca909453/
microblazeel |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/72315ba2571b4d410f15e84ee411a7d683101bf1/
         arc |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/c0ef15838d0465831e878b7146416f2da3cca44d/
         arm |                libupnpp-0.14.1 | NOK | http://autobuild.buildroot.net/results/5958187777b4e1a86cd31132ef48f1417b2c09f3/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/16865ed018502b4efc59965de062c0e71fa1321e/
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/a87148fafd1e9b943ff9dbb8970fcd9011a89000/
    mips64el |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/b4b4473ee6d2820a97f262f48f6a05bd53f0bde2/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/83705e019a6e2e898e8b5dad0def76d79a9b78ab/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/5bbfbe547f0b0f2926d4923e1230b55a9c3b983d/
         sh4 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/c16a289e47a5a3c62ad646a91f849ad73d9ef87c/
         arm |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/f10693e9cbc33c2b2c0e5540a3daaa6067ecca18/
      x86_64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/db65e274487a0be7a8631daeb8806579c32939f6/
     aarch64 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/ef610a21ab502e7c848e570336f28bb36d6842e7/
        bfin |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/3dba934da8ef59440df790c692f05850ed18d164/
         arm |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/e54adb363b54e6cbe3d079294c5f5b6a3fc89d5a/
    mips64el |             log4cpp-legal-info | NOK | http://autobuild.buildroot.net/results/023f5f3d90b71a6ea93d8cff25fb0f899e080249/
      x86_64 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/4156ba280eb7db03b9c53cff004e626b50131cc8/
      xtensa | make[2]: *** [sasl.o] Termi... | TIM | http://autobuild.buildroot.net/results/720d075115ac4b8f6246cda8ed48dde811373ab7/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/91a7ddb7a7f2d3d20afde56dc189d490974aa904/
       sparc |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/a5718829676d817ebec26a398dfd8021a21187df/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/5de94d44160e246bd41d3a62dfb89c05d1b6273a/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ac0afd92f4a76bd8a774e4d1a48aba6b8358f3d1/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/15fe5fbb1481ac98c15a51dc839f2f2269bcd07b/
       sparc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/61d6460ffd6eeec572a32078a301ec36cbe215d6/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/813963158a9da93f72d0325aa508b924a8b4681d/
         arm |                  omniorb-4.2.1 | NOK | http://autobuild.buildroot.net/results/fd447509483604353b748dc5d9cc999f1484c009/
    mips64el |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/87eab5c18d62b340c9fff4e10ff609e14ba6cd8f/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/558a880f1cb936df3a582ba500a628ed5b1114de/
         arm |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/3d8442d9a86eb6eb0a8283676cfe06581937ad3e/
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a236ac108434e01f00c6a84a17d23f28441b1e80/
    mips64el |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/17848175d07e6467951a7c5e7b8d7dda1ca4ee9e/
      mipsel |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/702a1726f481df8e478a571c5271f17b60500c27/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/c17aa67174f824d763590e9e9485bff4203e404c/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/e9b669f3b7be879326abc33480764fabd3fa4f4b/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/1efea1222d3fcc9ffd03cc386508c4af5b7c3900/
    mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/2f03aeb3644ad759951c537b46b0391cae3a3979/
        sh4a |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/1b21d27024b7bed2f165990b534c902166693e49/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/8b6c64822e35a4396c62b95b7d976b58eddc9cc8/
      mipsel |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/e6b7a019d39ed42ac27afe46d596e3017cf902f7/
microblazeel |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/0c1d6c55be2e3757699f334d6e0df39103318b70/
      mipsel |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/bab9c90965762d6f0caab13fc97b0d9355a77e29/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/384675895ee07588cc70d2e9b02ccadbea4e3166/
      x86_64 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/3e418267389691c0866e016b6818c94e79ba102f/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/205d0e6281663d4129794c85c37b5b423d75d147/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/a6e893a9270df1ca69da16a18ddee86887bfcba4/
      xtensa |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/3235195092d28a8719c8d99bda15ab03fa49e895/
    mips64el |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/f6714b40414ed4a801231b5c9b98e67be55f7123/
         arm |                   qemu-2.5.1.1 | NOK | http://autobuild.buildroot.net/results/d3b7d7551debd1f9429a807aa3c7deeddfd019ba/
      x86_64 | qt5webkit-d2ff5a085572b1ee2... | NOK | http://autobuild.buildroot.net/results/839587922bf97b9bb64041fbc39954c7cc5bf8dd/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/519401f077092fc61dec6ad827b3dafdb2fb8752/
         arm |                   squid-3.5.19 | NOK | http://autobuild.buildroot.net/results/96b56de05cb1b42c51ddbeab6844817f169d2c64/
         arc |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/6122a61f5c5996e2d5ce4e2550dc1dda8181a60c/
       nios2 |                      tftpd-5.2 | NOK | http://autobuild.buildroot.net/results/578f638dd31aefc0fd4facff54922d2dbab06e88/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/94bbed750e1945a248e3a4f2ca2d01ad9d3da07f/


-- 
http://autobuild.buildroot.net
