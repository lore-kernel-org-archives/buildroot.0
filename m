From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-20
Message-ID: <20141221073017.3EA3A101504@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-20
===============================

        success : 264
       failures : 109
       timeouts : 1  
          TOTAL : 374

Classification of failures by reason
====================================

               xfsprogs-3.1.11 | 18
                  guile-2.0.11 | 17
             libxmlrpc-1.25.26 | 8 
                   erlang-17.4 | 6 
                pinentry-0.9.0 | 5 
                     gdb-7.7.1 | 5 
             smartmontools-6.3 | 4 
                  perl-gd-2.53 | 4 
                  libdnet-1.11 | 4 
                    vtun-3.0.3 | 3 
                  sispmctl-3.1 | 3 
                  mysql-5.1.73 | 3 
                poppler-0.24.4 | 2 
freerdp-440916eae2e07463912... | 2 
zmqpp-36413487f05b165dfc82a... | 2 
               ipmitool-1.8.14 | 2 
                    qemu-2.1.2 | 2 
                    libcgi-1.0 | 2 
                gptfdisk-0.8.6 | 2 
                  nftables-0.4 | 1 
                 libjson-7.6.1 | 1 
                     nut-2.7.2 | 1 
                  zeromq-4.0.5 | 1 
                  thrift-0.9.2 | 1 
               iptables-1.4.21 | 1 
                 webkit-1.11.5 | 1 
           libmemcached-1.0.18 | 1 
  toolchain-external-undefined | 1 
               madplay-0.15.2b | 1 
        gst1-plugins-bad-1.4.4 | 1 
                jasper-1.900.1 | 1 
                    ruby-2.1.5 | 1 
                     rpm-5.2.0 | 1 
                directfb-1.6.3 | 1 
           python-pyzmq-14.3.1 | 1 

