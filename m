From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:03:07 +0100
Subject: [Buildroot] [PATCH v3] package/valijson: bump version to 0.2
In-Reply-To: <1573051682-29180-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1573051682-29180-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <20191107220307.0eb75ca6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Nov 2019 20:18:02 +0530
Santosh Multhalli <santosh.multhalli@rockwellcollins.com> wrote:

> - Added hash of LICENSE file in valijson.hash
> - Updated hash of valijson tar file in valijson.hash file
> - Added option to set tests off which drops the curlpp dependency
> 
> Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
> ----

This line should have been "---" (i.e 3 dashes) and not 4, for Git to
properly discard what's after this line when writing the commit log. I
fixed that up and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
