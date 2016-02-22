From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 23:45:14 +0100
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.14
In-Reply-To: <1456141221-582-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456141221-582-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160222234514.4e2d9b45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 22 Feb 2016 08:40:21 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...n-in-fputs-that-fwrite-returning-0-implie.patch | 38 ----------------------
>  package/musl/musl.hash                             |  2 +-
>  package/musl/musl.mk                               |  2 +-
>  3 files changed, 2 insertions(+), 40 deletions(-)
>  delete mode 100644 package/musl/1.1.13/0001-fix-assumption-in-fputs-that-fwrite-returning-0-implie.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
