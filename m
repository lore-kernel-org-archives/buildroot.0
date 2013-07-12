From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jul 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-07-11
Message-ID: <20130712063004.D528352C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-07-11
===============================

        success : 83 
       failures : 64 
       timeouts : 0  
          TOTAL : 147

Classification of failures by reason
====================================

            host-erlang-R15B01 | 8 
                 libffi-3.0.13 | 6 
               minidlna-1.0.25 | 3 
               libglib2-2.36.3 | 3 
make: *** [cifs-utils-legal... | 2 
                  ne10-88c18f0 | 2 
                  zeromq-3.2.3 | 2 
                 qt5base-5.0.2 | 2 
make: *** [dhcpdump-legal-i... | 2 
                openssl-1.0.1e | 2 
                  webkit-1.9.6 | 1 
                     m4-1.4.16 | 1 
                   cups-1.3.11 | 1 
               w_scan-20130331 | 1 
make: *** [/home/test/test/... | 1 
make: *** [lua-msgpack-nati... | 1 
                 libpfm4-4.3.0 | 1 
make: *** [elfutils-legal-i... | 1 
                 libevas-1.7.7 | 1 
make: *** [fis-legal-info] ... | 1 
make: *** [oprofile-legal-i... | 1 
make: *** [libcurl-legal-in... | 1 
           libusb-compat-0.1.4 | 1 
                      qt-4.8.5 | 1 
make: *** [fontconfig-legal... | 1 
               libgtk2-2.24.18 | 1 
make: *** [host-e2fsprogs-l... | 1 
                  iozone-3_414 | 1 
make: *** [libnl-legal-info... | 1 
                   dbus-1.4.26 | 1 
make: *** [rsh-redone-legal... | 1 
                    acl-2.2.52 | 1 
                   libidn-1.27 | 1 
              fontconfig-2.6.0 | 1 
make: *** [gpsd-legal-info]... | 1 
              vim-699f8d8f096d | 1 
make: *** [alsamixergui-leg... | 1 
           imagemagick-6.8.6-2 | 1 
make: *** [bluez_utils-lega... | 1 
        host-util-linux-2.22.2 | 1 
make: *** [cpuload-legal-in... | 1 
          host-protobuf-c-0.15 | 1 

Detail of failures
===================

       arm |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/1eb27c856cc80861b0d6727834ec5dce2a3bae25/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/f61c2feaa03ae9a777defbf6d0b1bdece0f0fff9/
microblaze |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/08831f12643b3961019dc16c2420da7ab640a4de/
   powerpc |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/ea332535d789210924c021fa48e61cf9350e7c48/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/2b63c905900f01a5e23a9448c1b0cba5285989e8/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/ff274494ba7365bec2cb5a6446fe50345cb516c2/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/da4305e53bac73baa192548bcdb4c2e288aae1b5/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e2a3daeee441fa986158d3f2d06a2d648223fc14/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/9360486e483a578ce4705c95c66faa37e24cd1d0/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/74d43c58c3b2b713f015c2be10a1354a16bb8ae9/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/d1ee7c379e45eabe177dede2ddf865cb4ee61f96/
      i686 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/0b87dbf3393e8cfd050e6ebcbfe78ea16d26a509/
    mipsel |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/cdc32ba20268e91853e92b1fc2edd879a8f5fb72/
       arm |         host-util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/33b12c4c5c23cbff566273bb71ee0efd50926c6b/
       arc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/bdf044ea5dbb4726a440bad79621e6c50144af2c/
       arc |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/44c93e0ed98b3536321631adc00e7867ca904a10/
     avr32 |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/6620fb64ee37a5cff0de005bedefd33f80d8cd5a/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/3169b6db6e1dd55330646cd00eac505b9b91ba0c/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/b13bf16e022551ae23d657f1a17b72dfad9fd8d8/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/05f3bb40b3b1b13e23e145333a583bbcd2704a4f/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/1206bb02003731c28cfd8ad0e7663b407f3dba78/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d70f0ac45eb27ec60bb2cbf31368786c8904f612/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/9afd5ca3c530a75330d9d8aaa84ed38873ddd7bc/
       arm |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/c963d8dcd0cbf37e8c6dbdce6decdd76c9ef1b50/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/d5b75004c72476115845fd5a156820ae1809b210/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/2ededd49f2a4a875be2969c421643aa23cac3ca8/
      i686 |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/91a3e423cbe386d2d9ed1bdfa99c4d6a3881fbc1/
       arc |                    libidn-1.27 | NOK | http://autobuild.buildroot.net/results/be30c632d4428ec581e4c0655ba287423e882882/
     avr32 |                  libpfm4-4.3.0 | NOK | http://autobuild.buildroot.net/results/2436ddc55b9a96595bc8ff33671c65c7ead74e37/
  mips64el |            libusb-compat-0.1.4 | NOK | http://autobuild.buildroot.net/results/cdd9b189ba5c31e4f8766f333ce0b199d6c72c64/
    xtensa |                      m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/f1d72f58e78d502bf6d3a3afdda7eeb2e53cfb31/
      bfin | make: *** [/home/test/test/... | NOK | http://autobuild.buildroot.net/results/351c6fc4266ac7b545b027f387b6154f380e4cbc/
   powerpc | make: *** [alsamixergui-leg... | NOK | http://autobuild.buildroot.net/results/16683f71a6049cd6eda5f34b486a013fc5ae753d/
       arm | make: *** [bluez_utils-lega... | NOK | http://autobuild.buildroot.net/results/bd51197f4786de1c45ccbe085eb7b95c0fc437b6/
       arm | make: *** [cifs-utils-legal... | NOK | http://autobuild.buildroot.net/results/b45a1d48ecb577e6d16226dbe3acc69274a20189/
       arm | make: *** [cifs-utils-legal... | NOK | http://autobuild.buildroot.net/results/eedb3b491d39824ffd912dbb215b112584394cd7/
   powerpc | make: *** [cpuload-legal-in... | NOK | http://autobuild.buildroot.net/results/9c44874084d417b18bbaba0ea214520527ca6107/
    x86_64 | make: *** [dhcpdump-legal-i... | NOK | http://autobuild.buildroot.net/results/a53446e90a9ae72d16d6f39b5a68e0d4e05145f1/
      i686 | make: *** [dhcpdump-legal-i... | NOK | http://autobuild.buildroot.net/results/eae085aa9ee97bc0bf46e0162b80417b074184ee/
   powerpc | make: *** [elfutils-legal-i... | NOK | http://autobuild.buildroot.net/results/c18bc6900eddaa37272f306e2f9b1f8befe0b3f2/
   powerpc | make: *** [fis-legal-info] ... | NOK | http://autobuild.buildroot.net/results/4c5acfb9d83fdba557399549a8df87346dffb699/
    x86_64 | make: *** [fontconfig-legal... | NOK | http://autobuild.buildroot.net/results/b0fa862f0000c77cf28a215cc5350a3ff2bfbbf4/
      i686 | make: *** [gpsd-legal-info]... | NOK | http://autobuild.buildroot.net/results/5a0f820b8ef59deff864eae0435602e1dd5a1562/
   powerpc | make: *** [host-e2fsprogs-l... | NOK | http://autobuild.buildroot.net/results/d683d9e3d2518e9a5ca95f0ae6eea3593a46a163/
    x86_64 | make: *** [libcurl-legal-in... | NOK | http://autobuild.buildroot.net/results/2ed924bb3a0d27298816843318a2d92e77f93a86/
    x86_64 | make: *** [libnl-legal-info... | NOK | http://autobuild.buildroot.net/results/621094a88d43cf15342582717ff86fb657f4fd81/
      i686 | make: *** [lua-msgpack-nati... | NOK | http://autobuild.buildroot.net/results/7354f5540fbce6e4f4e9f28371f1c4227d1d3193/
      sh4a | make: *** [oprofile-legal-i... | NOK | http://autobuild.buildroot.net/results/009f333335716f3a6fbb4514751c1295d03c59c9/
      i686 | make: *** [rsh-redone-legal... | NOK | http://autobuild.buildroot.net/results/7ab075dfb7cb76a482042f0eb2133379c5909aa5/
       arm |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/4cbb4280bd1f57270dde244d34839c98c6ae0596/
   powerpc |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/3b71243716dc193a11508a69265cdd0120bd13ed/
   powerpc |                minidlna-1.0.25 | NOK | http://autobuild.buildroot.net/results/7bb9b5f49d5afffa50ca19ef8730cc503220a9b4/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/e8083bd24a89c125c3859f889f5fe55694d95289/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/c4197f66a9889a2a05901c722ec6c9cae959c616/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/ae2190b64ef8016fd4def595e4e5efdab6cd4dcc/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/1485b60a2e57ef46eecadd4d1b81a7469d1a8ccf/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/ae32bda290b8f5f8d3a66c44ba2a9bf2620365f2/
      i686 |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/6d03ecfa5739793e030217e333f8890bf2aa3c4d/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/e3b7c762ba15853e9ac86512bfdc6133187984d7/
   powerpc |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/7bf473cb89e76ae84129ffb785e4607a697d4d42/
       arm |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/c4a38bbb6d72b1954209b1a4307ef255ee98e3b9/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/6ef5bd260a563b334bd48eefd73b48feb21c4f9d/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/7821d824ae8206ff656e8ea13543789aac5807d5/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/50add9c0230902c6498cc03eb90920dc4063fe7b/


-- 
http://autobuild.buildroot.net
