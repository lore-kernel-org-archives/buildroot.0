From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:20:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: backport upstream patch to
 fix compat function for static_assert
In-Reply-To: <20160924185502.16365-1-bernd.kuhls@t-online.de>
References: <20160924185502.16365-1-bernd.kuhls@t-online.de>
Message-ID: <20161016132047.0924765d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Sep 2016 20:55:02 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/3b9/3b9d15f226057706c185270788050dace7b7b535/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/0009-static-assert.patch | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/vlc/0009-static-assert.patch

Thanks, but you got some comments from Johan Oudinet on October 11 on
this patch, saying that it doesn't fix the problem entirely.

Could you take this comment into account and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
