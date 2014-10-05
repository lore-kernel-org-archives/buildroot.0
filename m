From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Oct 2014 08:30:14 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-10-04
Message-ID: <20141005063015.846CF101508@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-10-04
===============================

        success : 193
       failures : 97 
       timeouts : 0  
          TOTAL : 290

Classification of failures by reason
====================================

    host-protobuf-c-v1.0.0-rc1 | 21
                   atftp-0.7.1 | 19
                   perl-5.20.1 | 8 
                   dejavu-2.34 | 7 
                  fan-ctrl-1.3 | 6 
         python-protobuf-2.6.0 | 5 
                 opencv-2.4.10 | 4 
               valgrind-3.10.0 | 2 
                 webkit-1.11.5 | 2 
                     tcl-8.6.2 | 2 
                protobuf-2.6.0 | 2 
                  libplist-1.6 | 2 
           heirloom-mailx-12.5 | 1 
                 pixman-0.32.6 | 1 
zlog-ca6162be1608839e99c638... | 1 
               mpdecimal-2.4.0 | 1 
                directfb-1.6.3 | 1 
                  prboom-2.5.0 | 1 
                  python-2.7.8 | 1 
             bluez5_utils-5.21 | 1 
                     radvd-2.7 | 1 
               iptables-1.4.21 | 1 
                   ushare-1.1a | 1 
                      qt-4.8.6 | 1 
                    ruby-2.1.3 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
              librtlsdr-v0.5.3 | 1 
    bandwidthd-v2.0.1-auto-r08 | 1 
                     vlc-2.1.5 | 1 

Detail of failures
===================

     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/ab12f217749fb430ea0937ca7049dff4ddd3800e/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/51fafeb8daf98217fb9b70ab5ca541ef47287c5e/
     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/8da3cd9f23370958a252f60359c460778c4f3c79/
     aarch64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/99df3f92f59459fb3c674c90e5e1e1d8f70bd58e/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/771ff5dd1f86db01173b06d7e8a32457469c1932/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/bb2ade3e5d26a4461959b4a53a808c4764c74a68/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/4210700c22601fe5aa975a9b5b49e5b605597b74/
     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/a1faf94573cf70d9559f9600a897f1473694843f/
     powerpc |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/635fb1bd27aa278d7c5bf288659f2d42362e1643/
        bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/b0f00614e5d87092ae404ccfd92071d1cd7cee26/
         sh4 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/9ad6a8db0de5f024755b9f545f1ab2ef83c920c1/
         arm |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/d093cefb39ad0755f2b4589f7eb5964dc9e9f4e7/
        sh4a |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/ccc0aa2ba4caeb65a352d5ae1d88e046290e5b06/
