From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:58:46 +0200
Subject: [Buildroot] [PATCH v1] package/collectd: needs host-bison
In-Reply-To: <07da742a-3473-5f30-140b-795386731f9e@mind.be>
References: <20191003152922.21881-1-ps.report@gmx.net>
 <20191005232144.4974bac8@windsurf.home>
 <20191006151851.739c4baf@gmx.net> <20191006152909.5113de2f@gmx.net>
 <07da742a-3473-5f30-140b-795386731f9e@mind.be>
Message-ID: <20191007225846.75e2f751@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 7 Oct 2019 22:55:11 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Given the following comment [3] I think it might be better to revert collectd
> to 5.9.0:
> 
> "All these issues are bugs, because release process done by another person than
> before. All that is done w/o explicit permission from project "owner", so
> results are expected."
> 
>  Or, of course, we can wait a bit to see if a proper 5.9.3 gets released...

Let's do a revert for now ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
