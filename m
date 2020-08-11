From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:33:39 +0200
Subject: [Buildroot] [PATCH v3 0/3] Use aiohttp in pkg-stats
In-Reply-To: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com>
References: <20200808180826.1007656-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200811223339.09519f38@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  8 Aug 2020 20:08:22 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Thomas Petazzoni (3):
>   support/scripts/pkg-stats: use aiohttp for latest version retrieval
>   support/scripts/pkg-stats: use aiohttp for upstream URL checking
>   support/scripts/pkg-stats: show progress of upstream URL and latest
>     version

Since this has gone through 3 iterations, and we really need this to
have pkg-stats continue to deliver results reliably, I have applied the
series. I've applied to both master and next.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
