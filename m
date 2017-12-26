From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Dec 2017 08:00:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-12-25
Message-ID: <20171226070035.2CF762072B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-12-25
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 216 |  74 |   2 | 292 |
   2017.08.x |  19 |   2 |   1 |  22 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

         host-cryptsetup-2.0.0 | 43
             libostree-2017.15 | 8 
                    brltty-5.5 | 7 
                 libpqxx-4.0.1 | 2 
                    mpv-0.27.0 | 2 
               qt5webkit-5.9.1 | 2 
                  boost-1.65.1 | 1 
                  cc-tool-0.26 | 1 
                  ffmpeg-3.4.1 | 1 
         host-ti-cgt-pru-2.1.4 | 1 
                 mesa3d-17.3.1 | 1 
               openswan-2.6.50 | 1 
                  physfs-3.0.1 | 1 
                     pound-2.7 | 1 
               python-sip-4.18 | 1 
python-slob-31ad0e769360a5b... | 1 
                      qt-4.8.7 | 1 
                       unknown | 1 


Detail of failures
------------------

     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/1febd76a2977695ae9bbdc9cc905aafbcaf81a6b |     
        bfin |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/3211513183621a3bf20877f6c3f66377d82e1c5e |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/dd177fed5b9553a15f3fc1cd3b7094b21a8898db |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/35b04b1bb6bb630ddd56939bd1c510035dd17464 |     
         arm |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/751ac1196feb4addd7b7599118dc61795710c7f7 |     
         sh4 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/9fcdff78c98a7f707502cc0896beb74b715f4e86 |     
        m68k |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/23b668ecfa6371bfe461f98bd237bfd1fe724744 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/1cad4cd7817aa5d28f3372bda6e1f4aece9ec01e |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/689cef36dd01e1f27188435c629e7ac6f1ec550c |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/b450c1e4519eefa56d65e80a373bfe2df589e97d |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1246b6929f78a14e486806910b0966d6c7810ed5 |     
   powerpc64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f9680b0eff1054325c522e8d15c814369749c54e |     
        mips |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5856b7eff67f2e0305d8166dde165453a87637f3 |     
       nios2 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7cc99713f2d318be1a28851ab0a8a5a4c505e250 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ec8f3c95c0ab8c1f3108e57a98bf5ad7ad222e73 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a178001afb09aff0a975da4099324927e96e0e22 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b86ba0917e1426a208595ce12968031b07a13903 |     
      mipsel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/eb307a460e6ad591d8ed3da69a2619f05abe4b80 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7f1dcbd53ebe6fd4fa6394d193742f27be766743 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/579b0e157c34f403544764d780a2d0ec47ad7209 |     
        i586 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f63d1227f371bad09c8ee28d629da4fbbf6c7621 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/1f9d573c8e283c8bb996364e9261e9d5a111d606 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ccf22150970ce895c11b8e67110b38a0af8f3138 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2471b61ba4850877adafea2b83674d8fdacd51a7 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/fb034c9e4b46a42f27794adfd4a8f70402780770 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/289d34fb2e840caaa6221a94e40e08904eaa9905 |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a13e868997cc61c4444669f92beff816038cf504 |     
        or1k |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/bae397c7cb8de9a451be34251cf3392bb5e4570f |     
        i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/ae5dd856761e56e4ba57012d98d4426fc5ce3d0d |     
         sh4 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/f790138a28dd595050e567501193895a9bbe71e8 |     
        i686 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/47d47624df185815e7d1a8229fbeb449bb7a20c9 |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c51f6174a11b55d920bb04db3d484179e6cd0d45 |     
        mips |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/4408bd6465bfffd1b68eb6371817ea3cd7071f73 |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/777e1b0be7d1783b26c6ef84c430194847fb8eba |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/984b7c0b635dc0a795f11f1d807735a562927b01 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/cfc246d805dfb04e1c824fe3bb156792ff5ebfd4 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7433331a6622bd8f715ee214d071b20bf9dd5d4e |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5926262e3c4956e9f12c6ee4d0a93e7a63a5934d |     
