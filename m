From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 21:28:27 +0100
Subject: [Buildroot] [PATCH] polarssl: security bump to version 1.2.13
In-Reply-To: <1424283369-574-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424283369-574-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150219212827.0fb18cef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Feb 2015 15:16:09 -0300, Gustavo Zacarias wrote:
> Includes the previous CVE-2015-1182 fix (patch dropped) and other fixes
> (security and non) from the 1.3 branch (no CVEs yet), see release notes:
> https://polarssl.org/tech-updates/releases/polarssl-1.2.13-released
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/0003-fix-CVE-2015-1182.patch | 19 -------------------
>  package/polarssl/polarssl.hash                |  4 ++--
>  package/polarssl/polarssl.mk                  |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)
>  delete mode 100644 package/polarssl/0003-fix-CVE-2015-1182.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
