From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:47:51 +0200
Subject: [Buildroot] [PATCH] package: kill pointless text justification
In-Reply-To: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150423094751.0f26d066@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Apr 2015 19:14:34 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/berkeleydb/Config.in                     | 2 +-
>  package/biosdevname/Config.in                    | 2 +-
>  package/bluez5_utils/Config.in                   | 2 +-
>  package/boa/Config.in                            | 2 +-
>  package/busybox/Config.in                        | 2 +-
>  package/coreutils/Config.in                      | 2 +-
>  package/cppunit/Config.in                        | 2 +-
>  package/dcron/Config.in                          | 2 +-
>  package/dialog/Config.in                         | 2 +-
>  package/dnsmasq/Config.in                        | 2 +-
>  package/e2tools/Config.in                        | 2 +-
>  package/ed/Config.in                             | 4 ++--
>  package/fftw/Config.in                           | 2 +-
>  package/findutils/Config.in                      | 2 +-
>  package/flex/Config.in                           | 2 +-
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in | 2 +-
>  package/gawk/Config.in                           | 2 +-
>  package/genext2fs/Config.in                      | 2 +-
>  package/google-breakpad/Config.in                | 2 +-
>  package/gsl/Config.in                            | 2 +-
>  package/gstreamer/gst-ffmpeg/Config.in           | 4 ++--
>  package/gstreamer1/gstreamer1/Config.in          | 2 +-
>  package/gzip/Config.in                           | 2 +-
>  package/iproute2/Config.in                       | 2 +-
>  package/jack2/Config.in                          | 2 +-
>  package/jimtcl/Config.in                         | 2 +-
>  package/joe/Config.in                            | 2 +-
>  package/jsoncpp/Config.in                        | 2 +-
>  package/libassuan/Config.in                      | 2 +-
>  package/libexif/Config.in                        | 2 +-
>  package/libmad/Config.in                         | 2 +-
>  package/libshout/Config.in                       | 2 +-
>  package/ltris/Config.in                          | 2 +-
>  package/lua/Config.in                            | 2 +-
>  package/mesa3d/Config.in                         | 2 +-
>  package/mpd/Config.in                            | 2 +-
>  package/mpg123/Config.in                         | 2 +-
>  package/nginx/Config.in                          | 2 +-
>  package/nodejs/Config.in                         | 4 ++--
>  package/openssh/Config.in                        | 2 +-
>  package/polkit/Config.in                         | 2 +-
>  package/python-cffi/Config.in                    | 2 +-
>  package/python-docopt/Config.in                  | 2 +-
>  package/qlibc/Config.in                          | 2 +-
>  package/read-edid/Config.in                      | 4 ++--
>  package/rp-pppoe/Config.in                       | 4 ++--
>  package/rsh-redone/Config.in                     | 4 ++--
>  package/sispmctl/Config.in                       | 2 +-
>  package/smcroute/Config.in                       | 2 +-
>  package/sqlcipher/Config.in                      | 2 +-
>  package/sudo/Config.in                           | 2 +-
>  package/sunxi-mali/Config.in                     | 2 +-
>  package/szip/Config.in                           | 2 +-
>  package/xenomai/Config.in                        | 2 +-
>  package/zeromq/Config.in                         | 2 +-
>  package/zlib/Config.in                           | 2 +-
>  56 files changed, 62 insertions(+), 62 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
