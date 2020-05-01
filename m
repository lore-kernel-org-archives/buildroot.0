From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 May 2020 06:27:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-04-30
Message-ID: <20200501062735.BBE2588F2D@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-04-30
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  5  |  0  | 30  |
    master   | 216 | 143 |  0  | 359 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              exfatprogs-1.0.2 | 17
     python-argon2-cffi-19.2.0 | 15
             paho-mqtt-c-1.3.2 | 7 
                  assimp-5.0.1 | 6 
              gr-osmosdr-0.2.0 | 6 
              ibm-sw-tpm2-1563 | 6 
                       unknown | 6 
                     avahi-0.8 | 5 
                    brltty-6.1 | 4 
         host-exfatprogs-1.0.2 | 4 
                qt5base-5.14.2 | 4 
                 rocksdb-6.6.4 | 4 
              bitcoin-0.19.0.1 | 3 
                      fio-3.19 | 3 
           host-nodejs-12.16.1 | 3 
                  ndisc6-1.0.4 | 3 
               apcupsd-3.14.14 | 2 
                 gnutls-3.6.13 | 2 
             host-libsepol-3.0 | 2 
             host-pango-1.44.6 | 2 
               libupnpp-0.17.2 | 2 
                 mesa3d-20.0.5 | 2 
         uvw-2.5.0_libuv-v1.37 | 2 
                  zeromq-4.3.2 | 2 
               acpica-20191018 | 1 
              alsa-utils-1.2.2 | 1 
               belle-sip-4.3.1 | 1 
                coreutils-8.32 | 1 
      dovecot-pigeonhole-0.5.9 | 1 
                 exim-4.93.0.4 | 1 
                   expat-2.2.9 | 1 
                    gcr-3.34.0 | 1 
              gnuradio-3.8.1.0 | 1 
                 granite-0.4.1 | 1 
                grantlee-5.1.0 | 1 
              host-erlang-22.2 | 1 
                host-go-1.13.8 | 1 
              host-grpc-1.25.0 | 1 
                 jbig2dec-0.16 | 1 
                  kexec-2.0.20 | 1 
                libxml2-2.9.10 | 1 
                   mimic-1.1.0 | 1 
                minidlna-1.2.1 | 1 
                    mpv-0.29.1 | 1 
                   ncurses-6.1 | 1 
            pkcs11-helper-1.26 | 1 
               protobuf-3.11.4 | 1 
                 qt5svg-5.14.2 | 1 
                 ripgrep-0.8.1 | 1 
       shadowsocks-libev-3.3.3 | 1 
                   uacme-1.2.4 | 1 
                   vlc-3.0.9.2 | 1 
                    wampcc-1.6 | 1 
                    xen-4.13.0 | 1 
             xlib_libX11-1.6.9 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |        acpica-20191018         | NOK | http://autobuild.buildroot.net/results/228046fe005ee1b3ba7d3822908faef4881caf06 |     
   xtensa    |        alsa-utils-1.2.2        | NOK | http://autobuild.buildroot.net/results/092868836aa4e8e61c0db75323ac25a97bebabd1 |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/392892b2f11171a3634310e32dec7ca8fbd74188 |     
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f0a66acfdb965388c1895d352488d63b13b5ef0b |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/a876f7ad2ec02394853f6cb920186ad7b9ce5a33 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/10f252bd4c0ef17ff8d6789cb00b7fd175696ce3 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/bc5077afdf7ab374a381ff1545baa065b644c659 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/38c1ad12a16bcd52aa031490cd7b68ecddabe786 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/d11a421ef221e683c40fba1f0e01de3ff3190fd6 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/8523f791c49a98f85322bb585bb111da39ba405a |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/d062f3f5aa3c10323d53d127fc1aaa03764f0232 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/4367b4cb199912378d8b0864c00d5522e85bb8ca | ORPH
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/3f117d38644fcc0c120ec78209cd5f5df7cfcb60 | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/9a6b8412ba6e687f69b610058d89ae47ffc7a02e | ORPH
    arm      |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/a74da97f70d8860959224f3f6f62e3fae24d1049 | ORPH
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/76a2c2ed45dd85746eeea71bacdff77597e26f46 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/3c4fbf94e9dbbb5f0e4b4eea24e2047e5a671cd8 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/a6b35c327094e9b078365049983e5f53e7a5a31e |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/45da06da00f5960f4eea2bfa051d7bc5bab41b69 |     
    m68k     |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/6dec75e278f0fdcf77f10a62476a80d31de562a0 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/c3d5b6a4b47a9ebae9be83f2269b38e014732ca9 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/3e5a6517321f07943018af4f2f815842afb0e0c6 |     
    arm      |           brltty-6.1           | NOK | http://autobuild.buildroot.net/results/58f6ddb3cfa65192750fc1b009b6d3d0e050c30b |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/04c950c6c2f0df63f76cca03f4c335c8ed0315ce | ORPH
    arc      |    dovecot-pigeonhole-0.5.9    | NOK | http://autobuild.buildroot.net/results/afc3283829c133e92bea61a3fe01fe563493c308 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b9c485f53f7aa3e41c0a470a09f3d66c444eaf8b |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/eb3fb0097c22a18d1b7241986f4dc4bb858dca8b |     
 powerpc64   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/50d199cce3e79bbad485328fb7147684304ad36a |     
 aarch64_be  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/a17f79378be46d824d74c505a14e5786e88ed12c |     
  sparc64    |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/216e7927c5a3881ad69f9225cc3cc33c5ed0e138 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/5b10817fee6a6d227b6d71c79cfaad9abb4c9394 |     
    arm      |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/73777db9be56223569ba48c5a5d8d854ac8fda23 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/da1a032064308c61b9f9e7c89010cc96eb655419 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/f24765de154696b055b7eab415479bb8692b13a8 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/f769a53c905cd22a70dec879225ebb2620807e9f |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/2444969f2a85ed14dfb5e3973edb10bda06663c9 |     
  mips64el   |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/b88eca6034a3f17f6361df61eb1e052023a68dac |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d02c57dda5a66631d68a957a0f645cb17b7f2efc |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/c54b7969b23447110f1e3fae1cac786c85cdbce0 |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/8d77c2afb28350ab5434aebeaf7c1fcc87b4d14b |     
