From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Jul 2015 09:59:45 +0200
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
In-Reply-To: <55A832D4.9020801@mind.be>
References: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
 <55A832D4.9020801@mind.be>
Message-ID: <20150717095945.0fafbba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Fri, 17 Jul 2015 00:40:20 +0200, Arnout Vandecappelle wrote:

> > +choice
> > +	prompt "MMU Page Size"
> 
>  It is not really current policy, but wouldn't it make more sense to do
> 
> 	prompt "MMU Page Size" if BR2_arc770d || BR2_archs38

Why? In the patch submitted by Alexey, the 8K option is available for
all cores.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
