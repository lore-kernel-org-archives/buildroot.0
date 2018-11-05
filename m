From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Nov 2018 09:17:24 +0100
Subject: [Buildroot] [PATCH v2] package/libnfs: bump to version 3.0.0
In-Reply-To: <20181105062705.20985-1-joerg.krause@embedded.rocks>
References: <20181105062705.20985-1-joerg.krause@embedded.rocks>
Message-ID: <20181105091724.4e542ff8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Nov 2018 07:27:05 +0100, J?rg Krause wrote:
> Also add an patch from upstream to fix building libnfs with the musl C
> library. This issue was introduced upstream between version 2.0.0 and
> version 3.0.0.
> 
> Note, that upstreams commit message says it fixes a warning. However, as
> musl is more strictly regarding missing headers it actually fixes the
> build with musl.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v1 -> v2:
>  - fix hash of license file COPYING

What are the changes in the COPYING file ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
