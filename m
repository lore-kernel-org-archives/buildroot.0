From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:56:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xeyes: Add
 dependency to xlib_libXrender
In-Reply-To: <1429637763-9093-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429637763-9093-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150422225651.19016a06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 21 Apr 2015 19:36:03 +0200, Bernd Kuhls wrote:
> xeyes depends on Xrender since version 1.1.0
> http://lists.freedesktop.org/archives/xorg/2009-December/048305.html
> 
> Fixes
> http://autobuild.buildroot.net/results/bae/baeded072fbec4a398738e00dbf851d756af660f/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_xeyes/Config.in     |    1 +
>  package/x11r7/xapp_xeyes/xapp_xeyes.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
