From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Oct 2020 07:11:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-17
Message-ID: <20201018071149.87FFC203A8@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-17
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  6  |  0  | 32  |
  2020.08.x  | 14  |  3  |  0  | 17  |
    master   | 115 | 50  |  0  | 165 |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-16.13.0 | 9 
                  host-frr-7.4 | 8 
package/gstreamer1/gst1-lib... | 3 
               domoticz-2020.1 | 2 
        host-sentry-cli-1.57.0 | 2 
                   libcap-2.43 | 2 
               libupnpp-0.19.4 | 2 
               mpdecimal-2.5.0 | 2 
             transmission-3.00 | 2 
               apcupsd-3.14.14 | 1 
               capnproto-0.8.0 | 1 
          fuse-overlayfs-1.1.2 | 1 
  gobject-introspection-1.64.1 | 1 
                   guile-3.0.4 | 1 
              host-guile-3.0.4 | 1 
              libostree-2020.6 | 1 
               libuhttpd-3.4.0 | 1 
                  luajit-2.1.2 | 1 
                minidlna-1.2.1 | 1 
               mksh-legal-info | 1 
                openblas-0.3.9 | 1 
package/mksh/mksh.mk:34: mk... | 1 
               pulseview-0.4.1 | 1 
        python-m2crypto-0.36.0 | 1 
                samba4-4.11.13 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/fb8f211ba04833642f6eba0a1e48053dbfede8bc |     
    sh4      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/2cfb3f254a844f55801e240168cae2f4dba9dbcc |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/70954e6ff41467ff7a994105051492ada1ebd58f |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/9528dd5a4b946571a8a3b1d79e57d95594450e4b |     
    arm      |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/c33e0bc85f2d6b32c7ce931c5a231a122a85409d |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4948299ed03851667fc540931723e18c4204bc18 |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/b1f2f25edc4b6c33478148543ac9ae6fb4f127f4 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/4e5873f5778a1bad75175081163b68fc348345e2 |     
  riscv64    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/80ff2d486830efcffbad2192feb1734ef75fe5a2 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/7cf296aa4e6f9966b2d525430585d2b0e4bcd31f |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/2573f72d86937c11111a69238459c21025f27d2b |     
   s390x     |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/e4a87aa922da746efbf73eda4ed6fce1727388e5 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/7203a4f54b6117cf052e4bb3d344cebaa21b99fe |     
  riscv64    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/a70083409a42e39b7003a5a1d24d49861f1e93aa |     
    arm      |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/50599a235a4b9dca90258dbdac5e7ce59f1fdf6a |     
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/b86e82c94ae39a24451673751db220009b565d48 | ORPH
  riscv64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b0848dc22a6b39862eb2475595e5d4bde3f14121 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/2aae470757d3b9f9f30a62d5fb979ee5b5ad08bf |     
    arc      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/cec67c65008f813c3a4bf33d576479eda3d621c9 |     
 powerpc64   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7572d528b0f90761e2d26ca25eb6f6bd54fc63cc |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/6b7b9a17e298b89ea0cfdc77a20ee509f70992f3 |     
   s390x     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/b0937414425302ce9a0f9f3dde18b3591752d4c6 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/a5dc5578ecb5790939540e7bb948e1db5166fdc8 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/9a5fa518710aad164b987157bfb78ca5813dbdb6 |     
  aarch64    |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/19c8c24ded58c347c889b7627937c9830c23e1b1 | ORPH
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/86b61d7c0bf50d16973010361d6989079c305880 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ed026c00608ea24e981486884b42d3514593b147 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/33260e56ac72623bb13a40513502efb3890d7622 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/f7f1eb7acc0f74012ec50698fda7494a870c245d |     
  riscv64    |        libostree-2020.6        | NOK | http://autobuild.buildroot.net/results/c51a4230864363a9bbb1f6bcdd3ddbd278c8d26a |     
  riscv64    |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/7a0dd4a7ba8f1eeaf1e15e4b4c73537a86a2d8d5 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/679a28a9a97fafbe1fc2fde7941825518aecc790 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/c8ce1b149cce9dbf560644a287eacc6b348012a2 |     
    i586     |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/0082ff7d55cf332f4d4fb7f1a8765dfc63aa1528 |     
    arm      |         minidlna-1.2.1         | NOK | http://autobuild.buildroot.net/results/79e821f45cad9fc7988d4a7fe9891450ddbe7b70 |     
microblazeel |        mksh-legal-info         | NOK | http://autobuild.buildroot.net/results/1291917e4b17e087455a6698c4b82e4ff783600d |     
    arm      |        mpdecimal-2.5.0         | NOK | http://autobuild.buildroot.net/results/ecf93b7fa0a47c91c67c58358ead5e7c8c6a7433 |     
    arm      |        mpdecimal-2.5.0         | NOK | http://autobuild.buildroot.net/results/3ace76ef89292be273440348c2485d6431d194da |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/33c1864b59918c3ef6dd3e7c9eee540718094b1c | ORPH
  aarch64    | package/gstreamer1/gst1-lib... | NOK | http://autobuild.buildroot.net/results/848d7c49a01f719397cb2e8a8f8e3bd73bd03df4 |     
   x86_64    | package/gstreamer1/gst1-lib... | NOK | http://autobuild.buildroot.net/results/cf6a936a116268e0bd86480213cc865b999c903b |     
  powerpc    | package/gstreamer1/gst1-lib... | NOK | http://autobuild.buildroot.net/results/39383a4e527a68a4f32b4b5698c943fb99163bab |     
 powerpc64   | package/mksh/mksh.mk:34: mk... | NOK | http://autobuild.buildroot.net/results/cf594a7ca2fdc48819b764acf4d8576b4bd5c23a |     
 powerpc64   |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/ab7e5f30646139c94bc44434c4b1654cff1d0a08 |     
   s390x     |     python-m2crypto-0.36.0     | NOK | http://autobuild.buildroot.net/results/1b448f0c8da2fec66f099ee09454604017760c42 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/700e56080f4e5d4d50a48aae12be16231c517ac9 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/2097a270d3699dffabb1dbb644bddd614f8e6cef |     
microblazeel |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/bbfb61cf911fb29dcc02626f6eb47fff9e5e64f5 |     
  powerpc    |       transmission-3.00        | NOK | http://autobuild.buildroot.net/results/d301fc117dc73bd0380a0f11f417b72bfd3c3766 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/f8d19b9a85d776e9e04533a19040a9a9e9e77687 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

gr-osmosdr-46698a67e7e06419... | 2 
              host-grpc-1.25.0 | 1 
             host-pango-1.44.6 | 1 
               libupnpp-0.17.2 | 1 
                qt5base-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/0447e1bd2db360d64fd6689105e63e24609d8677 |     
  mips64el   | gr-osmosdr-46698a67e7e06419... | NOK | http://autobuild.buildroot.net/results/5a867a42aa668b0bff73d5afe992d3e82ee7d07b |     
powerpc64le  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8bd1e2dad67562710e01029df05919350844ffb3 |     
    mips     |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/6295c923ffaa438b52df2ca7227ed05baeb40073 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/84cd3881f5dfdc12201472636ed0e5ea3034c85d |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/158f5a8b7087d15952206c7d4ce918d05d22f5e4 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                rocksdb-6.10.1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/c56194ecfa99637ffb442185bd74f538b07fa7b0 | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/6ae1717227184ad315f26768f0fc44e796f6566d |     
  mips64el   |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/d27af813fd616ed85ab3679acfc2ee155918dc29 |     



-- 
http://autobuild.buildroot.net
