From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  3 Jan 2017 08:29:42 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-02
Message-ID: <20170103072942.715C920705@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-02
================================

      successes : 157
       failures : 78 
       timeouts : 3  
          TOTAL : 238

Classification of failures by reason
====================================

                collectd-5.7.0 | 19
               libglib2-2.50.2 | 16
               sdl2_ttf-2.0.14 | 9 
                 gnutls-3.4.17 | 3 
                 libnss-3.27.1 | 3 
                    cups-2.1.4 | 2 
                    git-2.11.0 | 2 
                log4cxx-0.10.0 | 2 
                 openssh-7.4p1 | 2 
                     popt-1.16 | 2 
             rabbitmq-c-v0.8.0 | 2 
               ding-libs-0_4_0 | 1 
                espeak-1.48.04 | 1 
                    gdb-7.11.1 | 1 
                  guile-2.0.13 | 1 
             host-nodejs-6.9.2 | 1 
             i386-linux-uclibc | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
               libepoxy-v1.3.1 | 1 
                libmad-0.15.1b | 1 
            lttng-libust-2.9.0 | 1 
                   open2300-12 | 1 
              procps-ng-3.3.12 | 1 
python-libconfig-b271c3d9da... | 1 
               qt5webkit-5.6.2 | 1 
                    rfkill-0.5 | 1 
              sdl_mixer-1.2.12 | 1 
                 synergy-1.3.1 | 1 
               tcpreplay-4.1.2 | 1 


