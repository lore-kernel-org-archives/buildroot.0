From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:54:08 +0100
Subject: [Buildroot] [PATCH] libsecret: bump to version 0.18.3
In-Reply-To: <1450313513-8013-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1450313513-8013-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151217115408.09fe171a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear gustavo.zacarias at free-electrons.com,

On Wed, 16 Dec 2015 21:51:53 -0300, gustavo.zacarias at free-electrons.com
wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Also forcibly disable GIR (default=auto) to avoid issues.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/libsecret/libsecret.hash |  4 ++--
>  package/libsecret/libsecret.mk   | 12 +++++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