powerpc64le  |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/d5088f085ba1ac5173936e8be5fbced59d46328a |     
    mips     |        exfatprogs-1.0.2        | NOK | http://autobuild.buildroot.net/results/4ac1e374491ccbd9a2359d54711992b40579bcb0 |     
    arc      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/d2c7abfe08672e53ff890127f787f8d2e84860f4 |     
   xtensa    |          expat-2.2.9           | NOK | http://autobuild.buildroot.net/results/1876764b5199f2e17ffa6740acfab261966dd18d |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/3445a7b689ebf3e06a5e44148511d6c385e11f48 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/e372b3879eb2ce74fa423158541e4f5c6997e1b7 |     
    sh4      |            fio-3.19            | NOK | http://autobuild.buildroot.net/results/2c0c0f6beb119adfe1d27099422bebaecad20d4a |     
  riscv32    |           gcr-3.34.0           | NOK | http://autobuild.buildroot.net/results/136d8a47c54124714eeaecd3b1b0c6749e0c7c67 | ORPH
    mips     |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/b8785ba8324ade160ebbe1bf87d3f94c52ab89d3 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/c97f056ff79a843c898792492579b6b3d808d829 |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/bb1cfd08b9632a5e2824ab7b03940efd9cad002a |     
microblazeel |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/25d598d23d48c8d1a2caa8ac01a767fe385a23ef |     
  sparc64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/f729fdfeeaceadde7a78ccb71a5f803c2bd0b78c |     
  powerpc    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/c9a73ef948f3f645abb4d430bd074fc3b35d83d1 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/e019f90ad035287f370db8f706cd7fd635980385 |     
  riscv32    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/e15bd137ec8feac4eb25f89508bb96a68e950088 |     
  aarch64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/fa9676b73e06acafdf79e8ec06c9363edbe0fb03 |     
   x86_64    |         granite-0.4.1          | NOK | http://autobuild.buildroot.net/results/aeab8bc2abfe75b6c0f20f5aadd7cde2f71b701c | ORPH
    arm      |         grantlee-5.1.0         | NOK | http://autobuild.buildroot.net/results/affec034470988b0b13235938c1fc3a855828053 |     
    arm      |        host-erlang-22.2        | NOK | http://autobuild.buildroot.net/results/bdfd0a297bc07aac6b417a244cc19e4e3a35e58b |     
  aarch64    |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/197a52f65cff3314965334ac494a69e9c7763d2e |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/0c39ad4e2ab399c7ede569798df631bddc051705 |     
   sparc     |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/908cc2699fb19341a9837803f851498183184477 |     
    arm      |     host-exfatprogs-1.0.2      | NOK | http://autobuild.buildroot.net/results/485fb26b895b770a99bf100a13a82d4487297773 |     
  mips64el   |         host-go-1.13.8         | NOK | http://autobuild.buildroot.net/results/7f3c0091c2d5b5cf5e5623debd4b088a43481964 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/43385818062c92b9d6b7cb218ad55b34d18b58e1 |     
  riscv32    |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/022c74bf5a9e0b432d27fa5fe4d38d584459ef07 |     
