From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 22:15:19 +0200
Subject: [Buildroot] [PATCH v2 1/1] libesmtp: update/fix site URL
In-Reply-To: <20180925144848.5965-1-m.patzlaff@pilz.de>
References: <20180925144848.5965-1-m.patzlaff@pilz.de>
Message-ID: <20180925221519.348071f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Sep 2018 16:48:48 +0200, Marcel Patzlaff wrote:
> The old URL was not working for quite some time.
> 
> Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
> 
> ---
> Changes v1 -> v2:
>   - also changed URL in Config.in
> ---
>  package/libesmtp/Config.in   | 2 +-
>  package/libesmtp/libesmtp.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
