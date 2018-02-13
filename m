From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:06:06 +0100
Subject: [Buildroot] [PATCH master] busybox: add upstream security fixes
In-Reply-To: <cf05d959586b416bbae83f437fd84e66b3243776.1518540701.git.baruch@tkos.co.il>
References: <cf05d959586b416bbae83f437fd84e66b3243776.1518540701.git.baruch@tkos.co.il>
Message-ID: <20180213220606.32589dfd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Feb 2018 18:51:41 +0200, Baruch Siach wrote:
> CVE-2017-15873: Integer overflow in decompress_bunzip2.c leads to a read
> access violation
> 
> CVE-2017-15874: Integer overflow in decompress_unlzma.c leads to a read
> access violation
> 
> Cc: Adam Duskett <aduskett@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
