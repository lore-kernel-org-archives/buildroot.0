From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 09:26:55 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 7.0.12
In-Reply-To: <1476398366-29332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476398366-29332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161014092655.452324f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Oct 2016 19:39:26 -0300, Gustavo Zacarias wrote:
> See http://www.php.net/ChangeLog-7.php#7.0.12 since there are no CVEs
> out yet.
> 
> And drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...pt-enclose-phpdbg_load_module_or_extensio.patch | 47 ----------------------
>  package/php/php.hash                               |  2 +-
>  package/php/php.mk                                 |  2 +-
>  3 files changed, 2 insertions(+), 49 deletions(-)
>  delete mode 100644 package/php/0007-phpdbg_prompt-enclose-phpdbg_load_module_or_extensio.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