microblazeel |       host-libsepol-3.0        | NOK | http://autobuild.buildroot.net/results/605c90d4dc220d3e87653bf608bce83775e34976 |     
    arm      |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/9cb5e05926ba27fd3789e6d7bd4e31ee2c6f7a23 |     
   mipsel    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/46caf6d5d6b3b4d85a3ceded39ab17da582cfbdf |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/b40e82f147b46e9d66e959f994fb6977e54904d1 |     
  riscv64    |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/d4bec187eb50a4619f8ab077e5b2cd9288992013 | ORPH
 aarch64_be  |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/2604855af271d9eea560efc3848937bfbc6c37a4 | ORPH
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/502d047d477920fda21eddbc82e6fe7094bccbcf |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/7cce8b7ad19a48b36a38ef8fd88b96fad30f05c4 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2623ae81af2a6e2bc89b57486a67880f1ac5e045 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/206032b699f7641dbef24ba2f561e0f21722e5e5 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/762cc1188fd5e4e44fd5f7526a694425a9c98039 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/e6f8e29aa1ac8960f02bbc77c435221caa285697 |     
    i586     |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/c1f7c395d9c28a4b908f80b49bfca7733362dda8 |     
    i686     |          kexec-2.0.20          | NOK | http://autobuild.buildroot.net/results/2615416f9b243b8c847206aeac6dac0716767c77 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/05051786588d9d695166e5081009605c48fa52cd |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/605887ab53cce9956a1d24f8f70355958de14691 |     
   xtensa    |         libxml2-2.9.10         | NOK | http://autobuild.buildroot.net/results/7be936e5083db8bbb0c8b7123ebf66e114bdb181 |     
    arm      |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/aa055632c18e98539f516e6c2b06694db17d6ad3 |     
   x86_64    |         mesa3d-20.0.5          | NOK | http://autobuild.buildroot.net/results/3a407564c81adb7009641b0283bce7d2a2921737 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/bc485a1b20f28cbe3d0ed5bb3351ee6c879d2f91 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/31bf9814a5a45081cf58675a9f7fa7183b4ef0bf |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/dbd8be7d999174c930cdaf080fcde7f755eada14 |     
   xtensa    |          ncurses-6.1           | NOK | http://autobuild.buildroot.net/results/a2941be43b70ff92f9e03b51fb7fb7f2f6eee714 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/098b14a5ec4a247d23d790008a400de369858ffe | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d65cad7519566b89fd81895e028c1c1696d936d2 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/79761b73a17dafb8bb19c402cb5fc6696f36a5e6 | ORPH
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/a11fd6ab0016bcfa9d66397d92438744b114c596 |     
   xtensa    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/e61e8ef935716740ad3d1bfae6f091f56c757469 |     
  riscv64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/1a38e120bcf6f9e782be10d3c8a0f7255905c22b |     
    i686     |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c65d72c53b9a964d1472a7836f12344188e6247b |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/c44cae6a272b17f88b39da8590ddf7c39284988b |     
    arm      |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/f3887c8498facd163f2314df336e05692c55029b |     
   x86_64    |       paho-mqtt-c-1.3.2        | NOK | http://autobuild.buildroot.net/results/0f915462a7c9e78a27a03d441558e6b384c5d884 |     
    arm      |       pkcs11-helper-1.26       | NOK | http://autobuild.buildroot.net/results/d6eefca3ab1fb86e148e998238eed1df2310775f |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/d19cef1e688c2d0b25110dbc3cdd9b3f7f25bbb9 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/ffb0ba1e6a2208fbfb08084aa52ea3501de14b42 |     
   mipsel    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/67ebb3de53c8daec09e1a539fc68594efb106627 |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/c9cc223afe019d40fe87cf96d3fafdf2d42b5309 |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0ce447d5643c2b7181902bfa9c9eccc0967b8fdc |     
   sparc     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/105335aadd2a5ad65492a228ffef89994804f42c |     
   xtensa    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/23b249295488265f8d6c5719043ea8cdb45c2549 |     
    arc      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/3f7a85ff01d8f61a711c8b46505a631b88fc9380 |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/2b3f49216b9dc3775563df6c883292248f8b6b9c |     
    m68k     |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/941a89a4fb68337af17c7fd6200ffa0071730736 |     
  riscv32    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/aa52123af69eb8276056bb5c99f50c1c656e516e |     
 powerpc64   |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/5a2881b1b5ef1437db96101a1b17f9e345233aad |     
