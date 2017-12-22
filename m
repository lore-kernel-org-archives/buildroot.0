From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Dec 2017 08:00:06 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-21
Message-ID: <20171222070006.212692092B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-21
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 226 |  29 |   2 | 257 |
   2017.08.x |  17 |   2 |   0 |  19 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    brltty-5.5 | 9 
             libostree-2017.15 | 6 
kvm-unit-tests-kvm-unit-tes... | 4 
                  ffmpeg-3.4.1 | 2 
                 libcue-v1.4.0 | 2 
                  boost-1.65.1 | 1 
              host-erlang-20.0 | 1 
           host-mono-5.4.0.201 | 1 
    host-xfont_font-util-1.3.1 | 1 
make[1]: *** Waiting for un... | 1 
 netcat-openbsd-debian_1.178-3 | 1 
                   pcre2-10.30 | 1 
             qt5location-5.9.3 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/94a4bdd70ddca5739bd42781f15f512a119fb981 |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/e4725ed65c39f13ee1cc830a89c418d99bf24590 |     
microblazeel |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/d3d66c186a3cceb3d5071e30c3fdf82febee9e27 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/d9895c159dc87dd687f56a80887e595848d59529 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/5b240e2f4da3d5a4daa9eb875e4532ca466e04a3 |     
      xtensa |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/4514672676e4309b64edebff0ced57c3057cf67d |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/00360c4e6d7a45f02f4363829eacd20813e022f1 |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/11ce58439827704e2b414707e72e5e4e19c0d473 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/6cec326d0f008b43c55707c3cb32feff5bf8699e |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/64301959d2af521c964e8c367fdf1a16874a503e |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/1a51626b865855d86c05fb60db06c9e1c61da4b6 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/416e8f519f6d5c074b8fc286064b29f4b0d4ea2d |     
         arm |               host-erlang-20.0 | NOK | http://autobuild.buildroot.net/results/fca7214a4a65ab909210e3086658ee48614ef630 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/88dd0c2c5ffc477b5fd70d1c80996e2784482e21 |     
         arc |     host-xfont_font-util-1.3.1 | TIM | http://autobuild.buildroot.net/results/9662b9115b091b67e7082b3e69b5d46ae6e90213 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/bf2382f1483ec358d3cbcc0e2ac49d94d6a1b260 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/abc4a57df2e8d4070a67091bc39e4e2ccb608598 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/516d1845534226465ce47e1367947e096131e3d3 |     
      x86_64 | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/3d0bb60aff3710be543ed57381639ee60ab8020a |     
        or1k |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/d84c7d0cb9cf5fa9996c42149eda5295700516f5 | ORPH
      mipsel |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/f256037ca3d49f96add8ca2e2f9c980f5f9d764e | ORPH
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/86692e23b2dff122cb33c267a3c1542c4a994b3b |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e0bdd435a5455559afd77abb4405a76a07776457 |     
       nios2 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/0a977654dc5be6f96228c81f33c32d10cb9fc554 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/7506c2c57f88510e7e0fa9970dc33cdb0fba7c00 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a519d7e727234c947d261eb9624933bd84cd799a |     
 powerpc64le |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/0757b7d57ac4a4bb42f4dbd857747d99b635a25a |     
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/bcf2d7c2c03c0e5a9d99bf93ed6815a1bbddc663 |     
    mips64el |  netcat-openbsd-debian_1.178-3 | NOK | http://autobuild.buildroot.net/results/3cfa4cf0466d66779f769d6ff1368fbb8bdff9c6 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/a991b88562b2a2c5d66a6a3bd5b91406e259f1d1 | ORPH
    mips64el |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/7df795849822b81ef36ad9c2c7b7a1c91abe1cd0 |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                 libcue-v1.4.0 | 1 
                 mplayer-1.3.0 | 1 


Detail of failures
------------------

         arm |                  libcue-v1.4.0 | NOK | http://autobuild.buildroot.net/results/e3dbf68f6dbb5f4a4c4dbb7b6a15d4afbe4033fc | ORPH
     powerpc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/19aaa9f78be139e82cc9469c9cd39144a2c5a5c9 |     


-- 
http://autobuild.buildroot.net