Detail of failures
===================

      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/d2c39b9a1223f6631d8c6862d56523e5c75e5330/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/fdfc2a3fc7ea0a6fdd0340a6974362bb8affbb4a/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/20f3c769e21614ace6bf475edca6db4520e36d80/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/85ce0a8bf738d061f18f0784e81876a03126d86d/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/74970f340b4ba7c0d12831b50870d6088e56690e/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/de971eae15fd4d5bf7f38f114dc9fae1228ecacf/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/08a66d0bc1fb3193e2fb6823e59824b273d87665/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/1c651eb48a79593535bc1735dcdf296cd594c873/
         arm | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/c73d26641775be02edea95ce22349ba551d4fbf8/
      x86_64 |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/aa4c729e6a173cb7e625efd7622945efabb8d59c/
     powerpc |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/6c361b203d4723a94d0428a656179987d8d9ea51/
         arm |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/b13ad7d40ace6ac2f0113b03655e3e5cf1039442/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/8701b853671e3ac6bc9613fb1407e3bc9b8dcb48/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/147a615e632b322d8de504a291032eb68c49b3be/
        i686 |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/bdfb14b284677a2e11e4ccd1e9c6f7060e125bae/
      xtensa |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/b0f98ff102fddc9898bbe126317149c41fd10328/
        i686 |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/fcc7fdd2e2be2c129dd222a3db4e66ba80066eb2/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4e5d814acb313685feb820ee9bbbd637234c42eb/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0327b2b20615b10c152fb86e2fd13c677c5b4f6e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/46cacf9f6b18704cfa6eb343af5f357b41ab621d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d7b8f9241c785a90a0ab3402b141fc3bb3ef34f6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ed6d1a55f0df4e1c08f855df36f5a3192d63fc1d/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/24d795afb0b8b43ee4de7f5dafbc1e8412cb16d1/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/27397b9e0c7e6e39b18dc401796375d1bab2ca7d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3b4b1e5c0bc9dc0c6f59e3d4c3f4504e976de0b7/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/387fad1b8ffeab3a4e9b46d33b8aa0c67ed0d092/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4a12a45f64b744f3ccd6f813a4dba76516681672/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/5e4a6cf033d595bf0b3c547d4333f76d6d6467bb/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/3d879680273e744ec4615f6bd6fd8f559caba89a/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f0a3f39c32a80e001f6ed7fe773f720975e188c6/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7e36e1025484190b37a39e350bbf127a6dda0a90/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6674ca52a18b54b74076b46650e8777f463f9c2e/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2b5880d5ab841f473dbb0915420f3d2cf92e570f/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/7077449204883b9df1263064da4e49ca1a81fed0/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/1d5b4cbe73225d55b057b44314df0f474726c4a4/
         arm |                ipmitool-1.8.14 | NOK | http://autobuild.buildroot.net/results/f8a697f6a2a7df30013d4aa8f673778771d36d9b/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/d4924cd779a22bf4cf18aa505bfc9c1f227c9297/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/09a9c2b7a3b3586dd39e5bc71e4be2282d56c783/
    mips64el |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/2a1363ef9b195a6f4ebd7adbba9e87aa661ff264/
    mips64el |                     libcgi-1.0 | NOK | http://autobuild.buildroot.net/results/e5713bfed698b4ec0682b8bca61544142f5d26db/
      x86_64 |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/23d69fcbd8855303be00ae427d82d0f623fb8674/
     powerpc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/a8361147808c0e84b1ce06518ca4a8c4661479a5/
         arm |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/5677164d7d40db972696947a6a01ef7a6fbb8259/
         arc |                   libdnet-1.11 | NOK | http://autobuild.buildroot.net/results/2a4ce82b51ffcf7564a277c244415cd092f42f8c/
         arm |                  libjson-7.6.1 | NOK | http://autobuild.buildroot.net/results/7c33d6e7c44a981175d97deaff9d45d81d5a83fd/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/76be6321295700ba7078c3023390986444d4c6df/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6bbf0b3e90c0c3487eb693d18123cf93067c842e/
        sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/3992ddba1b7c6e0004b1bb4f50e47ba8f4961a91/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b34e1965b3c19f219fe3f7177b33e3a3f51ba77e/
        mips |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/6eabd5947a378c9a265bb3d7b3f2458c40b69587/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/240502ad0221ea676291bcb3edecaf5ad52f4741/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/fb2befbfc238f9631e25fba376c747df253a6ef4/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1e3e1c82786b6f2be6490d33b6ed0b5dd57b7e2e/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/b297ff586ea3e0219b51434a0fb25400bde3d1a5/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/63f54162e3d42230f8d06f275880205a86747fd6/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/d34906970da1fbe46bcb357bf6935e532b1cc4b1/
      x86_64 |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a8696a982f30d72f52637618010df6f605aaaec2/
     powerpc |                   mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/1b092d778b241bc32d85eb5577f798990f8a8405/
        bfin |                   nftables-0.4 | NOK | http://autobuild.buildroot.net/results/742acad209e8128f0c7db2b13bb159ab16354e8a/
    mips64el |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/404496c88e63a96c0d40c194876a430cc7e93e23/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/504d64d992eb504e02c127feb4734a917ad95d0a/
        i486 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7d34bffe55f4d95afd971b8dc197e40b1fab7270/
        i686 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/15ce69b916167305aba2820a157c880e487ee8c7/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/5512213c8861e51b390c1c223d53add0ec1ed758/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/6122b0ff676475ea76dea202a89db860a673dcd6/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/d5c15f23e5da500e26811f0515af74af2056721b/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/6d46a279c8d34ca2e72031f534f4dbe5723ff0a6/
      xtensa |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/dbab4ebced19b851e73d8090a8e0f89dc17f0fe3/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/83b165a7a8109ea3c5de35ae368f1b0c209b5e39/
         arc |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/4d3fbff00005947bc5f872b7be41bf30ee51d2b5/
     powerpc |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/3fc6ec8e432de1e136984f5935f97b421b84003b/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/b317befa79df2780130ede7366ec18342540d65c/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/9dd581d92f4349d4fe699f3481c6d2994361bb61/
        i686 |                     qemu-2.1.2 | NOK | http://autobuild.buildroot.net/results/1b68c0649f43c0c92d6bc360a26333febb3269ba/
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/4f36d1692c0038ece22ad0b1a06e66e9e683186d/
      mipsel |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/40e9f62373fbe7f1d74cac514dfd7ec38186a48b/
        i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/b2d3f4db126d95e9316edd9b6fc7a6c6e4100496/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/508ed9ebb6bb6cddf9dd0fa3df391de93e34026b/
         sh4 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/dce3be901c2bbee7a8319870c27a47e75792b615/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/73f19d8323b393b9ae1da48f8bfc313f0326ed5b/
         arm |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/5abfda2b47ee6c397b44359aa6840c7129339a48/
     powerpc |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/213cf55e84df49e166204ab23ab0dc47892389e1/
     powerpc |              smartmontools-6.3 | NOK | http://autobuild.buildroot.net/results/4954b1ef8322655f63ae0b84f85835a121825e49/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/4e8c95f0a3a986f6847daa2098cc774f49e8a972/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/c4ced8c9cd00ec906fc7472e2a0a46637ced27b5/
         arc |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/e921306e8be5f507a21862410f8d1466ee58ba66/
         arm |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/f6abe258c8ca4f35211d6cb283089b0b3deb303e/
      mipsel |                     vtun-3.0.3 | NOK | http://autobuild.buildroot.net/results/c57db268a1a5a7a7ca236ea6e9516bb9af266204/
        i686 |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/46feec912615cafd47eb2758c6e53b2cef2f105e/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/5cc3efffd98e74692d1b56af1e5d6358777292af/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/307521f7dc5720116918d5aef8565dd8d6f6ddf1/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/1951c72aa5849eac67675466664b0b689389464d/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/8e7cf326ba28ad30c7190ebbda77e2940fd75e27/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/9606bb6ef9469c624dcb8627a11872bd9ca55b52/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/8e600ec76110da0bffad7b4cc6d75dd5e0a8b41e/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/81568363c4ee68c6237f39050218235b8ea28a2f/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c8727691d8c0a830b14d7b2b40cebb2811257970/
      x86_64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a1ce21c136ba37726c9357f6537d25e6738e3046/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b1052a3ee7e15d54e8e544fe27e491ff2c3799ea/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fad7a219d6e5825e6e3935a477e20a865ac2b621/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/099e88da736d2a96e8688f240b129c1ec4ab189f/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e9c2602f5c978d6a40290d13e121b5714775d69a/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/0edbfe70eae91df1870bd146492c771e699ece32/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/66a10463dceb5cabfc2cc865cf9912dffe41a2b3/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/0a0883f0dd03feaf1d84d172192a2c69f22484c4/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/cdc1f19759309be371225e76768dd730d28de9a0/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a41c81eb166480fa5fcdffaa6d6585c772e60791/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/11a255c8b21492fa7c19833804b264cb90e17493/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/8075cdb0ec5b9078dde78db6d5a38219e39145ab/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/c66405603a9da8c8d6300f4d01889ff6a57b1b0d/


-- 
http://autobuild.buildroot.net
