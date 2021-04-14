From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Apr 2021 04:45:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-13
Message-ID: <20210414044603.5F96060D65@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 31  | 11  |  0  | 42  |
    master   | 147 | 64  |  1  | 212 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 19
        host-sentry-cli-1.57.0 | 5 
                       unknown | 5 
                    ffmpeg-4.4 | 3 
                rocksdb-6.13.3 | 3 
              skalibs-2.10.0.2 | 3 
                 freerdp-2.3.1 | 2 
  gobject-introspection-1.64.1 | 2 
                    mpd-0.22.3 | 2 
              netopeer2-1.1.70 | 2 
android-tools-4.2.2+git2013... | 1 
                  boost-1.75.0 | 1 
               domoticz-2020.1 | 1 
            erlang-jiffy-1.0.6 | 1 
      gst1-plugins-base-1.18.4 | 1 
                  mender-2.5.0 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
                 postgis-3.1.1 | 1 
           python-pybind-2.6.1 | 1 
                 python-uvloop | 1 
          qt5webchannel-5.15.2 | 1 
            quickjs-2021-03-27 | 1 
                    ruby-3.0.0 | 1 
                 samba4-4.14.2 | 1 
                suricata-6.0.2 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/6d29c4ca1ead7f728800ab07b7b2823a9baea364 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/6800fe899644edbb7804faa816951f60d354b66b |     
  mips64el   |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/3709e3cd96351ab35d5a8441658faf9bd51cd118 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/6429a5c3e8a240e45af1dcf5277664744b053a4d |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/627b9cbdf1537883f8b0dd690f294712c406f819 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/0eb4955479c7e1f6bfabedd05681945d504bb0cf |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/02c8ac527d5ede242937eca1c6a0b1cc6e1e276b |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/74b3f4b29b8b7d21db55756f62dad9b85f612c00 |     
    arm      |         freerdp-2.3.1          | NOK | http://autobuild.buildroot.net/results/08e7f62a94f52065e9f524784f035baf53d7ff8b |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/cc0b3bfcb2006e69d395fa82803ac3cca8f68b02 | ORPH
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/2091d6da244935a1969d2e958e7458c56675c8dc | ORPH
    sh4      |    gst1-plugins-base-1.18.4    | NOK | http://autobuild.buildroot.net/results/336628e5a14f2412dc25182b971e0601234236dd | ORPH
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b23aaccdae13c1b213dc2abd474d362f52bb7fc7 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/07e3d7b4215dc9a3369b1f98d59b9f78df6d1169 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9aaba8429bd9974695922d355d7ed0534ad70e26 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a96a6993fceed9648a7d3d179e03e0ee8593629b |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9c99c27dd6ec98e97ee4f720d12627046fede1b3 |     
    arm      |          mender-2.5.0          | NOK | http://autobuild.buildroot.net/results/e93dcc548a7843ab1841f9648e72f5d2006a8e40 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/2bf9681ea20700d03b4b7d9bfb141251d19ff408 | ORPH
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4259ed14d23f2a9035b00ed115cbf37df1394b99 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7e6c44397031b00962cd2059420d19a95c414bd2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/44bfca3599140313f30a891933dbad821a87c53f | ORPH
   s390x     |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/34d129b7285f73bf9731c9fce65dac4090deb0e7 |     
  powerpc    |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/bfbac5a8a2c9934c9e1d192ca92f4c5c3c59a057 |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/9f493b911843abcc2df0273d94bd3109a5c03db1 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/f0a18e740221047f6ce26c4d11152afa933de22c |     
    arm      |         postgis-3.1.1          | NOK | http://autobuild.buildroot.net/results/8b95086b5e0876d0a4e41330446e767e4abd3729 |     
   mipsel    |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/a1168e6951864be683ecee0a57dd251fd57e69ab |     
    m68k     |         python-uvloop          | TIM | http://autobuild.buildroot.net/results/e9b84cae994d78e1fae395890a1de6edf503ba8c |     
  powerpc    |      qt5webchannel-5.15.2      | NOK | http://autobuild.buildroot.net/results/a9775de8fa5641718c5299e15c84706ecdad80c1 |     
   nios2     |       quickjs-2021-03-27       | NOK | http://autobuild.buildroot.net/results/3112ac47d9a50627f1e7d9f0c3045254266fb7e2 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/b56f5def8af1464e0649242ba6fd3d97da18642d |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/4a8b43b89b30c60e7a1f6c9faf5510991dc4dc9e |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7737813f0142310e7bc56ede8ac15ebf24183145 |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/dfe078b3e00b2f57bb44ef473b5809c8b843adbf |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/e24cf38869f333edfd9abb4251de396d3a4b3846 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/b1237e5bf9abd18511434a4d0dee333bdc3e2645 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/4a15742bf052dbed13a7a2a24fcd0ac3935cc709 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5c35568931853a3510dfe01f3a89023ca085956e |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/243d366b6e562ba13255035f27c9b634c63300e1 |     
   x86_64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/aedfdaa273dc9cc7f3175bab0e5b262bcba93206 |     
   mipsel    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/cb7a5f23bd5e31d10673938491f09f1ee1e07f8e |     
   x86_64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/911fe6d2ddc740d59a8e5eff96be1f099a21ac70 |     
   mipsel    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/567446be78d614a815ee2096b5673ffa64decc66 |     
