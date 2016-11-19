From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:51:59 +0100
Subject: [Buildroot] [PATCH v2 01/15] reproducibility: generate
 SOURCE_DATE_EPOCH
In-Reply-To: <d4388412-d390-fc7e-f6ba-685cb6a2104e@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-2-git-send-email-jezz@sysmic.org>
 <20161118123351.69e79602@free-electrons.com>
 <d4388412-d390-fc7e-f6ba-685cb6a2104e@mind.be>
Message-ID: <20161119105159.0c7aed4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Nov 2016 09:51:27 +0100, Arnout Vandecappelle wrote:

>  Or maybe even easier:
> 
> BR2_VERSION = 2016.11-rc1
> BR2_VERSION_EPOCH = 1479545409

Yes, this seems like a good idea. It's a bit annoying that we have to
update this, but it's the cleanest solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
