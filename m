From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Feb 2017 08:29:13 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-07
Message-ID: <20170208072913.9DC3F20BC1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-07
================================

      successes : 182
       failures : 52 
       timeouts : 1  
          TOTAL : 235

Classification of failures by reason
====================================

                    ruby-2.4.0 | 7 
         libevent-2.1.8-stable | 5 
                  samba4-4.5.5 | 5 
                     wget-1.19 | 5 
               openswan-2.6.46 | 3 
                 sngrep-v1.4.2 | 3 
                 openssh-7.4p1 | 2 
             util-linux-2.29.1 | 2 
                 wavpack-5.1.0 | 2 
                  cppcms-1.0.5 | 1 
                    efl-1.18.4 | 1 
                  guile-2.0.13 | 1 
                       kmod-23 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
                 libraw-0.17.1 | 1 
                 libv4l-1.12.2 | 1 
            lttng-libust-2.9.0 | 1 
             lttng-tools-2.9.3 | 1 
make[2]: *** Waiting for un... | 1 
                    mosh-1.2.6 | 1 
                    mpd-0.20.4 | 1 
                   ortp-0.27.0 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 rings-1.3.0-1 | 1 
                rsyslog-8.22.0 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/f8e2a3ec20956f24f2cc03776b0d7a24e681422f
         arm |                     efl-1.18.4 | NOK | http://autobuild.buildroot.net/results/8d0b78798abf0c4ca124952d0d0455da6f8fa14f
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/cc8b0ad7e416b628cab23578e7de5ef7518c4672
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/40a8c21ea64094ed51942b15ee8db4dae57140b6
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/85ce2ccd65a75b28f77f464795147ae1de008dfe
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/a4e3ce126cb8ddd738182b95f466ddc40fef49a7
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/32c1b1d5955597889ce53593cd908de83f962ce7
     powerpc |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/083be9ba7458d767d317af1d02062f623bc0b8a7
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/85d856c881ccf537959291cbc209947ec433a2e3
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/2967c3f9b00d675cbc5db65d1fc866c754e82390
        m68k |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/aa46e38f6a6a852f9d9277db9517348f9f03572e
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/03a98d9302a0550eb833f98b9700e83e36a4ada8
      x86_64 |                  libv4l-1.12.2 | NOK | http://autobuild.buildroot.net/results/24c0f009996611cf7c09a1c197f82834264e8ddc
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/676210044dbc5cdb402d1e0a6aa65704b62ab2cb
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/7d3552714c077dfb5f7e18933aa9355bcf8b8d14
      mipsel | make[2]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/20299ee4b8b05790f8cf83243b78dfeb3157f3ff
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/7cb0d25ef94b6ee1fa9dbe43a2f05e7b5404201d
       sparc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/552e0c4d6482b60045a91fd398c4ffecd8877cce
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/6bc8580a63da66db477e65238cb3fa0f62cb74c3
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/e3e995b3fffd5434db1169dcfaa93b7d896859c9
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/c2735e739929cc8946305ca302db04a7412e1e4f
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b4849cbfd00230ba162f2dba096a8248723ca6db
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/45b443208a039f4b21e7df5531a5981cf63b7b3c
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/ee35e73e0d7a5cfba5b5cf8ead58c7fad434fa4d
         arc |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/4d79ee32076a4e5dc5d6983275aeebb0b7773632
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/45d8ab9aa3e687afa01d8fbd76ca5d32dd7f5696
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/50410060659f0449c566cbc5107455d8fc0fab1e
         arc |                 rsyslog-8.22.0 | NOK | http://autobuild.buildroot.net/results/8b8c19f5125ff6962c7fb49eed869defe171630b
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/e6179dd8675020a743b7bbb5c5ec5ce435f56cf7
       sparc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a9262cbef5fca4d8d1d6339331422dd1e6543b7b
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/6ec640243c7a4b311ffda653fbecff4b69a472b2
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f49101ae82252b4775f054ee33ce4843357a4afb
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/adc0637c34cf2484c268eae50da6fdfd0fbed05c
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/aaef53ed0ab619d0cde52b828ff844ee9b1d3421
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/505378d90696c93beef717278380799ba47e3475
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/95fc1ca430190d1f2f17a7884e1555311da1871d
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/6b731eff7f2b49c166e9df5e22769e8a9cb8fc94
microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/55b7014fd34954a14773c88fad14dad7022d6d75
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/2b0deb0a305c1ea8cb7101c5f7eafa9c4ecd3ca0
microblazeel |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/36340e6bad5214590694e8503893517fb780144c
microblazeel |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/503e6b1f7f9bb088c70270c7ba7c58ea129c8c75
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8116cb0e40841c2cea3039f81b1b0d10c8e3c72d
     powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/17c782e66eb0a354737445f2e653f6f05f1a9c08
         arc |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/404b10f359b2ae8a7216729fa1bab37fed2d3d4c
         arc |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/2c29a78ed81ca844a87dcd076ab3e14ea080296d
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b0f459aac2d10d4e831347f296c9b374aa5976ea
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/bd73951b46c1961ebe2318ce9f25af5f57ba594d
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/ea1edd97ff9e4f2633057020ea9079b913a59a84
         arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/65818199032a6edad54d53849de6f1027d3a7100
      x86_64 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/848314d64c21746dfe15d19c12a56c946195109e
         arm |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/74614de8033902646a104f7b5c48019f13da6bbb
         sh4 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/b3b02a6746dac30d90a8daecd03963136e6cc3bd
        i686 |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/a97527f3440e97771bddbb75d84d80cac315e62e

-- 
http://autobuild.buildroot.net
