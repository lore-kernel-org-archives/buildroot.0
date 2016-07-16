From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 21:04:36 +0200
Subject: [Buildroot] [PATCH] lighttpd: bump to version 1.4.40
In-Reply-To: <1468695149-3289-1-git-send-email-gustavo@zacarias.com.ar>
References: <1468695149-3289-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160716210436.3f87ba27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 15:52:29 -0300, Gustavo Zacarias wrote:
> Drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/lighttpd/0002-compat-latest-lua.patch | 1398 -------------------------
>  package/lighttpd/lighttpd.hash                |    2 +-
>  package/lighttpd/lighttpd.mk                  |    2 +-
>  3 files changed, 2 insertions(+), 1400 deletions(-)
>  delete mode 100644 package/lighttpd/0002-compat-latest-lua.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
