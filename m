From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 23:37:54 +0200
Subject: [Buildroot] [PATCH] configs/nitrogen*: bump u-boot revision
In-Reply-To: <20200422084956.646996-1-gary.bisson@boundarydevices.com>
References: <20200422084956.646996-1-gary.bisson@boundarydevices.com>
Message-ID: <20200423233754.7bf22ac6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Apr 2020 10:49:56 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Latest bump introduced a regression for Nitrogen8MM, now fixed.
> 
> Changelog:
> - Fix Nitrogen8MM SPL regression
> - Add multi-rank lpddr4 training support
> - Improve fastboot support
> - Add Android AVB / BCB support
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/517918160
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Sorry about this, our internal Jenkins server didn't send the email to
> tell us about that regression. Build server now fixed on our side so
> this shouldn't happen again.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
