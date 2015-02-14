From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:46:07 +0100
Subject: [Buildroot] [PATCH 01/35] package/x11r7/xlib_xtrans: bump to
 version 1.3.5, add hash
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150214154607.19ce0c91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  7 Feb 2015 21:11:14 +0100, Bernd Kuhls wrote:
> xserver_xorg-server 1.17.0 depends on it.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_xtrans/xlib_xtrans.hash |    3 +++
>  package/x11r7/xlib_xtrans/xlib_xtrans.mk   |    2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>  create mode 100644 package/x11r7/xlib_xtrans/xlib_xtrans.hash

For such series, it would be great to have a cover letter to which we
could reply. I've applied the whole series. Regarding the various
drivers that don't have a release that is compatible with X.org server
1.17 and for which you had to use git snapshots, I hope they will do
a release at some point.

For the V4L and Geode drivers, did you report the 1.17 compatibility
issue upstream?

I also one question specifically about the X.org server update, I'll
reply to that e-mail specifically.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
