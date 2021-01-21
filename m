From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:04:24 +0100
Subject: [Buildroot] [PATCH 01/15] package/iwd: add IWD_CPE_ID_VENDOR
 and IWD_CPE_ID_NAME
In-Reply-To: <20210121133639.7332-1-heiko.thiery@gmail.com>
References: <20210121133639.7332-1-heiko.thiery@gmail.com>
Message-ID: <20210121220424.3d8157b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Jan 2021 14:36:25 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> cpe:2.3:a:intel:inet_wireless_daemon is a valid CPE identifier for this package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=iwd
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/iwd/iwd.mk | 2 ++
>  1 file changed, 2 insertions(+)

I've applied the entire series. However, your series was supposed to
have 15 patches, but the PATCH 15/15 never made it to the mailing list.
Is this expected ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
