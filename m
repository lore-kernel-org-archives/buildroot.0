From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Apr 2017 08:28:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-20
Message-ID: <20170421062813.5496E207D1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-20
================================

      successes : 172
       failures : 38 
       timeouts : 0  
          TOTAL : 210

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 9 
                  dbus-1.10.18 | 4 
           uboot-tools-2017.03 | 4 
                    mpir-3.0.0 | 3 
               syslog-ng-3.9.1 | 3 
kvm-unit-tests-5731572b2ac2... | 2 
                busybox-1.26.2 | 1 
                 efibootmgr-14 | 1 
             lttng-tools-2.9.4 | 1 
                 mplayer-1.3.0 | 1 
                  ntp-4.2.8p10 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                     php-7.1.4 | 1 
               pulseview-0.3.0 | 1 
                 qt5base-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
toolchain-external-codesour... | 1 
               wireshark-2.2.6 | 1 
           xapp_xfontsel-1.0.5 | 1 


Detail of failures
===================

         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/ff025e114c5f55994f4fb024c6d9a0dc0e9afa19 | ORPH
         arm |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/15e304218aadec5265d70ff974c652e0c18b84d1 | ORPH
        i686 |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/1edeaa097b8a5a24ce87ff50dd0ef6d146ea83e8 | ORPH
      xtensa |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/11defe4189074bf54528804cca8413e2da972d57 | ORPH
 powerpc64le |                   dbus-1.10.18 | NOK | http://autobuild.buildroot.net/results/5a3945a955f7ce30c8a21245616989f408d9d11b | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/1f5360bcf50123fbca1c1b0fe9452a14bb75ca85 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f7950983a5eb6025fcfdaf1f97a953a64d4a1269 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/ebdf3247fba4e289cbe4dd112cedc3563915bc44 |     
     powerpc |              lttng-tools-2.9.4 | NOK | http://autobuild.buildroot.net/results/beee6aff11bca285a1e6c238dd2bd05a5646be0b |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c1e14753ac6712843a5b5860a7140d81fdfaeb77 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/3c32b292f0921985bb66f7642857ba634ac10cfe |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/27b57568c88b7fadd9d9e16ab61ac7e4ba67958f |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b625a6c477a6034c76cc20a74ff576906717b366 |     
      x86_64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/a72752d36dbe7f0821204c318f130b904fad597f | ORPH
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/ba3cac01e16afb78c783bbe8beb27b0a6814a584 |     
         arm |                      php-7.1.4 | NOK | http://autobuild.buildroot.net/results/692dfada0b989891bfbfcfd43824c2c3f5d90c2e | ORPH
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/38e3cb5d1cef01c05a8019661f8fcd6369cd3541 |     
     sparc64 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/d10c9ee023667360ebcd7989e65a23a2bb3041b0 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/6aaf01d0cf85df5c95bd9a12fda6c9eea3f466c7 |     
   powerpc64 |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/bfc7faa1b954aa9f8ea342d0b881db3e08c79a5a |     
      x86_64 |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/740eba7b5eee842a30fa61063c9c806ce8bde5a8 |     
      xtensa |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/fd70b7ed4cc6d513ea46fdcfad716913796abce3 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/80fcc9bf31d1e5fbabe23d5423d5660a80315d51 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ee1cf89958931b4bca4be54b75337eac5122fc36 | ORPH
        m68k |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9f54a698798a2c9ca7880adda815bf794f036257 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/bca76d3d3d700b38ae079030d43161ddd26d336c | ORPH
microblazeel |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/45111bc676cfa85b54a7c0717b569160a1574388 | ORPH
     powerpc |                wireshark-2.2.6 | NOK | http://autobuild.buildroot.net/results/9a1a6a95a2d770f377076cf4eac8faed48db5373 |     
    mips64el |            xapp_xfontsel-1.0.5 | NOK | http://autobuild.buildroot.net/results/a27751f21634747511e064b3ddb045f2b95462d7 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/8f749205c45d4fc990b6211b9a768a43d577c618 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/09be27c4db7613ef1da9f62989aa4b95bb3fc448 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/679c09d2ebc84d4fbdaf30fe1695407e13044e4c |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/3b2c2a538987a207909c4db24a1d3a919ae90e39 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/7e773ffdeccce1d0eee2c768553e4f3e7151a1de |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/11897f2e17eebf53f5ee620b4ec5505dc7490788 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/783fd925d37dc2618874dc8fa1d1ff755d1d2872 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/94281ea8176460a3f5803a11d42f2f684022433b |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/b9180fdb2a3164942738953153c729638dd59b75 |     

-- 
http://autobuild.buildroot.net
