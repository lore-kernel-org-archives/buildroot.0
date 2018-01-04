From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Jan 2018 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-03
Message-ID: <20180104070035.EEAA2207B1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-03
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 178 |  26 |   3 | 207 |
   2017.11.x |  19 |   1 |   0 |  20 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             libostree-2017.15 | 4 
            nilfs-utils-v2.2.7 | 4 
               tcf-agent-1.6.0 | 4 
                       unknown | 2 
                  boost-1.65.1 | 1 
                busybox-1.27.2 | 1 
                  cc-tool-0.26 | 1 
                  ffmpeg-3.4.1 | 1 
                   gconf-3.2.6 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                 libdrm-2.4.89 | 1 
                 libpqxx-6.0.0 | 1 
              lynx-2.8.9dev.16 | 1 
make[9]: *** [do-all] Termi... | 1 
                      qt-4.8.7 | 1 
                  samba4-4.7.3 | 1 
                    tekui-1.12 | 1 
              wireshark-2.2.11 | 1 
            xlib_libXpm-3.5.12 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/fd9e34bfde28dab23aed880ecd72ed9d6276a69a |     
microblazeel |                 busybox-1.27.2 | NOK | http://autobuild.buildroot.net/results/38deb89f0d6ab8340344135376d5ddeccec3d6fa |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/291cfc5a092d3b34be4a8aad069026ff33b6cc0f |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/4b84e13f47aaa7fb4338a7f863f416c7b1b392b8 |     
       sparc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/33b49e6883a5a8d80e0ec5aa861fa5279e0e128a |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/e017a8a0c44410d0505efc818cc5664135373f43 |     
        m68k |                  libdrm-2.4.89 | NOK | http://autobuild.buildroot.net/results/296200df545a2af2e4b78ed3d30959a66257b503 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/8c657eb03940ef483ee0f2e468d4f5908d5cb79f |     
 powerpc64le |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/7844b69d7ed96f100422e79b88491833d261ac5d |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/6f91f61cbcdd63006619902f0b6a83675502f17e |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/573fa1ca3315ca60fad215a657793052ac17b6f8 |     
      x86_64 |                  libpqxx-6.0.0 | NOK | http://autobuild.buildroot.net/results/09903771cd38386a73fc9bb605ac1bc7a3a16822 |     
         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/2539d2d55ae73206ecbd00521dfae16ae7b6e255 |     
         arm | make[9]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/075c1a18fd9ebd7686ff67724ce371e4b873b7bb |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/1e5dafa67752e8447679429e2dab6613a0f5a190 |     
         arm |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/d18768583836782355d5de8d5e223cc51a08f037 |     
        or1k |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/8e7eef2c66202d80b05755c83a868882a42dc548 |     
     powerpc |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/b4c25b28cc7c3de0540b4fe5eef35926ff41945c |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a772d7981de51ba9f5201664370565774e5512b1 | ORPH
    mips64el |                   samba4-4.7.3 | NOK | http://autobuild.buildroot.net/results/7030f2a23716852e82abcecd172cde7ae10a6b96 | ORPH
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/0410c451d417bc9973a569cb1c3073d2cb7c23f8 |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/d950f5a72abd215d7002946aa7da902800754aba |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/57547d9006e82a649fcdd5ffbd89c84b7c3f5c22 |     
microblazeel |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/6d7c9aac9b32be63e4c48298888071995ee4d0c4 |     
microblazeel |                     tekui-1.12 | NOK | http://autobuild.buildroot.net/results/2f1e4744dab4e94bb6314ff6ff80c0d9adde9f98 |     
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/254910c41ec0fbf36db86b377d3f237e4d176515 |     
     aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/8f153e997b5c371817388f02dbe6c7fea8857f52 |     
      xtensa |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/393c483eb4195d6f61ec564eab7fd0e7667b0545 | ORPH
         arm |             xlib_libXpm-3.5.12 | NOK | http://autobuild.buildroot.net/results/f24dc74c111690f068833ff6fc72df9a0853d210 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

                    mpv-0.27.0 | 1 


Detail of failures
------------------

         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/a681806ac05c15862c171dc039a4831ef9b8d06e |     


-- 
http://autobuild.buildroot.net
