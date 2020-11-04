From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Nov 2020 16:49:57 +0100
Subject: [Buildroot] [PATCH 10/10] package: provide CPE ID details for
 numerous packages
In-Reply-To: <20201104154258.g5i526s46tnlkamy@falbala.internal.home.lespocky.de>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-11-thomas.petazzoni@bootlin.com>
 <20201104154258.g5i526s46tnlkamy@falbala.internal.home.lespocky.de>
Message-ID: <20201104164957.7e60ef63@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

Thanks for taking a look at this series!

On Wed, 4 Nov 2020 16:42:59 +0100
Alexander Dahl <post@lespocky.de> wrote:

> > +EBTABLES_CVE_ID_VENDOR = netfilter  
> 
> Same here? CVE or CPE?
> 
> On all the other packages it is CPE, so maybe those two are just
> typos?

You are absolutely correct, those are typos. I'll do another pass on
this patch. Perhaps I should split it up into smaller chunks to make it
more manageable to review.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
