From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Feb 2020 14:13:00 +0100
Subject: [Buildroot] [PATCH 0/2] autotools: do not overwrite first
 include path
In-Reply-To: <20200204124013.17340-1-heiko.thiery@gmail.com>
References: <20200204124013.17340-1-heiko.thiery@gmail.com>
Message-ID: <20200204131300.GD3101@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,
On 2020-02-04 13:40 +0100, Heiko Thiery spake thusly:
> The first patch fixes the issue with the autotools package.
> For a detailed explanation take a look into the commit message.
> 
> The second patch removes the hooks that were introduced to workaround
> the issue that is fixed with the first patch.
> 
> Heiko Thiery (1):
>   remove the hook for creating the m4 directory
> 
> Michael Walle (1):
>   autotools: do not overwrite first include path

Series applied to master, thanks! :-)

I just slightly reword the commit logs with a little bit of extra
details.

Regards,
Yann E. MORIN.

>  package/atest/atest.mk                                    | 6 ------
>  package/autoconf/autoconf.mk                              | 6 +++---
>  package/automake/automake.mk                              | 4 +++-
>  package/bayer2rgb-neon/bayer2rgb-neon.mk                  | 6 ------
>  package/bluez-alsa/bluez-alsa.mk                          | 6 ------
>  package/davici/davici.mk                                  | 5 -----
>  package/dropwatch/dropwatch.mk                            | 6 ------
>  package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk      | 7 -------
>  .../gst1-plugins-bayer2rgb-neon.mk                        | 5 -----
>  package/gutenprint/gutenprint.mk                          | 7 -------
>  package/irqbalance/irqbalance.mk                          | 7 -------
>  package/jamvm/jamvm.mk                                    | 7 -------
>  package/janus-gateway/janus-gateway.mk                    | 5 -----
>  package/lcdapi/lcdapi.mk                                  | 6 ------
>  package/libdmtx/libdmtx.mk                                | 7 -------
>  package/libiscsi/libiscsi.mk                              | 6 ------
>  package/libpam-nfc/libpam-nfc.mk                          | 6 ------
>  package/libsoundtouch/libsoundtouch.mk                    | 5 -----
>  package/libva-utils/libva-utils.mk                        | 6 ------
>  package/ltrace/ltrace.mk                                  | 5 -----
>  package/mfoc/mfoc.mk                                      | 6 ------
>  package/minicom/minicom.mk                                | 6 ------
>  package/musl-fts/musl-fts.mk                              | 5 -----
>  package/open-lldp/open-lldp.mk                            | 8 --------
>  package/openpgm/openpgm.mk                                | 8 --------
>  package/pdbg/pdbg.mk                                      | 5 -----
>  package/sdbusplus/sdbusplus.mk                            | 6 ------
>  package/speexdsp/speexdsp.mk                              | 6 ------
>  package/sysprof/sysprof.mk                                | 6 ------
>  package/tesseract-ocr/tesseract-ocr.mk                    | 7 -------
>  30 files changed, 6 insertions(+), 175 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
