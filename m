From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 08:30:30 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-07-10
Message-ID: <20160711063030.C02D6102DC7@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-07-10
===============================

        success : 187
       failures : 82 
       timeouts : 0  
          TOTAL : 269

Classification of failures by reason
====================================

openblas-f04af36ad0e85b64f1... | 7 
               acpica-20160527 | 5 
              e2fsprogs-1.43.1 | 4 
               libcap-ng-0.7.7 | 3 
                  snmppp-3.3.5 | 3 
                 opencv3-3.1.0 | 3 
             libgpg-error-1.23 | 3 
                    libiio-0.7 | 2 
                   dante-1.4.1 | 2 
               target-finalize | 2 
                  connman-1.32 | 2 
              lirc-tools-0.9.4 | 2 
             bluez_utils-4.101 | 2 
docker-containerd-1b3a81545... | 2 
                  openjpeg-2.1 | 1 
                   fwup-v0.8.0 | 1 
             transmission-2.92 | 1 
               runc-v1.0.0-rc1 | 1 
                  cairo-1.14.6 | 1 
                   systemd-230 | 1 
                  botan-1.10.8 | 1 
                   luvi-v2.7.2 | 1 
              spidev_test-v3.0 | 1 
                      qt-4.8.7 | 1 
               audiofile-0.3.6 | 1 
             shellinabox-v2.19 | 1 
filemq-e59951489045825d6fc5... | 1 
               libdvdnav-5.0.3 | 1 
              libarchive-3.2.1 | 1 
                 log4cpp-1.1.1 | 1 
                   assimp-v3.2 | 1 
                fcgiwrap-1.1.0 | 1 
   webrtc-audio-processing-0.3 | 1 
              alljoyn-16.04.00 | 1 
                 clapack-3.2.1 | 1 
                    exiv2-0.25 | 1 
                  fbterm-1.7.0 | 1 
                    lftp-4.7.2 | 1 
           qt5location-5.6.1-1 | 1 
                  multicat-2.1 | 1 
                openssl-1.0.2h | 1 
                openmpi-1.10.2 | 1 
                acpitool-0.5.1 | 1 
                     fbset-2.1 | 1 
                pinentry-0.9.4 | 1 
                   cmake-3.5.2 | 1 
                    mpv-0.18.0 | 1 
                    pppd-2.4.7 | 1 
          sane-backends-1.0.25 | 1 
                 lvm2-2.02.159 | 1 
                   duma-2.5.15 | 1 
                    owfs-3.1p1 | 1 
                   lite-0.8.10 | 1 
                 mplayer-1.3.0 | 1 

Detail of failures
===================

    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/ab172316e91370de38a7426ba75d310ea77c4829/
microblazeel |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/ebe2bec46e7fd566f95e26dce09a75f5d0451d1b/
    mips64el |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/2ecdf0e87a76781b66098d034768fc8de657faaa/
     sparc64 |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/a86b4b7f3b41d6c8239e95cc117aa46aafa28563/
         arm |                acpica-20160527 | NOK | http://autobuild.buildroot.net/results/d1728c29e90d978405d24bb97f5c8687dc5a6165/
        bfin |                 acpitool-0.5.1 | NOK | http://autobuild.buildroot.net/results/0e164e5a46e3569cc0d9a722be04269d2392b4c1/
     sparc64 |               alljoyn-16.04.00 | NOK | http://autobuild.buildroot.net/results/bf6ff11c0695335e0c00073906e1dadef5d4bf07/
        m68k |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/159499b76c9dc4ea32132e0fc07b16a14c08d8cf/
        bfin |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/3a22eacb70675dd3b5a1d66e230e37d690a3cb0f/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/91930a68dd0421558ea3786d627b6a4b6c0737ca/
