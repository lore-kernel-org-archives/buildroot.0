From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 20:14:58 +0100
Subject: [Buildroot] [PATCH] package/tn520: remove package
In-Reply-To: <20190205190110.13699-1-peter@korsgaard.com>
References: <20190205190110.13699-1-peter@korsgaard.com>
Message-ID: <20190205201458.08283110@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Typo in the commit title

On Tue,  5 Feb 2019 20:01:09 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> The latest (0.17.4) tn5250 release is from 2008, doesn't build with openssl
> 1.1.x and was dropped from Debian in 2011 because nobody cared to maintain
> it:
> 
> https://packages.qa.debian.org/t/tn5250.html
> 
> Given all of that, it is unlikely to be used much, so remove it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Otherwise:

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
