From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 08:28:57 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-11
Message-ID: <20170212072857.7E8D12075A@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-11
================================

      successes : 213
       failures : 58 
       timeouts : 1  
          TOTAL : 272

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 8 
               openswan-2.6.46 | 5 
                     wget-1.19 | 5 
                   ortp-0.27.0 | 3 
                  samba4-4.5.5 | 3 
                 wavpack-5.1.0 | 3 
               bctoolbox-0.4.0 | 2 
             berkeleydb-5.3.28 | 2 
                 ddrescue-1.22 | 2 
kmsxx-bd5f6471e619a6ba2987b... | 2 
                 libv4l-1.12.2 | 2 
        riemann-c-client-1.9.1 | 2 
               trousers-0.3.13 | 2 
                  cppcms-1.0.5 | 1 
                    cups-2.2.2 | 1 
               domoticz-3.5877 | 1 
            ecryptfs-utils-109 | 1 
               host-gdb-7.11.1 | 1 
          janus-gateway-v0.2.1 | 1 
make[1]: *** [complex.o] Te... | 1 
                    mosh-1.2.6 | 1 
                    mpv-0.23.0 | 1 
                 opencv-2.4.13 | 1 
                 openssh-7.4p1 | 1 
           oracle-mysql-5.1.73 | 1 
               polarssl-1.2.19 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.8.0 | 1 
                    ruby-2.4.0 | 1 
                 sudo-1.8.19p2 | 1 
             util-linux-2.29.1 | 1 


Detail of failures
===================

        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/be8b4cb8d11fb5952a2f5a0a163bf050da5f9f0a
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/6555bda98bf978eeb40138fb611d83e1a6e42f7d
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/890b7dd8f8087416ca73b9dab510feeafbe4b6f5
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/3d2d840b5debda09f9de25680c67e967bc7fffc3
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/d52d3ca883f81f39b9e98da3ea88414badaffd8b
        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/f6d3a20470b5002d90ae6fc6033f340ef64a0417
         arm |                  ddrescue-1.22 | NOK | http://autobuild.buildroot.net/results/06ae4d43acc11d23a4f00b5a10f46d3bb1d96830
         arm |                  ddrescue-1.22 | NOK | http://autobuild.buildroot.net/results/903056fb6a5f089cfa3ba676dc33f7922d7ac2fc
 powerpc64le |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/fd366f35221f287cf72694f6a84b3b938a4d6042
 powerpc64le |             ecryptfs-utils-109 | NOK | http://autobuild.buildroot.net/results/4bd27afef12a0d0d2503a820ade82bf4eb3c64ce
     aarch64 |                host-gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/cfdc9117fef7ecdf5cc5fc907a6fe8701a2c174a
       sparc |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/7cfb84762344eb3a1a0ff0859b22f0fe5eb478ed
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/7ebaa00b2d14131fadd15df6db32632828c1de33
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/42c2aa4b58de3ab84a27f53a696fa60d087c178b
      x86_64 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/828ccd02ebd6ae3411bd414801db8525f9018a1d
      x86_64 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/3853351aaa658c8b377420c18630195ba2689f55
      mipsel | make[1]: *** [complex.o] Te... | TIM | http://autobuild.buildroot.net/results/3ac351f1506e1e80c45914bcc5da5ff10c7dd49d
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/04614d3b553ce7656f5341df2d72b9068cde2f84
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/76cc513215eb6e26c15092d15aee6439b7826bc3
        i686 |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/f935bf9716cdb93a2076aff9cba099cba43d9064
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/742a8bf4726de6e9ba6926e3fb6019a434454e48
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/148bd2158ae4c302e04f20bf94dd7fc10074a21b
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/49b0dbd2a5a92a5286bd6574eca1061936425370
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f8b36ecba7c86306ea5bc3fcb28b4b1b6f1deab8
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/aa18900709a28dc5f0dfbab7e332435f9b8fcb5b
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/8d937cf837c1dca32f6796ddd7641ccc9b8d0f35
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dd4da14ba9448949bbc73310408d52874e10a1ad
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/48cdffba37750ce7d09196dcb4993f09458c8f0d
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/fe6b7efd943a5bf44fbd73dba85c69e59bf5e278
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/4c230e806657ae8dcccb31a0168c34d72e897d08
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/ce77d8fc6f24ddc1e691270a1148dc692e2b66d1
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/0dbb0c6d8df9c3754ed59f8770ea34694531bd05
        mips |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9483013f78a70974594001869fbf4d42f02eec29
         arc |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/47d7d9eab665e44704dc2e9cb2baba99176c410c
         arc |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/2e19dadc36bdc4a2a5805bca212182dac1e681c2
        i586 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/41351d260ebc787cc7c46fb90c5906cda20ccdf6
microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/d58422bbce3c3a501de99de1218eec342cb4c4a9
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/c7f760709c242e9ed578474082e66012eb8230b5
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/c2d667a32c4c6d1c2bb1492afd4f0c2b5576d5c7
        sh4a |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/aba6406ffc7c339ffebfb320479ede3b682c112f
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/fa45fb0fba5735616ac07af8ff55f3cfbc476e66
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/098c0a0ddacc703da969bf7b09c173d6b7fc799e
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/821a3833b36437b83c7e39e13d564afe5ce5cc8d
     aarch64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f48fd5db4674dece1f640d1779c3a2cd13295060
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/2af6cab470e0987607f3a2e2be8d925871e8fb68
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/a3e9ced5d8ec4f5a99a8ba719dbb1e7e59b75208
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/83d319baa1fe6cc89aef2cacde370eb3416ade5d
        i586 |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/682531f368c4e982cafe9e625dd41f6d8c7f93f9
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/214915aafc5db6db4cd936ad80e92c6fb18f163a
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/8c7272b671d01d9fa25b87feed4e3ad28017bdf7
      xtensa |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/28d90e11ea238eac774dd4722625d29f00c1d271
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/b9a03588c2c1b300147740f1b016d82c7f76f6c6
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/36d79d43a0d26bf848dc50244f2a9754269ad67f
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/024721851986d19277ac64a698dfa2fda8f127ce
         sh4 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/dcae21523adc125598bf99b8d99e9d8bf63f695f
         arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/61e6fefbf28905789969a427a82f09c1ba3fb97b
        i686 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/c9b7cb6adbb1f71231cb0100556372e44cf63f97
      x86_64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/9b8b203e100ff48db9f9836e891ddffeccb90654
         arc |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/4f54c65f197593e039fc4b547bca3fb4e7b44ef4

-- 
http://autobuild.buildroot.net
