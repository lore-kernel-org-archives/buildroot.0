From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 20:44:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: drop QUOTA_LIBS
In-Reply-To: <20191226150510.3415063-1-fontaine.fabrice@gmail.com>
References: <20191226150510.3415063-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226204426.1717a8ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 16:05:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop QUOTA_LIBS as this variable is always set to $(TARGET_NLS_LIBS)
> since bump to version 4.05 in commit
> 540797f95553b0b5cbdd314e4bb0d3b136935b0a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/quota/quota.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
