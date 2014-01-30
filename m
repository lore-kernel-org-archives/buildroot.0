From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-29
Message-ID: <20140130073009.E68D4100E28@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-29
===============================

        success : 73 
       failures : 61 
       timeouts : 4  
          TOTAL : 138

Classification of failures by reason
====================================

                      axel-2.4 | 11
                  ltrace-0.7.3 | 8 
                   ccid-1.4.14 | 6 
                 libhid-0.2.16 | 3 
                       unknown | 3 
                     vlc-2.1.2 | 3 
                   open2300-12 | 2 
rtmpdump-e0056c51cc1710c9a4... | 2 
                 webkit-1.11.5 | 2 
             alsa-utils-1.0.26 | 2 
          sane-backends-1.0.22 | 1 
                    systemd-44 | 1 
                 qt5base-5.2.0 | 1 
                cegui06-0.6.2b | 1 
                libroxml-2.2.3 | 1 
                    mpd-0.18.7 | 1 
             ctorrent-dnh3.3.2 | 1 
                 libevas-1.7.7 | 1 
             util-linux-2.23.2 | 1 
                     nut-2.6.5 | 1 
                  zeromq-3.2.4 | 1 
         cgilua-5.1.4-1/cgilua | 1 
                   dbus-1.4.26 | 1 
                  thrift-0.9.1 | 1 
                   gvfs-1.16.2 | 1 
          enlightenment-0.17.3 | 1 
            host-libusb-1.0.18 | 1 
                  imlib2-1.4.5 | 1 
              pcsc-lite-1.8.10 | 1 
  toolchain-external-undefined | 1 
                    sdl-1.2.15 | 1 
               alsa-lib-1.0.26 | 1 
                 libnspr-4.9.6 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9dbd467e1e16498fadbd19d26f2bb7f0ebfc0ba6/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/429dbc21d3faca9763a24a9e1264962922fe5c52/
      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/a219a3481e6fa0a3ed9c25a684b6455caee9908d/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/a22992971ad9d68f3517acecab4c6d6c679a4bf4/
       sh4 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/c5215b66db0638811141d929c844ef69de3cd1ae/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/d24e1378b9794df42c8ab48d6a710e1204bcf2cf/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/1320ee97af4481a3d40707384137c318461bc530/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/885dc224a7987825876d4f878fef56470d6818da/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/5de3bdeaf5a4e31193f1caadfa50d7cbccf3e025/
      mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/2f6c48318026c0a3ddff318f0e114c0bcc8ac467/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/fcc1eee31dd6bc3042311a4423c5e73d6e55a3b7/
    x86_64 |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/7db7ec4ccd114feae61f8cd3910877f7c793ac08/
       arm |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/a8b9dcd24e9f953f4da97e3cac152348b3579618/
      mips |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/63cf7bb414486e30d0f5ff12a129ba17bb840b6d/
    xtensa |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/2f57d49ecf2aa5508b6edfa3799d1c479401b000/
microblaze |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/23f079ac030a7c8207a9acb6320516fb9c0ea1df/
      i686 |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/ecaefd141aff874d88bcf17af3b7e6126eb73f19/
       arm |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/c0dd499e64e402335b4f18d9be74c269d8247022/
      sh4a |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/6a49deddc209fcad5e1803e01b78203eb5c3ccf8/
      i686 |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/6e69511d7f534addb3e930b59e4eab74e1437f8f/
      bfin |                 cegui06-0.6.2b | NOK | http://autobuild.buildroot.net/results/61611313f9225b36194022140223c3a326d37f84/
       arm |          cgilua-5.1.4-1/cgilua | TIM | http://autobuild.buildroot.net/results/52c706407c85d004a8f26699e213bc76addeabf9/
       arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/fc40912adcd4b1c8315069f13dd4c3ab4b1da9fa/
       arc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/15023015fe5c5202454aa555a01cad95c4738fab/
   powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/20bcc30ba0b85b197c20deea5f4381e1f356fc79/
   powerpc |                    gvfs-1.16.2 | NOK | http://autobuild.buildroot.net/results/799352becfddcdc6139b3947786cc7909446538a/
   powerpc |             host-libusb-1.0.18 | NOK | http://autobuild.buildroot.net/results/1b86984cc7eed12ef137beebb1b3edab3f100e43/
      bfin |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/b82871911733589f2dbcfa373fcd845fff4bdb07/
       arm |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/bfe584a9464dc6629c3e31e9ac974569b78543d6/
  mips64el |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/6e8dcf6da9ed92ce440d2c433ae55ea8b35a0832/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/8547f25a01d8e902415e7e3def3d37080996dc15/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/97640ba8dc8059d2a9049983d18f7ebde870fb69/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/6dacb2c77ac1d33ffc5e1a6815349c0e1c959d2c/
      bfin |                 libroxml-2.2.3 | NOK | http://autobuild.buildroot.net/results/656140ec0669aaef0865dc7bbc19a4d2c326cc4e/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/8dbff163eb79f15f232f81cb0e9de11d6a1fd2e6/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/b1c17fc7e3621688ba135f10ff82f4109cc07ed6/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/252258d02ce1bfd7d91744fc82dc53e3e671116b/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/2f75e91f6b1aac85d7aa965cbec37a04a8d05c14/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/eb42d4be47022b1b0e02bafd64a4066df83e2a3c/
       arm |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/d69aceaa1d544f8a88ec81fb7ba050e530b02d3f/
   powerpc |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/a422503aecf5d8a5afdc363bd21b7af2b7ed0784/
      i686 |                   ltrace-0.7.3 | NOK | http://autobuild.buildroot.net/results/49b17dbfe8506af6373baca62fa5adaabdefdf24/
       arm |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/a42edb72707a1e6b33583f74e08ee3df96d47091/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/160be95fbc444958ee6d392b41358288c80b79df/
       sh4 |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/33c0704f95a1cff0f843ce71b359acfee1666f5f/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/8b0c09f2181936f4078cfc3d88054830d6eb3ac3/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/0e82ea6054c0805cf86b8a57e9d8f7b14d326d01/
      i686 |                  qt5base-5.2.0 | NOK | http://autobuild.buildroot.net/results/c73c0f993619c51828060862bfc1c136e13ef0e3/
    x86_64 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/d4c3191081fc174ede6ac5ad69fbfa2bccfe29eb/
      i686 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/5e6d8f4eefa17d85c9a7c8747eb9cf65e122b514/
      i686 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/e56bd18fbdeb735802d888c1744f622b88168831/
    x86_64 |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/4abe5873fc0f093c5a84706644bf53a8a144c551/
    mipsel |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/f889dcc2627999ac20a845ae964beac976e02671/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/3a59b2bbee9d459bb2b17700eee694960a29b8c3/
  mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/509a57acf82827e39efc928bcd3b960ff35f8b0b/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/12a490e9f35fdc5dac489dcd016ac2f5a2441475/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/8aac505a85965a14f25b20279edf5d0e134b3eaf/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/190bbdafa6e155e94a0899352a76efed077c67ab/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/bb8a1e9d476c394b614fb47698449331316d478c/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/dd6a840cb58b4320b6541975ed79db6954a46017/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/ad99c3d66e1cc1d7d325603a873bbdc1d2eb01c0/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/3e9ae33b4b51e6361adcf01ef3bf7688f9e71c28/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/2f0b60d0672f4d45eb52f59c6a29339b2c17e544/
   powerpc |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/bd0742b82d2bab6e246ab0396ed5caa02b46c6e4/
    xtensa |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1ab3ecee74720c3aefa2dd236de4738544427367/


-- 
http://autobuild.buildroot.net
