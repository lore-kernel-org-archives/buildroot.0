From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Feb 2017 08:29:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-18
Message-ID: <20170219072907.0B12620BA0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-18
================================

      successes : 201
       failures : 35 
       timeouts : 0  
          TOTAL : 236

Classification of failures by reason
====================================

                 sngrep-v1.4.2 | 7 
            lttng-libust-2.9.0 | 4 
                 wavpack-5.1.0 | 3 
               bctoolbox-0.4.0 | 2 
czmq-5205ec201e97c3a652c17e... | 2 
                 enchant-1.6.0 | 2 
                    mpv-0.23.0 | 2 
           oracle-mysql-5.1.73 | 2 
             alljoyn-16.04.00a | 1 
                  cppcms-1.0.5 | 1 
                 glibmm-2.50.0 | 1 
             gstreamer-0.10.36 | 1 
                       kmod-23 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libcec-4.0.2 | 1 
             libsidplay2-2.1.1 | 1 
                    mpd-0.20.4 | 1 
                   ncftp-3.2.6 | 1 
               polarssl-1.2.19 | 1 


Detail of failures
===================

        or1k |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/dfce5f9c7b0b8d1a0630ac6e1251baa1534969f7
        m68k |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/8cb7bf773d387a4a8e996d4f3dcb3bd86bab56af
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/60805d13c4f977be250c2bd4c125381572f946a9
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/63af12aee0671960832299b0f2096aec3e2c9870
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b7979c05cac1568b7ad675d94773c32f43e59eca
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/b0c7a5854a6e54181763d1a58aff3ef82c1bf5b6
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/65a0cadab8e5e7b3a60df2d9af27618cb941484b
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/b21e44f14e59082d4e40ccf9fbff77bbc60dc5f3
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/26db31a7cedd9e49c65362211810693ff8086217
        or1k |              gstreamer-0.10.36 | NOK | http://autobuild.buildroot.net/results/29449b67a865547287170fce20fcec85bc13295c
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/6eec66dbbbc50301a9bdefd68ecb84194de93058
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/23a89d1f5cd0859dede1f84454de9cc777e3428b
        i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/faa5270be0a54043891db9baf50a217eae2c575f
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/858697beaf25c8cdd50606b4fdcf40172ec7e04f
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/1acd3afcfb3f776716bdd152fb95c56852c3a4a1
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/6376d751d2485c0d566f667696f8f122a8af81fe
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8eaa230a97c667befd7649c4721a110af4ff78a0
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/c84a2f03d2fc0dd62a91a323e5f0276eb564e9d3
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/443599864fb887d8180e9e4808c0a92c08dce9fe
         arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/69bb0d3147a439aa326fa53c6d98788e81333aaf
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/3be328a31fc3c5d13dedb36c5d0853c7de97931a
      x86_64 |                    ncftp-3.2.6 | NOK | http://autobuild.buildroot.net/results/33c3f66aa0c58a9ca34aa81a1f547030904a6de7
     aarch64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/e934683ebcb33c9cc8fe9de7b1d5dcd7866f3bce
      x86_64 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a4997cb3bcb0f321e61ee5ade9e7c6fdd4da329e
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/374243b7aaec54306e8a6992de08a49b447e0a3c
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/2067cbdad554ae644516d2835d16bebdf59b6209
    mips64el |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/f127a72043a9b04e54242c52c9bd650a553643fc
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0f02d8472faeedba3eed54bda9efd2a5db6c5baa
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/4581401add3c02fff95768a2520fa3f8b03d69f2
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/ee58cd4252e4da95e9bd025ced9ad3ba0fb7cb08
        m68k |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/0a3f5f94696222f1be61f6a57462b5e206eb224a
        sh4a |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/516e79b85d33ed4b7d6ee6ba137e3270b336ef0f
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/c0607fe3fd12db9838d7ac18a4e7dffa8651a84b
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/e9131a9625bb05d47837eb9eaf939449c6c8533c
         arm |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/1891c0561d85b8e6902b7c84b6322af22e9e4dd2

-- 
http://autobuild.buildroot.net