powerpc64le  |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/9b175689c8fd26bcac9cee24908ead941324bb41 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/cb516283af9ab2dee612f3a473989e5754a1f9d8 |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/129cf8446e5760167c1b1a38810a570fb97c602b |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/7ceccf570c8309cef6b24d414bce2655a4ded2c4 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5a629730d3fe89c3dd0f2854045f648486b1b153 |     
  aarch64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/020cb5f96e5a053cbd7924486174ef1b3ad23e74 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/592b6e38d1a4fdde7af4e4d809c22026f450fbe4 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0379d00b90cd8092abb67866545369841304f687 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/da1542f86e9627f16e4466bfccffe61242ea9d91 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/0d795ca85651336dc140e32ee27c19267f16582d |     
  powerpc    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/80a1aebc06b0271caf306f748ca6137ef6ba5a78 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/b5384c8ce921e5edfe5868c3f95e5dbfd0360a65 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/e0dc80bbd2fd6c6a9ebbcb8f7f5da926c3ce1d93 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/ea9748a6d0c445049ff0809c706c6384e1afc35b |     
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/1f72302ef17433d3e7827c95bacee80f1640e20e |     
  sparc64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/263842e0278906e3ff2b8dd0c9987e3ef407b6e0 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/76187e040b848204b47d2bc2aceb9f7daab61380 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/f470de80f065d06afad989a899a9268827f4985e |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/e26f688e67d79b5728343d5be2004f14b87c54a7 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/6a1aa251bfe181637d8ec77fc87c5929346f3707 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/706cbf553958c11bfbf549d2f859c35ee43ea27e |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 2 
                  monkey-1.6.9 | 2 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
                 dc3dd-7.2.641 | 1 
                mono-6.12.0.90 | 1 
                 openal-1.20.1 | 1 
                 pixman-0.40.0 | 1 
                rocksdb-6.13.3 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/92157b68fb7bd503caee65eae0d7f91e09cb8015 |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/379d5cd1e48a36193ae2cc3ef986952b2f27ebfd |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d69356b8b9a7de8579cfd1061ecf448bf63ba386 | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4b7a738cef8669641e81e2624fb689558559bc87 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b983610ddaec0a996d52d443b1f4a7f461cf7fc6 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/722c0ff28fc0aab4d3759c6a8177e65bd0cab9a0 | ORPH
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/36a7fc95e8fed4d3ae2fd862e933f5b50551e41f | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/6ec2fbf1444134d5a130bdfbf7a3b2979118335c |     
    or1k     |         openal-1.20.1          | NOK | http://autobuild.buildroot.net/results/550fc995a667c05ba8fcbc065a031d6b8a8a3a74 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b2ac71b535e39e08484c0a751ffe698c719512d8 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/af84009045335aa2e1a943f5efa203df603edef7 |     



-- 
http://autobuild.buildroot.net
