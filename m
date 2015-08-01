From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Aug 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-07-31
Message-ID: <20150801063018.040731017C1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-07-31
===============================

        success : 230
       failures : 51 
       timeouts : 1  
          TOTAL : 282

Classification of failures by reason
====================================

             expect-2014-05-02 | 7 
                  guile-2.0.11 | 3 
           libcec-libcec-3.0.1 | 3 
             libselinux-2.1.13 | 2 
libsigrok-fe473123ba836445d... | 2 
                busybox-1.23.2 | 2 
                   audit-2.4.3 | 2 
                  opencv-3.0.0 | 1 
              strongswan-5.3.2 | 1 
                  boost-1.58.0 | 1 
               linux-pam-1.1.8 | 1 
xdriver_xf86-input-synaptic... | 1 
             ipsec-tools-0.8.2 | 1 
                  c-icap-0.3.5 | 1 
                   tinc-1.0.24 | 1 
                 qt5base-5.5.0 | 1 
              lirc-tools-0.9.2 | 1 
    xserver_xorg-server-1.17.2 | 1 
                   httping-2.4 | 1 
                   sudo-1.8.13 | 1 
                gnuradio-3.7.5 | 1 
                   systemd-221 | 1 
            wpa_supplicant-2.4 | 1 
                 clapack-3.2.1 | 1 
          libmicrohttpd-0.9.42 | 1 
             bluez_utils-4.101 | 1 
                   lite-0.8.10 | 1 
          modem-manager-1.4.10 | 1 
            libnfnetlink-1.0.1 | 1 
                 libepoxy-v1.2 | 1 
                beecrypt-4.2.1 | 1 
                  bcusdk-0.0.5 | 1 
make[1]: *** wait: No child... | 1 
                    neard-0.14 | 1 
libatomic_ops-libatomic_ops... | 1 
                 lrzsz-0.12.20 | 1 
               arptables-0.0.4 | 1 
              postgresql-9.4.4 | 1 

Detail of failures
===================

         arm |                arptables-0.0.4 | NOK | http://autobuild.buildroot.net/results/bc8ff7135eab2db51e1a8a14aa1f5e25c1242a93/
         arm |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/9aa62b51a0bf22aa7c69caa32e2ae91b2ec48515/
      x86_64 |                    audit-2.4.3 | NOK | http://autobuild.buildroot.net/results/6d6dc82a2649fafa05ad2bb20f9de3a7f5033305/
         arm |                   bcusdk-0.0.5 | NOK | http://autobuild.buildroot.net/results/c31ed945426d017189b23a6316ab36390d476ff2/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/df80bd62a056ecf5823861c475d025fa14a54c95/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/24f22ee18d6afdd266eba1e0ab94bdfc38803310/
       sparc |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/17940aa3f2747ef23ac453fb72ee6f12020fe4cc/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/b2a12be4b9b5e5ce30c122b6c4aa1d109c3e3eaf/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/1378ace069c46e3413fec31a6e205039d582df86/
         arm |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/7e61fcacc87ab569190e1cf0c39e88eb9d7f9c88/
      x86_64 |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/ccfdef826d9672df7608d11b0992619909f1c23d/
