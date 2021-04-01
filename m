From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 01 Apr 2021 09:22:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-31
Message-ID: <20210401092300.6174540F73@smtp4.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-31
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  3  |  0  | 13  |
  2020.11.x  | 11  |  1  |  0  | 12  |
  2021.02.x  | 23  |  6  |  0  | 29  |
    master   | 107 | 32  |  0  | 139 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
package/mender/mender.mk:10... | 3 
                  mender-2.5.0 | 2 
                  monkey-1.6.9 | 2 
                 samba4-4.14.2 | 2 
                 dc3dd-7.2.641 | 1 
                  ffmpeg-4.3.2 | 1 
             host-cairo-1.16.0 | 1 
             kismet-2020-12-R3 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
libplatform-a7cd0d5780ed80a... | 1 
             mender-legal-info | 1 
                 mesa3d-20.3.4 | 1 
                  ndisc6-1.0.4 | 1 
   openvmtools-10.3.5-10430147 | 1 
                 pixman-0.40.0 | 1 
       python-matplotlib-3.0.3 | 1 
                 python3-3.9.2 | 1 
            qpid-proton-0.33.0 | 1 
            qt5location-5.15.2 | 1 
                   wget-1.21.1 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/706eec706f55ad53aea254102f41dcac0e3874da | ORPH
    arm      |          ffmpeg-4.3.2          | NOK | http://autobuild.buildroot.net/results/f13c76a1accfb5d1517bc1411b329285112d9374 |     
   x86_64    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/402b5a39782cc8b3a9c86ecd617c561ae891e8e1 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7ecb6080d3072216c768e2e9065c64acd9eb03b5 |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7211e99b4e34dad72c5e32a181e0f8d40420569b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/296531995ca67f5b63dff613b08b222d72561771 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/2d295a3c7327c4d30bf71e124186dee9f856bf9c |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/13cbc09425d5aff5658385ebed63323fd802081e |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ae2ec292f61cc01021c29df6b76925c275e85e3d |     
  powerpc    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/c79ebae583d9fb094e60895b5a79fd116562ab75 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/aa2733dc947b0a7323adaa2b759c84a099260f0f |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/b4cbd22ef0699481c6dacf0e86120918d9ba92da |     
    arm      |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/d296675608bbfad2cd89fb30723fcbfa7d6b3519 |     
    arm      |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/7209fc8d21de6feb0d4dd423c28d054c2221e2aa |     
    arm      |       mender-legal-info        | NOK | http://autobuild.buildroot.net/results/cd8bde9e9b9b216a19e2d1cb39834174e8c514f0 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/cbdf525d66abe36b9083d84baf7992c7d0990227 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/01fee61fb107bde2b9149483a366c7aa5546f678 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/719bfa722d35384d28904deb64fba093e6c82801 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/3e199f5d7d4067c6e7baf642c0a77ca84757ed94 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/89574fa5ea802d68af9269c97a691d43b5e8cfe4 |     
  aarch64    | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/c1e41f3f4f7c72b89c12aca95a67078d38c40670 |     
  aarch64    | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/42c2987e5cf2bb8918f7fdbd8303951f34b8ead1 |     
   x86_64    | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/0724f0fc3a63ed23bde10605076753af96b85f29 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b1d439e3f6e21ad5b23397a962e220b3fc6d4bf2 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/9255ca0f44f8b1593ddade7abb59e0a5b28b11a2 |     
microblazeel |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/bfbdabc173747e1f440aec64e08a22389d5750db |     
    arm      |       qpid-proton-0.33.0       | NOK | http://autobuild.buildroot.net/results/5cd81def282b8b5aa1fd87e1dab783abebc895f4 |     
    i586     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/f3de89fabbedae5967afe3a027b498dd568e0f61 |     
    arm      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/68295b5086a0e010d29177508a1ab66c7ad5331e |     
powerpc64le  |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/fe39968b644e9f32016997d84e42393ba0e6b24c |     
   x86_64    |          wget-1.21.1           | NOK | http://autobuild.buildroot.net/results/d507f8d8ae4dd6aac1e83b7cc81017caf0d2c30e | ORPH
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/efe060409a491590ae782bfa68114f7c4e957261 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
             libnetconf2-1.1.3 | 1 
              wireshark-3.2.10 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/7b6cca430b244604e8d216d079050e4aea937eff |     
    sh4      |       libnetconf2-1.1.3        | NOK | http://autobuild.buildroot.net/results/f2c5209e10f887c351adaf6f6f31cdf90c6bded3 |     
  powerpc    |        wireshark-3.2.10        | NOK | http://autobuild.buildroot.net/results/bee56ba2d2e9de933ac4f80cdea8c94a960eec9e | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                samba4-4.11.15 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/364c1875f30ee0f8e9b9878cc90485a87c3dd533 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
               capnproto-0.8.0 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/02e5993869c49ee1ee33ba7db66e187ad9ee94c7 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/de57c82d6a5cda7f8f3c642fbc0dc48995b922ee |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/923088fc8c091dfabb346666f0286d601ccf6f5e |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/1838c9203053a9a9b1a1ef5f095b825c2e928fde |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e753b9f840cc6d61d8ce490761f041abe712c4c3 | ORPH
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/e0d27b1092d1993db6fae76deb15a985e14634a8 | ORPH



-- 
http://autobuild.buildroot.net