microblazeel |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/cc149176d52b2a156bed5db1a934657a8b9a5190/
         arm |                   botan-1.10.8 | NOK | http://autobuild.buildroot.net/results/7f86d267d566d6f0acf7a804ade053964ca3a254/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/9151259882b8cef187ec628878be938676623731/
        m68k |                  clapack-3.2.1 | NOK | http://autobuild.buildroot.net/results/b63899a0139a21421851da7b316d7f8470541c7b/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/e61ecfee1457b162194ee0bfffaf393c53be33d2/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/4e5863bc269249d7e9642e99a6e539e12210c833/
        i586 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/05a0ef1dc20768a4f2415acaab19074b934a31aa/
     sparc64 |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/fb877405f17c1f387fa0f9d65ee1af56671f97ac/
     powerpc |                    dante-1.4.1 | NOK | http://autobuild.buildroot.net/results/b51dad74985a8e4bf709995d4f0d578efd683201/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/041b61a1e028781bf5e90d605d3f0007f3c006bd/
         arm | docker-containerd-1b3a81545... | NOK | http://autobuild.buildroot.net/results/b443b48e2b603308bc9e7a9f9684d81eec20bf40/
         arm |                    duma-2.5.15 | NOK | http://autobuild.buildroot.net/results/f7fc0092ec43a5a4bc38b5e6878842df77f32d3a/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/987efb687870062c509361eaefd0ff80043392f8/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/3f9a6b23abb5b98b8931f7abada0e18d239ac523/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/3b4c92d3b732c97eb425c057ab8eaea209cd4317/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/edf4195d33720d51031a84c3bdb6b6b0ed3b4731/
        bfin |                     exiv2-0.25 | NOK | http://autobuild.buildroot.net/results/fae49dbab1818865d694b413021177df79fba0d4/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/98250c48dac7d6599e85d869ea7aefd7f21ac401/
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/3ee59aafe551391e6a1c52837665d66053181658/
      mipsel |                 fcgiwrap-1.1.0 | NOK | http://autobuild.buildroot.net/results/311b2860e7ea07a79d7dd78d1e43972ffcedc233/
        m68k | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/b47da80d619c18575a7ddfad35e700577d1b7996/
         arc |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d4523181ff2e8ce45fec1372283ea1f6cf5cf4fe/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/1a4b72bc3242fb53b6955fa336d2c1f1bc57e2c3/
         arm |               libarchive-3.2.1 | NOK | http://autobuild.buildroot.net/results/9f96c3d0318d6f91f2a0799493a038ec0d39d17a/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/3d07432556c27d2c5acacab65166cad69589b6ed/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/42a233cadc7cd1029a706e294e4bd21e4419aa63/
         arc |                libcap-ng-0.7.7 | NOK | http://autobuild.buildroot.net/results/07cc5d5978a679b5e88769a8a038c70b291a74aa/
       nios2 |                libdvdnav-5.0.3 | NOK | http://autobuild.buildroot.net/results/490c4417c738ea91c3bfb6bb64d8b4d1ec69076c/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/cf93486667f0794bdce8528d2aa1663151b8be35/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/85183cd844d7063b3d632baccbc11e8f72d65401/
         arm |              libgpg-error-1.23 | NOK | http://autobuild.buildroot.net/results/68f69aa8df58ba25a79bcdc121cbf84564e93008/
     powerpc |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/e30c07922b18d725c5d63b661779e5e17edcf0be/
        m68k |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/4b6194a57b7e54bf9891afea322cad661790cc7b/
      x86_64 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/829a105944d60be4da4288e877ac33bead844fbf/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/4058352d5a6f6055fc0e5f3acc043797943e84dd/
         sh4 |                    lite-0.8.10 | NOK | http://autobuild.buildroot.net/results/470034b60eec57a0113a1092d259fe5cac6df5a2/
        i586 |                  log4cpp-1.1.1 | NOK | http://autobuild.buildroot.net/results/768daeea37b8eb11eb863ff73f57eb6c8c17e5d1/
      mipsel |                    luvi-v2.7.2 | NOK | http://autobuild.buildroot.net/results/42653ddc29b4952b1729768b29154845a1912794/
        i586 |                  lvm2-2.02.159 | NOK | http://autobuild.buildroot.net/results/b73eac0962cb78608a0275b54ed927f67b1ca0d7/
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e14e4449eba84f08dfec97835a9b8f977690ca71/
       sparc |                     mpv-0.18.0 | NOK | http://autobuild.buildroot.net/results/3343cd08779be864506cd0163673195699c62532/
        m68k |                   multicat-2.1 | NOK | http://autobuild.buildroot.net/results/51b979778e942cb66dde5e5f4f4c06dfacd4883a/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/6cc9bd87d14e30c51dbea32cbfc9d8432042e87b/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a4159bac320a311f76471494f43664081767c4aa/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/e78ef84106c5e625a86a2d484bb800b233bedc75/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/f1bb3e72749c4eb5fdc4e54a6a0fb6ce6d6e1a2c/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/7114272a87ccb4cb9b47c86dc584bb807dddb226/
    mips64el | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/4a63f88c589715df9209b7bf1a56e93e6149e8f8/
        mips | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a4c0bb79f5f262c335fad2595e2d41042ed59a3b/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/22356068bf49dd0e5057bdb25c10e2035774bf97/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/61afe7115ddefe211304958b09966bb4d3428187/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/60489ee741009d8a61bdec6ae2135a3bb34e94f6/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/0469fcb6bbb587bb7d1ae30498b8a9ba055d8770/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/90276228520e8973ec9274ab41bc3908f49b3d9d/
        m68k |                 openssl-1.0.2h | NOK | http://autobuild.buildroot.net/results/d73ab5eda643a497ff9c41ef9c7a737d33ec449b/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2285b317d0617bbc85806779e41a3ce18bd1c25a/
     aarch64 |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/7deaf547b78ccfaf83967b0ca66905d4750d5b7d/
        i586 |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/c94cec9469f75082c355c10bc8107c90aa1d2976/
         sh4 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/2cc94d60518bb083b0c63416ee32bfb5dd27a295/
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/01518a2ccbde81e5f0d0c30beea75cf57ee629f0/
     aarch64 |                runc-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/1fd0cf7406fdb2d239bc39421250bf417e3c3fe1/
      mipsel |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/b3f5cdac6fe455ff367762c85d5e8f06ab1d04a7/
      xtensa |              shellinabox-v2.19 | NOK | http://autobuild.buildroot.net/results/8dd6bc4263c3a913e18b3b623a2f0809e9e09b79/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/142bc50c6e17ea3da776ef152d6ce3d6f2eb8866/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/a7a8d72257f5fdbf7cd9ecaf9c35a8eb36403190/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/155352319e61880e50645f344dbf95b8a0294995/
        i586 |               spidev_test-v3.0 | NOK | http://autobuild.buildroot.net/results/188bc5d83961e502843b03e373cc03aebf8e4423/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/60166fef04f0adf4797b59cddeff5b5ee73f5d96/
    mips64el |                target-finalize | NOK | http://autobuild.buildroot.net/results/b43dc7013feddccaff913cb304d3ecb073ef6112/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/7e08d7ac2eb40033fd928d7c30d9660825964fa3/
      xtensa |              transmission-2.92 | NOK | http://autobuild.buildroot.net/results/7f406738f216266e3937aacda09cb8220addba9e/
      x86_64 |    webrtc-audio-processing-0.3 | NOK | http://autobuild.buildroot.net/results/d053e376837175a40c7af490739064bbca960102/


-- 
http://autobuild.buildroot.net