microblazeel |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/a3d4109bb71113c36875f6355e6bd94814b87934/
        i686 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/f55072d70c961091937f1908b0d1ec119397b57a/
     aarch64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/b9103f8534d3a467a639f14de995606d50dfb0d4/
        bfin |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/6dfa4bf52aac51c4517b1ff9c4d006101744ebfc/
      x86_64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/b72a30cb11e2eb00d454b3565e5ad1406952374b/
     aarch64 |                    atftp-0.7.1 | NOK | http://autobuild.buildroot.net/results/bbb0599bd77cc43906a186ca2f69f82b58edd5a8/
      x86_64 |     bandwidthd-v2.0.1-auto-r08 | NOK | http://autobuild.buildroot.net/results/19d3e80d9878c601b1b74cf0b9644732608bb733/
     powerpc |              bluez5_utils-5.21 | NOK | http://autobuild.buildroot.net/results/70faffca7772f944e7acb89f2241adda32059d1a/
        bfin |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/43ca94d46e62e1293664974cfa92327665da9279/
        mips |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/d77da772bf978ffadeb508b0432a8694367d9df1/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/5a55b3205c2eefe6445388d4b2366d74ca688cc5/
      x86_64 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/7e80ec8bdfa17008b045efb23382bb8aae9ef86e/
     aarch64 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/6d76ec98439cf19e2625e4051c0953648fba779b/
     powerpc |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/6f94fc01df13eef52cb5698d72367334c73089ed/
        i686 |                    dejavu-2.34 | NOK | http://autobuild.buildroot.net/results/ba103841b025c05f2b467e21510a64be019fa326/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/7d89c86eeab6ff7784f5fad0730412f1ef246a23/
      xtensa |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/318a4f31d99ceee24487d462cec74af78a3d5519/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/ab9855769c4c5441fb37046bc1ea707bb434e463/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/e63a906c069e35ad93ddf54f7f036ec000ac7078/
     powerpc |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/66e4744f0a1eb68128539d220ce6d995992b68b3/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/580f41285f3023685bb9456662d0f010415c16bb/
         arm |                   fan-ctrl-1.3 | NOK | http://autobuild.buildroot.net/results/9e8b10dfb686ed3917d6c17f4178f856fa4be266/
         arm |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/1477aec2eaf43d5281ae8049b9a6b846eab8b27b/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/5cf31654277dcde0686d70019236f863199b5417/
      mipsel |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/e863fd1966d09f537f6487ba907531066dc70e9f/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/1b5b47404edfad45f5e6bfc16204e2bda4bc1ca2/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/4674cd30ff51d521afdc96469a2cc2e40d5af344/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/38e35acc51dc948c2f24cb19ee71b650563137a4/
        i686 |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/165ba480faf38d817973cb7655f1e8c7810484f7/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/0c0bb5bc5dc2ac046dfd5e0716ca72e29214d987/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/9de487e8eccdb8afe785aadcbd0343ef8bc8bde5/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/90cf0cf0241a613cdee4730d2684e662b56f9799/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/69cdb2fbf541f24ca87912d28cc783146d599a81/
        bfin |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/8361b1cc4ff6657da19aab9d621630ac78f5d3fd/
     powerpc |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/fc7b9a704353e50ae70cd33ab0341da5e9cba0a2/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/70f0502fa0b9061d81cd3e4f1aeb68eda8d53889/
        sh4a |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/64707ecd9acfbf519d5f22dd6bd5b39c3b544073/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/39fd17a72f4fb0fc8a9a1b95e013fc3cee64a92d/
      mipsel |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/f42c911ded85f999ea6878244646119d996ebed0/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/87967998b2f6bcf68df564c766678bc1ff111e97/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/b3d9c45bc9b4fbbbb5d878ca9bc6680255056bef/
    mips64el |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/db14e29b9896b4b20e38ab4a2984d727500bae92/
      mipsel |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/de4cc3ac1bcae7ce90f0e7b8e395129c8da5388f/
         arm |     host-protobuf-c-v1.0.0-rc1 | NOK | http://autobuild.buildroot.net/results/1126892346fd899ef066ea3187cb1f84159b0d68/
        bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/1c758aeeb72b166a56b7549ccab4abaa23fbbd71/
      x86_64 |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/efba806b9a40a5e9c6bca7e591747ca2102fa1d5/
      xtensa |                   libplist-1.6 | NOK | http://autobuild.buildroot.net/results/3c75176a07634577b5a93a7fae035f057ff794a8/
         arm |               librtlsdr-v0.5.3 | NOK | http://autobuild.buildroot.net/results/9d6a28f5735574d0ccfe843a76a7cb470d0cfe6b/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/797ba8933a5eb3f9ca0c66b4b5533813d467b4c2/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/bdc554128f241b379f8c55c842fb371d1007ceb4/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/feba0e0deb55d2ea44837a3b1edeb31159a99850/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/54543ff32c8f40c4d75630694ca0f3c5e5c5f680/
        i686 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/bac046429e38d0809c41d34afed034700dd7d5d9/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/0e2ff1df2711950a89f252472d9a66aa970b5deb/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/fa9e6f7edadf44132b70e572e876edf12f89c794/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/8ade6c432ffa725a324f9e7cfb18f6453687b129/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/64c32a9d805d227e0d0d97f4e89747c8f6f6260c/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/e0015556b82554256b90efdd0478f999c7f0cfb7/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/dd32d9aeb306449be0faeb64b5b578cf94dffddd/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/bca019386595c72f77d5d73b81aa4be8578310e8/
     powerpc |                    perl-5.20.1 | NOK | http://autobuild.buildroot.net/results/5da447c62f06c2f885a2817f53f43a518e569120/
       nios2 |                  pixman-0.32.6 | NOK | http://autobuild.buildroot.net/results/51b375a19924d5e5a67253333517c234aaf168e7/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/c44000e78c62548e1c22efb00d22ae2049cc6ed4/
     powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/3c1c620684a23b4cbb1cfa560096094cd9bf09ec/
     powerpc |                 protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/f1b70ebabd587987547424a21eefc530317026cd/
         arm |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/073a15e24f633349de3fdea6e5a3281a48af3db5/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/8e67369a8de53488356dbd96bff1b21b2dd69eaa/
      mipsel |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/b3b36c72b233a624ebae9eaac592b7c6fbd394be/
         arm |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/332341e744408e26ace8e1ac65f83d56839c5afc/
        i686 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/5200c5227ff20ec452477c923896a5f7572e8b66/
      x86_64 |          python-protobuf-2.6.0 | NOK | http://autobuild.buildroot.net/results/68b6ddfdec45a5838b5f6129c025a42e7a8103c8/
       nios2 |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/858e933dcb43ad542d5e9925640d90813b9501c2/
         arc |                      radvd-2.7 | NOK | http://autobuild.buildroot.net/results/0de78b65ff830b55733181e6cd6f7c194e183e89/
      mipsel |                     ruby-2.1.3 | NOK | http://autobuild.buildroot.net/results/e51aac4869913fdd7d1b9145a300e8cbc922a87c/
        i686 |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/8cce3e885f7ce160b9f7f96d4092df874dfb30f9/
         arm |                      tcl-8.6.2 | NOK | http://autobuild.buildroot.net/results/43fface3b02a972944aa02d1ac371d3dc8ff2c7a/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/87b95db9813209f660af6027aec928c794666ae8/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/a8f51f16ec8a3b95795e4cf0eadbb869d2b64c48/
     powerpc |                valgrind-3.10.0 | NOK | http://autobuild.buildroot.net/results/c86d039679859f4ff4cf2d87488f2abb7a332d64/
         arm |                      vlc-2.1.5 | NOK | http://autobuild.buildroot.net/results/6b81e488f8d6c94b0383089dce5a6d99851d9827/
      x86_64 |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/212f84bf73e445cb15955c9cf29d0f740b20f2f0/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/77882a2b99ae6579e6c3189338df1013776793cf/
       nios2 | zlog-ca6162be1608839e99c638... | NOK | http://autobuild.buildroot.net/results/1e11963f3b822785ae6183ccb296279561b34a21/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/37e65aac034727cf9dee75c3c3f0d8d0f8f2284e/


-- 
http://autobuild.buildroot.net
