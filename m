From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Jan 2018 08:00:49 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-08
Message-ID: <20180109070049.8429B2072D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-08
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 196 |  62 |   1 | 259 |
   2017.11.x |  19 |   0 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           execline-legal-info | 35
             libostree-2017.15 | 6 
                       unknown | 3 
              cjson-legal-info | 2 
                   jamvm-2.0.0 | 2 
                    php-7.1.13 | 2 
                  physfs-3.0.1 | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
                  ffmpeg-3.4.1 | 1 
                   gconf-3.2.6 | 1 
        host-xlib_libX11-1.6.5 | 1 
                libnice-0.1.13 | 1 
                    mpv-0.27.0 | 1 
                      qt-4.8.7 | 1 
               qt5webkit-5.9.1 | 1 
                    s6-2.7.0.0 | 1 
               tcf-agent-1.6.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f505dc5e82a6c544cff4c391952473df08df31b1 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/f8320d4ed6c068cf204e0deba0fee084419776e8 |     
 powerpc64le |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/1976e168b5daf791edc53327de3b6d78147fc9bd |     
      x86_64 |               cjson-legal-info | NOK | http://autobuild.buildroot.net/results/748b5848d089c201756ee6f36104a52923c8f29b |     
        mips |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/aaa3e79727e33d20d4a4db9999572d7415c934a4 |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/ab000ceff5c4d0923df3e84ee1a1f2c2f7206d5e |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/b71bc8797d98c579dcde9cf391e48a110846fc74 |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/2fb80eab196af075a83d727236758022845115c8 |     
       sparc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/8c05b4a4c88b388eca11f58788174edf33d25955 |     
         sh4 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/981a60f580fdcc087708a52228d499e955c04341 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/4e09897ee4b402a0ee1b17f2a073f1f9cc862757 |     
   powerpc64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/324c24325693cd0f3022895c1f43a1b3bc4d010b |     
microblazeel |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/cbe18a708aa1326bb2be6e091146480d2086140d |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/188e3cc1e0be3ce6c489e16ce1172abf8449e5b7 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/60c2f2310a973d0bee56d10fa4e01745380d761c |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/0180cb2b26a11a315a47e4823a4ebfce001df397 |     
 powerpc64le |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/51256dd3408be23024c351d3d52645c8dcd83c13 |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/c034ff290e733f0704f8b8288733c2d30882a716 |     
       sparc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/24ed9e8d436a5baa1ede87918bb8c66171d82bec |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/f274666cd8704019422a2e39da95f2f4290f1b58 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/e028f6d6e37aa6b4d600e72abc7bfeae955be0f2 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/01e396e25a0b68ba1a5d2e639ad6b07c3cef7ab9 |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/effd94f582c9a2958a54a872d49a26175477350c |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/beb333b094109b4d6d4e66357ec33640ef2ad48b |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/62ca332633ba1c36b9a697c5fbc759b1894cdf7d |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/3111d9782d62a57d675bd22e38e7b22fe50fa4b7 |     
     aarch64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/896a1fa7edf79e4c6cee47548e59c5607cd55e2d |     
     aarch64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/440e7edcfceaa56c370d713ef356cc9e4b12b67e |     
microblazeel |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/44ecc93c915da5ef072b07161bde0422d699fe55 |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/47aca30bc1f2484d49ca8ea0a56479e3dc5c5537 |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/efec37127ac56e8e2f6a79f162d02bf11aea39fe |     
      x86_64 |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/1b2e7a8f5661186bba39eca355d5544b7dd441b7 |     
        m68k |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/af9bf3fa386ffa2d526d7b41d4a048d40676e75f |     
         arc |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/085c3a5d8646aa75bda787fe37f9d48aa6cc3cf2 |     
      mipsel |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/dbb18e71fb02bd9cba978aa0d36b33290d1e6ca0 |     
        m68k |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/452e7e7d3ded42db1913c480962c687177e44c9a |     
microblazeel |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/f66c3fa97d3f07346aa808ac39ad51630ecd44ec |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/9d054a26d7833353efbe49c984a7cb66d77b1d0c |     
         arm |            execline-legal-info | NOK | http://autobuild.buildroot.net/results/43c8559bc0c1dfe002b310e64f80a3eaa6aa7bdd |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/7e7c1a16da553e3201bfe2bbc16a7cf5d6af82e8 |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/807fb71846ce6f6b76de0517f5c86491c1e5be69 |     
      mipsel |         host-xlib_libX11-1.6.5 | NOK | http://autobuild.buildroot.net/results/ed27141d886c9e8b83db6315e97eed04b4cb1e13 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/4cdb05ef1898d64a43310d490ac3acab26a7fd19 | ORPH
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/fc41af1ee05ef09ddc9334b7bfd20cfb110d3296 | ORPH
         arm |                 libnice-0.1.13 | NOK | http://autobuild.buildroot.net/results/f87961ec9535063a73690671339f49a70c7187ac |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/05a760a106e6c63b5e4f8b36233db8c1bcdd5297 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/7780e2dec4565cad04340b5c564859b8eac5f06a |     
        mips |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/f554674989dea1ac905f3c063c82e2f8200c8190 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/8d20bb04adb5a9f8a0c7e3399926c9c27a88d70a |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/cd056bd1e1df7f8884fa01be30f5e5dc6e15ed98 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e2d960c8801ff6f2847076d3ae6220783f2aa828 |     
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/f9feb1ddb843e67445ee9b4de115b4d2f1ef3ec6 |     
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/0f37f1909c2f165e2bfc0987f384e2bd7cd41346 | ORPH
         arm |                     php-7.1.13 | NOK | http://autobuild.buildroot.net/results/7cc1459311cb36e5b99b3dbb4ed7e14519da1a27 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/1e0ff8e0d0a7640194f1d180df85bca4602fe770 |     
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/8b244438e04ba451c0aa3b89ab18b5905e004181 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/ba054855c1ceb64994a6fb5b83df72a10fb6aa94 | ORPH
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/766495a9ac5e8c82cbdde2263ea214871dc0da42 |     
 powerpc64le |                     s6-2.7.0.0 | TIM | http://autobuild.buildroot.net/results/53fec5192d582062d8f62caa9b5e05495c020328 |     
 powerpc64le |                tcf-agent-1.6.0 | NOK | http://autobuild.buildroot.net/results/99d65116a5512b5ad32e5b70a742a520d38be9cc |     
      xtensa |                        unknown | NOK | http://autobuild.buildroot.net/results/aa8ac38c080b529ab6e82e99dd9eb4e98dbc0c3b |     
         arc |                        unknown | NOK | http://autobuild.buildroot.net/results/c884718991532d129b68d43fcaab356c9b6dc249 |     
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/5572e9bca90a41febfb7c35bab89cc371a16bea7 |     


-- 
http://autobuild.buildroot.net
