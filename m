From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 07:18:34 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-12-23
Message-ID: <20191224071840.3795584ECF@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-12-23
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 21  |  2  |  0  | 23  |
  2019.11.x  | 17  |  3  |  0  | 20  |
    master   | 148 | 81  |  1  | 230 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    libffi-3.3 | 20
                   libnss-3.48 | 8 
                apr-util-1.6.1 | 5 
                   dante-1.4.1 | 5 
               protobuf-3.10.1 | 4 
                tpm2-tss-2.3.2 | 4 
              host-grpc-1.25.0 | 3 
         host-ti-cgt-pru-2.2.1 | 3 
                    mpv-0.29.1 | 2 
                suricata-4.1.5 | 2 
           uboot-tools-2019.10 | 2 
                    xen-4.12.1 | 2 
       alsamixergui-0.9.0rc2-1 | 1 
                  apitrace-9.0 | 1 
                  boost-1.71.0 | 1 
                   dvblast-3.4 | 1 
                haproxy-2.0.10 | 1 
             host-pango-1.44.6 | 1 
            host-systemd-244.1 | 1 
              jpeg-turbo-2.0.3 | 1 
                     lxc-3.2.1 | 1 
make: *** wait: No child pr... | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                  ndisc6-1.0.4 | 1 
                oprofile-1.3.0 | 1 
               pulseview-0.4.1 | 1 
            python-cffi-1.13.1 | 1 
                 samba4-4.11.2 | 1 
                     squid-4.8 | 1 
                     syslog-ng | 1 
                 systemd-244.1 | 1 
toolchain-external-codesour... | 1 
              webkitgtk-2.26.2 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |    alsamixergui-0.9.0rc2-1     | NOK | http://autobuild.buildroot.net/results/4d872c7841aca1a4480fc5a0e39cb939dc184305 | ORPH
    arm      |          apitrace-9.0          | NOK | http://autobuild.buildroot.net/results/64e928324d8484109a3d6151e9ab3a83e9503d34 |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/af34be004163ee6a66b4e781172d276f8b451dd3 |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c38f6e057ac56eebbcdcae06ef9b48bba29e32fa |     
  riscv64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a2b6b8deda1e292826d88d4752c5f7aeba446d7a |     
  mips64el   |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/dc5063d28eb9b08b35a6f81ceb49eb84efa352c3 |     
   x86_64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/0ede7081db0973a47bc849d238191b5a15463b66 |     
    arm      |          boost-1.71.0          | NOK | http://autobuild.buildroot.net/results/a053409872c9101364665d2a92af300203121692 |     
microblazeel |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/d40533c3f9fc250c94320dd1840b310304ac9adf |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/86eb891e7e3e357c3eed319f0d661df9b4acb109 |     
    arc      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/d88ae044c5c139f3d85b52489dd5cd3a635b7c34 |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/ecf93174d137aacc21c1c669cd009242404db15a |     
    arm      |          dante-1.4.1           | NOK | http://autobuild.buildroot.net/results/afa5f12ff1f9b5ccf5dae371d9f8dfad7865e583 |     
    arm      |          dvblast-3.4           | NOK | http://autobuild.buildroot.net/results/4ac60bce2d2036c58a7a1d4a231b9f8f3da6bca1 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/addbfdfe80af6056a4ee38ca73a43ccd4d905616 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e7a38f0aa6e67e838237f1fe73543013674e560e |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/29c4f5fb779362bf7a12c5245fe1a0f5b79d4e6a |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/d9cdcb9b12a2869e1ab333f11949392bb3ec05b7 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/221f00b60438f202a63b9600b377fea1b8430d7e | ORPH
    mips     |       host-systemd-244.1       | NOK | http://autobuild.buildroot.net/results/3c188b91f41578b758b488c5cf3df5681566ea79 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/d91a77c0ab36296c19b66267f5cc4df545966ec0 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/24720bda3efe347d0600bf13da8d6f8d52d33bcf |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/9523ce24f3bbb44c98ed43b9f8a3d77c54d3a3dc |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/0596fbe72fefc2369675c512b69dec394cb53778 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/f915bc95b54fd356241eb0cc362b2c59dc7ca66c |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/523c7db121e08c460a813cccccb1d509783ee892 |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/7bdbba45588e4f2f194313b8a4fb7d43e40b8831 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/12d991117d05c02b26d5f8caa74a28bfcbeb1cdc |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/3ab73995b8393592c0b147670d8ff7f8ebc8c79c |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/42c6192f029b3d6e7c21ed22c16eeb4d322eeb05 |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/99ce3d42a09ae77613cd306c68612f721046a8eb |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/6ced52cafe4140be76ece83558eb6a83c8589d8e |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/2d38ec4b7f9f30345d5169f40dee7cae70b4fe0b |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/fa71558d1955c3a742b99443488302fb2c936b9e |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1a5c459bd90097711264b4beb1e62d75883b67db |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0430b8684c2fdab6392af79db59b31277f5d3ce1 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/0775e4475bb815b8869d2bdba75ba7cc8c7742db |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/13ad78f41534694759913ee59ea9bff25f75c856 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/1e76d234ecaa76dbd9d0e05d84e9ae5e43136c9d |     
  powerpc    |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a4e2c092bf6cfa124421ec5d3a6e280e8eb5833b |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/a1f861e7e615d9243696c54d3558c78967c5572d |     