Detail of failures
===================

 powerpc64le |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a851ef03f6433ac974a5e90def7946644a245543
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/2ed3c49f9bebb65b383df5b6eca27b31694aa094
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0bd8439f725b9bc322fc88d49156dfc5a3805054
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/758eda2059a0ad46a01d7929af29f1b06cab7ceb
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a37483619be92c46e7ef5f31f6d997f269cb0bd4
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/57a0733d654c5181fd295f82fcf3670ec0183437
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f018934d368de37d6b3c8223e1362356bb57d0d8
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/178c9535f2e943fbbf352c02584e925e2127bfc4
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/5dbbd9076600238e03d2faede64822e6ad4cf2ec
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a0bfb422588cd05c6ca873ddb684b5209c9df19b
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/e454202eeb6cdbcad375d019b159790da8de4b8f
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/92168ec7cc196ace5176305976817c725aad1538
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/caf286b5295aecd4c48c5c10269c8076b8406434
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/56cd0fdcad775596ceb9be8c590cebecb50f04be
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/de9287ce537a8cbdabe368ae278dea5a5455fa38
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/afbe495b0a3d54411c93bd25b656e7d112c8c918
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/649a89a905aafcb85ac84922bf0f936e737d08ef
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cac359d1f02b34df06a1ae677ef7bfc070bc87a0
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/120cb3202f9a41b04127d5f6f80616bb561af936
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/a7e57719759705cecedde12752fbe936c11782ee
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/50ab978117b1f26ddb662b41b5e3067317be64ad
      xtensa |                ding-libs-0_4_0 | NOK | http://autobuild.buildroot.net/results/bf72d345c496999d515bba7ca2414902efb2d4b3
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/5fb1d9d4f6ac03b804ca861f65fcde518383b6fd
        i586 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/0e5ce92ac4fed38c645d95aaa560ba90329df600
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/4aa5f4f44499b236f36667daf6afebd1a05d4182
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/731cd27c14fb94e82b57e2c81629512587d37ff5
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/792193e1c9832716ada05b0c5be6993cecb0a89f
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/c6026e57d07ba983f777de212d6a93c9a7e327eb
      xtensa |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/d18d6a774d5546378ee7b07fc787493f7bb1f53a
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/99960b61fe2ed4b496150125459c0efead5cf257
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/b69a8f088bff09b049fe5ff22404e20c56dbf83f
        i686 |              i386-linux-uclibc | TIM | http://autobuild.buildroot.net/results/1b9570408a1ef38518b3c51aab9365806460a5ad
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3caf3bc144015cf1395701a0ecaf572fa4d28eb0
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/b37714614295f31f664de1d20b60998dfa474ce8
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/fc2e4f425fdd2442d3a65b4e431ac525aa3310f5
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/e10afe3f0bbcb2ebdca99c97c6b62bf4750fdd12
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/012bf8a01cd7b622331e8766e45a7f60eafd15b7
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/48dec3ce4e76928d26ac8598a244332d0ec8462d
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/577eb76cfd2aed43b83a0390734a8e818254d7ec
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8420d74f49b9d6dbccd58b0b7939804f03d7c885
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/ca4d5a9b8cc410759322fd7c580027b4d79c03a6
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/5513d0f1282ff3c9fe8527bc0cd9151165b5ab53
      xtensa |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/05b3c267242ed30fb97f921cc936655024c89c9b
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/08122c1a98a28b93888bcc78e789bd69d389a2e7
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9147c5d6b5f04597c8c189c407f8a17c5690e6af
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/3baacc8b1be5a76a368731d7dd58f2f06cd0767b
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/30ca0fd5e2b58aea55148b4600fcf38e2e2a18c9
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/bfddaddb9366e9693b163c3525ce08d0a316be2c
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/6ba298ff7fcd5df65df37a5c3ed219a8b097989b
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/208c7a82644d2e1c5d266a13144d20565923a185
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/45fd3bee281a7e488fc5cd33efdc3cd96d5265dc
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/f12fad3e2f943e040d6f0a92a5d91ea157b526be
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/0211e72699773a10bc686cb2d4bd6ac732732c67
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/8ab2d8e8b05f7dd3373434ee9fb391247855a037
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/83b574449a85a1bf4e37490d34f741011203be25
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/a1a94efd32770b84c385e15e8df5c3e1a7894d06
       nios2 |                 log4cxx-0.10.0 | NOK | http://autobuild.buildroot.net/results/4a61ab26bf9871417022932bc08105e2bfbf1e30
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/16feb0eae7a810f28598e2f9a902e48f2ae26a46
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8df21e6ec55a4bb571455376e4b4daa931f774c8
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/f3b718f1ffa20903e391ebdc32f12fec413a9467
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/6188b419895a27bfc98c2bd548e2506132bd85e9
         arm |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/fa67115e9604a924d4a34f6876339c9d41ee400e
         arc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/c39f3349d2e712de8cf0bdff085ad0395f281e93
         arm |               procps-ng-3.3.12 | TIM | http://autobuild.buildroot.net/results/350ac4846c8654a75c2c9f50e37503ae10f7c3a6
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/61cf24a31efb3f6fef85fb6eabdf6e53d95a7fce
        i686 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/f4a481ae0cd01264deb9b871b4280f041aef187a
      mipsel |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/cbb4a69eae79e3e381c656473948f6e1efc68a5f
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/3efc463dbc41f60bf3bfbbbb8d5d79eb3ff5ab6e
         arm |                     rfkill-0.5 | TIM | http://autobuild.buildroot.net/results/50a1721c4fed5246f49a87ff669f47725d48b056
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9749f5da1d60b09a0cb7e585157b561d077b2b69
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/7af6575d43c8a2426f4598d1a8af7e9506b53fb1
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/81e467a003d815b3b817176c36cdc41fbe250cb8
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/84fc8e9d2a32e7ceda0b58ac07537ea959844134
     aarch64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/3466ad47bbcc682f41523d09d7413640abd09522
         sh4 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5694df393a9ed4d7ca1b82f5889c75ff3e76d41e
       sparc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2b180c308ee27403070aea84b42c2e9742ceee6e
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/31ae681cbbaebcf3daad783d1392c0c5269a4618
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/a169614ad579115043a40122770459b2d7e322ca
      xtensa |               sdl_mixer-1.2.12 | NOK | http://autobuild.buildroot.net/results/aab49ee01edfa32cdeeafe7860bd3a859a60b104
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/e6866a4a7d7a485d0ec6e88530f27098ef46be69
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/6d49aa8c76d9f19e56fe733b04aeeeebbb7e74bc

-- 
http://autobuild.buildroot.net
