From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Mar 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-03-24
Message-ID: <20140325073009.F31C410169F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-03-24
===============================

        success : 38 
       failures : 56 
       timeouts : 0  
          TOTAL : 94 

Classification of failures by reason
====================================

libubox-bbd846ec2d72b262975... | 15
                   slang-2.2.4 | 5 
            host-mtools-4.0.18 | 4 
                directfb-1.6.3 | 3 
                    crda-1.1.3 | 2 
              host-scons-2.3.0 | 2 
            lttng-libust-2.4.0 | 2 
make: *** [host-lttng-babel... | 2 
                    mpd-0.18.9 | 1 
                    ofono-1.13 | 1 
                   duma-2.5.15 | 1 
                  pango-1.28.4 | 1 
             lttng-tools-2.4.0 | 1 
                      tmux-1.8 | 1 
                  zeromq-3.2.4 | 1 
        ltp-testsuite-20140115 | 1 
                elfutils-0.155 | 1 
binutils-a934fe50786aa0dc0f... | 1 
                   systemd-210 | 1 
                     wget-1.15 | 1 
                 binutils-2.21 | 1 
                 cairo-1.12.10 | 1 
                  python-2.7.6 | 1 
          libpthread-stubs-0.3 | 1 
                     popt-1.16 | 1 
                coreutils-8.21 | 1 
make: *** [lttng-babeltrace... | 1 
                 libssh2-1.4.3 | 1 
             host-mysql-5.1.73 | 1 

Detail of failures
===================

    x86_64 |                  binutils-2.21 | NOK | http://autobuild.buildroot.net/results/5bf68dfa2dc4d47c5017d2b6e81b55ee193c9a2d/
       arc | binutils-a934fe50786aa0dc0f... | NOK | http://autobuild.buildroot.net/results/c3eed7b1e0fbddca32ec3a6b60c7d3c21b56a4b9/
      bfin |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/50654d44f172f1245dcae6bce545b0eb7e05471d/
   aarch64 |                 coreutils-8.21 | NOK | http://autobuild.buildroot.net/results/80a2974a89c1e6cc8bd1f1ceeec9b9e2c35d029d/
       arm |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/0c817618e6eafd239ee2c4cbdbe528d944190b29/
    mipsel |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/97a0e5c9c79d590b01dcb0af72087b52ff763f05/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5f12eb95cb42300a7b9f806056495729444de253/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/90da8d685bf817e716a708f8695f6399079043ae/
    x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/5c6f62dc293a978ef32df1de7d886d844b334d73/
      bfin |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/f27d35f1796f0185bd672063547d6377a5a5edaf/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/ef2c9c49d74967d589017ef377a2814b71228bcd/
      i686 |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/15dff67f1437dda08677f533931e313178d8095e/
      i686 |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/cf831a22e6ef6e6187182dc2c6549b2a476a77e1/
      i686 |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/7c7d5170f80e6d9491611e9e24fb6a28e3ba8cde/
      i686 |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/8ff7fc94cc3e54f5608f7b4d2e6ccba5fd8e4177/
   powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/7706df60b3107e0e8a7a3712aea0d03f42662827/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/380088d90ad28d9feaa6aa78fd71a2f646999bed/
       arm |               host-scons-2.3.0 | NOK | http://autobuild.buildroot.net/results/5ba33d59af34b6840fbae518344222974cf77c4e/
       arm |           libpthread-stubs-0.3 | NOK | http://autobuild.buildroot.net/results/70d4cc5eb30820dcf51b0db86d1ded9d5aa2656e/
     nios2 |                  libssh2-1.4.3 | NOK | http://autobuild.buildroot.net/results/20779e5f4191f38bce73d6aa76a5772cc5342923/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/017e33a02242d190b60566838016a18310f93899/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/4975230bfc67c326f827239b02a27c4812851529/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/3cd714838684e16395db4779d2f5863726c135f0/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/9c6c10a754ae00c26b1faafcf53befebc8ee3117/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/6f6cc36e8214ea3f1a7aef049dffb3b4c77d7eb9/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/7e2ae1acf4b65bd2f98182e53678f88b9f808729/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/75e9ecd84bc1775094c3858d907c5b1eeeaf7520/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/46fddb445557d4bfc79bb1f73c24e4543e93a88b/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/cd8eb29bc5a93553ab1817e17bbc61ab7aa5d9c9/
       arm | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/a01b289fd4b806fe4f0f4d6096a14d5e283efd3f/
   powerpc | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/eaf17c77d1f67621ad9b38dc6175d56bacf0c4b3/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/ff16f44d304d6124642ad43f0242ad13e8ca0e90/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/5a85e0e132f38a4a1a42c2b041f66003b64e748a/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/391884c6ec9d4c850d2e64e2b7f822b3aed0df10/
      i686 | libubox-bbd846ec2d72b262975... | NOK | http://autobuild.buildroot.net/results/c19d98a924ec959948bcf28a3979e1af3d3830e7/
     nios2 |         ltp-testsuite-20140115 | NOK | http://autobuild.buildroot.net/results/0092a3d4c6b1732d4ec99ee944b41f94e470252e/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/148f259b9b9befb1454475b582dec608bfbc2d8b/
    x86_64 |             lttng-libust-2.4.0 | NOK | http://autobuild.buildroot.net/results/37ff2844c2249f379951c29fc0751d14eb959045/
       arm |              lttng-tools-2.4.0 | NOK | http://autobuild.buildroot.net/results/d96a595d6bb0064724985daa21f3dd819d6920fe/
   powerpc | make: *** [host-lttng-babel... | NOK | http://autobuild.buildroot.net/results/c4890b1e2d4f13ef09c700110bba48ed363ddf81/
      i686 | make: *** [host-lttng-babel... | NOK | http://autobuild.buildroot.net/results/c229130ceab6db9d8b7f373716de9ae4b15f45eb/
   powerpc | make: *** [lttng-babeltrace... | NOK | http://autobuild.buildroot.net/results/edc8f9a2f38259285259f5495b721f7254d62c02/
   powerpc |                     mpd-0.18.9 | NOK | http://autobuild.buildroot.net/results/0a936703db4b4903c304ccf3e4bc62dae6179c47/
    x86_64 |                     ofono-1.13 | NOK | http://autobuild.buildroot.net/results/cdb1bba96c8e10dcb1d1ad7627e94c97f8a2b38f/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/37cb19dc00a8f07bdd304290fea91cf8a829ff65/
      bfin |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/59623f37c423d9b1109deff6a9e0e8427ac83956/
   powerpc |                   python-2.7.6 | NOK | http://autobuild.buildroot.net/results/7f5c15007f28ac8024ec2b5eb271f9b08f58e7c6/
    xtensa |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/7408f81ecfc3db633654505d97db357224097dcc/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/53cdd7e1765c343f5f4f14d26a0e9820afa6e867/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/42495bc7b9e3a4957a6109e998854d7938fc7497/
microblazeel |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/cb0109b7207e18ae7ef65a02a620dcbbf553ab2f/
       arm |                    slang-2.2.4 | NOK | http://autobuild.buildroot.net/results/4db8528b613f546c09578e1662bc9fb8b1dc62f8/
   powerpc |                    systemd-210 | NOK | http://autobuild.buildroot.net/results/4541ee7bb0d8edd4abb82926368664c9e77832b4/
     avr32 |                       tmux-1.8 | NOK | http://autobuild.buildroot.net/results/a4bc423c8c6fef53a35fbab5f8a4732bd5152a57/
    x86_64 |                      wget-1.15 | NOK | http://autobuild.buildroot.net/results/cd4f283f2aa22b56010806f6ea73f1ba03a9a82b/
      bfin |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/1f04eab666501d1ff96556b7dd37cbe4298d9e29/


-- 
http://autobuild.buildroot.net
