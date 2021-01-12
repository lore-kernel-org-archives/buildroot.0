From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Jan 2021 08:36:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-01-11
Message-ID: <20210112083621.81E1D870C0@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-01-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  3  |  0  | 24  |
  2020.11.x  | 19  |  3  |  0  | 22  |
    master   | 121 | 60  |  4  | 185 |

Classification of failures by reason for master
-----------------------------------------------

                      ell-0.35 | 6 
        host-sentry-cli-1.57.0 | 6 
at-7c74fa1aece6bc6db351763d... | 5 
host-c-capnproto-9053ebe6ee... | 5 
                 uclibc-1.0.37 | 4 
                xenomai-3.0.10 | 4 
                     host-mono | 3 
libcamera-e59713c68678f3eb6... | 2 
                      nano-5.4 | 2 
                    olsr-0.9.8 | 2 
                    qemu-5.2.0 | 2 
            quickjs-2020-11-08 | 2 
                rocksdb-6.13.3 | 2 
             timescaledb-1.7.4 | 2 
    trace-cmd-trace-cmd-v2.9.1 | 2 
                       unknown | 2 
                upmpdcli-1.5.5 | 2 
               belle-sip-4.4.8 | 1 
                  bustle-0.8.0 | 1 
               capnproto-0.8.0 | 1 
               collectd-5.12.0 | 1 
         coremark-pro-1.1.2743 | 1 
            erlang-jiffy-1.0.6 | 1 
                    frotz-2.51 | 1 
  gobject-introspection-1.64.1 | 1 
                host-go-1.15.6 | 1 
             kismet-2020-12-R3 | 1 
                       vmtouch | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/68404ba6e6d727e47a543a8b30c68bf1c068c826 |     
   mipsel    | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/fbf3d103aa89339b5ae5e10932ab175385aef0c1 |     
    i586     | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/d430f040a0e99f9e72a98026e98ecd3a1408ce77 |     
    arc      | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/8965441c1c87786ee41a654bf7ab86059903d815 |     
  riscv64    | at-7c74fa1aece6bc6db351763d... | NOK | http://autobuild.buildroot.net/results/62b7facbf6f047b75b30cc5a0593ef6694618856 |     
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/a64ace2f833f61baf264d21001fdcc5e0bc19674 |     
    arc      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/b2f7b1a28c2c8085a0bc16e5015dcf092651e708 | ORPH
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/0715cafb60791ff5ed73ef6d231f31b8500de751 |     
  aarch64    |        collectd-5.12.0         | NOK | http://autobuild.buildroot.net/results/0e45117877ef8d9e08fec668b42658ade449904f |     
    arm      |     coremark-pro-1.1.2743      | NOK | http://autobuild.buildroot.net/results/a2ecc2bf78cbbaa7288458163cbd980962e40245 |     
   x86_64    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/067921c5aa468627245413b2e480a9385b76ba1c |     
    arc      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/738e8eb5ce9d24f31f40f5904f165ecd018f621c |     
   mipsel    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/757b94de0f30a224ae214f97c79cb7e54ff0d095 |     
  powerpc    |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/b6ed4e77d04636e18da21ee98eb26080770b6f10 |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/e59eed089da09277fe1393b3bc589b26c78e51ed |     
    arm      |            ell-0.35            | NOK | http://autobuild.buildroot.net/results/1cea8c8312fde3e0e4ca3da499f203945d1e2372 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/b5a2c493ed68aa1d8c4861b165ce513bfff96f66 |     
    arm      |           frotz-2.51           | NOK | http://autobuild.buildroot.net/results/f78f02a0007d2f096093183f339dcc07feb89517 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f9e8bd0d24657ce0d522ae8aee5983622e1bdd4c | ORPH
   nios2     | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/a56bc6fdb158683f32acc3791d02b4ce4d58dafd |     
  riscv64    | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/b4bb8dbcbfc49805e1c0e15430d42c4984e32ee8 |     
  aarch64    | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/552bdf7fb8cf6de9b4688c104faba47f1a4490f5 |     
   s390x     | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/ae61cab8c36f1e71a30e280eb8de4b8ce8dde920 |     
    arm      | host-c-capnproto-9053ebe6ee... | NOK | http://autobuild.buildroot.net/results/f35f411177e24682ffb23f8078b373cf31330222 |     
  mips64el   |         host-go-1.15.6         | NOK | http://autobuild.buildroot.net/results/fd9ee1a28cb36552d8b923bc601b7eba2f191544 |     
    arm      |           host-mono            | TIM | http://autobuild.buildroot.net/results/9a02e043223e008eb2df5a15bea23bc08ac99d33 |     
  powerpc    |           host-mono            | TIM | http://autobuild.buildroot.net/results/cf69c73f01e869700e0e9f85f8c06bb8218b6606 |     
   x86_64    |           host-mono            | TIM | http://autobuild.buildroot.net/results/e0e102b667aa416a3a0f102cb1ae095fc1c0f267 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9ef976837e5f31497eaeaeabdc4cca25feef9baa |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3fde17e51642cace1a301ecb5ff5b92a66a695ff |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/270fddd5d0fe1b114b9c77c633d7fa0738cee2b2 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58e5c87c6f3451155bbd9ce48e3a2806f5c83190 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/dde6f061735f010daa9bb86fb68a49eaa9c3fc5a |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/18b2028a7cb7896d07feedfd27775ea71b33149a |     
   xtensa    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/d95b529157bc4e32769cc5ef320870e39d070039 | ORPH
   mipsel    | libcamera-e59713c68678f3eb6... | NOK | http://autobuild.buildroot.net/results/6f476a617aa92c0a4b93b90dcb4165433c9ae74f |     
 powerpc64   | libcamera-e59713c68678f3eb6... | NOK | http://autobuild.buildroot.net/results/a57b8c0e4e297fcb212ede797582e37061161248 |     
  aarch64    |            nano-5.4            | NOK | http://autobuild.buildroot.net/results/5320ff8c1dea477832b050f81a42e71e60b7a57d | ORPH
   mipsel    |            nano-5.4            | NOK | http://autobuild.buildroot.net/results/24894e62d6cf89d078959b12e67596c821d64696 | ORPH
   mipsel    |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/b508943507f77ba0c4303b4c18f9bdeb994dd7aa | ORPH
    arm      |           olsr-0.9.8           | NOK | http://autobuild.buildroot.net/results/e2455683018e33995e1646ef6720578919e1dd9d | ORPH
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/36c44e6f7b1f161de1392932f28e9db6774df6e6 |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/6c3f37ba018a61796944713e565dd1032810f044 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/ab1ba40fc2931324c86108bcece5e80ded0ef140 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/448d16a2799d81e7ab08cdad0e63d83d760aea4d |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/31acaea0cb4f28115d63b16054e0d46623383fa3 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/20c3519be4d255ea0382248f7cce40d0adc87932 |     
  mips64el   |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/d8d5aa2862c345aa74adf1d0e1d7950ef2b475ca |     
    arc      |       timescaledb-1.7.4        | NOK | http://autobuild.buildroot.net/results/50c6ff194d4f69c32f7f6ec6f5d43b3975eabe86 |     
    i586     |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/96a2f17aaedf449998f0a8adac6c1fd290d9cf9e |     
    arm      |   trace-cmd-trace-cmd-v2.9.1   | NOK | http://autobuild.buildroot.net/results/aa07d8184948092bbd630054d55bbec26527c23f |     
   xtensa    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/374642b1b1dd614ec3ce1e2ce397af380e0211eb |     
  powerpc    |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/f094aa68743606ba0b0be7411cb7044390bfd80e |     
    arm      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/0845943ebe32cee32ded4b00d1349768e45298e1 |     
    arc      |         uclibc-1.0.37          | NOK | http://autobuild.buildroot.net/results/d9b7127ef4e86068744850bcf22660788b1577de |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/5187f3008b6b2f9797033b96e829833d56503d59 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2f499e5bb14782831e64f6fed7217b79f444fa3f |     
    arm      |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/aa3768338f61226150764937cf432519d766c0e7 |     
    arm      |         upmpdcli-1.5.5         | NOK | http://autobuild.buildroot.net/results/bf36389b8195fe1cf76733b5d54f6655f9737da9 |     
  powerpc    |            vmtouch             | TIM | http://autobuild.buildroot.net/results/848eeba53caf418589a6baa03bb4e4f5e2c0f0fb |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/f17805adf0db208239415a86590c430212721e09 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/2cd955bb0179d8d95ec956e9699b2e8825929276 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/38731d9818a184bfea3c125a454fc2c6d7b02e77 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/67001e040b7376831194832b6ad0cdef115dc094 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

             kismet-2016-07-R1 | 1 
                suricata-4.1.9 | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/34fa163244930f9a56ca396d8c47161a08a47b16 | ORPH
    m68k     |         suricata-4.1.9         | NOK | http://autobuild.buildroot.net/results/7a939fc2231d99fd653c554961fe869428ab4b6f |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/903ece08f4c799f68239422372b05a29428e2c73 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                poppler-0.84.0 | 1 
                 ripgrep-0.8.1 | 1 
                 uclibc-1.0.36 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |         poppler-0.84.0         | NOK | http://autobuild.buildroot.net/results/34c620a0442b5eb18db23bb78d85b645019e4796 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/2f380b262229463b0ceee0df026f05c91fbaebaa |     
  riscv64    |         uclibc-1.0.36          | NOK | http://autobuild.buildroot.net/results/4d7725ee8bffdc3b703429f2b315ef9d0c365457 |     


Gitlab CI results for 2021-01-11
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
           TestATFMarvell |  https://gitlab.com/buildroot.org/buildroot/-/jobs/954398515  | ORPH 
             TestDropbear |  https://gitlab.com/buildroot.org/buildroot/-/jobs/954398574  | ORPH 
     TestGlibcAllTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/954398535  | ORPH 
...DefaultLimitedTimezone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/954398536  | ORPH 
                 TestRust |  https://gitlab.com/buildroot.org/buildroot/-/jobs/954398709  | ORPH 



-- 
http://autobuild.buildroot.net
