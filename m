From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 21:27:56 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/zbar: switch to linuxtv zbar
 fork
In-Reply-To: <1547472420-16625-1-git-send-email-james.hilliard1@gmail.com>
References: <1547472420-16625-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20190114212756.2bced55c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Jan 2019 21:27:00 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> The zbar upstream previously used has been abandoned since 2012.
> The linuxtv fork appears to be the most actively maintained fork.
> Removed all patches which are merged upstream or fixed upstream.
> Changed configure flags to match new upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - update to latest upstream
>   - removed all patches

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
