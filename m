From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  5 May 2018 08:00:16 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-04
Message-ID: <20180505060016.196072072B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  18 |   0 |   0 |  18 |
      master | 170 |  48 |   2 | 220 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           libfreeimage-3.17.0 | 17
                  host-go-1.10 | 5 
                     lxc-3.0.0 | 5 
                  zeromq-4.2.5 | 4 
               log4cplus-1.1.2 | 3 
      gst1-plugins-ugly-1.12.4 | 2 
                        libnss | 2 
               libupnpp-0.16.1 | 2 
               asterisk-14.7.6 | 1 
              ghostscript-9.23 | 1 
                 host-rauc-0.4 | 1 
                   jamvm-2.0.0 | 1 
           libcrossguid-v0.2.2 | 1 
                 mesa3d-18.0.2 | 1 
                php-amqp-1.9.0 | 1 
                qt5base-5.10.1 | 1 
              wireshark-2.2.14 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

    mips64el |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/5bb4f2cdc53c7319ac58b3a36f2a067aca7933bd |     
         arm |               ghostscript-9.23 | NOK | http://autobuild.buildroot.net/results/cda9c22bf29278cc24ab852094df19b773d0f151 |     
     powerpc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/c872bea02301d5ca9bafc92cffac67acd785db07 |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/7378be2524050c6b787889960389ac8f44998624 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2c524bcaab114aa38c067ac4ee04af07c6ef8e96 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3308464fe9a8cbcdafe3fe708ce14f342f2a2623 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/2b4a52f9e06c7b7cd4e1a98ca37c274ae48b9995 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/342c1ed1c7deab4fa2958477390f5a896723227f | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5704e3799aad35e199dcf41ef6e667ae6d18da86 | ORPH
      mipsel |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/2f34a0847de25ea43454f5cfa368177814d233df |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/e364e9a15fb189a36eec1aacf495e18e7c58b819 | ORPH
     powerpc |            libcrossguid-v0.2.2 | NOK | http://autobuild.buildroot.net/results/674323d627fac2f85e3ae6bc327fef7e6d4b08bd |     
      xtensa |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/752bf2a3de3b1847ecd09d85c8b8391ff615f9ef |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/2efec10e6ec47687debebe8abec820c008ead2bc |     
      x86_64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/102c403add02e1f8f9f272f26258dcd6acbe6ba5 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/781a814e51beebdcda648f651d84d50562c77072 |     
      mipsel |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/b5d61fa8f5c9668c4852b80dd1a4036d57cea256 |     
         sh4 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/0df4e2782921986dd25401881a33cfe714ac675a |     
     powerpc |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9b8b410273c42497f149f1ed8413f76b42c88da4 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/45bd6d4fc7cfcd160ba0d907515fae18ebf33630 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/e52f636ae887cd8105f2da3ae8041dc39772d6b4 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/81f1b7bcd5dd66f26a6770a4f0b50dc92a31c76a |     
   powerpc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f9f093c05128b9a1afc7830999cbc42c7e0edc45 |     
        m68k |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c8a20db41170b6eb1d1aa5187578a2b2263bf869 |     
        mips |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9583fcf48d462e0883f5294bc0b3a3ed308a836a |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6bcf4e91b7623c346692186368aed9e817ed859c |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3bc6244e8f7a9238a332c9fe813c2ef22ed8925f |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/691f8863bc3b49ceb280dacb6cdff050b5e31572 |     
        m68k |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/066bdf4cd4616593ea80726b7cb24c6080789068 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/d62b9563ff3db84e0b3bbdf0109b19c16f232dd3 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/b07a436b1dd6d9e9bb48203b748a74a71456f807 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/cfb332a169863bcb3e6bc6ee7d6f6199f856b0b8 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/0a18dadd069e20484b839d4f0c6b200052497952 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/9ba8eee3aaa13691346e248d24598ff7a3d5b707 |     
         arm |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/c6e6692d5ad1be270ff0c97f47e5f6687efe1c35 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/107f4d7088829436e8fb8d0a7e463d158e439969 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3cb0bdc3e499e54b4b0b092e037f6c562947509c |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/837eeda7a136975c658e3de5822a5756b75f72a7 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/138ca66cca466a83b43442b484760c429f854eba |     
      x86_64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/212ac6667ff5a002f16dd0099b5b1cc04f0311ce |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d78a97c37b68f52a4502176b499b663db9acfa7b |     
     powerpc |                  mesa3d-18.0.2 | NOK | http://autobuild.buildroot.net/results/588d22cf5b68d7e42a95dfe231067b9d6749c59a |     
      x86_64 |                 php-amqp-1.9.0 | NOK | http://autobuild.buildroot.net/results/e5e4bcc0cb447211238186138474e5bbdcdc2aee |     
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/0d5d3759697edd856a7621097e1ed6b8321e05bb |     
         arm |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/a3aa211e2f21efa75648fbb6058324971547643e | ORPH
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/e5b682132e969b3ab316b680346f1004d4b49d8c |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/2c468284740306c759deaa8ddb7a57e0168f9051 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ff5f39ccbcaf0869b016104c0790f392f1098308 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/1c766c06fad7cc9e4a1646f11fdccedf4d96ca50 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/523e58eefba7ef23a09ef53160da22190ccbb098 |     


-- 
http://autobuild.buildroot.net
