From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  1 Oct 2015 08:30:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-30
Message-ID: <20151001063016.DF1C9101E4A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-30
===============================

        success : 227
       failures : 32 
       timeouts : 0  
          TOTAL : 259

Classification of failures by reason
====================================

                   bdwgc-7.4.2 | 3 
                busybox-1.23.2 | 2 
        ltp-testsuite-20150420 | 2 
             bluez5_utils-5.27 | 1 
      host-gdb-arc-2015.06-gdb | 1 
                 jsoncpp-1.6.5 | 1 
           libfreeimage-3.17.0 | 1 
                    iostat-2.2 | 1 
                  apitrace-7.0 | 1 
                flashrom-0.9.8 | 1 
               libcap-ng-0.7.4 | 1 
                pulseaudio-7.0 | 1 
             bluez_utils-4.101 | 1 
                   zmqpp-3.2.0 | 1 
                   systemd-221 | 1 
                directfb-1.7.7 | 1 
                dbus-cpp-0.9.0 | 1 
               util-linux-2.27 | 1 
                   erlang-17.5 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
                  libssh-0.7.1 | 1 
             e2fsprogs-1.42.13 | 1 
                 lcdproc-0.5.7 | 1 
                    ustr-1.0.4 | 1 
            micropython-v1.4.6 | 1 
                libevdev-1.4.3 | 1 
       kompexsqlite-v1.10.12-1 | 1 
                    neard-0.14 | 1 

Detail of failures
===================

     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/4a183b05b44833ee2f253749c39257b31db963ac/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/4dc51a33a5e614d5bb754fb558edb65a10183e6d/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/1ddbb912c9c972214324208ea4335045132b0643/
       sparc |                    bdwgc-7.4.2 | NOK | http://autobuild.buildroot.net/results/3c0beb00a324d301aa39162f52d7cfeb1678cdbb/
       sparc |              bluez5_utils-5.27 | NOK | http://autobuild.buildroot.net/results/81ef5d3615850f873492daac74aa28443622279a/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/65c4e94f6b6c5154a7edc0b112f7baa5e2d99374/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/720ddd4c21369628e27ed6640054a8d605d518e3/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b5a85cff18e674e44b9b84699cbe0f1a0de7b114/
         arm |                 dbus-cpp-0.9.0 | NOK | http://autobuild.buildroot.net/results/3bea4a61fdb7e0650eabc2d6e95e78a16556e193/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/fbe0536000ba508a45d13ff911d8581c19588748/
      xtensa |              e2fsprogs-1.42.13 | NOK | http://autobuild.buildroot.net/results/2a20e454a597f1e18beb2feb9242a84d3303e735/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/758a9e92a2e2c9d5db5b631e788956c0e497863e/
        i686 |                 flashrom-0.9.8 | NOK | http://autobuild.buildroot.net/results/b6e9f3cb7fa8019e631c14d9c832174125ec64ba/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/aaffea49da2fd695e30513ae6a2aaffc8b44f72e/
         arc |       host-gdb-arc-2015.06-gdb | NOK | http://autobuild.buildroot.net/results/8a08949f848a8ef7cf629e15e28f4eb9359b1850/
      x86_64 |                     iostat-2.2 | NOK | http://autobuild.buildroot.net/results/dc98a572c7055cb66cf14648af750b7e0c8e136e/
      x86_64 |                  jsoncpp-1.6.5 | NOK | http://autobuild.buildroot.net/results/98cd0eb6041bac3ecfdf6b4b6c2f569b9ebe5b35/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/bcb57d74a51a36b81285e3531dea55a67f53d66e/
      x86_64 |                  lcdproc-0.5.7 | NOK | http://autobuild.buildroot.net/results/a12ac40364026884bb2b8c3faed142e0c8bcdb9e/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/52a44378f5487229922f8e2579c62c3f22a60c39/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/46fba11d23df2d313b05f9eb2351f90a2eff9e59/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/2de762e8531bd496b32122850888a82d84d40c5f/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/a19c619f4561f5426236b958f09cab4c095a63cc/
     powerpc |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/88945b7bcf05647c67bc732d1aad6924bd86bbec/
      x86_64 |         ltp-testsuite-20150420 | NOK | http://autobuild.buildroot.net/results/812986b00786972d4e7fbb0362460a0de8a70472/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/4b73ea659afd100338b869a7cc00f3f69431e9f9/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/bf614c2b34187b5eed5fa7e402f7f9bb5a55a89d/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/44a20dd96b5dafe80c23b0cd83c83a6cfa11bf2e/
       sparc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/606cec8108ef946f6e0f32bae1e91843eff41062/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/21a400a0273643f6b65b27120230037f91df29f6/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/cea0a2e5f2d8c7d8a80cc603ce90dd31b621fe41/
         arm |                    zmqpp-3.2.0 | NOK | http://autobuild.buildroot.net/results/43a192a27f6dbc6d4df4a60f524992b637873a14/


-- 
http://autobuild.buildroot.net
