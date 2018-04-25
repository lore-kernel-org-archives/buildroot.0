From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:27:39 +0200
Subject: [Buildroot] EXTRA_DOWNLOADS broken when SITE_METHOD = git
In-Reply-To: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
References: <447cff1a-80c7-dde0-7991-6ecf530bdb1c@lucaceresoli.net>
Message-ID: <20180425212739.6f0fafbd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Apr 2018 10:56:05 +0200, Luca Ceresoli wrote:

> I noticed a problem with the EXTRA_DOWNLOADS for packages whose "main"
> download happens using git (most likely applies to other SCMs too).

Thanks for the report.

I think this illustrates (once again) that we desperately need some
tests for the download infrastructure. I'm adding Ricardo in Cc, who
already started working on such topic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
