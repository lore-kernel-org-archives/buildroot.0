From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 11:01:26 +0100
Subject: [Buildroot] [PATCH 03/16] packages: convert Github http://
 users to the github helper
In-Reply-To: <1386264059-14057-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386264059-14057-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LUvDzGcvuA=vfwWRgqrZyhCce0Y1TKp3co4mPqmH+C9zQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 5, 2013 at 6:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Mischa Jonker <Mischa.Jonker@synopsys.com>
>
> [Thomas: taken from Mischa original github patch.]
>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/a10disp/a10disp.mk                       | 2 +-
>  package/civetweb/civetweb.mk                     | 2 +-
>  package/cpuload/cpuload.mk                       | 2 +-
>  package/fb-test-app/fb-test-app.mk               | 2 +-
>  package/input-event-daemon/input-event-daemon.mk | 2 +-
>  package/jsmin/jsmin.mk                           | 2 +-
>  package/knock/knock.mk                           | 2 +-
>  package/libcec/libcec.mk                         | 2 +-
>  package/libcofi/libcofi.mk                       | 2 +-
>  package/libiqrf/libiqrf.mk                       | 2 +-
>  package/liblog4c-localtime/liblog4c-localtime.mk | 2 +-
>  package/libsha1/libsha1.mk                       | 2 +-
>  package/libsoc/libsoc.mk                         | 2 +-
>  package/libtpl/libtpl.mk                         | 2 +-
>  package/linenoise/linenoise.mk                   | 2 +-
>  package/lua-ev/lua-ev.mk                         | 2 +-
>  package/luacrypto/luacrypto.mk                   | 2 +-
>  package/luaexpatutils/luaexpatutils.mk           | 2 +-
>  package/luasql/luasql.mk                         | 2 +-
>  package/mongrel2/mongrel2.mk                     | 2 +-
>  package/mtdev2tuio/mtdev2tuio.mk                 | 2 +-
>  package/neardal/neardal.mk                       | 2 +-
>  package/omap-u-boot-utils/omap-u-boot-utils.mk   | 2 +-
>  package/on2-8170-modules/on2-8170-modules.mk     | 2 +-
>  package/python-ipy/python-ipy.mk                 | 2 +-
>  package/qjson/qjson.mk                           | 2 +-
>  package/rpi-firmware/rpi-firmware.mk             | 2 +-
>  package/rpi-userland/rpi-userland.mk             | 2 +-
>  package/socketcand/socketcand.mk                 | 2 +-
>  package/sqlcipher/sqlcipher.mk                   | 2 +-
>  package/sunxi-boards/sunxi-boards.mk             | 2 +-
>  package/sunxi-cedarx/sunxi-cedarx.mk             | 2 +-
>  package/sunxi-mali-prop/sunxi-mali-prop.mk       | 2 +-
>  package/sunxi-mali/sunxi-mali.mk                 | 2 +-
>  package/sunxi-tools/sunxi-tools.mk               | 2 +-
>  package/tinymembench/tinymembench.mk             | 2 +-
>  package/tslib/tslib.mk                           | 2 +-
>  package/xl2tp/xl2tp.mk                           | 2 +-
>  package/yajl/yajl.mk                             | 2 +-
>  39 files changed, 39 insertions(+), 39 deletions(-)
>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[tested by downloading all touched packages in a clean repo]
