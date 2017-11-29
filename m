From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:04:05 +0100
Subject: [Buildroot] [PATCH 1/3] package/x11r7/xlib_libXcursor: security
 bump to version 1.1.15
In-Reply-To: <20171129204558.3547-1-bernd.kuhls@t-online.de>
References: <20171129204558.3547-1-bernd.kuhls@t-online.de>
Message-ID: <20171129220405.1de3bf31@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 21:45:56 +0100, Bernd Kuhls wrote:
> Fixes CVE-2017-16612:
> https://lists.x.org/archives/xorg-announce/2017-November/002823.html
> 
> Added all hashed provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libXcursor/xlib_libXcursor.hash | 7 +++++--
>  package/x11r7/xlib_libXcursor/xlib_libXcursor.mk   | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)

All three patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
