From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:39:19 +0200
Subject: [Buildroot] [PATCH] mpv: bump to version 0.19.0
In-Reply-To: <1471704131-5919-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471704131-5919-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160820223919.146ed7c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 11:42:11 -0300, Gustavo Zacarias wrote:
> And drop upstreamed patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../mpv/0002-wscript-improve-stdatomic-check.patch | 47 ----------------------
>  package/mpv/mpv.hash                               |  2 +-
>  package/mpv/mpv.mk                                 |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/mpv/0002-wscript-improve-stdatomic-check.patch

I'm glad to see that my efforts to upstream those fixes allow us to
drop patches. That said, the patch did not exist in next, where I
applied your patch, so the final commit is just a regular bump.

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
