From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:16:42 +0100
Subject: [Buildroot] [PATCH] packages: improve license type lists
In-Reply-To: <1487396332-20370-1-git-send-email-danomimanchego123@gmail.com>
References: <1487396332-20370-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20170220221642.1cf14742@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 00:38:52 -0500, Danomi Manchego wrote:
> Make license type lists more uniform:
> 
> * put content license applies to in parenthesis; ex: "GPLv2+ (programs)"
> * use commas to separate types listed without conjuction; ex: "GPLv2, LGPLv2"
> 
> No attempt was made to validate the claimed licenses.  This is just a tweak
> to increase uniformity of the _LICENSE variables.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/cups/cups.mk                                    | 2 +-
>  package/duma/duma.mk                                    | 2 +-
>  package/e2fsprogs/e2fsprogs.mk                          | 2 +-
>  package/file/file.mk                                    | 2 +-
>  package/git/git.mk                                      | 2 +-
>  package/glmark2/glmark2.mk                              | 2 +-
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
>  package/hplip/hplip.mk                                  | 2 +-
>  package/liblockfile/liblockfile.mk                      | 2 +-
>  package/liburcu/liburcu.mk                              | 2 +-
>  package/lm-sensors/lm-sensors.mk                        | 2 +-
>  package/openssh/openssh.mk                              | 2 +-
>  package/procps-ng/procps-ng.mk                          | 2 +-
>  package/slirp/slirp.mk                                  | 2 +-
>  package/sudo/sudo.mk                                    | 2 +-
>  package/valgrind/valgrind.mk                            | 2 +-
>  package/vlc/vlc.mk                                      | 2 +-
>  package/xenomai/xenomai.mk                              | 2 +-
>  package/xscreensaver/xscreensaver.mk                    | 2 +-
>  19 files changed, 19 insertions(+), 19 deletions(-)

Applied to master after fixing LIBURCU_LICENSE, as I said in my earlier
review.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
