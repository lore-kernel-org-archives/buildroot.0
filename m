From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Oct 2017 08:31:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-10-19
Message-ID: <20171020063122.9B3DA203A8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-10-19
================================

      successes : 134
       failures : 39 
       timeouts : 3  
          TOTAL : 176

Classification of failures by reason
====================================

           argp-standalone-1.3 | 5 
                     nmap-7.60 | 5 
                 setools-4.1.1 | 5 
                 glibmm-2.54.1 | 4 
            libtomcrypt-1.18.0 | 4 
       host-erlang-rebar-2.6.4 | 3 
                  boost-1.64.0 | 2 
             gstreamer-0.10.36 | 2 
      host-uboot-tools-2017.07 | 2 
pdbg-77158819158d1d7053a737... | 2 
                  cc-tool-0.26 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.2.5 | 1 
             dbus-python-1.2.4 | 1 
                       jose-10 | 1 
                   perl-5.26.1 | 1 
                prosody-0.9.12 | 1 
                    qpdf-7.0.0 | 1 


Detail of failures
===================

         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/91a3fded77cb8d3f4b238898b491d0c51f9429e3 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/11a097106a3c021d86cf3a961bb1d424ccefdd88 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/1b3025b5348af2267108cf12849807e3704a22e9 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/8aa8836344774f83fb10e8c597f1cb1f14c46ac0 | ORPH
         arc |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/503b5267aa097dfae92d077d746a44dc3d7b765c | ORPH
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/b2ae497426e59b0d301d1fe243645fc5b30d80fa |     
     powerpc |                   boost-1.64.0 | NOK | http://autobuild.buildroot.net/results/ee5b8da08ea4f7d90308431e987d5ab02d3cc517 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/72eb215abf497507e3267470ef053cebb7c10bd5 |     
         sh4 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/32667d12a9737d4086bc9f5926d12315405739e1 | ORPH
         arm |                     cups-2.2.5 | NOK | http://autobuild.buildroot.net/results/35b3de6ce0196824de50eece564c04dd01e4de1c | ORPH
      x86_64 |              dbus-python-1.2.4 | NOK | http://autobuild.buildroot.net/results/6d17cc060410629cda33c6ed242742cff88a5799 | ORPH
        i686 |                  glibmm-2.54.1 | NOK | http://autobuild.buildroot.net/results/cb0c352673583b3f3265b53f964825becb1fe85e |     
         arm |                  glibmm-2.54.1 | NOK | http://autobuild.buildroot.net/results/7fae245d1280b1f22296b419ede1ac085ec2adb2 |     
         arm |                  glibmm-2.54.1 | NOK | http://autobuild.buildroot.net/results/c1cb195f02a8594f246266c49bfec1d5e3f62688 |     
        i686 |                  glibmm-2.54.1 | NOK | http://autobuild.buildroot.net/results/adbac0828ededa228a8150a76185b3122269508a |     
         arm |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/0183c386a9bb47a01f1b9927b202f4437cfef7b6 | ORPH
         sh4 |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/a4cd707a0514dcb9eaed6a9845cb335415c58f2a | ORPH
        i586 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/6ecc776d8f104be440042e7d8cbf0cafa807551d |     
      x86_64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/b38831d262e8a506b9416898662ee950f1edd9ce |     
     aarch64 |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/b9b0c3123efaafb1e381533f717486d8c7732159 |     
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/7bf09feb36822978a104c7ad0c461398399125e9 | ORPH
         arm |       host-uboot-tools-2017.07 | NOK | http://autobuild.buildroot.net/results/b6f0835ca40bbed46482c9baab514ad83d54645c | ORPH
     powerpc |                        jose-10 | NOK | http://autobuild.buildroot.net/results/b3cb4793c76209768468d2b193d3e0c45f2aa44f |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/1500d23d2a42ad6d0b9f2da9b58cbeee30996e11 |     
         arm |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/5d8bc6198a787affd5dc1bd3405fc08c967dc55d |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/e70fab78b5b80de8fd5d553c0ae510cd3b49af53 |     
     powerpc |             libtomcrypt-1.18.0 | NOK | http://autobuild.buildroot.net/results/7781a5672f9ad1a78d3afc0fc32cface7caa10af |     
      xtensa |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/410c12a2d3de6c1ee65bb7f919b76c560fbae55c | ORPH
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8f097520003107d9a86513f54d6dc49da0cfc592 | ORPH
       nios2 |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/5601e8a0d6c07a068116b19b7805164d6a1ca3de | ORPH
     powerpc |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/c9f7af383b38fbd8909c68a05f36fab726694944 | ORPH
        mips |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/a10a3876bbec05869bfb2f87be7a491586d3c04b | ORPH
      mipsel | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/e3b1f28f835e6771e49107ba0fd9378ad0ac7e7a |     
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/e5627d21f790e2343a85095dc0e0f9177a7f18c1 |     
         arm |                    perl-5.26.1 | NOK | http://autobuild.buildroot.net/results/1f48efd8860b21424144b8ed8400bfb7874c7203 |     
      x86_64 |                 prosody-0.9.12 | NOK | http://autobuild.buildroot.net/results/f36549c5e48a8c4113864b18082821c66d028a09 |     
      x86_64 |                     qpdf-7.0.0 | NOK | http://autobuild.buildroot.net/results/a393f4c933f1e6aac190b7e4ed7ffff375518fcc |     
    mips64el |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/2abead40f22e3c43debe1cdd5381810b70ea07c6 |     
    mips64el |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/33f66994babaf52dac51030d7f54d4f3276d9606 |     
         arm |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/05e246be27ee605b1e57c6022cf34c08c26ae435 |     
         arm |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/869a90ba69c7b981f5355e8ca55a0c4afa471400 |     
    mips64el |                  setools-4.1.1 | NOK | http://autobuild.buildroot.net/results/f7de6cb5d4ed0eafb775a572826cfddb0f52549c |     

-- 
http://autobuild.buildroot.net
