From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 14:46:49 +0100
Subject: [Buildroot] [PATCH 4/4] package/swupdate: bump version to git
 119173d1cfa061140a809cb7589fa1970fb3f44e.
In-Reply-To: <20200223091803.1007790-4-mc5686@mclink.it>
References: <20200223091803.1007790-1-mc5686@mclink.it>
 <20200223091803.1007790-4-mc5686@mclink.it>
Message-ID: <20200223144649.4a576dc4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 23 Feb 2020 10:18:03 +0100
Mauro Condarelli <mc5686@mclink.it> wrote:

> It has bugfixes for clering U-Boot variables (needs fixed libubootenv).
> Implements support for toolchains without locale.

Our current swupdate package does not depend on BR2_ENABLE_LOCALE, so
it already builds fine without locale I believe. Could you be more
specific about what is being fixed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
