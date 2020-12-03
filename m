From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 03 Dec 2020 08:09:21 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-12-02
Message-ID: <20201203080927.8905286E87@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-12-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 25  |  4  |  0  | 29  |
  2020.08.x  | 17  |  0  |  0  | 17  |
    master   | 84  | 19  |  0  | 103 |
     next    | 19  | 18  |  1  | 38  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 3 
                  zeromq-4.3.3 | 2 
              asterisk-16.14.1 | 1 
               belle-sip-4.3.1 | 1 
                  boost-1.74.0 | 1 
                coreutils-8.32 | 1 
               host-flex-2.6.4 | 1 
                host-go-1.15.5 | 1 
             ipsec-tools-0.8.2 | 1 
                    mpv-0.32.0 | 1 
                  ndisc6-1.0.4 | 1 
                pipewire-0.2.7 | 1 
                rocksdb-6.10.1 | 1 
                snort-2.9.16.1 | 1 
      trace-cmd-trace-cmd-v2.7 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/90397984ec9958e04f66425a67e247a604e94a21 |     
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/2c399e6a693910125a4b57b3683854095b19f650 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/38c333c2ac64166129700185de4f46460531281b |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/828b9db4b93873f41abe315211a7ff82f29d52c4 | ORPH
   nios2     |        host-flex-2.6.4         | NOK | http://autobuild.buildroot.net/results/2981f1ee7e4cd7020c6442d52895da440d0337b8 | ORPH
  mips64el   |         host-go-1.15.5         | NOK | http://autobuild.buildroot.net/results/9081875df0c7ffccb7715001105fb5a8f54dc19c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/fc382d8a91908688fa04a2f6cc9c72825546a9d5 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/95121711745032b768ac30cce3e870199084ddb7 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c68117b05a3e6bc8871845599b31a3336639a966 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/6daa88234239205cd4b2f9a6dba9241747946f3b |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/5fdf56accc6d367cb1d92d0c247bde0ef77a60ec |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/088eebb59be589ff7b53631caa8fe4e28eb4d1b2 | ORPH
    arm      |         pipewire-0.2.7         | NOK | http://autobuild.buildroot.net/results/1e870743d158fe23ae6f93b48f71f014afad4e7c |     
 powerpc64   |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/8ac73f73ce9e94070d341b7bc8d3358e166f3b55 |     
    arc      |         snort-2.9.16.1         | NOK | http://autobuild.buildroot.net/results/e060f216d49a21c6d234d80d8a36a52dd20dd0f4 |     
    arm      |    trace-cmd-trace-cmd-v2.7    | NOK | http://autobuild.buildroot.net/results/a648d65ecc1a7ec2344342069b0f0f54d4904e62 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/19ebc082218baf4266420e24a76de62e7a50eaa9 |     
    i686     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/b1c313b8e8a70ef7e5204c8c9d24b681c625518c |     
    arm      |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/6de1aae7d286c4b54852672be8f46c0fd6aa1e54 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 opusfile-0.11 | 1 
               protobuf-3.11.0 | 1 
              tinydtls-0.9-rc1 | 1 
                  zeromq-4.3.3 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         opusfile-0.11          | NOK | http://autobuild.buildroot.net/results/50ffdbba82ce9b98d87c0849832c267563f02cad | ORPH
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/2a8ceded44e596200031e4d60118e7954d568ef0 |     
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/b973617e7837b451d36f28d248c4ff6523a896ee |     
    or1k     |          zeromq-4.3.3          | NOK | http://autobuild.buildroot.net/results/3980c00062bdc3898d7807cf10c63cf64724702a |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 6 
            resiprocate-1.12.0 | 5 
                  boost-1.74.0 | 2 
               belle-sip-4.3.1 | 1 
                        bustle | 1 
                 cdrkit-1.1.11 | 1 
                clamav-0.103.0 | 1 
        host-sentry-cli-1.57.0 | 1 
              libeXosip2-5.1.1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/993137c2c98b94536e648800cc3b516612843086 |     
  aarch64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/999e0fe80f16f6fdd33429cae462737c323ae844 | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9eca3bf79da0f0ece916e4af10b1e6d07233634e | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/d6c74fa043d0b9323e28df4b0c3176c7fb7f7781 | ORPH
    arc      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/ccc30012e634d4d11609fe10b2aed7233a57961a | ORPH
    sh4      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/a3cbac9ae34351b8949af3ab41f24122e5405f2a | ORPH
 powerpc64   |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1d86645205494aa18a03cde63b3030ca4aa4c26b | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/47bb3624740b369a88c1ac9aeee3e391f2e2a292 |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/baaac54c2c93c3fcbb1a21b8e3a95fde559b2f2d |     
  aarch64    |             bustle             | TIM | http://autobuild.buildroot.net/results/2d25d95f6567f0a25abcb3d1380be8516f80f138 |     
    arm      |         cdrkit-1.1.11          | NOK | http://autobuild.buildroot.net/results/423bd92a6ddd484a8885384aa8efcec9a651916a |     
  riscv64    |         clamav-0.103.0         | NOK | http://autobuild.buildroot.net/results/a5946516b674536fc7ed8347e4730f592974731c |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/86938fbd6206fb3f68dbb48cfccc9e173660e54d |     
  aarch64    |        libeXosip2-5.1.1        | NOK | http://autobuild.buildroot.net/results/3702c9cfc796ec550380ba6abe7d346222fbb6b4 |     
   mipsel    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/e6da5874e194ae5935a1568007c8567ed7413850 |     
   s390x     |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/39b43450af585f13b84767b7205c51d2d0e9fd62 |     
   x86_64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/42b6493ca14fe5d3e092b926eaa5c9f9a02f487f |     
 powerpc64   |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/55aa67a48ca9ae6a4392f34e7435e8a144512dfc |     
  aarch64    |       resiprocate-1.12.0       | NOK | http://autobuild.buildroot.net/results/9fc557e0c98ac6d2cf6dad5b6ea67ca0067298e9 |     


Gitlab CI results for 2020-12-02
================================


-- 
http://autobuild.buildroot.net
