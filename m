From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 11:10:59 +0200
Subject: [Buildroot] autobuilder flock hangs
In-Reply-To: <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
Message-ID: <20180816111059.3a7f1b59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Aug 2018 11:18:10 -0700, Hollis Blanchard wrote:

> flock was hanging. I don't know why; have you experienced anything like 
> that?
> 
> I deleted the directories and subsequent manual dl-wrapper invocations 
> succeeded, so I restarted the builder.

This happened again:

  http://autobuild.buildroot.net/results/ddb/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
