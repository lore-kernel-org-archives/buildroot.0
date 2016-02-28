From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 08:30:20 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-27
Message-ID: <20160228073020.78AB7101EC4@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-27
===============================

        success : 201
       failures : 52 
       timeouts : 3  
          TOTAL : 256

Classification of failures by reason
====================================

                  boost-1.60.0 | 5 
                       zsh-5.2 | 3 
                 libdrm-2.4.66 | 3 
                   mplayer-1.2 | 2 
                   fio-fio-2.6 | 2 
                  trinity-v1.6 | 2 
                   erlang-17.5 | 2 
       openpgm-release-5-2-122 | 2 
               libcap-ng-0.7.4 | 2 
        ltp-testsuite-20150903 | 2 
          chocolate-doom-2.2.1 | 2 
                     lxc-1.1.5 | 1 
                 mesa3d-11.1.1 | 1 
          libpam-tacplus-1.3.9 | 1 
tinyalsa-f2a7b6d3d81bd337a5... | 1 
make: *** wait: No child pr... | 1 
                    ustr-1.0.4 | 1 
               pax-utils-1.1.4 | 1 
                      qt-4.8.7 | 1 
hidapi-d17db57b9d4354752e0a... | 1 
                    cups-2.1.2 | 1 
              gst1-libav-1.6.3 | 1 
             host-guile-2.0.11 | 1 
  xdriver_xf86-video-mga-1.6.4 | 1 
                       unknown | 1 
                   nginx-1.8.1 | 1 
                    mosh-1.2.5 | 1 
               valgrind-3.11.0 | 1 
       host-erlang-rebar-2.5.1 | 1 
               wireshark-2.0.1 | 1 
                   mraa-v0.9.1 | 1 
                 igmpproxy-0.1 | 1 
                  cairo-1.14.4 | 1 
 make[1]: *** [all] Terminated | 1 
               libgtk2-2.24.29 | 1 
                 rtptools-1.20 | 1 
                   czmq-v3.0.2 | 1 
                  prboom-2.5.0 | 1 
canfestival-7740ac6fdedc23e... | 1 

Detail of failures
===================

       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1db489aee9432ce1794f167c99427ba87e086cab/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/6b7b89c91b2d47553afe12e29bc93198b51a7e30/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/5e7a1a9b0e085c9e74a95951183d5cd29a6dad2d/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/d98cd9aa35317967105246563f75397fc5777ef1/
microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/f1761636a259698430c0e351412f8f1652e29d79/
         arm |                   cairo-1.14.4 | NOK | http://autobuild.buildroot.net/results/46c4ddf7696248870a0dab2b12594bda48bbd044/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/b880fbf1b29186f67f05f25192a6d0eadae083f1/
         arc |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/a4725fe61ffa8ac211593a98619a966a10555128/
      mipsel |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/d8fe9b5bdb262e939d4150804ea34777c91d3c04/
     powerpc |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/20509b7d1edc73dc2a7622f2ae7dbf9f6665a918/
     powerpc |                    czmq-v3.0.2 | NOK | http://autobuild.buildroot.net/results/2061238affb685db998100a56c6571538d089a5b/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0873c55ad1a5aa1cfbbf0ce976566228769ced7f/
     aarch64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/9d16a31e2a72c6e0db18b79c0084535f3823d22c/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/fe6cb8f4c350ce3d30f86cf13e6500caf87116fa/
        sh4a |                    fio-fio-2.6 | NOK | http://autobuild.buildroot.net/results/5ed73b81e634ea9ba5b3422082dd52b4c2ec22e1/
    mips64el |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/ce83513135e7765c171353815947d715eb897d3d/
         arm | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f7e3e0bf6b970aba00a808343ee6889b035831c8/
     sparc64 |        host-erlang-rebar-2.5.1 | TIM | http://autobuild.buildroot.net/results/70e3f5635f0121acd9f64694aab17d21144eab35/
         arm |              host-guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/eb0e7d5e89c2392cdfe2e2b740674cb3ff493d4e/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/55a5ebdeea385de8d8c6cf9a82101af5d65c4afe/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/716665329785675cc06c8620e3737ae48f8bfd63/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/d4abc198c7b0ba752df934e843b26440d1cc3ed6/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/1578c1d148931b294c400329fe744362b6c23b8f/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/2e5da5e65830c8da3d2bde72aebfb4b0c09a1ea2/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/65f0fec946ba38c579daafe09e4b5a9ad88523de/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/1dadf2ae32e719856ed43bfc50cd5703c0ac3014/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/3536dc1217e7275c6db7092d6c0e2499b7985a20/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a5f8964fb9043e9d0a29a8a08d9c50a1282e9878/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/5c39de85d6168389ca8b3cc806128b61d4afbd3c/
      x86_64 |                      lxc-1.1.5 | NOK | http://autobuild.buildroot.net/results/e1a96f046d318f9505036b9ca94e20bbf88e8859/
         arm | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/3dc8cc7b2dabadeabf1f21c31447b49e7f76ff71/
     powerpc |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/6a0a4d4874a692315f93aff20b03b9e77c19c7b3/
         arc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/fc5ca585759e7bdd574291c3361fd963b3628f19/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/2bbd23f7699e02bfc01f807ec78f61d8e2127515/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/d8b82d54f7795e8b18e3e3cd4e6e55b0598e3b78/
       sparc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/1f4ffd0ec08868182cdfbe2e13d9f781ba4174bc/
         arm |                    mraa-v0.9.1 | NOK | http://autobuild.buildroot.net/results/5f047c4c28b34f6b1bf2306a2b00bcc6a7481c01/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/3a90d85419be6c35344155a9ee31193b15225b08/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/71883cd79ee9e89e793553e76d03cfd7c0a1eabd/
      x86_64 |        openpgm-release-5-2-122 | NOK | http://autobuild.buildroot.net/results/a051a977758a640b9b376e05b08ca41cc13cee4e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/a9e0287e67c03e5e385bf54578aa6c5c85206ec2/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/b53ce6825f85e08f54eccfbd93c8b78b6e1f498b/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/335e02455b90bedc3e2da96b1fdd26c3f4252b55/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/740c7cc5b84e3e9b913adaaa481f6304649511c2/
      x86_64 | tinyalsa-f2a7b6d3d81bd337a5... | NOK | http://autobuild.buildroot.net/results/9a2def74b5d7ef4426c351a4a2494cee9f11f65f/
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/61faa73d0e757cfc2990d0a900a3463ac4277188/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/1914fd40f33d22177fc1255600d460a122fb2659/
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/50e17e73ac9a1e15926341298dcd3f6e9d61c2b2/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/e6c20cbee3d8a94ac5e8de85b95ca455ce223f1e/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/7b24c8e06911ce7ad85d42a67e9db804822079bb/
        i686 |                wireshark-2.0.1 | NOK | http://autobuild.buildroot.net/results/0e1c93a2ab30787bdc08398ff8df1b090aeb8eac/
      xtensa |   xdriver_xf86-video-mga-1.6.4 | NOK | http://autobuild.buildroot.net/results/653fd17ab48510e7461c87c2c720716d2d86fea2/
         arm |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/0d76211f2df760392fcc22ad4d43eb3d6ba08484/
         arc |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/72287a8ae4341e8a3de199581fbff3b0de7dcd81/
      x86_64 |                        zsh-5.2 | NOK | http://autobuild.buildroot.net/results/29eeb515457ab76bc5b45fb7f1438717c13439eb/


-- 
http://autobuild.buildroot.net