microblazeel |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/5300abc831de3d582d5546036ab65bcff99e8e79 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/4f5e264df0364d0320d05f94cbbd8210d87dc21d |     
      xtensa |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/b47b60dae090067986f780dbd5bb9a1f43c29d42 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/be55f5b05ddb33866b8876cf70fa7074dc078052 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/188847dd11464465d23943b1d0161a2ceee8f2f6 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c16aa6b729882e19c58c807dd9f6699bdfd0ba24 |     
     sparc64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/d6d9c5721850853c2904c18c69fd2260aa2fca36 |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/72ace97a346e92dab300d82c841ccac53c01c431 |     
    mips64el |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/dad641c626fa046ffdd4c1aa86045e998136507e |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/a15519755b50473d0800e19edccfae6c8b88c686 |     
         arm |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/7cb5ed6d7d7d38552c986f194e2c80f7dae607de |     
         arc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/2bac3da8fd55f7016f0b7e6229d9d8b0535fc56b |     
     powerpc |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/e8b8461f78816d1f00427e190e21a21c25ddc5bb |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/6d573b8bf6b1c5c514effe064e370cc50d757bdd |     
      x86_64 |          host-cryptsetup-2.0.0 | NOK | http://autobuild.buildroot.net/results/c70f7607810b13a0f4989a18c06282381e51a9bf |     
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/593de57a7df855287a7cc914c2976e96073c4e27 |     
         sh4 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/5535250588d43ef83ed51b5a8a2b1143509d9909 |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/e55f22c18e5e6a196e268d87d442247005cbdd90 |     
        i686 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/a26a9da28ac6be514716200545a9a98d8ce42a4f |     
      x86_64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/6bb1a56b9a163b0a7dd708125eb4ea9b2573b199 |     
        i686 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/eb1a9727aa7fe31fc9e1f9611f6298a83d895d73 |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/ad40af20f764fb7960182b8709ab0a7cbbb76263 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/565f886292e29323243059c86025ed85e6be6dbe |     
      mipsel |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/f9b70eee8e74fe5c66e05b6f3ea13bc808474236 |     
         arm |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/a70b544fb6be52da7762a0c7d94e81d64b2746ef |     
    mips64el |                  libpqxx-4.0.1 | NOK | http://autobuild.buildroot.net/results/48c84f9685e196858095ada4ed318c505d071257 |     
     powerpc |                  mesa3d-17.3.1 | NOK | http://autobuild.buildroot.net/results/3b419efe65671f280916b85385c7a80e054ba7ce |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/7eed80686cb4ec6a6bd1e0f39879171e3cd2f61a | ORPH
     aarch64 |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/5bea38289d4f6f60d6eaca63db80f2129dc657f4 | ORPH
      xtensa |                openswan-2.6.50 | NOK | http://autobuild.buildroot.net/results/72fe64ae42b1c60ea386f243ea97d8ad9d2f16f6 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/776553b4a13453a0892a1eb7043d79ea6a4fd444 |     
microblazeel |                      pound-2.7 | NOK | http://autobuild.buildroot.net/results/da280a1b192140e1801700ef599a6bc2d5d5ffc3 |     
         arm |                python-sip-4.18 | NOK | http://autobuild.buildroot.net/results/16bfb0633d88b5b87c87bfc565cb99e97de69e47 |     
      xtensa | python-slob-31ad0e769360a5b... | NOK | http://autobuild.buildroot.net/results/bbe4d02103f7720d79cce7183b6261746324c8d3 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/5bf195d777d9af6ed22d914ce8a31550e7e6ca7e | ORPH
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/645c79bbe0b2bc0f7b7c23e7d20b37456dcae004 |     
         arm |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/febae45437f39d31523e8f5d033834733e3bfda7 |     
microblazeel |                        unknown | TIM | http://autobuild.buildroot.net/results/e60e14238304c115b5cd553ab667392f295bc9ea |     

Results for branch '2017.08.x'
==============================

Classification of failures by reason
------------------------------------

                 host-icu-59.1 | 1 
         host-ti-cgt-pru-2.1.4 | 1 
             lttng-tools-2.9.5 | 1 


Detail of failures
------------------

microblazeel |                  host-icu-59.1 | NOK | http://autobuild.buildroot.net/results/d8f8a3d649be899a6ca4f3fa825c51eb3ba77771 | ORPH
         arm |          host-ti-cgt-pru-2.1.4 | TIM | http://autobuild.buildroot.net/results/d656180f270002b27bae0b7d2b8b0fc0cf976f7a |     
         arm |              lttng-tools-2.9.5 | NOK | http://autobuild.buildroot.net/results/9a52516e983230e6a71e5d29beebb2b6ca6ae7f9 |     


-- 
http://autobuild.buildroot.net
