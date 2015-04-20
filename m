From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Apr 2015 23:00:01 +0200
Subject: [Buildroot] [PATCH v2] live555: fix library installation
In-Reply-To: <5535678B.7090506@mind.be>
References: <1429519351-8391-1-git-send-email-luca@lucaceresoli.net>
 <20150420113516.53c9199f@free-electrons.com>
 <5535678B.7090506@mind.be>
Message-ID: <20150420230001.216c0938@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, 20 Apr 2015 22:54:35 +0200, Arnout Vandecappelle wrote:

>  Don't really see the point... It defaults to y anyway, so only someone who
> explicitly disabled it in their config would care. But in that case, it won't
> even show up on the legacy screen. So actually, it's better _not_ to have legacy
> handling for this one IMHO.

Ah, indeed absolutely correct, I missed that. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