powerpc64le  |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/eb58bcd37a9fdfa67d7915ff055166bc8b592409 |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/792a27417ab2de26f35cf79e3940f6018f47328b |     
 powerpc64   |           libffi-3.3           | NOK | http://autobuild.buildroot.net/results/689e1a5c9a43d18579952600746fdaa04df82fe5 |     
  powerpc    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/fb823354a715b7cf2780a91531b6bb88c02f471a |     
  mips64el   |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/23b8456a139d4a5b754f84e8c55a2999d6b6ad21 |     
   x86_64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/71134e2852d2b8e8a51aa5f82b9ba2d5636c1f76 |     
    arm      |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/ea431c53531595347b991eadb6dae00cfcd87cf7 |     
 aarch64_be  |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/c0201a9405e37209b085ee36f8313a7f15b652de |     
microblazeel |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/797f07ff757e7972d8c96b6a9f6abe68d17e0808 |     
  riscv64    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/3513db0a76b1998a4f0dbd3d787d410a01c501df |     
  riscv32    |          libnss-3.48           | NOK | http://autobuild.buildroot.net/results/93b9ba1daacb1541808a7a610d6a7ac8dc940e4f |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/f2ef8cd63fca8e443b340f3b13285d76adf9cd76 |     
   nios2     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/2ccfd77cc1e6281c595c97b3c312b32a84d475c4 |     
   nios2     | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/41afa435d15ef26d6d772ab7d19cdcfcced2b349 |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/063cd8e7424f1d414d09faf910700b4eb5d44c8d |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/0fbf6f9e12fc9c2fa34391074cc1795a258fd7d2 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/d6ef99224fe4e4504e441cfd78920ac1c0b711b7 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/3a3e7ee751b007e349860b08935e0bedc0752d46 |     
  mips64el   |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/31df9a86a59cf03d5f96bfe4eb812f48924a8d49 |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/e102cd3ae4c1c216586722f70d5d8de2f819c38a |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/f18c82e4d0c25d3235c13f4e073528c5a6e2983c |     
    or1k     |        protobuf-3.10.1         | NOK | http://autobuild.buildroot.net/results/5a6d14d9bd2a1cf75e335a8306fe8943885b31eb |     
    arm      |        pulseview-0.4.1         | NOK | http://autobuild.buildroot.net/results/a33c46e15b7a8b40757144c5864160b99b4bb9b1 |     
    arc      |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/10b74f6ddf6e0fd9f857c226648f99dccbf5f4a9 |     
    arm      |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/d64c30b4ec9138f5883dc1836069dd1ab47197fe |     
    or1k     |           squid-4.8            | NOK | http://autobuild.buildroot.net/results/13317e7af554f550d406cbf417a78ff859959350 | ORPH
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/79f23ee0abf38b1dcb44ce3fbc7d9fca0c26cb6e |     
    m68k     |         suricata-4.1.5         | NOK | http://autobuild.buildroot.net/results/a70ea262ba74bcbda416d3717108d92150ff56d7 |     
  mips64el   |           syslog-ng            | TIM | http://autobuild.buildroot.net/results/58e5082ef2543cde40ac2c9ab4e7b0438a888696 |     
  mips64el   |         systemd-244.1          | NOK | http://autobuild.buildroot.net/results/d0cb884eef16ad3e91709925794ed13bd1d43621 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/d0680419b0aeabdcf8d8310af45d8fdfc7661128 | ORPH
    arm      |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/6912259eb3fdd13a610d6402aeeeb9b268f8eef6 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/070751080bdeedbc7d67260ea8ad91f97d39a44e |     
  nds32le    |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/e29f2cb9ff309f6aec5a399880762263dea5e583 |     
microblazeel |         tpm2-tss-2.3.2         | NOK | http://autobuild.buildroot.net/results/b3f7d153ed9841af91576f21a367c4a613b0f172 |     
    arm      |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/8b937ab29230cf1105692cfd9047d8de7b6ca3fb |     
  riscv64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/71bdfabf2582150ac48432c7dd682cb67ac9ae15 |     
   x86_64    |        webkitgtk-2.26.2        | NOK | http://autobuild.buildroot.net/results/a068e6faf37f8dd2c06e0855ff3c1025e7f3129b |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/510844c1c069694971147da1616f2ed1a2968f4f |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/f76fff79789eb7d8b652d4c2632ecd801cdecc73 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3d3ac2be1112f8551265007fe50457ad32af9e2b |     




Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
            qt5location-5.11.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          glm-0.9.8.4           | NOK | http://autobuild.buildroot.net/results/604d55718cd4e89d3bfef3217fbd7269f4ac2608 | ORPH
    arm      |       qt5location-5.11.3       | NOK | http://autobuild.buildroot.net/results/bb339a80b74fed170c3f6a30f6a62f7e90ff0249 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   mimic-1.1.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                snort-2.9.14.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/5b6236f683e169fa80cc2a3fd1a62135533a066d |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/e3be129137c79f7bd8510976bf33534428155889 |     
   x86_64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/e945af18e617515ce43770091bbc0c48d658de28 |     



-- 
http://autobuild.buildroot.net