microblazeel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/f2fa59845c11c9bc82792dbd851fb9663e84e29e/
         arm |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/c4f4d19385b0224ce1b665de1ea5149fb4b80109/
        i686 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/8d017c6a3373e91105d570ea2b1a491cbe647a0f/
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/a83836fad2ceec82cab7629191915afcbb08f864/
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/2eaf3328431d484500b821caf4d96467df2d820d/
      xtensa |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/962d300b3ea56b64d2a2ac428d37caecf2816010/
     aarch64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/88811ac497821709db9132d6aa8f2f6622f30376/
         arc |                 gnuradio-3.7.5 | NOK | http://autobuild.buildroot.net/results/4800c44139e4243ac64a9eb2ef1426f1f2a75e31/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cbd89ccc2ba070d90a9bcd26a79b83de12927ba1/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/e8caa28e3887d4981b1f316a1a8f7b59467804da/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ccb98279a406e56d9b428927020aa42333dbe3c4/
        bfin |                    httping-2.4 | NOK | http://autobuild.buildroot.net/results/35262a0128c2cc64c07f917198f1a3d2ee9350f8/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/23a300641284f5136ca30c07a54a72ed699053c3/
       sparc | libatomic_ops-libatomic_ops... | NOK | http://autobuild.buildroot.net/results/6d83fa5d69572cec5c96be4b7651f9b113a1a19c/
     powerpc |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/55ae5a948191c70d140b8ab9fdfdde012032803d/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/dc8fe481d97e06a29d4923e135c55cbcbdd8dd74/
        bfin |            libcec-libcec-3.0.1 | NOK | http://autobuild.buildroot.net/results/3c993b7594680c4d46d6871f8c49c30565fb1936/
        sh4a |                  libepoxy-v1.2 | NOK | http://autobuild.buildroot.net/results/a36b5c8772f6f499f4c3f0d045d80b007f8011c8/
       nios2 |           libmicrohttpd-0.9.42 | NOK | http://autobuild.buildroot.net/results/76f838b2b33311897f3c2ce82a65f3b73af2c046/
         arm |             libnfnetlink-1.0.1 | NOK | http://autobuild.buildroot.net/results/5136bf64b8bc061f60ff678eed17b50195b49efb/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/a19cbaac6249556be4ff1a8dc4b739f819a7269e/
         arc |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/4d2323a550d1dd94a8caba65f0121098c081c85c/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/e420e00c87a5dc291f8c3fe9db297a1e079b6660/
     powerpc | libsigrok-fe473123ba836445d... | NOK | http://autobuild.buildroot.net/results/876226dbca9e5232399b86f29c5c5efa6bdc33e5/
      x86_64 |                linux-pam-1.1.8 | NOK | http://autobuild.buildroot.net/results/f75b6d0922e3b7d94231e397cc222c75069a6b16/
         arm |               lirc-tools-0.9.2 | NOK | http://autobuild.buildroot.net/results/dd64d7d97e4fae854528abd1da3e469eb9e3dc03/
      mipsel |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/2713819b585bb4825f3d2555984ba1ef8c1304f0/
         arm |                  lrzsz-0.12.20 | NOK | http://autobuild.buildroot.net/results/aab53d93430fa5b820413ed15576788ac15412ac/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/79c45e95a2a836d196300185d4cb2682752491fb/
         arm |           modem-manager-1.4.10 | NOK | http://autobuild.buildroot.net/results/4bb1fc05728844e9ce787b09bbf82cde9c62860e/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/2be22b85cf2dc0c6ec4cd5dbd7cccf1d6fae931a/
      xtensa |                   opencv-3.0.0 | NOK | http://autobuild.buildroot.net/results/3fa6488856b21783cffd2e2c6c8466649e7ad327/
       sparc |               postgresql-9.4.4 | NOK | http://autobuild.buildroot.net/results/27c3aff01fc9be61825cb63054ad6520ca912011/
    mips64el |                  qt5base-5.5.0 | NOK | http://autobuild.buildroot.net/results/8243cdaaa08375108cf513cb5a6f6b4d761a0308/
microblazeel |               strongswan-5.3.2 | NOK | http://autobuild.buildroot.net/results/65ef680063829c73802e8f5d6362f863826fdcf6/
         arm |                    sudo-1.8.13 | NOK | http://autobuild.buildroot.net/results/9cb38ec94669bef80409579a5d61eaea0c40dd16/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/6d6da195e0282fdfe624e87be94716de985ee6a7/
         arc |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/5a1e28bcc3ede794371fd4c34ea74ef16a890005/
         arc |             wpa_supplicant-2.4 | NOK | http://autobuild.buildroot.net/results/f116927383d5034a3e9d89b1696fb7aae2d93127/
        i686 | xdriver_xf86-input-synaptic... | NOK | http://autobuild.buildroot.net/results/05ecfaf591e85a20071875ecd18068762193defa/
         arm |     xserver_xorg-server-1.17.2 | NOK | http://autobuild.buildroot.net/results/9a335c6d8daacd3e30a35402ffbf713eda02e191/


-- 
http://autobuild.buildroot.net