microblazeel |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/670b6603514952f99692040b352866aaac3b8cda |     
  aarch64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/0475df7f9356f3c4536c74350d1b1be904975fbd |     
    arm      |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/6e40da5fc6feaded0fa9ed60c0e0f5f307159660 |     
  sparc64    |   python-argon2-cffi-19.2.0    | NOK | http://autobuild.buildroot.net/results/4cec0438b14af4f3184c132ad405b806bbbecd0e |     
    mips     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2ece91176df12790b1ede4a910cee43b9da76a7b |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ab4ce6c295d24057af5a10931d8e4d8596f1598a |     
   x86_64    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/ad81b8da046bff4ac073da4cdd563a0f3c6434ce |     
 aarch64_be  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/5dd71d84d70a7a2c1de7606b1db829c2864f1e4b |     
  aarch64    |         qt5svg-5.14.2          | NOK | http://autobuild.buildroot.net/results/768750ec6f048863d947feaa9b6d0c565a6b3ed9 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/39758366faa98627c9a0574a5e4b734abf1bee7f |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/bad659ee52c8b5b0a963f2af1c37f9670c5663f8 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/4f3352b2a66eb65517cd8d42f85693dbecd3d365 |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/124b1a1f1d287af5d81129fc04ec6e514c23801b |     
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2fb9915b261994bcbbc526006c343157c32064c2 |     
   x86_64    |    shadowsocks-libev-3.3.3     | NOK | http://autobuild.buildroot.net/results/10aae98c0161e196ce89e6f069c70d31284c31e9 |     
microblazeel |          uacme-1.2.4           | NOK | http://autobuild.buildroot.net/results/adb12c2f2a6faec350dbf3f96260791db873224e |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/5d9cf9821a0b63490010e5b18c769af35c6547c8 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/174cfa91c652006cea129f146a737293c46bdcd4 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/cbfee3356d2a813b333fb38b9c3a54343ad2c0cc |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8ce87a6ea694b2fb77d8e94dee7f03f53fa20ebc |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/43ffafcfe7650e93b138ebd0d6de11b3848ef461 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/44d0d265cfb48254115c9d543f32d449684fa843 |     
    arc      |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/1353a68dbc08a881257d53006a330b1b71d0155b |     
   nios2     |     uvw-2.5.0_libuv-v1.37      | NOK | http://autobuild.buildroot.net/results/760b36e6f174f95c4712f117af134d911a335dde |     
    sh4      |          vlc-3.0.9.2           | NOK | http://autobuild.buildroot.net/results/7da84f6c968c79aab3fc03f103fc18f38de409a6 |     
    arm      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/db7e14dbe0c7735a487a9450c4b1bb3077a03cc7 | ORPH
  aarch64    |           xen-4.13.0           | NOK | http://autobuild.buildroot.net/results/b80b33ed558518f7bbb0a3c8586bf2d0b8acc36f |     
   xtensa    |       xlib_libX11-1.6.9        | NOK | http://autobuild.buildroot.net/results/ec984766b25addf31076a17f2ad36cb128d0ae21 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/d6eab01c44f71424cd770e25af3fe6c3b3d838c5 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/37615006d1549bdfd4378b5917b92627652efd6f |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.13 | 1 
gr-osmosdr-46698a67e7e06419... | 1 
             host-libsepol-2.9 | 1 
               libglib2-2.62.4 | 1 
                 mesa3d-19.3.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/516becfb2e32eba3f6a165a5fc2c9cbb8fd74f25 |     
    arc      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/fc62fea70ec2e611f503c3c4b8e85f5605cd00bb |     
   sparc     |       host-libsepol-2.9        | NOK | http://autobuild.buildroot.net/results/3e7551810f92028e9ac57e012382705b6ba3ef84 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/8810bdbabd67bd218c99178ddbe4ae07ebe4b0c3 |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/4704d62c4986c9d1f3e2f9e29b4a6e2d688e1d44 |     



-- 
http://autobuild.buildroot.net
