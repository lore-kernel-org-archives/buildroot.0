From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Jan 2019 21:41:09 +0100
Subject: [Buildroot] [PATCH 1/3] gnuchess: fix license
In-Reply-To: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
References: <20190110175955.31565-1-fontaine.fabrice@gmail.com>
Message-ID: <20190110214110.461a9e12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jan 2019 18:59:53 +0100, Fabrice Fontaine wrote:
> gnuchess is licensed under GPL-3.0+ not GPL-2.0+, also add hash for
> license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuchess/gnuchess.hash | 1 +
>  package/gnuchess/gnuchess.mk   | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Peter: I checked, and the gnuchess version in 2018.02.x is also under
GPL-3.0+, so the patch should be backported to 2018.02.x.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
