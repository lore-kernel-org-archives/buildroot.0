From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Nov 2020 08:09:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-11-09
Message-ID: <20201110080945.75B8C20014@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-11-09
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  |  3  |  4  |  0  |  7  |
  2020.08.x  | 10  |  0  |  0  | 10  |
    master   | 72  | 18  |  1  | 91  |
     next    | 12  |  9  |  0  | 21  |

Classification of failures by reason for master
-----------------------------------------------

               domoticz-2020.1 | 3 
                coreutils-8.32 | 2 
        host-sentry-cli-1.57.0 | 2 
                       unknown | 2 
              asterisk-16.13.0 | 1 
                        bustle | 1 
          fuse-overlayfs-1.2.0 | 1 
  gobject-introspection-1.64.1 | 1 
      gst1-plugins-base-1.18.1 | 1 
              host-guile-3.0.4 | 1 
                    quazip-1.1 | 1 
                    ruby-2.7.2 | 1 
             stress-ng-0.11.17 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/86d6b141432b84bcc9bbd00070f49fd188e5b831 |     
   mipsel    |             bustle             | TIM | http://autobuild.buildroot.net/results/96b818de53740f3c8223f4066ceef3c317766833 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/125ab26e4789d260922a8a4998ae026a0849c389 | ORPH
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/05bb48cf5b4f76f74b4dd28f7d532b903e8a8a36 | ORPH
   mipsel    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/994c95b2e3635c30e4a575fcf707eaa57b89e198 |     
   xtensa    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/2633e935ec2916c1e80da21948414fae11173f7a |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/97ce4961d67a022866cead8450576c2f1a26df37 |     
  riscv64    |      fuse-overlayfs-1.2.0      | NOK | http://autobuild.buildroot.net/results/369fe3610cc060f1d48391881bb8b01e6e2eb385 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/a14d625231afa0b35578fe22bff71a61828c2549 | ORPH
    sh4      |    gst1-plugins-base-1.18.1    | NOK | http://autobuild.buildroot.net/results/acbb172a323dffbae571d6f1f11cd078077e7868 | ORPH
    mips     |        host-guile-3.0.4        | NOK | http://autobuild.buildroot.net/results/def6d0f5e6548db829df96a9780763c89db67b3f | ORPH
 aarch64_be  |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/f2a758767ab6a66b697757643f352d60a0f275b3 |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/969b2f98f202b63b20cbbffa72e02071e313375f |     
  aarch64    |           quazip-1.1           | NOK | http://autobuild.buildroot.net/results/cd63debe77cccca1a221a09edd42c516a296e90b |     
  mips64el   |           ruby-2.7.2           | NOK | http://autobuild.buildroot.net/results/ade799114a2e5b44d0dc27ee529fbe9ef324a4ad |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/2c77271b33c9d0e9a39cced2eda6d0df0d6b8124 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/56cfdad5e0f8f73bd05e48389399c2fa2483a3bf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/36a29224ac879163998498af156cacb36174a1a4 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/cf6bda9da48e509e0eb8a5c6be0b278a87536923 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  botan-2.11.0 | 1 
               host-go-1.13.15 | 1 
                    php-7.4.12 | 1 
              tinydtls-0.9-rc1 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          botan-2.11.0          | NOK | http://autobuild.buildroot.net/results/3849fd40da7d8daff95c211762c46003fdf3729c | ORPH
  mips64el   |        host-go-1.13.15         | NOK | http://autobuild.buildroot.net/results/8b281094d34d80d70dd35b074c65a92d3bc98bd2 |     
   mipsel    |           php-7.4.12           | NOK | http://autobuild.buildroot.net/results/b1a0ccc07f34a3f9b49af3f49e4753a30e83bdee | ORPH
    arm      |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/20ea9f1a76c34e0816b7b45ba655b59e4786592b |     


Classification of failures by reason for next
---------------------------------------------

                  bind-9.11.24 | 5 
            quickjs-2020-09-06 | 2 
                  boost-1.74.0 | 1 
           python-pybind-2.6.0 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/719c0b78879490e71e18965a2aa3c17690cf5c7d | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/1d76a11c041b8733304401c75e2cdfd15a06f54a | ORPH
   s390x     |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/532e5c45cefa51fcfec48206d8244c8b140e9a76 | ORPH
  riscv64    |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/51baccd79ce4c0707b864dd2279796c683e294eb | ORPH
    arm      |          bind-9.11.24          | NOK | http://autobuild.buildroot.net/results/9187f99f818d108b29603fbce9123f69a65158a2 | ORPH
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/bd0edf1266a0412ee9c41b9909651d69a76101c9 |     
  powerpc    |      python-pybind-2.6.0       | NOK | http://autobuild.buildroot.net/results/df5b60c536dc754f11bca491c64575efcb40c9ba |     
 aarch64_be  |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/81e65ed88c05e0314299ba8c6a11721d0625f9bf |     
    arm      |       quickjs-2020-09-06       | NOK | http://autobuild.buildroot.net/results/452a01ef8d56c3575bc76fc9910eb714364f2ca8 |     


Gitlab CI results for 2020-11-09
================================

Detail of runtime-test failures for master
------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
...lp32dGlibcBleedingEdge |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490395  | ORPH 
     TestFileCapabilities |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489852  | ORPH 
       TestFortifyConserv |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489854  | ORPH 
          TestFortifyNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489855  | ORPH 
              TestGlxinfo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489930  | ORPH 
...nitSystemSystemdRoFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489911  | ORPH 
...ystemSystemdRoIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489912  | ORPH 
...ystemSystemdRoNetworkd |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489914  | ORPH 
...nitSystemSystemdRwFull |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489915  | ORPH 
...ystemSystemdRwIfupdown |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489917  | ORPH 
    TestPythonPy3Crossbar |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490086  | ORPH 
     TestPythonPy3Passlib |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837490110  | ORPH 
                TestRelro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489856  | ORPH 
         TestRelroPartial |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489858  | ORPH 
              TestSspNone |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489859  | ORPH 
            TestSspStrong |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489860  | ORPH 
       TestSysLinuxX86EFI |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489848  | ORPH 
TestSysLinuxX86LegacyBios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/837489849  | ORPH 



-- 
http://autobuild.buildroot.net
