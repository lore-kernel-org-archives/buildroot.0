From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:12:45 +0100
Subject: [Buildroot] [PATCH 1/3] Revert "package/coremark-pro: add
 dependency on threads"
In-Reply-To: <20210118203842.657013-1-fontaine.fabrice@gmail.com>
References: <20210118203842.657013-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118221245.56bcceef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 21:38:40 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 6627cea610ee11cbc02649c9b12cbe0b2b8e83b6.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/coremark-pro/Config.in | 5 -----
>  1 file changed, 5 deletions(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
