From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 25 Nov 2019 12:30:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-11-24
In-Reply-To: <20191125071805.D4F02848A5@fraxinus.osuosl.org>
References: <20191125071805.D4F02848A5@fraxinus.osuosl.org>
Message-ID: <c817e801-64d9-e7c1-b490-3c6a885c6f61@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On 11/25/19 8:17 AM, Thomas Petazzoni wrote:
> Hello,
> 
> Autobuild statistics for 2019-11-24
> ===============================
> 
>        branch |  OK | NOK | TIM | TOT |
>    2019.02.x  | 18  |  4  |  0  | 22  |
>    2019.08.x  | 16  |  0  |  0  | 16  |
>      master   | 111 | 35  |  0  | 146 |
>       next    |  9  |  6  |  0  | 15  |
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                  libdrm-2.4.100 | 4
>                         unknown | 4
>                  libselinux-2.9 | 3
>                   acsccid-1.1.7 | 2
>                     mimic-1.1.0 | 2
> toolchain-external-codesour... | 2
> am33x-cm3-11107db2f1e9e58ee... | 1
>                    gmpc-11.8.16 | 1
>         gst1-plugins-bad-1.16.1 | 1
>            gstreamer1-mm-1.10.0 | 1
>                   haproxy-2.0.5 | 1
>                host-grpc-1.23.0 | 1
>                 host-llvm-9.0.0 | 1
>              host-mfgtools-0.02 | 1
>            imagemagick-7.0.8-59 | 1
>                  libcurl-7.66.0 | 1
>                 libupnpp-0.17.2 | 1
>                   libv4l-1.18.0 | 1
>             libwebsockets-3.2.0 | 1
>              qt5location-5.12.5 | 1
>                  snort-2.9.14.1 | 1
>                spandsp-20180108 | 1
>                      strace-5.3 | 1
>              systemd-legal-info | 1
> 
> 
> Detail of failures
> ------------------
> 
>      arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
> microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/b1251ff4b4a61e3befb5e062ac9e12573e1077ef |
> microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/ca0e7960ae3c8733459fa6025f19a3571cfb5e11 |
>      arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/8d588b59600c7c67834be9993300df5297e1b898 | ORPH
>      mips     |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/b08afd34320765978aec08af4fbd777df06bfa33 | ORPH
>      arc      |    gst1-plugins-bad-1.16.1     | NOK | http://autobuild.buildroot.net/results/e06fbed25fc8369c2ff1f3d89b8800766e365ea3 |
>      mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/285b92f19eb8bccf08909ffb6dcc081bbc6a68a2 |
>      m68k     |         haproxy-2.0.5          | NOK | http://autobuild.buildroot.net/results/e598212a0ffdc7969536fe7942435fedb5302a9b |
>      arc      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/efccec6d6f1d77794e30ce09d9bbd9fc59f2a52b |
>    mips64el   |        host-llvm-9.0.0         | NOK | http://autobuild.buildroot.net/results/58b0c75ac56a3ee08184d0da0b6a7e6efbe08ac3 |
>      arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/2f204bf98a6a0950fb3abab8185bd117df6b4e69 |
>      arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/3ad2b1a90a8d1e90d8a59043e135d752e1875105 | ORPH
>      arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/57566917a509f6678eb54a595749c6afd7d81f4e |
>     x86_64    |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/6865b6bf17fa71efccdc25776ce56eaf4371fdd0 |
>      arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/3042637f54d2d232904ea009455cae82e159ea2e |
>      i586     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/047f149a928ac2a17e25211a0a8a264ebae369ac |
>      arm      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/183793ad1fbdc3e02a9e61a3423b83b5a628e13a |
>      arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/68baafcc6f930680e2fb2c447d61a7109ebbf8f1 |
>      arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/9f63fcbf933a684c8c82a9db631c6686d2f42f3e |
>      arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/7b17d24d0a3055110e75a1ada8b4b29913ae95aa |
>      arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/000f5011358b7af187cca84f0b051fcf4241cd3b |
>     x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/2ae2aa9b65bf5b13784914593d8ca278f64c1bb3 |
>      arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/f55121e2b8e56cab5762075ec977fcfb008fe19f |
>    powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/4ac3ff07e0e21f3bd7af631cd65291284914e9f6 |
>    powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/193bf0bc338e039d95d18343fe9c3f0854b7bbb9 |
> microblazeel |       qt5location-5.12.5       | NOK | http://autobuild.buildroot.net/results/92b22dd14b84abc57bdf5c91b18540d2aa33def2 |

This is fixed by:
https://patchwork.ozlabs.org/patch/1200350/

> Packages having a newer version
> ===============================
> 
>               name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
> -------------------------------+----------+----------------------------------------------+--------------+--------------+-------
>                          libnss |  DISTRO  | https://release-monitoring.org/project/02503 | 3.47         | 3.47.1       |

This is updated by:
https://patchwork.ozlabs.org/patch/1200346/


Best regards
-- 
Giulio Benetti
Benetti Engineering sas
