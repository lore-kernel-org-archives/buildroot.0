From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 05 Mar 2021 08:13:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-03-04
Message-ID: <20210305081311.42AAB6F583@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-03-04
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  3  |  2  |  0  |  5  |
  2020.11.x  |  7  |  1  |  0  |  8  |
    master   | 74  | 29  |  0  | 103 |
     next    | 20  | 18  |  0  | 38  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
             libstrophe-0.10.1 | 3 
             libopenssl-1.1.1j | 2 
android-tools-4.2.2+git2013... | 1 
               apcupsd-3.14.14 | 1 
                    bird-2.0.7 | 1 
                  boost-1.75.0 | 1 
                clamav-0.103.1 | 1 
                coreutils-8.32 | 1 
            erlang-jiffy-1.0.6 | 1 
             kismet-2020-12-R3 | 1 
                libshout-2.4.5 | 1 
                openblas-0.3.9 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
               protobuf-3.14.0 | 1 
             qt5wayland-5.15.2 | 1 
                  quagga-1.2.4 | 1 
                rocksdb-6.13.3 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/335adf16ec7ed3eb61c9576ef8c5a79026dbcc3f |     
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/a6d34dff70f365fa2b30147c044261882a10b3d9 |     
  nds32le    |           bird-2.0.7           | NOK | http://autobuild.buildroot.net/results/f7755fd218f9df7ae7e5155197f37efc15d7e199 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/02cf4f6b54b1b0a20eed07d0ace2651cd0553773 |     
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/c4bad051a498d7372982fa52c2e749f0d1dccfe0 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/f0be2137cb8a7c79a779b74c51bf372f3f442f0b | ORPH
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/75f6cd08d92bd98ac5f2748f3e941c645c7411c1 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/64b3963feb6e0b3eb10042566bd4256c9a26e3ce |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0869204a8770155a4023035b36789507406be49e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/12a83cbf02f469a4231e56d1e6c076633a999572 |     
   sparc     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/251681f13593d800f3185482d650cc79e0e43bda |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/35892839e50eca074fa95be32c4a654d7df752b3 |     
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f36955709a8cbc0aad525798d5d1a68db5ecd510 |     
    arc      |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/6971e349a6ddcfc3816488c93d6209519cf4fecf | ORPH
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/ef920c5af5aea5b3d32a8150fa3c45a15d61f4fd |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/3fe41562bea5509b8d6d6e347cd218f2f6d17f03 |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/f58e5ba829a03922aa3433fcd39864cc1e3a0a40 | ORPH
  mips64el   |       libstrophe-0.10.1        | NOK | http://autobuild.buildroot.net/results/7695be885268a17704d7f47f571cef1c80bbd208 |     
  mips64el   |       libstrophe-0.10.1        | NOK | http://autobuild.buildroot.net/results/c36a52b76e8a379a2a07a92502442992dbf14b84 |     
  riscv64    |       libstrophe-0.10.1        | NOK | http://autobuild.buildroot.net/results/2f13af96eee20176ccb37ad32ec1472b4c9d6208 |     
 aarch64_be  |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/66661cc64dc13e9484df4b7971ca972f31d424c8 | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/707983c9ecd3b84973fdf7c8ff1eae5e9cda1dc1 | ORPH
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b8bbc0ce6837067749f12655814b2a039e558498 |     
    or1k     |        protobuf-3.14.0         | NOK | http://autobuild.buildroot.net/results/23f6237fe401e284d9b1b7bf17598ac82aab91a7 |     
  aarch64    |       qt5wayland-5.15.2        | NOK | http://autobuild.buildroot.net/results/cc2ffcaf76be808b6305929333cb40cf3ca55c74 |     
    arm      |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/fd5ee2b52a3cfaec268fafd3ffe4c30e51465c7e | ORPH
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/bf26d6c4b1dabfde55c6a8c697384754136ed3f5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/021dd126d50c5f3c10ac7d8e2b4e47b8ab889527 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8299e87c101a0e6091e95480416f210e906170cd |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                 augeas-1.12.0 | 1 
                 qt5svg-5.12.8 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/4eb598af887b482ab21db2dbf5fc70ae9ed56c99 |     
   xtensa    |         qt5svg-5.12.8          | NOK | http://autobuild.buildroot.net/results/cb3128b722d690ad6c7f5668032a2ee40a4ceb31 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

        host-sentry-cli-1.57.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/58969181bb60a409463fd3816337a1442bb55a2c |     


Classification of failures by reason for next
---------------------------------------------

                  perl-gd-2.73 | 3 
                  dhcpcd-9.4.0 | 2 
                  janet-1.15.0 | 2 
             libopenssl-1.1.1i | 2 
                  bustle-0.8.0 | 1 
        host-sentry-cli-1.57.0 | 1 
             libgpg-error-1.41 | 1 
                     mc-4.8.26 | 1 
              netopeer2-1.1.53 | 1 
package/ruby/ruby.mk:88: ru... | 1 
                    qemu-5.2.0 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/9d5daa4923f37084fd93aae62c422b4b99772121 | ORPH
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/6054211b4d4a4865407a98d01814ee8c870cd945 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a182a9ec6274d19fd1005de601a220de1f1b8b68 |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c18005cb9d9b61ceeded203f22859309fedced1a |     
  mips64el   |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/1922ec115b9dc9e879760a6868969d9677093510 |     
    arm      |          janet-1.15.0          | NOK | http://autobuild.buildroot.net/results/fbc159e3b008a6ad351a6ef717139528ab76a404 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/1cdc2fe5b15aaee8f85e7e5248bad35b5d030c9b | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/9678d944265800d63ff907a73e184eadfdebe306 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/dcb646a715b3c6d3495ab920da8c7f00e65dc6b2 |     
 aarch64_be  |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/a1f480fc8b44b0f68f3839edfcdc6daa5da42a91 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/78d383f6b057f059fb415bc8f51c6a373e95e4cb |     
    arm      | package/ruby/ruby.mk:88: ru... | NOK | http://autobuild.buildroot.net/results/7884897db397543d6bcea572e69a29605bf5b75c |     
   mipsel    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0e4f176e31c7d205cdf1b477a40dc5ead0b90325 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/f5279d9d12c0482ea9013b948ba4215551008c5a |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6d19dc9d89ff008c36d48fba6250d93ba55f7393 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/20b92e6c12399532d9c7f5a629dad6eaaa9806dd |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/9386ffbadd357687ea36c92c1e106cb32674aa8b |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7bfad5443fcf670f380924e27ccd1c2dc14227bf |     



-- 
http://autobuild.buildroot.net
