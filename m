From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Aug 2016 08:30:28 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-05
Message-ID: <20160806063028.356101023A1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-05
===============================

        success : 209
       failures : 82 
       timeouts : 2  
          TOTAL : 293

Classification of failures by reason
====================================

             transmission-2.92 | 6 
openblas-f04af36ad0e85b64f1... | 5 
                  rt-tests-1.0 | 3 
                 libunwind-1.1 | 3 
           argp-standalone-1.3 | 3 
                  cairo-1.14.6 | 2 
                    cups-2.1.4 | 2 
                   dante-1.4.1 | 2 
                  trinity-v1.6 | 2 
                  multicat-2.1 | 2 
              lirc-tools-0.9.4 | 2 
    xserver_xorg-server-1.18.4 | 2 
                     ncdu-1.11 | 1 
kmsxx-a706f157b86e906968080... | 1 
                 mono-4.4.2.11 | 1 
                   fwup-v0.8.0 | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                acpitool-0.5.1 | 1 
                  snmppp-3.3.5 | 1 
xdriver_xf86-video-savage-2... | 1 
libcofi-7313fbe12b0593034d0... | 1 
                   perl-5.22.2 | 1 
              gnuradio-3.7.9.1 | 1 
            lttng-libust-2.7.1 | 1 
                  babeld-1.7.1 | 1 
               trousers-0.3.13 | 1 
                   cmake-3.5.2 | 1 
                cifs-utils-6.5 | 1 
                     mtd-1.5.2 | 1 
                  samba4-4.4.5 | 1 
                blktrace-1.1.0 | 1 
                 weston-1.11.0 | 1 
               bootutils-1.0.0 | 1 
                 gnuplot-4.6.6 | 1 
                sysklogd-1.5.1 | 1 
                 host-go-1.6.2 | 1 
                oprofile-1.1.0 | 1 
                    ruby-2.3.1 | 1 
                     vlc-2.2.4 | 1 
                poppler-0.32.0 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    quota-4.01 | 1 
              procps-ng-3.3.11 | 1 
hidapi-b5b2e1779b6cd2edda30... | 1 
                   taskd-1.1.0 | 1 
                   bdwgc-7.4.2 | 1 
                    owfs-3.1p1 | 1 
make[1]: *** wait: No child... | 1 
               binutils-2.25.1 | 1 
 make[1]: *** [all] Terminated | 1 
                     php-7.0.9 | 1 
                  stella-4.7.2 | 1 
host-gcc-final-arc-2016.09-... | 1 
             libxmlrpc-1.25.30 | 1 
                    lftp-4.7.3 | 1 
                    ola-0.10.0 | 1 
                   ncurses-5.9 | 1 
               libcap-ng-0.7.7 | 1 
               audiofile-0.3.6 | 1 
                  libsepol-2.5 | 1 
                     eudev-3.2 | 1 
                dosfstools-4.0 | 1 

