From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 22:42:59 +0200
Subject: [Buildroot] [PATCH/autobuild v2 6/7] autobuild-run: simplify,
 don't make a dict of config
In-Reply-To: <20170410220003.30421-6-arnout@mind.be>
References: <20170410220003.30421-1-arnout@mind.be>
 <20170410220003.30421-6-arnout@mind.be>
Message-ID: <20170412224259.2c201c0f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 00:00:02 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> -    configlines = config["contents"]
> +    configlines = config

So, using directly the variable named "config" in the remainder of this
function would be more logical, no?

(Note: as I said, I have already applied the patch, so further
improvements need to be done as follow-up patches)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
