From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:32:58 +0100
Subject: [Buildroot] [PATCH 02/10] support/scripts/cve-checker: parse
 arguments earlier
In-Reply-To: <20201104145145.1316167-3-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-3-thomas.petazzoni@bootlin.com>
Message-ID: <20201126163258.5bfcca71@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 15:51:36 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> This allows to have --help working, and the argument error checking
> before we read from stdin, and potentially block if we get nothing on
> stdin.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

cve-checker has been dropped from Buildroot now, so this patch no
longer makes sense. I've marked it as Not Applicable in patchwork.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
