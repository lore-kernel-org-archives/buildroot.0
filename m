From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Feb 2021 11:55:21 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: properly
 handle host packages with -c option
In-Reply-To: <87mtwonl2n.fsf@dell.be.48ers.dk>
References: <20210131214120.170C981562@busybox.osuosl.org>
 <87mtwonl2n.fsf@dell.be.48ers.dk>
Message-ID: <20210201115521.0cba330a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 01 Feb 2021 11:23:12 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  > +    return set([v["name"] for _, v in js.items()])  
> 
> If we don't care about the key at all, why not just use js.values()?

'cause I didn't know about <dict>.values() :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
