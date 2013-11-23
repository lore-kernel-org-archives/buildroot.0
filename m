From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Nov 2013 08:30:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-11-22
Message-ID: <20131123073002.EA89E101432@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-11-22
===============================

        success : 68 
       failures : 34 
       timeouts : 0  
          TOTAL : 102

Classification of failures by reason
====================================

              e2fsprogs-1.42.8 | 2 
               libglib2-2.36.3 | 2 
                     gmp-5.1.3 | 2 
                 libnspr-4.9.6 | 2 
                      icu-51.2 | 2 
                  libv4l-0.8.9 | 2 
               alsa-lib-1.0.26 | 2 
ne10-88c18f02199947b2c8b577... | 1 
                      qt-4.8.5 | 1 
                 mplayer-1.1.1 | 1 
           imagemagick-6.8.7-5 | 1 
                     lxc-0.9.0 | 1 
                 schifra-0.0.1 | 1 
libwebsockets-v1.22-chrome2... | 1 
                     rpm-5.2.0 | 1 
                directfb-1.6.3 | 1 
            libvncserver-0.9.9 | 1 
                    systemd-44 | 1 
                     nut-2.6.5 | 1 
              fontconfig-2.6.0 | 1 
                  poco-1.4.6p1 | 1 
                valgrind-3.8.1 | 1 
                openssl-1.0.1e | 1 
                      gpsd-3.9 | 1 
                  udisks-1.0.4 | 1 
           argp-standalone-1.3 | 1 
                libiscsi-1.6.0 | 1 

Detail of failures
===================

      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/65b2966853297b16cdc472149dae6b7ed4603f03/
    mipsel |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/51ad394266c07f386349a5df94df1c1f9fab2722/
    mipsel |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/db81f4cf5424a1c125dd94e7ae1f7baef9d08c30/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2d6573eb6e93e3659422658c247ce64745b51221/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/5fec58000e36062da4a618935c72620a65214ed3/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/2d819fc65a5bfc698be4050203a95f6bb64c4e9c/
      bfin |               fontconfig-2.6.0 | NOK | http://autobuild.buildroot.net/results/41d6cecf13aa23ffa6ef6eac8a8a5d91cb78eaf6/
    mipsel |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/36d354880acd04a3e5e3d366a654d005be92f397/
    mipsel |                      gmp-5.1.3 | NOK | http://autobuild.buildroot.net/results/c8c5f58e8c0b7629599a979ed7777b94f5d28eee/
       arc |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/d3dd298b9ada76e9a2f15fe7803312c57e8efec1/
       arm |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/5ce9baf6085036eed16429a1eead6e723effe23f/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e720e911fc2d989db4799e5cbe6809995dab25b2/
   powerpc |            imagemagick-6.8.7-5 | NOK | http://autobuild.buildroot.net/results/d4665b1e16df8f26b573311cac77d43aca97a315/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/e7439cd27e28129292bfabfdc48b0749d288a777/
      bfin |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/74eb1cec76ee44d3fd1d656183dafa4c35840ae4/
  mips64el |                 libiscsi-1.6.0 | NOK | http://autobuild.buildroot.net/results/d0889cd7b908b5a9c7558a63b0ee0ca079bee29d/
     nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/690d25402b0715bde1edd2feade1a8b9187d3acd/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/14ba6426edbffa100de924aa69157b3f59368ff2/
       arc |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/a177d552d36a8127b90b30086b260ef232ce7c55/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/c31d99de5441133ddcd77a5f0e2350c228cf5b96/
       arm |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/94192fe9e795286afc053c65e3bad2993ba2da26/
      bfin | libwebsockets-v1.22-chrome2... | NOK | http://autobuild.buildroot.net/results/63331f0fe53bc77320d31c3d3921ecc73b2f7a9d/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/942c1dd275ce153b7f94d2359fb0e71a9a0f75dd/
       arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f38611e49ced60519f3c0b1177426f344430ca6e/
       arm | ne10-88c18f02199947b2c8b577... | NOK | http://autobuild.buildroot.net/results/947871ee21f2baa86b9f8809e6e1789b48c55871/
   powerpc |                      nut-2.6.5 | NOK | http://autobuild.buildroot.net/results/b6f619f9c249fc653dc65f0f516cb846683700bb/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/3ab8ad3ea288a3b8f4e3a4ddf60764432880b287/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/c9cca5e31b9eac01ec212dca9d486a6c639aab14/
      mips |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/343579619909559b9b2bc6eafe4fb082a63fa048/
      i686 |                  schifra-0.0.1 | NOK | http://autobuild.buildroot.net/results/424fc76a7e439e274e1cc66b09486fad8da05f8c/
       arm |                     systemd-44 | NOK | http://autobuild.buildroot.net/results/e5484bcdcca7f2cb48913d65271de4b957ea3450/
       arm |                   udisks-1.0.4 | NOK | http://autobuild.buildroot.net/results/ea4627cae45e972ebba5b33a2b2871ce7f46fedc/
       arm |                 valgrind-3.8.1 | NOK | http://autobuild.buildroot.net/results/32dc58dd4219b5b74c7e623d53a1fe8034fdf31b/


-- 
http://autobuild.buildroot.net
