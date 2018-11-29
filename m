From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:58:11 +0100
Subject: [Buildroot] [PATCH/next 1/2] squid: remove gnu atomics handling
In-Reply-To: <20181124145450.5623-1-fontaine.fabrice@gmail.com>
References: <20181124145450.5623-1-fontaine.fabrice@gmail.com>
Message-ID: <20181129225811.4ed3c0cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 15:54:49 +0100, Fabrice Fontaine wrote:
> gnu atomics has been removed since version 3.5.27:
> https://github.com/squid-cache/squid/commit/ddd4edb743d82be97fc651d529e04bf55329a50d
> So remove squid_cv_gnu_atomics handling
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/squid/squid.mk | 9 ---------
>  1 file changed, 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