Detail of failures
===================

        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/20d72bb9e0aeb6adbce4239f848d355c7f8339e9/
         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/05f46ab28cbfc587e2e031bf38fb975447f8bab6/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/9ff665b54ce3bed2608ca4ef032cb912cda8c23f/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1969f4c186a16e6623ff994af3ceb981611e1d57/
        bfin |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1ae7f70b513c76f4fdb27c00f183692dc57aeb62/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/2b6a2521be7fac66e6d37b024f358daaaf20fbf9/
         arm |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/fc6f7fe7ce19b0aec5142787126786cafab808e9/
         arm |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/c27be3e5a573860b332db2c8feafea8d0b8fe9c1/
        bfin |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/3a04670c1738a7a7180d8ce8944aadde7351169d/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/5a673c692aeb957cd8beb2c2c10ce5fd882ba4b5/
         arc |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/4059a5afe3e471d4b25db493d4c5eec646a8b0e1/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/31a488316fe3c14729a6dd9259205f8530684cab/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/dc6b899e3e502d65b2cf2f6d922a4f63857edf82/
      x86_64 |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/df89921a95b45822f33afb4342db63ec4c5890c3/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/f7e92678e91a6cb15ccf32d4a7d75b39f49d6000/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/7bd4abf3b1a89c6ec2f43a07cc64fafe4960dee2/
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a7d105a1db9fd5bf2705d8398e9c0e53ea2c8bc5/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/af715a4533ab61502b2c71a222f7f56b92283453/
      x86_64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/4068b547646ceb9a8c6b4b72ca3a7c7955abfefd/
      x86_64 |                 dosfstools-4.0 | NOK | http://autobuild.buildroot.net/results/6cc4e51d50c8d39fee2cdc89d9aea8a90a0d4923/
         arc |                      eudev-3.2 | NOK | http://autobuild.buildroot.net/results/c48b73ff8b787dbc632784aa7d979ffa48528d7c/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/802b6d77e1b77b7c8fcb8f3b394cdabfd406de7a/
        m68k |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/d1e030c42f43f49575f36ecc82e9dd9018ca4f73/
         arm |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f14f4f62b5f23c652fa9411d9c569c2ab3394fb5/
        m68k | hidapi-b5b2e1779b6cd2edda30... | NOK | http://autobuild.buildroot.net/results/2ecd240ccb15de76017942a8960faac6b3f973b4/
         arc | host-gcc-final-arc-2016.09-... | NOK | http://autobuild.buildroot.net/results/3afc00e64274e89de2cf81e1dda8854327b89291/
     aarch64 |                  host-go-1.6.2 | NOK | http://autobuild.buildroot.net/results/742ec4d95e78ad1a2e613d2ef314ccb6f2c8042f/
        i586 | kmsxx-a706f157b86e906968080... | NOK | http://autobuild.buildroot.net/results/989c253478c830fa4da70d0bd3e97f196a770243/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/a4250a073e8e52f22c3a29bfd45c13a7b6506465/
         arm |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/ae93bd1b4f6e1ed8f386830d4a51f00d9466f267/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/852f4b29dad031a61034dd5a7c5f1635d1aece4f/
         arm | libcofi-7313fbe12b0593034d0... | NOK | http://autobuild.buildroot.net/results/329c09bf123cd5b6dbcfff6251ba7a2c7cce50b8/
         arm |                   libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/14bbb7c9c59e7f68f3ae7ad63e075e27a0da2b1e/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/1cd69c5eebc4f4a64ee272660beffc8bb4cdb9ad/
     powerpc |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/96c53ff240dcd68fcc9e3d32c4026c9886edcbe7/
         sh4 |                  libunwind-1.1 | NOK | http://autobuild.buildroot.net/results/95a6cca21aea9914ba8bb3f571760fc054c53ecd/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/3a0b5bf1ad87010d6d109885da8b18154603a77c/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fbae91fe59b6a345eef41119def8ff74424dea5e/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/fc48b5bcbc04c7db9bcc5e7355020db4d9c745b7/
        i586 |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/deb80eea5ceae3e7f8e0549596dce2fb6a1e7596/
    mips64el | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/dad5ea0d7ebfd0822d96b9f0cab6667e1ff145b6/
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/e181a761c36a9f88040be94e5de3ff7ded4dc0c1/
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/41fa15c7f6e56850b030f87b2fb135bf813b5659/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/388a351113d278ac1f9082d653f6f08c79f7d27c/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/d4e6045308019eb8051e3d749db233a1831b76ca/
microblazeel |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/4e7e490a4eb52256aba12a131caf059cf5fa0903/
        bfin |                      ncdu-1.11 | NOK | http://autobuild.buildroot.net/results/86b66ed92fb714795ba70c228d4d448a1b61cee0/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/e553019e5bb02aca33785b449dc775dc539218d3/
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/ea537cac5a3aa3eb26ef063664847876bc5fcc60/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ea26242301830c4b68f64702731d19b7bcfa97db/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4da692601523eac261f9fc55616d86fa31f00ec3/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/0f9600a8bc78bcdcd724c448350330e352e29cc8/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/eec408a938e6791199d817ca138feb1578508fb1/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bacbd8723cb436d42eed74067db77e7dd110c478/
        m68k |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/b40e3092d916a0d0068ae4edd8885e38e57e2006/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/fe6843ec53fbed452d2e38a8577a235f73abb8db/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/bbe4371b478755f32b950093b6fa96fd009448e9/
        m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/754959831528764b5ed908b000c1e6d24a151c2c/
         arm |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/9b9acd75def0ed807753d47a623dab947b253144/
         arm |               procps-ng-3.3.11 | NOK | http://autobuild.buildroot.net/results/b385bf435085728aece6323a5006ba9fa6631744/
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/733145e94d7c4f3b11e867c60a1e8f8e049a3ce0/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/67fc16366717f34df492683a14ecd23376e23110/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a3efa1d65487f094f02ea0f5c78f6b9ee5e60cac/
         sh4 |                   rt-tests-1.0 | NOK | http://autobuild.buildroot.net/results/a822fe8aea4a648e7c515a9759184d005886482f/
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/83b32ca687b29237654d529325fb0792a62b9b6f/
         arc |                   samba4-4.4.5 | NOK | http://autobuild.buildroot.net/results/924c1766989e91e5f807969d45d0a21efe87c401/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/916e17bab62813081fc4bae84dc486f044436cb3/
         arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/1752ca6a393b43750022db3faee85cfc9d360bc4/
      x86_64 |                 sysklogd-1.5.1 | NOK | http://autobuild.buildroot.net/results/00de6dcceff00458a4c99847c030ab1e2db0e9bd/
         arm |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/d4e68d561c9de68b3bf50a97bb93298fd7bbffe1/
        m68k |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/5fcaba84c884c688e0af27dc70e820fbd62299c9/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/7eebec964d14b55977c15b60c05f889ca88be904/
         arm |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/d14b78d793d2ef6c858127e2ba9a8b105c9f8c64/
       nios2 |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/8474ac510a0da04860cbb7d3a5a31d7f5ba5e9bc/
    mips64el |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/0fc085ec7759db88149eeb7c15841dbcd6a02069/
        mips |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/b5566ac8a90d91fc0e5426365f5c350f5e145ed8/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/f2e3d5c49249fc2ed1ddb4d3c6f831e77729614d/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/be9ba3b875ade563a4e0d5289e3d41e92d3f54ec/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/9ce2bb491aee30863ab623c6b84916132d84b60d/
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/1086a649c0c38ede13cfbe4663b67ec98475feba/
      mipsel |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/2c51bbc7dadaaaee0ce11d0f9eb521f11b0d949f/
     sparc64 | xdriver_xf86-video-savage-2... | NOK | http://autobuild.buildroot.net/results/ecdb6977d282c276cbdf1f3dd0ccfaddff1d1ac5/
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/a60f2e120c97e4bfe9902febb3bb26600da476aa/
         arm |     xserver_xorg-server-1.18.4 | NOK | http://autobuild.buildroot.net/results/0de6c064efb66aed32cc465349dd8dc138be0668/


-- 
http://autobuild.buildroot.net
