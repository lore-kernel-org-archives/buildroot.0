From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 08:19:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-16
Message-ID: <20210117082001.07023870EB@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 26  |  0  |  0  | 26  |
  2020.11.x  | 11  |  2  |  0  | 13  |
    master   | 132 | 57  |  1  | 190 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 7 
                    mpd-0.22.3 | 7 
                      ell-0.35 | 6 
             timescaledb-1.7.4 | 3 
                       unknown | 3 
                xenomai-3.0.10 | 3 
               capnproto-0.8.0 | 2 
            erlang-jiffy-1.0.6 | 2 
                mono-6.12.0.90 | 2 
                  ndisc6-1.0.4 | 2 
                    olsr-0.9.8 | 2 
                clamav-0.103.0 | 1 
                coreutils-8.32 | 1 
              fetchmail-6.4.14 | 1 
          fuse-overlayfs-1.2.0 | 1 
glmark2-c493520253fbfe3676c... | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
             host-cairo-1.16.0 | 1 
                     host-mono | 1 
                   httping-2.5 | 1 
             kismet-2020-12-R3 | 1 
              libostree-2020.8 | 1 
                 mesa3d-20.3.3 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                    qemu-5.2.0 | 1 
    trace-cmd-trace-cmd-v2.9.1 | 1 
                 uclibc-1.0.37 | 1 
               wireshark-3.4.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/8078a77204bc12a8c6166bbed44caa2ef6b32b6d |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7e6abd3a0f67009c71f090a1f5bb01426cdc764d |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/c08b40e6ab18a40f4bfa2b4a72aa4e2d58680107 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/c596355ed20ba178506e4205105f3013fce1f14d | ORPH
  riscv64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/b32d00e24cd92e1b69d377be367f78d5e4ea00f6 |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/7fa7da53466ea5a6c8f535db81a11bd2fb0ea3ba |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/05f0e01d6a8c3a0b1bde31d019a5b1df25d1f820 |     
   xtensa    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/4053aa9cff1c3c5f48fab03f5150cc97342e44c6 |     
  powerpc    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/43020b419b15c98742c20fd06370c0f93d28abf5 |     
    sh4      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/bf79dc2370c2be7f841a5ef511a43e6b51ad19bf |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d97159eaba5ca801845933c144df2ce16f32c587 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/21c6ae4d3385fad2dfd243bc24465da20c77dbab |     
    arc      |        fetchmail-6.4.14        | NOK | http://autobuild.buildroot.net/results/241b449f06329f14331be83fefd35615806880cb |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/ba61f2d50538bbc205b3b098fba42f8948e3ebf8 |     
    arm      | glmark2-c493520253fbfe3676c... | NOK | http://autobuild.buildroot.net/results/eeed815f5cf6326a4296c5ca2b2b936262f47b3d |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/70f9f3bd7f0e7f03e772790fdd381372d698c60a | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f4ff13fc71d7cb897870a341e65171b7f47e2c48 | ORPH
    arc      |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/4b55ab982e34ed77685c8a1640e29320c6a41933 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/9b08cf2b22a214def4bf27b9e273527ab484f96e |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9142c30f42c24463aa81f5cced178be8b7faab87 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0f09f9988cccbe999d7471b70f165bccd28c3696 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/4520bac71abc77c3bac8d0ae229bb0aefbb3e346 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/966d1107dddfab4520f89005636b138d3e477521 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f0486ee371ffef6a60488b6f767c9c44f57b7c71 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a205d896547fb5e8665cc04f35b8f2e21cd012d |     
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/27f74a82ffa0b79149a930becc3a1b5fb0eff150 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/893964af3f489a4087a3ba3ee43bf19f5fcbe2d3 |     
  riscv64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/c45ad97f04134f1104120e11261e2a3a68f6629a | ORPH
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/7bbacc83f070e5d192dc83a4511fba278044bafb |     
    i686     |         mesa3d-20.3.3          | NOK | http://autobuild.buildroot.net/results/f71865771482b1d71d12e77767d236ca693785d5 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/9af5e1a18a27f265c6c59ba25cff5e868766b799 |     
    arm      |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/d6963aafdd05f93f3b9b2df7b47abfb4f8fec296 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/78ee79666b9e28267b9214ca8da0d1b9b9ee2989 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/56980e4fbfa58eaddfa1836de84f6cb4d02058dd |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/75492076a9e3753e0e2e9bf6e1e8fa4883802b27 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/e3493d0158aa2e8278d97092db53f15eccf7c039 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d8798fbc8f9ec7f1431abd357a8aa7d5b86f7ff9 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/f9a7cb3f26f8f31d4ba53cc7f668c5be0a8847ea |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/65352cd8a9f5279558cfbda524082cea116c2723 |     
   mipsel    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9dc9b2f625de64155446bf2647593abd7ec2b3df |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/84b678fbeb4fd294a460c6427303e4cfaec779c7 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/bee5a4fbe6cff321a6227200820decf45afa0b17 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/950e305ac79f249f499ac133f10b3b0769d9ad7d | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/fa76f80f7f597baa2d7211a03b204499717a9bc4 | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/3876864a0d0dd5ca1e44a0985725677800ec60f2 | ORPH
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/d75530c133e7ead8309d0b53e9dc1e660683f7c4 |     
   mipsel    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/e87fcc93c1b0c009ecfc9c22247ad5065876c7bc |     
  powerpc    |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/0e94dfebd3c0a83d8deaef72f158e43a13b4c52c |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/4d7cefe4a6f5d04d49142c358bc0054170a58d6b |     
  riscv64    |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/18ba3a28431bdabd558a8acb4c04500065e9f7bb |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/39944cd34ee5b1b6e8d15f67721f9290ee9d7ac2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/5839964fae2ed2bc3fa4c01bb7b3677a61349e0c |     
   mipsel    |            unknown             | NOK | http://autobuild.buildroot.net/results/1b6535089ba6cd79b2aaad6acc9595bc9c084068 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/31337add60cc29bbab9cbbbd38f765bc9f12267a |     
  powerpc    |        wireshark-3.4.2         | NOK | http://autobuild.buildroot.net/results/c21c341b99c9fc4c03984325191395caf10705dc | ORPH
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/d170924385dd536619e0ffc1a5183add40d8f0f9 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/0c485513f5a98032bf92869356271a5243d88a6e |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/92af13b57bee549ec85cc445a26555de4a9b4696 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                samba4-4.11.15 | 1 
                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         samba4-4.11.15         | NOK | http://autobuild.buildroot.net/results/62840950fa5b6bba8edca50f4d56899f3fef44d5 |     
  powerpc    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/700171b83ea2e81696065f45a2664f52ee01c015 |     



-- 
http://autobuild.buildroot.net
