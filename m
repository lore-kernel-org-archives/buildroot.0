From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 08:30:05 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-12
Message-ID: <20130713063005.E60CD52C0F5@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-12
===============================

        success : 85 
       failures : 57 
       timeouts : 0  
          TOTAL : 142

Classification of failures by reason
====================================

             gdk-pixbuf-2.28.1 | 4 
                 libffi-3.0.13 | 4 
                 qt5base-5.0.2 | 2 
               libglib2-2.36.3 | 2 
                  connman-1.12 | 2 
                  iozone-3_414 | 2 
                    acl-2.2.52 | 2 
            host-erlang-R15B01 | 2 
                 cairo-1.12.10 | 2 
make: *** [ezxml-legal-info... | 1 
make: *** [/home/test/test/... | 1 
make: *** [dnsmasq-legal-in... | 1 
make: *** [libosip2-legal-i... | 1 
make: *** [zlib-legal-info]... | 1 
media-ctl-ac40b79f002a2315f... | 1 
make: *** [gmp-legal-info] ... | 1 
                      bash-4.2 | 1 
make: *** [/home/test/test/... | 1 
make: *** [dmidecode-legal-... | 1 
               audiofile-0.3.6 | 1 
make: *** [liblog4c-localti... | 1 
                libosip2-3.6.0 | 1 
make: *** [apr-util-legal-i... | 1 
               celt051-0.5.1.3 | 1 
make: *** [iptables-legal-i... | 1 
                     m4-1.4.16 | 1 
               binutils-2.21.1 | 1 
                  samba-3.6.16 | 1 
make: *** [cache-calibrator... | 1 
                  fbterm-1.7.0 | 1 
                openssl-1.0.1e | 1 
                 nodejs-0.8.22 | 1 
               pcsc-lite-1.8.6 | 1 
                      qt-4.8.5 | 1 
                libcurl-7.28.1 | 1 
make: *** [python-legal-inf... | 1 
          host-protobuf-c-0.15 | 1 
                busybox-1.21.1 | 1 
                  zeromq-3.2.3 | 1 
                   cups-1.3.11 | 1 
make: *** [bustle-legal-inf... | 1 
make: *** [/home/test/test/... | 1 
                 binutils-2.21 | 1 
make: *** [fontconfig-legal... | 1 

Detail of failures
===================

      mips |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/444bcf26f0348933314b23d630e4ac0ea64b1d7b/
       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/a85aec00df5e515dd825b2e8409815a67467addb/
      sh4a |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/e62c1adee5a9e7adf296c7ac0c9cfa94b926feab/
      i686 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/bf7ab147cc74601a3c21234a1c407971a9ce659b/
       arm |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/8e5e3d6b7201c679aa559557ffd8dfd23e778f07/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/5bbeb1145daf5447dcb3abd5a478dec6a9ee8beb/
       arc |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/55adb41f2c0b8be511d017086028851caf68d505/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/3ad9e18a1c0940e0c8985da5bbbb960fb485eea4/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/ced57355b6dc89de154e64db6ad7d9f107d49593/
  mips64el |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/a4e7d509f7c517c1cb953598c25d359d6f871268/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/227f3d5746286447bf7a9a784d3b6cfbbee1c9b4/
     avr32 |                   connman-1.12 | NOK | http://autobuild.buildroot.net/results/b4245a89fa5a70c5e3ede234355e02571ad4dc15/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/0e1b913e4b9a88dd95b15cb61cc71c4c9922e23e/
    x86_64 |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/03a8c977cdb7082d0e31387e56880da921ddb7d0/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/494fbda5e5e4e6cedd54c03d35e1fcb433ab7cdc/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/27b42b1782add0437accba2f05e25ad6b4519c7d/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/39bbe7e4a0bb51a188cb109253606fe1d99d2766/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/7a542b9c6b0236765a3b7b79139177b88ef76cf7/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/324b9dcc96762ed3a959d0016515228def4d6361/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/544e0459594e7268085be93fa6db1383c42ca280/
      i686 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/b266f27c4733306433cdd64ee79f474c72f244d5/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/91e329eed07b90e8b9518efc05c7566e5e4b0656/
     avr32 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/afab593be88d233e66244a497eca28c157e8638e/
       arc |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/82e1d47352ba30c5fa9a7510eea736f26e1a222b/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/a5f3677ee55a8e2f0ad5dd27cba96e0fd53aaa2f/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/637a77f90ac5e3b8ffe79911aed3621eaf749c05/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2fee419b7be5dfc8fd930c4521350777efe4a1d3/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/2e2b16071247c4015bd227ff38a13a381d77025c/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/cd7fcffb371f7bb85782a633eb3df003be6696a0/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c6a53cb3dd81fff60b397ccbfef500663a336b53/
       arc |                 libosip2-3.6.0 | NOK | http://autobuild.buildroot.net/results/6c7d3669617edbb5723fcbc8eba0d2afb7ff3402/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/056b07ed433bbd93935a902907c40a90f9ba6a55/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/493f12964e2edbab9d16ab0d55bb8f5d6ded71fa/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/b76f8b8aa5620a9e31563021d8c4b12ca25bc0a5/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/973f99d26c44659065b83970bf8c24fe03277bff/
       arm | make: *** [apr-util-legal-i... | NOK | http://autobuild.buildroot.net/results/f857f14c0edc0b1750b9f0cca29d91978d24674b/
    x86_64 | make: *** [bustle-legal-inf... | NOK | http://autobuild.buildroot.net/results/dca91da2649492e3949cc2711014f8859cd9abbd/
    x86_64 | make: *** [cache-calibrator... | NOK | http://autobuild.buildroot.net/results/841c8018879649e093087c919c6a7254a93df29d/
    x86_64 | make: *** [dmidecode-legal-... | NOK | http://autobuild.buildroot.net/results/913e61ba1e1c300ecb52d3a503822df50baee913/
       arm | make: *** [dnsmasq-legal-in... | NOK | http://autobuild.buildroot.net/results/5e27edaa3f86cbce4ef9f13043332fa40432bbcc/
      i686 | make: *** [ezxml-legal-info... | NOK | http://autobuild.buildroot.net/results/42a2a1bd488e91f4dc32cbbf6dd9b3540ffba5aa/
      sh4a | make: *** [fontconfig-legal... | NOK | http://autobuild.buildroot.net/results/38bae255f6ee3bf8b09ce4d0ea541e62bebdc511/
    x86_64 | make: *** [gmp-legal-info] ... | NOK | http://autobuild.buildroot.net/results/8fbf81af7f4fb57ae67d3db1eb9cfb0cc4e2bcc2/
   powerpc | make: *** [iptables-legal-i... | NOK | http://autobuild.buildroot.net/results/1ba20db4cdc92da6edb89ab0d328f4bc04eb8ac3/
       sh4 | make: *** [liblog4c-localti... | NOK | http://autobuild.buildroot.net/results/8771f7d4775a2c5377f1190fefd3865bfa38a015/
       arm | make: *** [libosip2-legal-i... | NOK | http://autobuild.buildroot.net/results/2e8e34ae1e66dac244ee936ebe3f2def8b0233af/
      i686 | make: *** [python-legal-inf... | NOK | http://autobuild.buildroot.net/results/9941e6901c75c244bde988ccd786a39a790d0f54/
       arm | make: *** [zlib-legal-info]... | NOK | http://autobuild.buildroot.net/results/a664ac9db0d04beb9d7132afa858448b1fb84045/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/d4bdb5a2e18a925483013ca8c799d82dc15e91ed/
       arm |                  nodejs-0.8.22 | NOK | http://autobuild.buildroot.net/results/89ee5ba047a26a8c7a612d0285b08780b70efbd4/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/f032779f49d81441cc75e28df3a1045b7e5d454f/
  mips64el |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/2bd985e20c0f5799091869e17ff9e88edcac1223/
    mipsel |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/36d6e07a9a2661919584e99686705abdeaf1d151/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/16e009342aab5fe74225ca0d760fd22290f1491f/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/b1a9d14dc466aa257cd8a92b6c9c87db410a5801/
       arc |                   samba-3.6.16 | NOK | http://autobuild.buildroot.net/results/24cca3c3668be9bc2a6eecf24b6c3f6dcd8c942e/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/5e07e16b5a33278901f7f5fe0b59a7b5e0310c61/


-- 
http://autobuild.buildroot.net
