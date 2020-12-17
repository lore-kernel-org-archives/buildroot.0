From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Dec 2020 08:15:00 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-16
Message-ID: <20201217081507.1B0712E284@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  0  |  0  | 14  |
  2020.08.x  | 12  |  1  |  0  | 13  |
  2020.11.x  |  8  |  0  |  1  |  9  |
    master   | 74  | 47  |  2  | 123 |

Classification of failures by reason for master
-----------------------------------------------

                  bind-9.11.24 | 20
                   rhash-1.4.0 | 5 
                    mpv-0.32.0 | 3 
                        bustle | 2 
        host-sentry-cli-1.57.0 | 2 
            quickjs-2020-11-08 | 2 
                rocksdb-6.13.3 | 2 
             timescaledb-1.7.4 | 2 
                bitcoin-0.20.1 | 1 
               capnproto-0.8.0 | 1 
              fetchmail-6.4.14 | 1 
                    git-2.29.2 | 1 
      gst1-plugins-base-1.18.2 | 1 
                    htop-3.0.3 | 1 
                 libusb-1.0.24 | 1 
                       unknown | 1 
               wireshark-3.4.0 | 1 
                xenomai-3.0.10 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/dfecac57438b455d526226e4cd4322d2617567b1 | ORPH
   x86_64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c2e4665c58a29b9877ac1dc431188ffc0adac132 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/cef67d0cfed6b818d13ce1ae7114a4af7dad9d70 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/eefe5ef496b2c4e6a0f18dbfdc9f610b3de05247 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c822a5f11b1baf21bbb5991b02bd0706a7fa2604 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b2a216dc08a1cac212272ff5b1104a465d7d3c82 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/68dda237c890c95a4f3831e3723add230cbf3a4e | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e87f725f042bc6b653f36f5d85f2fd71596fc2a0 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/7283865d65c7f07bf7ed2268a0a994496e2be5d0 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/b057474f04254de95d6b4422693f6609d3757458 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/c27cd75044735374aff907f75f09ea81c17bee0b | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/fa3ca50ab5b31065c0944f7fca246c6f8e239da2 | ORPH
  powerpc    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ea1981c11256ea404e1e134f5038c6a6158e2c2c | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/e2d3f672f3ef1bb40bdbb26fc109c56317f5272a | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/10ffe11e2bc46da571149fe6973870dcc08b65a7 | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/88bdcad07050d8de62a2cc46961f026d7775fe5b | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/2f21f0ae36e9df22efbc6c45a9dbf3bc1fd322d6 | ORPH
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/f72abce1e95299b4d220b0782112e07054eece6d | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/3992ce89be030c09e1ea03c3930b553ece77e846 | ORPH
  mips64el   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/4a4d9cf135ab900c0e12a8cefcca3ad0c00a0218 | ORPH
  mips64el   |         bitcoin-0.20.1         | NOK | http://autobuild.buildroot.net/results/4f8591bad821c29fed750aeb43525cf000a3ef31 |     
  riscv64    |             bustle             | TIM | http://autobuild.buildroot.net/results/5cf5b3fc5040e6316872db31a2ac524efa95e8f0 |     
  powerpc    |             bustle             | TIM | http://autobuild.buildroot.net/results/67ca142a1e1c858c3a886ffd0f1deaf95e698878 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/22e8bd5a41eeba8b6da0a00a1fb3fbc7285547b4 |     
  riscv64    |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/e2a7ea9486b7ff937b345ba187a3b010f72c4165 |     
    arm      |           git-2.29.2           | NOK | http://autobuild.buildroot.net/results/4f7bd54a39887f3d05e92de15c44f7ec23879442 |     
    arm      |    gst1-plugins-base-1.18.2    | NOK | http://autobuild.buildroot.net/results/2f008e169d1939e82084245085bfe5737942d62c | ORPH
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/932601665da3d3dcdb784ff07788bf0fd4d53e16 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/12fbe2ee75d5acbd9ceb4ff3a158c586831fdaa4 |     
    arm      |           htop-3.0.3           | NOK | http://autobuild.buildroot.net/results/4076ec7ec3adb8e5758735a50b805e060b632f7b | ORPH
    arm      |         libusb-1.0.24          | NOK | http://autobuild.buildroot.net/results/1af328759b67714fc2621ffb304d5adc932bb52d |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/afa2fcbec9e8359ee924e32bf8918e3fccd80fdd |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/48e194647a6393ea74eca4450a443ef4dc5ca201 |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/0bcf34a71060c2221fe1d559908130b9fb33e596 |     
  nds32le    |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/0342ae3f441f61919e94763a3bff51c9ea6a1a80 |     
    mips     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/6cdf4ae80a03077aaf0b74d9f440ce0e7a455853 |     
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/6f68dcc0024a20346e42d27909e1a4aaf85d93e7 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/59c175ddf5526091a91190a7c51aecbd0649381d | ORPH
  mips64el   |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e254d589fde1ec66d505b4ba7b8c3ec78ab540f2 | ORPH
   mipsel    |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/7a577b7cebd137ad7497e90a484bf82631ca5d79 | ORPH
    arm      |          rhash-1.4.0           | NOK | http://autobuild.buildroot.net/results/e451e369a475a523a123bc6170bd6e8f63a18177 | ORPH
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/328f5cccc823008c79be877820cc9d3de19bfe9f |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b8de1c15dc6934ca8f56b05c38c636064a7f5e20 |     
  riscv64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/8ad8f5301feb2589fcc8a63202e54a6ec5b9d755 |     
  riscv64    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/fc99178a2482693bf50feedde0c10b57990d44e8 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/99f0a01ab718ad29b1818c956bc0782a2ff532ef |     
  powerpc    |        wireshark-3.4.0         | NOK | http://autobuild.buildroot.net/results/dd63b87bfef1baa54673bc3d2d878f7deaa6d8a5 | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/84d2c7834233d5244728ba7889a0147b1387d00c |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/dfa417caf9c4a70060f46911c3a298cbf726f077 |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                rocksdb-6.10.1 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/39fa031e674f3cc1e59946126f8c3d1cff7e68e3 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                        bustle | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |             bustle             | TIM | http://autobuild.buildroot.net/results/310f918b55abfdecb0001d444c23e2afaba52b2c |     



-- 
http://autobuild.buildroot.net
